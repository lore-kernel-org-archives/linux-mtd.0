Received: from wproxy.gmail.com ([64.233.184.199])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DN7Ra-0002wP-Fv
	for linux-mtd@lists.infradead.org; Sun, 17 Apr 2005 06:56:03 -0400
Received: by wproxy.gmail.com with SMTP id 57so1334440wri
	for <linux-mtd@lists.infradead.org>;
	Sun, 17 Apr 2005 03:56:05 -0700 (PDT)
Message-ID: <c2bc1f405041703564e08b32e@mail.gmail.com>
Date: Sun, 17 Apr 2005 18:56:05 +0800
From: zheng wei <jeanwelly@gmail.com>
To: linux-mtd@lists.infradead.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Cc: 
Subject: ECC error on 2.6.11
Reply-To: zheng wei <jeanwelly@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I added the Nand flash partitions in arch/arm/mach-s3c2410/devs.c.
Added=20
.dev =3D {=20
.platform_data =3D &s3c_nand_info=20
}=20
to s3c_device_nand.
Then, add &s3c_device_nand in __initdata in
arch/arm/mach-s3c2410/mach-smdk2410.c
Recompile the kernel, boot the kernel. The ECC can't not work correctly.

Thanks.





NOW, Booting Linux......
Uncompressing Linux........................................................=
.....
............. done, booting the kernel.
Linux version 2.6.11 (root@localhost.localdomain) (gcc version 3.4.1) #12 S=
un Ap
r 17 17:20:07 CST 2005
CPU: ARM920Tid(wb) [41129200] revision 0 (ARMv4T)
CPU0: D VIVT write-back cache
CPU0: I cache: 16384 bytes, associativity 64, 32 byte lines, 8 sets
CPU0: D cache: 16384 bytes, associativity 64, 32 byte lines, 8 sets
Machine: SMDK2410
ATAG_INITRD is deprecated; please update your bootloader.
Memory policy: ECC disabled, Data cache writeback
CPU S3C2410 (id 0x32410000)
S3C2410: core 200.000 MHz, memory 100.000 MHz, peripheral 50.000 MHz
S3C2410 Clock control, (c) 2004 Simtec Electronics
Built 1 zonelists
Kernel command line: noinitrd root=3D/dev/mtdblock3 init=3D/linuxrc console=
=3DttySAC0
irq: clearing pending ext status 00000300
irq: clearing subpending status 00000003
irq: clearing subpending status 00000002
PID hash table entries: 512 (order: 9, 8192 bytes)
timer tcon=3D00000000, tcnt a2c1, tcfg 00000200,00000000, usec 00001eb8
Console: colour dummy device 80x30
Dentry cache hash table entries: 16384 (order: 4, 65536 bytes)
Inode-cache hash table entries: 8192 (order: 3, 32768 bytes)
Memory: 64MB =3D 64MB total
Memory: 62464KB available (1771K code, 503K data, 92K init)
Mount-cache hash table entries: 512 (order: 0, 4096 bytes)
CPU: Testing write buffer coherency: ok
NET: Registered protocol family 16
S3C2410: Initialising architecture
S3C2410 DMA Driver, (c) 2003-2004 Simtec Electronics
DMA channel 0 at c4800000, irq 33
DMA channel 1 at c4800040, irq 34
DMA channel 2 at c4800080, irq 35
DMA channel 3 at c48000c0, irq 36
VFS: Disk quotas dquot_6.5.1
Dquot-cache hash table entries: 1024 (order 0, 4096 bytes)
Initializing Cryptographic API
Real Time Clock Driver v1.12
S3C2410 RTC, (c) 2004 Simtec Electronics
S3C2410 Watchdog Timer, (c) 2004 Simtec Electronics
s3c2410_serial0 at MMIO 0x50000000 (irq =3D 70) is a S3C2410
s3c2410_serial1 at MMIO 0x50004000 (irq =3D 73) is a S3C2410
s3c2410_serial2 at MMIO 0x50008000 (irq =3D 76) is a S3C2410
io scheduler noop registered
io scheduler anticipatory registered
io scheduler deadline registered
io scheduler cfq registered
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
nbd: registered device at major 43
Uniform Multi-Platform E-IDE driver Revision: 7.00alpha2
ide: Assuming 50MHz system bus speed for PIO modes; override with idebus=3D=
xx
ide-floppy driver 0.99.newide
S3C2410 NAND Driver, (c) 2004 Simtec Electronics
s3c2410-nand: mapped registers at c4a00000
s3c2410-nand: timing: Tacls 10ns, Twrph0 40ns, Twrph1 10ns
NAND device: Manufacturer ID: 0xec, Chip ID: 0x76 (Samsung NAND 64MiB 3,3V =
8-bit
)
Scanning device for bad blocks
Creating 5 MTD partitions on "NAND 64MiB 3,3V 8-bit":
0x00000000-0x00020000 : "vivi"
mtd: Giving out device 0 to vivi
0x00020000-0x00030000 : "param"
mtd: Giving out device 1 to param
0x00030000-0x001f0000 : "kernel"
mtd: Giving out device 2 to kernel
0x00200000-0x00400000 : "root"
mtd: Giving out device 3 to root
0x00400000-0x04000000 : "user"
mtd: Giving out device 4 to user
mice: PS/2 mouse device common for all mice
NET: Registered protocol family 2
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP established hash table entries: 4096 (order: 3, 32768 bytes)
TCP bind hash table entries: 4096 (order: 2, 16384 bytes)
TCP: Hash tables configured (established 4096 bind 4096)
NET: Registered protocol family 1
nand_read_ecc: Failed ECC read, page 0x00001002
nand_read_ecc: Failed ECC read, page 0x00001002
end_request: I/O error, dev mtdblock3, sector 2
EXT2-fs: unable to read superblock
nand_read_ecc: Failed ECC read, page 0x00001000
end_request: I/O error, dev mtdblock3, sector 0
FAT: unable to read boot sector
VFS: Cannot open root device "mtdblock3" or unknown-block(31,3)
Please append a correct "root=3D" boot option
Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(3=
1,3)


--=20
---------
jeanwelly
Email:  jeanwelly@gmail.com
China
