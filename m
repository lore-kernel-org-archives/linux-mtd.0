Received: from avanto.mpei.ac.ru ([193.233.71.179])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CKCsy-00027n-Ld
	for linux-mtd@lists.infradead.org; Wed, 20 Oct 2004 05:36:06 -0400
Received: from skorinkod.lan ([10.255.2.21])
	by avanto.mpei.ac.ru with esmtp (Exim 3.36 #1 (Debian))
	id 1CKCse-0006EM-00
	for <linux-mtd@lists.infradead.org>; Wed, 20 Oct 2004 13:35:40 +0400
From: Dmitry Skorinko <skorinkod@mosk.ru>
To: linux-mtd@lists.infradead.org
Date: Wed, 20 Oct 2004 13:37:08 +0400
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200410201337.08514.skorinkod@mosk.ru>
Subject: diskonchip and last cvs
Reply-To: skorinkod@mail.ru
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I have:
1) DiskOnChip 2000 256Mb
2) 2.6.8.1 kernel source (2.6.8-7 Debian edition)
3) todays cvs tree of mtd drivers

+ this patch from Kalev Lember, but for last diskonchip.c file:

RCS file: /home/cvs/mtd/drivers/mtd/nand/diskonchip.c,v
retrieving revision 1.38
diff -u -r1.38 diskonchip.c
--- diskonchip.c        5 Oct 2004 22:11:46 -0000       1.38
+++ diskonchip.c        11 Oct 2004 12:58:01 -0000
@@ -1409,13 +1409,9 @@
                return ret;
        memset((char *) parts, 0, sizeof(parts));
        numparts = inftl_partscan(mtd, parts);
-       /* At least for now, require the INFTL Media Header.  We could 
probably
-          do without it for non-INFTL use, since all it gives us is
-          autopartitioning, but I want to give it more thought. */
-       if (!numparts) return -EIO;
        add_mtd_device(mtd);
 #ifdef CONFIG_MTD_PARTITIONS
-       if (!no_autopart)
+       if (!no_autopart && numparts > 0)
                add_mtd_partitions(mtd, parts, numparts);
 #endif

it must help me with flash without headers...

#modprobe inftl
#modprobe diskonchip
Segmetation fault
#dmesg

---skip---
INFTL: inftlcore.c $Revision: 1.17 $, inftlmount.c $Revision: 1.14 $
DiskOnChip found at 0xe0000
Detected 2 chips per floor.
NAND device: Manufacturer ID: 0xec, Chip ID: 0x79 (Samsung NAND 128MiB 3,3V 
8-bit)
2 NAND chips detected
Bad block table found at page 524256, version 0x55
Bad block table not found for chip 0
nand_read_bbt: Reserved block at 0x00000000
nand_read_bbt: Bad block at 0x00080000
nand_read_bbt: Bad block at 0x000c4000
nand_read_bbt: Bad block at 0x000d4000
nand_read_bbt: Bad block at 0x08080000
nand_read_bbt: Bad block at 0x08124000
nand_read_bbt: Bad block at 0x08134000
nand_read_bbt: Bad block at 0x09600000
nand_read_bbt: Reserved block at 0x0fffc000
Unable to handle kernel NULL pointer dereference at virtual address 0000000c
 printing eip:
c80ac094
*pde = 00000000
Oops: 0000 [#1]
PREEMPT
Modules linked in: diskonchip reed_solomon nand nand_ids nand_ecc mtdpart 
inftl mtd_blkdevs mtdcore ipv6 af_packet 8139too mii crc32 usbkbd usbcore rtc 
ext3 jbd ide_generic sis5513 ide_disk ide_core unix
CPU:    0
EIP:    0060:[<c80ac094>]    Not tainted
EFLAGS: 00010202   (2.6.8contr)
EIP is at doc_ecc_decode+0x94/0x269 [diskonchip]
eax: 01b901b9   ebx: 000001b9   ecx: 00000000   edx: 000001b9
esi: c6541ddc   edi: 00000004   ebp: c6541ddc   esp: c6541cc8
ds: 007b   es: 007b   ss: 0068
Process modprobe (pid: 690, threadinfo=c6540000 task=c6b2c0d0)
Stack: c6540000 21541d4c 00000001 c0115375 c03017e0 01b9033a 01f90344 c6541d4c
       c010eb0f c6541d4c c6541d4c 033a033a 033a033a c6541cfc c6541cfc 20000001
       00000001 c0301928 0000000a c024e098 c0117a58 c0301928 00000000 c00e0000
Call Trace:
 [<c0115375>] profile_hook+0x1c/0x31
 [<c010eb0f>] smp_local_timer_interrupt+0xc/0x91
 [<c0117a58>] __do_softirq+0x34/0x73
 [<c80acfe3>] doc200x_correct_data+0x107/0x15a [diskonchip]
 [<c80d80c4>] nand_read_ecc+0x430/0x759 [nand]
 [<c80da077>] read_abs_bbt+0xad/0xbc [nand]
 [<c80d7c90>] nand_read+0x21/0x25 [nand]
 [<c8076196>] find_media_headers+0x58/0x14f [diskonchip]
 [<c807675c>] inftl_scan_bbt+0x210/0x3d7 [diskonchip]
 [<c80d9cd0>] nand_scan+0x7cf/0x7d8 [nand]
 [<c8076137>] doc2000_count_chips+0x4e/0x55 [diskonchip]
 [<c8077204>] init_module+0x8e1/0x997 [diskonchip]
 [<c0126785>] sys_init_module+0xea/0x1db
 [<c0104f27>] syscall_call+0x7/0xb
Code: 8b 41 0c 66 8b 14 50 8b 74 24 08 66 89 54 24 04 31 ff 69 f6

if only #modprobe diskonchip - same
if use without patch - same

if I use standart kernel source drivers from 2.6.8-7 package + this patch:

#modprobe inftl
#modprobe diskonchip
Segmetation fault

errors with inftl here

#modprobe nftl
#modprobe diskonchip

Wow, mtd layer is work (in /proc/mtd i have "DiskOnChip 2000 (INFTL Model)"), 
but i dont have nftl:
-
Could not find valid boot record
Could not mount NFTL device
-
nftl_format work correctly but don't help... 


I have other same flash with normal nand headers, but without nftl headers and 
situation is same, but I don't need this patch and flash have 2 partitions, 
etc..   no nftl...

Dmitry
