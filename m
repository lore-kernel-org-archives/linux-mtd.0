Received: from p15106599.pureserver.info ([217.160.134.213])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BuRrk-0006XT-W0
	for linux-mtd@lists.infradead.org; Tue, 10 Aug 2004 04:20:19 -0400
Received: from synth.net (localhost.localdomain [127.0.0.1])
	(authenticated (0 bits))
	by p15106599.pureserver.info (8.11.6/8.11.6) with ESMTP id i7A8KDU07383
	for <linux-mtd@lists.infradead.org>; Tue, 10 Aug 2004 09:20:13 +0100
Message-ID: <58183.80.135.154.217.1092126013.squirrel@www.synth.net>
Date: Tue, 10 Aug 2004 09:20:13 +0100 (BST)
From: <jayv@synth.net>
To: <linux-mtd@lists.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Subject: SmartMedia driver for SMDK2410 Board?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

November last year, this message was posted to linux-mtd:

--- quote ---------
Subject: smartmedia block driver
Luca Contini luca.contini at mediaenabling.com
Wed Nov 19 11:18:02 GMT 2003
Previous message: Suggested patch for mtdchar.c
Next message: smartmedia block driver

Hi all,
I've successfully completed the "read" part of a smartmedia driver for the
Samsung board smdk2410.
The Linux kernel is 2.4.18 (mandatory for this board)
The driver is composed by 3 modules:
s3c2410nand.o
smdk2410.o
mtdblock.o

I've modified these sources in order to read the smartmedia and build up the
logical to physical block address map.
Now I am able to mount a vfat filesystem on the smartmedia:
mount -t vfat /dev/mtdblock0 /mnt/smartmedia

My problem is that I have no idea about how to write sectors to smartmedia.
I have already the low level function nand_write_ecc, but I need help from
the logical side.
When the mtdblock needs a logical sector (req->sector), I just use my table
to translate the logical block address to physical block address (the low
level driver module s3c2410nand.o reads only physical sectors) and pass this
physical address to the nand_read_ecc function.
I suppose that when I write, a new logical or physical address must be
written in the OOB area of the requested block, but which is the logic?

is anybody able to help me?

regards

Luca
--- end quote -----

I've been unable to contact Luca to see what sort of state the SD driver
for SMDK2410is now in, almost a year later ... does anyone have any details?

I have an SMDK2410 which I'd like to press into development work, but the
only large'ishmedia I have for it is a 512Meg SD Card, which I'd like to put all the dev
tools on ... is thispossible?  Maybe someone has a working SD driver for SMDK2410?  (linux
kernel 2.4.18)
;
--
Jay Vaughan
