Received: from mail2.lawo.de ([80.149.95.33] helo=ExchangeEdge1.lawo.de)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WFg0H-0001lO-PN
 for linux-mtd@lists.infradead.org; Tue, 18 Feb 2014 08:26:11 +0000
From: "Ziegler, Emanuel (Lawo AG)" <Emanuel.Ziegler@lawo.com>
To: Richard Weinberger <richard@nod.at>, Bill Pringlemeir
 <bpringlemeir@nbsps.com>, "Wiedemer, Thorsten (Lawo AG)"
 <Thorsten.Wiedemer@lawo.com>
Date: Tue, 18 Feb 2014 09:25:40 +0100
Subject: RE: UBI leb_write_unlock NULL pointer Oops (continuation)
Message-ID: <D7B1B5F4F3F27A4CB073BF422331203F2A1EDFA41B@Exchange1.lawo.de>
References: <D7B1B5F4F3F27A4CB073BF422331203F2A18997F1F@Exchange1.lawo.de>
 <CAFLxGvya5WXoKcYmOgeM_SmVVEht1jEzeLG9vHhwFudFU+Ny8A@mail.gmail.com>
 <D7B1B5F4F3F27A4CB073BF422331203F2A18997F8B@Exchange1.lawo.de>
 <52EF772D.8080207@nod.at>
 <D7B1B5F4F3F27A4CB073BF422331203F2A18DD7989@Exchange1.lawo.de>
 <52EF9FFE.4020405@nod.at>
 <D7B1B5F4F3F27A4CB073BF422331203F2A18A7474A@Exchange1.lawo.de>
 <52F1F658.9080701@nod.at>
 <D7B1B5F4F3F27A4CB073BF422331203F2A1ECCF6AE@Exchange1.lawo.de>
 <87zjlxy8lj.fsf@nbsps.com>
 <D7B1B5F4F3F27A4CB073BF422331203F2A1ECCFB51@Exchange1.lawo.de>
 <87txc4w698.fsf@nbsps.com>
 <87ppmsw5sw.fsf@nbsps.com>,<52FBDE01.9030207@nod.at>
In-Reply-To: <52FBDE01.9030207@nod.at>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello

I am a colleague of Thorsten. We tried to activate the CONFIG_PREEMPT_NONE =
and the error occured again.

Unable to handle kernel NULL pointer dereference at virtual address 0000000=
c
pgd =3D c7370000
[0000000c] *pgd=3D8717e831, *pte=3D00000000, *ppte=3D00000000
Internal error: Oops: 17 [#1] ARM
Modules linked in: ravenna_portctrl(O) ravenna_sync(O) ravenna_core(O) dall=
is_metering(O) dallis_audiorouter(O) dallis_multidrop(O) dallis_gpio(O) rav=
enna_fpga_core(O) marvell_lawo(O) i2c_imx fec fec_imx25_init [last unloaded=
: ravenna_fpga_loader]
CPU: 0    Tainted: G           O  (3.6.11 #1)
PC is at __up_write+0x34/0x16c
LR is at leb_write_unlock+0x30/0xb8
pc : [<c0205a3c>]    lr : [<c02a6bf8>]    psr: a0000093
sp : c72ffe28  ip : c79b03bc  fp : c79b9800
r10: c72fff9c  r9 : 00000499  r8 : c720cc7c
r7 : c720cc78  r6 : 00000499  r5 : c79b9800  r4 : c720cc60
r3 : 00000000  r2 : 60000013  r1 : 00000000  r0 : c720cc78
Flags: NzCv  IRQs off  FIQs on  Mode SVC_32  ISA ARM  Segment user
Control: 0005317f  Table: 87370000  DAC: 00000015
Process sync (pid: 7976, stack limit =3D 0xc72fe270)
Stack: (0xc72ffe28 to 0xc7300000)
fe20:                   c7b2e000 60000013 00000800 c720cc60 c79b9800 000004=
99
fe40: c7b2e000 00000800 00000499 c72fff9c c79b9800 c02a6bf8 00014800 000007=
c8
fe60: 0000a800 c02a7268 00000800 c0044aa0 00000000 00000000 c72fe000 600000=
93
fe80: 00000031 00000020 000c54e7 00000001 00000000 00000000 c79faa00 000004=
99
fea0: c7b2e000 00000031 00000001 c00dc620 00000000 00000031 00000031 c00661=
2c
fec0: c72fe000 00000000 c04f4c68 00000800 0000a800 00000499 c7b2e000 000008=
00
fee0: c72fe000 c72fff9c 00000000 c02a61e0 0000a800 00000800 c7b28000 c7b280=
00
ff00: c7b2e000 0000a800 00000499 c01b96e0 00000800 00000540 c7b28000 c72fe0=
00
ff20: c7ab7490 c7b28000 00000800 00000540 c7b28000 c01ba2ac 00000800 c74026=
68
ff40: c781d000 00000090 00000002 c7ab74b4 c7ab7490 c01b4be8 c7abf000 c7abf0=
40
ff60: c7abf400 c04f9710 c00dc620 c00dc648 60008400 c00b8fd4 00000001 000000=
00
ff80: 00000001 be870e24 00000024 c0012b88 00000000 c00dc6f4 00000000 000000=
01
ffa0: 000d632c c0012a00 000d632c 00000001 00000000 be870e24 000ce4f4 000a1a=
38
ffc0: 000d632c 00000001 be870e24 00000024 000007c6 00000000 b6f64000 000000=
00
ffe0: b6ece0e0 be870c7c 000a1a48 b6ece0ec 60000010 00000000 00000000 000000=
00
[<c0205a3c>] (__up_write+0x34/0x16c) from [<c02a6bf8>] (leb_write_unlock+0x=
30/0xb8)
[<c02a6bf8>] (leb_write_unlock+0x30/0xb8) from [<c02a7268>] (ubi_eba_write_=
leb+0xac/0x660)
[<c02a7268>] (ubi_eba_write_leb+0xac/0x660) from [<c02a61e0>] (ubi_leb_writ=
e+0xdc/0xf0)
[<c02a61e0>] (ubi_leb_write+0xdc/0xf0) from [<c01b96e0>] (ubifs_leb_write+0=
x6c/0x128)
[<c01b96e0>] (ubifs_leb_write+0x6c/0x128) from [<c01ba2ac>] (ubifs_wbuf_syn=
c_nolock+0xf8/0x324)
[<c01ba2ac>] (ubifs_wbuf_sync_nolock+0xf8/0x324) from [<c01b4be8>] (ubifs_s=
ync_fs+0x58/0x90)
[<c01b4be8>] (ubifs_sync_fs+0x58/0x90) from [<c00dc648>] (sync_fs_one_sb+0x=
28/0x2c)
[<c00dc648>] (sync_fs_one_sb+0x28/0x2c) from [<c00b8fd4>] (iterate_supers+0=
x98/0xb4)
[<c00b8fd4>] (iterate_supers+0x98/0xb4) from [<c00dc6f4>] (sys_sync+0x48/0x=
98)
[<c00dc6f4>] (sys_sync+0x48/0x98) from [<c0012a00>] (ret_fast_syscall+0x0/0=
x2c)
Code: e5903004 e58d2004 e1580003 0a00002a (e593200c)=20
---[ end trace 9e9e220ab164ad69 ]---


We also were able to reproduce the error with the activated DEBUG_LOCK_ALLO=
C flag, with the following results.

UBIFS error (pid 7625): ubifs_readdir: cannot find next direntry, error -22
UBIFS assert failed in ubifs_tnc_next_ent at 2776 (pid 7625)
[<c001795c>] (unwind_backtrace+0x0/0xf0) from [<c01e0318>] (ubifs_tnc_next_=
ent+0x18c/0x19c)
[<c01e0318>] (ubifs_tnc_next_ent+0x18c/0x19c) from [<c01d22d4>] (ubifs_read=
dir+0x308/0x508)
[<c01d22d4>] (ubifs_readdir+0x308/0x508) from [<c00d5914>] (vfs_readdir+0x8=
0/0xa4)
[<c00d5914>] (vfs_readdir+0x80/0xa4) from [<c00d5ad0>] (sys_getdents64+0x64=
/0xc8)
[<c00d5ad0>] (sys_getdents64+0x64/0xc8) from [<c0012a20>] (ret_fast_syscall=
+0x0/0x2c)
UBIFS error (pid 7625): ubifs_validate_entry: bad extended attribute entry =
node
[<c001795c>] (unwind_backtrace+0x0/0xf0) from [<c01dce80>] (lnc_add_directl=
y+0x78/0xc4)
[<c01dce80>] (lnc_add_directly+0x78/0xc4) from [<c01dcf80>] (matches_name+0=
xb4/0xcc)
[<c01dcf80>] (matches_name+0xb4/0xcc) from [<c01dcfd4>] (resolve_collision+=
0x3c/0x2ec)
[<c01dcfd4>] (resolve_collision+0x3c/0x2ec) from [<c01e02cc>] (ubifs_tnc_ne=
xt_ent+0x140/0x19c)
[<c01e02cc>] (ubifs_tnc_next_ent+0x140/0x19c) from [<c01d22d4>] (ubifs_read=
dir+0x308/0x508)
[<c01d22d4>] (ubifs_readdir+0x308/0x508) from [<c00d5914>] (vfs_readdir+0x8=
0/0xa4)
[<c00d5914>] (vfs_readdir+0x80/0xa4) from [<c00d5ad0>] (sys_getdents64+0x64=
/0xc8)
[<c00d5ad0>] (sys_getdents64+0x64/0xc8) from [<c0012a20>] (ret_fast_syscall=
+0x0/0x2c)
        magic          0x6101831
        crc            0x8ae44db2
        node_type      0 (inode node)
        group_type     0 (no node group)
        sqnum          20716
        len            160
        key            (954, inode)
        creat_sqnum    20501
        size           288
        nlink          4
        atime          1392296839.0
        mtime          1392296832.0
        ctime          1392296839.0
        uid            0
        gid            0
        mode           16893
        flags          0x1
        xattr_cnt      0
        xattr_size     0
        xattr_names    0
        compr_type     0x1
        data len       0
UBIFS error (pid 7625): ubifs_readdir: cannot find next direntry, error -22
UBIFS assert failed in ubifs_tnc_next_ent at 2776 (pid 7625)
[<c001795c>] (unwind_backtrace+0x0/0xf0) from [<c01e0318>] (ubifs_tnc_next_=
ent+0x18c/0x19c)
[<c01e0318>] (ubifs_tnc_next_ent+0x18c/0x19c) from [<c01d22d4>] (ubifs_read=
dir+0x308/0x508)
[<c01d22d4>] (ubifs_readdir+0x308/0x508) from [<c00d5914>] (vfs_readdir+0x8=
0/0xa4)
[<c00d5914>] (vfs_readdir+0x80/0xa4) from [<c00d5ad0>] (sys_getdents64+0x64=
/0xc8)
[<c00d5ad0>] (sys_getdents64+0x64/0xc8) from [<c0012a20>] (ret_fast_syscall=
+0x0/0x2c)
UBIFS error (pid 7625): ubifs_validate_entry: bad extended attribute entry =
node
[<c001795c>] (unwind_backtrace+0x0/0xf0) from [<c01dce80>] (lnc_add_directl=
y+0x78/0xc4)
[<c01dce80>] (lnc_add_directly+0x78/0xc4) from [<c01dcf80>] (matches_name+0=
xb4/0xcc)
[<c01dcf80>] (matches_name+0xb4/0xcc) from [<c01dcfd4>] (resolve_collision+=
0x3c/0x2ec)
[<c01dcfd4>] (resolve_collision+0x3c/0x2ec) from [<c01e02cc>] (ubifs_tnc_ne=
xt_ent+0x140/0x19c)
[<c01e02cc>] (ubifs_tnc_next_ent+0x140/0x19c) from [<c01d22d4>] (ubifs_read=
dir+0x308/0x508)
[<c01d22d4>] (ubifs_readdir+0x308/0x508) from [<c00d5914>] (vfs_readdir+0x8=
0/0xa4)
[<c00d5914>] (vfs_readdir+0x80/0xa4) from [<c00d5ad0>] (sys_getdents64+0x64=
/0xc8)
[<c00d5ad0>] (sys_getdents64+0x64/0xc8) from [<c0012a20>] (ret_fast_syscall=
+0x0/0x2c)
        magic          0x6101831
        crc            0x8ae44db2
        node_type      0 (inode node)
        group_type     0 (no node group)
        sqnum          20716
        len            160
        key            (954, inode)
        creat_sqnum    20501
        size           288
        nlink          4
        atime          1392296839.0
        mtime          1392296832.0
        ctime          1392296839.0
        uid            0
        gid            0
        mode           16893
        flags          0x1
        xattr_cnt      0
        xattr_size     0
        xattr_names    0
        compr_type     0x1
        data len       0

After the error occured the first time it seems that every ubi file access =
triggers the error message.

Best Regards=20
Emanuel=
