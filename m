Received: from thoth.sbs.de ([192.35.17.2])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HjDj4-0002El-Tk
	for linux-mtd@lists.infradead.org; Wed, 02 May 2007 08:14:36 -0400
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: AW: [PATCH] [MTD] NAND: Wrong calculation of page number
	innand_block_bad()
Date: Wed, 2 May 2007 14:14:25 +0200
Message-ID: <2EDADF4ED023F04BAD4D7A4131ECEB93010554E3@mchp7rfa.ww002.siemens.net>
In-Reply-To: <1177693431.25960.123.camel@localhost.localdomain>
References: <2EDADF4ED023F04BAD4D7A4131ECEB930105527C@mchp7rfa.ww002.siemens.net>
	<1177693431.25960.123.camel@localhost.localdomain>
From: "Knobloch, Thomas" <knobloch@siemens.com>
To: <linux-mtd@lists.infradead.org>
Cc: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2007-04-27 at 19:04, Thomas Gleixner wrote:
> Can you please make this outside the else path, so we can remove same
> code in the if (getchip) path.
>=20
> Please also apply the pagemask right there so we don't have it in both
> cmdfunc() calls.

I added the requested code cleanup to the original patch:

diff -auNr a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
--- a/drivers/mtd/nand/nand_base.c	2007-04-27 12:44:23.000000000
+0200
+++ b/drivers/mtd/nand/nand_base.c	2007-05-02 13:19:19.080023100
+0200
@@ -303,28 +303,27 @@
 	struct nand_chip *chip =3D mtd->priv;
 	u16 bad;
=20
+	page =3D (int)(ofs >> chip->page_shift) & chip->pagemask;
+
 	if (getchip) {
-		page =3D (int)(ofs >> chip->page_shift);
 		chipnr =3D (int)(ofs >> chip->chip_shift);
=20
 		nand_get_device(chip, mtd, FL_READING);
=20
 		/* Select the NAND device */
 		chip->select_chip(mtd, chipnr);
-	} else
-		page =3D (int)ofs;
+	}
=20
 	if (chip->options & NAND_BUSWIDTH_16) {
 		chip->cmdfunc(mtd, NAND_CMD_READOOB, chip->badblockpos &
0xFE,
-			      page & chip->pagemask);
+			      page);
 		bad =3D cpu_to_le16(chip->read_word(mtd));
 		if (chip->badblockpos & 0x1)
 			bad >>=3D 8;
 		if ((bad & 0xFF) !=3D 0xff)
 			res =3D 1;
 	} else {
-		chip->cmdfunc(mtd, NAND_CMD_READOOB, chip->badblockpos,
-			      page & chip->pagemask);
+		chip->cmdfunc(mtd, NAND_CMD_READOOB, chip->badblockpos,
page);
 		if (chip->read_byte(mtd) !=3D 0xff)
 			res =3D 1;
 	}
