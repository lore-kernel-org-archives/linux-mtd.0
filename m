From: dave.bryant@neoware.com (David Bryant)
Date: Fri, 14 Feb 2003 02:22:08 -0500
Subject: DoC support compiled into kernel
Message-ID: <3E4C9920.6000102@neoware.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

When I use the DoC 2000 Millennium driver compiled into the kernel 
2.4.20, I cannot get it to work correctly, but when I use the modules, 
it works fine.
 
I am using an M-Systems DiskOnChip 2000 that has a three partitions and 
is formatted for ext2.  It works under 2.2.20 kernel with the DoC 
modules from M-Systems.
 
Here is the log file for bootup for when it is compiled into the kernel:

Jul 16 02:55:51 NEO-6A0010 kernel: Possible DiskOnChip with unknown 
ChipID 1E found at 0xc8000
Jul 16 02:55:51 NEO-6A0010 kernel: Possible DiskOnChip with unknown 
ChipID DD found at 0xca000
Jul 16 02:55:51 NEO-6A0010 kernel: Possible DiskOnChip with unknown 
ChipID FF found at 0xcc000
Jul 16 02:55:51 NEO-6A0010 kernel: Possible DiskOnChip with unknown 
ChipID FF found at 0xce000
Jul 16 02:55:51 NEO-6A0010 kernel: DiskOnChip 2000 found at address 0xD0000
Jul 16 02:55:51 NEO-6A0010 kernel: Flash chip found: Manufacturer ID: 
EC, Chip ID: 73 (Samsung KM29U128T)
Jul 16 02:55:51 NEO-6A0010 kernel: 1 flash chips found. Total DiskOnChip 
size: 16 MiB
Jul 16 02:55:51 NEO-6A0010 kernel: mtd: Giving out device 0 to 
DiskOnChip 2000
Jul 16 02:55:51 NEO-6A0010 kernel: Ignoring DiskOnChip 2000 at 0xD2000 - 
already configured
Jul 16 02:55:51 NEO-6A0010 kernel: Possible DiskOnChip with unknown 
ChipID FF found at 0xd4000
Jul 16 02:55:51 NEO-6A0010 kernel: Possible DiskOnChip with unknown 
ChipID FF found at 0xd6000
Jul 16 02:55:51 NEO-6A0010 kernel: Possible DiskOnChip with unknown 
ChipID FF found at 0xd8000
Jul 16 02:55:51 NEO-6A0010 kernel: Possible DiskOnChip with unknown 
ChipID FF found at 0xda000
Jul 16 02:55:51 NEO-6A0010 kernel: Possible DiskOnChip with unknown 
ChipID FF found at 0xdc000
Jul 16 02:55:51 NEO-6A0010 kernel: Possible DiskOnChip with unknown 
ChipID FF found at 0xde000
Jul 16 02:55:51 NEO-6A0010 kernel: Possible DiskOnChip with unknown 
ChipID FF found at 0xe0000
Jul 16 02:55:51 NEO-6A0010 kernel: Possible DiskOnChip with unknown 
ChipID FF found at 0xe2000
Jul 16 02:55:51 NEO-6A0010 kernel: Possible DiskOnChip with unknown 
ChipID FF found at 0xe4000
Jul 16 02:55:51 NEO-6A0010 kernel: Possible DiskOnChip with unknown 
ChipID FF found at 0xe6000
Jul 16 02:55:51 NEO-6A0010 kernel: Possible DiskOnChip with unknown 
ChipID FF found at 0xe8000
Jul 16 02:55:51 NEO-6A0010 kernel: Possible DiskOnChip with unknown 
ChipID FF found at 0xea000
Jul 16 02:55:51 NEO-6A0010 kernel: Possible DiskOnChip with unknown 
ChipID FF found at 0xec000
Jul 16 02:55:51 NEO-6A0010 kernel: Possible DiskOnChip with unknown 
ChipID FF found at 0xee000
Jul 16 02:55:51 NEO-6A0010 kernel: blkmtd: error, missing `device' name
Jul 16 02:55:51 NEO-6A0010 kernel: $Id: ftl.c,v 1.43 2002/02/13 15:31:37 
dwmw2 Exp $
Jul 16 02:55:51 NEO-6A0010 kernel: ftl_cs: FTL header not found.
Jul 16 02:55:51 NEO-6A0010 kernel: NFTL driver: nftlcore.c $Revision: 
1.85 $, nftlmount.c $Revision: 1.25 $
Jul 16 02:55:51 NEO-6A0010 kernel: NFTL_notify_add for DiskOnChip 2000
Jul 16 02:55:51 NEO-6A0010 kernel: NFTL_setup
Jul 16 02:55:51 NEO-6A0010 kernel: nftla:<6>NFTL_request
Jul 16 02:55:51 NEO-6A0010 kernel: NFTL read request of 0x2 sectors @ 0 
(req->nr_sectors == 8)
Jul 16 02:55:51 NEO-6A0010 kernel: NFTL read request completed OK
Jul 16 02:55:51 NEO-6A0010 kernel: NFTL_request
Jul 16 02:55:51 NEO-6A0010 kernel: NFTL read request of 0x2 sectors @ 2 
(req->nr_sectors == 6)
Jul 16 02:55:51 NEO-6A0010 kernel: NFTL read request completed OK
Jul 16 02:55:51 NEO-6A0010 kernel: NFTL_request
Jul 16 02:55:51 NEO-6A0010 kernel: NFTL read request of 0x2 sectors @ 4 
(req->nr_sectors == 4)
Jul 16 02:55:51 NEO-6A0010 kernel: NFTL read request completed OK
Jul 16 02:55:51 NEO-6A0010 kernel: NFTL_request
Jul 16 02:55:51 NEO-6A0010 kernel: NFTL read request of 0x2 sectors @ 6 
(req->nr_sectors == 2)
Jul 16 02:55:51 NEO-6A0010 kernel: NFTL read request completed OK
Jul 16 02:55:51 NEO-6A0010 kernel: p1 p2 p3
Jul 16 02:55:51 NEO-6A0010 kernel: devfs_register(disc): NULL ops, got 
c02a6e30 from major table
Jul 16 02:55:51 NEO-6A0010 kernel: devfs_register(part1): NULL ops, got 
c02a6e30 from major table
Jul 16 02:55:51 NEO-6A0010 kernel: devfs_register(part2): NULL ops, got 
c02a6e30 from major table
Jul 16 02:55:51 NEO-6A0010 kernel: devfs_register(part3): NULL ops, got 
c02a6e30 from major table

It detects the correct DoC size (16 Megs). But whenever I try to either 
fdisk it or mount it I get errors.  After a few minutes, fdisk will 
actually respond and try to partition the disk, but no partitions are 
found.  When I use the modules, everything works fine.  Does anyone have 
any ideas?  The error when trying to mount are listed below:

Jul 16 02:57:17 NEO-6A0010 kernel: NFTL_open
Jul 16 02:57:17 NEO-6A0010 kernel: NFTL_request
Jul 16 02:57:17 NEO-6A0010 kernel: NFTL read request of 0x2 sectors @ 0 
(req->nr_sectors == 8)
Jul 16 02:57:27 NEO-6A0010 kernel: _DoC_WaitReady timed out.
Jul 16 02:58:07 NEO-6A0010 last message repeated 4 times
Jul 16 02:58:17 NEO-6A0010 kernel: _DoC_WaitReady timed out.
Jul 16 02:58:17 NEO-6A0010 kernel: NFTL read request completed OK
Jul 16 02:58:17 NEO-6A0010 kernel: NFTL_request
Jul 16 02:58:17 NEO-6A0010 kernel: NFTL read request of 0x2 sectors @ 2 
(req->nr_sectors == 6)
Jul 16 02:58:27 NEO-6A0010 kernel: _DoC_WaitReady timed out.
Jul 16 02:59:07 NEO-6A0010 last message repeated 4 times
Jul 16 02:59:17 NEO-6A0010 kernel: _DoC_WaitReady timed out.
Jul 16 02:59:17 NEO-6A0010 kernel: NFTL read request completed OK
Jul 16 02:59:17 NEO-6A0010 kernel: NFTL_request
Jul 16 02:59:17 NEO-6A0010 kernel: NFTL read request of 0x2 sectors @ 4 
(req->nr_sectors == 4)
Jul 16 02:59:27 NEO-6A0010 kernel: _DoC_WaitReady timed out.
Jul 16 03:00:07 NEO-6A0010 last message repeated 4 times
Jul 16 03:00:17 NEO-6A0010 kernel: _DoC_WaitReady timed out.
Jul 16 03:00:17 NEO-6A0010 kernel: NFTL read request completed OK
Jul 16 03:00:17 NEO-6A0010 kernel: NFTL_request
Jul 16 03:00:17 NEO-6A0010 kernel: NFTL read request of 0x2 sectors @ 6 
(req->nr_sectors == 2)
Jul 16 03:00:27 NEO-6A0010 kernel: _DoC_WaitReady timed out.
Jul 16 03:01:07 NEO-6A0010 last message repeated 4 times
Jul 16 03:01:17 NEO-6A0010 kernel: _DoC_WaitReady timed out.
Jul 16 03:01:17 NEO-6A0010 kernel: NFTL read request completed OK
Jul 16 03:02:50 NEO-6A0010 kernel: NFTL_release

Thanks,
David Bryant
