/* Output the number of ints, floats, bools, or strings asked to */
#include <stdio.h>
#include <stdlib.h>

int main (int argc, char *argv[])
{
  static const char my_text[] =  "1234 ";
  if (argc > 2)
  {
    int count = atoi(argv[1]);
    char *string = argv[2];
    for (int c = 0; c < count; c++)
    {
      fwrite(my_text, 1, 5, stdout);
    }
  }
  else
  {
      printf("Syntax: testc number (bool | float | int | string)\n");
  }
  return 0;
}

