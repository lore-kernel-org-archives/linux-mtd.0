Received: from elasmtp-junco.atl.sa.earthlink.net ([209.86.89.63])
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FeJj5-0002bu-V1
	for linux-mtd@lists.infradead.org; Thu, 11 May 2006 23:33:45 +0100
Received: from [209.86.224.34] (helo=elwamui-hound.atl.sa.earthlink.net)
	by elasmtp-junco.atl.sa.earthlink.net with asmtp (Exim 4.34)
	id 1FeJia-0007pD-Me
	for linux-mtd@lists.infradead.org; Thu, 11 May 2006 18:33:12 -0400
Message-ID: <9639100.1147386792549.JavaMail.root@elwamui-hound.atl.sa.earthlink.net>
Date: Thu, 11 May 2006 15:33:12 -0700 (GMT-07:00)
From: Steve Finney <saf76@earthlink.net>
To: linux-mtd@lists.infradead.org
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_Part_13258_18847491.1147386792222"
Subject: [PATCH 1/3] MTD Utils.  (Resubmit as attachment)
Reply-To: Steve Finney <saf76@earthlink.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

------=_Part_13258_18847491.1147386792222
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Add a basic usage message to flash_erase.c.

Signed-off-by: Steven Finney <sfinney@healthhero.com>

------=_Part_13258_18847491.1147386792222
Content-Disposition: attachment; filename="patch.flash_erase"
Content-Type: application/octet-stream; name=patch.flash_erase
Content-Transfer-Encoding: 7bit

Add a basic usage message to flash_erase.c.

Signed-off-by: Steven Finney <sfinney@healthhero.com>

----------------------------

--- util.orig/flash_erase.c	2006-05-02 07:52:41.000000000 -0700
+++ util/flash_erase.c	2006-05-10 14:08:09.307564448 -0700
@@ -7,6 +7,7 @@
 #include <stdio.h>
 #include <fcntl.h>
 #include <time.h>
+#include <string.h>
 #include <sys/ioctl.h>
 #include <sys/mount.h>
 #include <mtd/mtd-user.h>
@@ -141,10 +142,10 @@ int main(int argc,char *argv[])
 	int unlock;
 	int res = 0;
 
-	if (1 >= argc)
-	{
-		fprintf(stderr,"You must specify a device\n");
-		return 16;
+	if (1 >= argc ||  !strcmp(argv[1], "-h") || !strcmp (argv[1], "--help") ) {
+		printf("Usage: flash_erase MTD-device [start] [cnt (# erase blocks)] [lock]\n"
+		       "       flash_erase -h | --help\n") ;
+		return 16 ;
 	}
 
 	if (argc > 2)

------=_Part_13258_18847491.1147386792222--
