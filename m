Received: from mail.sigma-star.at ([95.130.255.111])
 by casper.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bezyb-0008WK-9x
 for linux-mtd@lists.infradead.org; Wed, 31 Aug 2016 07:30:27 +0000
From: Daniel Walter <dwalter@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: Richard Weinberger <richard@nod.at>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 34/46] mtd: nandsim: Support bitflip and read error emulation
 in file backend
Date: Wed, 31 Aug 2016 09:28:41 +0200
Message-Id: <20160831072853.27822-35-dwalter@sigma-star.at>
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

Since we don't track the empty state we have to check
whether the buffer is full with 0xff bytes or not.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/nand/nandsim.c | 34 ++++++++++++++++++++++++++++------
 1 file changed, 28 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index 75bf45a74..812b97f 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -1602,11 +1602,26 @@ static inline u_char *NS_PAGE_BYTE_OFF(struct nandsim *ns)
 	return NS_GET_PAGE(ns)->byte + ns->regs.column + ns->regs.off;
 }
 
-static int do_read_error(struct nandsim *ns, int num)
+static bool buffer_is_ff(struct nandsim *ns, int num)
+{
+	int i;
+
+	for (i = 0; i < num; i++) {
+		if (ns->buf.byte[i] != 0xff)
+			return false;
+	}
+
+	return true;
+}
+
+static int do_read_error(struct nandsim *ns, int num, bool check_ff)
 {
 	unsigned int page_no = ns->regs.row;
 
 	if (read_error(ns, page_no)) {
+		if (check_ff && buffer_is_ff(ns, num))
+			return 0;
+
 		prandom_bytes(ns->buf.byte, num);
 		pr_warn("simulating read error in page %u\n", page_no);
 		return 1;
@@ -1614,12 +1629,16 @@ static int do_read_error(struct nandsim *ns, int num)
 	return 0;
 }
 
-static void do_bit_flips(struct nandsim *ns, int num)
+static void do_bit_flips(struct nandsim *ns, int num, bool check_ff)
 {
 	struct mtd_info *nsmtd = ns_to_mtd(ns);
 
 	if (ns->bitflips && prandom_u32() < (1 << 22)) {
 		int flips = 1;
+
+		if (check_ff && buffer_is_ff(ns, num))
+			return;
+
 		if (ns->bitflips > 1)
 			flips = (prandom_u32() % (int)ns->bitflips) + 1;
 		while (flips--) {
@@ -1644,10 +1663,10 @@ static void ns_ram_read_page(struct nandsim *ns, int num)
 	} else {
 		pr_debug("page %d allocated, reading from %d\n",
 			ns->regs.row, ns->regs.column + ns->regs.off);
-		if (do_read_error(ns, num))
+		if (do_read_error(ns, num, false))
 			return;
 		memcpy(ns->buf.byte, NS_PAGE_BYTE_OFF(ns), num);
-		do_bit_flips(ns, num);
+		do_bit_flips(ns, num, false);
 	}
 }
 
@@ -1664,7 +1683,7 @@ static void ns_cachefile_read_page(struct nandsim *ns, int num)
 
 		pr_debug("page %d written, reading from %d\n",
 			ns->regs.row, ns->regs.column + ns->regs.off);
-		if (do_read_error(ns, num))
+		if (do_read_error(ns, num, false))
 			return;
 		pos = (loff_t)NS_RAW_OFFSET(ns) + ns->regs.off;
 		tx = read_file(ns, data->cfile, ns->buf.byte, num, pos);
@@ -1672,7 +1691,7 @@ static void ns_cachefile_read_page(struct nandsim *ns, int num)
 			pr_err("read error for page %d ret %ld\n", ns->regs.row, (long)tx);
 			return;
 		}
-		do_bit_flips(ns, num);
+		do_bit_flips(ns, num, false);
 	}
 }
 
@@ -1710,6 +1729,9 @@ void __ns_file_read_page(struct nandsim *ns, int num,
 		memset(ns->buf.byte, 0xff, num);
 	else if (tx != num)
 		pr_err("read error for page %d ret %ld\n", ns->regs.row, (long)tx);
+
+	do_read_error(ns, num, true);
+	do_bit_flips(ns, num, true);
 }
 EXPORT_SYMBOL_GPL(__ns_file_read_page);
 
-- 
2.8.3
