Received: from tyo202.gate.nec.co.jp ([210.143.35.52])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 184tji-0003to-00
	for <linux-mtd@lists.infradead.org>; Fri, 25 Oct 2002 02:58:07 +0100
Message-ID: <3DB8AC2B.6020005@tmg99.ntes.nec.co.jp>
Date: Fri, 25 Oct 2002 11:27:55 +0900
From: "Jerick S. Colendres" <g_jerik@tmg99.ntes.nec.co.jp>
MIME-Version: 1.0
To: Sreekanth Rupavatharam <rskanth@yahoo.com>
CC: linux-mtd@lists.infradead.org
Subject: Re: unble to mount rootfilesystem from cramfs
References: <001401c27b85$8b212ff0$d40a15ac@SREELAPTOP>
Content-Type: text/plain; charset=us-ascii; format=flowed
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

be sure to set MTD Support->Caching  block device access to MTD device, then
try to use "root=/dev/mtdblock1" and not "root=/dev/mtd1". /dev/mtd1 is 
a char device
while /dev/mtdblock1 is a block device so you can mount it.

also you can set MTD Support-> Direct char device access to MTD devices 
so you can
use dd or cp directly to MTD flash device. (eg. cp image.cramfs /dev/mtd1)

hope this helps.. =)

jerick

>Hello,
>
>I am unble to mount rootfilesystem from cramfs...
>Any suggestions on where I am going wrong?.
>------steps i am following-----------------
>1.In physmap, added 2 partitions: 0 for kernel, 1 for cramfs rootfilesystem.
>2.make menuconfig: select cramfs, set root=/dev/mtd1.
>3.make zImage.initrd,
>4.create binary
>5.objcopy -I binary -O srec --set-start=FLASH_BASE_ADDR kImgName
>6.Using BDM flash the srec file to FLASH_BASE_ADDR
>7.mkcramfs -r b filesystem fileImageName
>9.objcopy -I binary -O srec --set-start=RFS_ADDR fImageName.bin fImgName.s19
>-Here the RFS_ADDR corresponds to the mtd1 'offset'.
>10. Using BDM flash the srec file to RFS_ADDR
>
>--------log message---------
>load from 0x281c0a8 to 0x400000, size=0x55328
>
>Starting at: 0x400000,0x48000005
>
>About to execute
>loaded at:     00400000 004591E4
>board data at: 00011270 0001128C
>relocated to:  003F0100 003F011C
>zimage at:     004054C0 00454DD0
>initrd at:     00454DD0 00454DD7
>avail ram:     00495000 02000000
>
>Linux/PPC load: root=/dev/ram
>Uncompressing Linux...done.
>Now booting the kernel
>ioremap...
>Linux version 2.4.2_hhl20 (root@localhost.localdomain) (gcc version 2.95.3
>20010
>315 (release/MontaVista)) #246 Thu Oct 24 19:48:29 IST 2002
>On node 0 totalpages: 8192
>zone(0): 8192 pages.
>zone(1): 0 pages.
>zone(2): 0 pages.
>Kernel command line: root=/dev/ram
>Decrementer Frequency = 187500000/60
>Calibrating delay loop... 49.56 BogoMIPS
>Memory: 31160k available (624k kernel code, 348k data, 32k init, 0k highmem)
>Dentry-cache hash table entries: 4096 (order: 3, 32768 bytes)
>Buffer-cache hash table entries: 1024 (order: 0, 4096 bytes)
>Page-cache hash table entries: 8192 (order: 3, 32768 bytes)
>Inode-cache hash table entries: 2048 (order: 2, 16384 bytes)
>POSIX conformance testing by UNIFIX
>Linux NET4.0 for Linux 2.4
>Based upon Swansea University Computer Society NET3.039
>read_super, 730
>read_super, 734
>read_super, 739
>read_super, 741
>read_super, 746
>read_super, 748
>Starting kswapd v1.8
>read_super, 730
>read_super, 734
>read_super, 739
>read_super, 741
>read_super, 746
>read_super, 748
>read_super, 730
>read_super, 734
>read_super, 739
>read_super, 741
>read_super, 746
>read_super, 748
>read_super, 730
>read_super, 734
>read_super, 739
>read_super, 741
>read_super, 746
>read_super, 748
>CPM UART driver version 0.03
>ttyS00 at 0x0280 is a SMC
>pty: 256 Unix98 ptys configured
>block: queued sectors max/low 20642kB/6880kB, 64 slots per queue
>RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
>loop: loaded (max 8 devices)
>physmap flash device: 800000 at 2800000
>Physically mapped flash: Found 2 x16 CFI devices at location 0 in 16 bit
>mode
> Amd/Fujitsu Extended Query Table v1.1 at 0x0040
>Physically mapped flash: Swapping erase regions for broken CFI table.
>number of CFI chips: 1
>in add_mtd_partitions(vijay)
>add_mtd_partitions(vijay):set up the MTD object for this partition
>add_mtd_partitions(vijay):slave->mtd.type = 0
>add_mtd_partitions(vijay):slave->mtd.type = 3
>add_mtd_partitions(vijay):slave->mtd.flags = 5
>add_mtd_partitions(vijay):slave->mtd.size = 0x80000
>add_mtd_partitions(vijay):slave->mtd.oobsize = 0x0
>add_mtd_partitions(vijay):slave->mtd.bank_size = 0x0
>mtd: Giving out device 0 to RG boot firmware + kernel
>add_mtd_partitions(vijay):set up the MTD object for this partition
>add_mtd_partitions(vijay):slave->mtd.type = 0
>add_mtd_partitions(vijay):slave->mtd.type = 3
>add_mtd_partitions(vijay):slave->mtd.flags = 5
>add_mtd_partitions(vijay):slave->mtd.size = 0x400000
>add_mtd_partitions(vijay):slave->mtd.oobsize = 0x0
>add_mtd_partitions(vijay):slave->mtd.bank_size = 0x0
>mtd: Giving out device 1 to RG cramfs part1
>mount_root,1545 Mounting cramfs (vijay)
>mount_root, get_fs_type success
>mount_root, created fs
>read_super, 730
>read_super, 734
>read_super, 739
>read_super, 741
>read_super, 746
>read_super, 748
>wrong magic,(vijay) -65536 instead of 684539205
>cramfs_read_super, Returning retval = 0
>read_super, 763, read_super failed (vijay)
>mount_root, not able to mount cramfs
>Oops: kernel access of bad area, sig: 11
>NIP: C00C2A78 XER: 6000807F LR: C00C2A78 SP: C01B1EB0 REGS: c01b1e00 TRAP:
>0300
>MSR: 00009032 EE: 1 PR: 0 FP: 0 ME: 1 IR/DR: 11
>DAR: 00000024, DSISR: 0000001B
>TASK = c01b0000[1] 'swapper' Last syscall: 120
>last math 00000000 last altivec 00000000
>GPR00: C00C2A78 C01B1EB0 C01B0000 00000025 00001032 00000001 00000001
>00000000
>GPR08: C00C8974 C00B0000 00000025 C01B1DF0 2242D228 00000000 00000800
>00000000
>GPR16: 00000000 00000000 00000000 00000800 FF000000 00011270 00400000
>00016479
>GPR24: 00000000 00000000 00030001 00000000 003F0000 00002000 C00BAACC
>C00D0000
>Call backtrace:
>C00C2A78 C00BF810 C000226C C0004D80
>Kernel panic: Attempted to kill init!
>Rebooting in 180 seconds..
>
>Any help is greatly appreciated.
>
>
>Sreekanth
>
>
>______________________________________________________
>Linux MTD discussion mailing list
>http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
>
>  
>
