Received: from ns.tz.ru ([194.149.234.1])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HQk6x-0004e6-5d
	for linux-mtd@lists.infradead.org; Mon, 12 Mar 2007 08:58:52 -0400
Received: from localhost (localhost.tz.ru [127.0.0.1])
	by ns.tz.ru (Postfix) with ESMTP id 6B80D3F402F
	for <linux-mtd@lists.infradead.org>;
	Mon, 12 Mar 2007 15:28:04 +0300 (MSK)
Received: from ns.tz.ru ([127.0.0.1])
	by localhost (ns.tz.ru [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7R4DfHksaLVz for <linux-mtd@lists.infradead.org>;
	Mon, 12 Mar 2007 15:28:02 +0300 (MSK)
Received: from marnat.intranet.tz.ru (static-85-90-97-192.inet.tz.ru
	[85.90.97.192]) by ns.tz.ru (Postfix) with ESMTP id 5BB503F4033
	for <linux-mtd@lists.infradead.org>;
	Mon, 12 Mar 2007 15:28:02 +0300 (MSK)
Date: Mon, 12 Mar 2007 15:28:01 +0300
From: Igor Marnat <marny@rambler.ru>
Message-ID: <16125243125.20070312152801@rambler.ru>
To: linux-mtd@lists.infradead.org
Subject: jffs2_gcd_mtd0 invoked oom-killer
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Reply-To: Igor Marnat <marny@rambler.ru>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Sirs!

I work with the embedded system based on PowerPC 405 EP with 16Mb RAM
and 32 Mb NAND FLASH. Rootfs lives on NAND FLASH and is formatted
using jffs2.

A few months it worked just fine then suddenly the system became
unusable. Since root fs locates on NAND flash, system became
unloadable because of error. Anyway I can boot the
system, loading the kernel by TFTP and having mounted root fs by NFS.

When the system works with the kernel loaded by tftp and fs mounted by
NFS, it all seems to be fine until the command
"mount -t jffs2 /dev/mtdblock0 /mnt" issued. After this command system tells me
"check_node_data: wrong data CRC" and then "jffs2_gcd_mtd0 invoked
oom-killer". Then it goes to reboot (see the log below). The problem occurs with
2.6.18-rc4 kernel and with 2.6.19.2-1 (the latest one I can build for my
board).

Kernel config (those of 2.6.19.2-1) is attached at the very bottom of the letter.

Please advise the steps to fix the problem or direction to begin
debugging.
Thank you, best regards,


Log:

bash-2.05b# mount -t jffs2 /dev/mtdblock0 /mnt
bash-2.05b# cat /proc/meminfo
MemTotal:        14088 kB
MemFree:          1356 kB
Buffers:             0 kB
Cached:           5332 kB
SwapCached:          0 kB
Active:           4384 kB
Inactive:         2336 kB
SwapTotal:           0 kB
SwapFree:            0 kB
Dirty:               0 kB
Writeback:           0 kB
AnonPages:        1404 kB
Mapped:           2224 kB
Slab:             5024 kB
SReclaimable:      588 kB
SUnreclaim:       4436 kB
PageTables:        152 kB
NFS_Unstable:        0 kB
Bounce:              0 kB
CommitLimit:      7044 kB
Committed_AS:    15080 kB
VmallocTotal:   743424 kB
VmallocUsed:      4684 kB
VmallocChunk:   738600 kB
bash-2.05b# cd /mnt/
bash-2.05b# ls -l
total 0
drwxr-xr-x    2 500      500             0 Nov 22  2005 bin
drwxrwxr-x    2 500      500             0 Nov 15  2005 boot
drwxr-xr-x    2 500      500             0 Dec 31  1969 dev
drwxr-xr-x   20 500      500             0 Dec 31  1969 etc
drwxrwxr-x    2 root     root            0 Nov 22  2005 info
drwxr-xr-x    5 500      500             0 Dec 31  1969 lib
drwxrwxr-x    4 500      500             0 Nov 22  2005 man
drwxr-xr-x    2 root     root            0 Dec 31  1969 mnt
drwxrwxr-x    2 root     root            0 Jul 28  2005 proc
drwxrwxr-x    3 500      500             0 Dec 31  1969 root
drwxr-xr-x    2 500      500             0 Dec 31  1969 sbin
drwxrwxr-x    2 500      500             0 Nov 15  2005 share
drwxr-xr-x  307 root     root            0 Jan  1  1970 tmp
drwxr-xr-x    2 root     root            0 Dec 31  1969 tz-64
drwxr-xr-x   10 500      500             0 Nov 21  2005 usr
drwxr-xr-x    8 500      500             0 Dec 31  1969 var
bash-2.05b# cat /proc/meminfo
MemTotal:        14088 kB
MemFree:           796 kB
Buffers:             0 kB
Cached:           4556 kB
SwapCached:          0 kB
Active:           4252 kB
Inactive:         1700 kB
SwapTotal:           0 kB
SwapFree:            0 kB
Dirty:               0 kB
Writeback:           0 kB
AnonPages:        1412 kB
Mapped:           2244 kB
Slab:             6352 kB
SReclaimable:      592 kB
SUnreclaim:       5760 kB
PageTables:        152 kB
NFS_Unstable:        0 kB
Bounce:              0 kB
CommitLimit:      7044 kB
Committed_AS:    15088 kB
VmallocTotal:   743424 kB
VmallocUsed:      4684 kB
VmallocChunk:   738600 kB
bash-2.05b# JFFS2 notice: (450) check_node_data: wrong data CRC in data node at 0x03b4bc00: read 0xc7ce044f, calculated 0xaba67eba.
Dec 31 19:01:30 10 kernel: JFFS2 notice: (450) check_node_data: wrong data CRC in data node at 0x03b4bc00: read 0xc7ce044f, calculated 0xaba67eba.

bash-2.05b# jffs2_gcd_mtd0 invoked oom-killer: gfp_mask=0xd0, order=0, oomkilladj=0
Call Trace:
[C06A1D30] [C00089FC]  (unreliable)
[C06A1D60] [C0039014] 
[C06A1D90] [C003A3A0] 
[C06A1DE0] [C004D044] 
[C06A1E10] [C004CD58] 
[C06A1E20] [C00CA314] 
[C06A1E30] [C00CBD9C] 
[C06A1EA0] [C00CC8D4] 
[C06A1F10] [C00D02EC] 
[C06A1F50] [C00D18F8] 
[C06A1FF0] [C0004BB8] 
Mem-info:
DMA per-cpu:
CPU    0: Hot: hi:    0, btch:   1 usd:   0   Cold: hi:    0, btch:   1 usd:   0
Active:336 inactive:0 dirty:0 writeback:0 unstable:0 free:127 slab:2824 mapped:0 pagetables:34
DMA free:508kB min:508kB low:632kB high:760kB active:1344kB inactive:0kB present:16256kB pages_scanned:2351 all_unreclaimable? yes
lowmem_reserve[]: 0 0
DMA: 1*4kB 1*8kB 1*16kB 1*32kB 1*64kB 1*128kB 1*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB = 508kB
Free swap:            0kB
4096 pages of RAM
0 pages of HIGHMEM
148 free pages
575 reserved pages
0 pages shared
0 pages swap cached
Out of Memory: Kill process 391 (portmap) score 466 and children.
Out of memory: Killed process 391 (portmap).
klogd invoked oom-killer: gfp_mask=0x201d2, order=0, oomkilladj=0
Call Trace:
[C0D1BCD0] [C00089FC]  (unreliable)
[C0D1BD00] [C0039014] 
[C0D1BD30] [C003A3A0] 
[C0D1BD80] [C003C248] 
[C0D1BE00] [C0037808] 
[C0D1BE30] [C0041A00] 
[C0D1BE80] [C0009CF4] 
[C0D1BF40] [C0003094] 
Mem-info:
DMA per-cpu:
CPU    0: Hot: hi:    0, btch:   1 usd:   0   Cold: hi:    0, btch:   1 usd:   0
Active:336 inactive:0 dirty:0 writeback:0 unstable:0 free:126 slab:2825 mapped:0 pagetables:34
DMA free:504kB min:508kB low:632kB high:760kB active:1344kB inactive:0kB present:16256kB pages_scanned:2351 all_unreclaimable? yes
lowmem_reserve[]: 0 0
DMA: 0*4kB 1*8kB 1*16kB 1*32kB 1*64kB 1*128kB 1*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB = 504kB
Free swap:            0kB
4096 pages of RAM
0 pages of HIGHMEM
147 free pages
575 reserved pages
0 pages shared
0 pages swap cached
klogd invoked oom-killer: gfp_mask=0x201d2, order=0, oomkilladj=0
Call Trace:
[C0D1BCD0] [C00089FC]  (unreliable)
[C0D1BD00] [C0039014] 
[C0D1BD30] [C003A3A0] 
[C0D1BD80] [C003C248] 
[C0D1BE00] [C0037808] 
[C0D1BE30] [C0041A00] 
[C0D1BE80] [C0009CF4] 
[C0D1BF40] [C0003094] 
Mem-info:
DMA per-cpu:
CPU    0: Hot: hi:    0, btch:   1 usd:   0   Cold: hi:    0, btch:   1 usd:   0
Active:313 inactive:26 dirty:0 writeback:0 unstable:0 free:127 slab:2826 mapped:1 pagetables:30
DMA free:508kB min:508kB low:632kB high:760kB active:1252kB inactive:104kB present:16256kB pages_scanned:2040 all_unreclaimable? yes
lowmem_reserve[]: 0 0
DMA: 1*4kB 1*8kB 1*16kB 1*32kB 1*64kB 1*128kB 1*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB = 508kB
Free swap:            0kB
4096 pages of RAM
0 pages of HIGHMEM
148 free pages
575 reserved pages
2 pages shared
0 pages swap cached
Out of Memory: Kill process 422 (login) score 77 and children.
Out of memory: Killed process 423 (bash).
Dec 31 19:01:48 10 kernel: jffs2_gcd_mtd0 invoked oom-killer: gfp_mask=0xd0, order=0, oomkilladj=0
Dec 31 19:01:48 10 kernel: Call Trace:
Dec 31 19:01:48 10 kernel: [C06A1D30] [C00089FC]  (unreliable)
Dec 31 19:01:48 10 kernel: [C06A1D60] [C0039014] 
Dec 31 19:01:48 10 kernel: [C06A1D90] [C003A3A0] 
Dec 31 19:01:48 10 kernel: [C06A1DE0] [C004D044] 
Dec 31 19:01:48 10 kernel: [C06A1E10] [C004CD58] 
Dec 31 19:01:48 10 kernel: [C06A1E20] [C00CA314] 
Dec 31 19:01:48 10 kernel: [C06A1E30] [C00CBD9C] 
Dec 31 19:01:48 10 kernel: [C06A1EA0] [C00CC8D4] 
Dec 31 19:01:48 10 kernel: [C06A1F10] [C00D02EC] 
Dec 31 19:01:48 10 kernel: [C06A1F50] [C00D18F8] 
Dec 31 19:01:48 10 kernel: [C06A1FF0] [C0004BB8] 
Dec 31 19:01:48 10 kernel: Mem-info:
Dec 31 19:01:48 10 kernel: DMA per-cpu:
Dec 31 19:01:48 10 kernel: CPU    0: Hot: hi:    0, btch:   1 usd:   0   Cold: hi:    0, btch:   1 usd:   0
Dec 31 19:01:48 10 kernel: Active:336 inactive:0 dirty:0 writeback:0 unstable:0 free:127 slab:2824 mapped:0 pagetables:34
Dec 31 19:01:48 10 kernel: DMA free:508kB min:508kB low:632kB high:760kB active:1344kB inactive:0kB present:16256kB pages_scanned:2351 all_unreclaimable? yes
Dec 31 19:01:48 10 kernel: lowmem_reserve[]: 0 0
Dec 31 19:01:48 10 kernel: DMA: 1*4kB 1*8kB 1*16kB 1*32kB 1*64kB 1*128kB 1*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB = 508kB
Dec 31 19:01:48 10 kernel: Free swap:            0kB
Dec 31 19:01:48 10 kernel: 4096 pages of RAM
Dec 31 19:01:48 10 kernel: 0 pages of HIGHMEM
Dec 31 19:01:48 10 kernel: 148 free pages
Dec 31 19:01:48 10 kernel: 575 reserved pages
Dec 31 19:01:48 10 kernel: 0 pages shared
Dec 31 19:01:48 10 kernel: 0 pages swap cached
Dec 31 19:01:49 10 kernel: Out of Memory: Kill process 391 (portmap) score 466 and children.
Dec 31 19:01:49 10 kernel: Out of memory: Killed process 391 (portmap).
Dec 31 19:01:49 10 kernel: klogd invoked oom-killer: gfp_mask=0x201d2, order=0, oomkilladj=0
Dec 31 19:01:49 10 kernel: Call Trace:
Dec 31 19:01:49 10 kernel: [C0D1BCD0] [C00089FC]  (unreliable)
Dec 31 19:01:49 10 kernel: [C0D1BD00] [C0039014] 
Dec 31 19:01:49 10 kernel: [C0D1BD30] [C003A3A0] 
Dec 31 19:01:49 10 kernel: [C0D1BD80] [C003C248] 
Dec 31 19:01:49 10 kernel: [C0D1BE00] [C0037808] 
Dec 31 19:01:49 10 kernel: [C0D1BE30] [C0041A00] 
Dec 31 19:01:49 10 kernel: [C0D1BE80] [C0009CF4] 
Dec 31 19:01:49 10 kernel: [C0D1BF40] [C0003094] 
Dec 31 19:01:49 10 kernel: Mem-info:
Dec 31 19:01:49 10 kernel: DMA per-cpu:
Dec 31 19:01:49 10 kernel: CPU    0: Hot: hi:    0, btch:   1 usd:   0   Cold: hi:    0, btch:   1 usd:   0
Dec 31 19:01:49 10 kernel: Active:336 inactive:0 dirty:0 writeback:0 unstable:0 free:126 slab:2825 mapped:0 pagetables:34
Dec 31 19:01:49 10 kernel: DMA free:504kB min:508kB low:632kB high:760kB active:1344kB inactive:0kB present:16256kB pages_scanned:2351 all_unreclaimable? yes
Dec 31 19:01:49 10 kernel: lowmem_reserve[]: 0 0
Dec 31 19:01:49 10 kernel: DMA: 0*4kB 1*8kB 1*16kB 1*32kB 1*64kB 1*128kB 1*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB = 504kB
Dec 31 19:01:49 10 kernel: Free swap:            0kB
Dec 31 19:01:49 10 kernel: 4096 pages of RAM
Dec 31 19:01:49 10 kernel: 0 pages of HIGHMEM
Dec 31 19:01:49 10 kernel: 147 free pages
Dec 31 19:01:49 10 kernel: 575 reserved pages
Dec 31 19:01:49 10 kernel: 0 pages shared
Dec 31 19:01:49 10 kernel: 0 pages swap cached
Dec 31 19:01:49 10 kernel: klogd invoked oom-killer: gfp_mask=0x201d2, order=0, oomkilladj=0
Dec 31 19:01:49 10 kernel: Call Trace:
Dec 31 19:01:49 10 kernel: [C0D1BCD0] [C00089FC]  (unreliable)
Dec 31 19:01:49 10 kernel: [C0D1BD00] [C0039014] 
Dec 31 19:01:49 10 kernel: [C0D1BD30] [C003A3A0] 
Dec 31 19:01:49 10 kernel: [C0D1BD80] [C003C248] 
Dec 31 19:01:49 10 kernel: [C0D1BE00] [C0037808] 
Dec 31 19:01:49 10 kernel: [C0D1BE30] [C0041A00] 
Dec 31 19:01:49 10 kernel: [C0D1BE80] [C0009CF4] 
Dec 31 19:01:49 10 kernel: [C0D1BF40] [C0003094] 
Dec 31 19:01:49 10 kernel: Mem-info:
Dec 31 19:01:49 10 kernel: DMA per-cpu:
Dec 31 19:01:49 10 kernel: CPU    0: Hot: hi:    0, btch:   1 usd:   0   Cold: hi:    0, btch:   1 usd:   0
Dec 31 19:01:49 10 kernel: Active:313 inactive:26 dirty:0 writeback:0 unstable:0 free:127 slab:2826 mapped:1 pagetables:30
Dec 31 19:01:49 10 kernel: DMA free:508kB min:508kB low:632kB high:760kB active:1252kB inactive:104kB present:16256kB pages_scanned:2040 all_unreclaimable? yes
Dec 31 19:01:49 10 kernel: lowmem_reserve[]: 0 0
Dec 31 19:01:49 10 kernel: DMA: 1*4kB 1*8kB 1*16kB 1*32kB 1*64kB 1*128kB 1*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB = 508kB
Dec 31 19:01:49 10 kernel: Free swap:            0kB
Dec 31 19:01:49 10 kernel: 4096 pages of RAM
Dec 31 19:01:49 10 kernel: 0 pages of HIGHMEM
Dec 31 19:01:49 10 kernel: 148 free pages
Dec 31 19:01:49 10 kernel: 575 reserved pages
Dec 31 19:01:49 10 kernel: 2 pages shared
Dec 31 19:01:49 10 kernel: 0 pages swap cached
Dec 31 19:01:49 10 kernel: Out of Memory: Kill process 422 (login) score 77 and children.
Dec 31 19:01:49 10 kernel: Out of memory: Killed process 423 (bash).
INIT: cannot fork, retry..





Config:
[igor@tps linux-2.6.19.2-1]$ cat .config | grep =
CONFIG_MMU=y
CONFIG_GENERIC_HARDIRQS=y
CONFIG_RWSEM_XCHGADD_ALGORITHM=y
CONFIG_GENERIC_HWEIGHT=y
CONFIG_GENERIC_CALIBRATE_DELAY=y
CONFIG_PPC=y
CONFIG_PPC32=y
CONFIG_GENERIC_NVRAM=y
CONFIG_GENERIC_FIND_NEXT_BIT=y
CONFIG_SCHED_NO_NO_OMIT_FRAME_POINTER=y
CONFIG_ARCH_MAY_HAVE_PC_FDC=y
CONFIG_DEFCONFIG_LIST="/lib/modules/$UNAME_RELEASE/.config"
CONFIG_EXPERIMENTAL=y
CONFIG_BROKEN_ON_SMP=y
CONFIG_INIT_ENV_ARG_LIMIT=32
CONFIG_LOCALVERSION=""
CONFIG_LOCALVERSION_AUTO=y
CONFIG_SYSVIPC=y
CONFIG_INITRAMFS_SOURCE=""
CONFIG_CC_OPTIMIZE_FOR_SIZE=y
CONFIG_SYSCTL=y
CONFIG_EMBEDDED=y
CONFIG_SYSCTL_SYSCALL=y
CONFIG_PRINTK=y
CONFIG_BUG=y
CONFIG_ELF_CORE=y
CONFIG_BASE_FULL=y
CONFIG_FUTEX=y
CONFIG_SHMEM=y
CONFIG_SLAB=y
CONFIG_VM_EVENT_COUNTERS=y
CONFIG_RT_MUTEXES=y
CONFIG_BASE_SMALL=0
CONFIG_MODULES=y
CONFIG_MODULE_UNLOAD=y
CONFIG_MODULE_FORCE_UNLOAD=y
CONFIG_KMOD=y
CONFIG_BLOCK=y
CONFIG_IOSCHED_NOOP=y
CONFIG_IOSCHED_AS=y
CONFIG_IOSCHED_DEADLINE=y
CONFIG_IOSCHED_CFQ=y
CONFIG_DEFAULT_AS=y
CONFIG_DEFAULT_IOSCHED="anticipatory"
CONFIG_40x=y
CONFIG_4xx=y
CONFIG_PPChameleonEVB=y
CONFIG_TZ_64=y
CONFIG_IBM_OCP=y
CONFIG_405EP=y
CONFIG_PPC_GEN550=y
CONFIG_UART0_TTYS0=y
CONFIG_NOT_COHERENT_CACHE=y
CONFIG_ARCH_POPULATES_NODE_MAP=y
CONFIG_HZ_100=y
CONFIG_HZ=100
CONFIG_PREEMPT_NONE=y
CONFIG_SELECT_MEMORY_MODEL=y
CONFIG_FLATMEM_MANUAL=y
CONFIG_FLATMEM=y
CONFIG_FLAT_NODE_MEM_MAP=y
CONFIG_SPLIT_PTLOCK_CPUS=4
CONFIG_BINFMT_ELF=y
CONFIG_SECCOMP=y
CONFIG_ISA_DMA_API=y
CONFIG_HIGHMEM_START=0xfe000000
CONFIG_LOWMEM_SIZE=0x30000000
CONFIG_KERNEL_START=0xc0000000
CONFIG_TASK_SIZE=0x80000000
CONFIG_CONSISTENT_START=0xff100000
CONFIG_CONSISTENT_SIZE=0x00200000
CONFIG_BOOT_LOAD=0x00400000
CONFIG_NET=y
CONFIG_PACKET=y
CONFIG_UNIX=y
CONFIG_XFRM=y
CONFIG_INET=y
CONFIG_IP_MULTICAST=y
CONFIG_IP_FIB_HASH=y
CONFIG_IP_PNP=y
CONFIG_IP_PNP_DHCP=y
CONFIG_SYN_COOKIES=y
CONFIG_INET_XFRM_MODE_TRANSPORT=y
CONFIG_INET_XFRM_MODE_TUNNEL=y
CONFIG_INET_XFRM_MODE_BEET=y
CONFIG_INET_DIAG=y
CONFIG_INET_TCP_DIAG=y
CONFIG_TCP_CONG_CUBIC=y
CONFIG_DEFAULT_TCP_CONG="cubic"
CONFIG_PREVENT_FIRMWARE_BUILD=y
CONFIG_MTD=y
CONFIG_MTD_DEBUG=y
CONFIG_MTD_DEBUG_VERBOSE=2
CONFIG_MTD_PARTITIONS=y
CONFIG_MTD_CHAR=y
CONFIG_MTD_BLOCK=y
CONFIG_MTD_MAP_BANK_WIDTH_1=y
CONFIG_MTD_MAP_BANK_WIDTH_2=y
CONFIG_MTD_MAP_BANK_WIDTH_4=y
CONFIG_MTD_CFI_I1=y
CONFIG_MTD_CFI_I2=y
CONFIG_MTD_COMPLEX_MAPPINGS=y
CONFIG_MTD_NAND=y
CONFIG_MTD_NAND_IDS=y
CONFIG_MTD_NAND_PPCHAMELEONEVB=y
CONFIG_BLK_DEV_LOOP=y
CONFIG_BLK_DEV_RAM=y
CONFIG_BLK_DEV_RAM_COUNT=4
CONFIG_BLK_DEV_RAM_SIZE=4096
CONFIG_BLK_DEV_RAM_BLOCKSIZE=1024
CONFIG_BLK_DEV_INITRD=y
CONFIG_NETDEVICES=y
CONFIG_NET_ETHERNET=y
CONFIG_MII=y
CONFIG_IBM_EMAC=y
CONFIG_IBM_EMAC_RXB=64
CONFIG_IBM_EMAC_TXB=32
CONFIG_IBM_EMAC_POLL_WEIGHT=32
CONFIG_IBM_EMAC_RX_COPY_THRESHOLD=256
CONFIG_IBM_EMAC_RX_SKB_HEADROOM=0
CONFIG_INPUT=y
CONFIG_SERIAL_8250=y
CONFIG_SERIAL_8250_CONSOLE=y
CONFIG_SERIAL_8250_NR_UARTS=4
CONFIG_SERIAL_8250_RUNTIME_UARTS=4
CONFIG_SERIAL_CORE=y
CONFIG_SERIAL_CORE_CONSOLE=y
CONFIG_UNIX98_PTYS=y
CONFIG_LEGACY_PTYS=y
CONFIG_LEGACY_PTY_COUNT=256
CONFIG_HW_RANDOM=y
CONFIG_GEN_RTC=y
CONFIG_HWMON=y
CONFIG_FIRMWARE_EDID=y
CONFIG_EXT2_FS=y
CONFIG_EXT2_FS_XATTR=y
CONFIG_EXT2_FS_POSIX_ACL=y
CONFIG_EXT2_FS_XIP=y
CONFIG_FS_XIP=y
CONFIG_FS_MBCACHE=y
CONFIG_FS_POSIX_ACL=y
CONFIG_INOTIFY=y
CONFIG_INOTIFY_USER=y
CONFIG_DNOTIFY=y
CONFIG_PROC_FS=y
CONFIG_PROC_KCORE=y
CONFIG_PROC_SYSCTL=y
CONFIG_SYSFS=y
CONFIG_TMPFS=y
CONFIG_RAMFS=y
CONFIG_JFFS2_FS=y
CONFIG_JFFS2_FS_DEBUG=0
CONFIG_JFFS2_FS_WRITEBUFFER=y
CONFIG_JFFS2_COMPRESSION_OPTIONS=y
CONFIG_JFFS2_ZLIB=y
CONFIG_JFFS2_RTIME=y
CONFIG_JFFS2_CMODE_PRIORITY=y
CONFIG_CRAMFS=y
CONFIG_NFS_FS=y
CONFIG_NFS_V3=y
CONFIG_NFS_V3_ACL=y
CONFIG_NFS_V4=y
CONFIG_ROOT_NFS=y
CONFIG_LOCKD=y
CONFIG_LOCKD_V4=y
CONFIG_NFS_ACL_SUPPORT=y
CONFIG_NFS_COMMON=y
CONFIG_SUNRPC=y
CONFIG_SUNRPC_GSS=y
CONFIG_RPCSEC_GSS_KRB5=y
CONFIG_PARTITION_ADVANCED=y
CONFIG_NLS=y
CONFIG_NLS_DEFAULT="iso8859-1"
CONFIG_NLS_ASCII=y
CONFIG_CRC32=y
CONFIG_ZLIB_INFLATE=y
CONFIG_ZLIB_DEFLATE=y
CONFIG_PLIST=y
CONFIG_ENABLE_MUST_CHECK=y
CONFIG_DEBUG_KERNEL=y
CONFIG_LOG_BUF_SHIFT=14
CONFIG_DETECT_SOFTLOCKUP=y
CONFIG_FORCED_INLINING=y
CONFIG_PPC_OCP=y
CONFIG_CRYPTO=y
CONFIG_CRYPTO_ALGAPI=y
CONFIG_CRYPTO_BLKCIPHER=y
CONFIG_CRYPTO_MANAGER=y
CONFIG_CRYPTO_MD5=y
CONFIG_CRYPTO_ECB=m
CONFIG_CRYPTO_CBC=y
CONFIG_CRYPTO_DES=y


Best regards,
Igor Marnat
mailto:marny@rambler.ru
