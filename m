Received: from email.rugged.com ([64.60.45.211])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XUNHw-0003UD-P1
 for linux-mtd@lists.infradead.org; Wed, 17 Sep 2014 22:01:25 +0000
From: Robert Hurdle <RHurdle@Rugged.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Wed, 17 Sep 2014 14:59:22 -0700
Subject: Question about adding a NAND device
Message-ID: <5498E86A4A68B14A8A06D0380640D04A01FA6854E73D@atca01em01.adsi.aitech.ent>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

	I have ported some of u-boot to our board, and I am booting successfully f=
rom EEPROM.
	I am now in the process of adding the NAND and flash file system support f=
or our non-standard
	flash interface (there's an FPGA interface between the software and the 1 =
giga-byte NAND) to
	u-boot and also to the Linux kernel.  In addition, it is our intention to =
support UBIFS on our board.

	It appears that I need to understand how the structures mtd_info and nand_=
chip (and whatever
	they point at) and code in nand_base.c work, in order to provide working r=
outines at the NAND
	level.  I have looked at some of the files in u-boot/drivers/mtd/nand for =
other boards, and see
	a wide variety of models, no doubt based on the hardware differences.   Be=
cause of our FPGA
	interface, I need to have all commands to the NAND chip get re-packaged in=
to commands that
	get passed to the FPGA.  Am I on the right path? =20

	My other question is how long would one guess that this task would take fo=
r someone fairly
	competent, but uninitiated in UBIFS, UBI, MTD, NAND, etc. ?

	Any advice is appreciated.

	Thank you,

	Robert Hurdle
	Aitech Defense Systems (Space Division)
