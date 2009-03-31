Received: from wa-out-1112.google.com ([209.85.146.183])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Loe8u-0007Nn-5h
	for linux-mtd@lists.infradead.org; Tue, 31 Mar 2009 13:36:46 +0000
Received: by wa-out-1112.google.com with SMTP id j5so1488678wah.2
	for <linux-mtd@lists.infradead.org>;
	Tue, 31 Mar 2009 06:36:37 -0700 (PDT)
From: subbu31mani@gmail.com
To: sjhill@realitydiluted.com
Subject: [RFC][PATCH] NAND flash-unlock support in MTD
Date: Tue, 31 Mar 2009 09:36:34 -0400
Message-Id: <1238506594-32114-1-git-send-email-subbu31mani@gmail.com>
Cc: tglx@linutronix.de, linux-mtd@lists.infradead.org,
	omapandroid-discussion@omapzoom.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

+#define NAND_CMD_UNLOCK1        0x23
+#define NAND_CMD_UNLOCK2        0x24
+/**
+ * @brief platform specific unlock function
+ *
+ * @param mtd - mtd info
+ * @param ofs - offset to start unlock from
+ * @param len - length to unlock
+ *
+ * @return - unlock status
+ */
+static int nand_unlock(struct mtd_info *mtd, loff_t ofs, size_t len)
+{
+        int ret = 0;
+        int chipnr;
+        int status;
+        unsigned long page;
+        struct nand_chip *this = mtd->priv;
+        printk(KERN_INFO "nand_unlock: start: %08x, length: %d!\n",
+                        (int)ofs, (int)len);
+
+        /* select the NAND device */
+        chipnr = (int)(ofs >> this->chip_shift);
+        this->select_chip(mtd, chipnr);
+        /* check the WP bit */
+        this->cmdfunc(mtd, NAND_CMD_STATUS, -1, -1);
+        if ((this->read_byte(mtd) & 0x80) == 0) {
+                printk(KERN_ERR "nand_unlock: Device is write protected!\n");
+                ret = -EINVAL;
+                goto out;
+        }
+
+        if ((ofs & (mtd->writesize - 1)) != 0) {
+                printk(KERN_ERR "nand_unlock: Start address must be"
+                                "beginning of nand page!\n");
+                ret = -EINVAL;
+                goto out;
+        }
+
+        if (len == 0 || (len & (mtd->writesize - 1)) != 0) {
+                printk(KERN_ERR "nand_unlock: Length must be a multiple of "
+                                "nand page size!\n");
+                ret = -EINVAL;
+                goto out;
+        }
+
+        /* submit address of first page to unlock */
+        page = (unsigned long)(ofs >> this->page_shift);
+        this->cmdfunc(mtd, NAND_CMD_UNLOCK1, -1, page & this->pagemask);
+
+        /* submit ADDRESS of LAST page to unlock */
+        page += (unsigned long)((ofs + len) >> this->page_shift) ;
+        this->cmdfunc(mtd, NAND_CMD_UNLOCK2, -1, page & this->pagemask);
+
+        /* call wait ready function */
+        status = this->waitfunc(mtd, this);
+        udelay(1000);
+        /* see if device thinks it succeeded */
+        if (status & 0x01) {
+                /* there was an error */
+                printk(KERN_ERR "nand_unlock: error status =0x%08x ", status);
+                ret = -EIO;
+                goto out;
+        }
+
+ out:
+        /* de-select the NAND device */
+        this->select_chip(mtd, -1);
+        return ret;
+}
+
+
 /**
  * single_erease_cmd - [GENERIC] NAND standard block erase command function
  * @mtd:	MTD device structure
@@ -2794,7 +2866,7 @@ int nand_scan_tail(struct mtd_info *mtd)
 	mtd->write_oob = nand_write_oob;
 	mtd->sync = nand_sync;
 	mtd->lock = NULL;
-	mtd->unlock = NULL;
+	mtd->unlock = nand_unlock;
 	mtd->suspend = nand_suspend;
 	mtd->resume = nand_resume;
 	mtd->block_isbad = nand_block_isbad;
