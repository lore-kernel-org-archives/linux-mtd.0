Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EpPFw-00022N-0A
	for linux-mtd@lists.infradead.org; Thu, 22 Dec 2005 07:09:19 -0500
Date: Thu, 22 Dec 2005 15:09:51 +0300
From: Vitaly Wool <vwool@ru.mvista.com>
To: linux-mtd@lists.infradead.org
Message-Id: <20051222150951.482742e2.vwool@ru.mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: [PATCH/RFC] introducing new functions/ioctls for handling oobavail
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

the patch inlined below allows to get and store free OOB data as a single data chunk.
This is a lot more conservatiev approach than the one that I used for my previous work on the problem. Now it retains full backward-compatibility and just adds the ability to read/write only the free OOB data (that's what flash filesystems usually want to do! :))

Vitaly

Index: drivers/mtd/mtdchar.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/mtdchar.c,v
retrieving revision 1.77
diff -u -r1.77 mtdchar.c
--- drivers/mtd/mtdchar.c	14 Dec 2005 16:41:54 -0000	1.77
+++ drivers/mtd/mtdchar.c	22 Dec 2005 12:03:21 -0000
@@ -557,6 +557,92 @@
 		break;
 	}
 
+	case MEMGETOOBAVAIL:
+	{
+		if (copy_to_user(argp, &(mtd->oobavail), sizeof(mtd->oobavail)))
+			return -EFAULT;
+		break;
+	}
+
+	case MEMWRITEOOBFREE:
+	{
+		struct mtd_oob_buf buf;
+		void *databuf;
+		ssize_t retlen;
+
+		if(!(file->f_mode & 2))
+			return -EPERM;
+
+		if (copy_from_user(&buf, argp, sizeof(struct mtd_oob_buf)))
+			return -EFAULT;
+
+		if (buf.length > 0x4096)
+			return -EINVAL;
+
+		if (!mtd->write_oobfree)
+			ret = -EOPNOTSUPP;
+		else
+			ret = access_ok(VERIFY_READ, buf.ptr,
+					buf.length) ? 0 : EFAULT;
+
+		if (ret)
+			return ret;
+
+		databuf = kmalloc(buf.length, GFP_KERNEL);
+		if (!databuf)
+			return -ENOMEM;
+
+		if (copy_from_user(databuf, buf.ptr, buf.length)) {
+			kfree(databuf);
+			return -EFAULT;
+		}
+
+		ret = (mtd->write_oobfree)(mtd, buf.start, buf.length, &retlen, databuf);
+
+		if (copy_to_user(argp + sizeof(uint32_t), &retlen, sizeof(uint32_t)))
+			ret = -EFAULT;
+
+		kfree(databuf);
+		break;
+
+	}
+
+	case MEMREADOOBFREE:
+	{
+		struct mtd_oob_buf buf;
+		void *databuf;
+		ssize_t retlen;
+
+		if (copy_from_user(&buf, argp, sizeof(struct mtd_oob_buf)))
+			return -EFAULT;
+
+		if (buf.length > 0x4096)
+			return -EINVAL;
+
+		if (!mtd->read_oobfree)
+			ret = -EOPNOTSUPP;
+		else
+			ret = access_ok(VERIFY_WRITE, buf.ptr,
+					buf.length) ? 0 : -EFAULT;
+
+		if (ret)
+			return ret;
+
+		databuf = kmalloc(buf.length, GFP_KERNEL);
+		if (!databuf)
+			return -ENOMEM;
+
+		ret = (mtd->read_oobfree)(mtd, buf.start, buf.length, &retlen, databuf);
+
+		if (put_user(retlen, (uint32_t __user *)argp))
+			ret = -EFAULT;
+		else if (retlen && copy_to_user(buf.ptr, databuf, retlen))
+			ret = -EFAULT;
+
+		kfree(databuf);
+		break;
+	}
+
 #ifdef CONFIG_MTD_OTP
 	case OTPSELECT:
 	{
Index: drivers/mtd/mtdconcat.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/mtdconcat.c,v
retrieving revision 1.11
diff -u -r1.11 mtdconcat.c
--- drivers/mtd/mtdconcat.c	7 Nov 2005 11:14:20 -0000	1.11
+++ drivers/mtd/mtdconcat.c	22 Dec 2005 12:03:21 -0000
@@ -299,6 +299,54 @@
 }
 
 static int
+concat_read_oobfree(struct mtd_info *mtd, loff_t from, size_t len,
+		    size_t * retlen, u_char * buf)
+{
+	struct mtd_concat *concat = CONCAT(mtd);
+	int err = -EINVAL;
+	int i;
+
+	*retlen = 0;
+
+	for (i = 0; i < concat->num_subdev; i++) {
+		struct mtd_info *subdev = concat->subdev[i];
+		size_t size, retsize;
+
+		if (from >= subdev->size) {
+			/* Not destined for this subdev */
+			size = 0;
+			from -= subdev->size;
+			continue;
+		}
+		if (from + len > subdev->size)
+			/* First part goes into this subdev */
+			size = subdev->size - from;
+		else
+			/* Entire transaction goes into this subdev */
+			size = len;
+
+		if (subdev->read_oobfree)
+			err = subdev->read_oobfree(subdev, from, size,
+					           &retsize, buf);
+		else
+			err = -EINVAL;
+
+		if (err)
+			break;
+
+		*retlen += retsize;
+		len -= size;
+		if (len == 0)
+			break;
+
+		err = -EINVAL;
+		buf += size;
+		from = 0;
+	}
+	return err;
+}
+
+static int
 concat_write_oob(struct mtd_info *mtd, loff_t to, size_t len,
 		 size_t * retlen, const u_char * buf)
 {
@@ -348,6 +396,56 @@
 	return err;
 }
 
+static int
+concat_write_oobfree(struct mtd_info *mtd, loff_t to, size_t len,
+		     size_t * retlen, const u_char * buf)
+{
+	struct mtd_concat *concat = CONCAT(mtd);
+	int err = -EINVAL;
+	int i;
+
+	if (!(mtd->flags & MTD_WRITEABLE))
+		return -EROFS;
+
+	*retlen = 0;
+
+	for (i = 0; i < concat->num_subdev; i++) {
+		struct mtd_info *subdev = concat->subdev[i];
+		size_t size, retsize;
+
+		if (to >= subdev->size) {
+			size = 0;
+			to -= subdev->size;
+			continue;
+		}
+		if (to + len > subdev->size)
+			size = subdev->size - to;
+		else
+			size = len;
+
+		if (!(subdev->flags & MTD_WRITEABLE))
+			err = -EROFS;
+		else if (subdev->write_oobfree)
+			err = subdev->write_oobfree(subdev, to, size, &retsize,
+						    buf);
+		else
+			err = -EINVAL;
+
+		if (err)
+			break;
+
+		*retlen += retsize;
+		len -= size;
+		if (len == 0)
+			break;
+
+		err = -EINVAL;
+		buf += size;
+		to = 0;
+	}
+	return err;
+}
+
 static void concat_erase_callback(struct erase_info *instr)
 {
 	wake_up((wait_queue_head_t *) instr->priv);
@@ -691,6 +789,10 @@
 		concat->mtd.read_oob = concat_read_oob;
 	if (subdev[0]->write_oob)
 		concat->mtd.write_oob = concat_write_oob;
+	if (subdev[0]->read_oobfree)
+		concat->mtd.read_oobfree = concat_read_oobfree;
+	if (subdev[0]->write_oobfree)
+		concat->mtd.write_oobfree = concat_write_oobfree;
 
 	concat->subdev[0] = subdev[0];
 
@@ -726,7 +828,10 @@
 		    !concat->mtd.read_ecc  != !subdev[i]->read_ecc ||
 		    !concat->mtd.write_ecc != !subdev[i]->write_ecc ||
 		    !concat->mtd.read_oob  != !subdev[i]->read_oob ||
-		    !concat->mtd.write_oob != !subdev[i]->write_oob) {
+		    !concat->mtd.write_oob != !subdev[i]->write_oob ||
+		    !concat->mtd.read_oobfree != !subdev[i]->read_oobfree ||
+		    !concat->mtd.write_oobfree != !subdev[i]->write_oobfree ||
+		    ) {
 			kfree(concat);
 			printk("Incompatible OOB or ECC data on \"%s\"\n",
 			       subdev[i]->name);
Index: drivers/mtd/mtdpart.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/mtdpart.c,v
retrieving revision 1.56
diff -u -r1.56 mtdpart.c
--- drivers/mtd/mtdpart.c	29 Nov 2005 16:00:23 -0000	1.56
+++ drivers/mtd/mtdpart.c	22 Dec 2005 12:03:21 -0000
@@ -108,6 +108,18 @@
 					len, retlen, buf);
 }
 
+static int part_read_oobfree (struct mtd_info *mtd, loff_t from, size_t len, 
+			size_t *retlen, u_char *buf)
+{
+	struct mtd_part *part = PART(mtd);
+	if (from >= mtd->size)
+		len = 0;
+	else if (from + len > mtd->size)
+		len = mtd->size - from;
+	return part->master->read_oobfree (part->master, from + part->offset, 
+					len, retlen, buf);
+}
+
 static int part_read_user_prot_reg (struct mtd_info *mtd, loff_t from, size_t len,
 			size_t *retlen, u_char *buf)
 {
@@ -188,6 +200,20 @@
 					len, retlen, buf);
 }
 
+static int part_write_oobfree (struct mtd_info *mtd, loff_t to, size_t len,
+			size_t *retlen, const u_char *buf)
+{
+	struct mtd_part *part = PART(mtd);
+	if (!(mtd->flags & MTD_WRITEABLE))
+		return -EROFS;
+	if (to >= mtd->size)
+		len = 0;
+	else if (to + len > mtd->size)
+		len = mtd->size - to;
+	return part->master->write_oobfree (part->master, to + part->offset, 
+					len, retlen, buf);
+}
+
 static int part_write_user_prot_reg (struct mtd_info *mtd, loff_t from, size_t len,
 			size_t *retlen, u_char *buf)
 {
@@ -424,6 +450,10 @@
 			slave->mtd.read_oob = part_read_oob;
 		if (master->write_oob)
 			slave->mtd.write_oob = part_write_oob;
+		if (master->read_oobfree)
+			slave->mtd.read_oobfree = part_read_oobfree;
+		if (master->write_oobfree)
+			slave->mtd.write_oobfree = part_write_oobfree;
 		if(master->read_user_prot_reg)
 			slave->mtd.read_user_prot_reg = part_read_user_prot_reg;
 		if(master->read_fact_prot_reg)
Index: drivers/mtd/nand/nand_base.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/nand/nand_base.c,v
retrieving revision 1.165
diff -u -r1.165 nand_base.c
--- drivers/mtd/nand/nand_base.c	16 Dec 2005 15:41:31 -0000	1.165
+++ drivers/mtd/nand/nand_base.c	22 Dec 2005 12:03:22 -0000
@@ -918,6 +918,7 @@
 				this->write_buf(mtd, &oob_buf[oidx], len);
 				break;
 			case ITEM_TYPE_OOB:
+			case ITEM_TYPE_OOBFREE:
 				this->enable_hwecc(mtd, NAND_ECC_WRITEOOB);
 				if (this->options & NAND_BUSWIDTH_16) {
 					if (oidx & 1) {
@@ -1292,6 +1293,7 @@
 					eccidx += this->layout[j].length;
 					break;
 				case ITEM_TYPE_OOB:
+				case ITEM_TYPE_OOBFREE:
 					DEBUG (MTD_DEBUG_LEVEL3, "%s: reading %d free oob bytes\n", __FUNCTION__, this->layout[j].length);
 					this->enable_hwecc(mtd, NAND_ECC_READOOB);
 					if (this->options & NAND_BUSWIDTH_16) {
@@ -1497,6 +1499,179 @@
 
 				case ITEM_TYPE_ECC:
 				case ITEM_TYPE_OOB:
+				case ITEM_TYPE_OOBFREE:
+					DEBUG (MTD_DEBUG_LEVEL3, "%s: %s bytes read\n", __FUNCTION__, this->layout[j].type == ITEM_TYPE_ECC ? "ecc" : "oob");
+					i = min_t(int, col, this->layout[j].length);
+					if (i) {
+						reallen += i;
+						if (this->options & NAND_BUSWIDTH_16)
+							this->cmdfunc (mtd, NAND_CMD_READ0, reallen & ~1, page);
+						else
+							this->cmdfunc (mtd, NAND_CMD_READ0, reallen, page);
+					}
+					col -= i;
+
+					if (this->layout[j].type == ITEM_TYPE_ECC)
+						this->enable_hwecc(mtd, NAND_ECC_READSYN);
+					else
+						this->enable_hwecc(mtd, NAND_ECC_READOOB);
+					i = min_t(int, len - read, this->layout[j].length - i);
+					if (i) {
+						if (this->options & NAND_BUSWIDTH_16) {
+							if (reallen & 1) {
+								oob_data[0] = cpu_to_le16(this->read_word(mtd)) >> 8;
+								oob_data++; i--; reallen++;
+							}
+							if (i & 1)
+								this->read_buf(mtd, oob_data, i - 1);
+							else
+								this->read_buf(mtd, oob_data, i);
+ 						}
+						else
+							this->read_buf(mtd, oob_data, i);
+						reallen += i;
+					}
+					if (oob_buf + len == oob_data + i) {
+						read += i;
+						goto out;
+	 				}
+					break;
+ 				}
+				read += i;
+				oob_data += i;
+			}
+		}
+out:
+
+		/* Apply delay or wait for ready/busy pin
+		 * Do this before the AUTOINCR check, so no problems
+		 * arise if a chip which does auto increment
+		 * is marked as NOAUTOINCR by the board driver.
+		*/
+		if (!this->dev_ready)
+			udelay (this->chip_delay);
+		else
+			nand_wait_ready(mtd);
+
+		if (read == len)
+			break;
+
+		/* For subsequent reads align to page boundary. */
+		reallen = col = 0;
+		/* Increment page address */
+		realpage++;
+
+		page = realpage & this->pagemask;
+		/* Check, if we cross a chip boundary */
+		if (!page) {
+			chipnr++;
+			this->select_chip(mtd, -1);
+			this->select_chip(mtd, chipnr);
+		}
+		/* Check, if the chip supports auto page increment
+		 * or if we have hit a block boundary.
+		*/
+		if (!NAND_CANAUTOINCR(this) || !(page & blockcheck))
+			sndcmd = 1;
+	}
+
+	/* Deselect and wake up anyone waiting on the device */
+	nand_release_device(mtd);
+
+	*retlen = read;
+	/*
+	 * Return success
+	 */
+	return 0;
+
+}
+
+/**
+ * nand_read_oobfree - [MTD Interface] NAND read free out-of-band
+ * @mtd:	MTD device structure
+ * @from:	offset to read from
+ * @len:	number of bytes to read
+ * @retlen:	pointer to variable to store the number of read bytes
+ * @buf:	the databuffer to put data
+ *
+ * NAND read free out-of-band data from the spare area
+ */
+static int nand_read_oobfree (struct mtd_info *mtd, loff_t from, size_t len, size_t * retlen, u_char * oob_buf)
+{
+
+	int i, j, col, realpage, page, end, ecc, chipnr, sndcmd = 1, reallen = 0;
+	int read = 0;
+	struct nand_chip *this = mtd->priv;
+	u_char *oob_data = oob_buf;
+        int 	eccsteps;
+	int	blockcheck = (1 << (this->phys_erase_shift - this->page_shift)) - 1;
+
+
+	DEBUG (MTD_DEBUG_LEVEL3, "%s: from = 0x%08x, len = %i\n", __FUNCTION__, (unsigned int) from, (int) len);
+
+	/* Do not allow reads past end of device */
+	if ((from + len) > mtd->size) {
+		*retlen = 0;
+		return -EINVAL;
+	}
+
+	/* Grab the lock and see if the device is available */
+	nand_get_device (this, mtd, FL_READING);
+
+	/* Select the NAND device */
+	chipnr = (int)(from >> this->chip_shift);
+	this->select_chip(mtd, chipnr);
+
+	/* First we calculate the starting page */
+	realpage = (int) (from >> this->page_shift);
+	page = realpage & this->pagemask;
+
+	/* Get raw starting column */
+	col = from & (mtd->oobblock - 1);
+
+	if (col > mtd->oobavail) {
+		*retlen = 0;
+		return -EINVAL;
+	}
+
+	end = mtd->oobblock;
+	ecc = this->eccsize;
+
+	/* Loop until all data read */
+	while (read < len) {
+		if (this->eccmode == NAND_ECC_NONE) {
+			int thislen = mtd->oobsize - col;
+			if (sndcmd) {
+				this->cmdfunc (mtd, NAND_CMD_READOOB, col, page);
+				col = 0;
+				sndcmd = 0;
+			}
+			thislen = min_t(int, thislen, len);
+			this->read_buf(mtd, &oob_buf[read], thislen);
+			read += thislen;
+		} else {
+			/* Check, if we must send the read command */
+			if (sndcmd) {
+				this->cmdfunc (mtd, NAND_CMD_READ0, 0x00, page);
+				sndcmd = 0;
+			}
+
+			eccsteps = this->eccsteps;
+			for (j = 0; this->layout[j].length; j++) {
+				i = 0;
+				switch (this->layout[j].type) {
+				case ITEM_TYPE_DATA:
+				case ITEM_TYPE_ECC:
+				case ITEM_TYPE_OOB:
+					DEBUG (MTD_DEBUG_LEVEL3, "%s: dummy data read\n", __FUNCTION__);
+					reallen += this->layout[j].length;
+					if (this->options & NAND_BUSWIDTH_16)
+						this->cmdfunc (mtd, NAND_CMD_READ0, reallen & ~1, page);
+					else
+						this->cmdfunc (mtd, NAND_CMD_READ0, reallen, page);
+					break;
+
+				case ITEM_TYPE_OOBFREE:
 					DEBUG (MTD_DEBUG_LEVEL3, "%s: %s bytes read\n", __FUNCTION__, this->layout[j].type == ITEM_TYPE_ECC ? "ecc" : "oob");
 					i = min_t(int, col, this->layout[j].length);
 					if (i) {
@@ -1982,6 +2157,7 @@
 
 			case ITEM_TYPE_ECC:
 			case ITEM_TYPE_OOB:
+			case ITEM_TYPE_OOBFREE:
 				if (this->layout[j].type == ITEM_TYPE_ECC)
 					this->enable_hwecc(mtd, NAND_ECC_WRITESYN);
 				else
@@ -2061,6 +2237,178 @@
 }
 
 /**
+ * nand_write_oobfree - [MTD Interface] NAND write free out-of-band
+ * @mtd:	MTD device structure
+ * @to:		offset to write to
+ * @len:	number of bytes to write
+ * @retlen:	pointer to variable to store the number of written bytes
+ * @buf:	the data to write
+ *
+ * NAND write free out-of-band area
+ */
+static int nand_write_oobfree (struct mtd_info *mtd, loff_t to, size_t len, size_t * retlen, const u_char * oob_buf)
+{
+	int column, page, status, ret = -EIO, chipnr, eccsteps; 
+	struct nand_chip *this = mtd->priv;
+
+	DEBUG (MTD_DEBUG_LEVEL3, "%s: to = 0x%08x, len = %i\n", __FUNCTION__, (unsigned int) to, (int) len);
+
+	/* Shift to get page */
+	page = (int) (to >> this->page_shift);
+	chipnr = (int) (to >> this->chip_shift);
+
+	/* Mask to get column */
+	column = to & (mtd->oobsize - 1);
+
+	/* Initialize return length value */
+	*retlen = 0;
+
+	/* Do not allow write past end of page */
+	if ((column + len) > mtd->oobavail) {
+		DEBUG (MTD_DEBUG_LEVEL0, "%s: Attempt to write past end of page\n", __FUNCTION__);
+		return -EINVAL;
+	}
+
+	/* Grab the lock and see if the device is available */
+	nand_get_device (this, mtd, FL_WRITING);
+
+	/* Select the NAND device */
+	this->select_chip(mtd, chipnr);
+
+	/* Reset the chip. Some chips (like the Toshiba TC5832DC found
+	   in one of my DiskOnChip 2000 test units) will clear the whole
+	   data page too if we don't do this. I have no clue why, but
+	   I seem to have 'fixed' it in the doc2000 driver in
+	   August 1999.  dwmw2. */
+	this->cmdfunc(mtd, NAND_CMD_RESET, -1, -1);
+
+	/* Check, if it is write protected */
+	if (nand_check_wp(mtd))
+		goto out;
+
+	/* Invalidate the page cache, if we write to the cached page */
+	if (page == this->pagebuf)
+		this->pagebuf = -1;
+
+	if (this->eccmode == NAND_ECC_NONE) {
+		if (NAND_MUST_PAD(this)) {
+			/* Write out desired data */
+			this->cmdfunc (mtd, NAND_CMD_SEQIN, mtd->oobblock, page & this->pagemask);
+			/* prepad 0xff for partial programming */
+			this->write_buf(mtd, ffchars, column);
+			/* write data */
+			this->write_buf(mtd, oob_buf, len);
+			/* postpad 0xff for partial programming */
+			this->write_buf(mtd, ffchars, mtd->oobsize - (len+column));
+		} else {
+			/* Write out desired data */
+			this->cmdfunc (mtd, NAND_CMD_SEQIN, mtd->oobblock + column, page & this->pagemask);
+			/* write data */
+			this->write_buf(mtd, oob_buf, len);
+		}
+	} else {
+		int i = 0, j = 0;
+		int fflen = 0, old_fflen = 0, ooblen = 0;
+
+		/* Write out desired data */
+		this->cmdfunc (mtd, NAND_CMD_SEQIN, 0, page & this->pagemask);
+
+		eccsteps = this->eccsteps;
+		for (j = 0; this->layout[j].length; j++) {
+			switch (this->layout[j].type) {
+			case ITEM_TYPE_DATA:
+			case ITEM_TYPE_ECC:
+			case ITEM_TYPE_OOB:
+				if (this->options & NAND_COMPLEX_OOB_WRITE) {
+					this->enable_hwecc(mtd, NAND_ECC_WRITE);
+					this->write_buf(mtd, ffchars, this->layout[j].length);
+					fflen += this->layout[j].length;
+				} else {
+					if (old_fflen < fflen) {
+						this->cmdfunc (mtd, NAND_CMD_PAGEPROG, -1, -1);
+						status = this->waitfunc (mtd, this, FL_WRITING);
+						if (status & NAND_STATUS_FAIL) {
+							DEBUG (MTD_DEBUG_LEVEL0, "%s: Failed write, page 0x%08x\n", __FUNCTION__, page);
+							ret = -EIO;
+							goto out;
+						}
+					}
+					fflen += this->layout[j].length;
+					if (this->options & NAND_BUSWIDTH_16 && (fflen + ooblen) & 1)
+						this->cmdfunc (mtd, NAND_CMD_SEQIN, fflen + ooblen - 1, page & this->pagemask);
+					else
+						this->cmdfunc (mtd, NAND_CMD_SEQIN, fflen + ooblen, page & this->pagemask);
+					old_fflen = fflen;
+				}
+				break;
+
+			case ITEM_TYPE_OOBFREE:
+				if (this->layout[j].type == ITEM_TYPE_ECC)
+					this->enable_hwecc(mtd, NAND_ECC_WRITESYN);
+				else
+					this->enable_hwecc(mtd, NAND_ECC_WRITEOOB);
+				i = min_t(int, column, this->layout[j].length);
+				if (i) {
+					if (this->options & NAND_BUSWIDTH_16 && i & 1)
+						i--;
+					if (i == 0) {
+						this->write_word(mtd, cpu_to_le16((oob_buf[0] >> 8) || 0xff));
+						i++;
+						ooblen++;
+					} else
+						this->write_buf(mtd, ffchars, i);
+				}
+				column -= i;
+				fflen += i;
+				i = min_t(int, len + column - ooblen, this->layout[j].length - i);
+				if (i) {
+					if (column) {
+						this->write_word(mtd, cpu_to_le16((oob_buf[0] >> 8) || 0xff));
+						i--;
+						ooblen++;
+					}
+					if (i & 1)
+						i--;
+					this->write_buf(mtd, &oob_buf[ooblen], i);
+				}
+				ooblen += i;
+				if (ooblen == len - 1) {
+					this->write_word(mtd, cpu_to_le16(oob_buf[ooblen]) || 0xff00);
+					ooblen += 2;
+				}
+				if (ooblen >= len) {
+					if (NAND_MUST_PAD(this))
+						this->write_buf(mtd, ffchars, mtd->oobsize + mtd->oobblock - fflen - ooblen);
+					goto finish;
+				}
+				break;
+			}
+		}
+	}
+finish:
+	/* Send command to program the OOB data */
+	this->cmdfunc (mtd, NAND_CMD_PAGEPROG, -1, -1);
+
+	status = this->waitfunc (mtd, this, FL_WRITING);
+
+	/* See if device thinks it succeeded */
+	if (status & NAND_STATUS_FAIL) {
+		DEBUG (MTD_DEBUG_LEVEL0, "%s: Failed write, page 0x%08x\n", __FUNCTION__, page);
+		ret = -EIO;
+		goto out;
+	}
+	/* Return happy */
+	*retlen = len;
+
+	ret = 0;
+out:
+	/* Deselect and wake up anyone waiting on the device */
+	nand_release_device(mtd);
+
+	return ret;
+}
+
+/**
  * nand_writev - [MTD Interface] compabilty function for nand_writev_ecc
  * @mtd:	MTD device structure
  * @vecs:	the iovectors to write
@@ -2562,15 +2910,15 @@
 			int len = oob->oobfree[oobcur][1];
 			oobfreesize += this->layout[i].length;
 			oobcur++;
-			if (i > 0 && this->layout[i-1].type == ITEM_TYPE_OOB) {
+			if (i > 0 && this->layout[i-1].type == ITEM_TYPE_OOBFREE) {
 				i--;
 				cur -= this->layout[i].length;
 				this->layout[i].length += len;
-				DEBUG (MTD_DEBUG_LEVEL3, "fill_autooob_layout: oob concatenated, aggregate length %d\n", this->layout[i].length);
+				DEBUG (MTD_DEBUG_LEVEL3, "fill_autooob_layout: oobfree concatenated, aggregate length %d\n", this->layout[i].length);
 			} else {
-				this->layout[i].type = ITEM_TYPE_OOB;
+				this->layout[i].type = ITEM_TYPE_OOBFREE;
 				this->layout[i].length = len;
-				DEBUG (MTD_DEBUG_LEVEL3, "fill_autooob_layout: oob type, length %d\n", this->layout[i].length);
+				DEBUG (MTD_DEBUG_LEVEL3, "fill_autooob_layout: oobfree type, length %d\n", this->layout[i].length);
 			}
 		} else if (oob->eccpos[eccpos] == cur) {
 			int eccpos_cur = eccpos;
@@ -2978,6 +3326,8 @@
 	mtd->write_ecc = nand_write_ecc;
 	mtd->read_oob = nand_read_oob;
 	mtd->write_oob = nand_write_oob;
+	mtd->read_oobfree = nand_read_oobfree;
+	mtd->write_oobfree = nand_write_oobfree;
 	mtd->readv = NULL;
 	mtd->writev = nand_writev;
 	mtd->writev_ecc = nand_writev_ecc;
Index: include/linux/mtd/mtd.h
===================================================================
RCS file: /home/cvs/mtd/include/linux/mtd/mtd.h,v
retrieving revision 1.62
diff -u -r1.62 mtd.h
--- include/linux/mtd/mtd.h	29 Nov 2005 20:01:30 -0000	1.62
+++ include/linux/mtd/mtd.h	22 Dec 2005 12:03:22 -0000
@@ -118,6 +118,9 @@
 	int (*read_oob) (struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen, u_char *buf);
 	int (*write_oob) (struct mtd_info *mtd, loff_t to, size_t len, size_t *retlen, const u_char *buf);
 
+	int (*read_oobfree) (struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen, u_char *buf);
+	int (*write_oobfree) (struct mtd_info *mtd, loff_t to, size_t len, size_t *retlen, const u_char *buf);
+
 	/*
 	 * Methods to access the protection register area, present in some
 	 * flash devices. The user data is one time programmable but the
Index: include/linux/mtd/nand.h
===================================================================
RCS file: /home/cvs/mtd/include/linux/mtd/nand.h,v
retrieving revision 1.77
diff -u -r1.77 nand.h
--- include/linux/mtd/nand.h	16 Dec 2005 15:41:33 -0000	1.77
+++ include/linux/mtd/nand.h	22 Dec 2005 12:03:22 -0000
@@ -171,6 +171,7 @@
 	enum {
 		ITEM_TYPE_DATA,
 		ITEM_TYPE_OOB,
+		ITEM_TYPE_OOBFREE,
 		ITEM_TYPE_ECC,
 	} type;
 };
Index: include/mtd/mtd-abi.h
===================================================================
RCS file: /home/cvs/mtd/include/mtd/mtd-abi.h,v
retrieving revision 1.13
diff -u -r1.13 mtd-abi.h
--- include/mtd/mtd-abi.h	7 Nov 2005 11:14:56 -0000	1.13
+++ include/mtd/mtd-abi.h	22 Dec 2005 12:03:22 -0000
@@ -110,6 +110,9 @@
 #define OTPGETREGIONCOUNT	_IOW('M', 14, int)
 #define OTPGETREGIONINFO	_IOW('M', 15, struct otp_info)
 #define OTPLOCK		_IOR('M', 16, struct otp_info)
+#define MEMGETOOBAVAIL		_IOR('M', 17, uint32_t)
+#define MEMWRITEOOBFREE         _IOWR('M', 18, struct mtd_oob_buf)
+#define MEMREADOOBFREE          _IOWR('M', 19, struct mtd_oob_buf)
 
 struct nand_oobinfo {
 	uint32_t useecc;
