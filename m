Received: from mail.fst.it ([213.255.39.254] helo=fst.it)
	by pentafluge.infradead.org with smtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AMPR2-0003So-3h
	for <linux-mtd@lists.infradead.org>; Wed, 19 Nov 2003 10:19:44 +0000
Message-ID: <001701c3ae86$6a506450$170714ac@lukkino>
From: "Luca Contini" <luca.contini@mediaenabling.com>
To: "Linux-mtd" <linux-mtd@lists.infradead.org>
Date: Wed, 19 Nov 2003 11:18:02 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: smartmedia block driver
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

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
