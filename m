Received: from rwcrmhc13.comcast.net ([204.127.198.39])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BG2aY-0005Ha-5T
	for linux-mtd@lists.infradead.org; Tue, 20 Apr 2004 22:15:30 +0100
From: "Bob Coggeshall" <bob@cogwheel.com>
To: <linux-mtd@lists.infradead.org>
Date: Tue, 20 Apr 2004 14:15:27 -0700
Message-ID: <GLEEJIHFPNJCEDMIAPLKIEFPEAAA.bob@cogwheel.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: cfi_cmdset_0002.c (AMD interleaved chips) fix
Reply-To: bob@cogwheel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

	
I've been trying to get a pair of interleaved Am29LV640  parts on a
mpc852 (watered down '866) to work using this patch and it still does 
not work --

When I insmod the mapping module it *looks* like everything comes up OK, 
and reads appear to work also. One suspicious thing is while gen_probe() reports
2 AMD/Fuji x16 parts, cfi_amdstd_setup() is  reporting cfi->numchips set at 1.

My config and and boot messages follow...

my kernel config: 

    CONFIG_MTD_GEN_PROBE=m
    CONFIG_MTD_CFI_ADV_OPTIONS=y
    CONFIG_MTD_CFI_NOSWAP=y
    # CONFIG_MTD_CFI_BE_BYTE_SWAP is not set
    # CONFIG_MTD_CFI_LE_BYTE_SWAP is not set
    CONFIG_MTD_CFI_GEOMETRY=y
    # CONFIG_MTD_CFI_B1 is not set
    # CONFIG_MTD_CFI_B2 is not set
    CONFIG_MTD_CFI_B4=y
    # CONFIG_MTD_CFI_B8 is not set
    # CONFIG_MTD_CFI_I1 is not set
    CONFIG_MTD_CFI_I2=y
    # CONFIG_MTD_CFI_I4 is not set
    # CONFIG_MTD_CFI_I8 is not set
    # CONFIG_MTD_CFI_INTELEXT is not set
    CONFIG_MTD_CFI_AMDSTD=m
    # CONFIG_MTD_CFI_STAA is not set
    CONFIG_MTD_CFI_UTIL=m
    CONFIG_MTD_RAM=m
    CONFIG_MTD_ROM=m
    # CONFIG_MTD_ABSENT is not set
    # CONFIG_MTD_OBSOLETE_CHIPS is not set
    # CONFIG_MTD_AMDSTD is not set
    # CONFIG_MTD_SHARP is not set
    # CONFIG_MTD_JEDEC is not set
    # CONFIG_MTD_COMPLEX_MAPPINGS is not set
    CONFIG_MTD_PHYSMAP=y
    CONFIG_MTD_EP852=m
    # CONFIG_MTD_CFI_FLAGADM is not set
    # CONFIG_MTD_PCI is not set
    # CONFIG_MTD_PCMCIA is not set
    # Self-contained MTD device drivers
    # CONFIG_MTD_PMC551 is not set
    CONFIG_MTD_SLRAM=m
    CONFIG_MTD_MTDRAM=m
    CONFIG_MTDRAM_TOTAL_SIZE=0
    CONFIG_MTDRAM_ERASE_SIZE=128
    CONFIG_MTD_BLKMTD=m
    # CONFIG_MTD_DOC2000 is not set
    # CONFIG_MTD_DOC2001 is not set
    # CONFIG_MTD_DOC2001PLUS is not set
    # CONFIG_MTD_DOCPROBE is not set
    # CONFIG_MTD_NAND is not set
    #

Boot up

    Linux version 2.4.22-pre8 (coggs@fracadeux) (gcc version 2.95.4 20010319 (prerelease/franzo/20011204)) #22 Tue
    Apr 20 13:40:57 PDT 2004
    On node 0 totalpages: 16384
    zone(0): 16384 pages.
    zone(1): 0 pages.
    zone(2): 0 pages.
    Kernel command line: console=ttyS0,9600 console=tty0 root=/dev/ram0 init=/linuxrc rw
    Decrementer Frequency = 375000000/60
    Calibrating delay loop... 99.73 BogoMIPS
    Memory: 60984k available (1052k kernel code, 464k data, 56k init, 0k highmem)
    Dentry cache hash table entries: 8192 (order: 4, 65536 bytes)
    Inode cache hash table entries: 4096 (order: 3, 32768 bytes)
    Mount cache hash table entries: 512 (order: 0, 4096 bytes)
    Buffer cache hash table entries: 4096 (order: 2, 16384 bytes)
    Page-cache hash table entries: 16384 (order: 4, 65536 bytes)
    POSIX conformance testing by UNIFIX
    Linux NET4.0 for Linux 2.4
    Based upon Swansea University Computer Society NET3.039
    Initializing RT netlink socket
    Starting kswapd
    devfs: v1.12c (20020818) Richard Gooch (rgooch@atnf.csiro.au)
    devfs: boot_options: 0x1
    CPM UART driver version 0.03
    ttyS0 at 0x0280 is on SMC1 using BRG3 - SMC1/SCC3/I2C/SPI Patch enabled
    ttyS1 at 0x0200 is on SCC3 using BRG3
    ttyS2 at 0x0300 is on SCC4 using BRG4
    pty: 256 Unix98 ptys configured
    Generic RTC Driver v1.07
    eth0: FEC ENET Version 0.3, FEC irq 3, addr 00:10:ec:80:4a:c4
    RAMDISK driver initialized: 8 RAM disks of 12288K size 1024 blocksize
    loop: loaded (max 8 devices)
    NET4: Linux TCP/IP 1.0 for NET4.0
    IP Protocols: ICMP, UDP, TCP, IGMP
    IP: routing cache hash table of 512 buckets, 4Kbytes
    TCP: Hash tables configured (established 4096 bind 4096)
    NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
    RAMDISK: Compressed image found at block 0
    Freeing initrd memory: 2190k freed
    VFS: Mounted root (ext2 filesystem).
    Mounted devfs on /dev
    Freeing unused kernel memory: 56k init
    init started:  BusyBox v1.00-pre8 (2004.04.01-23:23+0000) multi-cUsing /lib/modules/mtdcore.o
>   Using /lib/modules/mtdchar.o
>   Using /lib/modules/chipreg.o
>   Using /lib/modules/gen_probe.o
>   Using /lib/modules/cfi_probe.o
>   Using /lib/modules/cfi_util.o
>   Using /lib/modules/cfi_cmdset_0002.o
>   Using /lib/modules/mtdpart.o
>   Using /lib/modules/cmdlinepart.o


Insmoding the mapping module: 
    #
    # insmod ep852-mtd.o
    Using ep852-mtd.o
    EP852 partitioned flash device: 4000000 at ff000000
    RPX: Found 2 x16 devices at 0x0 in 32-bit mode
     Amd/Fujitsu Extended Query Table at 0x0040
      Silicon revision: 4
      Address sensitive unlock: Required
      Erase Suspend: Read/write
      Block protection: 1 sectors per group
      Temporary block unprotect: Supported
      Block protect/unprotect scheme: 4
      Number of simultaneous operations: 0
      Burst mode: Not supported
      Page mode: 4 word page
      Vpp Supply Minimum Program/Erase Voltage: 11.5 V
      Vpp Supply Maximum Program/Erase Voltage: 12.5 V
      Top/Bottom Boot Block: Uniform, Bottom WP
    RPX: CFI does not contain boot bank location. Assuming top.
    number of CFI chips: 1
    Using buffer write method
    cfi_cmdset_0002: Disabling erase-suspend-program due to code brokenness.
    Creating 6 MTD partitions on "RPX":
    0x00000000-0x00040000 : "bootstrap loader"
    mtd: Giving out device 0 to bootstrap loader
    0x00040000-0x00340000 : "kernel+ramdisk1"
    mtd: Giving out device 1 to kernel+ramdisk1
    0x00340000-0x00800000 : "application1"
    mtd: Giving out device 2 to application1
    0x00800000-0x00b00000 : "kernel+ramdisk2"
    mtd: Giving out device 3 to kernel+ramdisk2
    0x00b00000-0x00fc0000 : "application2"
    mtd: Giving out device 4 to application2
    0x00fc0000-0x01000000 : "diagnostics"
    mtd: Giving out device 5 to diagnostics

Fully tally of modules at this point
    
    # lsmod
    Module                  Size  Used by    Not tainted
    ep852-mtd               1452   0 (unused)
    cmdlinepart             2460   0 (unused)
    mtdpart                 6988   0 [ep852-mtd cmdlinepart]
    cfi_cmdset_0002        17916   1
    cfi_util                1184   0 [cfi_cmdset_0002]
    cfi_probe               3096   0
    gen_probe               2240   0 [cfi_probe]
    chipreg                 1344   0 [ep852-mtd cfi_probe]
    mtdchar                 6012   0 (unused)
    mtdcore                 4016   7 [ep852-mtd mtdpart mtdchar]

An attempt to get info from the chip works:
    
    # ./mtd_debug info /dev/mtd/0
    MTD_open
    MTD_ioctl
    MTD_ioctl
    mtd.type = MTD_NORFLASH
    mtd.flags = MTD_ERASEABLE
    mtd.size = 262144 (256K)
    mtd.erasesize = 131072 (128K)
    mtd.oobblock = 0
    mtd.oobsize = 0
    mtd.ecctype = MTD_ECC_NONE
    regions = 0

    MTD_close 1
    MTD_close 2
    cfi_amdstd_sync() 1
    cfi_amdstd_sync() 2
    cfi_amdstd_sync() 3
    cfi_amdstd_sync() 7
    cfi_amdstd_sync() 8
    cfi_amdstd_sync() 9
    MTD_close 3

An attempt to write the device fails. This is with this patch applied

    # cat > /dev/mtd/1
    MTD_open
    <i enter a newline>
    MTD_write
    MTD do_write_buffer(): WRITE 0x00040000(0x0a6c6962)
    map_read32 addr: c5068000
    map_read32 addr: c5068000
    map_read32 addr: c5068000
    map_read32 addr: c5068000
    MTD do_write_buffer(): software timeout
    cat: Write Error: Input/output error
    MTD_close 1
    MTD_close 2
    cfi_amdstd_sync() 1
    cfi_amdstd_sync() 2
    cfi_amdstd_sync() 3
    cfi_amdstd_sync() 7
    cfi_amdstd_sync() 8
    cfi_amdstd_sync() 9
    MTD_close 3

I'll keep bashing on it, but any wisdom would be appreciated...
tnx

--
Bob Coggeshall * Cogwheel, Inc * tel: (+1)206.230.6445 
cell: (+1)206.465.7355 fax: (+1)206.236.2553
icq: 233 433 536 
 
