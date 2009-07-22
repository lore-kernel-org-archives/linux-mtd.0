Received: from mba.ocn.ne.jp ([122.28.14.163] helo=smtp.mba.ocn.ne.jp)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MTdVm-00082E-Ky
	for linux-mtd@lists.infradead.org; Wed, 22 Jul 2009 15:13:47 +0000
Date: Thu, 23 Jul 2009 00:13:38 +0900 (JST)
Message-Id: <20090723.001338.27942898.anemo@mba.ocn.ne.jp>
To: vimal.newwork@gmail.com
Subject: Re: abuse of nand_correct_data in tmio_nand driver
From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
In-Reply-To: <ce9ab5790907220143t49d4afecr84a5c5e91833bc4a@mail.gmail.com>
References: <ce9ab5790907192215q148e194ale4a509112b1b40aa@mail.gmail.com>
	<20090722.002013.165864270.anemo@mba.ocn.ne.jp>
	<ce9ab5790907220143t49d4afecr84a5c5e91833bc4a@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: dbaryshkov@gmail.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 22 Jul 2009 14:13:30 +0530, vimal singh <vimal.newwork@gmail.co=
m> wrote:
> >> This can be handled by overriding 'chip->ecc.correct' in driver. Y=
ou
> >> may reuse 'nand_correct_data()' code in the driver of 256 byte sec=
tor
> >> ECC.
> >
> > Yes, the driver can reuse nand_ecc code to implement its own
> > nand_correct rountine.
> >
> > Or how about adding support for 6byte-ecc/512byte-data to nand_ecc.=
c
> > to avoid code duplication?
> >
> > I mean something like this. =A0If it looks acceptable, I will prepa=
re a
> > patch including similer change to nand_calculate_ecc.
> =

> I personally do not like any HW specific implementation going into th=
e
> generic part
> of the code. This particular issue is specific to your HW, so better
> handle it in the
> driver only.

OK, but I still feel duplicating nand_ecc code is not so good.  How
about splitting nand_correct_data into two parts?  A pure calculation
function and a wrapper for mtd interface.  Like this:

diff --git a/drivers/mtd/nand/nand_ecc.c b/drivers/mtd/nand/nand_ecc.c
index c0cb87d..3920896 100644
--- a/drivers/mtd/nand/nand_ecc.c
+++ b/drivers/mtd/nand/nand_ecc.c
@@ -425,14 +425,14 @@ EXPORT_SYMBOL(nand_calculate_ecc);
  *
  * Detect and correct a 1 bit error for 256/512 byte block
  */
-int nand_correct_data(struct mtd_info *mtd, unsigned char *buf,
-		      unsigned char *read_ecc, unsigned char *calc_ecc)
+int __nand_correct_data(unsigned char *buf,
+			unsigned char *read_ecc, unsigned char *calc_ecc,
+			unsigned int eccsize)
 {
 	unsigned char b0, b1, b2, bit_addr;
 	unsigned int byte_addr;
 	/* 256 or 512 bytes/ecc  */
-	const uint32_t eccsize_mult =3D
-			(((struct nand_chip *)mtd->priv)->ecc.size) >> 8;
+	const uint32_t eccsize_mult =3D eccsize >> 8;
 =

 	/*
 	 * b0 to b2 indicate which bit is faulty (if any)
@@ -495,6 +495,16 @@ int nand_correct_data(struct mtd_info *mtd, unsign=
ed char *buf,
 	printk(KERN_ERR "uncorrectable error : ");
 	return -1;
 }
+EXPORT_SYMBOL(__nand_correct_data);
+
+int nand_correct_data(struct mtd_info *mtd, unsigned char *buf,
+		      unsigned char *read_ecc, unsigned char *calc_ecc)
+{
+	const uint32_t eccsize_mult =3D
+			(((struct nand_chip *)mtd->priv)->ecc.size) >> 8;
+	return __nand_correct_data(buf, read_ecc, calc_ecc,
+				   ((struct nand_chip *)mtd->priv)->ecc.size);
+}
 EXPORT_SYMBOL(nand_correct_data);
 =

 MODULE_LICENSE("GPL");


There is a little bonus: the STANDALONE macro in nand_ecc.c can be
more useful with this change ;)

---
Atsushi Nemoto
