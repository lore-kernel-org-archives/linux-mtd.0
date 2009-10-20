Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N0EVO-0002nA-KM
	for linux-mtd@lists.infradead.org; Tue, 20 Oct 2009 13:12:04 +0000
Date: Tue, 20 Oct 2009 15:11:58 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: About the mxc nand driver
Message-ID: <20091020131157.GR8818@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: Vladimir Barinov <vova.barinov@gmail.com>, mathieu.berland@eads.com,
	Juergen Beisert <jbe@pengutronix.de>, Robert Schwebel <rsc@pengutronix.de>,
	Eric Benard <ebenard@eukrea.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I frequently get reports about bugs in the Freescale mxc nand driver.
Juergen Beisert and me invested some time to see what's going on in this
driver, so here are some results.

> 
> /* OOB placement block for use with hardware ecc generation */
> static struct nand_ecclayout nand_hw_eccoob_8 = {
> 	.eccbytes = 5,
> 	.eccpos = {6, 7, 8, 9, 10},
> 	.oobfree = {{0, 5}, {11, 5}, }
> };
> 
> static struct nand_ecclayout nand_hw_eccoob_16 = {
> 	.eccbytes = 5,
> 	.eccpos = {6, 7, 8, 9, 10},
> 	.oobfree = {{0, 5}, {11, 5}, }
> };
> 
> static struct nand_ecclayout nand_hw_eccoob_64 = {
> 	.eccbytes = 20,
> 	.eccpos = {6, 7, 8, 9, 10, 22, 23, 24, 25, 26,
> 		   38, 39, 40, 41, 42, 54, 55, 56, 57, 58},
> 	.oobfree = {{2, 4}, {11, 10}, {27, 10}, {43, 10}, {59, 5}, }
> };
> 
> 
> /* Define some generic bad / good block scan pattern which are used
>  * while scanning a device for factory marked good / bad blocks. */
> static uint8_t scan_ff_pattern[] = { 0xff, 0xff };
> 
> static struct nand_bbt_descr smallpage_memorybased = {
> 	.options = NAND_BBT_SCAN2NDPAGE,
> 	.offs = 5,
> 	.len = 1,
> 	.pattern = scan_ff_pattern
> };

This has been introduced by Eric Benard. He said he needs this to make
the driver work on 2k flashes because otherwise all blocks on his nand
are marked as bad. Could it be that Eric somehow destroyed his oob data?
Without this largepage_memorybased would be used which has .offs = 0, .len = 2.
When Eric does not have 0xff,0xff here (but really *should* have, but
has used a broken driver some time ago) all blocks would be marked as bad.

Looking at it, the original Freescale driver passes .offset = 0, length = 5
to the 2k ecclayout, so jffs2 will probably overwrite bytes 0 and 1.
This does not hurt the Freescale driver since it uses a flash based
bbt but breaks when he starts using the Mainline driver which does not
use a flash based bbt.

> 
> 	if (this->ecc.mode == NAND_ECC_HW) {
> 		switch (mtd->oobsize) {
> 		case 8:
> 			this->ecc.layout = &nand_hw_eccoob_8;


This has been introduced by Vladimir Barinov and seems wrong. The
original Freescale driver has a nand_hw_eccoob_8 and a
nand_hw_eccoob_16, but it is used for 8bit bus width vs. 16bit bus width
and *not* for 8 byte oob size (do we have these chips anyway nowadays?)

The original Freescale driver uses this ecc layout for 8/16 bit busses:

static struct nand_ecclayout nand_hw_eccoob_8 = {
	.eccbytes = 5,
	.eccpos = {6, 7, 8, 9, 10},
	.oobfree = {{0, 5}, {11, 5}}
};

static struct nand_ecclayout nand_hw_eccoob_16 = {
	.eccbytes = 5,
	.eccpos = {6, 7, 8, 9, 10},
	.oobfree = {{0, 6}, {12, 4}}
};

I understand the first one, but doesn't the second one specify a oobfree
which overlaps with ecc data?


When I understand the mtd layer correctly it uses byte 5 of the oob data
for bad block detection, but this is passed to oobfree causing potential
corruption, so we should probably skip byte 5 from oobfree.

The original Freescale driver uses NAND_USE_FLASH_BBT and
NAND_BBT_CREATE | NAND_BBT_WRITE, so we do not need to store the bad
block information after the first scan anymore. Should we use this here
aswell?


> 			break;
> 		case 16:
> 			this->ecc.layout = &nand_hw_eccoob_16;
> 			break;
> 		case 64:
> 			this->ecc.layout = &nand_hw_eccoob_64;
> 			break;
> 		default:
> 			/* page size not handled by HW ECC */
> 			/* switching back to soft ECC */
> 			this->ecc.size = 512;
> 			this->ecc.bytes = 3;
> 			this->ecc.layout = &nand_hw_eccoob_8;
> 			this->ecc.mode = NAND_ECC_SOFT;
> 			this->ecc.calculate = NULL;
> 			this->ecc.correct = NULL;
> 			this->ecc.hwctl = NULL;
> 			tmp = readw(host->regs + NFC_CONFIG1);
> 			tmp &= ~NFC_ECC_EN;
> 			writew(tmp, host->regs + NFC_CONFIG1);
> 			break;

Which default does this code handle? Has anyone tested it?


As a conclusion I would:

- revert Erics patch
- make sure we do not pass byte 5 for small pages to oobfree
- make sure we do not pass bytes 0/1 for large pages to oobfree
- switch to use a flash based bbt?

I think doing this we break several systems out there, but do we have
another chance?

As a general note I really want to make this driver work on i.MX35/25. I
already have several patches in my queue, but they have to be rebased on
the current driver and I'm still working on it.

Sascha


-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
