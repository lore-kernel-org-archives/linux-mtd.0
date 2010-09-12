Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OudZ6-0005P0-NW
	for linux-mtd@lists.infradead.org; Sun, 12 Sep 2010 03:49:17 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
	by smtp.gentoo.org (Postfix) with ESMTP id 1B8611B4103
	for <linux-mtd@lists.infradead.org>;
	Sun, 12 Sep 2010 03:49:13 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/2] nanddump: add --nobad to read bad blocks
Date: Sat, 11 Sep 2010 23:50:27 -0400
Message-Id: <1284263427-31342-2-git-send-email-vapier@gentoo.org>
In-Reply-To: <1284263427-31342-1-git-send-email-vapier@gentoo.org>
References: <1284263427-31342-1-git-send-email-vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sometimes dumping bad blocks is useful, like when the data isn't actually
bad but the OOB layout isn't what the kernel is expecting or is otherwise
screwed up.  The --nobad option allows just that.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 nanddump.c |   12 ++++++++++--
 1 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/nanddump.c b/nanddump.c
index 70b78f0..8b3d4a1 100644
--- a/nanddump.c
+++ b/nanddump.c
@@ -50,6 +50,7 @@ static void display_help (void)
 "-f file    --file=file          Dump to file\n"
 "-l length  --length=length      Length\n"
 "-n         --noecc              Read without error correction\n"
+"-N         --nobad              Read without bad block skipping\n"
 "-o         --omitoob            Omit oob data\n"
 "-b         --omitbad            Omit bad blocks from the dump\n"
 "-p         --prettyprint        Print nice (hexdump)\n"
@@ -76,6 +77,7 @@ static void display_version (void)
 
 static bool		pretty_print = false;	// print nice
 static bool		noecc = false;		// don't error correct
+static bool		nobad = false;		// don't skip bad blocks
 static bool		omitoob = false;	// omit oob data
 static unsigned long	start_addr;		// start address
 static unsigned long	length;			// dump length
@@ -92,7 +94,7 @@ static void process_options (int argc, char * const argv[])
 
 	for (;;) {
 		int option_index = 0;
-		static const char *short_options = "bs:f:l:opqnca";
+		static const char *short_options = "bs:f:l:opqnNca";
 		static const struct option long_options[] = {
 			{"help", no_argument, 0, 0},
 			{"version", no_argument, 0, 0},
@@ -105,6 +107,7 @@ static void process_options (int argc, char * const argv[])
 			{"startaddress", required_argument, 0, 's'},
 			{"length", required_argument, 0, 'l'},
 			{"noecc", no_argument, 0, 'n'},
+			{"nobad", no_argument, 0, 'N'},
 			{"quiet", no_argument, 0, 'q'},
 			{0, 0, 0, 0},
 		};
@@ -158,6 +161,9 @@ static void process_options (int argc, char * const argv[])
 			case 'n':
 				noecc = true;
 				break;
+			case 'N':
+				nobad = true;
+				break;
 			case '?':
 				error++;
 				break;
@@ -390,7 +396,9 @@ int main(int argc, char * const argv[])
 	for (ofs = start_addr; ofs < end_addr ; ofs+=bs) {
 
 		// new eraseblock , check for bad block
-		if (blockstart != (ofs & (~meminfo.erasesize + 1))) {
+		if (nobad) {
+			badblock = 0;
+		} else if (blockstart != (ofs & (~meminfo.erasesize + 1))) {
 			blockstart = ofs & (~meminfo.erasesize + 1);
 			if ((badblock = ioctl(fd, MEMGETBADBLOCK, &blockstart)) < 0) {
 				perror("ioctl(MEMGETBADBLOCK)");
-- 
1.7.2
