Received: from thoth.sbs.de ([192.35.17.2])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Hh63Z-0002XR-MZ
	for linux-mtd@lists.infradead.org; Thu, 26 Apr 2007 11:38:55 -0400
Received: from mail3.siemens.de (localhost [127.0.0.1])
	by thoth.sbs.de (8.12.6/8.12.6) with ESMTP id l3QFcEgu026934
	for <linux-mtd@lists.infradead.org>; Thu, 26 Apr 2007 17:38:14 +0200
Received: from mchp771a.ww002.siemens.net (mchp771a.ww002.siemens.net
	[139.25.131.189])
	by mail3.siemens.de (8.12.6/8.12.6) with ESMTP id l3QFcEYA031119
	for <linux-mtd@lists.infradead.org>; Thu, 26 Apr 2007 17:38:14 +0200
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
Subject: NAND bad block checking when no memory based BBT is available
Date: Thu, 26 Apr 2007 17:38:13 +0200
Message-ID: <2EDADF4ED023F04BAD4D7A4131ECEB930105514A@mchp7rfa.ww002.siemens.net>
From: "Knobloch, Thomas" <knobloch@siemens.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I'm using the MTD code as part of the u-boot Bootloader. I implemented
a NAND device that is not generating a bad block table at all. The
reason for that this decreases boot time of our device. So every
time the code checks for a bad block it actually reads the OOB data
from the device directly.

This is done in function nand_block_checkbad() in file
drivers/mtd/nand/nand_base.c:

static int nand_block_checkbad(struct mtd_info *mtd, loff_t ofs, int
getchip,
			       int allowbbt)
{
	struct nand_chip *chip =3D mtd->priv;

	if (!chip->bbt)
		return chip->block_bad(mtd, ofs, getchip);

	/* Return info from the table */
	return nand_isbad_bbt(mtd, ofs, allowbbt);
}



If no BBT is available (as in our implementation) the function will
call chip->bad_block() whose default implementation is
nand_block_bad() in nand_base.c:

static int nand_block_bad(struct mtd_info *mtd, loff_t ofs, int getchip)
{
	int page, chipnr, res =3D 0;
	struct nand_chip *chip =3D mtd->priv;
	u16 bad;

	if (getchip) {
		page =3D (int)(ofs >> chip->page_shift);
		chipnr =3D (int)(ofs >> chip->chip_shift);

		nand_get_device(chip, mtd, FL_READING);

		/* Select the NAND device */
		chip->select_chip(mtd, chipnr);
	} else
		page =3D (int)ofs;


	...

}


The interesting thing is that the page number is calculated
differently depending on the parameter getchip. With getchip set to
one it will shift the offset to get the page number. With getchip set
to zero it will not. This really leads to the situation where the page
number is calculated wrong. Function nand_erase_nand() in nand_base.c
calls nand_block_bad() with getchip=3D0. However it also shifts the page
number to the left before calling this function:

int nand_erase_nand(struct mtd_info *mtd, struct erase_info *instr,
		    int allowbbt)
{
	...

		/*
		 * heck if we have a bad block, we do not erase bad
blocks !
		 */
		if (nand_block_checkbad(mtd, ((loff_t) page) <<
					chip->page_shift, 0, allowbbt))
{
			printk(KERN_WARNING "nand_erase: attempt to
erase a "
			       "bad block at page 0x%08x\n", page);
			...
		}

	...
}


By doing so the code will check for the wrong page number as the offset
is not shifted back to the right in nand_block_bad(). I clearly
see that our bootloader will check the wrong page number/offset in
the case that the NAND driver does not generate a BBT.

Do you think there is some problem with this code or am I missing some
point.

Thanks & regards,
Thomas
