Received: from [195.134.130.80] (helo=pip5.mpl.ch)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19hsDm-0002UT-8Y
	for <linux-mtd@lists.infradead.org>; Wed, 30 Jul 2003 15:46:30 +0100
Received: from elsoft.ch (IDENT:1000@pcdm.elsoft.loc [192.168.11.10])
	h6UEkNIn019522
	for <linux-mtd@lists.infradead.org>; Wed, 30 Jul 2003 16:46:24 +0200
Message-ID: <3F27DAA6.4050806@elsoft.ch>
Date: Wed, 30 Jul 2003 16:48:06 +0200
From: =?ISO-8859-1?Q?=22David_M=FCller_=28ELSOFT_AG=29=22?=
 <d.mueller@elsoft.ch>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Subject: Problem mounting JFFS2 
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello

I'm trying to get a JFFS2 filesystem on a 64MB NAND flash device working
on an ARM based system (running Linux-2.4.21 and the latest MTD CVS code).

I prepare the JFFS2 image on my host system like this

temp> mkfs.jffs2 --version
mkfs.jffs2: revision 1.38

temp> mkfs.jffs2 -d targetfs -o targetfs.img -e 16 -l -q -v -n


and burn it into the NAND device on the target. If i later try to mount
it under Linux with "mount -t jffs2 /dev/mtdblock/1 /mnt", i get the
following output:

jffs2: Erase block size too small (16KiB). Using virtual blocks size
(32KiB) instead
jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
at 00000000
OOB at 00000000 was 33 f3 c0 ff f0 ff ff ff ff ff ff ff ff ff ff ff
jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
at 000080
OOB at 00008000 was 03 f0 00 ff f0 ff ff ff ff ff ff ff ff ff ff ff
[deleted rest of cleanmarker check]

Ino #14 is absent but node not REF_PRISTINE. Reading.
ARGH. About to write node to 0x00004000 on flash, but there are data
already there:
0x00004000: 85 19 02 e0 20 03 00 00 10 25 f5 2e 0e 00 00 00
Write of 1576 bytes at 0x00004000 failed. returned -5, retlen 0
Not marking the space at 0x00004000 as dirty because the flash driver
returned retlen zero
Error writing new dnode: -5


Any idea what is going wrong?

TIA

Dave
