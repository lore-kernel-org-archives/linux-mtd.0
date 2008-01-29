Received: from tim.rpsys.net ([194.106.48.114])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JJpB4-00072j-HR
	for linux-mtd@lists.infradead.org; Tue, 29 Jan 2008 12:02:59 +0000
Subject: [RFC PATCH 3/3] Add panic_write function to the onenand driver
From: Richard Purdie <rpurdie@rpsys.net>
To: David Woodhouse <dwmw2@infradead.org>,
	linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain
Date: Tue, 29 Jan 2008 11:59:30 +0000
Message-Id: <1201607970.5017.50.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Implement the panic_write function for the onenand driver. This waits
for any active command to complete/timeout, performs the write, waits
for it to complete and then returns.

Signed-off-by: Richard Purdie <rpurdie@rpsys.net>

---
 drivers/mtd/onenand/onenand_base.c |  102 +++++++++++++++++++++++++++++++++++++
 1 file changed, 102 insertions(+)

Index: kernel-hacking/drivers/mtd/onenand/onenand_base.c
===================================================================
--- kernel-hacking.orig/drivers/mtd/onenand/onenand_base.c	2008-01-29 09:16:55.000000000 +0000
+++ kernel-hacking/drivers/mtd/onenand/onenand_base.c	2008-01-29 10:51:01.000000000 +0000
@@ -18,6 +18,7 @@
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/sched.h>
+#include <linux/delay.h>
 #include <linux/interrupt.h>
 #include <linux/jiffies.h>
 #include <linux/mtd/mtd.h>
@@ -1285,6 +1286,106 @@ static int onenand_verify(struct mtd_inf
 
 #define NOTALIGNED(x)	((x & (this->subpagesize - 1)) != 0)
 
+static void onenand_panic_wait(struct mtd_info *mtd)
+{
+	struct onenand_chip *this = mtd->priv;
+	unsigned int interrupt;
+	int i;
+	
+	for (i = 0; i < 20; i++) {
+		interrupt = this->read_word(this->base + ONENAND_REG_INTERRUPT);
+		if (interrupt & ONENAND_INT_MASTER)
+			break;
+		udelay(1000);
+	}
+}
+
+
+/**
+ * onenand_panic_write - [MTD Interface] write buffer to FLASH in a panic context
+ * @param mtd		MTD device structure
+ * @param to		offset to write to
+ * @param len		number of bytes to write
+ * @param retlen	pointer to variable to store the number of written bytes
+ * @param buf		the data to write
+ *
+ * Write with ECC
+ */
+static int onenand_panic_write(struct mtd_info *mtd, loff_t to, size_t len,
+			 size_t *retlen, const u_char *buf)
+{
+	struct onenand_chip *this = mtd->priv;
+	int column, subpage;
+	int written = 0;
+	int ret = 0;
+
+	if (this->state == FL_PM_SUSPENDED)
+		return -EBUSY;
+
+	/* Wait for any existing operation to clear */
+	onenand_panic_wait(mtd);
+
+	DEBUG(MTD_DEBUG_LEVEL3, "onenand_panic_write: to = 0x%08x, len = %i\n",
+	      (unsigned int) to, (int) len);
+
+	/* Initialize retlen, in case of early exit */
+	*retlen = 0;
+
+	/* Do not allow writes past end of device */
+	if (unlikely((to + len) > mtd->size)) {
+		printk(KERN_ERR "onenand_panic_write: Attempt write to past end of device\n");
+		return -EINVAL;
+	}
+
+	/* Reject writes, which are not page aligned */
+        if (unlikely(NOTALIGNED(to)) || unlikely(NOTALIGNED(len))) {
+                printk(KERN_ERR "onenand_panic_write: Attempt to write not page aligned data\n");
+                return -EINVAL;
+        }
+
+	column = to & (mtd->writesize - 1);
+
+	/* Loop until all data write */
+	while (written < len) {
+		int thislen = min_t(int, mtd->writesize - column, len - written);
+		u_char *wbuf = (u_char *) buf;
+
+		this->command(mtd, ONENAND_CMD_BUFFERRAM, to, thislen);
+
+		/* Partial page write */
+		subpage = thislen < mtd->writesize;
+		if (subpage) {
+			memset(this->page_buf, 0xff, mtd->writesize);
+			memcpy(this->page_buf + column, buf, thislen);
+			wbuf = this->page_buf;
+		}
+
+		this->write_bufferram(mtd, ONENAND_DATARAM, wbuf, 0, mtd->writesize);
+		this->write_bufferram(mtd, ONENAND_SPARERAM, ffchars, 0, mtd->oobsize);
+
+		this->command(mtd, ONENAND_CMD_PROG, to, mtd->writesize);
+
+		onenand_panic_wait(mtd);
+
+		if (ret) {
+			printk(KERN_ERR "onenand_write_nolock: write filaed %d\n", ret);
+			break;
+		}
+
+		written += thislen;
+
+		if (written == len)
+			break;
+
+		column = 0;
+		to += thislen;
+		buf += thislen;
+	}
+
+	*retlen = written;
+	return ret;
+}
+
 /**
  * onenand_fill_auto_oob - [Internal] oob auto-placement transfer
  * @param mtd		MTD device structure
@@ -2676,6 +2777,7 @@ int onenand_scan(struct mtd_info *mtd, i
 	mtd->write = onenand_write;
 	mtd->read_oob = onenand_read_oob;
 	mtd->write_oob = onenand_write_oob;
+	mtd->panic_write = onenand_panic_write;
 #ifdef CONFIG_MTD_ONENAND_OTP
 	mtd->get_fact_prot_info = onenand_get_fact_prot_info;
 	mtd->read_fact_prot_reg = onenand_read_fact_prot_reg;
