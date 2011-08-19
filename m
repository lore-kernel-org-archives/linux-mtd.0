Received: from mail-pz0-f41.google.com ([209.85.210.41])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QuSZ9-0003fN-H7
	for linux-mtd@lists.infradead.org; Fri, 19 Aug 2011 17:09:10 +0000
Received: by mail-pz0-f41.google.com with SMTP id 4so7209431pzk.28
	for <linux-mtd@lists.infradead.org>;
	Fri, 19 Aug 2011 10:09:07 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH 07/10] nandwrite: kill -j, -y, and -f options
Date: Fri, 19 Aug 2011 10:07:53 -0700
Message-Id: <1313773676-12879-8-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1313773676-12879-1-git-send-email-computersforpeace@gmail.com>
References: <1313773676-12879-1-git-send-email-computersforpeace@gmail.com>
Cc: Kevin Cernekee <cernekee@gmail.com>,
	Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
	Mike Frysinger <vapier.adi@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The legacy -j (--jffs2) and -y (--yaffs) options haven't been
operational for a long time, since MEMSETOOBSEL was killed. I don't
think anybody will miss these options (correct me if I'm wrong). They
can be replaced by proper usage of MTD_OOB_AUTO modes.

The -f (--forcelegacy) option went hand in hand with -j and -y. Now that
-j and -y are gone, there's no use for -f. Kill it.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 nandwrite.c |   60 +----------------------------------------------------------
 1 files changed, 1 insertions(+), 59 deletions(-)

diff --git a/nandwrite.c b/nandwrite.c
index 22e9b7f..a0f2596 100644
--- a/nandwrite.c
+++ b/nandwrite.c
@@ -43,29 +43,12 @@
 #include "common.h"
 #include <libmtd.h>
 
-// oob layouts to pass into the kernel as default
-static struct nand_oobinfo jffs2_oobinfo = {
-	.useecc = MTD_NANDECC_PLACE,
-	.eccbytes = 6,
-	.eccpos = { 0, 1, 2, 3, 6, 7 }
-};
-
-static struct nand_oobinfo yaffs_oobinfo = {
-	.useecc = MTD_NANDECC_PLACE,
-	.eccbytes = 6,
-	.eccpos = { 8, 9, 10, 13, 14, 15}
-};
-
 static void display_help(void)
 {
 	printf(
 "Usage: nandwrite [OPTION] MTD_DEVICE [INPUTFILE|-]\n"
 "Writes to the specified MTD device.\n"
 "\n"
-"  -j, --jffs2             Force jffs2 oob layout (legacy support)\n"
-"  -y, --yaffs             Force yaffs oob layout (legacy support)\n"
-"  -f, --forcelegacy       Force legacy support on autoplacement-enabled mtd\n"
-"                          device\n"
 "  -m, --markbad           Mark blocks bad if write fails\n"
 "  -n, --noecc             Write without ecc\n"
 "  -N, --noskipbad         Write without bad block skipping\n"
@@ -106,9 +89,6 @@ static bool		writeoob = false;
 static bool		rawoob = false;
 static bool		onlyoob = false;
 static bool		markbad = false;
-static bool		forcejffs2 = false;
-static bool		forceyaffs = false;
-static bool		forcelegacy = false;
 static bool		noecc = false;
 static bool		noskipbad = false;
 static bool		pad = false;
@@ -120,13 +100,11 @@ static void process_options(int argc, char * const argv[])
 
 	for (;;) {
 		int option_index = 0;
-		static const char *short_options = "b:fjmnNoOpqrs:y";
+		static const char *short_options = "b:mnNoOpqrs:";
 		static const struct option long_options[] = {
 			{"help", no_argument, 0, 0},
 			{"version", no_argument, 0, 0},
 			{"blockalign", required_argument, 0, 'b'},
-			{"forcelegacy", no_argument, 0, 'f'},
-			{"jffs2", no_argument, 0, 'j'},
 			{"markbad", no_argument, 0, 'm'},
 			{"noecc", no_argument, 0, 'n'},
 			{"noskipbad", no_argument, 0, 'N'},
@@ -136,7 +114,6 @@ static void process_options(int argc, char * const argv[])
 			{"quiet", no_argument, 0, 'q'},
 			{"raw", no_argument, 0, 'r'},
 			{"start", required_argument, 0, 's'},
-			{"yaffs", no_argument, 0, 'y'},
 			{0, 0, 0, 0},
 		};
 
@@ -160,15 +137,6 @@ static void process_options(int argc, char * const argv[])
 			case 'q':
 				quiet = true;
 				break;
-			case 'j':
-				forcejffs2 = true;
-				break;
-			case 'y':
-				forceyaffs = true;
-				break;
-			case 'f':
-				forcelegacy = true;
-				break;
 			case 'n':
 				noecc = true;
 				break;
@@ -323,32 +291,6 @@ int main(int argc, char * const argv[])
 		}
 	}
 
-	/*
-	 * force oob layout for jffs2 or yaffs ?
-	 * Legacy support
-	 */
-	if (forcejffs2 || forceyaffs) {
-		struct nand_oobinfo *oobsel = forcejffs2 ? &jffs2_oobinfo : &yaffs_oobinfo;
-
-		if ((old_oobinfo.useecc == MTD_NANDECC_AUTOPLACE) && !forcelegacy) {
-			fprintf(stderr, "Use -f option to enforce legacy placement on autoplacement enabled mtd device\n");
-			goto restoreoob;
-		}
-		if (mtd.oob_size == 8) {
-			if (forceyaffs) {
-				fprintf(stderr, "YAFSS cannot operate on 256 Byte page size");
-				goto restoreoob;
-			}
-			/* Adjust number of ecc bytes */
-			jffs2_oobinfo.eccbytes = 3;
-		}
-
-		if (ioctl(fd, MEMSETOOBSEL, oobsel) != 0) {
-			perror("MEMSETOOBSEL");
-			goto restoreoob;
-		}
-	}
-
 	/* Determine if we are reading from standard input or from a file. */
 	if (strcmp(img, standard_input) == 0) {
 		ifd = STDIN_FILENO;
-- 
1.7.6
