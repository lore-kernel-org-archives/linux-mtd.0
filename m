Received: from law14-oe57.law14.hotmail.com ([64.4.20.192] helo=hotmail.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19UkHh-0007HE-1B
	for <linux-mtd@lists.infradead.org>; Tue, 24 Jun 2003 10:40:17 +0100
From: "Vikram Mehta" <vm6580@hotmail.com>
To: "mtd" <linux-mtd@lists.infradead.org>
Date: Tue, 24 Jun 2003 07:24:28 -0700
MIME-Version: 1.0
Message-ID: <Law14-OE57nHAaaz7Ej000018da@hotmail.com>
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: BLKMEM ARENA QUESTION
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



 Hi folks,

1.)
 I think my kernel can start running from RAM now.

 Though I get a message

 Blkmem: bad access: block=2, count=2 (pos=800, len=0)
 end_request: I/O error, dev 1e:00 (Blkmem), sector 2
 EXT2-fs: unable to read superblock
 Blkmem: bad access: block=0, count=2 (pos=400, len=0)
 end_request: I/O error, dev 1e:00 (Blkmem), sector 0
 romfs: unable to read superblock
 Kernel panic: VFS: Unable to mount root fs on 1e:00

 I never faced this problem when I built a kernel as XIP

2.)I looked up in linux-2.4.x /drivers/block/blkmem.c
there is a line
arena[0].address = (unsigned long)__data_rom_start + (unsigned long)_edata -
(unsigned long)__data_start;

My guess is that this is from where my file system starts.

IN case of XIP kernel it was arena[0].address = 0x10CA7670 +
0x48000 -0x20000. Which is a OK address in FLASH
In case of MY RAM KERNEL it comes out to
0x BCe90 + 0xd812C + 0xBCE90 = 0xd812C.... Serious trouble..... this address
is in RAM...

Am I thinking Right?....
If yes HOw do I find out the correct value of  __data_rom_start and how do I
set it.?

 Vikram
