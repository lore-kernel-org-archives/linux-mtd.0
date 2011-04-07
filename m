Received: from gate.sewerin.de ([77.75.200.26] helo=mail.sewerin.de)
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Q7mVJ-000664-Bc
	for linux-mtd@lists.infradead.org; Thu, 07 Apr 2011 10:31:58 +0000
To: linux-mtd@lists.infradead.org
Subject: ubiformat: libmtd: error 12 (Cannot allocate memory): on system with
	limited RAM
MIME-Version: 1.0
Message-ID: <OF8FD344E7.A0857714-ONC125786B.003837F9-C125786B.0038E3D1@sewerin.de>
From: Bastian.Ruppert@sewerin.de
Date: Thu, 7 Apr 2011 12:20:49 +0200
Content-Type: text/plain; charset="US-ASCII"
Cc: Bastian.Ruppert@sewerin.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

i have problems writing an image with ubiformat in an environment with 
limited RAM.

The system is a TI OMAPL138 ARM9 with a 2.6.38-rc6-00071-gb9b65a4 kernel.

git log in mtd-utils:
commit a70811466de2c4c0c3a538e5e04a4dd1a8fbcc03
Author: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
Date:   Tue Apr 5 17:32:29 2011 +0300


The following command is working fine with say MEM=72M for the linux 
kernel, and 
the content in the ubi image can be mounted successfully after flashing.

./ubiformat /dev/mtd3 -f image.ubi -S 19660800

But with less memory, say 32M the following error occurs:

-bash-3.2# ./ubiformat /dev/mtd3 -f image.ubi -S 19660800
ubiformat: mtd3 (nand), size 79691776 bytes (76.0 MiB), 608 eraseblocks of 
131072 bytes (128.0 KiB), min. I/O size 2048 bytes
libscan: scanning eraseblock 607 -- 100 % complete 
ubiformat: 607 eraseblocks have valid erase counter, mean value is 3
ubiformat: 1 eraseblocks are supposedly empty
ubiformat: flashing eraseblock 35 -- 24 % complete  ubiformat: page 
allocation failure. order:5, mode:0x40d0
[<c0034838>] (unwind_backtrace+0x0/0xf0) from [<c007f730>] 
(__alloc_pages_nodemask+0x590/0x60c)
[<c007f730>] (__alloc_pages_nodemask+0x590/0x60c) from [<c007f7c0>] 
(__get_free_pages+0x14/0x44)
[<c007f7c0>] (__get_free_pages+0x14/0x44) from [<c01e2db4>] 
(mtd_write+0x8c/0x230)
[<c01e2db4>] (mtd_write+0x8c/0x230) from [<c00a38f8>] 
(vfs_write+0xb0/0x13c)
[<c00a38f8>] (vfs_write+0xb0/0x13c) from [<c00a3e8c>] 
(sys_write+0x3c/0x68)
[<c00a3e8c>] (sys_write+0x3c/0x68) from [<c002ffa0>] 
(ret_fast_syscall+0x0/0x2c)
Mem-info:
DMA per-cpu:
CPU    0: hi:    0, btch:   1 usd:   0
active_anon:345 inactive_anon:0 isolated_anon:0
 active_file:1600 inactive_file:3038 isolated_file:0
 unevictable:0 dirty:0 writeback:1 unstable:0
 free:702 slab_reclaimable:239 slab_unreclaimable:543
 mapped:379 shmem:0 pagetables:33 bounce:0
DMA free:2788kB min:720kB low:900kB high:1080kB active_anon:1380kB 
inactive_anon:0kB active_file:6400kB inactive_file:12152kB unevictable:0kB 
isolated(anon):0kB isolated(file):0kB present:32512kB mlocked:0kB 
dirty:0kB writeback:4kB mapped:1516kB shmem:0kB slab_reclaimable:956kB 
slab_unreclaimable:2192kB kernel_stack:320kB pagetables:132kB unstable:0kB 
bounce:0kB writeback_tmp:0kB pages_scanned:0 all_unreclaimable? no
lowmem_reserve[]: 0 0 0
DMA: 266*4kB 19*8kB 20*16kB 11*32kB 8*64kB 3*128kB 0*256kB 0*512kB 
0*1024kB 0*2048kB 0*4096kB = 2784kB
4638 total pagecache pages
8192 pages of RAM
763 free pages
1104 reserved pages
569 slab pages
1020 pages shared
0 pages swap cached
libmtd: error!: cannot write 131072 bytes to mtd3 (eraseblock 35, offset 
0)
        error 12 (Cannot allocate memory)
ubiformat: error!: cannot write eraseblock 35
           error 12 (Cannot allocate memory)
-bash-3.2# 

It seems that in ./ubi-utils/src/ubiformat.c:541 the function mtd_write 
returns
the error.
Is it possible to free some memory before writing the next page to get rid 
of 
the memory problem?

Best regards,

Bastian Ruppert.

... please put me to CC in response to this message.
