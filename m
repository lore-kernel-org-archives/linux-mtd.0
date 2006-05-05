Received: from mga01.intel.com ([192.55.52.88] helo=fmsmga101-1.fm.intel.com)
	by canuck.infradead.org with esmtp (Exim 4.61 #1 (Red Hat Linux))
	id 1Fbz6j-0007t5-CW
	for linux-mtd@lists.infradead.org; Fri, 05 May 2006 08:08:35 -0400
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 5 May 2006 16:08:21 +0400
Message-ID: <F048F58F304F0040BC3E937DE4E231E701F9F027@NNSMSX401>
From: "Belyakov, Alexander" <alexander.belyakov@intel.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] MTD: mtdconcat NAND/Sibley support (revised)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

My previous message did not appear in mailing list. So I repost it.

This patch adds concat_writev(), concat_writev_ecc(),
concat_block_isbad(), concat_block_markbad() functions to make
concatenation layer compatible with Sibley and NAND chips.

The patch has been changed to use writev() functions of underlying
devices.

It has been verified on both Sibley and NAND before posting.


Signed-off-by: Alexander Belyakov <alexander.belyakov@intel.com>

-------

diff -uNr a/drivers/mtd/mtdconcat.c b/drivers/mtd/mtdconcat.c
--- a/drivers/mtd/mtdconcat.c	2006-04-07 20:56:47.000000000 +0400
+++ b/drivers/mtd/mtdconcat.c	2006-05-04 12:41:19.000000000 +0400
@@ -45,6 +45,13 @@
 #define CONCAT(x)  ((struct mtd_concat *)(x))
=20
 /*
+ * Forward function declaration
+ */
+static int
+concat_writev_ecc (struct mtd_info *mtd, const struct kvec *vecs,
unsigned long count,=20
+		loff_t to, size_t * retlen, u_char *eccbuf, struct
nand_oobinfo *oobsel);
+
+/*
  * MTD methods which look up the relevant subdevice, translate the
  * effective address and pass through to the subdevice.
  */
@@ -140,6 +147,14 @@
 	return err;
 }
=20
+
+static int
+concat_writev (struct mtd_info *mtd, const struct kvec *vecs, unsigned
long count,=20
+		loff_t to, size_t * retlen)
+{
+	return (concat_writev_ecc(mtd, vecs, count, to, retlen, NULL,
NULL));
+}
+
 static int
 concat_read_ecc(struct mtd_info *mtd, loff_t from, size_t len,
 		size_t * retlen, u_char * buf, u_char * eccbuf,
@@ -251,6 +266,107 @@
 }
=20
 static int
+concat_writev_ecc (struct mtd_info *mtd, const struct kvec *vecs,
unsigned long count,=20
+		loff_t to, size_t * retlen, u_char *eccbuf, struct
nand_oobinfo *oobsel)
+{
+	struct mtd_concat *concat =3D CONCAT(mtd);
+	struct kvec *vecs_copy;
+	unsigned long entry_low, entry_high;
+	size_t total_len =3D 0;
+	int i;
+	int err =3D -EINVAL;
+=09
+	if (!(mtd->flags & MTD_WRITEABLE))
+		return -EROFS;
+
+	*retlen =3D 0;
+
+	/* Calculate total length of data */
+	for (i =3D 0; i < count; i++)
+		total_len +=3D vecs[i].iov_len;
+	=09
+	/* Do not allow write past end of page */
+	if ((to + total_len) > mtd->size) {
+		DEBUG (MTD_DEBUG_LEVEL0, "concat_writev_ecc(): Attempted
write past end of device\n");
+		return -EINVAL;
+	}
+   =20
+	/* Check alignment */
+	if (concat->mtd.type =3D=3D MTD_NANDFLASH) {
+    		if ((to & (mtd->oobblock - 1)) || (total_len &
(mtd->oobblock - 1))) {
+			DEBUG (MTD_DEBUG_LEVEL0, "concat_writev_ecc():
Attempted write not aligned data!\n");
+			return -EINVAL;
+		}
+	}
+=09
+	/* make a copy of vecs */
+	vecs_copy =3D kmalloc(sizeof(struct kvec) * count, GFP_KERNEL);
+	if (!vecs_copy)
+		return -ENOMEM;
+	memcpy(vecs_copy, vecs, sizeof(struct kvec) * count);
+
+	entry_low =3D 0;
+	for (i =3D 0; i < concat->num_subdev; i++) {
+		struct mtd_info *subdev =3D concat->subdev[i];
+		size_t size, wsize, retsize, old_iov_len;
+
+		if (to >=3D subdev->size) {
+			size =3D 0;
+			to -=3D subdev->size;
+			continue;
+		}
+	=09
+		if (to + total_len > subdev->size)
+			size =3D subdev->size - to;
+		else
+			size =3D total_len;
+		wsize =3D size; /* store for future use */
+
+		entry_high =3D entry_low;
+		while (entry_high < count) {
+			if (size > vecs_copy[entry_high].iov_len)
+				size -=3D vecs_copy[entry_high++].iov_len;
+			else
+				break;
+		}
+	=09
+		old_iov_len =3D vecs_copy[entry_high].iov_len;
+		vecs_copy[entry_high].iov_len =3D size;
+	=09
+		if (!(subdev->flags & MTD_WRITEABLE))
+			err =3D -EROFS;
+		else if (eccbuf)
+			err =3D subdev->writev_ecc(subdev,
&vecs_copy[entry_low],
+				entry_high - entry_low + 1, to,
&retsize, eccbuf, oobsel);
+		else
+			err =3D subdev->writev(subdev,
&vecs_copy[entry_low],
+				entry_high - entry_low + 1, to,
&retsize);
+
+		vecs_copy[entry_high].iov_len =3D old_iov_len - size;
+		vecs_copy[entry_high].iov_base =3D (void *)((u_char
*)vecs_copy[entry_high].iov_base + size);
+	=09
+		entry_low =3D entry_high;
+		=09
+		if (err)
+			break;
+
+		*retlen +=3D retsize;
+		total_len -=3D wsize;
+		if (concat->mtd.type =3D=3D MTD_NANDFLASH && eccbuf)
+			eccbuf +=3D mtd->oobavail * (wsize /
mtd->oobblock);
+
+		if (total_len =3D=3D 0)
+			break;
+
+		err =3D -EINVAL;
+		to =3D 0;
+	}
+=09
+	kfree(vecs_copy);
+	return err;
+}
+
+static int
 concat_read_oob(struct mtd_info *mtd, loff_t from, size_t len,
 		size_t * retlen, u_char * buf)
 {
@@ -638,6 +754,60 @@
 	}
 }
=20
+static int concat_block_isbad(struct mtd_info *mtd, loff_t ofs)
+{
+	struct mtd_concat *concat =3D CONCAT(mtd);
+	int i, res =3D 0;
+=09
+	if (!concat->subdev[0]->block_isbad)
+		return res;
+
+	if (ofs > mtd->size)
+		return -EINVAL;
+	=09
+	for (i =3D 0; i < concat->num_subdev; i++) {
+		struct mtd_info *subdev =3D concat->subdev[i];
+
+		if (ofs >=3D subdev->size) {
+			ofs -=3D subdev->size;
+			continue;
+		}
+	=09
+		res =3D subdev->block_isbad(subdev, ofs);
+
+		break;
+	}
+
+	return res;
+}
+
+static int concat_block_markbad(struct mtd_info *mtd, loff_t ofs)
+{
+	struct mtd_concat *concat =3D CONCAT(mtd);
+	int i, err =3D -EINVAL;
+=09
+	if (!concat->subdev[0]->block_markbad)
+		return 0;
+
+	if (ofs > mtd->size)
+		return -EINVAL;
+	=09
+	for (i =3D 0; i < concat->num_subdev; i++) {
+		struct mtd_info *subdev =3D concat->subdev[i];
+
+		if (ofs >=3D subdev->size) {
+			ofs -=3D subdev->size;
+			continue;
+		}
+	=09
+		err =3D subdev->block_markbad(subdev, ofs);
+
+		break;
+	}
+
+	return err;
+}
+
 /*
  * This function constructs a virtual MTD device by concatenating
  * num_devs MTD devices. A pointer to the new device object is
@@ -687,10 +857,18 @@
 		concat->mtd.read_ecc =3D concat_read_ecc;
 	if (subdev[0]->write_ecc)
 		concat->mtd.write_ecc =3D concat_write_ecc;
+	if (subdev[0]->writev)
+		concat->mtd.writev =3D concat_writev;
+	if (subdev[0]->writev_ecc)
+		concat->mtd.writev_ecc =3D concat_writev_ecc;
 	if (subdev[0]->read_oob)
 		concat->mtd.read_oob =3D concat_read_oob;
 	if (subdev[0]->write_oob)
 		concat->mtd.write_oob =3D concat_write_oob;
+	if (subdev[0]->block_isbad)
+		concat->mtd.block_isbad =3D concat_block_isbad;
+	if (subdev[0]->block_markbad)
+		concat->mtd.block_markbad =3D concat_block_markbad;
=20
 	concat->subdev[0] =3D subdev[0];
=20
@@ -736,14 +914,12 @@
=20
 	}
=20
+	if(concat->mtd.type =3D=3D MTD_NANDFLASH)
+
memcpy(&concat->mtd.oobinfo,&subdev[0]->oobinfo,sizeof(struct
nand_oobinfo));
+
 	concat->num_subdev =3D num_devs;
 	concat->mtd.name =3D name;
=20
-	/*
-	 * NOTE: for now, we do not provide any readv()/writev() methods
-	 *       because they are messy to implement and they are not
-	 *       used to a great extent anyway.
-	 */
 	concat->mtd.erase =3D concat_erase;
 	concat->mtd.read =3D concat_read;
 	concat->mtd.write =3D concat_write;



-------
The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here
in no way represent Intel's position on the issue
