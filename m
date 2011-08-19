Received: from mail-gy0-f177.google.com ([209.85.160.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QuSZ7-0003iS-8U
	for linux-mtd@lists.infradead.org; Fri, 19 Aug 2011 17:09:07 +0000
Received: by gyh20 with SMTP id 20so2660292gyh.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 19 Aug 2011 10:09:02 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH 05/10] nandwrite: remove `autoplace' features
Date: Fri, 19 Aug 2011 10:07:51 -0700
Message-Id: <1313773676-12879-6-git-send-email-computersforpeace@gmail.com>
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

The `autoplace' option was meant to force an MTD_OOB_AUTO layout while
writing to flash. This option has not been properly supported for a very
long time, as the necessary ioctl, MEMSETOOBSEL, has been removed.
Apparently nobody uses this option. Kill it.

Other code depends on the availability of the `old_oobinfo' data, so we
move some code within a block that handles autoplacement if it's
*already* enabled. This, however, is inconsistent and should be cleaned
up shortly.

Note: this option may be re-implemented in the near future with the
addition of a new ioctl that allows on-the-fly chaning of MTD OOB modes.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 nandwrite.c |   43 +++++++++----------------------------------
 1 files changed, 9 insertions(+), 34 deletions(-)

diff --git a/nandwrite.c b/nandwrite.c
index f58bbfa..2700975 100644
--- a/nandwrite.c
+++ b/nandwrite.c
@@ -60,17 +60,12 @@ static struct nand_oobinfo yaffs_oobinfo = {
 	.eccpos = { 8, 9, 10, 13, 14, 15}
 };
 
-static struct nand_oobinfo autoplace_oobinfo = {
-	.useecc = MTD_NANDECC_AUTOPLACE
-};
-
 static void display_help(void)
 {
 	printf(
 "Usage: nandwrite [OPTION] MTD_DEVICE [INPUTFILE|-]\n"
 "Writes to the specified MTD device.\n"
 "\n"
-"  -a, --autoplace         Use auto oob layout\n"
 "  -j, --jffs2             Force jffs2 oob layout (legacy support)\n"
 "  -y, --yaffs             Force yaffs oob layout (legacy support)\n"
 "  -f, --forcelegacy       Force legacy support on autoplacement-enabled mtd\n"
@@ -114,7 +109,6 @@ static bool		quiet = false;
 static bool		writeoob = false;
 static bool		rawoob = false;
 static bool		onlyoob = false;
-static bool		autoplace = false;
 static bool		markbad = false;
 static bool		forcejffs2 = false;
 static bool		forceyaffs = false;
@@ -130,11 +124,10 @@ static void process_options(int argc, char * const argv[])
 
 	for (;;) {
 		int option_index = 0;
-		static const char *short_options = "ab:fjmnNoOpqrs:y";
+		static const char *short_options = "b:fjmnNoOpqrs:y";
 		static const struct option long_options[] = {
 			{"help", no_argument, 0, 0},
 			{"version", no_argument, 0, 0},
-			{"autoplace", no_argument, 0, 'a'},
 			{"blockalign", required_argument, 0, 'b'},
 			{"forcelegacy", no_argument, 0, 'f'},
 			{"jffs2", no_argument, 0, 'j'},
@@ -171,9 +164,6 @@ static void process_options(int argc, char * const argv[])
 			case 'q':
 				quiet = true;
 				break;
-			case 'a':
-				autoplace = true;
-				break;
 			case 'j':
 				forcejffs2 = true;
 				break;
@@ -321,25 +311,6 @@ int main(int argc, char * const argv[])
 		exit(EXIT_FAILURE);
 	}
 
-	if (autoplace) {
-		/* Read the current oob info */
-		if (ioctl(fd, MEMGETOOBSEL, &old_oobinfo) != 0) {
-			perror("MEMGETOOBSEL");
-			close(fd);
-			exit(EXIT_FAILURE);
-		}
-
-		// autoplace ECC ?
-		if (old_oobinfo.useecc != MTD_NANDECC_AUTOPLACE) {
-			if (ioctl(fd, MEMSETOOBSEL, &autoplace_oobinfo) != 0) {
-				perror("MEMSETOOBSEL");
-				close(fd);
-				exit(EXIT_FAILURE);
-			}
-			oobinfochanged = 1;
-		}
-	}
-
 	if (noecc)  {
 		ret = ioctl(fd, MTDFILEMODE, MTD_MODE_RAW);
 		if (ret == 0) {
@@ -374,10 +345,6 @@ int main(int argc, char * const argv[])
 	if (forcejffs2 || forceyaffs) {
 		struct nand_oobinfo *oobsel = forcejffs2 ? &jffs2_oobinfo : &yaffs_oobinfo;
 
-		if (autoplace) {
-			fprintf(stderr, "Autoplacement is not possible for legacy -j/-y options\n");
-			goto restoreoob;
-		}
 		if ((old_oobinfo.useecc == MTD_NANDECC_AUTOPLACE) && !forcelegacy) {
 			fprintf(stderr, "Use -f option to enforce legacy placement on autoplacement enabled mtd device\n");
 			goto restoreoob;
@@ -608,6 +575,14 @@ int main(int argc, char * const argv[])
 			if (!noecc) {
 				int i, start, len;
 				int tags_pos = 0;
+
+				/* Read the current oob info */
+				if (ioctl(fd, MEMGETOOBSEL, &old_oobinfo) != 0) {
+					perror("MEMGETOOBSEL");
+					close(fd);
+					exit(EXIT_FAILURE);
+				}
+
 				/*
 				 * We use autoplacement and have the oobinfo with the autoplacement
 				 * information from the kernel available
-- 
1.7.6
