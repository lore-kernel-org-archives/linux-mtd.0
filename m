Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bezyB-0004su-Pq
 for linux-mtd@lists.infradead.org; Wed, 31 Aug 2016 07:30:07 +0000
From: Daniel Walter <dwalter@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: Richard Weinberger <richard@nod.at>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 09/46] mtd: nandsim: Don't directly use module parameters
Date: Wed, 31 Aug 2016 09:28:16 +0200
Message-Id: <20160831072853.27822-10-dwalter@sigma-star.at>
In-Reply-To: <20160831072853.27822-1-dwalter@sigma-star.at>
References: <20160831072853.27822-1-dwalter@sigma-star.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Richard Weinberger <richard@nod.at>

Move simulator related module params into struct nandsim
such that each instance can later use different parameters.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/nand/nandsim.c | 57 ++++++++++++++++++++++++++++++----------------
 1 file changed, 37 insertions(+), 20 deletions(-)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index e24ef8c..fda670b 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -197,10 +197,10 @@ MODULE_PARM_DESC(bch,		 "Enable BCH ecc and set how many bits should "
 	do { printk(KERN_INFO NS_OUTPUT_PREFIX " " args); } while(0)
 
 /* Busy-wait delay macros (microseconds, milliseconds) */
-#define NS_UDELAY(us) \
-        do { if (do_delays) udelay(us); } while(0)
-#define NS_MDELAY(us) \
-        do { if (do_delays) mdelay(us); } while(0)
+#define NS_UDELAY(ns, us) \
+	do { if (ns->do_delays) udelay(us); } while (0)
+#define NS_MDELAY(ns, us) \
+	do { if (ns->do_delays) mdelay(us); } while (0)
 
 /* Is the nandsim structure initialized ? */
 #define NS_IS_INITIALIZED(ns) ((ns)->geom.totsz != 0)
@@ -381,6 +381,14 @@ struct nandsim {
 	unsigned int wear_eb_count;
 	unsigned long total_wear;
 
+	bool do_delays;
+	unsigned int access_delay;
+	unsigned int program_delay;
+	unsigned int erase_delay;
+	unsigned int output_cycle;
+	unsigned int input_cycle;
+	unsigned int bitflips;
+
 	struct nandsim_debug_info dbg;
 };
 
@@ -816,7 +824,8 @@ static void free_nandsim(struct nandsim *ns)
 	return;
 }
 
-static int parse_badblocks(struct nandsim *ns, struct mtd_info *mtd)
+static int parse_badblocks(struct nandsim *ns, struct mtd_info *mtd,
+			   unsigned char *badblocks)
 {
 	char *w;
 	int zero_ok;
@@ -844,7 +853,7 @@ static int parse_badblocks(struct nandsim *ns, struct mtd_info *mtd)
 	return 0;
 }
 
-static int parse_weakblocks(struct nandsim *ns)
+static int parse_weakblocks(struct nandsim *ns, unsigned char *weakblocks)
 {
 	char *w;
 	int zero_ok;
@@ -895,7 +904,7 @@ static int erase_error(struct nandsim *ns, unsigned int erase_block_no)
 	return 0;
 }
 
-static int parse_weakpages(struct nandsim *ns)
+static int parse_weakpages(struct nandsim *ns, unsigned char *weakpages)
 {
 	char *w;
 	int zero_ok;
@@ -946,7 +955,7 @@ static int write_error(struct nandsim *ns, unsigned int page_no)
 	return 0;
 }
 
-static int parse_gravepages(struct nandsim *ns)
+static int parse_gravepages(struct nandsim *ns, unsigned char *gravepages)
 {
 	char *g;
 	int zero_ok;
@@ -1456,10 +1465,10 @@ static void do_bit_flips(struct nandsim *ns, int num)
 	struct nand_chip *chip = ((struct nand_chip *)ns - 1);
 	struct mtd_info *nsmtd = nand_to_mtd(chip);
 
-	if (bitflips && prandom_u32() < (1 << 22)) {
+	if (ns->bitflips && prandom_u32() < (1 << 22)) {
 		int flips = 1;
-		if (bitflips > 1)
-			flips = (prandom_u32() % (int) bitflips) + 1;
+		if (ns->bitflips > 1)
+			flips = (prandom_u32() % (int)ns->bitflips) + 1;
 		while (flips--) {
 			int pos = prandom_u32() % (num * 8);
 			ns->buf.byte[pos / 8] ^= (1 << (pos % 8));
@@ -1659,8 +1668,8 @@ static int do_state_action(struct nandsim *ns, uint32_t action)
 		else
 			NS_LOG("read OOB of page %d\n", ns->regs.row);
 
-		NS_UDELAY(access_delay);
-		NS_UDELAY(input_cycle * ns->geom.pgsz / 1000 / busdiv);
+		NS_UDELAY(ns, ns->access_delay);
+		NS_UDELAY(ns, ns->input_cycle * ns->geom.pgsz / 1000 / busdiv);
 
 		break;
 
@@ -1692,7 +1701,7 @@ static int do_state_action(struct nandsim *ns, uint32_t action)
 
 		erase_sector(ns);
 
-		NS_MDELAY(erase_delay);
+		NS_MDELAY(ns, ns->erase_delay);
 
 		if (ns->erase_block_wear)
 			update_wear(ns, erase_block_no);
@@ -1730,8 +1739,8 @@ static int do_state_action(struct nandsim *ns, uint32_t action)
 			num, ns->regs.row, ns->regs.column, NS_RAW_OFFSET(ns) + ns->regs.off);
 		NS_LOG("programm page %d\n", ns->regs.row);
 
-		NS_UDELAY(programm_delay);
-		NS_UDELAY(output_cycle * ns->geom.pgsz / 1000 / busdiv);
+		NS_UDELAY(ns, ns->program_delay);
+		NS_UDELAY(ns, ns->output_cycle * ns->geom.pgsz / 1000 / busdiv);
 
 		if (write_error(ns, page_no)) {
 			NS_WARN("simulating write failure in page %u\n", page_no);
@@ -2349,15 +2358,23 @@ static int __init ns_init_default(void)
 
 	nsmtd->owner = THIS_MODULE;
 
-	if ((retval = parse_weakblocks(nand)) != 0)
+	if ((retval = parse_weakblocks(nand, weakblocks)) != 0)
 		goto error;
 
-	if ((retval = parse_weakpages(nand)) != 0)
+	if ((retval = parse_weakpages(nand, weakpages)) != 0)
 		goto error;
 
-	if ((retval = parse_gravepages(nand)) != 0)
+	if ((retval = parse_gravepages(nand, gravepages)) != 0)
 		goto error;
 
+	nand->do_delays = do_delays;
+	nand->access_delay = access_delay;
+	nand->program_delay = programm_delay;
+	nand->erase_delay = erase_delay;
+	nand->output_cycle = output_cycle;
+	nand->input_cycle = input_cycle;
+	nand->bitflips = bitflips;
+
 	retval = nand_scan_ident(nsmtd, 1, NULL);
 	if (retval) {
 		NS_ERR("cannot scan NAND Simulator device\n");
@@ -2429,7 +2446,7 @@ static int __init ns_init_default(void)
 	if ((retval = chip->scan_bbt(nsmtd)) != 0)
 		goto err_exit;
 
-	if ((retval = parse_badblocks(nand, nsmtd)) != 0)
+	if ((retval = parse_badblocks(nand, nsmtd, badblocks)) != 0)
 		goto err_exit;
 
 	/* Register NAND partitions */
-- 
2.8.3
