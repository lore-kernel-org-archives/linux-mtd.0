Received: from nat-132.atmel.no ([80.232.32.132] helo=relay.atmel.no)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HsNAx-00039U-6R
	for linux-mtd@lists.infradead.org; Sun, 27 May 2007 14:09:10 -0400
Date: Sun, 27 May 2007 20:08:53 +0200
From: Haavard Skinnemoen <hskinnemoen@atmel.com>
To: Ivan Kuten <ivan.kuten@promwad.com>
Subject: Re: Some issues with the AT91 dataflash driver...
Message-ID: <20070527200853.3caf8206@dhcp-255-175.norway.atmel.com>
In-Reply-To: <20070524181437.01550127@newbox>
References: <465431DA.5030500@atmel.com>
	<1179992308.13101.16.camel@fuzzie.sanpeople.com>
	<46558893.1020802@comcast.net>
	<1180010988.13101.103.camel@fuzzie.sanpeople.com>
	<012d01c79e06$66823470$3204200a@head.local>
	<20070524164654.3f106ead@newbox> <20070524181437.01550127@newbox>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: david-b@pacbell.net, linux-mtd@lists.infradead.org,
	Vadim Yatsenko <Vadim.Yatsenko@malva.ua>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

(not Cc'ing linux-arm-kernel since I'm not subscribed)

On Thu, 24 May 2007 18:14:37 +0300
Ivan Kuten <ivan.kuten@promwad.com> wrote:

> / # JFFS2 error: (701) read_more: short read at 0x0f4aa0: 79200 instead of -928.
> JFFS2 error: (701) jffs2_do_read_inode_internal: cannot read nodes for ino 4, returned error is -5
> Returned error for crccheck of ino #4. Expect badness...
> JFFS2 error: (701) read_more: short read at 0x0f94e0: 60192 instead of -928.
> JFFS2 error: (701) jffs2_do_read_inode_internal: cannot read nodes for ino 5, returned error is -5
> Returned error for crccheck of ino #5. Expect badness...
> JFFS2 notice: (701) check_node_data: wrong data CRC in data node at 0x000f4680: read 0x835ea32f, calculated 0x86ce24e.
> JFFS2 error: (701) read_more: short read at 0x066de0: 660000 instead of -928.
> JFFS2 error: (701) jffs2_do_read_inode_internal: cannot read nodes for ino 28, returned error is -5
> Returned error for crccheck of ino #28. Expect badness...
> JFFS2 notice: (701) check_node_data: wrong data CRC in data node at 0x000f94e0: read 0xcf1d2e57, calculated 0x32bf550.
> JFFS2 warning: (701) jffs2_do_read_inode_internal: Truncating ino #31 to 695 bytes failed because it only had 0 bytes to start with!
> JFFS2 notice: (701) check_node_data: wrong data CRC in data node at 0x000f8880: read 0x6ee83af5, calculated 0x23913090.
> JFFS2 notice: (701) check_node_data: wrong data CRC in data node at 0x000f3a20: read 0xa1d49e0a, calculated 0xd783d000.
> JFFS2 notice: (701) check_node_data: wrong data CRC in data node at 0x000f4aa0: read 0x6b3926a3, calculated 0xbf16d09d.

I'm seeing something similar on AVR32/ATNGW100 as well. On 2.6.22-rc3 I get this:

root@uclibc ~]# mount -tjffs2 mtd3 /mnt
JFFS2 write-buffering enabled buffer (1056) erasesize (8448)
[root@uclibc ~]#JFFS2 error: (134) read_more: can not read -928 bytes from 0x00000420, error code: -22.
 JFFS2 error: (134) jffs2_do_read_inode_internal: cannot read nodes for ino 2, returned error is -22
Returned error for crccheck of ino #2. Expect badness...
JFFS2 error: (134) read_more: can not read -928 bytes from 0x00019020, error code: -22.
Unable to handle kernel NULL pointer dereference at virtual address 000000ec
ptbr = 91d67800 pgd = 103d9c66 pte = 00000000
Oops: Kernel access of bad area, sig: 11 [#1]
FRAME_POINTER chip: 0x01f:0x1e82 rev 0
Modules linked in:
PC is at jffs2_free_tmp_dnode_info_list+0xa/0x54
LR is at jffs2_free_tmp_dnode_info+0xe/0x14
pc : [<9009807a>]    lr : [<900970ca>]    Not tainted
sp : 91e73e1c  r12: 901b22fc  r11: 9021a940
r10: 000000e7  r9 : 91e4a9a0  r8 : 00000000
r7 : 91e73e1c  r6 : 000000e7  r5 : 91e73e84  r4 : 00000000
r3 : 91dd4000  r2 : ffffffea  r1 : 91e1cec4  r0 : 00018e4c
Flags: qvnzc
Mode bits: hrje....g
CPU Mode: Supervisor
Process: jffs2_gcd_mtd3 [134] (task: 90279540 thread: 91e72000)
Stack: (0x91e73e1c to 0x91e74000)
3e00:                                                                9009901e
3e20: 91e73e54 fffffc60 00019020 00000000 00000000 91e73e84 91d3b200 91d3b400
3e40: 00000420 000001ef 91e1ce58 00000000 00000420 9009906c 91e73ea8 91e73e84
3e60: 91e73ecc 00000000 91e1d1f8 91d3b200 9009dccc 91d3b400 00000000 91d3b200
3e80: 00000000 91e4a100 00000000 0000009a 00000000 00000000 00000000 00000000
3ea0: 9009dccc 91d3b400 90099838 91e73f10 91d3b200 fffffff4 00000000 91e1d1f8
3ec0: 91d3b400 9009dccc 91d3b400 1985e002 00000055 ce5f02cc 00000015 00000001
3ee0: 0000a1ff 00000003 90015ff2 91e73f0c 00400025 91e1d1e0 00000000 901530e4
3f00: 91e73f20 90015b2e 90279540 00000000 9009cea0 91e73f48 91d3b42c 91e1d1f8
3f20: 00000000 00000001 91d3b400 9009dccc 91d3b400 91e73f44 91e72000 91d3b400
3f40: 00000000 9001a51a 9009dd82 91e73fec 91e72000 91d3b400 00000000 00000000
3f60: 90019f2c 9009dccc 91d3b400 0079cfdb 0079cfdc 0079cfdd 0079cfde 0079cfdf
3f80: 0079cfe0 0079cfe1 0079cfe2 0079cfe3 0079cfe4 0079cfe5 0079cfe6 0079cfe7
3fa0: 0079cfe8 90010166 91e01a34 901b5b08 90279000 91dd4800 00400000 90012d6c
3fc0: 90012d6c 91e74000 00000000 00000000 00000000 00000000 00000000 00000000
3fe0: 00000000 00000000 00000000 90019f2c 00000000 00000000 00000000 00000000
Call trace:
 [<9009901e>] jffs2_get_inode_nodes+0xc9c/0xcc6
 [<9009906c>] jffs2_do_read_inode_internal+0x24/0x7b8
 [<90099838>] jffs2_do_crccheck_inode+0x38/0x6c
 [<9009cea0>] jffs2_garbage_collect_pass+0x134/0x4d4
 [<9009dd82>] jffs2_garbage_collect_thread+0xb6/0xd8
 [<90019f2c>] do_exit+0x0/0x51c

When I revert back to 32f15dc5e6 (which is when the ATNGW100 board
support got merged), I get tons of CRC errors but no crash. That might
be related to the bug fixed by a1e3cf418f however; I'll see if I can
verify that.

Ah, I've somehow managed to set CONFIG_SLOB=y. That explains it...

> Checked all inodes but still 0x11e28 bytes of unchecked space?
> No space for garbage collection. Aborting GC thread

I'm sure I've seen this message several times too.

> The same partition is working (mount,read,write) under 2.6.20 + maxim patches.
> Board config is the same between 2.6.20 and 2.6.22-rc1.
> 
> Seems something got broken for SPI & AT91RM9200 between 2.6.20 and 2.6.22-rc1.

Looks to me like something more fundamental got broken. I'm using
mtd_dataflash with the atmel_spi driver. I take it you're using
at91_dataflash with the legacy AT91 SPI driver, right?

Now that I've got the CRC errors sorted out, I'll try bisecting it.

Haavard
