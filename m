Received: from orngca-mls01.socal.rr.com ([66.75.160.16])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19PAfD-0003RS-VW
	for <linux-mtd@lists.infradead.org>; Mon, 09 Jun 2003 01:37:32 +0100
Received: from [192.168.2.4] (66-75-241-113.san.rr.com [66.75.241.113])
	h590ZKM08471	for <linux-mtd@lists.infradead.org>;
	Sun, 8 Jun 2003 17:35:21 -0700 (PDT)
From: roger <rogerxxmaillist@san.rr.com>
To: linux-mtd@lists.infradead.org
Message-Id: <1055118239.10424.49.camel@localhost3.localdomain>
Mime-Version: 1.0
Date: 08 Jun 2003 17:23:59 -0700
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Subject: Problems with using doc2001 module
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

For the past couple of days and using every available option with
docprobe (kernel compile time options), I have not been able to get the
several DiskOnChips-2001 recognized by kernel 2.4.20.

by a fluke accident, i've gotten the DOC recognized.

I'm on a 2x750P3 SMP Tyan Tiger 1832dl and induced a "kernel oops" on
cpu1 by trying to insmod ./bios.o
(http://www.openbios.info/download/index.html
devbios-0.3.2.tar.gz).

the docprobe.o is compiled with "Physical Address = 0" and no other
options for docprobe.o.  ... using doc2001.o

i've attached dmesg output below of the oops condition  when trying to
insmod bios.o and then after the kernel-oops occurred, modprobed
mtdcore, mtdchar,dos2001,dosprobe doc_config_location=0xfff00000. 
(unknown if the doc_config_location is needed...have yet to try without
as i've only duplicated 3 times.)

(i've been advised that there might be a "hidden write enable" problem -
i.e. there is a special GPIO line used to control write enable in
addition to the normal mechanism.)

-- 

Roger
http://www.eskimo.com/~roger/index.html


Jun  8 14:05:36  No recognised DiskOnChip devices found
Jun  8 14:06:22  Using configured DiskOnChip probe address 0xfff00000
Jun  8 14:06:22  Possible DiskOnChip with unknown ChipID FF found at
0xfff00000
Jun  8 14:06:22  No recognised DiskOnChip devices found
Jun  8 14:07:18  BIOS driver v0.3.2 (writing disabled) for
2.4.20-gaming-r3
Jun  8 14:07:18  BIOS: host bridge is 8086, 7190, 0
Jun  8 14:07:18  BIOS: isa bridge is 8086, 7110, 38
Jun  8 14:07:18  BIOS: Probing PCI device with 64k rom
Jun  8 14:07:18  BIOS: Probing PCI device with 1024k rom
Jun  8 14:07:18  BIOS: Probing PCI device with 64k rom
Jun  8 14:07:18  BIOS: No flash devices found.
Jun  8 14:07:41  BIOS driver v0.3.2 (writing disabled) for
2.4.20-gaming-r3
Jun  8 14:07:41  BIOS: host bridge is 8086, 7190, 0
Jun  8 14:07:41  BIOS: isa bridge is 8086, 7110, 38
Jun  8 14:07:41  Unable to handle kernel NULL pointer dereference at
virtual address 00000000
Jun  8 14:07:41  printing eip:
Jun  8 14:07:41  fdc7245a
Jun  8 14:07:41  *pde = 00000000
Jun  8 14:07:41  Oops: 0000
Jun  8 14:07:41  bios agpgart nvidia parport_pc lp parport mousedev
sr_mod sd_mod sg emu10k1 sound soundcore ac97_codec scanner usb-storage
hid input usb-ohci uhci supermount eepro100 mii raid1 raid0 md ide-scsi
scsi_mod  
Jun  8 14:07:41  CPU:    1
Jun  8 14:07:41  EIP:    0010:[<fdc7245a>]    Tainted: P 
Jun  8 14:07:41  EFLAGS: 00010046
Jun  8 14:07:41  eax: 00000000   ebx: f70da000   ecx: 8000384c   edx:
00000000
Jun  8 14:07:41  esi: 00000000   edi: 00000292   ebp: 00000000   esp:
f70dbe80
Jun  8 14:07:41  ds: 0018   es: 0018   ss: 0018
Jun  8 14:07:41  Process insmod (pid: 2010, stackpage=f70db000)
Jun  8 14:07:41  Stack: fdc71ae1 00000000 00000000 fde84000 00201000
f74db280 00000000 f74db280 
Jun  8 14:07:41  000001f0 f74db2ec 00200000 ffe00000 ffffffff 00000000
c0118bc1 00200000 
Jun  8 14:07:41  00000001 00000000 c011f3e0 ffffffea 00000000 00000000
00000000 fdc71df8 
Jun  8 14:07:41  Call Trace: [<fdc71ae1>]  [<c0118bc1>]  [<c011f3e0>] 
[<fdc71df8>]  [<fdc719c0>]  [<fdc74140>]  [<fdc700b3>]  [<fdc74000>] 
[<fdc735ca>]  [<c0120634>]  [<fdc70060>]  [<fdc70060>]  [<c010787f>] 
Jun  8 14:07:41  Code: 0f b6 04 10 0f b6 c0 c3 8d b4 26 00 00 00 00 8d
bc 27 00 00 
Jun  8 14:07:47  <6>Using configured DiskOnChip probe address 0xfff00000
Jun  8 14:07:47  DiskOnChip Millennium found at address 0xFFF00000
Jun  8 14:07:47  Flash chip found: Manufacturer ID: 98, Chip ID: E6
(Toshiba TC58V64AFT/DC)
Jun  8 14:07:47  1 flash chips found. Total DiskOnChip size: 8 MiB
Jun  8 14:08:33  Using configured DiskOnChip probe address 0xfff00000
Jun  8 14:08:33  DiskOnChip Millennium found at address 0xFFF00000
Jun  8 14:08:33  Flash chip found: Manufacturer ID: 98, Chip ID: E6
(Toshiba TC58V64AFT/DC)
Jun  8 14:08:33  1 flash chips found. Total DiskOnChip size: 8 MiB
Jun  8 14:08:43  NFTL driver: nftlcore.c $Revision: 1.85 $, nftlmount.c
$Revision: 1.25 $
Jun  8 14:08:44  nftla: p1
Jun  8 14:08:44  devfs_register(disc): NULL ops, got fde8a810 from major
table
Jun  8 14:08:44  devfs_register(part1): NULL ops, got fde8a810 from
major table
