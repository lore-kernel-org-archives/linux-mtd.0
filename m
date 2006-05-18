Received: from hu-out-0102.google.com ([72.14.214.198])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Fgdbx-00010T-Pc
	for linux-mtd@lists.infradead.org; Thu, 18 May 2006 04:12:04 -0400
Received: by hu-out-0102.google.com with SMTP id 20so176248huc
	for <linux-mtd@lists.infradead.org>;
	Thu, 18 May 2006 01:11:55 -0700 (PDT)
Message-ID: <fe810cf0605180105y2f9652b8q1ec4f44b1228dbd0@mail.gmail.com>
Date: Thu, 18 May 2006 12:05:38 +0400
From: "Alexander Belyakov" <abelyako@googlemail.com>
To: "David Woodhouse" <dwmw2@infradead.org>
In-Reply-To: <1147881919.3875.24.camel@pmac.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <fe810cf0605170811i2229c718mbe6a69155f82c0ae@mail.gmail.com>
	<1147881431.3875.22.camel@pmac.infradead.org>
	<20060517160029.GA26351@wohnheim.fh-wedel.de>
	<1147881919.3875.24.camel@pmac.infradead.org>
Cc: Linux MTD mailing list <linux-mtd@lists.infradead.org>,
	=?ISO-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
Subject: Re: [PATCH] MTD: mtdconcat NAND/Sibley support (rev.2)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 5/17/06, David Woodhouse <dwmw2@infradead.org> wrote:
>
> Alexander, please send a further patch to make it build again, or I'll
> need to revert it entirely.
>

David, here is the same patch but without "writesize" usage for alignment c=
heck.


Signed-off-by: Alexander Belyakov <alexander.belyakov@intel.com>

-------
diff -uNr a/drivers/mtd/mtdconcat.c b/drivers/mtd/mtdconcat.c
--- a/drivers/mtd/mtdconcat.c=092006-04-07 20:56:47.000000000 +0400
+++ b/drivers/mtd/mtdconcat.c=092006-05-18 12:01:12.000000000 +0400
@@ -251,6 +251,106 @@
 }

 static int
+concat_writev_ecc(struct mtd_info *mtd, const struct kvec *vecs,
+=09=09unsigned long count, loff_t to, size_t * retlen,
+=09=09u_char *eccbuf, struct nand_oobinfo *oobsel)
+{
+=09struct mtd_concat *concat =3D CONCAT(mtd);
+=09struct kvec *vecs_copy;
+=09unsigned long entry_low, entry_high;
+=09size_t total_len =3D 0;
+=09int i;
+=09int err =3D -EINVAL;
+
+=09if (!(mtd->flags & MTD_WRITEABLE))
+=09=09return -EROFS;
+
+=09*retlen =3D 0;
+
+=09/* Calculate total length of data */
+=09for (i =3D 0; i < count; i++)
+=09=09total_len +=3D vecs[i].iov_len;
+
+=09/* Do not allow write past end of device */
+=09if ((to + total_len) > mtd->size)
+=09=09return -EINVAL;
+
+=09/* Check alignment */
+=09if (concat->mtd.type =3D=3D MTD_NANDFLASH)
+=09=09if ((to % mtd->oobblock) || (total_len % mtd->oobblock))
+=09=09=09return -EINVAL;
+
+=09/* make a copy of vecs */
+=09vecs_copy =3D kmalloc(sizeof(struct kvec) * count, GFP_KERNEL);
+=09if (!vecs_copy)
+=09=09return -ENOMEM;
+=09memcpy(vecs_copy, vecs, sizeof(struct kvec) * count);
+
+=09entry_low =3D 0;
+=09for (i =3D 0; i < concat->num_subdev; i++) {
+=09=09struct mtd_info *subdev =3D concat->subdev[i];
+=09=09size_t size, wsize, retsize, old_iov_len;
+
+=09=09if (to >=3D subdev->size) {
+=09=09=09to -=3D subdev->size;
+=09=09=09continue;
+=09=09}
+
+=09=09size =3D min(total_len, (size_t)(subdev->size - to));
+=09=09wsize =3D size; /* store for future use */
+
+=09=09entry_high =3D entry_low;
+=09=09while (entry_high < count) {
+=09=09=09if (size <=3D vecs_copy[entry_high].iov_len)
+=09=09=09=09break;
+=09=09=09size -=3D vecs_copy[entry_high++].iov_len;
+=09=09}
+
+=09=09old_iov_len =3D vecs_copy[entry_high].iov_len;
+=09=09vecs_copy[entry_high].iov_len =3D size;
+
+=09=09if (!(subdev->flags & MTD_WRITEABLE))
+=09=09=09err =3D -EROFS;
+=09=09else if (eccbuf)
+=09=09=09err =3D subdev->writev_ecc(subdev, &vecs_copy[entry_low],
+=09=09=09=09entry_high - entry_low + 1, to, &retsize,
+=09=09=09=09eccbuf, oobsel);
+=09=09else
+=09=09=09err =3D subdev->writev(subdev, &vecs_copy[entry_low],
+=09=09=09=09entry_high - entry_low + 1, to, &retsize);
+
+=09=09vecs_copy[entry_high].iov_len =3D old_iov_len - size;
+=09=09vecs_copy[entry_high].iov_base +=3D size;
+
+=09=09entry_low =3D entry_high;
+
+=09=09if (err)
+=09=09=09break;
+
+=09=09*retlen +=3D retsize;
+=09=09total_len -=3D wsize;
+=09=09if (concat->mtd.type =3D=3D MTD_NANDFLASH && eccbuf)
+=09=09=09eccbuf +=3D mtd->oobavail * (wsize / mtd->oobblock);
+
+=09=09if (total_len =3D=3D 0)
+=09=09=09break;
+
+=09=09err =3D -EINVAL;
+=09=09to =3D 0;
+=09}
+
+=09kfree(vecs_copy);
+=09return err;
+}
+
+static int
+concat_writev(struct mtd_info *mtd, const struct kvec *vecs,
+=09=09unsigned long count, loff_t to, size_t * retlen)
+{
+=09return concat_writev_ecc(mtd, vecs, count, to, retlen, NULL, NULL);
+}
+
+static int
 concat_read_oob(struct mtd_info *mtd, loff_t from, size_t len,
 =09=09size_t * retlen, u_char * buf)
 {
@@ -638,6 +738,58 @@
 =09}
 }

+static int concat_block_isbad(struct mtd_info *mtd, loff_t ofs)
+{
+=09struct mtd_concat *concat =3D CONCAT(mtd);
+=09int i, res =3D 0;
+
+=09if (!concat->subdev[0]->block_isbad)
+=09=09return res;
+
+=09if (ofs > mtd->size)
+=09=09return -EINVAL;
+
+=09for (i =3D 0; i < concat->num_subdev; i++) {
+=09=09struct mtd_info *subdev =3D concat->subdev[i];
+
+=09=09if (ofs >=3D subdev->size) {
+=09=09=09ofs -=3D subdev->size;
+=09=09=09continue;
+=09=09}
+
+=09=09res =3D subdev->block_isbad(subdev, ofs);
+=09=09break;
+=09}
+
+=09return res;
+}
+
+static int concat_block_markbad(struct mtd_info *mtd, loff_t ofs)
+{
+=09struct mtd_concat *concat =3D CONCAT(mtd);
+=09int i, err =3D -EINVAL;
+
+=09if (!concat->subdev[0]->block_markbad)
+=09=09return 0;
+
+=09if (ofs > mtd->size)
+=09=09return -EINVAL;
+
+=09for (i =3D 0; i < concat->num_subdev; i++) {
+=09=09struct mtd_info *subdev =3D concat->subdev[i];
+
+=09=09if (ofs >=3D subdev->size) {
+=09=09=09ofs -=3D subdev->size;
+=09=09=09continue;
+=09=09}
+
+=09=09err =3D subdev->block_markbad(subdev, ofs);
+=09=09break;
+=09}
+
+=09return err;
+}
+
 /*
  * This function constructs a virtual MTD device by concatenating
  * num_devs MTD devices. A pointer to the new device object is
@@ -687,10 +839,18 @@
 =09=09concat->mtd.read_ecc =3D concat_read_ecc;
 =09if (subdev[0]->write_ecc)
 =09=09concat->mtd.write_ecc =3D concat_write_ecc;
+=09if (subdev[0]->writev)
+=09=09concat->mtd.writev =3D concat_writev;
+=09if (subdev[0]->writev_ecc)
+=09=09concat->mtd.writev_ecc =3D concat_writev_ecc;
 =09if (subdev[0]->read_oob)
 =09=09concat->mtd.read_oob =3D concat_read_oob;
 =09if (subdev[0]->write_oob)
 =09=09concat->mtd.write_oob =3D concat_write_oob;
+=09if (subdev[0]->block_isbad)
+=09=09concat->mtd.block_isbad =3D concat_block_isbad;
+=09if (subdev[0]->block_markbad)
+=09=09concat->mtd.block_markbad =3D concat_block_markbad;

 =09concat->subdev[0] =3D subdev[0];

@@ -736,14 +896,13 @@

 =09}

+=09if(concat->mtd.type =3D=3D MTD_NANDFLASH)
+=09=09memcpy(&concat->mtd.oobinfo, &subdev[0]->oobinfo,
+=09=09=09sizeof(struct nand_oobinfo));
+
 =09concat->num_subdev =3D num_devs;
 =09concat->mtd.name =3D name;

-=09/*
-=09 * NOTE: for now, we do not provide any readv()/writev() methods
-=09 *       because they are messy to implement and they are not
-=09 *       used to a great extent anyway.
-=09 */
 =09concat->mtd.erase =3D concat_erase;
 =09concat->mtd.read =3D concat_read;
 =09concat->mtd.write =3D concat_write;
