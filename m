Received: from mail-fx0-f222.google.com ([209.85.220.222])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NSdku-00008J-6Z
	for linux-mtd@lists.infradead.org; Wed, 06 Jan 2010 21:49:32 +0000
Received: by fxm22 with SMTP id 22so20327728fxm.2
	for <linux-mtd@lists.infradead.org>;
	Wed, 06 Jan 2010 13:49:27 -0800 (PST)
Subject: [PATCH 5/9] NAND: export nand_do_read_oob and nand_do_write_oob
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: linux-kernel <linux-kernel@vger.kernel.org>
In-Reply-To: <1262814216.14552.22.camel@maxim-laptop>
References: <1262814216.14552.22.camel@maxim-laptop>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 06 Jan 2010 23:49:23 +0200
Message-ID: <1262814563.14552.29.camel@maxim-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: joern <joern@logfs.org>, linux-mtd <linux-mtd@lists.infradead.org>,
	Alex Dubov <oakad@yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From 42a44a48f270f45e44595b6f3906df4a6cf28ba5 Mon Sep 17 00:00:00 2001
From: Maxim Levitsky <maximlevitsky@gmail.com>
Date: Tue, 5 Jan 2010 23:25:20 +0200
Subject: [PATCH 5/9] NAND: export nand_do_read_oob and nand_do_write_oob

Drivers might need sane way to read/write oob area, but can't
use mtd interface due to locking

Signed-off-by: Maxim Levitsky <maximlevitsky@gmail.com>
---
 drivers/mtd/nand/nand_base.c |   10 +++++-----
 include/linux/mtd/nand.h     |    7 +++++++
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 2957cc7..787e751 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -99,9 +99,6 @@ static struct nand_ecclayout nand_oob_128 = {
 static int nand_get_device(struct nand_chip *chip, struct mtd_info *mtd,
 			   int new_state);
 
-static int nand_do_write_oob(struct mtd_info *mtd, loff_t to,
-			     struct mtd_oob_ops *ops);
-
 /*
  * For devices which display every fart in the system on a separate LED. Is
  * compiled away when LED support is disabled.
@@ -1458,7 +1455,7 @@ static int nand_write_oob_syndrome(struct mtd_info *mtd,
  *
  * NAND read out-of-band data from the spare area
  */
-static int nand_do_read_oob(struct mtd_info *mtd, loff_t from,
+int nand_do_read_oob(struct mtd_info *mtd, loff_t from,
 			    struct mtd_oob_ops *ops)
 {
 	int page, realpage, chipnr, sndcmd = 1;
@@ -1993,7 +1990,7 @@ static int nand_write(struct mtd_info *mtd, loff_t to, size_t len,
  *
  * NAND write out-of-band
  */
-static int nand_do_write_oob(struct mtd_info *mtd, loff_t to,
+int nand_do_write_oob(struct mtd_info *mtd, loff_t to,
 			     struct mtd_oob_ops *ops)
 {
 	int chipnr, page, status, len;
@@ -2962,6 +2959,9 @@ EXPORT_SYMBOL_GPL(nand_scan);
 EXPORT_SYMBOL_GPL(nand_scan_ident);
 EXPORT_SYMBOL_GPL(nand_scan_tail);
 EXPORT_SYMBOL_GPL(nand_release);
+EXPORT_SYMBOL_GPL(nand_do_read_oob);
+EXPORT_SYMBOL_GPL(nand_do_write_oob);
+
 
 static int __init nand_base_init(void)
 {
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 7a232a9..7c3ff57 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -548,6 +548,13 @@ extern int nand_erase_nand(struct mtd_info *mtd, struct erase_info *instr,
 extern int nand_do_read(struct mtd_info *mtd, loff_t from, size_t len,
 			size_t * retlen, uint8_t * buf);
 
+extern int nand_do_read_oob(struct mtd_info *mtd, loff_t from,
+			    struct mtd_oob_ops *ops);
+
+extern int nand_do_write_oob(struct mtd_info *mtd, loff_t to,
+			     struct mtd_oob_ops *ops);
+
+
 /*
 * Constants for oob configuration
 */
-- 
1.6.3.3
