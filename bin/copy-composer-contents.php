<?php
$buildDir = getenv('BUILD_DIR');

$orgComposerContent = json_decode(file_get_contents("$buildDir/composer.json"), true);

$stuffToCopy = ['repositories', 'config'];
$parts = [];
foreach ($stuffToCopy as $key) {
    $parts[$key] = $orgComposerContent[$key] ?: [];
}

$newComposerContent = json_decode(file_get_contents('composer.json'), true);
$newComposerContent = array_replace_recursive($newComposerContent, $parts);

file_put_contents('composer.json', json_encode($newComposerContent, JSON_PRETTY_PRINT));
