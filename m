Received: from bs1.dnx.de ([213.252.143.130] ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 175lx9-0007Pw-00
	for <linux-mtd@lists.infradead.org>; Thu, 09 May 2002 12:19:19 +0100
Received: from p50861b37.dip.t-dialin.net ([80.134.27.55] helo=callisto.pengutronix.de)
	by bs1.dnx.de with asmtp (Exim 3.34 #1)
	id 175lx8-0004nP-00
	for linux-mtd@lists.infradead.org; Thu, 09 May 2002 13:19:18 +0200
Date: Thu, 9 May 2002 13:18:53 +0200
From: Robert Schwebel <robert@schwebel.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] fix for some warnings
Message-ID: <20020509131853.P15258@schwebel.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="FL5UXtIhxfXey3p5"
Content-Disposition: inline
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

--FL5UXtIhxfXey3p5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi, 

this patch fixes some warnings in the utils directory. 

Robert
-- 
 +--------------------------------------------------------+
 | Dipl.-Ing. Robert Schwebel | http://www.pengutronix.de |
 | Pengutronix - Linux Solutions for Science and Industry |
 |   Braunschweiger Str. 79,  31134 Hildesheim, Germany   |
 |    Phone: +49-5121-28619-0 |  Fax: +49-5121-28619-4    |
 +--------------------------------------------------------+

--FL5UXtIhxfXey3p5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="mtd-utils-20020509.1"

diff --exclude=CVS -urN mtd-orig/util/erase.c mtd/util/erase.c
--- mtd-orig/util/erase.c	Tue Mar 27 14:01:29 2001
+++ mtd/util/erase.c	Thu May  9 12:37:39 2002
@@ -63,7 +63,7 @@
 			}
 		}
 		printf("\rPerforming Flash Erase of length %lu at offset 0x%lx",
-				erase.length, erase.start);
+				(unsigned long)erase.length, (long)erase.start);
 		fflush(stdout);
 		if(ioctl(Fd, MEMERASE, &erase) != 0)
 		{
@@ -97,17 +97,17 @@
 		erase.start = start;
 
 		erase.length = meminfo.erasesize;
-		printf("Erase Unit Size 0x%lx, ", meminfo.erasesize);
+		printf("Erase Unit Size 0x%lx, ", (long)meminfo.erasesize);
 
 		for (; count > 0; count--) {
 			printf("\rPerforming Flash Erase of length %lu at offset 0x%lx",
-					erase.length, erase.start);
+					(unsigned long)erase.length, (long)erase.start);
 			fflush(stdout);
 
 			if(unlock != 0)
 			{
 				//Unlock the sector first.
-				printf("\rPerforming Flash unlock at offset 0x%lx",erase.start);
+				printf("\rPerforming Flash unlock at offset 0x%lx",(long)erase.start);
 				if(ioctl(Fd, MEMUNLOCK, &erase) != 0)
 				{
 					perror("\nMTD Unlock failure");
diff --exclude=CVS -urN mtd-orig/util/eraseall.c mtd/util/eraseall.c
--- mtd-orig/util/eraseall.c	Wed Apr 25 09:11:19 2001
+++ mtd/util/eraseall.c	Thu May  9 12:40:10 2002
@@ -69,8 +69,8 @@
        
        if( !quiet ) {
 	   printf( "\rErasing %ld Kibyte @ %lx -- %2ld %% complete.", 
-		   meminfo.erasesize/1024, erase.start,
-		   erase.start*100/meminfo.size );
+		   (long)meminfo.erasesize/1024, (long)erase.start,
+		   (long)(erase.start*100/meminfo.size));
        }
        fflush( stdout );
 	
@@ -83,7 +83,7 @@
    }
    if( !quiet ) {
        printf( "\rErased %ld Kibyte @ %lx -- 100%% complete.       \n",
-	       meminfo.size/1024, 0L );
+	       (long)(meminfo.size/1024), 0L );
    }
    
    return 0;
diff --exclude=CVS -urN mtd-orig/util/ftl_format.c mtd/util/ftl_format.c
--- mtd-orig/util/ftl_format.c	Thu May 18 18:04:56 2000
+++ mtd/util/ftl_format.c	Thu May  9 12:43:55 2002
@@ -43,7 +43,7 @@
 #include <unistd.h>
 #include <fcntl.h>
 #include <errno.h>
-#include <sys/time.h>
+#include <time.h>
 #include <sys/ioctl.h>
 #include <sys/stat.h>
 
diff --exclude=CVS -urN mtd-orig/util/nandtest.c mtd/util/nandtest.c
--- mtd-orig/util/nandtest.c	Mon Oct 23 19:42:43 2000
+++ mtd/util/nandtest.c	Thu May  9 12:41:10 2002
@@ -102,7 +102,7 @@
 	erase.start = 0;
 
 	printf("\nPerforming Flash Erase of length %lu at offset %lu...\n",
-		erase.length, erase.start);
+		(unsigned long)erase.length, (unsigned long)erase.start);
 	fflush(stdout);
 
 	if(ioctl(fd, MEMERASE, &erase) != 0) {
@@ -250,7 +250,7 @@
 	erase.start = 0;
 
 	printf("\nPerforming Flash Erase of length %lu at offset %lu...\n",
-		erase.length, erase.start);
+		(unsigned long)erase.length, (unsigned long)erase.start);
 	fflush(stdout);
 
 	if(ioctl(fd, MEMERASE, &erase) != 0) {

--FL5UXtIhxfXey3p5--
