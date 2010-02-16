Received: from mtaout03-winn.ispmail.ntl.com ([81.103.221.49])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NhN3Z-0006TY-BF
	for linux-mtd@lists.infradead.org; Tue, 16 Feb 2010 13:01:41 +0000
Received: from aamtaout01-winn.ispmail.ntl.com ([81.103.221.35])
	by mtaout03-winn.ispmail.ntl.com
	(InterMail vM.7.08.04.00 201-2186-134-20080326) with ESMTP id
	<20100216130123.NRPU10950.mtaout03-winn.ispmail.ntl.com@aamtaout01-winn.ispmail.ntl.com>
	for <linux-mtd@lists.infradead.org>; Tue, 16 Feb 2010 13:01:23 +0000
Received: from Parkytowers.ntlworld.com ([86.30.40.23])
	by aamtaout01-winn.ispmail.ntl.com
	(InterMail vG.2.02.00.01 201-2161-120-102-20060912) with ESMTP id
	<20100216130122.LEIL13254.aamtaout01-winn.ispmail.ntl.com@Parkytowers.ntlworld.com>
	for <linux-mtd@lists.infradead.org>; Tue, 16 Feb 2010 13:01:22 +0000
Date: Tue, 16 Feb 2010 12:56:22 +0000
To: linux-mtd@lists.infradead.org
From: David Parkinson <parky_dw@ntlworld.com>
Subject: M-Systems DiskOnChip problems
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Message-Id: <20100216130122.LEIL13254.aamtaout01-winn.ispmail.ntl.com@Parkytowers.ntlworld.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm trying to use an 32MB DOC 2000 chip (MD2202-D32) in a Geode 
GX1-based thin client - namely a Neoware Capio 620.  (This is old 
technology from 2003). Up to now I've been running Linux off a 
Compact Flash card on the IDE interface, but I'd like to make use of the DOC.

After wandering around the FFS documentation for a while I decided 
use to start with e2fs on NFTL on the MTD drivers.

Currently the DOC has Windows CE on it and is formatted with the old 
M-Systems TrueFFS.

Compile a 2.6.29.1 with the NAND drivers and NFTL enabled.  Initially 
fine, the DOC is detected on bootup:

....
DiskOnChip found at 0xd8000
DiskOnChip 2000 responds to DWORD access
Detected 1 chips per floor.
NAND device: Manufacturer ID: 0xec, Chip ID: 0x75 (Samsung NAND 32MiB 
3,3V 8-bit)
ECC error scanning DOC at 0x10000
Found DiskOnChip ANAND Media Header at 0x10000
ECC error scanning DOC at 0x14000
Found DiskOnChip ANAND Media Header at 0x14000
     DataOrgID        = ANAND
     NumEraseUnits    = 2044
     FirstPhysicalEUN = 4
     FormattedSize    = 32768000
     UnitSizeFactor   = 255
Bad block table at page 129, version 0x55
Bad block table at page 161, version 0x55
mtd: Giving out device 0 to DiskOnChip 2000 (NFTL Model)
Found alias of DOC at 0xd8000 to 0xda000
....

I can access it as a serial device (hexdump -C /dev/mtd0).

With the NFTL in the kernel the start-up time is extended as the code 
scans the entire 32MB and does occasional writes:

....
nand_read_oob: from = 0x01fefc00, len = 16
nand_read_oob: from = 0x01fefe00, len = 16
nand_write_oob: to = 0x01fec200, len = 8
nand_read_oob: from = 0x01ff0000, len = 8
nand_read_oob: from = 0x01ff0200, len = 8
nand_read_oob: from = 0x01ff0200, len = 8
nand_read_oob: from = 0x01ff0000, len = 16
....

(I've switched on debugging at Level 3).

If I try and format it:
    mke2fs /dev/nftla
It hangs after it prints "Writing superblocks" (or similar) and in 
the log file I find:

....
nand_read_oob: from = 0x01ffc000, len = 8
nand_write_oob: to = 0x01ffc000, len = 8
BUG: unable to handle kernel paging request at d0c19280
IP: [<c023114f>] 0xc023114f
*pde = 00000000
Oops: 0002 [#1]
last sysfs file: /sys/kernel/uevent_seqnum
Modules linked in: vfat fat snd_cs5530 snd_sb16_dsp snd_sb_common 
squashfs snd_pcm snd_timer scsi_wait_scan snd soundcore 
snd_page_alloc 8139cp 8139too

Pid: 29, comm: nftld Not tainted (2.6.29.1-tinycoreMTD #16)
EIP: 0060:[<c023114f>] EFLAGS: 00010282 CPU: 0
EAX: 00000004 EBX: ccf25f80 ECX: 00000004 EDX: 00000010
ESI: ccf25f80 EDI: d0c19280 EBP: ccf150d0 ESP: ccf25ea8
  DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068
Process nftld (pid: 29, ti=ccf24000 task=ccec3cc0 task.ti=ccf24000)
Stack:
  ccf150d0 00000200 00000000 cd999000 ccf150d0 c023162a 00000200 ccf15000
  0000ffe0 ffffffff ccf25f80 0000ffe0 cd999000 00000000 00000000 0000001f
  0000ffff 01ffc000 00000000 ccf25f50 ccf15000 c023172d ccf25f50 c022f159
Call Trace:
  [<c023162a>] 0xc023162a
  [<c023172d>] 0xc023172d
  [<c022f159>] 0xc022f159
  [<c022f243>] 0xc022f243
  [<c022e28a>] 0xc022e28a
  [<c022e16d>] 0xc022e16d
  [<c0121754>] 0xc0121754
  [<c012171d>] 0xc012171d
  [<c01030b7>] 0xc01030b7
Code: 89 c5 8b 01 89 d3 83 f8 01 8b 51 0c 74 2c 72 09 83 f8 02 0f 85 
94 00 00 00 89 d0 8b bd 84 00 00 00 c1 e8 02 03 79 14 89 de 89 c1 
<f3> a5 89 d1 83 e1 03 74 02 f3 a4 01 d3 eb 77 8b 85 ac 00 00 00
EIP: [<c023114f>]  SS:ESP 0068:ccf25ea8
---[ end trace dfc1d6a2b4c7b2c5 ]---
.....

So after a visit to the MTD website (today) from whence I got the 
current image of MTD-2.6 I built a new kernel 2.6.32

Now, without the NFTL module things are as before in that the DOC is 
found and can be listed using hexdump -C /dev/mtd0.  If I include 
NFTL in the kernel build it now dies at the end of the scan of the device:

The last few messages I see on the system console are:
nand_do_read_oob: from 0x01fffc00, len = 16
nand_do_read_oob: from 0x01fffc00, len = 16
nand_do_write_oob: to = 0x01ffc200, len = 8

Any pointers or suggestions as to where I should go next?

Regards

David
