Received: from relais.videotron.ca ([24.201.245.36])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LKmGm-00058U-Ej
	for linux-mtd@lists.infradead.org; Thu, 08 Jan 2009 04:13:20 +0000
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Content-type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Received: from eris.born2network.net ([74.59.45.108])
	by VL-MO-MR005.ip.videotron.ca
	(Sun Java(tm) System Messaging Server 6.3-4.01 (built Aug  3 2007;
	32bit))
	with ESMTP id <0KD400L8VX0TXAD0@VL-MO-MR005.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Wed, 07 Jan 2009 23:12:30 -0500 (EST)
Message-id: <8EEAB966-52F4-48A3-8FCA-A50BBE8486B7@b2n.ca>
From: David Bergeron <mho.linux-mtd@b2n.ca>
To: linux-mtd@lists.infradead.org
Subject: UBIFS volume corruption (bad node at LEB 0:0)
Date: Wed, 07 Jan 2009 23:13:16 -0500
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello all,

I'm getting some sort of volume corruption problem with UBIFS after  
doing
rootfs updates using rsync.

I've cooked up a minimalist test trying to eliminate possible  
interference.
The following steps will trigger the corruption almost every time. No  
errors
or warnings are produced during this procedure, every step behaves as  
expected:

boot kernel ubi.mtd=0 root=ubi0:rootfs rootfstype=ubifs ro init=/bin/ 
bash

# mount -t proc none /proc
# ifconfig ...
# mount -o remount,rw,sync /
# rsync -aHxvi --delete ... /
# mount -o remount,ro /
# reboot -d -f

When rebooting, the kernel fails to mount the rootfs with the  
following error:

[   61.033142] UBIFS error (pid 1): ubifs_read_node: bad node type (11  
but expected 6)
[   61.040965] UBIFS error (pid 1): ubifs_read_node: bad node at LEB 0:0

I'm running a fresh 2.6.28.0. mtd-utils were built from git on  
2008-11-19.
About 3 weeks ago I also tried with an mtd-2.6.git master branch  
patched kernel
to no avail.

Note that in my few attempts, when I do NOT remount read-only before  
rebooting,
the filesystem has so far remained functional (albeit being left  
unclean) and it
boots as expected. The error msg is always the same. A certain amount of
filesystem changes is necessary to trigger the problem, simply  
touching a file
is not enough. I have not determined exactly what operations rsync  
needs to
perform to reach breaking point, but sometimes everything goes well.

Every other usage patterns work great so far on a second ubifs volume.  
rsync
is the only thing I do on the rootfs, which is otherwise always read- 
only.
UBIFS rocks, and I don't want to stick with jffs2.
I can try anything, any help or pointers would be appreciated.

Thanks, cheers
-david

kernel output of my setup:

[   10.303908] NAND device: Manufacturer ID: 0xad, Chip ID: 0xf1  
(Hynix NAND 128MiB 3,3V 8-bit)
[   10.312429] Scanning device for bad blocks
[   10.369515] Using static partition definition
[   10.373927] Creating 1 MTD partitions on "NAND 128MiB 3,3V 8-bit":
[   10.380120] 0x000000000000-0x000008000000 : "cmx270-0"
[   10.385525] mtd: Giving out device 0 to cmx270-0
[   10.392720] UBI: attaching mtd0 to ubi0
[   10.396766] UBI DBG (pid 1): io_init: min_io_size      2048
[   10.402316] UBI DBG (pid 1): io_init: hdrs_min_io_size 512
[   10.407866] UBI DBG (pid 1): io_init: ec_hdr_alsize    512
[   10.413367] UBI DBG (pid 1): io_init: vid_hdr_alsize   512
[   10.418827] UBI DBG (pid 1): io_init: vid_hdr_offset   512
[   10.424327] UBI DBG (pid 1): io_init: vid_hdr_aloffset 512
[   10.429795] UBI DBG (pid 1): io_init: vid_hdr_shift    0
[   10.435118] UBI DBG (pid 1): io_init: leb_start        2048
[   10.440676] UBI: physical eraseblock size:   131072 bytes (128 KiB)
[   10.446942] UBI: logical eraseblock size:    129024 bytes
[   10.452320] UBI: smallest flash I/O unit:    2048
[   10.457030] UBI: sub-page size:              512
[   10.461634] UBI: VID header offset:          512 (aligned 512)
[   10.467473] UBI: data offset:                2048
[   10.472726] UBI DBG (pid 1): process_eb: scan PEB 0
...(no red flags seen)...
[   70.361901] UBI DBG (pid 1): ubi_scan: scanning is finished
[   70.505807] UBI: attached mtd0 to ubi0
[   70.509646] UBI: MTD device name:            "cmx270-0"
[   70.514969] UBI: MTD device size:            128 MiB
[   70.519908] UBI: number of good PEBs:        1024
[   70.524710] UBI: number of bad PEBs:         0
[   70.529136] UBI: max. allowed volumes:       128
[   70.533775] UBI: wear-leveling threshold:    4096
[   70.538474] UBI: number of internal volumes: 1
[   70.542939] UBI: number of user volumes:     2
[   70.547371] UBI: available PEBs:             33
[   70.551887] UBI: total number of reserved PEBs: 991
[   70.556782] UBI: number of PEBs reserved for bad PEB handling: 10
[   70.562879] UBI: max/mean erase counter: 162/57
[   70.568050] UBI: background thread "ubi_bgt0d" started, PID 264

bad node type error happens here, this is when fine:
[   71.251007] UBIFS: mounted UBI device 0, volume 0, name "rootfs"
[   71.257202] UBIFS: mounted read-only
[   71.260762] UBIFS: file system size:   82704384 bytes (80766 KiB,  
78 MiB, 641 LEBs)
[   71.268447] UBIFS: journal size:       4128768 bytes (4032 KiB, 3  
MiB, 32 LEBs)
[   71.275751] UBIFS: media format:       4 (latest is 4)
[   71.280866] UBIFS: default compressor: LZO
[   71.284975] UBIFS: reserved for root:  4087320 bytes (3991 KiB)
[   71.292580] VFS: Mounted root (ubifs filesystem) readonly.


MTD & UBI .config grep:

CONFIG_ARCH_MTD_XIP=y
CONFIG_MTD=y
CONFIG_MTD_DEBUG=y
CONFIG_MTD_DEBUG_VERBOSE=0
CONFIG_MTD_PARTITIONS=y
CONFIG_MTD_CHAR=y
CONFIG_MTD_MAP_BANK_WIDTH_1=y
CONFIG_MTD_MAP_BANK_WIDTH_2=y
CONFIG_MTD_MAP_BANK_WIDTH_4=y
CONFIG_MTD_CFI_I1=y
CONFIG_MTD_CFI_I2=y
CONFIG_MTD_NAND=y
CONFIG_MTD_NAND_IDS=y
CONFIG_MTD_NAND_CM_X270=y
CONFIG_MTD_UBI=y
CONFIG_MTD_UBI_WL_THRESHOLD=4096
CONFIG_MTD_UBI_BEB_RESERVE=1
CONFIG_MTD_UBI_DEBUG=y
CONFIG_MTD_UBI_DEBUG_PARANOID=y
CONFIG_MTD_UBI_DEBUG_MSG_BLD=y
CONFIG_UBIFS_FS=y
CONFIG_UBIFS_FS_LZO=y
CONFIG_UBIFS_FS_ZLIB=y

--
