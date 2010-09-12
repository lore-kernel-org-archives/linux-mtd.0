Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OudZ7-0005P1-6f
	for linux-mtd@lists.infradead.org; Sun, 12 Sep 2010 03:49:18 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
	by smtp.gentoo.org (Postfix) with ESMTP id 6E2D31B40F4
	for <linux-mtd@lists.infradead.org>;
	Sun, 12 Sep 2010 03:49:13 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] nanddump: drop unused --ignoreerrors option
Date: Sat, 11 Sep 2010 23:50:26 -0400
Message-Id: <1284263427-31342-1-git-send-email-vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Nowhere in the nanddump code is the "ignoreerrors" variable used.  So
drop the option completely.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 nanddump.c |    8 +-------
 1 files changed, 1 insertions(+), 7 deletions(-)

diff --git a/nanddump.c b/nanddump.c
index 22fec5f..70b78f0 100644
--- a/nanddump.c
+++ b/nanddump.c
@@ -48,7 +48,6 @@ static void display_help (void)
 "-a         --forcebinary        Force printing of binary data to tty\n"
 "-c         --canonicalprint     Print canonical Hex+ASCII dump\n"
 "-f file    --file=file          Dump to file\n"
-"-i         --ignoreerrors       Ignore errors\n"
 "-l length  --length=length      Length\n"
 "-n         --noecc              Read without error correction\n"
 "-o         --omitoob            Omit oob data\n"
@@ -75,7 +74,6 @@ static void display_version (void)
 
 // Option variables
 
-static bool		ignoreerrors = false;	// ignore errors
 static bool		pretty_print = false;	// print nice
 static bool		noecc = false;		// don't error correct
 static bool		omitoob = false;	// omit oob data
@@ -94,14 +92,13 @@ static void process_options (int argc, char * const argv[])
 
 	for (;;) {
 		int option_index = 0;
-		static const char *short_options = "bs:f:il:opqnca";
+		static const char *short_options = "bs:f:l:opqnca";
 		static const struct option long_options[] = {
 			{"help", no_argument, 0, 0},
 			{"version", no_argument, 0, 0},
 			{"forcebinary", no_argument, 0, 'a'},
 			{"canonicalprint", no_argument, 0, 'c'},
 			{"file", required_argument, 0, 'f'},
-			{"ignoreerrors", no_argument, 0, 'i'},
 			{"prettyprint", no_argument, 0, 'p'},
 			{"omitoob", no_argument, 0, 'o'},
 			{"omitbad", no_argument, 0, 'b'},
@@ -141,9 +138,6 @@ static void process_options (int argc, char * const argv[])
 					exit(EXIT_FAILURE);
 				}
 				break;
-			case 'i':
-				ignoreerrors = true;
-				break;
 			case 'l':
 				length = strtol(optarg, NULL, 0);
 				break;
-- 
1.7.2
