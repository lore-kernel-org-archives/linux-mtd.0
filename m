Received: from smtpout05-04.prod.mesa1.secureserver.net ([64.202.165.221]
	helo=smtpout05.prod.mesa1.secureserver.net)
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K3ETP-00063W-HN
	for linux-mtd@lists.infradead.org; Mon, 02 Jun 2008 18:09:36 +0000
From: "Mark Roths" <mroths@softairmicro.com>
To: <linux-mtd@lists.infradead.org>
Subject: u-boot reports ecc error on blocks written by nandwrite
Date: Mon, 2 Jun 2008 11:09:17 -0700
Message-ID: <01b301c8c4db$c5ebb560$6601a8c0@mrothsduo>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I am running 2.6.20.11 on Atmel AT91SAM9261 and u-boot 1.1.5 with Atmel
patch 1.6.
I have ST 1Gb flash - NAND01GR3B2BZA6, 2k page, 128k eraseblock, 64 oob.
I would like to use nanderase and nandwrite to overwrite the u-boot
environment from Linux. Unfortunately, 
although the data is written correctly, as verified by cmp,  u-boot always
reports an ecc error
upon bootup afterwards.  I am using nandwrite 

 * $Id: nandwrite.c,v 1.32 2005/11/07 11:15:13 gleixner Exp $

I have tried exactly copying a block using nanddump, including oob data, and
writing it back but I still have the ecc error.
I tried without the oob data, and lots of variations on the options to
nanddump and nandwrite.

Any block written by nandwrite appears to u-boot to have ecc errors after a
reboot.  A further weirdness is that if I request a very small number of
bytes from the block, e.g. 1, it fails once, then succeeds.  I am using the
u-boot command 'nand read 0x20800000 0xa0000 1'.  All further reads of any
size up to the entire block then will succeed.  If I reboot, the error
recurs.

There appears to be a discrepancy between how the linux mtd driver and
u-boot handle the ecc.  Or I am doing something
boneheadded.

Mark Roths
Softair Microsystems
phone:  831 621 6274
fax:    831 621 6275
