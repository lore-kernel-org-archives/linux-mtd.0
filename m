Received: from dakia2.marvell.com ([65.219.4.35])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PwWzh-0007qf-0Q
	for linux-mtd@lists.infradead.org; Mon, 07 Mar 2011 09:44:50 +0000
Received: from maili.marvell.com (maili.marvell.com [10.68.76.51]) by
	dakia2.marvell.com with ESMTP id vP00bDHeU42eUFcK for
	<linux-mtd@lists.infradead.org>;
	Mon, 07 Mar 2011 01:44:46 -0800 (PST)
Received: from localhost (unknown [10.38.164.123])
	by maili.marvell.com (Postfix) with ESMTP id 1B23E8A01E
	for <linux-mtd@lists.infradead.org>;
	Mon,  7 Mar 2011 01:44:46 -0800 (PST)
From: Lei Wen <leiwen@marvell.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] nandwrite: add only write oob option
Date: Mon,  7 Mar 2011 01:44:46 -0800
Message-Id: <1299491086-27109-1-git-send-email-leiwen@marvell.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Write only oob part goes different path in nand_base.c, it is better
to have userland program so that we could easy debug this path when
the write only oob fail like the mtd_oobtest in mtd_test suit.

Signed-off-by: Lei Wen <leiwen@marvell.com>
---
 nandwrite.c |   13 ++++++++++---
 1 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/nandwrite.c b/nandwrite.c
index 7f459cb..6e986c5 100644
--- a/nandwrite.c
+++ b/nandwrite.c
@@ -80,6 +80,7 @@ static void display_help(void)
 "  -n, --noecc             Write without ecc\n"
 "  -N, --noskipbad         Write without bad block skipping\n"
 "  -o, --oob               Image contains oob data\n"
+"  -O, --onlyoob           Image contains oob data and only write the oob part\n"
 "  -r, --raw               Image contains the raw oob data dumped by nanddump\n"
 "  -s addr, --start=addr   Set start address (default is 0)\n"
 "  -p, --pad               Pad to page size\n"
@@ -113,6 +114,7 @@ static long long	mtdoffset = 0;
 static bool		quiet = false;
 static bool		writeoob = false;
 static bool		rawoob = false;
+static bool		onlyoob = false;
 static bool		autoplace = false;
 static bool		markbad = false;
 static bool		forcejffs2 = false;
@@ -129,7 +131,7 @@ static void process_options(int argc, char * const argv[])
 
 	for (;;) {
 		int option_index = 0;
-		static const char *short_options = "ab:fjmnNopqrs:y";
+		static const char *short_options = "ab:fjmnNoOpqrs:y";
 		static const struct option long_options[] = {
 			{"help", no_argument, 0, 0},
 			{"version", no_argument, 0, 0},
@@ -141,6 +143,7 @@ static void process_options(int argc, char * const argv[])
 			{"noecc", no_argument, 0, 'n'},
 			{"noskipbad", no_argument, 0, 'N'},
 			{"oob", no_argument, 0, 'o'},
+			{"onlyoob", no_argument, 0, 'O'},
 			{"pad", no_argument, 0, 'p'},
 			{"quiet", no_argument, 0, 'q'},
 			{"raw", no_argument, 0, 'r'},
@@ -193,6 +196,10 @@ static void process_options(int argc, char * const argv[])
 			case 'o':
 				writeoob = true;
 				break;
+			case 'O':
+				writeoob = true;
+				onlyoob = true;
+				break;
 			case 'p':
 				pad = true;
 				break;
@@ -282,7 +289,7 @@ int main(int argc, char * const argv[])
 
 	process_options(argc, argv);
 
-	if (pad && writeoob) {
+	if (!onlyoob && (pad && writeoob)) {
 		fprintf(stderr, "Can't pad when oob data is present.\n");
 		exit(EXIT_FAILURE);
 	}
@@ -639,7 +646,7 @@ int main(int argc, char * const argv[])
 		}
 
 		/* Write out the Page data */
-		if (mtd_write(&mtd, fd, mtdoffset / mtd.eb_size, mtdoffset % mtd.eb_size,
+		if (!onlyoob && mtd_write(&mtd, fd, mtdoffset / mtd.eb_size, mtdoffset % mtd.eb_size,
 					writebuf, mtd.min_io_size)) {
 			int i;
 			if (errno != EIO) {
-- 
1.7.0.4
