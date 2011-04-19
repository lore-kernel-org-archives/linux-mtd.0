Received: from hrndva-omtalb.mail.rr.com ([71.74.56.125])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1QCIE6-0000g9-KV
	for linux-mtd@lists.infradead.org; Tue, 19 Apr 2011 21:12:52 +0000
Message-ID: <4DADF9E6.9010709@wi.rr.com>
Date: Tue, 19 Apr 2011 16:08:54 -0500
From: Rick Johnson <rick22@wi.rr.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: read_pnode: error -22 reading pnode at XX:YYYYY
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

We've been seeing this error

"read_pnode: error -22 reading pnode at XX:YYYYY"

from time to time.  It happens just often to cause problems, but not 
often enough to determine how to reproduce it.  We're using kernel 
version 2.6.36.

When it happens, we usually get the following messages after it:

UBIFS error (pid 115): ubifs_update_one_lp: cannot update properties of 
= LEB ZZZ, error -22
UBIFS warning (pid 115): ubifs_ro_mode: switched to read-only mode, = 
error -22

After that, our device is stuck.  We've only ever noticed the problem on 
boot up.

If anyone has any suggestions on where I could look to track the source, 
I would greatly appreciate it.  I'd be happy to provide any additional 
information needed.

Thank you in advance,
Rick Johnson


====================================================================
Below is the most recent instance of the problem.
====================================================================

U-Boot 2010.06 (Mar 08 2011 - 12:37:47) MPC83XX

Reset Status: Software Hard, External/Internal Soft, External/Internal Hard

CPU:   e300c3, MPC8313, Rev: 2.1 at 333.333 MHz, CSB: 166.667 MHz
I2C:   ready
DRAM:  128 MiB
NAND:  1024 MiB
Bad block table found at page 524224, version 0x01
Bad block table found at page 524160, version 0x01
nand_bbt: ECC error while reading bad block table
nand_read_bbt: Bad block at 0x000000180000
nand_read_bbt: Bad block at 0x000000200000
nand_read_bbt: Bad block at 0x000000400000
nand_read_bbt: Bad block at 0x000000f80000
nand_read_bbt: Bad block at 0x000001d80000
nand_read_bbt: Bad block at 0x000002180000
nand_read_bbt: Bad block at 0x000002c80000
nand_read_bbt: Bad block at 0x000003a80000
nand_read_bbt: Bad block at 0x000004400000
nand_read_bbt: Bad block at 0x000005380000
nand_read_bbt: Bad block at 0x000005800000
nand_read_bbt: Bad block at 0x000005f80000
nand_read_bbt: Bad block at 0x000006380000
nand_read_bbt: Bad block at 0x000007600000
nand_read_bbt: Bad block at 0x000007900000
nand_read_bbt: Bad block at 0x000007c00000
nand_read_bbt: Bad block at 0x000007d80000
nand_read_bbt: Bad block at 0x000008100000
nand_read_bbt: Bad block at 0x000008a80000
nand_read_bbt: Bad block at 0x000009e00000
nand_read_bbt: Bad block at 0x00000a580000
nand_read_bbt: Bad block at 0x00000cb80000
nand_read_bbt: Bad block at 0x00000fb00000
nand_read_bbt: Bad block at 0x000010580000
nand_read_bbt: Bad block at 0x000011080000
nand_read_bbt: Bad block at 0x000011880000
nand_read_bbt: Bad block at 0x000011980000
nand_read_bbt: Bad block at 0x000012180000
nand_read_bbt: Bad block at 0x000012780000
nand_read_bbt: Bad block at 0x000013e80000
nand_read_bbt: Bad block at 0x000014a80000
nand_read_bbt: Bad block at 0x000014c80000
nand_read_bbt: Bad block at 0x000015e00000
nand_read_bbt: Bad block at 0x00001b180000
nand_read_bbt: Bad block at 0x00001e580000
*** Warning - bad CRC or NAND, using default environment

In:    serial
Out:   serial
Err:   serial
Reading MAC from EEPROM
load_fpga(): err=0 len=130952
FPGA already running, not reloading
variant=1
nand1 size=40000000 nand2 size=0
Net:   TSEC0: No support for PHY id 221513; assuming generic
TSEC1: No support for PHY id 221513; assuming generic
TSEC0 [PRIME], TSEC1
Creating 1 MTD partitions on "nand0":
0x000000500000-0x000040000000 : "mtd=1"
UBI: attaching mtd1 to ubi0
UBI: physical eraseblock size:   131072 bytes (128 KiB)
UBI: logical eraseblock size:    129024 bytes
UBI: smallest flash I/O unit:    2048
UBI: sub-page size:              512
UBI: VID header offset:          512 (aligned 512)
UBI: data offset:                2048
UBI warning: ubi_eba_init_scan: cannot reserve enough PEBs for bad PEB 
handling, reserved 77, need 81
UBI: attached mtd1 to ubi0
UBI: MTD device name:            "mtd=1"
UBI: MTD device size:            1019 MiB
UBI: number of good PEBs:        8116
UBI: number of bad PEBs:         36
UBI: max. allowed volumes:       128
UBI: wear-leveling threshold:    4096
UBI: number of internal volumes: 1
UBI: number of user volumes:     1
UBI: available PEBs:             0
UBI: total number of reserved PEBs: 8116
UBI: number of PEBs reserved for bad PEB handling: 77
UBI: max/mean erase counter: 4/2
UBIFS: recovery needed
UBIFS: recovery deferred
UBIFS: mounted UBI device 0, volume 0, name "container"
UBIFS: mounted read-only
UBIFS: file system size:   1033869312 bytes (1009638 KiB, 985 MiB, 8013 
LEBs)
UBIFS: journal size:       9033728 bytes (8822 KiB, 8 MiB, 71 LEBs)
UBIFS: media format:       w4/r0 (latest is w4/r0)
UBIFS: default compressor: LZO
UBIFS: reserved for root:  0 bytes (0 KiB)
Loading file '/part' to addr 0x00200000 with size 1 (0x00000001)...
Done
byte at 0x00200000 (0x00) != byte at 0x00400000 (0x01)
Total of 0 bytes were the same
Loading file '/kernel0.img' to addr 0x00600000 with size 1715302 
(0x001a2c66)...
Done
Loading file '/dtb0.img' to addr 0x00bf0000 with size 55358 (0x0000d83e)...
Done
## Booting kernel from Legacy Image at 00600000 ...
    Image Name:   Linux-2.6.36
    Created:      2011-04-06  18:11:00 UTC
    Image Type:   PowerPC Linux Kernel Image (gzip compressed)
    Data Size:    1715238 Bytes = 1.6 MiB
    Load Address: 00000000
    Entry Point:  00000000
    Verifying Checksum ... OK
## Flattened Device Tree blob at 00bf0000
    Booting using the fdt blob at 0xbf0000
    Uncompressing Kernel Image ... OK
    Loading Device Tree to 007ef000, end 007ff83d ... OK
IntFixup: detected TSEC0, fixing interrupts for rev 2.1 8313 silicon
IntFixup: detected TSEC1, fixing interrupts for rev 2.1 8313 silicon
setup_arch: bootmem
mpc831x_rdb_setup_arch()
arch: exit

initramfs loader
Mounting UBIFS filesystem on 'ubi0:container'...
UBIFS error (pid 1): read_pnode: error -22 reading pnode at 14:38299
UBIFS error (pid 1): read_pnode: error -22 reading pnode at 14:38299
UBIFS error (pid 1): read_pnode: error -22 reading pnode at 14:41289
UBIFS error (pid 1): read_pnode: error -22 reading pnode at 14:41380
UBIFS error (pid 1): read_pnode: error -22 reading pnode at 18:56882
Booting partition 0...
Loop-mounting SquashFS image at '/container/rootfs0.img'...
Moving '/container' -> '/newroot/initlo'...
Changing root & launching '/linuxrc'...

====================================================================
An older instance of the problem, but with some debug enabled.
Unfortunately, I don't have the whole log for this instance.
====================================================================

UBIFS error (pid 463): read_pnode: error -22 reading pnode at 19:125709
(pid 463) dumping pnode:
	address c3078480 parent c3073d20 cnext 0
	flags 0 iip 3 level 0 num 8080
	0: free 40 dirty 122352 flags 1 lnum 0
	1: free 0 dirty 115064 flags 1 lnum 0
	2: free 0 dirty 127312 flags 1 lnum 0
	3: free 0 dirty 127704 flags 1 lnum 0
UBIFS DBG (pid 463): read_pnode: calc num: 1995
UBIFS error (pid 463): ubifs_update_one_lp: cannot update properties of 
LEB 8004, error -22
UBIFS warning (pid 463): ubifs_ro_mode: switched to read-only mode, 
error -22
Call Trace:
[c61cbcf0] [c00085b8] show_stack+0x7c/0x194 (unreliable)
[c61cbd30] [c0101444] ubifs_ro_mode+0x6c/0x7c
[c61cbd40] [c00f70a4] ubifs_jnl_write_data+0x2d0/0x314
[c61cbd80] [c00f8fc0] do_writepage+0xd8/0x224
[c61cbdd0] [c00620c4] __writepage+0x24/0x68
[c61cbde0] [c00628b0] write_cache_pages+0x254/0x378
[c61cbe80] [c005bbe0] __filemap_fdatawrite_range+0x94/0xc0
[c61cbee0] [c005bc5c] filemap_write_and_wait_range+0x50/0xac
[c61cbf00] [c00a738c] vfs_fsync_range+0x48/0xb4
[c61cbf20] [c00a7498] do_fsync+0x30/0x58
[c61cbf40] [c000f160] ret_from_syscall+0x0/0x38
--- Exception: c01 at 0xfb491a0
     LR = 0xfb49190


====================================================================
Some additional debug, just in case.
====================================================================

UBIFS DBG (pid 30): ubifs_bg_thread: background thread "ubifs_bgt0_0" 
started, PID 30
UBIFS: recovery needed
UBIFS: recovery completed
UBIFS: mounted UBI device 0, volume 0, name "container"
UBIFS: file system size:   1037223936 bytes (1012914 KiB, 989 MiB, 8039 
LEBs)
UBIFS: journal size:       9033728 bytes (8822 KiB, 8 MiB, 71 LEBs)
UBIFS: media format:       w4/r0 (latest is w4/r0)
UBIFS: default compressor: lzo
UBIFS: reserved for root:  0 bytes (0 KiB)
UBIFS DBG (pid 1): mount_ubifs: compiled on:         Jan 12 2011 at 14:28:23
UBIFS DBG (pid 1): mount_ubifs: min. I/O unit size:  2048 bytes
UBIFS DBG (pid 1): mount_ubifs: LEB size:            129024 bytes (126 KiB)
UBIFS DBG (pid 1): mount_ubifs: data journal heads:  1
UBIFS DBG (pid 1): mount_ubifs: UUID: 
15A2370F-36A8-453D-B649-DE5C482B68E9
UBIFS DBG (pid 1): mount_ubifs: big_lpt              1
UBIFS DBG (pid 1): mount_ubifs: log LEBs:            5 (3 - 7)
UBIFS DBG (pid 1): mount_ubifs: LPT area LEBs:       13 (8 - 20)
UBIFS DBG (pid 1): mount_ubifs: orphan area LEBs:    1 (21 - 21)
UBIFS DBG (pid 1): mount_ubifs: main area LEBs:      8039 (22 - 8060)
UBIFS DBG (pid 1): mount_ubifs: index LEBs:          254
UBIFS DBG (pid 1): mount_ubifs: total index bytes:   1041120 (1016 KiB, 
0 MiB)
UBIFS DBG (pid 1): mount_ubifs: key hash type:       0
UBIFS DBG (pid 1): mount_ubifs: tree fanout:         8
UBIFS DBG (pid 1): mount_ubifs: reserved GC LEB:     2545
UBIFS DBG (pid 1): mount_ubifs: first main LEB:      22
UBIFS DBG (pid 1): mount_ubifs: max. znode size      240
UBIFS DBG (pid 1): mount_ubifs: max. index node size 192
UBIFS DBG (pid 1): mount_ubifs: node sizes:          data 48, inode 160, 
dentry 56
UBIFS DBG (pid 1): mount_ubifs: node sizes:          trun 56, sb 4096, 
master 512
UBIFS DBG (pid 1): mount_ubifs: node sizes:          ref 64, cmt. start 
32, orph 32
UBIFS DBG (pid 1): mount_ubifs: max. node sizes:     data 4144, inode 
4256 dentry 312
UBIFS DBG (pid 1): mount_ubifs: dead watermark:      2048
UBIFS DBG (pid 1): mount_ubifs: dark watermark:      6144
UBIFS DBG (pid 1): mount_ubifs: LEB overhead:        560
UBIFS DBG (pid 1): mount_ubifs: max. dark space:     49391616 (48234 
KiB, 47 MiB)
UBIFS DBG (pid 1): mount_ubifs: maximum bud bytes:   8388608 (8192 KiB, 
8 MiB)
UBIFS DBG (pid 1): mount_ubifs: BG commit bud bytes: 6815744 (6656 KiB, 
6 MiB)
UBIFS DBG (pid 1): mount_ubifs: current bud bytes    90112 (88 KiB, 0 MiB)
UBIFS DBG (pid 1): mount_ubifs: max. seq. number:    4633434
UBIFS DBG (pid 1): mount_ubifs: commit number:       1080
