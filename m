Received: from avanto.mpei.ac.ru ([193.233.71.179])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1COXOq-000101-Qc
	for linux-mtd@lists.infradead.org; Mon, 01 Nov 2004 03:18:53 -0500
Received: from skorinkod.lan ([10.255.2.21])
	by avanto.mpei.ac.ru with esmtp (Exim 3.36 #1 (Debian))
	id 1COXOV-0007KC-00
	for <linux-mtd@lists.infradead.org>; Mon, 01 Nov 2004 11:18:27 +0300
From: Dmitry Skorinko <skorinkod@mosk.ru>
To: linux-mtd@lists.infradead.org
Date: Mon, 1 Nov 2004 12:18:33 +0300
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200411011218.33494.skorinkod@mosk.ru>
Subject: input/output errors
Reply-To: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all..
It's my attempt number...

kernel 2.6.8.1

#modprobe diskonchip

#dmesg
--skip--
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
ECC error scanning DOC at 0x0
DiskOnChip BNAND Media Header not found.
Found alias of DOC at 0xe0000 to 0xe2000
Found alias of DOC at 0xe0000 to 0xe4000
Found alias of DOC at 0xe0000 to 0xe6000

# lsmod
Module                  Size  Used by
mtdchar                 6784  0
diskonchip             12184  0
nand                   26500  1 diskonchip
nand_ids                4224  1 nand
nand_ecc                2816  1 nand
docecc                  4608  1 diskonchip
mtdpart                 9600  2 diskonchip,nand
mtdcore                 7496  6 mtdchar,diskonchip,nand,mtdpart
--skip--

#cat /proc/mtd
dev:    size   erasesize  name
mtd0: 10000000 00004000 "DiskOnChip 2000 (INFTL Model)"

#mtd_debug info /dev/mtd0
mtd.type = MTD_NANDFLASH
mtd.flags = MTD_CLEAR_BITS | MTD_ERASEABLE | MTD_OOB | MTD_ECC
mtd.size = 268435456 (256M)
mtd.erasesize = 16384 (16K)
mtd.oobblock = 512
mtd.oobsize = 16
mtd.ecctype = (unknown ECC type - new MTD API maybe?)
regions = 0

"new MTD API" ?? Is it dangerous for drivers work?

#flash_info /dev/mtd0
Device /dev/mtd0 has 0 erase regions

#flash_eraseall /dev/mtd0
Erasing 16 Kibyte @ 0 --  0 % complete.
./flash_eraseall: /dev/mtd0: MTD Erase failure: Input/output error
Erasing 16 Kibyte @ 80000 --  0 % complete.
./flash_eraseall: /dev/mtd0: MTD Erase failure: Input/output error
Erasing 16 Kibyte @ c4000 --  0 % complete.
./flash_eraseall: /dev/mtd0: MTD Erase failure: Input/output error
Erasing 16 Kibyte @ d4000 --  0 % complete.
./flash_eraseall: /dev/mtd0: MTD Erase failure: Input/output error
Erasing 16 Kibyte @ 5e14000 --  4 % complete.
./flash_eraseall: /dev/mtd0: MTD Erase failure: Input/output error
Erasing 16 Kibyte @ 8080000 --  2 % complete.
./flash_eraseall: /dev/mtd0: MTD Erase failure: Input/output error
Erasing 16 Kibyte @ 8124000 --  2 % complete.
./flash_eraseall: /dev/mtd0: MTD Erase failure: Input/output error
Erasing 16 Kibyte @ 8134000 --  2 % complete.
./flash_eraseall: /dev/mtd0: MTD Erase failure: Input/output error
Erasing 16 Kibyte @ 9600000 -- 10 % complete.
./flash_eraseall: /dev/mtd0: MTD Erase failure: Input/output error
Erasing 16 Kibyte @ fffc000 --  3 % complete.
./flash_eraseall: /dev/mtd0: MTD Erase failure: Input/output error

What is it? I don't understand, did programm finish her work?

#nftl_format /dev/mtd0
$Id: nftl_format.c,v 1.22 2004/05/05 15:19:57 dwmw2 Exp $
Phase 1. Checking and erasing Erase Zones from 0x00000000 to 0x07800000
         Erasing Zone #0 @ 0x0: Erase failed (Input/output error)
Skipping bad zone (factory marked) #32 @ 0x80000
Skipping bad zone (factory marked) #49 @ 0xc4000
Skipping bad zone (factory marked) #53 @ 0xd4000
        Checking Zone #3014 @ 0x2f18000: Block not zero after clearing
Skipping bad zone (RWE test failed) #3014 @ 0x2f18000
        Checking Zone #4234 @ 0x4228000: Block not zero after clearing
Skipping bad zone (RWE test failed) #4234 @ 0x4228000
         Erasing Zone #6021 @ 0x5e14000: Erase failed (Input/output error)
        Checking Zone #7679 @ 0x77fc000
Phase 2.a Writing NFTL Media Header and Bad Unit Table
Phase 2.b Writing Spare NFTL Media Header and Spare Bad Unit Table
Phase 3. Writing Unit Control Information to each Erase UnitINFTL: inftlcore.c 

#modprobe inftl
#dmesg
--skip--
INFTL: inftlcore.c $Revision: 1.17 $, inftlmount.c $Revision: 1.14 $
INFTL: could not find valid boot record?
INFTL: could not mount device

#rmmod inftl
#modprobe nftl
Segmentation fault
#dmesg
--skip--
NFTL driver: nftlcore.c $Revision: 1.96 $, nftlmount.c $Revision: 1.36 $
Formatting block 3014
Unable to handle kernel NULL pointer dereference at virtual address 00000100
 printing eip:
c802a711
*pde = 00000000
Oops: 0000 [#1]
PREEMPT
Modules linked in: nftl mtd_blkdevs mtdchar diskonchip nand nand_ids nand_ecc 
docecc mtdpart mtdcore ipv6 af_packet dm_mod 8139too mii crc32 usbkbd usbcore 
rtc ext3 jbd ide_generic sis5513 ide_disk ide_core unix
CPU:    0
EIP:    0060:[<c802a711>]    Not tainted
EFLAGS: 00010246   (2.6.8patch26)
EIP is at mtd_erase_callback+0x6/0x3b [mtdpart]
eax: 00004000   ebx: c63a3568   ecx: c67f3e78   edx: 00000000
esi: 000178e0   edi: c67f3e78   ebp: 00000000   esp: c5c9beb8
ds: 007b   es: 007b   ss: 0068
Process modprobe (pid: 859, threadinfo=c5c9a000 task=c61ca130)
Stack: c810a10e c67f3e78 00000000 00000020 c67f3e78 c67f3e00 c67f3ea8 00000bc6
       c8109f69 c63a3400 c67f3e78 00000000 c80cf0ea c63a3400 c67f3e78 00000008
       00000000 3c693c69 00000bc6 c67f3e00 c67f3e00 00000bc6 c80cf571 c67f3e00
Call Trace:
 [<c810a10e>] nand_erase_nand+0x1a1/0x1b9 [nand]
 [<c8109f69>] nand_erase+0xf/0x13 [nand]
 [<c80cf0ea>] NFTL_formatblock+0x88/0x112 [nftl]
 [<c80cf571>] NFTL_mount+0x139/0x3bc [nftl]
 [<c80ce0bb>] nftl_add_mtd+0xbb/0x1b0 [nftl]
 [<c80ac96f>] register_mtd_blktrans+0x191/0x1b0 [mtd_blkdevs]
 [<c802e019>] init_module+0x19/0x1d [nftl]
 [<c012af8c>] sys_init_module+0xe3/0x1d4
 [<c0105f97>] syscall_call+0x7/0xb
Code: 81 ba 00 01 00 00 cf a6 02 c8 75 1d 8b 41 0c 83 f8 ff 74 09



If I use last cvs - I have not even diskonchip.....  see previous my post


help
