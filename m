Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Oys2U-0000Lo-Pu
	for linux-mtd@lists.infradead.org; Thu, 23 Sep 2010 20:05:07 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
	by smtp.gentoo.org (Postfix) with ESMTP id 401441B40AF
	for <linux-mtd@lists.infradead.org>;
	Thu, 23 Sep 2010 20:05:03 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2] nandwrite: add --nobad to write bad blocks
Date: Thu, 23 Sep 2010 16:04:15 -0400
Message-Id: <1285272255-6980-1-git-send-email-vapier@gentoo.org>
In-Reply-To: <1285238285.29268.28.camel@localhost>
References: <1285238285.29268.28.camel@localhost>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sometimes dumping bad blocks is useful, like when the block isn't actually
bad but the OOB layout isn't what the kernel is expecting or is otherwise
screwed up.  The --nobad option allows just that.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
v2
	- rename --nobad to --noskipbad

 nandwrite.c |   10 +++++++++-
 1 files changed, 9 insertions(+), 1 deletions(-)

diff --git a/nandwrite.c b/nandwrite.c
index 1b4ca3d..8fe8875 100644
--- a/nandwrite.c
+++ b/nandwrite.c
@@ -79,6 +79,7 @@ static void display_help (void)
 "                          device\n"
 "  -m, --markbad           Mark blocks bad if write fails\n"
 "  -n, --noecc             Write without ecc\n"
+"  -N, --noskipbad         Write without bad block skipping\n"
 "  -o, --oob               Image contains oob data\n"
 "  -r, --raw               Image contains the raw oob data dumped by nanddump\n"
 "  -s addr, --start=addr   Set start address (default is 0)\n"
@@ -118,6 +119,7 @@ static bool		forcejffs2 = false;
 static bool		forceyaffs = false;
 static bool		forcelegacy = false;
 static bool		noecc = false;
+static bool		noskipbad = false;
 static bool		pad = false;
 static int		blockalign = 1; /*default to using 16K block size */
 
@@ -127,7 +129,7 @@ static void process_options (int argc, char * const argv[])
 
 	for (;;) {
 		int option_index = 0;
-		static const char *short_options = "ab:fjmnopqrs:y";
+		static const char *short_options = "ab:fjmnNopqrs:y";
 		static const struct option long_options[] = {
 			{"help", no_argument, 0, 0},
 			{"version", no_argument, 0, 0},
@@ -137,6 +139,7 @@ static void process_options (int argc, char * const argv[])
 			{"jffs2", no_argument, 0, 'j'},
 			{"markbad", no_argument, 0, 'm'},
 			{"noecc", no_argument, 0, 'n'},
+			{"noskipbad", no_argument, 0, 'N'},
 			{"oob", no_argument, 0, 'o'},
 			{"pad", no_argument, 0, 'p'},
 			{"quiet", no_argument, 0, 'q'},
@@ -181,6 +184,9 @@ static void process_options (int argc, char * const argv[])
 			case 'n':
 				noecc = true;
 				break;
+			case 'N':
+				noskipbad = true;
+				break;
 			case 'm':
 				markbad = true;
 				break;
@@ -487,6 +493,8 @@ int main(int argc, char * const argv[])
 						 blockstart / meminfo.erasesize, blockstart);
 
 			/* Check all the blocks in an erase block for bad blocks */
+			if (noskipbad)
+				continue;
 			do {
 				if ((ret = ioctl(fd, MEMGETBADBLOCK, &offs)) < 0) {
 					perror("ioctl(MEMGETBADBLOCK)");
-- 
1.7.3
