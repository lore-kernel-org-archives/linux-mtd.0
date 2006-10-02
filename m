Received: from [69.25.50.184] (helo=ms10.mse5.exchange.ms)
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GUOue-0000mx-Hs
	for linux-mtd@lists.infradead.org; Mon, 02 Oct 2006 15:36:58 +0100
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: JFFS2 Non-Contiguous Write Oops on 2.6.18
Date: Mon, 2 Oct 2006 10:36:20 -0400
Message-ID: <B07052926BE0044380505EA78F1A449301DD4FEC@ms10.mse5.exchange.ms>
From: "Scott Shumate" <scott.shumate@ucontrol.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I have ported my platform from 2.6.15 to 2.6.18 and I am now getting a =
kernel oops in JFFS2.=A0 The JFFS2 filesystem is the root filesystem and =
was created from the latest mkfs.jffs2 from the git repository.=A0 The =
2.6.15 kernel will mount and run this filesystem flawlessly but if I =
switch to 2.6.18, it will produce this same oops every time.
=A0
Kernel: mainline 2.6.18
MTD Device: Atmel AT45DB642D (mtd_dataflash driver)
Bus: SPI (spi_at91_bitbang driver)
Platform: AT91RM9200-based
MTD Partitions:
mtd_dataflash spi0.0: AT45DB642x (8448 KBytes)
Creating 5 MTD partitions on "dataflash":
0x00000000-0x00004200 : "u-load"
0x00004200-0x00006300 : "u-boot env"
0x00006300-0x00021000 : "u-boot code"
0x00021000-0x00129000 : "kernel"
0x00129000-0x00840000 : "filesystem"

Kernel Oops:
VFS: Mounted root (jffs2 filesystem).
Freeing init memory: 88K
init started:=A0 BusyBox v1.1.0 (2006.06.30-19:08+0000) multi-call =
binary
Initializing random number generator...=20
jffs2_flash_writev(): Non-contiguous write to 0009945c
wbuf was previously 00099240-00099434
kernel BUG at fs/jffs2/wbuf.c:793!
Unable to handle kernel NULL pointer dereference at virtual address =
00000000
pgd =3D c0d68000
[00000000] *pgd=3D20d61031, *pte=3D00000000, *ppte=3D00000000
Internal error: Oops: 817 [#1]
Modules linked in:
CPU: 0
PC is at __bug+0x40/0x54
LR is at 0x1
pc : [<c0022b7c>]=A0=A0=A0 lr : [<00000001>]=A0=A0=A0 Not tainted
sp : c0d2fda0=A0 ip : 60000093=A0 fp : c0d2fdac
r10: c0d2fe40=A0 r9 : 00000000=A0 r8 : 0009945c
r7 : c039b600=A0 r6 : 000002cf=A0 r5 : 000001f4=A0 r4 : 00000000
r3 : 00000000=A0 r2 : 00000000=A0 r1 : 00001aef=A0 r0 : 00000001
Flags: nZCv=A0 IRQs on=A0 FIQs on=A0 Mode SVC_32=A0 Segment user
Control: C000717F=A0 Table: 20D68000=A0 DAC: 00000015
Process rm (pid: 719, stack limit =3D 0xc0d2e250)
Stack: (0xc0d2fda0 to 0xc0d30000)
fda0: c0d2fe00 c0d2fdb0 c00bd418 c0022b4c 00099240 00098a00 00000000 =
c039b71c
fdc0: 00000000 0009945c 00000000 00000001 c0d2fe14 c00d4494 0009945c =
00000000
fde0: c0d2fe40 00000244 0009945c 00000000 c0d2fe40 c0d2fe34 c0d2fe08 =
c00bd73c
fe00: c00bd218 0009945c 00000000 c0d2fe40 00000000 c0d2fe48 0000000c =
c0d2fe48
fe20: c039b600 c03deb80 c0d2fe7c c0d2fe38 c00b2f0c c00bd6f4 c0d2fe40 =
c0d2fe48
fe40: 0000000c c005c002 c0021985 00000244 9b732f73 c0017470 c0d32b48 =
c039b600
fe60: c0d2ff24 c0cdd24c c0d2e000 400a91fc c0d2fe98 c0d2fe80 c00b134c =
c00b2ad8
fe80: 00000001 c0d32b48 c039b600 c0d2feb4 c0d2fe9c c00b375c c00b12e8 =
c0d32b74
fea0: 00000000 c0d32b74 c0d2fec4 c0d2feb8 c00bac94 c00b36cc c0d2fed8 =
c0d2fec8
fec0: c008653c c00bac88 c0d32b74 c0d2fef0 c0d2fedc c0087594 c00864b4 =
c0d32b74
fee0: c0cf9000 c0d2ff0c c0d2fef4 c0087618 c0087500 c0d32b74 c0cf9000 =
c0d32b74
ff00: c0d2ff20 c0d2ff10 c0086770 c0087608 00000000 c0d2ff94 c0d2ff24 =
c007dcf8
ff20: c00866f4 c0394780 c0238220 62ebf992 0000000b c0cf9005 00000010 =
00000000
ff40: 00000000 c004090c c0029550 c0cf601c c02882e0 00000015 c0d2ff74 =
c0d2ff68
ff60: c0040988 c00408e0 c0d2ffac c0d2ff78 c001ed08 be8caf90 00000008 =
00000008
ff80: 0000000a c001eec4 c0d2ffa4 c0d2ff98 c007dd98 c007dc08 00000000 =
c0d2ffa8
ffa0: c001ed20 c007dd90 be8caf90 00000008 be8caf90 be8cada8 00000000 =
00008000
ffc0: be8caf90 00000008 00000008 00000003 00082e94 00000003 400a91fc =
0000c97c
ffe0: 40098464 be8cada0 0005d804 4009846c 20000010 be8caf90 00000000 =
00000000
Backtrace:
[<c0022b3c>] (__bug+0x0/0x54) from [<c00bd418>] =
(jffs2_flash_writev+0x214/0x4e0)
[<c00bd208>] (jffs2_flash_writev+0x4/0x4e0) from [<c00bd73c>] =
(jffs2_flash_write
+0x58/0x60)
[<c00bd6e4>] (jffs2_flash_write+0x0/0x60) from [<c00b2f0c>] =
(jffs2_mark_node_obs
olete+0x444/0x544)
=A0r6 =3D C03DEB80 =A0r5 =3D C039B600=A0 r4 =3D C0D2FE48
[<c00b2ac8>] (jffs2_mark_node_obsolete+0x0/0x544) from [<c00b134c>] =
(jffs2_kill_
fragtree+0x74/0xbc)
[<c00b12d8>] (jffs2_kill_fragtree+0x0/0xbc) from [<c00b375c>] =
(jffs2_do_clear_in
ode+0xa0/0x134)
=A0r6 =3D C039B600=A0 r5 =3D C0D32B48=A0 r4 =3D 00000001
[<c00b36bc>] (jffs2_do_clear_inode+0x0/0x134) from [<c00bac94>] =
(jffs2_clear_ino
de+0x1c/0x20)
=A0r6 =3D C0D32B74=A0 r5 =3D 00000000=A0 r4 =3D C0D32B74
[<c00bac78>] (jffs2_clear_inode+0x0/0x20) from [<c008653c>] =
(clear_inode+0x98/0x
cc)
[<c00864a4>] (clear_inode+0x0/0xcc) from [<c0087594>] =
(generic_delete_inode+0xa4
/0x108)
=A0r4 =3D C0D32B74
[<c00874f0>] (generic_delete_inode+0x0/0x108) from [<c0087618>] =
(generic_drop_in
ode+0x20/0x178)
=A0r5 =3D C0CF9000=A0 r4 =3D C0D32B74
[<c00875f8>] (generic_drop_inode+0x0/0x178) from [<c0086770>] =
(iput+0x8c/0xa0)
=A0r6 =3D C0D32B74=A0 r5 =3D C0CF9000=A0 r4 =3D C0D32B74
[<c00866e4>] (iput+0x0/0xa0) from [<c007dcf8>] (do_unlinkat+0x100/0x150)
=A0r4 =3D 00000000
[<c007dbf8>] (do_unlinkat+0x0/0x150) from [<c007dd98>] =
(sys_unlink+0x18/0x1c)
=A0r8 =3D C001EEC4=A0 r7 =3D 0000000A=A0 r6 =3D 00000008=A0 r5 =3D =
00000008
=A0r4 =3D BE8CAF90
[<c007dd80>] (sys_unlink+0x0/0x1c) from [<c001ed20>] =
(ret_fast_syscall+0x0/0x2c)
Code: 1b004512 e59f0014 eb004510 e3a03000 (e5833000)
=A0Segmentation fault
