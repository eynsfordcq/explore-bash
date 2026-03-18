echo "Listing valid directory"
ls -l /etc
echo $?

echo "\nListing non existent directory"
ls -l /nonexistent_directory
echo $?

echo "\nCustom error codes"

if [ -d "/etc" ]
then
    echo "The directory exists."
    exit 0
else
    echo "The directory doesn't exist."
    exit 199 # Custom error code
fi