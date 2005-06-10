Received: from venus.beamex.com ([194.211.12.66])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Dgedt-000574-Sf
	for linux-mtd@lists.infradead.org; Fri, 10 Jun 2005 04:13:37 -0400
From: Caj Nordstrom <caj.nordstrom@beamex.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Date: Fri, 10 Jun 2005 11:16:37 +0300
Message-Id: <1118391398.12760.3.camel@cen_linux.beamex.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: JFFS2 space behavior when adding data to a file
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi
I have found a strange behavior for space usage when adding small data
to an existing file. In my test I have used Intel/STM Nor flash with
several mtd versions and currently mtd-snapshot-20050516.tar.bz2. The
processor environment is arm7.

The problem is that far too much space is used when adding data a little
at a time to a file. In my tests done with the included test program the
results are the following when df shows around 1.4M free space at start.

115k in each file for WITH_FLUSH or WITH_OPEN_CLOSE enabled
350k in each file without the options.

When coping directly the 115k file there are space for 162 files!!!!
Totally around 18M data compared to 575k WITH_FLUSH.


Is this a known feature or bug?

Regards
Caj


Test program
_____________________________________________________________

#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <termios.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <poll.h>
#include <time.h>

int main(int argc, char *argv[])
{
   time_t now = time(NULL);
   
   FILE * testfile1 = fopen("testfile1", "a");
   fprintf(testfile1, "Test started at %s\n", ctime(&now));

   FILE * testfile2 = fopen("testfile2", "a");
   fprintf(testfile2, "Test started at %s\n", ctime(&now));

   FILE * testfile3 = fopen("testfile3", "a");
   fprintf(testfile3, "Test started at %s\n", ctime(&now));
   
   FILE * testfile4 = fopen("testfile4", "a");
   fprintf(testfile4, "Test started at %s\n", ctime(&now));
   
   FILE * testfile5 = fopen("testfile5", "a");
   fprintf(testfile5, "Test started at %s\n", ctime(&now));
   while(1)
   {
#ifdef WITH_FLUSH
        fflush(testfile1);
        fflush(testfile2);
        fflush(testfile3);
        fflush(testfile4);
        fflush(testfile5);
#endif        
        time_t now = time(NULL);
        fprintf(testfile1, "Test goes on at %s\n", ctime(&now));
        fprintf(testfile2, "Test goes on at %s\n", ctime(&now));
        fprintf(testfile3, "Test goes on at %s\n", ctime(&now));
        fprintf(testfile4, "Test goes on at %s\n", ctime(&now));
        fprintf(testfile5, "Test goes on at %s\n", ctime(&now));
        usleep(300000);
        
#ifdef WITH_OPEN_CLOSE        
        fclose(testfile1);
        fclose(testfile2);
        fclose(testfile3);
        fclose(testfile4);
        fclose(testfile5);
        usleep(30000);
        
        testfile1 = fopen("testfile1", "a");
        testfile2 = fopen("testfile2", "a");
        testfile3 = fopen("testfile3", "a");
        testfile4 = fopen("testfile4", "a");
        testfile5 = fopen("testfile5", "a");
#endif
   }
}
