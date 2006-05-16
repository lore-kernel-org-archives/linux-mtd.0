Received: from mga03.intel.com ([143.182.124.21] helo=azsmga101-1.ch.intel.com)
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Fft8O-0006dg-FX
	for linux-mtd@lists.infradead.org; Tue, 16 May 2006 02:34:24 -0400
Message-ID: <44697264.8040509@intel.com>
Date: Tue, 16 May 2006 10:34:12 +0400
From: Alexander Belyakov <alexander.belyakov@intel.com>
MIME-Version: 1.0
To: Jorn Engel <joern@wohnheim.fh-wedel.de>
References: <F048F58F304F0040BC3E937DE4E231E701F9F027@NNSMSX401>
	<20060515122535.GA26656@wohnheim.fh-wedel.de>
In-Reply-To: <20060515122535.GA26656@wohnheim.fh-wedel.de>
Content-Type: multipart/mixed; boundary="------------030106040602040802090002"
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] MTD: mtdconcat NAND/Sibley support (revised)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------030106040602040802090002
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Jorn Engel wrote:
>
> On Fri, 5 May 2006 16:08:21 +0400, Belyakov, Alexander wrote:
> >
> > +concat_writev_ecc (struct mtd_info *mtd, const struct kvec *vecs,
> > unsigned long count,
>
> Your mailer is eating this patch.  Can you either fix your mailer and
> resend, resend with a different mailer or resend as attachment?
> Inline patch is preferred.
>

One of my mailers corrupts headers, so messages are rejected by MTD list 
admin. Another one deals with headers, but converts tabs to whitespaces. 
And I don't know how to fix them at the moment. Sorry.

So I'm attaching patch file to this message to be sure it will not get 
corrupted.

Thanks,
Alexander

--------------030106040602040802090002
Content-Type: text/plain;
 name="mtd-concat-nandfix.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="mtd-concat-nandfix.patch"

diff -uNr a/drivers/mtd/mtdconcat.c b/drivers/mtd/mtdconcat.c
--- a/drivers/mtd/mtdconcat.c	2006-04-07 20:56:47.000000000 +0400
+++ b/drivers/mtd/mtdconcat.c	2006-05-15 17:07:05.000000000 +0400
@@ -45,6 +45,14 @@
 #define CONCAT(x)  ((struct mtd_concat *)(x))
 
 /*
+ * Forward function declaration
+ */
+static int
+concat_writev_ecc(struct mtd_info *mtd, const struct kvec *vecs,
+		unsigned long count, loff_t to, size_t * retlen,
+		u_char *eccbuf, struct nand_oobinfo *oobsel);
+
+/*
  * MTD methods which look up the relevant subdevice, translate the
  * effective address and pass through to the subdevice.
  */
@@ -140,6 +148,14 @@
 	return err;
 }
 
+
+static int
+concat_writev(struct mtd_info *mtd, const struct kvec *vecs,
+		unsigned long count, loff_t to, size_t * retlen)
+{
+	return concat_writev_ecc(mtd, vecs, count, to, retlen, NULL, NULL);
+}
+
 static int
 concat_read_ecc(struct mtd_info *mtd, loff_t from, size_t len,
 		size_t * retlen, u_char * buf, u_char * eccbuf,
@@ -251,6 +267,107 @@
 }
 
 static int
+concat_writev_ecc(struct mtd_info *mtd, const struct kvec *vecs,
+		unsigned long count, loff_t to, size_t * retlen,
+		u_char *eccbuf, struct nand_oobinfo *oobsel)
+{
+	struct mtd_concat *concat = CONCAT(mtd);
+	struct kvec *vecs_copy;
+	unsigned long entry_low, entry_high;
+	size_t total_len = 0;
+	int i;
+	int err = -EINVAL;
+
+	if (!(mtd->flags & MTD_WRITEABLE))
+		return -EROFS;
+
+	*retlen = 0;
+
+	/* Calculate total length of data */
+	for (i = 0; i < count; i++)
+		total_len += vecs[i].iov_len;
+
+	/* Do not allow write past end of page */
+	if ((to + total_len) > mtd->size)
+		return -EINVAL;
+
+	/* Check alignment */
+	if (concat->mtd.type == MTD_NANDFLASH) {
+    		if ((to & (mtd->oobblock - 1)) ||
+		    (total_len & (mtd->oobblock - 1)))
+			return -EINVAL;
+	}
+
+	/* make a copy of vecs */
+	vecs_copy = kmalloc(sizeof(struct kvec) * count, GFP_KERNEL);
+	if (!vecs_copy)
+		return -ENOMEM;
+	memcpy(vecs_copy, vecs, sizeof(struct kvec) * count);
+
+	entry_low = 0;
+	for (i = 0; i < concat->num_subdev; i++) {
+		struct mtd_info *subdev = concat->subdev[i];
+		size_t size, wsize, retsize, old_iov_len;
+
+		if (to >= subdev->size) {
+			size = 0;
+			to -= subdev->size;
+			continue;
+		}
+
+		if (to + total_len > subdev->size)
+			size = subdev->size - to;
+		else
+			size = total_len;
+		wsize = size; /* store for future use */
+
+		entry_high = entry_low;
+		while (entry_high < count) {
+			if (size > vecs_copy[entry_high].iov_len)
+				size -= vecs_copy[entry_high++].iov_len;
+			else
+				break;
+		}
+
+		old_iov_len = vecs_copy[entry_high].iov_len;
+		vecs_copy[entry_high].iov_len = size;
+
+		if (!(subdev->flags & MTD_WRITEABLE))
+			err = -EROFS;
+		else if (eccbuf)
+			err = subdev->writev_ecc(subdev, &vecs_copy[entry_low],
+				entry_high - entry_low + 1, to, &retsize,
+				eccbuf, oobsel);
+		else
+			err = subdev->writev(subdev, &vecs_copy[entry_low],
+				entry_high - entry_low + 1, to, &retsize);
+
+		vecs_copy[entry_high].iov_len = old_iov_len - size;
+		vecs_copy[entry_high].iov_base = vecs_copy[entry_high].iov_base
+						+ size;
+
+		entry_low = entry_high;
+			
+		if (err)
+			break;
+
+		*retlen += retsize;
+		total_len -= wsize;
+		if (concat->mtd.type == MTD_NANDFLASH && eccbuf)
+			eccbuf += mtd->oobavail * (wsize / mtd->oobblock);
+
+		if (total_len == 0)
+			break;
+
+		err = -EINVAL;
+		to = 0;
+	}
+
+	kfree(vecs_copy);
+	return err;
+}
+
+static int
 concat_read_oob(struct mtd_info *mtd, loff_t from, size_t len,
 		size_t * retlen, u_char * buf)
 {
@@ -638,6 +755,58 @@
 	}
 }
 
+static int concat_block_isbad(struct mtd_info *mtd, loff_t ofs)
+{
+	struct mtd_concat *concat = CONCAT(mtd);
+	int i, res = 0;
+
+	if (!concat->subdev[0]->block_isbad)
+		return res;
+
+	if (ofs > mtd->size)
+		return -EINVAL;
+		
+	for (i = 0; i < concat->num_subdev; i++) {
+		struct mtd_info *subdev = concat->subdev[i];
+
+		if (ofs >= subdev->size) {
+			ofs -= subdev->size;
+			continue;
+		}
+
+		res = subdev->block_isbad(subdev, ofs);
+		break;
+	}
+
+	return res;
+}
+
+static int concat_block_markbad(struct mtd_info *mtd, loff_t ofs)
+{
+	struct mtd_concat *concat = CONCAT(mtd);
+	int i, err = -EINVAL;
+
+	if (!concat->subdev[0]->block_markbad)
+		return 0;
+
+	if (ofs > mtd->size)
+		return -EINVAL;
+
+	for (i = 0; i < concat->num_subdev; i++) {
+		struct mtd_info *subdev = concat->subdev[i];
+
+		if (ofs >= subdev->size) {
+			ofs -= subdev->size;
+			continue;
+		}
+
+		err = subdev->block_markbad(subdev, ofs);
+		break;
+	}
+
+	return err;
+}
+
 /*
  * This function constructs a virtual MTD device by concatenating
  * num_devs MTD devices. A pointer to the new device object is
@@ -687,10 +856,18 @@
 		concat->mtd.read_ecc = concat_read_ecc;
 	if (subdev[0]->write_ecc)
 		concat->mtd.write_ecc = concat_write_ecc;
+	if (subdev[0]->writev)
+		concat->mtd.writev = concat_writev;
+	if (subdev[0]->writev_ecc)
+		concat->mtd.writev_ecc = concat_writev_ecc;
 	if (subdev[0]->read_oob)
 		concat->mtd.read_oob = concat_read_oob;
 	if (subdev[0]->write_oob)
 		concat->mtd.write_oob = concat_write_oob;
+	if (subdev[0]->block_isbad)
+		concat->mtd.block_isbad = concat_block_isbad;
+	if (subdev[0]->block_markbad)
+		concat->mtd.block_markbad = concat_block_markbad;
 
 	concat->subdev[0] = subdev[0];
 
@@ -736,14 +913,13 @@
 
 	}
 
+	if(concat->mtd.type == MTD_NANDFLASH)
+		memcpy(&concat->mtd.oobinfo,
+			&subdev[0]->oobinfo,sizeof(struct nand_oobinfo));
+
 	concat->num_subdev = num_devs;
 	concat->mtd.name = name;
 
-	/*
-	 * NOTE: for now, we do not provide any readv()/writev() methods
-	 *       because they are messy to implement and they are not
-	 *       used to a great extent anyway.
-	 */
 	concat->mtd.erase = concat_erase;
 	concat->mtd.read = concat_read;
 	concat->mtd.write = concat_write;

--------------030106040602040802090002--
