Return-Path: <SRS0=nfTR=6X=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42F17C47254
	for <linux-mtd@archiver.kernel.org>; Sat,  9 May 2020 19:15:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D112A20722
	for <linux-mtd@archiver.kernel.org>; Sat,  9 May 2020 19:15:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f84v1i5K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D112A20722
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WHAm3i7NqocXbO7QfgqU5tihxk2Qjpqw0/zYlGEV6DQ=; b=f84v1i5K3W0Uho
	c4g1MqHyQcEWn7tpKixEChpORnGgbCKtGOeZ3KDlj4cty1SYeDbwhD0BZCktSySKGx6567LZC9FV4
	ITwDjYMEMzqYPI+R6uZVZpQ+ZQ+1oMUs98otMd3pYbIrYrhlIEtlEam0/gtnecqv2S428UEaeUTfx
	s5VtWCLUsiFpHGHscUgxHEyYDmjy7ZSa61SelOlSXAUuiySyirvCIEE0YW3IE+sYuA0vrmeqSXGCl
	pVxDtscwQP0aku7CERMwy8WtrbHF4UoBoZNnC29D3nLa3wgrTDUYhVHkvoh2hOx9vX2rYMqGa8/Pu
	7NLU+plLrpG8dO5ze7tA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jXUws-000570-AV; Sat, 09 May 2020 19:15:46 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jXUvn-0001m2-5L
 for linux-mtd@lists.infradead.org; Sat, 09 May 2020 19:14:43 +0000
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 659B1100004;
 Sat,  9 May 2020 19:14:35 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH 03/17] mtd: rawnand: nandsim: Use a consistent ns_ prefix for
 all functions
Date: Sat,  9 May 2020 21:14:16 +0200
Message-Id: <20200509191431.15862-4-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200509191431.15862-1-miquel.raynal@bootlin.com>
References: <20200509191431.15862-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200509_121439_473873_6DF2F9EC 
X-CRM114-Status: GOOD (  18.30  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: dedekind@infradead.org, Boris Brezillon <boris.brezillon@collabora.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Some functions are prefixed "nandsim_", others "ns_" and many are
simply not prefixed at all. Make this file consistent by prefixing all
functions by "ns_".

This is a mechanical change. Sometimes the line is a bit reworked as
well to fit the kernel coding style. For instance, there are several
places where displayed strings are cut. When one of this line is
changed because of the naming update, the two parts of the strings
gets concatenated.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/nandsim.c | 248 +++++++++++++++++----------------
 1 file changed, 131 insertions(+), 117 deletions(-)

diff --git a/drivers/mtd/nand/raw/nandsim.c b/drivers/mtd/nand/raw/nandsim.c
index ea46f7011a0f..2c335cc8bcdf 100644
--- a/drivers/mtd/nand/raw/nandsim.c
+++ b/drivers/mtd/nand/raw/nandsim.c
@@ -432,7 +432,7 @@ static unsigned long total_wear = 0;
 /* MTD structure for NAND controller */
 static struct mtd_info *nsmtd;
 
-static int nandsim_show(struct seq_file *m, void *private)
+static int ns_show(struct seq_file *m, void *private)
 {
 	unsigned long wmin = -1, wmax = 0, avg;
 	unsigned long deciles[10], decile_max[10], tot = 0;
@@ -483,16 +483,16 @@ static int nandsim_show(struct seq_file *m, void *private)
 
 	return 0;
 }
-DEFINE_SHOW_ATTRIBUTE(nandsim);
+DEFINE_SHOW_ATTRIBUTE(ns);
 
 /**
- * nandsim_debugfs_create - initialize debugfs
+ * ns_debugfs_create - initialize debugfs
  * @ns: nandsim device description object
  *
  * This function creates all debugfs files for UBI device @ubi. Returns zero in
  * case of success and a negative error code in case of failure.
  */
-static int nandsim_debugfs_create(struct nandsim *ns)
+static int ns_debugfs_create(struct nandsim *ns)
 {
 	struct dentry *root = nsmtd->dbg.dfs_dir;
 	struct dentry *dent;
@@ -509,7 +509,7 @@ static int nandsim_debugfs_create(struct nandsim *ns)
 	}
 
 	dent = debugfs_create_file("nandsim_wear_report", 0400, root, ns,
-				   &nandsim_fops);
+				   &ns_fops);
 	if (IS_ERR_OR_NULL(dent)) {
 		NS_ERR("cannot create \"nandsim_wear_report\" debugfs entry\n");
 		return -1;
@@ -524,7 +524,7 @@ static int nandsim_debugfs_create(struct nandsim *ns)
  *
  * RETURNS: 0 if success, -ENOMEM if memory alloc fails.
  */
-static int __init alloc_device(struct nandsim *ns)
+static int __init ns_alloc_device(struct nandsim *ns)
 {
 	struct file *cfile;
 	int i, err;
@@ -588,7 +588,7 @@ static int __init alloc_device(struct nandsim *ns)
 /*
  * Free any allocated pages, and free the array of page pointers.
  */
-static void free_device(struct nandsim *ns)
+static void ns_free_device(struct nandsim *ns)
 {
 	int i;
 
@@ -610,7 +610,7 @@ static void free_device(struct nandsim *ns)
 	}
 }
 
-static char __init *get_partition_name(int i)
+static char __init *ns_get_partition_name(int i)
 {
 	return kasprintf(GFP_KERNEL, "NAND simulator partition %d", i);
 }
@@ -620,7 +620,7 @@ static char __init *get_partition_name(int i)
  *
  * RETURNS: 0 if success, -ERRNO if failure.
  */
-static int __init init_nandsim(struct mtd_info *mtd)
+static int __init ns_init(struct mtd_info *mtd)
 {
 	struct nand_chip *chip = mtd_to_nand(mtd);
 	struct nandsim   *ns   = nand_get_controller_data(chip);
@@ -693,7 +693,7 @@ static int __init init_nandsim(struct mtd_info *mtd)
 			NS_ERR("bad partition size.\n");
 			return -EINVAL;
 		}
-		ns->partitions[i].name   = get_partition_name(i);
+		ns->partitions[i].name = ns_get_partition_name(i);
 		if (!ns->partitions[i].name) {
 			NS_ERR("unable to allocate memory.\n");
 			return -ENOMEM;
@@ -709,7 +709,7 @@ static int __init init_nandsim(struct mtd_info *mtd)
 			NS_ERR("too many partitions.\n");
 			return -EINVAL;
 		}
-		ns->partitions[i].name   = get_partition_name(i);
+		ns->partitions[i].name = ns_get_partition_name(i);
 		if (!ns->partitions[i].name) {
 			NS_ERR("unable to allocate memory.\n");
 			return -ENOMEM;
@@ -739,7 +739,7 @@ static int __init init_nandsim(struct mtd_info *mtd)
 	printk("sector address bytes: %u\n",    ns->geom.secaddrbytes);
 	printk("options: %#x\n",                ns->options);
 
-	if ((ret = alloc_device(ns)) != 0)
+	if ((ret = ns_alloc_device(ns)) != 0)
 		return ret;
 
 	/* Allocate / initialize the internal buffer */
@@ -757,15 +757,15 @@ static int __init init_nandsim(struct mtd_info *mtd)
 /*
  * Free the nandsim structure.
  */
-static void free_nandsim(struct nandsim *ns)
+static void ns_free(struct nandsim *ns)
 {
 	kfree(ns->buf.byte);
-	free_device(ns);
+	ns_free_device(ns);
 
 	return;
 }
 
-static int parse_badblocks(struct nandsim *ns, struct mtd_info *mtd)
+static int ns_parse_badblocks(struct nandsim *ns, struct mtd_info *mtd)
 {
 	char *w;
 	int zero_ok;
@@ -793,7 +793,7 @@ static int parse_badblocks(struct nandsim *ns, struct mtd_info *mtd)
 	return 0;
 }
 
-static int parse_weakblocks(void)
+static int ns_parse_weakblocks(void)
 {
 	char *w;
 	int zero_ok;
@@ -830,7 +830,7 @@ static int parse_weakblocks(void)
 	return 0;
 }
 
-static int erase_error(unsigned int erase_block_no)
+static int ns_erase_error(unsigned int erase_block_no)
 {
 	struct weak_block *wb;
 
@@ -844,7 +844,7 @@ static int erase_error(unsigned int erase_block_no)
 	return 0;
 }
 
-static int parse_weakpages(void)
+static int ns_parse_weakpages(void)
 {
 	char *w;
 	int zero_ok;
@@ -881,7 +881,7 @@ static int parse_weakpages(void)
 	return 0;
 }
 
-static int write_error(unsigned int page_no)
+static int ns_write_error(unsigned int page_no)
 {
 	struct weak_page *wp;
 
@@ -895,7 +895,7 @@ static int write_error(unsigned int page_no)
 	return 0;
 }
 
-static int parse_gravepages(void)
+static int ns_parse_gravepages(void)
 {
 	char *g;
 	int zero_ok;
@@ -932,7 +932,7 @@ static int parse_gravepages(void)
 	return 0;
 }
 
-static int read_error(unsigned int page_no)
+static int ns_read_error(unsigned int page_no)
 {
 	struct grave_page *gp;
 
@@ -946,7 +946,7 @@ static int read_error(unsigned int page_no)
 	return 0;
 }
 
-static void free_lists(void)
+static void ns_free_lists(void)
 {
 	struct list_head *pos, *n;
 	list_for_each_safe(pos, n, &weak_blocks) {
@@ -964,7 +964,7 @@ static void free_lists(void)
 	kfree(erase_block_wear);
 }
 
-static int setup_wear_reporting(struct mtd_info *mtd)
+static int ns_setup_wear_reporting(struct mtd_info *mtd)
 {
 	size_t mem;
 
@@ -982,7 +982,7 @@ static int setup_wear_reporting(struct mtd_info *mtd)
 	return 0;
 }
 
-static void update_wear(unsigned int erase_block_no)
+static void ns_update_wear(unsigned int erase_block_no)
 {
 	if (!erase_block_wear)
 		return;
@@ -1001,7 +1001,7 @@ static void update_wear(unsigned int erase_block_no)
 /*
  * Returns the string representation of 'state' state.
  */
-static char *get_state_name(uint32_t state)
+static char *ns_get_state_name(uint32_t state)
 {
 	switch (NS_STATE(state)) {
 		case STATE_CMD_READ0:
@@ -1061,7 +1061,7 @@ static char *get_state_name(uint32_t state)
  *
  * RETURNS: 1 if wrong command, 0 if right.
  */
-static int check_command(int cmd)
+static int ns_check_command(int cmd)
 {
 	switch (cmd) {
 
@@ -1088,7 +1088,7 @@ static int check_command(int cmd)
 /*
  * Returns state after command is accepted by command number.
  */
-static uint32_t get_state_by_command(unsigned command)
+static uint32_t ns_get_state_by_command(unsigned command)
 {
 	switch (command) {
 		case NAND_CMD_READ0:
@@ -1126,7 +1126,7 @@ static uint32_t get_state_by_command(unsigned command)
 /*
  * Move an address byte to the correspondent internal register.
  */
-static inline void accept_addr_byte(struct nandsim *ns, u_char bt)
+static inline void ns_accept_addr_byte(struct nandsim *ns, u_char bt)
 {
 	uint byte = (uint)bt;
 
@@ -1144,9 +1144,10 @@ static inline void accept_addr_byte(struct nandsim *ns, u_char bt)
 /*
  * Switch to STATE_READY state.
  */
-static inline void switch_to_ready_state(struct nandsim *ns, u_char status)
+static inline void ns_switch_to_ready_state(struct nandsim *ns, u_char status)
 {
-	NS_DBG("switch_to_ready_state: switch to %s state\n", get_state_name(STATE_READY));
+	NS_DBG("switch_to_ready_state: switch to %s state\n",
+	       ns_get_state_name(STATE_READY));
 
 	ns->state       = STATE_READY;
 	ns->nxstate     = STATE_UNKNOWN;
@@ -1203,7 +1204,7 @@ static inline void switch_to_ready_state(struct nandsim *ns, u_char status)
  *          -1 - several matches.
  *           0 - operation is found.
  */
-static int find_operation(struct nandsim *ns, uint32_t flag)
+static int ns_find_operation(struct nandsim *ns, uint32_t flag)
 {
 	int opsfound = 0;
 	int i, j, idx = 0;
@@ -1256,7 +1257,8 @@ static int find_operation(struct nandsim *ns, uint32_t flag)
 		ns->state = ns->op[ns->stateidx];
 		ns->nxstate = ns->op[ns->stateidx + 1];
 		NS_DBG("find_operation: operation found, index: %d, state: %s, nxstate %s\n",
-				idx, get_state_name(ns->state), get_state_name(ns->nxstate));
+		       idx, ns_get_state_name(ns->state),
+		       ns_get_state_name(ns->nxstate));
 		return 0;
 	}
 
@@ -1264,13 +1266,13 @@ static int find_operation(struct nandsim *ns, uint32_t flag)
 		/* Nothing was found. Try to ignore previous commands (if any) and search again */
 		if (ns->npstates != 0) {
 			NS_DBG("find_operation: no operation found, try again with state %s\n",
-					get_state_name(ns->state));
+			       ns_get_state_name(ns->state));
 			ns->npstates = 0;
-			return find_operation(ns, 0);
+			return ns_find_operation(ns, 0);
 
 		}
 		NS_DBG("find_operation: no operations found\n");
-		switch_to_ready_state(ns, NS_STATUS_FAILED(ns));
+		ns_switch_to_ready_state(ns, NS_STATUS_FAILED(ns));
 		return -2;
 	}
 
@@ -1287,7 +1289,7 @@ static int find_operation(struct nandsim *ns, uint32_t flag)
 	return -1;
 }
 
-static void put_pages(struct nandsim *ns)
+static void ns_put_pages(struct nandsim *ns)
 {
 	int i;
 
@@ -1296,7 +1298,8 @@ static void put_pages(struct nandsim *ns)
 }
 
 /* Get page cache pages in advance to provide NOFS memory allocation */
-static int get_pages(struct nandsim *ns, struct file *file, size_t count, loff_t pos)
+static int ns_get_pages(struct nandsim *ns, struct file *file, size_t count,
+			loff_t pos)
 {
 	pgoff_t index, start_index, end_index;
 	struct page *page;
@@ -1316,7 +1319,7 @@ static int get_pages(struct nandsim *ns, struct file *file, size_t count, loff_t
 				page = find_or_create_page(mapping, index, GFP_NOFS);
 			}
 			if (page == NULL) {
-				put_pages(ns);
+				ns_put_pages(ns);
 				return -ENOMEM;
 			}
 			unlock_page(page);
@@ -1326,35 +1329,37 @@ static int get_pages(struct nandsim *ns, struct file *file, size_t count, loff_t
 	return 0;
 }
 
-static ssize_t read_file(struct nandsim *ns, struct file *file, void *buf, size_t count, loff_t pos)
+static ssize_t ns_read_file(struct nandsim *ns, struct file *file, void *buf,
+			    size_t count, loff_t pos)
 {
 	ssize_t tx;
 	int err;
 	unsigned int noreclaim_flag;
 
-	err = get_pages(ns, file, count, pos);
+	err = ns_get_pages(ns, file, count, pos);
 	if (err)
 		return err;
 	noreclaim_flag = memalloc_noreclaim_save();
 	tx = kernel_read(file, buf, count, &pos);
 	memalloc_noreclaim_restore(noreclaim_flag);
-	put_pages(ns);
+	ns_put_pages(ns);
 	return tx;
 }
 
-static ssize_t write_file(struct nandsim *ns, struct file *file, void *buf, size_t count, loff_t pos)
+static ssize_t ns_write_file(struct nandsim *ns, struct file *file, void *buf,
+			     size_t count, loff_t pos)
 {
 	ssize_t tx;
 	int err;
 	unsigned int noreclaim_flag;
 
-	err = get_pages(ns, file, count, pos);
+	err = ns_get_pages(ns, file, count, pos);
 	if (err)
 		return err;
 	noreclaim_flag = memalloc_noreclaim_save();
 	tx = kernel_write(file, buf, count, &pos);
 	memalloc_noreclaim_restore(noreclaim_flag);
-	put_pages(ns);
+	ns_put_pages(ns);
 	return tx;
 }
 
@@ -1374,11 +1379,11 @@ static inline u_char *NS_PAGE_BYTE_OFF(struct nandsim *ns)
 	return NS_GET_PAGE(ns)->byte + ns->regs.column + ns->regs.off;
 }
 
-static int do_read_error(struct nandsim *ns, int num)
+static int ns_do_read_error(struct nandsim *ns, int num)
 {
 	unsigned int page_no = ns->regs.row;
 
-	if (read_error(page_no)) {
+	if (ns_read_error(page_no)) {
 		prandom_bytes(ns->buf.byte, num);
 		NS_WARN("simulating read error in page %u\n", page_no);
 		return 1;
@@ -1386,7 +1391,7 @@ static int do_read_error(struct nandsim *ns, int num)
 	return 0;
 }
 
-static void do_bit_flips(struct nandsim *ns, int num)
+static void ns_do_bit_flips(struct nandsim *ns, int num)
 {
 	if (bitflips && prandom_u32() < (1 << 22)) {
 		int flips = 1;
@@ -1406,7 +1411,7 @@ static void do_bit_flips(struct nandsim *ns, int num)
 /*
  * Fill the NAND buffer with data read from the specified page.
  */
-static void read_page(struct nandsim *ns, int num)
+static void ns_read_page(struct nandsim *ns, int num)
 {
 	union ns_mem *mypage;
 
@@ -1420,15 +1425,16 @@ static void read_page(struct nandsim *ns, int num)
 
 			NS_DBG("read_page: page %d written, reading from %d\n",
 				ns->regs.row, ns->regs.column + ns->regs.off);
-			if (do_read_error(ns, num))
+			if (ns_do_read_error(ns, num))
 				return;
 			pos = (loff_t)NS_RAW_OFFSET(ns) + ns->regs.off;
-			tx = read_file(ns, ns->cfile, ns->buf.byte, num, pos);
+			tx = ns_read_file(ns, ns->cfile, ns->buf.byte, num,
+					  pos);
 			if (tx != num) {
 				NS_ERR("read_page: read error for page %d ret %ld\n", ns->regs.row, (long)tx);
 				return;
 			}
-			do_bit_flips(ns, num);
+			ns_do_bit_flips(ns, num);
 		}
 		return;
 	}
@@ -1440,17 +1446,17 @@ static void read_page(struct nandsim *ns, int num)
 	} else {
 		NS_DBG("read_page: page %d allocated, reading from %d\n",
 			ns->regs.row, ns->regs.column + ns->regs.off);
-		if (do_read_error(ns, num))
+		if (ns_do_read_error(ns, num))
 			return;
 		memcpy(ns->buf.byte, NS_PAGE_BYTE_OFF(ns), num);
-		do_bit_flips(ns, num);
+		ns_do_bit_flips(ns, num);
 	}
 }
 
 /*
  * Erase all pages in the specified sector.
  */
-static void erase_sector(struct nandsim *ns)
+static void ns_erase_sector(struct nandsim *ns)
 {
 	union ns_mem *mypage;
 	int i;
@@ -1478,7 +1484,7 @@ static void erase_sector(struct nandsim *ns)
 /*
  * Program the specified page with the contents from the NAND buffer.
  */
-static int prog_page(struct nandsim *ns, int num)
+static int ns_prog_page(struct nandsim *ns, int num)
 {
 	int i;
 	union ns_mem *mypage;
@@ -1497,7 +1503,7 @@ static int prog_page(struct nandsim *ns, int num)
 			memset(ns->file_buf, 0xff, ns->geom.pgszoob);
 		} else {
 			all = 0;
-			tx = read_file(ns, ns->cfile, pg_off, num, off);
+			tx = ns_read_file(ns, ns->cfile, pg_off, num, off);
 			if (tx != num) {
 				NS_ERR("prog_page: read error for page %d ret %ld\n", ns->regs.row, (long)tx);
 				return -1;
@@ -1507,14 +1513,15 @@ static int prog_page(struct nandsim *ns, int num)
 			pg_off[i] &= ns->buf.byte[i];
 		if (all) {
 			loff_t pos = (loff_t)ns->regs.row * ns->geom.pgszoob;
-			tx = write_file(ns, ns->cfile, ns->file_buf, ns->geom.pgszoob, pos);
+			tx = ns_write_file(ns, ns->cfile, ns->file_buf,
+					   ns->geom.pgszoob, pos);
 			if (tx != ns->geom.pgszoob) {
 				NS_ERR("prog_page: write error for page %d ret %ld\n", ns->regs.row, (long)tx);
 				return -1;
 			}
 			__set_bit(ns->regs.row, ns->pages_written);
 		} else {
-			tx = write_file(ns, ns->cfile, pg_off, num, off);
+			tx = ns_write_file(ns, ns->cfile, pg_off, num, off);
 			if (tx != num) {
 				NS_ERR("prog_page: write error for page %d ret %ld\n", ns->regs.row, (long)tx);
 				return -1;
@@ -1552,7 +1559,7 @@ static int prog_page(struct nandsim *ns, int num)
  *
  * RETURNS: 0 if success, -1 if error.
  */
-static int do_state_action(struct nandsim *ns, uint32_t action)
+static int ns_do_state_action(struct nandsim *ns, uint32_t action)
 {
 	int num;
 	int busdiv = ns->busw == 8 ? 1 : 2;
@@ -1579,7 +1586,7 @@ static int do_state_action(struct nandsim *ns, uint32_t action)
 			break;
 		}
 		num = ns->geom.pgszoob - ns->regs.off - ns->regs.column;
-		read_page(ns, num);
+		ns_read_page(ns, num);
 
 		NS_DBG("do_state_action: (ACTION_CPY:) copy %d bytes to int buf, raw offset %d\n",
 			num, NS_RAW_OFFSET(ns) + ns->regs.off);
@@ -1622,14 +1629,14 @@ static int do_state_action(struct nandsim *ns, uint32_t action)
 				ns->regs.row, NS_RAW_OFFSET(ns));
 		NS_LOG("erase sector %u\n", erase_block_no);
 
-		erase_sector(ns);
+		ns_erase_sector(ns);
 
 		NS_MDELAY(erase_delay);
 
 		if (erase_block_wear)
-			update_wear(erase_block_no);
+			ns_update_wear(erase_block_no);
 
-		if (erase_error(erase_block_no)) {
+		if (ns_erase_error(erase_block_no)) {
 			NS_WARN("simulating erase failure in erase block %u\n", erase_block_no);
 			return -1;
 		}
@@ -1653,7 +1660,7 @@ static int do_state_action(struct nandsim *ns, uint32_t action)
 			return -1;
 		}
 
-		if (prog_page(ns, num) == -1)
+		if (ns_prog_page(ns, num) == -1)
 			return -1;
 
 		page_no = ns->regs.row;
@@ -1665,7 +1672,7 @@ static int do_state_action(struct nandsim *ns, uint32_t action)
 		NS_UDELAY(programm_delay);
 		NS_UDELAY(output_cycle * ns->geom.pgsz / 1000 / busdiv);
 
-		if (write_error(page_no)) {
+		if (ns_write_error(page_no)) {
 			NS_WARN("simulating write failure in page %u\n", page_no);
 			return -1;
 		}
@@ -1702,7 +1709,7 @@ static int do_state_action(struct nandsim *ns, uint32_t action)
 /*
  * Switch simulator's state.
  */
-static void switch_state(struct nandsim *ns)
+static void ns_switch_state(struct nandsim *ns)
 {
 	if (ns->op) {
 		/*
@@ -1716,11 +1723,13 @@ static void switch_state(struct nandsim *ns)
 
 		NS_DBG("switch_state: operation is known, switch to the next state, "
 			"state: %s, nxstate: %s\n",
-			get_state_name(ns->state), get_state_name(ns->nxstate));
+		       ns_get_state_name(ns->state),
+		       ns_get_state_name(ns->nxstate));
 
 		/* See, whether we need to do some action */
-		if ((ns->state & ACTION_MASK) && do_state_action(ns, ns->state) < 0) {
-			switch_to_ready_state(ns, NS_STATUS_FAILED(ns));
+		if ((ns->state & ACTION_MASK) &&
+		    ns_do_state_action(ns, ns->state) < 0) {
+			ns_switch_to_ready_state(ns, NS_STATUS_FAILED(ns));
 			return;
 		}
 
@@ -1734,15 +1743,16 @@ static void switch_state(struct nandsim *ns)
 		 *  The only event causing the switch_state function to
 		 *  be called with yet unknown operation is new command.
 		 */
-		ns->state = get_state_by_command(ns->regs.command);
+		ns->state = ns_get_state_by_command(ns->regs.command);
 
 		NS_DBG("switch_state: operation is unknown, try to find it\n");
 
-		if (find_operation(ns, 0) != 0)
+		if (ns_find_operation(ns, 0) != 0)
 			return;
 
-		if ((ns->state & ACTION_MASK) && do_state_action(ns, ns->state) < 0) {
-			switch_to_ready_state(ns, NS_STATUS_FAILED(ns));
+		if ((ns->state & ACTION_MASK) &&
+		    ns_do_state_action(ns, ns->state) < 0) {
+			ns_switch_to_ready_state(ns, NS_STATUS_FAILED(ns));
 			return;
 		}
 	}
@@ -1770,7 +1780,7 @@ static void switch_state(struct nandsim *ns)
 
 		NS_DBG("switch_state: operation complete, switch to STATE_READY state\n");
 
-		switch_to_ready_state(ns, status);
+		ns_switch_to_ready_state(ns, status);
 
 		return;
 	} else if (ns->nxstate & (STATE_DATAIN_MASK | STATE_DATAOUT_MASK)) {
@@ -1784,7 +1794,8 @@ static void switch_state(struct nandsim *ns)
 
 		NS_DBG("switch_state: the next state is data I/O, switch, "
 			"state: %s, nxstate: %s\n",
-			get_state_name(ns->state), get_state_name(ns->nxstate));
+		       ns_get_state_name(ns->state),
+		       ns_get_state_name(ns->nxstate));
 
 		/*
 		 * Set the internal register to the count of bytes which
@@ -1862,8 +1873,8 @@ static u_char ns_nand_read_byte(struct nand_chip *chip)
 		return outb;
 	}
 	if (!(ns->state & STATE_DATAOUT_MASK)) {
-		NS_WARN("read_byte: unexpected data output cycle, state is %s "
-			"return %#x\n", get_state_name(ns->state), (uint)outb);
+		NS_WARN("read_byte: unexpected data output cycle, state is %s return %#x\n",
+			ns_get_state_name(ns->state), (uint)outb);
 		return outb;
 	}
 
@@ -1902,7 +1913,7 @@ static u_char ns_nand_read_byte(struct nand_chip *chip)
 		NS_DBG("read_byte: all bytes were read\n");
 
 		if (NS_STATE(ns->nxstate) == STATE_READY)
-			switch_state(ns);
+			ns_switch_state(ns);
 	}
 
 	return outb;
@@ -1929,12 +1940,12 @@ static void ns_nand_write_byte(struct nand_chip *chip, u_char byte)
 
 		if (byte == NAND_CMD_RESET) {
 			NS_LOG("reset chip\n");
-			switch_to_ready_state(ns, NS_STATUS_OK(ns));
+			ns_switch_to_ready_state(ns, NS_STATUS_OK(ns));
 			return;
 		}
 
 		/* Check that the command byte is correct */
-		if (check_command(byte)) {
+		if (ns_check_command(byte)) {
 			NS_ERR("write_byte: unknown command %#x\n", (uint)byte);
 			return;
 		}
@@ -1943,7 +1954,7 @@ static void ns_nand_write_byte(struct nand_chip *chip, u_char byte)
 			|| NS_STATE(ns->state) == STATE_DATAOUT) {
 			int row = ns->regs.row;
 
-			switch_state(ns);
+			ns_switch_state(ns);
 			if (byte == NAND_CMD_RNDOUT)
 				ns->regs.row = row;
 		}
@@ -1958,16 +1969,17 @@ static void ns_nand_write_byte(struct nand_chip *chip, u_char byte)
 				 * was expected but command was input. In this case ignore
 				 * previous command(s)/state(s) and accept the last one.
 				 */
-				NS_WARN("write_byte: command (%#x) wasn't expected, expected state is %s, "
-					"ignore previous states\n", (uint)byte, get_state_name(ns->nxstate));
+				NS_WARN("write_byte: command (%#x) wasn't expected, expected state is %s, ignore previous states\n",
+					(uint)byte,
+					ns_get_state_name(ns->nxstate));
 			}
-			switch_to_ready_state(ns, NS_STATUS_FAILED(ns));
+			ns_switch_to_ready_state(ns, NS_STATUS_FAILED(ns));
 		}
 
 		NS_DBG("command byte corresponding to %s state accepted\n",
-			get_state_name(get_state_by_command(byte)));
+			ns_get_state_name(ns_get_state_by_command(byte)));
 		ns->regs.command = byte;
-		switch_state(ns);
+		ns_switch_state(ns);
 
 	} else if (ns->lines.ale == 1) {
 		/*
@@ -1978,11 +1990,13 @@ static void ns_nand_write_byte(struct nand_chip *chip, u_char byte)
 
 			NS_DBG("write_byte: operation isn't known yet, identify it\n");
 
-			if (find_operation(ns, 1) < 0)
+			if (ns_find_operation(ns, 1) < 0)
 				return;
 
-			if ((ns->state & ACTION_MASK) && do_state_action(ns, ns->state) < 0) {
-				switch_to_ready_state(ns, NS_STATUS_FAILED(ns));
+			if ((ns->state & ACTION_MASK) &&
+			    ns_do_state_action(ns, ns->state) < 0) {
+				ns_switch_to_ready_state(ns,
+							 NS_STATUS_FAILED(ns));
 				return;
 			}
 
@@ -2004,20 +2018,20 @@ static void ns_nand_write_byte(struct nand_chip *chip, u_char byte)
 
 		/* Check that chip is expecting address */
 		if (!(ns->nxstate & STATE_ADDR_MASK)) {
-			NS_ERR("write_byte: address (%#x) isn't expected, expected state is %s, "
-				"switch to STATE_READY\n", (uint)byte, get_state_name(ns->nxstate));
-			switch_to_ready_state(ns, NS_STATUS_FAILED(ns));
+			NS_ERR("write_byte: address (%#x) isn't expected, expected state is %s, switch to STATE_READY\n",
+			       (uint)byte, ns_get_state_name(ns->nxstate));
+			ns_switch_to_ready_state(ns, NS_STATUS_FAILED(ns));
 			return;
 		}
 
 		/* Check if this is expected byte */
 		if (ns->regs.count == ns->regs.num) {
 			NS_ERR("write_byte: no more address bytes expected\n");
-			switch_to_ready_state(ns, NS_STATUS_FAILED(ns));
+			ns_switch_to_ready_state(ns, NS_STATUS_FAILED(ns));
 			return;
 		}
 
-		accept_addr_byte(ns, byte);
+		ns_accept_addr_byte(ns, byte);
 
 		ns->regs.count += 1;
 
@@ -2026,7 +2040,7 @@ static void ns_nand_write_byte(struct nand_chip *chip, u_char byte)
 
 		if (ns->regs.count == ns->regs.num) {
 			NS_DBG("address (%#x, %#x) is accepted\n", ns->regs.row, ns->regs.column);
-			switch_state(ns);
+			ns_switch_state(ns);
 		}
 
 	} else {
@@ -2036,10 +2050,10 @@ static void ns_nand_write_byte(struct nand_chip *chip, u_char byte)
 
 		/* Check that chip is expecting data input */
 		if (!(ns->state & STATE_DATAIN_MASK)) {
-			NS_ERR("write_byte: data input (%#x) isn't expected, state is %s, "
-				"switch to %s\n", (uint)byte,
-				get_state_name(ns->state), get_state_name(STATE_READY));
-			switch_to_ready_state(ns, NS_STATUS_FAILED(ns));
+			NS_ERR("write_byte: data input (%#x) isn't expected, state is %s, switch to %s\n",
+			       (uint)byte, ns_get_state_name(ns->state),
+			       ns_get_state_name(STATE_READY));
+			ns_switch_to_ready_state(ns, NS_STATUS_FAILED(ns));
 			return;
 		}
 
@@ -2069,16 +2083,16 @@ static void ns_nand_write_buf(struct nand_chip *chip, const u_char *buf,
 
 	/* Check that chip is expecting data input */
 	if (!(ns->state & STATE_DATAIN_MASK)) {
-		NS_ERR("write_buf: data input isn't expected, state is %s, "
-			"switch to STATE_READY\n", get_state_name(ns->state));
-		switch_to_ready_state(ns, NS_STATUS_FAILED(ns));
+		NS_ERR("write_buf: data input isn't expected, state is %s, switch to STATE_READY\n",
+		       ns_get_state_name(ns->state));
+		ns_switch_to_ready_state(ns, NS_STATUS_FAILED(ns));
 		return;
 	}
 
 	/* Check if these are expected bytes */
 	if (ns->regs.count + len > ns->regs.num) {
 		NS_ERR("write_buf: too many input bytes\n");
-		switch_to_ready_state(ns, NS_STATUS_FAILED(ns));
+		ns_switch_to_ready_state(ns, NS_STATUS_FAILED(ns));
 		return;
 	}
 
@@ -2105,7 +2119,7 @@ static void ns_nand_read_buf(struct nand_chip *chip, u_char *buf, int len)
 	}
 	if (!(ns->state & STATE_DATAOUT_MASK)) {
 		NS_WARN("read_buf: unexpected data output cycle, current state is %s\n",
-			get_state_name(ns->state));
+			ns_get_state_name(ns->state));
 		return;
 	}
 
@@ -2121,7 +2135,7 @@ static void ns_nand_read_buf(struct nand_chip *chip, u_char *buf, int len)
 	/* Check if these are expected bytes */
 	if (ns->regs.count + len > ns->regs.num) {
 		NS_ERR("read_buf: too many bytes to read\n");
-		switch_to_ready_state(ns, NS_STATUS_FAILED(ns));
+		ns_switch_to_ready_state(ns, NS_STATUS_FAILED(ns));
 		return;
 	}
 
@@ -2130,7 +2144,7 @@ static void ns_nand_read_buf(struct nand_chip *chip, u_char *buf, int len)
 
 	if (ns->regs.count == ns->regs.num) {
 		if (NS_STATE(ns->nxstate) == STATE_READY)
-			switch_state(ns);
+			ns_switch_state(ns);
 	}
 
 	return;
@@ -2288,13 +2302,13 @@ static int __init ns_init_module(void)
 
 	nsmtd->owner = THIS_MODULE;
 
-	if ((retval = parse_weakblocks()) != 0)
+	if ((retval = ns_parse_weakblocks()) != 0)
 		goto error;
 
-	if ((retval = parse_weakpages()) != 0)
+	if ((retval = ns_parse_weakpages()) != 0)
 		goto error;
 
-	if ((retval = parse_gravepages()) != 0)
+	if ((retval = ns_parse_gravepages()) != 0)
 		goto error;
 
 	nand_controller_init(&ns->base);
@@ -2328,16 +2342,16 @@ static int __init ns_init_module(void)
 		chip->pagemask = (targetsize >> chip->page_shift) - 1;
 	}
 
-	if ((retval = setup_wear_reporting(nsmtd)) != 0)
+	if ((retval = ns_setup_wear_reporting(nsmtd)) != 0)
 		goto err_exit;
 
-	if ((retval = init_nandsim(nsmtd)) != 0)
+	if ((retval = ns_init(nsmtd)) != 0)
 		goto err_exit;
 
 	if ((retval = nand_create_bbt(chip)) != 0)
 		goto err_exit;
 
-	if ((retval = parse_badblocks(ns, nsmtd)) != 0)
+	if ((retval = ns_parse_badblocks(ns, nsmtd)) != 0)
 		goto err_exit;
 
 	/* Register NAND partitions */
@@ -2346,19 +2360,19 @@ static int __init ns_init_module(void)
 	if (retval != 0)
 		goto err_exit;
 
-	if ((retval = nandsim_debugfs_create(ns)) != 0)
+	if ((retval = ns_debugfs_create(ns)) != 0)
 		goto err_exit;
 
         return 0;
 
 err_exit:
-	free_nandsim(ns);
+	ns_free(ns);
 	nand_release(chip);
 	for (i = 0;i < ARRAY_SIZE(ns->partitions); ++i)
 		kfree(ns->partitions[i].name);
 error:
 	kfree(ns);
-	free_lists();
+	ns_free_lists();
 
 	return retval;
 }
@@ -2374,12 +2388,12 @@ static void __exit ns_cleanup_module(void)
 	struct nandsim *ns = nand_get_controller_data(chip);
 	int i;
 
-	free_nandsim(ns);    /* Free nandsim private resources */
+	ns_free(ns);    /* Free nandsim private resources */
 	nand_release(chip); /* Unregister driver */
 	for (i = 0;i < ARRAY_SIZE(ns->partitions); ++i)
 		kfree(ns->partitions[i].name);
 	kfree(ns);        /* Free other structures */
-	free_lists();
+	ns_free_lists();
 }
 
 module_exit(ns_cleanup_module);
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
