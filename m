Received: from avanto.mpei.ac.ru ([193.233.71.179] helo=avanto.org)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CWAEE-0006eo-Qx
	for linux-mtd@lists.infradead.org; Mon, 22 Nov 2004 04:11:44 -0500
Received: from skorinkod.lan ([10.255.2.21])
	by avanto.mpei.ac.ru with esmtp (Exim 3.36 #1 (Debian))
	id 1CWADk-0000ke-00
	for <linux-mtd@lists.infradead.org>; Mon, 22 Nov 2004 12:10:52 +0300
From: Dmitry Skorinko <skorinkod@mosk.ru>
To: linux-mtd@lists.infradead.org
Date: Mon, 22 Nov 2004 12:11:12 +0300
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200411221211.12394.skorinkod@mosk.ru>
Subject: mkfs.ext3 - segmentation fault
Reply-To: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2.6.8-1 + mtd snapshot (about 2 week ago)

#modprobe inftl
#modprobe diskonchip
#cat /proc/mtd
dev:    size   erasesize  name
mtd0: 10000000 00004000 "DiskOnChip 2000 (INFTL Model)"
mtd1: 0ffe8000 00004000 " DiskOnChip BDTL partition"
#fdisk -l /dev/inftla

Disk /dev/inftla: 262 MB, 262946816 bytes
16 heads, 32 sectors/track, 1003 cylinders
Units = cylinders of 512 * 512 = 262144 bytes

      Device Boot      Start         End      Blocks   Id  System
/dev/inftla1   *           1        1003      256752   83  Linux

#mkfs.ext3 /dev/inftla1
Segmentation fault
#dmesg
--skip--
nand_read_oob: from = 0x00027a00, len = 8
nand_read_oob: from = 0x00027c00, len = 8
nand_read_oob: from = 0x00027e00, len = 8
INFTL: deleting empty VUC 2
Deleting EUN 9 from VUC 2
INFTL: INFTL_formatblock(inftl=c7554200,block=9)
nand_erase: start = 0x00024000, len = 16384
nand_isbad_bbt(): bbt info for offs 0x00024000: (block 0) 0x09
Unable to handle kernel NULL pointer dereference at virtual address 00000100
 printing eip:
c8065711
*pde = 00000000
Oops: 0000 [#1]
PREEMPT
Modules linked in: diskonchip reed_solomon nand nand_ids nand_ecc mtdpart 
inftl mtd_blkdevs mtdcore ipv6 af_packet 8139too mii crc32 usbkbd usbcore rtc 
ext3 jbd ide_generic sis5513 ide_disk ide_core sd_mod ata_piix libata 
scsi_mod unix
CPU:    0
EIP:    0060:[<c8065711>]    Not tainted
EFLAGS: 00010246   (2.6.8mymtd26)
EIP is at mtd_erase_callback+0x6/0x3b [mtdpart]
eax: 00004000   ebx: c60f1968   ecx: c7554300   edx: 00000000
esi: 00000140   edi: c7554300   ebp: 00000000   esp: c60c7db4
ds: 007b   es: 007b   ss: 0068
Process inftld (pid: 741, threadinfo=c60c6000 task=c6543180)
Stack: c810a458 c7554300 00000000 00000020 c7554300 c7554200 00000000 00000009
       c810a273 c60f1800 c7554300 00000000 c80b378b c60f1800 c7554300 0000001d
       00000002 c0117cc7 c6118004 c7554200 00000009 00000002 c80b290c c7554200
Call Trace:
 [<c810a458>] nand_erase_nand+0x1e1/0x1f7 [nand]
 [<c810a273>] nand_erase+0xf/0x13 [nand]
 [<c80b378b>] INFTL_formatblock+0x5c/0x116 [inftl]
 [<c0117cc7>] printk+0xfb/0x11b
 [<c80b290c>] INFTL_trydeletechain+0x1dd/0x22a [inftl]
 [<c80b2af1>] INFTL_deleteblock+0x198/0x1a6 [inftl]
 [<c0117cc7>] printk+0xfb/0x11b
 [<c80b2f01>] inftl_writeblock+0x402/0x40e [inftl]
 [<c01d75d9>] __end_that_request_first+0x193/0x1a3
 [<c8020096>] do_blktrans_request+0x96/0xcb [mtd_blkdevs]
 [<c8020208>] mtd_blktrans_thread+0x13d/0x18e [mtd_blkdevs]
 [<c0114c48>] default_wake_function+0x0/0x12
 [<c0105996>] ret_from_fork+0x6/0x20
 [<c0114c48>] default_wake_function+0x0/0x12
 [<c80200cb>] mtd_blktrans_thread+0x0/0x18e [mtd_blkdevs]
 [<c01041e1>] kernel_thread_helper+0x5/0xb
Code: 81 ba 00 01 00 00 cf 56 06 c8 75 1d 8b 41 0c 83 f8 ff 74 09

Help, plz.  Thanks.
Dmitry
