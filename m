Received: from mba.ocn.ne.jp ([122.28.14.163] helo=smtp.mba.ocn.ne.jp)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MTH8Y-00073d-2H
	for linux-mtd@lists.infradead.org; Tue, 21 Jul 2009 15:20:19 +0000
Date: Wed, 22 Jul 2009 00:20:13 +0900 (JST)
Message-Id: <20090722.002013.165864270.anemo@mba.ocn.ne.jp>
To: vimal.newwork@gmail.com
Subject: Re: abuse of nand_correct_data in tmio_nand driver
From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
In-Reply-To: <ce9ab5790907192215q148e194ale4a509112b1b40aa@mail.gmail.com>
References: <20090720.001426.102579925.anemo@mba.ocn.ne.jp>
	<bc64b4640907190908m209572e8od16ac648f19503e@mail.gmail.com>
	<ce9ab5790907192215q148e194ale4a509112b1b40aa@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: dbaryshkov@gmail.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 20 Jul 2009 10:45:20 +0530, vimal singh <vimal.newwork@gmail.com> wrote:
> Seems like this driver may be reading 512 bytes at a times, but still
> calculates 256-byte sector ECC. (1-bit error correction for each 256
> bytes of data).
> In that case, nand_correct_data() should be called twice, once for
> each 256 byte data.

But unfortunately nand_correct_data() cannot be used as is because it
depends on chip->ecc.size (which is 512 for tmio_nand driver).

> This can be handled by overriding 'chip->ecc.correct' in driver. You
> may reuse 'nand_correct_data()' code in the driver of 256 byte sector
> ECC.

Yes, the driver can reuse nand_ecc code to implement its own
nand_correct rountine.

Or how about adding support for 6byte-ecc/512byte-data to nand_ecc.c
to avoid code duplication?

I mean something like this.  If it looks acceptable, I will prepare a
patch including similer change to nand_calculate_ecc.

diff --git a/drivers/mtd/nand/nand_ecc.c b/drivers/mtd/nand/nand_ecc.c
index c0cb87d..77e13c8 100644
--- a/drivers/mtd/nand/nand_ecc.c
+++ b/drivers/mtd/nand/nand_ecc.c
@@ -425,14 +425,12 @@ EXPORT_SYMBOL(nand_calculate_ecc);
  *
  * Detect and correct a 1 bit error for 256/512 byte block
  */
-int nand_correct_data(struct mtd_info *mtd, unsigned char *buf,
-		      unsigned char *read_ecc, unsigned char *calc_ecc)
+static int nand_correct_data_sub(unsigned char *buf,
+	unsigned char *read_ecc, unsigned char *calc_ecc,
+	const uint32_t eccsize_mult)
 {
 	unsigned char b0, b1, b2, bit_addr;
 	unsigned int byte_addr;
-	/* 256 or 512 bytes/ecc  */
-	const uint32_t eccsize_mult =
-			(((struct nand_chip *)mtd->priv)->ecc.size) >> 8;
 
 	/*
 	 * b0 to b2 indicate which bit is faulty (if any)
@@ -495,6 +493,26 @@ int nand_correct_data(struct mtd_info *mtd, unsigned char *buf,
 	printk(KERN_ERR "uncorrectable error : ");
 	return -1;
 }
+int nand_correct_data(struct mtd_info *mtd, unsigned char *buf,
+		      unsigned char *read_ecc, unsigned char *calc_ecc)
+{
+	struct nand_chip *chip = mtd->priv;
+	/* 256 or 512 bytes/ecc  */
+	const uint32_t eccsize_mult = (chip->ecc.size) >> 8;
+	int r0, r1;
+
+	if (eccsize_mult == 2 && chip->ecc.bytes == 6) {
+		r0 = nand_correct_data_sub(buf, read_ecc, calc_ecc, 1);
+		if (r0 < 0)
+			return r0;
+		r1 = nand_correct_data_sub(buf + 256,
+					   read_ecc + 3, calc_ecc + 3, 1);
+		if (r1 < 0)
+			return r1;
+		return r0 | r1;
+	}
+	return nand_correct_data_sub(buf, read_ecc, calc_ecc, eccsize_mult);
+}
 EXPORT_SYMBOL(nand_correct_data);
 
 MODULE_LICENSE("GPL");
