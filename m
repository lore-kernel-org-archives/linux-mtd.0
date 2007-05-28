Received: from 42.242.232.72.static.reverse.layeredtech.com ([72.232.242.42]
	helo=secure.poehali.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HsjsJ-00079L-Gy
	for linux-mtd@lists.infradead.org; Mon, 28 May 2007 14:23:26 -0400
Date: Mon, 28 May 2007 21:25:13 +0300
From: Ivan Kuten <ivan.kuten@promwad.com>
To: dedekind@infradead.org
Subject: Re: Some issues with the AT91 dataflash driver...
Message-ID: <20070528212513.5086bfac@newbox>
In-Reply-To: <1180374280.3642.114.camel@sauron>
References: <465431DA.5030500@atmel.com>
	<1179992308.13101.16.camel@fuzzie.sanpeople.com>
	<46558893.1020802@comcast.net>
	<1180010988.13101.103.camel@fuzzie.sanpeople.com>
	<012d01c79e06$66823470$3204200a@head.local>
	<20070524164654.3f106ead@newbox> <20070524181437.01550127@newbox>
	<20070527200853.3caf8206@dhcp-255-175.norway.atmel.com>
	<20070527211234.40777726@dhcp-255-175.norway.atmel.com>
	<1180374280.3642.114.camel@sauron>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: david-b@pacbell.net, linux-mtd@lists.infradead.org,
	Haavard Skinnemoen <hskinnemoen@atmel.com>,
	Vadim Yatsenko <Vadim.Yatsenko@malva.ua>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 28 May 2007 20:44:40 +0300
Artem Bityutskiy wrote:

> On Sun, 2007-05-27 at 21:12 +0200, Haavard Skinnemoen wrote:
> > On Sun, 27 May 2007 20:08:53 +0200
> > Haavard Skinnemoen <hskinnemoen@atmel.com> wrote:
> > 
> > > Now that I've got the CRC errors sorted out, I'll try bisecting it.
> > 
> > Done. git-bisect blames this commit:
> 
> Hi,
> 
> whats mtd->writesize of the flash? Do you have the debugging output log?
> 

MTD_DEBUG=3 enabled:

at91_dataflash: AT45DB642 detected [spi0] (8650752 bytes)
Creating 5 MTD partitions on "AT45DB642.spi0":
0x00031800-0x00139800 : "kernel"
mtd: Giving out device 0 to kernel
0x00139800-0x003cd800 : "initrd"
mtd: Giving out device 1 to initrd
0x003cd800-0x00582c00 : "data1"
mtd: Giving out device 2 to data1
0x00582c00-0x00738000 : "data2"
mtd: Giving out device 3 to data2
0x00738000-0x00840000 : "Dataflash"
mtd: Giving out device 4 to Dataflash

cat /proc/mtd 
dev:    size   erasesize  name
mtd0: 00108000 00000420 "kernel"
mtd1: 00294000 00000420 "initrd"
mtd2: 001b5400 00000420 "data1"
mtd3: 001b5400 00000420 "data2"
mtd4: 00108000 00000420 "Dataflash"

mount -t jffs2 /dev/mtdblock/4 /mnt/dataflash/
JFFS2 write-buffering enabled buffer (1056) erasesize (8448)
Empty flash at 0x000f825c ends at 0x000f8460
/ # JFFS2 error: (686) read_more: short read at 0x0f4aa0: 79200 instead of -928.
JFFS2 error: (686) jffs2_do_read_inode_internal: cannot read nodes for ino 4, returned error is -5
Returned error for crccheck of ino #4. Expect badness...
JFFS2 error: (686) read_more: short read at 0x0f94e0: 60192 instead of -928.
JFFS2 error: (686) jffs2_do_read_inode_internal: cannot read nodes for ino 4294967295, returned error is -5
Returned error for crccheck of ino #4294967295. Expect badness...
Checked all inodes but still 0x12db0 bytes of unchecked space?
No space for garbage collection. Aborting GC thread
Unable to handle kernel paging request at virtual address ffffffff
pgd = c0018000
[ffffffff] *pgd=20002031, *pte=00000000, *ppte=00000000
Internal error: Oops: 813 [#1]
Modules linked in:
CPU: 0
PC is at free_block+0x90/0x178
LR is at 0xc026eee0
pc : [<c006fa30>]    lr : [<c026eee0>]    Not tainted
sp : c040fefc  ip : c071f000  fp : c040ff2c
r10: 00000018  r9 : 00000000  r8 : 00000000
r7 : c0671960  r6 : c0410000  r5 : 00000018  r4 : c0410010
r3 : ffffffff  r2 : ffffffff  r1 : c071f01c  r0 : c071f3e0
Flags: nzcv  IRQs off  FIQs on  Mode SVC_32  Segment kernel
Control: C000717F
Table: 20018000  DAC: 00000017
Process events/0 (pid: 5, stack limit = 0xc040e258)
Stack: (0xc040fefc to 0xc0410000)
fee0:                                                                c071f01c 
ff00: c0410010 c0410010 00000018 c0410000 c0671960 c01f68c4 00000000 00000000 
ff20: c040ff4c c040ff30 c006fbc0 c006f9b0 c026eee0 c0671960 00000000 c01f68b8 
ff40: c040ff7c c040ff50 c0071420 c006fb28 00000000 c040ff60 c067ada0 c00713c4 
ff60: c040ffac c04012c0 00000000 00000000 c040ff94 c040ff80 c0043cd0 c00713d4 
ff80: c067ada8 c067ada0 c040ffdc c040ff98 c0043e7c c0043c28 00000000 c04012c0 
ffa0: c0047cb4 c040ffb8 c040ffb8 00000000 c04012c0 c0047cb4 c040ffb8 c040ffb8 
ffc0: fffffffc c0043d60 00000000 00000000 c040fff4 c040ffe0 c00477e4 c0043d70 
ffe0: 00000000 00000000 00000000 c040fff8 c00366a0 c00477a0 33cc33cc 33cc33cc 
Backtrace: 
[<c006f9a0>] (free_block+0x0/0x178) from [<c006fbc0>] (drain_array+0xa8/0xd8)
[<c006fb18>] (drain_array+0x0/0xd8) from [<c0071420>] (cache_reap+0x5c/0x10c)
 r7:c01f68b8 r6:00000000 r5:c0671960 r4:c026eee0
[<c00713c4>] (cache_reap+0x0/0x10c) from [<c0043cd0>] (run_workqueue+0xb8/0x148)
[<c0043c18>] (run_workqueue+0x0/0x148) from [<c0043e7c>] (worker_thread+0x11c/0x130)
 r5:c067ada0 r4:c067ada8
[<c0043d60>] (worker_thread+0x0/0x130) from [<c00477e4>] (kthread+0x54/0x7c)
 r7:00000000 r6:00000000 r5:c0043d60 r4:fffffffc
[<c0047790>] (kthread+0x0/0x7c) from [<c00366a0>] (do_exit+0x0/0x74c)
 r5:00000000 r4:00000000
Code: e59c3000 e59c2004 e28c101c e50b1030 (e5823000) 

Here is log under 2.6.20:
at91_dataflash: AT45DB642 detected [spi0] (8650752 bytes)
Creating 5 MTD partitions on "AT45DB642.spi0":
0x00738000-0x00840000 : "Dataflash"
0x00031800-0x00139800 : "kernel"
0x00139800-0x003cd800 : "initrd"
0x003cd800-0x00582c00 : "data1"
0x00582c00-0x00738000 : "data2"

cat /proc/mtd 
dev:    size   erasesize  name
mtd0: 00108000 00000420 "Dataflash"
mtd1: 00108000 00000420 "kernel"
mtd2: 00294000 00000420 "initrd"
mtd3: 001b5400 00000420 "data1"
mtd4: 001b5400 00000420 "data2"

mount -t jffs2 /dev/mtdblock/0 /mnt/dataflash/
JFFS2 write-buffering enabled buffer (1056) erasesize (8448)
Empty flash at 0x000f825c ends at 0x000f8460

here flash contents under /mnt/dataflash gets listed.

Best regards,
Ivan
