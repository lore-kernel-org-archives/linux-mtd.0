From: dwmw2@infradead.org (David Woodhouse)
Date: 09 Feb 2003 09:16:12 +0000
Subject: hang into genprobe_ident_chips
In-Reply-To: <00ed01c2cf9e$5e45a480$0200a8c0@ester>
References: <00ed01c2cf9e$5e45a480$0200a8c0@ester>
Message-ID: <1044782171.2943.63.camel@imladris.demon.co.uk>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Sat, 2003-02-08 at 18:17, Kentropy wrote:
> Unable to handle kernel paging request at virtual address c5810000

Why haven't you decoded this oops and provided precise line number
information and backtrace? We are not psychic, and we aren't as patient
as people on the arm-linux lists either.

If you want help, you need to help us help you. 

>   FLASH virtual address: 0xc4810000
>   Unable to handle kernel paging request at virtual address c5810000

Check your map driver's 'length' field. It looks like you might be
ioremapping only 16MiB and the chip driver is looking for more than
that.

-- 
dwmw2




>From Kentropy  Sun Feb  9 05:01:58 2003
From: Kentropy (Kentropy)
Date: Sun, 9 Feb 2003 11:01:58 +0100
Subject: Flash C3 Cowardly refusing to erase blocks
Message-ID: <001501c2d022$4a99e3e0$0200a8c0@ester>

Hello,
I am using Fash TE28F320-C3
I've read various posts into the mail history in linux-mtd and arm-linux and I've not yet understood if this C3 flash type is
properly supported into the kernel-2.4.19 neither 2.5.x.
I've got this error and I think I need a patch for C3 flash.
If it already exist could I port it to 2.4.19-rmk4 ?

I hope the information below are sufficient to understand the problem,
if not I will be pleased to provide it.
TIA

Uncompressing Linux....................................... done, booting the kernel.
Linux version 2.4.19-rmk4-ds2 (kentropy at linux) (gcc version 2.95.3 20010315 (r
elease)) #340 dom feb 9 03:19:04 CET 2003
CPU: Intel XScale-80200 revision 1
Ignoring unrecognised tag 0x00000000
On node 0 totalpages: 16384
zone(0): 16384 pages.
zone(1): 0 pages.
zone(2): 0 pages.
Kernel command line: console=ttyS0 root=1f03 rw
tat_uart:Using temporary major/minor pairs - these WILL change in the future
Calibrating delay loop... 398.95 BogoMIPS
Memory: 64MB = 64MB total
Memory: 63504KB available (1041K code, 194K data, 48K init)
XScale Cache/TLB Locking Copyright(c) 2001 MontaVista Software, Inc.
Dentry cache hash table entries: 8192 (order: 4, 65536 bytes)
Inode cache hash table entries: 4096 (order: 3, 32768 bytes)
Mount-cache hash table entries: 1024 (order: 1, 8192 bytes)
Buffer-cache hash table entries: 4096 (order: 2, 16384 bytes)
Page-cache hash table entries: 16384 (order: 4, 65536 bytes)
POSIX conformance testing by UNIFIX
init!
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Initializing RT netlink socket
Starting kswapd
JFFS2 version 2.1. (C) 2001 Red Hat, Inc., designed by Axis Communications AB.
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
FLASH virtual address: 0xc4810000
MTD:|cfi_probe| - |cfi_probe|
Number of erase regions: 2
Primary Vendor Command Set: 0003 (Intel/Sharp Standard)
Primary Algorithm Table at 0035
Alternative Vendor Command Set: 0000 (None)
No Alternate Algorithm Table
Vcc Minimum: 2.7 V
Vcc Maximum: 3.6 V
Vpp Minimum: b.4 V
Vpp Maximum: c.6 V
Typical byte/word write timeout: 32 5s
Maximum byte/word write timeout: 512 5s
Full buffer write not supported
Typical block erase timeout: 1024 ms
Maximum block erase timeout: 8192 ms
Chip erase not supported
Device size: 0x400000 bytes (4 MiB)
Flash Device Interface description: 0x0001
  - x16-only asynchronous interface
Max. bytes in buffer write: 0x1
Number of Erase Block Regions: 2
  Erase Region #0: BlockSize 0x2000 bytes, 8 blocks
  Erase Region #1: BlockSize 0x10000 bytes, 63 blocks
### cfi.chipshift=0x16, base=0x0, map->size=0x400000
  Feature/Command Support: 0066
     - Chip Erase:         unsupported
     - Suspend Erase:      supported
     - Suspend Program:    supported
     - Legacy Lock/Unlock: unsupported
     - Queued Erase:       unsupported
     - Instant block lock: supported
     - Protection Bits:    supported
     - Page-mode read:     unsupported
     - Synchronous read:   unsupported
  Supported functions after Suspend: 01
     - Program after Erase Suspend: supported
  Block Status Register Mask: 0003
     - Lock Bit Active:      yes
     - Valid Bit Active:     yes
  Vcc Logic Supply Optimum Program/Erase Voltage: 0.3 V
  Vpp Programming Supply Optimum Program/Erase Voltage: 0.0 V
Using word write method
Using static partition definition
Creating 4 MTD partitions on "C3-Flash":
0x00000000-0x00010000 : "firmware"
0x00030000-0x00040000 : "params"
0x00040000-0x00140000 : "kernel"
0x00140000-0x00200000 : "rootdisk"
unlocking mtd device rootdisk
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP: Hash tables configured (established 4096 bind 4096)
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
NetWinder Floating Point Emulator V0.95 (c) 1998-1999 Rebel.com
FAT: bogus logical sector size 225
UMSDOS: msdos_read_super failed, mount aborted.
FAT: bogus logical sector size 225
FAT: bogus logical sector size 225
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000020: 0x0002 in
stead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000024: 0x2818 in
stead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000028: 0x8000 in
stead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000002c: 0xfa8c in
stead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000030: 0x7001 in
stead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000034: 0x8000 in
stead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000038: 0x2000 in
stead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000003c: 0x0003 in
stead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000040: 0x0001 in
stead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000044: 0x0017 in
stead
Further such events for this erase block will not be printed
JFFS2: Erase block at 0x00000000 is not formatted. It will be erased
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00010000: 0x5847 in
stead
<snip><snip><snip><snip>
Further such events for this erase block will not be printed
JFFS2: Erase block at 0x000a0000 is not formatted. It will be erased
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000b0000: 0xd2dd in
stead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000b0004: 0x382f in
stead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000b0008: 0x5f92 in
stead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000b000c: 0x331f in
stead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000b0010: 0x9032 in
stead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000b0014: 0x8383 in
stead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000b0018: 0xb9f8 in
stead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000b001c: 0x7b07 in
stead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000b0020: 0xdcff in
stead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000b0024: 0xd06f in
stead
Further such events for this erase block will not be printed
JFFS2: Erase block at 0x000b0000 is not formatted. It will be erased
Cowardly refusing to erase blocks on filesystem with no valid JFFS2 nodes
Kernel panic: VFS: Unable to mount root fs on 1f:03
