Received: from mail-pa0-x22e.google.com ([2607:f8b0:400e:c03::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aHFtz-0005jT-1Z
 for linux-mtd@lists.infradead.org; Thu, 07 Jan 2016 19:07:15 +0000
Received: by mail-pa0-x22e.google.com with SMTP id yy13so172888037pab.3
 for <linux-mtd@lists.infradead.org>; Thu, 07 Jan 2016 11:06:54 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH] mtd: nandsim: use nand_get_controller_data()
Date: Thu,  7 Jan 2016 11:06:46 -0800
Message-Id: <1452193606-96031-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Commit d699ed250c07 ("mtd: nand: make use of
nand_set/get_controller_data() helpers") overlooked some uses of
nand_chip::priv.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/nandsim.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index f57f461b5d72..1fd519503bb1 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -1908,7 +1908,8 @@ static void switch_state(struct nandsim *ns)
 
 static u_char ns_nand_read_byte(struct mtd_info *mtd)
 {
-	struct nandsim *ns = mtd_to_nand(mtd)->priv;
+	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nandsim *ns = nand_get_controller_data(chip);
 	u_char outb = 0x00;
 
 	/* Sanity and correctness checks */
@@ -1969,7 +1970,8 @@ static u_char ns_nand_read_byte(struct mtd_info *mtd)
 
 static void ns_nand_write_byte(struct mtd_info *mtd, u_char byte)
 {
-	struct nandsim *ns = mtd_to_nand(mtd)->priv;
+	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nandsim *ns = nand_get_controller_data(chip);
 
 	/* Sanity and correctness checks */
 	if (!ns->lines.ce) {
@@ -2123,7 +2125,8 @@ static void ns_nand_write_byte(struct mtd_info *mtd, u_char byte)
 
 static void ns_hwcontrol(struct mtd_info *mtd, int cmd, unsigned int bitmask)
 {
-	struct nandsim *ns = mtd_to_nand(mtd)->priv;
+	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nandsim *ns = nand_get_controller_data(chip);
 
 	ns->lines.cle = bitmask & NAND_CLE ? 1 : 0;
 	ns->lines.ale = bitmask & NAND_ALE ? 1 : 0;
@@ -2150,7 +2153,8 @@ static uint16_t ns_nand_read_word(struct mtd_info *mtd)
 
 static void ns_nand_write_buf(struct mtd_info *mtd, const u_char *buf, int len)
 {
-	struct nandsim *ns = mtd_to_nand(mtd)->priv;
+	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nandsim *ns = nand_get_controller_data(chip);
 
 	/* Check that chip is expecting data input */
 	if (!(ns->state & STATE_DATAIN_MASK)) {
@@ -2177,7 +2181,8 @@ static void ns_nand_write_buf(struct mtd_info *mtd, const u_char *buf, int len)
 
 static void ns_nand_read_buf(struct mtd_info *mtd, u_char *buf, int len)
 {
-	struct nandsim *ns = mtd_to_nand(mtd)->priv;
+	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nandsim *ns = nand_get_controller_data(chip);
 
 	/* Sanity and correctness checks */
 	if (!ns->lines.ce) {
@@ -2404,7 +2409,8 @@ module_init(ns_init_module);
  */
 static void __exit ns_cleanup_module(void)
 {
-	struct nandsim *ns = mtd_to_nand(nsmtd)->priv;
+	struct nand_chip *chip = mtd_to_nand(nsmtd);
+	struct nandsim *ns = nand_get_controller_data(chip);
 	int i;
 
 	nandsim_debugfs_remove(ns);
-- 
2.6.0.rc2.230.g3dd15c0
