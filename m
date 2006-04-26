Received: from mga03.intel.com ([143.182.124.21] helo=azsmga101-1.ch.intel.com)
	by canuck.infradead.org with esmtp (Exim 4.61 #1 (Red Hat Linux))
	id 1FYiNc-00082F-C9
	for linux-mtd@lists.infradead.org; Wed, 26 Apr 2006 07:40:33 -0400
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 26 Apr 2006 15:36:08 +0400
Message-ID: <F048F58F304F0040BC3E937DE4E231E701F5D409@NNSMSX401>
From: "Belyakov, Alexander" <alexander.belyakov@intel.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] MTD: mtdconcat NAND/Sibley support
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

JFFS2 (and not only JFFS2) does not work on top of concatenated MTD
device in case of NAND and Sibley chips due to missing
concat_block_isbad(), concat_block_markbad(), concat_writev() and
concat_writev_ecc() functions. If anyone cares - the patch below fixes
that issue.


---

diff -uNr a/drivers/mtd/mtdconcat.c b/drivers/mtd/mtdconcat.c
--- a/drivers/mtd/mtdconcat.c	2006-04-07 20:56:47.000000000 +0400
+++ b/drivers/mtd/mtdconcat.c	2006-04-26 15:26:21.000000000 +0400
@@ -141,6 +141,97 @@
 }
=20
 static int
+concat_writev (struct mtd_info *mtd, const struct kvec *vecs, unsigned
long count,=20
+		loff_t to, size_t * retlen)
+{
+	int i, page, len, total_len, ret =3D 0, written =3D 0, cnt =3D 0,
towrite;
+	u_char *bufstart;
+	char* data_poi;
+	char* data_buf;
+	loff_t write_offset;
+	int rl_wr;
+	u_int32_t pagesize;
+
+	if (mtd->flags & MTD_PROGRAM_REGIONS) {
+		pagesize =3D MTD_PROGREGION_SIZE(mtd);
+	} else {
+		pagesize =3D mtd->oobblock;
+	}
+   =20
+	data_buf =3D kmalloc(pagesize, GFP_KERNEL);
+
+	/* Preset written len for early exit */
+	*retlen =3D 0;
+
+	/* Calculate total length of data */
+	total_len =3D 0;
+	for (i =3D 0; i < count; i++)
+		total_len +=3D (int) vecs[i].iov_len;
+
+	/* Do not allow write past end of page */
+	if ((to + total_len) > mtd->size) {
+		kfree(data_buf);
+		return -EINVAL;
+	}
+
+	/* Setup start page */
+	page =3D ((int) to) / pagesize;
+	towrite =3D (page + 1) * pagesize - to;
+	write_offset =3D to;
+	written =3D 0;
+=09
+	/* Loop until all iovecs' data has been written */
+	len =3D 0;
+	while (len < total_len) {
+    		bufstart =3D (u_char *)vecs->iov_base;
+		bufstart +=3D written;
+		data_poi =3D bufstart;
+
+    		/* If the given tuple is >=3D reet of page then
+		 * write it out from the iov
+		 */
+		if ( (vecs->iov_len-written) >=3D towrite) {
+			ret =3D mtd->write(mtd, write_offset, towrite,
&rl_wr, data_poi);
+			if(ret)
+	    			break;
+			len +=3D towrite;
+			page ++;
+			write_offset =3D page * pagesize;
+			towrite =3D pagesize;
+			written +=3D towrite;
+			if (vecs->iov_len  =3D=3D written) {
+				vecs ++;
+				written =3D 0;
+			}
+		} else {
+			cnt =3D 0;
+			while (cnt < towrite ) {
+				data_buf[cnt++] =3D ((u_char *)
vecs->iov_base)[written++];
+				if (vecs->iov_len =3D=3D written ) {
+					if((cnt+len) =3D=3D total_len )
+						break;
+					vecs ++;
+					written =3D 0;
+				}
+			}
+			data_poi =3D data_buf;
+			ret =3D mtd->write(mtd, write_offset, cnt, &rl_wr,
data_poi);
+			if (ret)
+				break;
+			len +=3D cnt;
+			page ++;
+			write_offset =3D page * pagesize;
+			towrite =3D pagesize;
+		}
+	}
+
+	if(retlen)
+		*retlen =3D len;
+	kfree(data_buf);
+	return ret;
+}
+
+static int
 concat_read_ecc(struct mtd_info *mtd, loff_t from, size_t len,
 		size_t * retlen, u_char * buf, u_char * eccbuf,
 		struct nand_oobinfo *oobsel)
@@ -251,6 +342,123 @@
 }
=20
 static int
+concat_writev_ecc (struct mtd_info *mtd, const struct kvec *vecs,
unsigned long count,=20
+		loff_t to, size_t * retlen, u_char *eccbuf, struct
nand_oobinfo *oobsel)
+{
+	int i, page, len, total_len, ret =3D 0, written =3D 0, cnt =3D 0,
towrite;
+	u_char *bufstart;
+	char* data_poi;
+	char* data_buf;
+	loff_t write_offset;
+	int rl_wr;
+	u_int32_t pagesize;
+
+	if (mtd->flags & MTD_PROGRAM_REGIONS) {
+		pagesize =3D MTD_PROGREGION_SIZE(mtd);
+	} else {
+		pagesize =3D mtd->oobblock;
+	}
+   =20
+	data_buf =3D kmalloc(pagesize, GFP_KERNEL);
+   =20
+	if (!(mtd->flags & MTD_WRITEABLE))
+		return -EROFS;
+
+	/* Preset written len for early exit */
+	*retlen =3D 0;
+
+	/* Calculate total length of data */
+	total_len =3D 0;
+	for (i =3D 0; i < count; i++)
+		total_len +=3D (int) vecs[i].iov_len;
+
+	/* check if no data is going to be written */
+	if (!total_len) {
+		kfree(data_buf);
+		return 0;
+	}
+
+	/* Do not allow write past end of page */
+	if ((to + total_len) > mtd->size) {
+		DEBUG (MTD_DEBUG_LEVEL0, "concat_writev_ecc(): Attempted
write past end of device\n");
+		kfree(data_buf);
+		return -EINVAL;
+	}
+   =20
+	/* Check alignment */
+	if ((to & (pagesize - 1)) || (total_len & (pagesize - 1))) {
+		DEBUG (MTD_DEBUG_LEVEL0, "concat_writev_ecc(): Attempted
write not aligned data!\n");
+		kfree(data_buf);
+		return -EINVAL;
+	}
+   =20
+	/* Setup start page. Notaligned data is not allowed for
write_ecc. */
+	page =3D ((int) to) / pagesize;
+	towrite =3D (page + 1) * pagesize - to;
+	write_offset =3D to;
+	written =3D 0;=20
+	/* Loop until all iovecs' data has been written */
+	len =3D 0;
+	while (len < total_len) {
+		bufstart =3D (u_char *)vecs->iov_base;
+		bufstart +=3D written;
+		data_poi =3D bufstart;
+
+	        /* If the given tuple is >=3D reet of page then
+		* write it out from the iov
+		*/
+		if ( (vecs->iov_len-written) >=3D towrite) {
+			ret =3D mtd->write_ecc(mtd, write_offset, towrite,
+						&rl_wr, data_poi,
eccbuf, oobsel);
+			if (ret)
+	    			break;
+			len +=3D towrite;
+			page ++;
+			write_offset =3D page * pagesize;
+			towrite =3D pagesize;
+			written +=3D towrite;
+			if (vecs->iov_len  =3D=3D written) {
+	    			vecs ++;
+	    			written =3D 0;
+	    		}
+	   =20
+			if(eccbuf)
+				eccbuf +=3D mtd->oobavail;
+		} else {
+			cnt =3D 0;
+			while (cnt < towrite ) {
+				data_buf[cnt++] =3D ((u_char *)
vecs->iov_base)[written++];
+	    			if (vecs->iov_len =3D=3D written ) {
+					if ((cnt+len) =3D=3D total_len )
+						break;
+					vecs ++;
+					written =3D 0;
+				}
+			}
+		=09
+			data_poi =3D data_buf;
+			ret =3D mtd->write_ecc(mtd, write_offset, cnt,=20
+						&rl_wr, data_poi,
eccbuf, oobsel);
+			if (ret)
+				break;
+			len +=3D cnt;
+			page ++;
+			write_offset =3D page * pagesize;
+			towrite =3D pagesize;
+	   =20
+			if(eccbuf)
+				eccbuf +=3D mtd->oobavail;
+		}
+	}
+
+	if(retlen)
+		*retlen =3D len;
+	kfree(data_buf);
+   =20
+	return ret;
+}
+
+static int
 concat_read_oob(struct mtd_info *mtd, loff_t from, size_t len,
 		size_t * retlen, u_char * buf)
 {
@@ -638,6 +846,60 @@
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
@@ -685,12 +947,18 @@
 	concat->mtd.eccsize =3D subdev[0]->eccsize;
 	if (subdev[0]->read_ecc)
 		concat->mtd.read_ecc =3D concat_read_ecc;
-	if (subdev[0]->write_ecc)
+	if (subdev[0]->write_ecc) {
 		concat->mtd.write_ecc =3D concat_write_ecc;
+		concat->mtd.writev_ecc =3D concat_writev_ecc;
+	}
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
@@ -736,17 +1004,16 @@
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
+	concat->mtd.writev =3D concat_writev;
 	concat->mtd.sync =3D concat_sync;
 	concat->mtd.lock =3D concat_lock;
 	concat->mtd.unlock =3D concat_unlock;

--
Thanks,
Alexander Belyakov

-------
The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent=20
Intel's position on the issue
