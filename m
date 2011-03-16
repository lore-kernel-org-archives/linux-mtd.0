Received: from mail-gx0-f177.google.com ([209.85.161.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PzuWc-0006lA-5F
	for linux-mtd@lists.infradead.org; Wed, 16 Mar 2011 17:28:47 +0000
Received: by gxk2 with SMTP id 2so816109gxk.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 16 Mar 2011 10:28:42 -0700 (PDT)
Date: Wed, 16 Mar 2011 10:28:33 -0700
Subject: Recommendations on System Tuning for JFFS2/MTD 128 KiB Block Page
	Allocation Failures
From: Grant Erickson <marathon96@gmail.com>
To: <linux-mtd@lists.infradead.org>
Message-ID: <C9A64151.264E1%marathon96@gmail.com>
Mime-version: 1.0
Content-type: text/plain;
	charset="US-ASCII"
Content-transfer-encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I've an OMAP3 ARM-based embedded system with 256 MiB of NAND flash and 64
MiB of RAM on Linux 2.6.32 in which both sys_mount (via mount) and sys_read
(via fw_setenv) occasionally fail with "page allocation failure. order:5,
mode:0xd0".

In the analysis I've done so far, sys_mount funnels down to
jffs2_scan_medium which eventually calls kmalloc with a size of 128 KiB (to
cover a single NAND erase block) and flag GFP_KERNEL:

    sw/tps/linux/linux/fs/jffs2/scan.c:
    ...
    120         /* Respect kmalloc limitations */
    121         if (buf_size > 128*1024)
    122             buf_size = 128*1024;
    123 
    124         D1(printk(KERN_DEBUG "Allocating readbuf of %d bytes\n",
buf_si
   124 ze));
    125         flashbuf = kmalloc(buf_size, GFP_KERNEL);
    126         if (!flashbuf)
    127             return -ENOMEM;
    128     }
    ...

The sys_read case winds down to mtd_read which eventually calls kmalloc with
a size of 128 KiB (to cover a single NAND erase blcok) and flag GFP_KERNEL:

    sw/tps/linux/linux/drivers/mtd/mtdchar:
    ...
    161     if (count > MAX_KMALLOC_SIZE)
    162         kbuf=kmalloc(MAX_KMALLOC_SIZE, GFP_KERNEL);
    163     else
    164         kbuf=kmalloc(count, GFP_KERNEL);
    ...

Both of these kmallocs ultimate funnel down to __alloc_pages_nodemask in
linux/mm/page_alloc.c and falling down to the very bottom of that routine,
we find that we eventually fall through to the bottom of
__alloc_pages_slowpath at the 'nopage' label because, ostensibly, no free
pages could be found on the free page list. The memory information dump
seems to bear this out with '0' 128 KiB page blocks/slabs available:

    Mem-info:
    Normal per-cpu:
    CPU    0: hi:   18, btch:   3 usd:   0
    active_anon:160 inactive_anon:610 isolated_anon:0
     active_file:7364 inactive_file:3946 isolated_file:0
     unevictable:0 dirty:0 writeback:0 unstable:0
     free:468 slab_reclaimable:257 slab_unreclaimable:1146
     mapped:1611 shmem:6 pagetables:69 bounce:0
    Normal free:1872kB min:1016kB low:1268kB high:1524kB active_anon:640kB
inactive_anon:2440kB active_file:29456kB inactive_file:15784kB
unevictable:0kB
isolated(anon):0kB     isolated(file):0kB present:65024kB mlocked:0kB
dirty:0kB
writeback:0kB mapped:6444kB shmem:24kB slab_reclaimable:1028kB
slab_unreclaimable:4584kB kernel_stack:368kB         pagetables:276kB
unstable:0kB bounce:0kB writeback_tmp:0kB pages_scanned:0 all_unreclaimable?
no
    lowmem_reserve[]: 0 0
    Normal: 58*4kB 15*8kB 25*16kB 21*32kB 7*64kB 0*128kB 0*256kB 0*512kB
0*1024kB 0*2048kB 0*4096kB = 1872kB
    11316 total pagecache pages
    0 pages in swap cache
    Swap cache stats: add 0, delete 0, find 0/0
    Free swap  = 0kB
    Total swap = 0kB
    16384 pages of RAM
    562 free pages
    1915 reserved pages
    1403 slab pages
    4075 pages shared
    0 pages swap cached

Ostensibly this occurs because of memory fragmentation where any of the
lower order blocks are are available must be non-contiguous.

As an experiment, I call:

    sync
    sysctl -w vm.drop_caches=3

and free memory changes accordingly:

    System free memory is currently 10,004 KiB.
    System free memory is now 39,428 KiB.

as reported by /proc/meminfo, before running:

    fw_setenv foo bar

and still see the page allocation failure.

The system is currently configured with the SLAB allocator. Has anyone found
better fragmentation and low-memory performance with the default SLUB or
embedded SLOB allocators? How about tweaking:

    vm.min_free_kbytes
    vm.vfs_cache_pressure

Anyone met with success there?

Best,

Grant Erickson
