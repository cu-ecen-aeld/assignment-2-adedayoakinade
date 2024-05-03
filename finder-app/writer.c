// #include <stdio.h>
// #include <stdlib.h>
// #include <string.h>

// int main(int argc, char *argv[]) {
//     // Check if the correct number of arguments is provided
//     if (argc != 3) {
//         printf("Usage: %s <file_path> <string>\n", argv[0]);
//         return 1;
//     }

//     // Get the file path and string from command line arguments
//     char *file_path = argv[1];
//     char *string = argv[2];

//     // Open the file for writing
//     FILE *file = fopen(file_path, "w");

//     // Check if the file was opened successfully
//     if (file == NULL) {
//         printf("Error: Unable to open file '%s'\n", file_path);
//         return 1;
//     }

//     // Write the string to the file
//     fprintf(file, "%s", string);

//     // Close the file
//     fclose(file);

//     printf("String written to file '%s' successfully.\n", file_path);

//     return 0;
// }

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <syslog.h>

int main(int argc, char *argv[]) {
    // Open the syslog connection
    openlog("write_string", LOG_PID | LOG_CONS, LOG_USER);

    // Check if the correct number of arguments is provided
    if (argc != 3) {
        syslog(LOG_ERR, "Usage: %s <file_path> <string>", argv[0]);
        return 1;
    }

    // Get the file path and string from command line arguments
    char *file_path = argv[1];
    char *write_string = argv[2];

    syslog(LOG_DEBUG, "Writing %s to %s", write_string, file_path);


    // Open the file for writing
    FILE *file = fopen(file_path, "w");

    // Check if the file was opened successfully
    if (file == NULL) {
        syslog(LOG_ERR, "Error: Unable to open file '%s'", file_path);
        return 1;
    }

    // Write the string to the file
    fprintf(file, "%s\n", write_string);

    // Close the file
    fclose(file);

    // Close the syslog connection
    closelog();

    return 0;
}