Received: from mail.externet.hu ([212.40.96.181])
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Ga7J4-0007mq-LZ
	for linux-mtd@lists.infradead.org; Wed, 18 Oct 2006 05:01:57 -0400
Message-ID: <4535EDD2.8060407@psolv.hu>
Date: Wed, 18 Oct 2006 11:03:14 +0200
From: =?ISO-8859-2?Q?D=E9mi_Zsolt?= <zsdemi@psolv.hu>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: jffs2_flash_writev(): Non-contiguous write to
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi 4 All!

I have read in the archives some letter with the same problem :

- JFFS2 Non-Contiguous Write Oops on 2.6.18 - Scott Shumate
- JFFS2 dataflash problem - Peer Georgi
- Jffs2 Oops  - z l

... but I haven't found any answer or solution for it. I'm using 
at91rm9200 based -own designed- board with 2.6.18 linux kernel. I have 
patched it from mtd csv (http://sourceware.org/jffs2/), and I'm using 
mtd-utils 1.0.0 (http://www.linux-mtd.infradead.org/) and compiled with 
jffs2 fs support on debug level 1!

I have partitioned my dataflash as follows
at91_dataflash: AT45DB642 detected [spi0] (8650752 bytes)
Creating 4 MTD partitions on "AT45DB642.spi0":
0x00000000-0x00021000 : "boot_area"
0x00021000-0x00129000 : "kernel"
0x00129000-0x002b5000 : "service"
0x002b5000-0x00840000 : "filesystem"

I'm using at45db642 like Scott Shumate!

//I'm doing the following steps :

#mkfs.jffs2 -e0x2100KiB -n -l -o service.img -r ~/service/
#flash_eraseall /dev/mtd2
Erasing 1 Kibyte @ 18bbe0 -- 99 % complete

#flashcp -v service.img /dev/mtd2
Erasing blocks: 6/6 (100%)
Writing data: 6k/6k (100%)
Verifying data: 6k/6k (100%)

#mount -t jffs2 /dev/mtdblock2 /mnt
JFFS2 write-buffering enabled buffer (1056) erasesize (8448)

#ls /mnt
... and I see the files, and can read too - everything seems to okay!

but any write action causes the following :

jffs2_flash_writev(): Non-contiguous write to 00000030
wbuf was previously 000014a0-000018b8
kernel BUG at fs/jffs2/wbuf.c:786!
Unable to handle kernel NULL pointer dereference at virtual address 00000000
pgd = c1030000
[00000000] *pgd=2102f031, *pte=00000000, *ppte=00000000
Internal error: Oops: 817 [#1]
Modules linked in:
CPU: 0
PC is at __bug+0x40/0x54
LR is at 0x1
pc : [<c0024ba4>]    lr : [<00000001>]    Not tainted
sp : c033bc90  ip : 60000093  fp : c033bc9c
r10: 000014a0  r9 : 00000000  r8 : 00000000
r7 : 00000030  r6 : c038ba00  r5 : 00000418  r4 : 00000000
r3 : 00000000  r2 : 00000000  r1 : 0000908f  r0 : 00000001
Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  Segment user
Control: C000317F  Table: 21030000  DAC: 00000015
Process vi (pid: 699, stack limit = 0xc033a250)
Stack: (0xc033bc90 to 0xc033c000)
...
...
Backtrace:
[<c0024b64>] (__bug+0x0/0x54) from [<c00d63d4>] 
(jffs2_flash_writev+0x19c/0x470)
[<c00d623c>] (jffs2_flash_writev+0x4/0x470) from [<c00d6700>] 
(jffs2_flash_write
+0x58/0x60)
[<c00d66a8>] (jffs2_flash_write+0x0/0x60) from [<c00c907c>] 
(jffs2_mark_node_obs
olete+0x600/0x768)
 r6 = C033BD34  r5 = C038BA00  r4 = C033BD2C
[<c00c8a7c>] (jffs2_mark_node_obsolete+0x0/0x768) from [<c00c661c>] 
(jffs2_obsol
ete_node_frag+0x50/0x64)
[<c00c65cc>] (jffs2_obsolete_node_frag+0x0/0x64) from [<c00c66e4>] 
(jffs2_trunca
te_fragtree+0xb4/0x11c)
 r4 = 00000000
[<c00c6630>] (jffs2_truncate_fragtree+0x0/0x11c) from [<c00d207c>] 
(jffs2_do_set
attr+0x5d8/0x6f0)
 r8 = C13C11D4  r7 = C10244F8  r6 = 00000000  r5 = 00000000
 r4 = 00000000
[<c00d1aa4>] (jffs2_do_setattr+0x0/0x6f0) from [<c00d21a8>] 
(jffs2_setattr+0x14/
0x18)
[<c00d2194>] (jffs2_setattr+0x0/0x18) from [<c008ace4>] 
(notify_change+0x134/0x2
44)
[<c008abb0>] (notify_change+0x0/0x244) from [<c006e07c>] 
(do_truncate+0x5c/0x78)

[<c006e020>] (do_truncate+0x0/0x78) from [<c007fd40>] (may_open+0x1a8/0x1e4)
 r5 = C13C11D4  r4 = 00000242
[<c007fb98>] (may_open+0x0/0x1e4) from [<c007fff8>] (open_namei+0x27c/0x6bc)
 r7 = C0017E28  r6 = C033BF04  r5 = 00000000  r4 = FFFFFFEB
[<c007fd7c>] (open_namei+0x0/0x6bc) from [<c006f05c>] 
(do_filp_open+0x2c/0x48)
[<c006f030>] (do_filp_open+0x0/0x48) from [<c006f3ac>] 
(do_sys_open+0x54/0xe4)
 r5 = 000001B4  r4 = 00000241
[<c006f358>] (do_sys_open+0x0/0xe4) from [<c006f460>] (sys_open+0x24/0x28)
[<c006f43c>] (sys_open+0x0/0x28) from [<c0020d20>] 
(ret_fast_syscall+0x0/0x2c)
Code: 1b00444d e59f0014 eb00444b e3a03000 (e5833000)
 Segmentation fault
                   # <7>jffs2_write_super()
jffs2_thread_should_wake(): nr_free_blocks 191, nr_erasing_blocks 0, 
dirty_size
0x0: no

Any help would be great! Thanks in advance!

Best Regards
    Zsolt Demi
