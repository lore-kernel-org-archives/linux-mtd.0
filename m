Received: from elasmtp-banded.atl.sa.earthlink.net ([209.86.89.70])
	by pentafluge.infradead.org with esmtp (Exim 4.61 #1 (Red Hat Linux))
	id 1FayFZ-0001jN-1Q
	for linux-mtd@lists.infradead.org; Tue, 02 May 2006 18:01:26 +0100
Received: from [209.86.224.44] (helo=elwamui-ovcar.atl.sa.earthlink.net)
	by elasmtp-banded.atl.sa.earthlink.net with asmtp (Exim 4.34)
	id 1FayF1-0004Cx-1y
	for linux-mtd@lists.infradead.org; Tue, 02 May 2006 13:00:51 -0400
Message-ID: <7384790.1146589251003.JavaMail.root@elwamui-ovcar.atl.sa.earthlink.net>
Date: Tue, 2 May 2006 13:00:50 -0400 (EDT)
From: Steve Finney <saf76@earthlink.net>
To: linux-mtd@lists.infradead.org
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Subject: [PATCH 3/3] MTD Utils. Add minimal usage message to flash_erase
Reply-To: Steve Finney <saf76@earthlink.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Better than nothing...

Signed-off-by: Steven Finney <sfinney@healthhero.com>

-----------------
--- util.orig/flash_erase.c     2006-05-02 07:52:41.608872384 -0700
+++ util/flash_erase.c  2006-05-02 09:37:02.336097176 -0700
@@ -7,6 +7,7 @@
 #include <stdio.h>
 #include <fcntl.h>
 #include <time.h>
+#include <string.h>
 #include <sys/ioctl.h>
 #include <sys/mount.h>
 #include <mtd/mtd-user.h>
@@ -146,6 +147,11 @@ int main(int argc,char *argv[])
                fprintf(stderr,"You must specify a device\n");
                return 16;
        }
+       if ( !strcmp(argv[1], "-h") || !strcmp (argv[1], "--help") ) {
+               printf("Usage: flash_erase MTD-device [start] [cnt (# erase blocks)] [lock]\n"
+                      "       flash_erase -h | --help\n") ;
+               exit (0);
+       }

        if (argc > 2)
                start = strtol(argv[2], NULL, 0);
