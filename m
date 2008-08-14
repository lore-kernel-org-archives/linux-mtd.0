Message-ID: <48A43E19.7090706@nokia.com>
Date: Thu, 14 Aug 2008 17:15:53 +0300
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: Kyungmin Park <kmpark@infradead.org>
Subject: [RFC] [PATCH] [MTD] [OneNAND] Add write-while-program operation
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Signed-off-by: Adrian Hunter <ext-adrian.hunter@nokia.com>
---
 drivers/mtd/onenand/omap2.c        |    2 +
 drivers/mtd/onenand/onenand_base.c |  104 ++++++++++++++++++++++++++++++++++++
 include/linux/mtd/onenand.h        |    4 ++
 3 files changed, 110 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/onenand/omap2.c b/drivers/mtd/onenand/omap2.c
index bf6bba5..236a68c 100644
--- a/drivers/mtd/onenand/omap2.c
+++ b/drivers/mtd/onenand/omap2.c
@@ -674,6 +674,8 @@ static int __devinit omap2_onenand_probe(struct platform_device *pdev)
 	if ((r = onenand_scan(&c->mtd, 1)) < 0)
 		goto err_release_dma;
 
+	c->mtd.write = onenand_write_while_prog;
+
 	switch ((c->onenand.version_id >> 4) & 0xf) {
 	case 0:
 		c->freq = 40;
diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index 5d7965f..ce10362 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -1573,6 +1573,110 @@ static int onenand_write_ops_nolock(struct mtd_info *mtd, loff_t to,
 	return ret;
 }
 
+/**
+ * onenand_write_while_prog - [MTD Interface] write while program
+ * @param mtd		MTD device structure
+ * @param to		offset to write to
+ * @param len		number of bytes to write
+ * @param retlen	pointer to variable to store the number of written bytes
+ * @param buf		the data to write
+ *
+ * Write while program.
+ */
+int onenand_write_while_prog(struct mtd_info *mtd, loff_t to, size_t len,
+			     size_t *retlen, const u_char *buf)
+{
+	struct onenand_chip *this = mtd->priv;
+	int written = 0, column, uninitialized_var(thislen), uninitialized_var(lastlen);
+	int ret = 0, first_time = 1, uninitialized_var(subpage), uninitialized_var(prev_subpage);
+	loff_t prev = to;
+
+	onenand_get_device(mtd, FL_WRITING);
+
+	DEBUG(MTD_DEBUG_LEVEL3, "onenand_write_while_prog: to = 0x%08x, len = %i\n", (unsigned int) to, (int) len);
+
+	/* Initialize retlen, in case of early exit */
+	*retlen = 0;
+
+	/* Do not allow writes past end of device */
+	if (unlikely((to + len) > mtd->size)) {
+		printk(KERN_ERR "onenand_write_while_prog: Attempt write to past end of device\n");
+		onenand_release_device(mtd);
+		return -EINVAL;
+	}
+
+	/* Reject writes, which are not page aligned */
+        if (unlikely(NOTALIGNED(to)) || unlikely(NOTALIGNED(len))) {
+                printk(KERN_ERR "onenand_write_while_prog: Attempt to write not page aligned data\n");
+		onenand_release_device(mtd);
+                return -EINVAL;
+        }
+
+	if (!len) {
+		onenand_release_device(mtd);
+		return 0;
+	}
+
+	column = to & (mtd->writesize - 1);
+
+	/* Loop until all data is written */
+	while (1) {
+		if (written < len) {
+			u_char *wbuf = (u_char *)buf;
+
+			thislen = min_t(int, mtd->writesize - column, len - written);
+
+			cond_resched();
+
+			this->command(mtd, ONENAND_CMD_BUFFERRAM, to, thislen);
+
+			subpage = thislen < mtd->writesize;
+			if (subpage) {
+				memset(this->page_buf, 0xff, mtd->writesize);
+				memcpy(this->page_buf + column, buf, thislen);
+				wbuf = this->page_buf;
+			}
+
+			this->write_bufferram(mtd, ONENAND_DATARAM, wbuf, 0, mtd->writesize);
+			this->write_bufferram(mtd, ONENAND_SPARERAM, ffchars, 0, mtd->oobsize);
+		} else
+			ONENAND_SET_NEXT_BUFFERRAM(this);
+
+		if (!first_time) {
+			ONENAND_SET_PREV_BUFFERRAM(this);
+			ret = this->wait(mtd, FL_WRITING);
+			onenand_update_bufferram(mtd, prev, !ret && !prev_subpage);
+			if (ret) {
+				written -= lastlen;
+				printk(KERN_ERR "onenand_write_while_prog: write failed %d\n", ret);
+				break;
+			}
+			if (written == len) {
+				ret = onenand_verify(mtd, buf - len, to - len, len);
+				if (ret)
+					printk(KERN_ERR "onenand_write_while_prog: verify failed %d\n", ret);
+				break;
+			}
+			ONENAND_SET_NEXT_BUFFERRAM(this);
+		}
+
+		this->command(mtd, ONENAND_CMD_PROG, to, mtd->writesize);
+
+		written += thislen;
+		column = 0;
+		prev_subpage = subpage;
+		prev = to;
+		to += thislen;
+		buf += thislen;
+		lastlen = thislen;
+		first_time = 0;
+	}
+
+	*retlen = written;
+
+	onenand_release_device(mtd);
+	return ret;
+}
 
 /**
  * onenand_write_oob_nolock - [Internal] OneNAND write out-of-band
diff --git a/include/linux/mtd/onenand.h b/include/linux/mtd/onenand.h
index 9aa2a91..1223430 100644
--- a/include/linux/mtd/onenand.h
+++ b/include/linux/mtd/onenand.h
@@ -24,6 +24,10 @@ extern int onenand_scan(struct mtd_info *mtd, int max_chips);
 /* Free resources held by the OneNAND device */
 extern void onenand_release(struct mtd_info *mtd);
 
+/* Alternative write algorithm : write-while program */
+int onenand_write_while_prog(struct mtd_info *mtd, loff_t to, size_t len,
+			     size_t *retlen, const u_char *buf);
+
 /*
  * onenand_state_t - chip states
  * Enumeration for OneNAND flash chip state
-- 
1.5.4.3
