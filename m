Received: from smtp3-g21.free.fr ([212.27.42.3])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M6WnO-0002wP-VC
	for linux-mtd@lists.infradead.org; Tue, 19 May 2009 21:24:52 +0000
Received: from smtp3-g21.free.fr (localhost [127.0.0.1])
	by smtp3-g21.free.fr (Postfix) with ESMTP id C6D848180C9
	for <linux-mtd@lists.infradead.org>;
	Tue, 19 May 2009 23:24:14 +0200 (CEST)
Received: from [192.168.0.10] (bdy93-1-82-67-223-79.fbx.proxad.net
	[82.67.223.79])
	by smtp3-g21.free.fr (Postfix) with ESMTP id C630D8180E0
	for <linux-mtd@lists.infradead.org>;
	Tue, 19 May 2009 23:24:11 +0200 (CEST)
Message-ID: <4A13237B.5030808@gcasse.net>
Date: Tue, 19 May 2009 23:24:11 +0200
From: Gilles Casse <list@gcasse.net>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 CRC error (was Erroneous read from flash)
References: <4A0B3BF6.90602@gcasse.net>
In-Reply-To: <4A0B3BF6.90602@gcasse.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Gilles Casse a écrit :
>
> A reproductible oops appears, here, in jffs2 (file.c, line 251), with 
> such a message :
> Node CRC 2e362e33 != calculated CRC 36bb7f4c for node at 000342dc
>
> The traces show that the CRC error is due to an erroneous read of a 
> page in an Atmel dataflash.
>

Still tracking this issue, if possible, pointers would be very much 
appreciated. Thank you.

The erroneous read is 68 bytes long.
At the end of the node, the erroneous bytes come from a JFFS2 printk, in 
symlink.c, jffs2_follow_link, line 54:
D1(printk(KERN_DEBUG "jffs2_follow_link(): target path is '%s'\n", (char 
*) f->target));


An example of an erroneous read followed by a correct read is given below:

* syslog sample
node at 0x000575ac belongs to inode #21, /bin/cat (a symlink to busybox):

<15>kernel: Going to garbage collect node at 0x000575ac
<15>kernel: jffs2_garbage_collect_pass collecting from block 
@0x00056a00. Node @0x000575ac(2), ino #21
<15>kernel: jffs2_iget(): ino == 21
<15>kernel: Node read from 01300b20: node_crc e4f82297, calculated CRC 
e4f82297. dsize 1000, csize 4e5, offset 3f000, buf c7fc8000
<15>kernel: Node read from 000575ac: node_crc 2e362e33, calculated CRC 
75bd39a0. dsize 20736920, csize 68746170, offset 20740000, buf c7a90f20
<12>kernel: Node CRC 2e362e33 != calculated CRC 75bd39a0 for node at 
000575ac
<12>kernel: read of old metadata failed in 
jffs2_garbage_collect_metadata(): -5
<11>kernel: Error garbage collecting node at 000575ac!
<13>kernel: No space for garbage collection. Aborting GC thread
<15>kernel: Filling non-frag hole from 262144-266240
<15>kernel: end write_begin(). pg->flags 209
<15>kernel: jffs2_write_end(): ino #876, page at 0x40000, range 0-4096, 
flags 209
<15>kernel: jffs2_write_inode_range(): Ino #876, ofs 0x40000, len 0x1000
<15>kernel: jffs2_reserve_space(): Requested 0xc4 bytes

* erroneous read at 0x575ac = 50 0b 6c (24 bits dataflash address, 
bank1, page 2561)

the last 22 last bytes come from the symlink.c printk ("t path is 
'./ld-2.3.6.""):

cmd: (e8) 50 0b 6c (jiffies = 85229)
len=0068, retlen=0068, status=0, status2=0

page:
00000000 85 19 02 e0 4b 00 00 00 4b eb 94 c0 15 00 00 00 ....K...K.......
00000010 01 00 00 00 ff a1 00 00 00 00 00 00 07 00 00 00 ................
00000020 05 6f d3 49 05 6f d3 49 05 6f d3 49 00 00 74 20 .o.I.o.I.o.I..t
00000030 70 61 74 68 20 69 73 20 27 2e 2f 6c 64 2d 32 2e path is './ld-2.
00000040 33 2e 36 2e 3.6.

* correct read at 000575ac:
cmd: (e8) 50 0b 6c (jiffies = 85500)
len=0068, retlen=0068, status=0, status2=0

page:
00000000 85 19 02 e0 4b 00 00 00 4b eb 94 c0 15 00 00 00 ....K...K.......
00000010 01 00 00 00 ff a1 00 00 00 00 00 00 07 00 00 00 ................
00000020 05 6f d3 49 05 6f d3 49 05 6f d3 49 00 00 00 00 .o.I.o.I.o.I....
00000030 07 00 00 00 07 00 00 00 00 00 00 00 9f 25 6b 18 .............%k.
00000040 b7 b2 55 14 ..U.


Best regards,
Gilles

> - linux 2.6.28-9
> - ARM 920T
> - Atmel AT45DB642D dataflash
>
> The issue happens relatively rarely if the gc thread has been stopped, 
> and
> the SPI bus is at 10Mhz (occurs e.g. after 4000 writes).
>
> The issue happens more frequently if gcd is present, and using a SPI
> bus at 6Mhz (occurs at the very first tries).
>
