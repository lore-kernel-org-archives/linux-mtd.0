Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Ov3Fc-00068t-OF
	for linux-mtd@lists.infradead.org; Mon, 13 Sep 2010 07:14:58 +0000
From: Wolfram Sang <w.sang@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] nanddump: Rename --nobad to --noskipbad
Date: Mon, 13 Sep 2010 09:15:13 +0200
Message-Id: <1284362113-26737-1-git-send-email-w.sang@pengutronix.de>
In-Reply-To: <1284359070.27765.155.camel@localhost>
References: <1284359070.27765.155.camel@localhost>
Cc: Mike Frysinger <vapier@gentoo.org>, Wolfram Sang <w.sang@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

"nobad" might lead to the assumption that bad blocks are skipped, but this
option does exactly the opposite. Use a more descriptive name.

Reported-by: Jon Povey <Jon.Povey@racelogic.co.uk>
Signed-off-by: Wolfram Sang <w.sang@pengutronix.de>
Cc: Mike Frysinger <vapier@gentoo.org>
---

Build tested only.

 nanddump.c |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/nanddump.c b/nanddump.c
index 8b3d4a1..709b2db 100644
--- a/nanddump.c
+++ b/nanddump.c
@@ -50,7 +50,7 @@ static void display_help (void)
 "-f file    --file=file          Dump to file\n"
 "-l length  --length=length      Length\n"
 "-n         --noecc              Read without error correction\n"
-"-N         --nobad              Read without bad block skipping\n"
+"-N         --noskipbad          Read without bad block skipping\n"
 "-o         --omitoob            Omit oob data\n"
 "-b         --omitbad            Omit bad blocks from the dump\n"
 "-p         --prettyprint        Print nice (hexdump)\n"
@@ -77,7 +77,7 @@ static void display_version (void)
 
 static bool		pretty_print = false;	// print nice
 static bool		noecc = false;		// don't error correct
-static bool		nobad = false;		// don't skip bad blocks
+static bool		noskipbad = false;	// don't skip bad blocks
 static bool		omitoob = false;	// omit oob data
 static unsigned long	start_addr;		// start address
 static unsigned long	length;			// dump length
@@ -107,7 +107,7 @@ static void process_options (int argc, char * const argv[])
 			{"startaddress", required_argument, 0, 's'},
 			{"length", required_argument, 0, 'l'},
 			{"noecc", no_argument, 0, 'n'},
-			{"nobad", no_argument, 0, 'N'},
+			{"noskipbad", no_argument, 0, 'N'},
 			{"quiet", no_argument, 0, 'q'},
 			{0, 0, 0, 0},
 		};
@@ -162,7 +162,7 @@ static void process_options (int argc, char * const argv[])
 				noecc = true;
 				break;
 			case 'N':
-				nobad = true;
+				noskipbad = true;
 				break;
 			case '?':
 				error++;
@@ -396,7 +396,7 @@ int main(int argc, char * const argv[])
 	for (ofs = start_addr; ofs < end_addr ; ofs+=bs) {
 
 		// new eraseblock , check for bad block
-		if (nobad) {
+		if (noskipbad) {
 			badblock = 0;
 		} else if (blockstart != (ofs & (~meminfo.erasesize + 1))) {
 			blockstart = ofs & (~meminfo.erasesize + 1);
-- 
1.7.1
