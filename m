Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OTXqa-0007dW-Ct
	for linux-mtd@lists.infradead.org; Tue, 29 Jun 2010 10:15:21 +0000
Received: by mail-fx0-f49.google.com with SMTP id 20so1488254fxm.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 29 Jun 2010 03:15:20 -0700 (PDT)
From: Kulikov Vasiliy <segooon@gmail.com>
To: Kernel Janitors <kernel-janitors@vger.kernel.org>
Subject: [PATCH 06/25] nandsim: remove casts from void*
Date: Tue, 29 Jun 2010 14:15:17 +0400
Message-Id: <1277806517-30908-1-git-send-email-segooon@gmail.com>
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>, linux-kernel@vger.kernel.org,
	Sebastian Andrzej Siewior <sebastian@breakpoint.cc>,
	linux-mtd@lists.infradead.org, Ben Hutchings <bhutchings@solarflare.com>,
	David Woodhouse <dwmw2@infradead.org>, Andrey Yurovsky <yurovsky@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Remove unnesessary casts from void*.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/mtd/nand/nandsim.c |   14 +++++++-------
 1 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index 261337e..c25648b 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -553,8 +553,8 @@ static uint64_t divide(uint64_t n, uint32_t d)
  */
 static int init_nandsim(struct mtd_info *mtd)
 {
-	struct nand_chip *chip = (struct nand_chip *)mtd->priv;
-	struct nandsim   *ns   = (struct nandsim *)(chip->priv);
+	struct nand_chip *chip = mtd->priv;
+	struct nandsim   *ns   = chip->priv;
 	int i, ret = 0;
 	uint64_t remains;
 	uint64_t next_offset;
@@ -1877,7 +1877,7 @@ static void switch_state(struct nandsim *ns)
 
 static u_char ns_nand_read_byte(struct mtd_info *mtd)
 {
-        struct nandsim *ns = (struct nandsim *)((struct nand_chip *)mtd->priv)->priv;
+	struct nandsim *ns = ((struct nand_chip *)mtd->priv)->priv;
 	u_char outb = 0x00;
 
 	/* Sanity and correctness checks */
@@ -1950,7 +1950,7 @@ static u_char ns_nand_read_byte(struct mtd_info *mtd)
 
 static void ns_nand_write_byte(struct mtd_info *mtd, u_char byte)
 {
-        struct nandsim *ns = (struct nandsim *)((struct nand_chip *)mtd->priv)->priv;
+	struct nandsim *ns = ((struct nand_chip *)mtd->priv)->priv;
 
 	/* Sanity and correctness checks */
 	if (!ns->lines.ce) {
@@ -2132,7 +2132,7 @@ static uint16_t ns_nand_read_word(struct mtd_info *mtd)
 
 static void ns_nand_write_buf(struct mtd_info *mtd, const u_char *buf, int len)
 {
-        struct nandsim *ns = (struct nandsim *)((struct nand_chip *)mtd->priv)->priv;
+	struct nandsim *ns = ((struct nand_chip *)mtd->priv)->priv;
 
 	/* Check that chip is expecting data input */
 	if (!(ns->state & STATE_DATAIN_MASK)) {
@@ -2159,7 +2159,7 @@ static void ns_nand_write_buf(struct mtd_info *mtd, const u_char *buf, int len)
 
 static void ns_nand_read_buf(struct mtd_info *mtd, u_char *buf, int len)
 {
-        struct nandsim *ns = (struct nandsim *)((struct nand_chip *)mtd->priv)->priv;
+	struct nandsim *ns = ((struct nand_chip *)mtd->priv)->priv;
 
 	/* Sanity and correctness checks */
 	if (!ns->lines.ce) {
@@ -2352,7 +2352,7 @@ module_init(ns_init_module);
  */
 static void __exit ns_cleanup_module(void)
 {
-	struct nandsim *ns = (struct nandsim *)(((struct nand_chip *)nsmtd->priv)->priv);
+	struct nandsim *ns = ((struct nand_chip *)nsmtd->priv)->priv;
 	int i;
 
 	free_nandsim(ns);    /* Free nandsim private resources */
-- 
1.7.0.4
