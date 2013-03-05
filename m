Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UCrj8-0006w4-81
 for linux-mtd@lists.infradead.org; Tue, 05 Mar 2013 13:16:21 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 11/11] mtd: nand: remove few tiny page NAND bits
Date: Tue,  5 Mar 2013 15:17:24 +0200
Message-Id: <1362489444-27762-12-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1362489444-27762-1-git-send-email-dedekind1@gmail.com>
References: <1362489444-27762-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

NAND flashes with 256 bytes NAND pages are so old that probably do not exist
any more. Let's remove few related pieces of code and forget about them
forever. The assumption will be that 512 bytes NAND page size is the minimum
possible.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/nand/nand_base.c |    2 +-
 drivers/mtd/nand/nandsim.c   |   10 +++-------
 drivers/mtd/nand/sm_common.c |    5 -----
 3 files changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index a8ea8ac..29c0378 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -512,7 +512,7 @@ EXPORT_SYMBOL_GPL(nand_wait_ready);
  * @page_addr: the page address for this command, -1 if none
  *
  * Send command to NAND device. This function is used for small page devices
- * (256/512 Bytes per page).
+ * (512 Bytes per page).
  */
 static void nand_command(struct mtd_info *mtd, unsigned int command,
 			 int column, int page_addr)
diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index eb1238f..cb38f3d 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -262,14 +262,13 @@ MODULE_PARM_DESC(bch,		 "Enable BCH ecc and set how many bits should "
 #define NS_OPER_STATES   6  /* Maximum number of states in operation */
 
 #define OPT_ANY          0xFFFFFFFF /* any chip supports this operation */
-#define OPT_PAGE256      0x00000001 /* 256-byte  page chips */
 #define OPT_PAGE512      0x00000002 /* 512-byte  page chips */
 #define OPT_PAGE2048     0x00000008 /* 2048-byte page chips */
 #define OPT_SMARTMEDIA   0x00000010 /* SmartMedia technology chips */
 #define OPT_PAGE512_8BIT 0x00000040 /* 512-byte page chips with 8-bit bus width */
 #define OPT_PAGE4096     0x00000080 /* 4096-byte page chips */
 #define OPT_LARGEPAGE    (OPT_PAGE2048 | OPT_PAGE4096) /* 2048 & 4096-byte page chips */
-#define OPT_SMALLPAGE    (OPT_PAGE256  | OPT_PAGE512)  /* 256 and 512-byte page chips */
+#define OPT_SMALLPAGE    (OPT_PAGE512) /* 512-byte page chips */
 
 /* Remove action bits from state */
 #define NS_STATE(x) ((x) & ~ACTION_MASK)
@@ -696,10 +695,7 @@ static int init_nandsim(struct mtd_info *mtd)
 	ns->geom.secszoob = ns->geom.secsz + ns->geom.oobsz * ns->geom.pgsec;
 	ns->options = 0;
 
-	if (ns->geom.pgsz == 256) {
-		ns->options |= OPT_PAGE256;
-	}
-	else if (ns->geom.pgsz == 512) {
+	if (ns->geom.pgsz == 512) {
 		ns->options |= OPT_PAGE512;
 		if (ns->busw == 8)
 			ns->options |= OPT_PAGE512_8BIT;
@@ -2298,7 +2294,7 @@ static int __init ns_init_module(void)
 		nand->geom.idbytes = 2;
 	nand->regs.status = NS_STATUS_OK(nand);
 	nand->nxstate = STATE_UNKNOWN;
-	nand->options |= OPT_PAGE256; /* temporary value */
+	nand->options |= OPT_PAGE512; /* temporary value */
 	nand->ids[0] = first_id_byte;
 	nand->ids[1] = second_id_byte;
 	nand->ids[2] = third_id_byte;
diff --git a/drivers/mtd/nand/sm_common.c b/drivers/mtd/nand/sm_common.c
index 082bcdc..201458f 100644
--- a/drivers/mtd/nand/sm_common.c
+++ b/drivers/mtd/nand/sm_common.c
@@ -69,11 +69,6 @@ static int sm_block_markbad(struct mtd_info *mtd, loff_t ofs)
 
 
 static struct nand_flash_dev nand_smartmedia_flash_ids[] = {
-	{"SmartMedia 1MiB 5V",          0x6e, 256, 1, 0x1000, 0},
-	{"SmartMedia 1MiB 3,3V",        0xe8, 256, 1, 0x1000, 0},
-	{"SmartMedia 1MiB 3,3V",        0xec, 256, 1, 0x1000, 0},
-	{"SmartMedia 2MiB 3,3V",        0xea, 256, 2, 0x1000, 0},
-	{"SmartMedia 2MiB 5V",          0x64, 256, 2, 0x1000, 0},
 	{"SmartMedia 2MiB 3,3V ROM",    0x5d, 512, 2, 0x2000, NAND_ROM},
 	{"SmartMedia 4MiB 3,3V",        0xe3, 512, 4, 0x2000, 0},
 	{"SmartMedia 4MiB 3,3/5V",      0xe5, 512, 4, 0x2000, 0},
-- 
1.7.10.4
