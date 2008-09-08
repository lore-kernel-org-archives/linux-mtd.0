Received: from relay03.pair.com ([209.68.5.17])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KcYNF-0002jd-Q7
	for linux-mtd@lists.infradead.org; Mon, 08 Sep 2008 04:29:13 +0000
From: Grant Erickson <gerickson@nuovations.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 5/6] [MTD-UTILS] nandwrite: Clean-up Usage Output
Date: Sun,  7 Sep 2008 21:29:11 -0700
Message-Id: <1220848151-22376-1-git-send-email-gerickson@nuovations.com>
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
 nandwrite.c |   37 ++++++++++++++++++++-----------------
 1 files changed, 20 insertions(+), 17 deletions(-)

diff --git a/nandwrite.c b/nandwrite.c
index 5fbed41..b7cd72e 100644
--- a/nandwrite.c
+++ b/nandwrite.c
@@ -73,23 +73,26 @@ static struct nand_oobinfo autoplace_oobinfo = {
 
 static void display_help (void)
 {
-	printf("Usage: nandwrite [OPTION] MTD_DEVICE INPUTFILE\n"
-			"Writes to the specified MTD device.\n"
-			"\n"
-			"  -a, --autoplace	Use auto oob layout\n"
-			"  -j, --jffs2		force jffs2 oob layout (legacy support)\n"
-			"  -y, --yaffs		force yaffs oob layout (legacy support)\n"
-			"  -f, --forcelegacy	force legacy support on autoplacement enabled mtd device\n"
-			"  -m, --markbad		mark blocks bad if write fails\n"
-			"  -n, --noecc		write without ecc\n"
-			"  -o, --oob		image contains oob data\n"
-			"  -s addr, --start=addr set start address (default is 0)\n"
-			"  -p, --pad             pad to page size\n"
-			"  -b, --blockalign=1|2|4 set multiple of eraseblocks to align to\n"
-			"  -q, --quiet		don't display progress messages\n"
-			"      --help		display this help and exit\n"
-			"      --version		output version information and exit\n");
-	exit(0);
+	printf(
+"Usage: nandwrite [OPTION] MTD_DEVICE INPUTFILE\n"
+"Writes to the specified MTD device.\n"
+"\n"
+"  -a, --autoplace         Use auto oob layout\n"
+"  -j, --jffs2             Force jffs2 oob layout (legacy support)\n"
+"  -y, --yaffs             Force yaffs oob layout (legacy support)\n"
+"  -f, --forcelegacy       Force legacy support on autoplacement-enabled mtd\n"
+"                          device\n"
+"  -m, --markbad           Mark blocks bad if write fails\n"
+"  -n, --noecc             Write without ecc\n"
+"  -o, --oob               Image contains oob data\n"
+"  -s addr, --start=addr   Set start address (default is 0)\n"
+"  -p, --pad               Pad to page size\n"
+"  -b, --blockalign=1|2|4  Set multiple of eraseblocks to align to\n"
+"  -q, --quiet             Don't display progress messages\n"
+"      --help              Display this help and exit\n"
+"      --version           Output version information and exit\n"
+	);
+	exit (EXIT_SUCCESS);
 }
 
 static void display_version (void)
-- 
1.6.0.1
