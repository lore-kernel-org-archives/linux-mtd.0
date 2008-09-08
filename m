Received: from relay00.pair.com ([209.68.5.9])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KcaVV-0006ZA-6X
	for linux-mtd@lists.infradead.org; Mon, 08 Sep 2008 06:45:53 +0000
From: Grant Erickson <gerickson@nuovations.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 5/6] [MTD-UTILS] nanddump: Clean-up Usage Output
Date: Sun,  7 Sep 2008 23:45:51 -0700
Message-Id: <1220856351-22826-1-git-send-email-gerickson@nuovations.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Realign help usage output to make it more explict when a description
needs to be wrapped.

Use sentence case for the help usage output option short descriptions.

Signed-off-by: Grant Erickson <gerickson@nuovations.com>
---
 nanddump.c |   28 +++++++++++++++-------------
 1 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/nanddump.c b/nanddump.c
index 44a1014..b8332f9 100644
--- a/nanddump.c
+++ b/nanddump.c
@@ -39,19 +39,21 @@ static struct nand_oobinfo none_oobinfo = {
 
 static void display_help (void)
 {
-	printf("Usage: nanddump [OPTIONS] MTD-device\n"
-			"Dumps the contents of a nand mtd partition.\n"
-			"\n"
-			"           --help	        display this help and exit\n"
-			"           --version	        output version information and exit\n"
-			"-f file    --file=file          dump to file\n"
-			"-i         --ignoreerrors       ignore errors\n"
-			"-l length  --length=length      length\n"
-			"-n         --noecc              read without error correction\n"
-			"-o         --omitoob            omit oob data\n"
-			"-b         --omitbad            omit bad blocks from the dump\n"
-			"-p         --prettyprint        print nice (hexdump)\n"
-			"-s addr    --startaddress=addr  start address\n");
+	printf(
+"Usage: nanddump [OPTIONS] MTD-device\n"
+"Dumps the contents of a nand mtd partition.\n"
+"\n"
+"           --help               Display this help and exit\n"
+"           --version            Output version information and exit\n"
+"-f file    --file=file          Dump to file\n"
+"-i         --ignoreerrors       Ignore errors\n"
+"-l length  --length=length      Length\n"
+"-n         --noecc              Read without error correction\n"
+"-o         --omitoob            Omit oob data\n"
+"-b         --omitbad            Omit bad blocks from the dump\n"
+"-p         --prettyprint        Print nice (hexdump)\n"
+"-s addr    --startaddress=addr  Start address\n"
+	);
 	exit(EXIT_SUCCESS);
 }
 
-- 
1.6.0.1
