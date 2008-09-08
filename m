Received: from relay00.pair.com ([209.68.5.9])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KcYN7-0002Vc-Ku
	for linux-mtd@lists.infradead.org; Mon, 08 Sep 2008 04:29:05 +0000
From: Grant Erickson <gerickson@nuovations.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 4/6] [MTD-UTILS] nandwrite: Use Boolean Mnemonics from
	stdbool.h
Date: Sun,  7 Sep 2008 21:29:03 -0700
Message-Id: <1220848143-22348-1-git-send-email-gerickson@nuovations.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Added include directive for stdbool.h and leveraged where appropriate
to improve code readability by making variable intent and usage more
explicit.

Signed-off-by: Grant Erickson <gerickson@nuovations.com>
---
 nandwrite.c |   46 ++++++++++++++++++++++++----------------------
 1 files changed, 24 insertions(+), 22 deletions(-)

diff --git a/nandwrite.c b/nandwrite.c
index e5de140..5fbed41 100644
--- a/nandwrite.c
+++ b/nandwrite.c
@@ -23,6 +23,7 @@
 #include <ctype.h>
 #include <errno.h>
 #include <fcntl.h>
+#include <stdbool.h>
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
@@ -108,15 +109,15 @@ static void display_version (void)
 
 static const char	*mtd_device, *img;
 static int		mtdoffset = 0;
-static int		quiet = 0;
-static int		writeoob = 0;
-static int		markbad = 0;
-static int		autoplace = 0;
-static int		forcejffs2 = 0;
-static int		forceyaffs = 0;
-static int		forcelegacy = 0;
-static int		noecc = 0;
-static int		pad = 0;
+static bool		quiet = false;
+static bool		writeoob = false;
+static bool		autoplace = false;
+static bool		markbad = false;
+static bool		forcejffs2 = false;
+static bool		forceyaffs = false;
+static bool		forcelegacy = false;
+static bool		noecc = false;
+static bool		pad = false;
 static int		blockalign = 1; /*default to using 16K block size */
 
 static void process_options (int argc, char * const argv[])
@@ -161,31 +162,31 @@ static void process_options (int argc, char * const argv[])
 				}
 				break;
 			case 'q':
-				quiet = 1;
+				quiet = true;
 				break;
 			case 'a':
-				autoplace = 1;
+				autoplace = true;
 				break;
 			case 'j':
-				forcejffs2 = 1;
+				forcejffs2 = true;
 				break;
 			case 'y':
-				forceyaffs = 1;
+				forceyaffs = true;
 				break;
 			case 'f':
-				forcelegacy = 1;
+				forcelegacy = true;
 				break;
 			case 'n':
-				noecc = 1;
+				noecc = true;
 				break;
 			case 'm':
-				markbad = 1;
+				markbad = true;
 				break;
 			case 'o':
-				writeoob = 1;
+				writeoob = true;
 				break;
 			case 'p':
-				pad = 1;
+				pad = true;
 				break;
 			case 's':
 				mtdoffset = strtol (optarg, NULL, 0);
@@ -211,7 +212,8 @@ static void process_options (int argc, char * const argv[])
  */
 int main(int argc, char * const argv[])
 {
-	int cnt, fd, ifd, imglen = 0, pagelen, baderaseblock, blockstart = -1;
+	int cnt, fd, ifd, imglen = 0, pagelen, blockstart = -1;
+	bool baderaseblock = false;
 	struct mtd_info_user meminfo;
 	struct mtd_oob_buf oob;
 	loff_t offs;
@@ -345,7 +347,7 @@ int main(int argc, char * const argv[])
 	imglen = lseek(ifd, 0, SEEK_END);
 	lseek (ifd, 0, SEEK_SET);
 
-	pagelen = meminfo.writesize + ((writeoob == 1) ? meminfo.oobsize : 0);
+	pagelen = meminfo.writesize + ((writeoob) ? meminfo.oobsize : 0);
 
 	// Check, if file is pagealigned
 	if ((!pad) && ((imglen % pagelen) != 0)) {
@@ -372,7 +374,7 @@ int main(int argc, char * const argv[])
 		while (blockstart != (mtdoffset & (~meminfo.erasesize + 1))) {
 			blockstart = mtdoffset & (~meminfo.erasesize + 1);
 			offs = blockstart;
-			baderaseblock = 0;
+			baderaseblock = false;
 			if (!quiet)
 				fprintf (stdout, "Writing data to block %x\n", blockstart);
 
@@ -383,7 +385,7 @@ int main(int argc, char * const argv[])
 					goto closeall;
 				}
 				if (ret == 1) {
-					baderaseblock = 1;
+					baderaseblock = true;
 					if (!quiet)
 						fprintf (stderr, "Bad block at %x, %u block(s) "
 								"from %x will be skipped\n",
-- 
1.6.0.1
