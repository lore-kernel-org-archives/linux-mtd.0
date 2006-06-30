Received: from [202.62.79.227] (helo=gnu.picopeta.com)
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FwE3o-00033g-QK
	for linux-mtd@lists.infradead.org; Fri, 30 Jun 2006 09:09:11 +0100
Received: from [202.62.79.153] (unknown [202.62.79.153])
	by gnu.picopeta.com (Postfix) with ESMTP id CE32D2FF0C
	for <linux-mtd@lists.infradead.org>;
	Fri, 30 Jun 2006 12:48:21 +0530 (IST)
Message-ID: <44A4D796.4070107@picopeta.com>
Date: Fri, 30 Jun 2006 13:19:42 +0530
From: Girish <girish@picopeta.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: 2k page Nand flash problem
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Reply-To: girish@picopeta.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi all,

    I have
            PXA-based board
            Hynix 256 Mb Nand flash(page size = 2k).
            Kernel-2.6.16.
 With Samsung 32mb Nand flash kernel-2.6.16 works fine  but with Hynix 
256 Mb Nand Flash it gives
 fallowing error messages ....

   
    Uncompressing 
Linux......................................................... done, 
booting the kernel.
Linux version 2.6.16-g00fdeb89-dirty (root@trojan.picopeta.com) (gcc 
version 3.4.2) #147 Fri Jun 30 12:20:49 6CPU: XScale-PXA255 [69052d06] 
revision 6 (ARMv5TE)
Machine: Amida Development Platform
Memory policy: ECC disabled, Data cache writeback
Memory clock: 99.53MHz (*27)
Run Mode clock: 199.07MHz (*2)
Turbo Mode clock: 199.07MHz (*1.0, active)
MM: invalid domain in supersection mapping for 0x8000000000 at 0xf0000000
CPU0: D VIVT undefined 5 cache
CPU0: I cache: 32768 bytes, associativity 32, 32 byte lines, 32 sets
CPU0: D cache: 32768 bytes, associativity 32, 32 byte lines, 32 sets
Built 1 zonelists
Kernel command line: mem=64M console=ttyS0,115200 root=1f02
PID hash table entries: 512 (order: 9, 8192 bytes)
Console: colour dummy device 80x30
Dentry cache hash table entries: 16384 (order: 4, 65536 bytes)
Inode-cache hash table entries: 8192 (order: 3, 32768 bytes)
Memory: 64MB = 64MB total
Memory: 63012KB available (1408K code, 309K data, 76K init)
Mount-cache hash table entries: 512
CPU: Testing write buffer coherency: ok
NetWinder Floating Point Emulator V0.97 (double precision)
JFFS2 version 2.2. (NAND) (C) 2001-2003 Red Hat, Inc.
fuse init (API version 7.6)
io scheduler noop registered (default)
pxa2xx-uart.0: ttyS0 at MMIO 0x40100000 (irq = 15) is a FFUART
pxa2xx-uart.1: ttyS1 at MMIO 0x40200000 (irq = 14) is a BTUART
pxa2xx-uart.2: ttyS2 at MMIO 0x40700000 (irq = 13) is a STUART
pxa2xx-uart.3: ttyS3 at MMIO 0x41600000 (irq = 0) is a HWUART
RAMDISK driver initialized: 16 RAM disks of 8192K size 1024 blocksize
loop: loaded (max 8 devices)
Probing Amida Simputer Application Flash at physical address 0x00000000 
(16-bit bankwidth)
Amida Simputer Application Flash: Found 1 x16 devices at 0x0 in 16-bit bank
 Intel/Sharp Extended Query Table at 0x0035
cfi_cmdset_0001: Erase suspend on write enabled
RedBoot partition parsing not available
cmdlinepart partition parsing not available
Using static partitions on Amida Simputer Application Flash
Creating 1 MTD partitions on "Amida Simputer Application Flash":
0x00000000-0x00040000 : "Bootloader"
mtd: Giving out device 0 to Bootloader
PARTITION Done Using static partitions on Amida Simputer Application Flash
physical (0x 8000000), virtual (0xc6900000)
NAND device: Manufacturer ID: 0xad, Chip ID: 0xda (Hynix NAND 256MiB 
3,3V 8-bit)
Scanning device for bad blocks
Creating 3 MTD partitions on "NAND 256MiB 3,3V 8-bit":
0x00000000-0x00180000 : "Kernel"
mtd: Giving out device 1 to Kernel
0x00180000-0x00380000 : "/(cramfs)"
mtd: Giving out device 2 to /(cramfs)
0x00380000-0x10000000 : "/usr/local(jffs2)"
mtd: Giving out device 3 to /usr/local(jffs2)
mice: PS/2 mouse device common for all mice
ts: Compaq touchscreen protocol output
Advanced Linux Sound Architecture Driver Version 1.0.11rc2 (Wed Jan 04 
08:57:20 2006 UTC).
input: Touchscreen panel as /class/input/input0
Touch screen device number  17156
ALSA device list:
  #0: pxa2xx-ac97 (Philips UCB1400)
VFS: Mounted root (cramfs filesystem) readonly.
Freeing init memory: 76K
/sbin/init
nand_read_ecc: Failed ECC read, page 0x0000042a
nand_read_ecc: Failed ECC read, page 0x0000042a
end_request: I/O error, dev mtdblock2, sector 1192
Buffer I/O error on device mtdblock2, logical block 149
Error -5 while decompressing!
c01c1c63(2066)->c3caf000(4096)
Error -3 while decompressing!
c01c2475(2064)->c3cb0000(4096)
Error -3 while decompressing!
c01c1c85(2056)->c3cde000(4096)
/sbin/init: relocation error: /sbin/initKernel panic - not syncing: 
Attempted to kill init!
: symbol optind, version GLIBC_2.0 not defined in file libc.so.6  with 
link time reference

    
Any Solutions ...... ?

Thanks & regards
Girish

-- 

----------------------------------------------------------------------
" Faith begins when Ability ends...

Girish A J (girish.a@geodesiconline.com) 
Associate - Systems,		          Ph: (80) 2361 8184-86   Ext 135
PicoPeta Simputers Pvt Ltd.        Fax: (80) 2361 7568
146 5th Cross, RMV Extension,     
Bangalore - 560 080.               
URL  http://www.picopeta.com
-------------------------------------------------------------------------- 
