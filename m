Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13Bluf-0001oG-00
	for mtd-list@infradead.org; Mon, 10 Jul 2000 23:20:29 +0100
Received: from web5304.mail.yahoo.com ([216.115.106.113])
	by infradead.org with smtp (Exim 3.03 #1)
	id 13Blud-0001ng-00
	for mtd@infradead.org; Mon, 10 Jul 2000 23:20:27 +0100
Message-ID: <20000710221950.8117.qmail@web5304.mail.yahoo.com>
Date: Mon, 10 Jul 2000 18:19:50 -0400 (EDT)
From: Juan Gonzo <kayemmess@yahoo.ca>
Subject: mtd devices & jffs
To: MTD Mailing List <mtd@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Compiled the MTD code into a Linux 2.2.14 kernel and
loaded it onto our system (ARM processor and Intel Strataflash).

The system boots up.  Here is the MTD related messages:

=======================================

NORA: Found a coupled pair of CFI devices at location 0 in 16 bit mode
Primary Vendor Command Set: 0001 (Intel/Sharp Extended)
Primary Algorithm Table at 0031
Alternative Vendor Command Set: 0000 (None)
No Alternate Algorithm Table
Vcc Minimum: 2.7 V
Vcc Maximum: 3.6 V
No Vpp line
Typical byte/word write timeout: 128 탎
Maximum byte/word write timeout: 2048 탎
Typical full buffer write timeout: 128 탎
Maximum full buffer write timeout: 2048 탎
Typical block erase timeout: 1024 탎
Maximum block erase timeout: 16384 탎
Chip erase not supported
Device size: 0x1000000 bytes (16 Mb)
Flash Device Interface description: 0x0002
  - supports x8 and x16 via BYTE# with asynchronous interface
Max. bytes in buffer write: 0x20
Number of Erase Block Regions: 1
  Erase Region #0: BlockSize 0x20000 bytes, 128 blocks
 
 Intel/Sharp Extended Query Table at 0x0031
number of CFI chips: 1

=======================================

Everything looks ok.  I can't get the MAKEDEV script to
run on our system, so I try to do a couple manually.  I
enter 'mknod /dev/mtd0 c 90 0' and then 
'mknod /dev/mtdblock0 b 31 0'.  Both work and the devices
are present in the /dev dir.  However when I try to mount
JFFS using 'mount -t jfss /dev/mtdblock0 /mnt', I get the
following:

=======================================

[root@Linux /dev]$mount -t jffs /dev/mtdblock0 /mnt
JFFS: Trying to mount device 1f:00.
jffs_scan_flash(): start pos = 0x0, end = 0x16777216
jffs_scan_flash(): 0xff at pos 0x0.
jffs_scan_flash(): 0xff ended at pos 0x1097152.
jffs_scan_flash(): 0x00 at pos 0x1097152.
jffs_scan_flash(): 0x00 ended at pos 0x1098176.
*************** Dirty flash memory or bad inode: hexdump(pos =
0x1098176, len =
128):
1098176: 0018 0000 0018 0000 3d00 0000 ac05 0000  ........=.......
1098192: 8f16 0000 0100 0000 0000 0000 0000 0000  ................
1098208: 0020 0000 0020 0000 0018 0000 8618 5d39  ..............]9
1098224: ea18 5d39 0100 1400 53ef 0100 0100 0000  ..]9....S.......
1098240: 8518 5d39 004e ed00 0000 0000 0100 0000  ..]9.N..........
1098256: 0000 0000 0b00 0000 8000 0000 0000 0000  ................
1098272: 0200 0000 0100 0000 d285 611c 3947 4857  ..........a.9GHW
1098288: a6c2 3cee 5e93 efb7 0000 0000 0000 0000  ..<.^...........
Didn't read all bytes in flash_read_u32()
Didn't read all bytes in flash_read_u32()
Didn't read [etc, this line goes on for many many screens]

=======================================

Do I need to 'mknod' all the devices that MAKEDEV does?
To me, this seems like a problem beyond that.

Any suggestions as to what is going on?  Is it my flash?

Thanks,
   -- kelly



_______________________________________________________
Do You Yahoo!?
Get your free @yahoo.ca address at http://mail.yahoo.ca


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
