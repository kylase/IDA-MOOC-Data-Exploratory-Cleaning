library(tools)

str1_md5 = md5sum(file.path(getwd(), 'str1.txt'))
str2_md5 = md5sum(file.path(getwd(), 'str2.txt'))

# Check if hashes are the same
str1_md5 == str2_md5
