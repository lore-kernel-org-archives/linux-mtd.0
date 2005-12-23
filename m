Received: from xproxy.gmail.com ([66.249.82.197])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Epk4Y-00072g-Sa
	for linux-mtd@lists.infradead.org; Fri, 23 Dec 2005 05:22:53 -0500
Received: by xproxy.gmail.com with SMTP id s12so437102wxc
	for <linux-mtd@lists.infradead.org>;
	Fri, 23 Dec 2005 02:22:47 -0800 (PST)
Message-ID: <d4d87fd80512230222h70691539j85ae9a9896bfb051@mail.gmail.com>
Date: Fri, 23 Dec 2005 15:52:47 +0530
From: arif lateef <arif.lateef@gmail.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Subject: mounting jffs2 how
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all
    I am porting mtd mapping driver to  cogent board . It
embedded two 16bit 8MB intel  CFI flash to interleave 32 bit bus. I
have no idea on this oops, Do anybody have ideas on this?
  Thanks for helping

bootup message::::



CPU: XScale-PXA255 [69052d06] revision 6 (ARMv5TE)
CPU0: D VIVT undefined 5 cache
CPU0: I cache: 32768 bytes, associativity 32, 32 byte lines, 32 sets
CPU0: D cache: 32768 bytes, associativity 32, 32 byte lines, 32 sets

Bootloader provides ATAGS at 0xa0001000
Memory policy: ECC disabled, Data cache writeback
Built 1 zonelists
Kernel command line:  console=3DttyS0,38400 ip=3D192.168.0.214:192.168.0.89=
:$GIPADD:
$NETMASK::eth0:off  mtdparts=3Dflash00:3911680@1909388(root)ro video=3Dpxaf=
b:mode:64
0x480-16,active,left:1,right:161,hsynclen:1,upper:0,lower:31,vsynclen:32,hs=
ync:0
,vsync:0,outputen:1,pixclockpol:0,pixclock:25000
PID hash table entries: 256 (order: 8, 4096 bytes)
Console: colour dummy device 80x30
Dentry cache hash table entries: 8192 (order: 3, 32768 bytes)
Inode-cache hash table entries: 4096 (order: 2, 16384 bytes)
Memory: 29440KB available (2394K code, 428K data, 100K init)
Mount-cache hash table entries: 512
SCSI subsystem initialized
NetWinder Floating Point Emulator V0.97 (double precision)
Console: switching to colour frame buffer device 80x60
ttyS0 at MMIO 0x40100000 (irq =3D 15) is a FFUART
ttyS1 at MMIO 0x40200000 (irq =3D 14) is a BTUART
ttyS2 at MMIO 0x40700000 (irq =3D 13) is a STUART
Cirrus Logic CS8900A driver for Linux (V0.02)
Probing flash00 at physical address 0x00000000 (16-bit bankwidth)
 Intel/Sharp Extended Query Table at 0x0031
cfi_cmdset_0001: Erase suspend on write enabled
1 cmdlinepart partitions found on MTD device flash00
csbxxx: using command line partition definition
Creating 1 MTD partitions on "flash00":
0x001d228c-0x0058d28c : "root"
TCP established hash table entries: 2048 (order: 2, 16384 bytes)
TCP bind hash table entries: 2048 (order: 1, 8192 bytes)
cirrus_start: requesting interrupt 37
IP-Config: Unable to set interface netmask (-22).
Unable to handle kernel NULL pointer dereference at virtual address 0000000=
0
pgd =3D c0004000
[00000000] *pgd=3D00000000
Internal error: Oops: f5 [#1]
Modules linked in:
CPU: 0
PC is at __wake_up_common+0x28/0x7c
LR is at __init_begin+0x3fff8000/0x30
pc : [<c003381c>]    lr : [<00000000>]    Not tainted
sp : c0353d24  ip : c0353d50  fp : c0353d4c
r10: 00000003  r9 : 00000000  r8 : 00000000
r7 : c028e038  r6 : c1dd6ec0  r5 : c1dd6f14  r4 : 00000001
r3 : 00000000  r2 : 00000001  r1 : 00000003  r0 : c1dd6f14
Flags: nzcv  IRQs off  FIQs on  Mode SVC_32  Segment kernel
Control: 397F  Table: A0004000  DAC: 00000017
Process swapper (pid: 1, stack limit =3D 0xc0352194)
Stack: (0xc0353d24 to 0xc0354000)
3d20:          60000013 00000000 c1dd6ec0 c028e038 00000000 00000000 000000=
00
3d40: c0353d64 c0353d50 c003389c c0033800 00000000 c1dd6ec0 c0353d84 c0353d=
68
3d60: c01adbe4 c003387c c1dff5a8 c1dff5a0 00000000 c02dcb18 c0353d94 c0353d=
88
3d80: c01998a8 c01adb50 c0353db4 c0353d98 c019cf1c c0199898 c1dffde0 c028dd=
cc
3da0: 00000000 c0344c04 c0353dd0 c0353db8 c019d4ec c019ce90 c0344ba0 c038c1=
80
3dc0: c0344bac c0353df4 c0353dd4 c007c340 c019d4c0 fffffff3 c0344ba0 000000=
00
3de0: c028030c 00000000 c0353e14 c0353df8 c007c6dc c007c2bc c03352a0 c02803=
0c
3e00: fffffff4 00008000 c0353e58 c0353e18 c007ae60 c007c658 c1c6f000 c0353e=
3c
3e20: c1c6f000 c1daff80 0000000a c03352a0 c1daff80 c1c70000 c03352a0 c1c700=
00
3e40: fffffff4 c028030c 00008000 c0353e6c c0353e5c c00b7e14 c007ae44 c00b67=
60
3e60: c0353e94 c0353e70 c007b1a4 c00b7e04 ffffffff c1c70000 00000000 000080=
00
3e80: c0353ecc 00000000 c0353ebc c0353e98 c0091260 c007b150 00008000 000000=
00
3ea0: c1c6f000 00000000 c1c70000 c0353ecc c0353f34 c0353ec0 c00918f8 c00911=
e8
3ec0: c1c70000 00000000 c1c6e000 c0342554 c0335600 00000010 c005cc64 000000=
00
3ee0: 00000001 00000001 00000000 00008000 00000000 00000000 c0353f14 c0353f=
08
3f00: c0059390 00001000 c0353f34 00000000 00000000 c023e950 c1c6f000 000080=
00
3f20: 00000000 00000000 c0353f68 c0353f38 c0091d20 c00917b4 00000000 000000=
00
3f40: c1c70000 c1c6e000 c0350000 c0350000 00008000 c023e950 c02d508c c0353f=
80
3f60: c0353f6c c0008cf8 c0091c88 00000000 c0350000 c0353fc4 c0353f84 c0008d=
dc
3f80: c0008cd4 00000000 c0349cc0 01f00000 c001b614 00000000 00000000 000000=
00
3fa0: 00000000 c001b664 c001b614 00000000 00000000 00000000 c0353fe0 c0353f=
c8
3fc0: c0009134 c0008d90 00000000 c023e800 00000000 c0353ff4 c0353fe4 c00210=
b8
3fe0: c00090b4 00000000 00000000 c0353ff8 c0039460 c0021074 e3c334ff e31100=
01
Backtrace:
[<c00337f4>] (__wake_up_common+0x0/0x7c) from [<c003389c>] (__wake_up+0x2c/=
0x34)

[<c0033870>] (__wake_up+0x0/0x34) from [<c01adbe4>] (cfi_intelext_sync+0xa0=
/0xb0
)
 r4 =3D C1DD6EC0
[<c01adb44>] (cfi_intelext_sync+0x0/0xb0) from [<c01998a8>] (part_sync+0x1c=
/0x20
)
 r7 =3D C02DCB18  r6 =3D 00000000  r5 =3D C1DFF5A0  r4 =3D C1DFF5A8
[<c019988c>] (part_sync+0x0/0x20) from [<c019cf1c>] (mtdblock_release+0x98/=
0xb4)

[<c019ce84>] (mtdblock_release+0x0/0xb4) from [<c019d4ec>] (blktrans_releas=
e+0x3
8/0xd0)
 r7 =3D C0344C04  r6 =3D 00000000  r5 =3D C028DDCC  r4 =3D C1DFFDE0
[<c019d4b4>] (blktrans_release+0x0/0xd0) from [<c007c340>] (blkdev_put+0x90=
/0x1c
4)
 r6 =3D C0344BAC  r5 =3D C038C180  r4 =3D C0344BA0
[<c007c2b0>] (blkdev_put+0x0/0x1c4) from [<c007c6dc>] (open_bdev_excl+0x90/=
0x9c)

 r8 =3D 00000000  r7 =3D C028030C  r6 =3D 00000000  r5 =3D C0344BA0
 r4 =3D FFFFFFF3
[<c007c64c>] (open_bdev_excl+0x0/0x9c) from [<c007ae60>] (get_sb_bdev+0x28/=
0x17c
)
 r7 =3D 00008000  r6 =3D FFFFFFF4  r5 =3D C028030C  r4 =3D C03352A0
[<c007ae38>] (get_sb_bdev+0x0/0x17c) from [<c00b7e14>] (ext3_get_sb+0x1c/0x=
24)
 r8 =3D 00008000  r7 =3D C028030C  r6 =3D FFFFFFF4  r5 =3D C1C70000
 r4 =3D C03352A0
[<c00b7df8>] (ext3_get_sb+0x0/0x24) from [<c007b1a4>] (do_kern_mount+0x60/0=
x108)

[<c007b144>] (do_kern_mount+0x0/0x108) from [<c0091260>] (do_new_mount+0x84=
/0xb8
)
[<c00911dc>] (do_new_mount+0x0/0xb8) from [<c00918f8>] (do_mount+0x150/0x16=
c)
[<c00917a8>] (do_mount+0x0/0x16c) from [<c0091d20>] (sys_mount+0xa4/0xe8)
[<c0091c7c>] (sys_mount+0x0/0xe8) from [<c0008cf8>] (do_mount_root+0x30/0xb=
c)
 r8 =3D C02D508C  r7 =3D C023E950  r6 =3D 00008000  r5 =3D C0350000
 r4 =3D C0350000
[<c0008cc8>] (do_mount_root+0x0/0xbc) from [<c0008ddc>] (mount_block_root+0=
x58/0
x124)
 r4 =3D C0350000
[<c0008d84>] (mount_block_root+0x0/0x124) from [<c0009134>] (prepare_namesp=
ace+0
x8c/0xd0)
 r8 =3D 00000000  r7 =3D 00000000  r6 =3D 00000000  r5 =3D C001B614
 r4 =3D C001B664
[<c00090a8>] (prepare_namespace+0x0/0xd0) from [<c00210b8>] (init+0x50/0xf0=
)
 r5 =3D 00000000  r4 =3D C023E800
[<c0021068>] (init+0x0/0xf0) from [<c0039460>] (do_exit+0x0/0x360)
 r4 =3D 00000000
Code: e1a0a001 e1a04002 e1a08003 e59b9004 (e59e7000)
 <0>Kernel panic - not syncing: Attempted to kill init!
