import {readFileSync, writeFileSync} from 'fs';
import * as ts from "typescript";
import {decodeEmptyLines, encodeEmptyLines, addLeadingEmptyLineMarker} from 'ts-empty-line-encoder';

var args = process.argv.slice(2);

const sourceFilename = args[0]; //'samples/index.js';
const targetFilename = args[1];

const sourceText = readFileSync(sourceFilename).toString();
const encodedSourceText = encodeEmptyLines(sourceText);


const sourceFile = ts.createSourceFile(
    sourceFilename,
    encodedSourceText,
    ts.ScriptTarget.ES2015
  );

const lastImportIndex =  sourceFile.statements.reduce((r,statement, i)=> statement.kind == ts.SyntaxKind.ImportDeclaration ? i + 1 : r, 0);

const newImport =     
  ts.createImportDeclaration(
    undefined,
    undefined,
    ts.createImportClause(
      undefined,
      ts.createNamespaceImport(ts.createIdentifier("serviceWorker"))
    ),
    ts.createStringLiteral("./serviceWorker")
  );

const unregisterStatement = 
ts.addSyntheticLeadingComment(
ts.addSyntheticLeadingComment(
 addLeadingEmptyLineMarker(
  ts.createExpressionStatement(ts.createCall(
    ts.createPropertyAccess(
      ts.createIdentifier("serviceWorker"),
      ts.createIdentifier("unregister")
    ),
    undefined,
    []
  ))),  
  ts.SyntaxKind.SingleLineCommentTrivia,
  'If you want your app to work offline and load faster, you can change unregister() to register() below. Note this comes with some pitfalls.'
 ),
 ts.SyntaxKind.SingleLineCommentTrivia,
  'Learn more about service workers: http://bit.ly/CRA-PWA'

);
  


const statements = sourceFile.statements.slice(0, lastImportIndex - 1)
  .concat(newImport)
  .concat(sourceFile.statements.slice(lastImportIndex)
    .filter(statement => !(statement.kind == ts.SyntaxKind.ExpressionStatement 
        && (statement as ts.ExpressionStatement).expression.kind == ts.SyntaxKind.CallExpression 
        && ((statement as ts.ExpressionStatement).expression as ts.CallExpression).expression.kind == ts.SyntaxKind.Identifier
        && (((statement as ts.ExpressionStatement).expression as ts.CallExpression).expression as ts.Identifier).text == 'registerServiceWorker'
      )
    )
  )
  .concat(unregisterStatement);

var resultFile = ts.updateSourceFileNode(sourceFile, statements);

var resultText = ts.createPrinter().printNode(ts.EmitHint.Unspecified, resultFile, sourceFile);
var decodedResultText = decodeEmptyLines(resultText);

//console.log(decodedResultText);
writeFileSync(targetFilename, decodedResultText);

