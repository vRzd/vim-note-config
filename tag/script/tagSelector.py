import os
import re

def selectFrom(vault, tagsFile):
    with open(os.path.expanduser(tagsFile), 'a') as f:
        for root, dirs, files in os.walk(vault):
            for file in files:
                if file.endswith('.txt'):
                    fullFilePath = os.path.join(root, file)
                    with open(fullFilePath, 'r') as currentFile:
                        count = 0
                        tagsInCurrentFile = []
                        for line in currentFile:
                            count += 1
                            tagsInCurrentLine = re.findall(r'\#\w+', line)
                            tagsInCurrentFile.extend(tagsInCurrentLine)
                        if tagsInCurrentFile:
                            for currentTag in tagsInCurrentFile:
                                f.write('{}\t{}\t:{}\n'.format(currentTag, fullFilePath, count))

