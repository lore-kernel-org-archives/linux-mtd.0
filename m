Received: from orion.he.net ([216.218.179.2])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15SEZ0-0007k2-00
	for <linux-mtd@lists.infradead.org>; Thu, 02 Aug 2001 10:14:42 +0100
Received: from t500nt4 (host213-120-146-246.in-addr.btopenworld.com [213.120.146.246]) by orion.he.net (8.8.6/8.8.2) with SMTP id CAA30191 for <linux-mtd@lists.infradead.org>; Thu, 2 Aug 2001 02:20:07 -0700
Message-ID: <002101c11b34$b32cc6b0$0600a8c0@magneticscrolls.com>
From: "Ken Gordon" <ken@magneticscrolls.com>
To: <linux-mtd@lists.infradead.org>
Subject: jffs2 scary messages
Date: Thu, 2 Aug 2001 10:22:47 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hello,

I'm using a an SA1110 custom board running 2.4.6-rmk2-np1 (this happens to
me on an iPaq too) and I get these scary messages at boot time:

jffs2_scan_empty(): Empty block at 0x00c8fffc ends at 0x00c90000 (with
0xe0021985)! Marking dirty
jffs2_scan_empty(): Empty block at 0x00cafffc ends at 0x00cb0000 (with
0xe0021985)! Marking dirty
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00d00070:
0x1a1a instead

I got them with 2.4.3 as well. The happen every time I boot (see below)
including when I have a fresh filesystem (the one below had just been
flashed). It happens with the prebuilt mkfs.jffs2 and with one I built from
the mtd tarball a couple of days ago (snapshot-20010723).

Does anyone have any suggestions about what I might be getting wrong?

I'm becoming a bit paranoid about JFFS2. I find that with only 16MB of flash
getting to within a couple of hundred k of a full filesystem tends to result
in an unrebootable system. Running 32MB seems much better.

Another random question - does 'sync' do what might be expected or is it a
no-op?

    Ken

In my .config I have

CONFIG_JFFS2_FS=y
CONFIG_JFFS2_FS_DEBUG=0


and

#
# Memory Technology Devices (MTD)
#
CONFIG_MTD=y
# CONFIG_MTD_DEBUG is not set
CONFIG_MTD_PARTITIONS=y
CONFIG_MTD_REDBOOT_PARTS=y
CONFIG_MTD_BOOTLDR_PARTS=y
# CONFIG_MTD_AFS_PARTS is not set



booting flash...
kernel_magic=E1A00000
kernel_region_words[9]=016F2818
Linux ELF flash_imgstart=50080000 size=000C0000 dest=C0000000
offset=00008000
MMU Control=C19F4071
copying Linux kernel ... done
linuxEntryPoint: C0008000
kernel_image_dest:    C0000000
kernel_image_offset:    00008000
C0008000: E1A00000
C0008004: E1A00000
C0008008: E1A00000
C000800C: E1A00000
C0008010: E1A00000
C0008014: E1A00000
C0008018: E1A00000
C000801C: E1A00000
C0008020: EA000002
C0008024: 016F2818
root_filesystem_name=ramdisk
argc=00000002
args= noinitrd root=/dev/mtdblock3 init=/linuxrc console=ttySA0
setting boot parameters
get_param: could not find parameter system_rev
Setting up Linux parameters at address=C0000100
using_ramdisk=00000001
initrd_start=346C7466
dram_size=02000000
nr_pages=00002000
command line is:  noinitrd root=/dev/mtdblock3 init=/linuxrc console=ttySA0
linuxEntryPoint=C0008000
Booting Linux image
Uncompressing Linux.................................................. done,
booting the kernel.
Linux version 2.4.6-rmk2-np1 (root@freeskate.magneticscrolls.com) (gcc
version 2.95.2 19991024 (release)) #83 Wed Aug 1 17:20:38 BST 2001
Processor: Intel StrongARM-1110 revision 8
Architecture: Stork Technologies prototype
Stork driver initing latches
On node 0 totalpages: 8192
zone(0): 8192 pages.
zone(1): 0 pages.
zone(2): 0 pages.
Kernel command line:  noinitrd root=/dev/mtdblock3 init=/linuxrc
console=ttySA0
Relocating machine vectors to 0xffff0000
Warning: uninitialized Real Time Clock
Console: colour dummy device 80x30
Calibrating delay loop... 127.38 BogoMIPS
Memory: 32MB = 32MB total
Memory: 30444KB available (1303K code, 362K data, 68K init)
Dentry-cache hash table entries: 4096 (order: 3, 32768 bytes)
Inode-cache hash table entries: 2048 (order: 2, 16384 bytes)
Mount-cache hash table entries: 512 (order: 0, 4096 bytes)
Buffer-cache hash table entries: 1024 (order: 0, 4096 bytes)
Page-cache hash table entries: 8192 (order: 3, 32768 bytes)
POSIX conformance testing by UNIFIX
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Initializing RT netlink socket
CPU clock: 191.700 MHz (max 191.700 MHz)
Starting kswapd v1.8
JFFS2 version 2.1. (C) 2001 Red Hat, Inc., designed by Axis Communications
AB.

<snip sa1100fb stuff>

pty: 256 Unix98 ptys configured
Serial driver version 5.05a (2001-03-20) with no serial options enabled
block: queued sectors max/low 19722kB/6574kB, 64 slots per queue
RAMDISK driver initialized: 16 RAM disks of 8192K size 1024 blocksize
SA1100 flash: probing 32-bit flash bus
SA1100 flash: Found 2 x16 devices at 0x0 in 32-bit mode
JEDEC ID: 89 18
0: offset=0x0,size=0x40000,blocks=128
parse_bootldr_partitions: partition_table_offset=0x40000
parse_bootldr_partitions: magic=0x646c7470
parse_bootldr_partitions: npartitions=0x4
        partition bootldr o=0 s=40000
        partition params o=40000 s=40000
        partition kernel o=80000 s=c0000
        partition root o=180000 s=1e80000
Using Compaq bootldr partition definition
Creating 4 MTD partitions on "SA1100 flash":
0x00000000-0x00040000 : "bootldr"
0x00040000-0x00080000 : "params"
0x00080000-0x00140000 : "kernel"
0x00180000-0x02000000 : "root"
sa1100fb_disable_controller: Disabling LCD controller
Linux Kernel Card Services 3.1.22
  options:  [pm]
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP: Hash tables configured (established 2048 bind 2048)
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
Fast Floating Point Emulator V0.0 (c) Peter Teichmann.
Enabling LCD controller
fbi c026e800
fbi->palette_cpu c2800fe0
LCCR3 = 0x00300005
LCCR2 = 0x0c1f05df
LCCR1 = 0x2f2ffe70
LCCR0 = 0x000000b8
DBAR1 = c0300fe0
DBAR1 = c0300fe0
sa1100fb_enable_controller: DBAR1 = c0300fe0
sa1100fb_enable_controller: DBAR2 = c034c000
sa1100fb_enable_controller: LCCR0 = 0x000000b9
sa1100fb_enable_controller: LCCR1 = 0x2f2ffe70
sa1100fb_enable_controller: LCCR2 = 0x0c1f05df
sa1100fb_enable_controller: LCCR3 = 0x00300005
ds: no socket drivers loaded!
wrong magic
jffs2_scan_empty(): Empty block at 0x0000fffc ends at 0x00010000 (with
0xe0021985)! Marking dirty
jffs2_scan_empty(): Empty block at 0x0001fffc ends at 0x00020000 (with
0xe0021985)! Marking dirty
jffs2_scan_empty(): Empty block at 0x0002fffc ends at 0x00030000 (with
0xe0021985)! Marking dirty
jffs2_scan_empty(): Empty block at 0x0004fffc ends at 0x00050000 (with
0xe0021985)! Marking dirty
jffs2_scan_empty(): Empty block at 0x0005fffc ends at 0x00060000 (with
0xe0021985)! Marking dirty
jffs2_scan_empty(): Empty block at 0x0006fffc ends at 0x00070000 (with
0xe0021985)! Marking dirty
<snip continues in this style until>
jffs2_scan_empty(): Empty block at 0x00c4fffc ends at 0x00c50000 (with
0xe0021985)! Marking dirty
jffs2_scan_empty(): Empty block at 0x00c5fffc ends at 0x00c60000 (with
0xe0021985)! Marking dirty
jffs2_scan_empty(): Empty block at 0x00c6fffc ends at 0x00c70000 (with
0xe0021985)! Marking dirty
jffs2_scan_empty(): Empty block at 0x00c8fffc ends at 0x00c90000 (with
0xe0021985)! Marking dirty
jffs2_scan_empty(): Empty block at 0x00cafffc ends at 0x00cb0000 (with
0xe0021985)! Marking dirty
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00d00070:
0x1a1a instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00d00074:
0x1a1a instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00d00078:
0x1a1a instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00d0007c:
0x1a1a instead
VFS: Mounted root (jffs2 filesystem).
Freeing init memory: 68K
Ken's hacked linuxrc...
Executing /linuxrc...
Loading floating point emulator...
Using /lib/modules/2.4.6-rmk2-np1/kernel/arch/arm/nwfpe/nwfpe.o
<snip>
