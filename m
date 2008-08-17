Received: from mta.songnetworks.no ([62.73.241.56] helo=mta.tdcsong.no)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KUlPB-0005Os-JL
	for linux-mtd@lists.infradead.org; Sun, 17 Aug 2008 16:47:04 +0000
Received: from wpr01.wprmedical.local (unknown [80.239.107.60])
	by mta.tdcsong.no (Postfix) with ESMTP id 46B3E400D
	for <linux-mtd@lists.infradead.org>;
	Sun, 17 Aug 2008 18:46:58 +0200 (CEST)
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Subject: SV: SV: SV: Jffs2 crach in 2.6.25.6.atmel.1
Content-Transfer-Encoding: quoted-printable
Content-class: urn:content-classes:message
Date: Sun, 17 Aug 2008 18:50:46 +0200
Message-ID: <6B5648EA2E2C2D42AF2FF7691522AD92417C8E@wpr01.wprmedical.local>
In-Reply-To: <1218979060.3184.291.camel@pmac.infradead.org>
References: <6B5648EA2E2C2D42AF2FF7691522AD92417C1C@wpr01.wprmedical.local>
	<20080808150524.5263de89@hskinnemo-gx745.norway.atmel.com>
	<1218203287.12232.165.camel@pmac.infradead.org>
	<6B5648EA2E2C2D42AF2FF7691522AD92417C8C@wpr01.wprmedical.local>
	<1218877876.3184.185.camel@pmac.infradead.org>
	<6B5648EA2E2C2D42AF2FF7691522AD92417C8D@wpr01.wprmedical.local>
	<1218979060.3184.291.camel@pmac.infradead.org>
From: "Eirik Aanonsen" <eaa@wprmedical.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org,
	Haavard Skinnemoen <haavard.skinnemoen@atmel.com>, kernel@avr32linux.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> > I'm trying to figure out where to extract the c node from in the
jffs2
> > code.
>=20
> Make a global variable. At mount time, store it in that global
variable.
>=20

After checking a little more it seems like the error only occurs when I
have the ubi module loaded.
I load the modules with modporbe ubi mtd=3D5 (mtd5 is a 2GB nand flash )

I'am starting to suspect a memory leak that could be related to the ubi.

Initially(fresh boot) the values are set correctly (printout done in
fs.c):
JFFS2 error: (1) jffs2_do_fill_super: c->nr_blocks =3D 0x0x000031
JFFS2 error: (1) jffs2_do_fill_super: c->blocks[0] =3D 0x0x000000
JFFS2 error: (1) jffs2_do_fill_super: c->blocks[1] =3D 0x0x020000
JFFS2 error: (1) jffs2_do_fill_super: c->blocks[2] =3D 0x0x040000
JFFS2 error: (1) jffs2_do_fill_super: c->blocks[3] =3D 0x0x060000
JFFS2 error: (1) jffs2_do_fill_super: c->blocks[4] =3D 0x0x080000
JFFS2 error: (1) jffs2_do_fill_super: c->blocks[5] =3D 0x0x0a0000
JFFS2 error: (1) jffs2_do_fill_super: c->blocks[6] =3D 0x0x0c0000
JFFS2 error: (1) jffs2_do_fill_super: c->blocks[7] =3D 0x0x0e0000
JFFS2 error: (1) jffs2_do_fill_super: c->blocks[8] =3D 0x0x100000
JFFS2 error: (1) jffs2_do_fill_super: c->blocks[9] =3D 0x0x120000
JFFS2 error: (1) jffs2_do_fill_super: c->blocks[10] =3D 0x0x140000
JFFS2 error: (1) jffs2_do_fill_super: c->blocks[11] =3D 0x0x160000
JFFS2 error: (1) jffs2_do_fill_super: c->blocks[12] =3D 0x0x180000
JFFS2 error: (1) jffs2_do_fill_super: c->blocks[13] =3D 0x0x1a0000
JFFS2 error: (1) jffs2_do_fill_super: c->blocks[14] =3D 0x0x1c0000
JFFS2 error: (1) jffs2_do_fill_super: c->blocks[15] =3D 0x0x1e0000
JFFS2 error: (1) jffs2_do_fill_super: c->blocks[16] =3D 0x0x200000
JFFS2 error: (1) jffs2_do_fill_super: c->blocks[17] =3D 0x0x220000
JFFS2 error: (1) jffs2_do_fill_super: c->blocks[18] =3D 0x0x240000
JFFS2 error: (1) jffs2_do_fill_super: c->blocks[19] =3D 0x0x260000
JFFS2 error: (1) jffs2_do_fill_super: c->blocks[20] =3D 0x0x280000
JFFS2 error: (1) jffs2_do_fill_super: c->blocks[21] =3D 0x0x2a0000
JFFS2 error: (1) jffs2_do_fill_super: c->blocks[22] =3D 0x0x2c0000
JFFS2 error: (1) jffs2_do_fill_super: c->blocks[23] =3D 0x0x2e0000
JFFS2 error: (1) jffs2_do_fill_super: c->blocks[24] =3D 0x0x300000
JFFS2 error: (1) jffs2_do_fill_super: c->blocks[25] =3D 0x0x320000
JFFS2 error: (1) jffs2_do_fill_super: c->blocks[26] =3D 0x0x340000
JFFS2 error: (1) jffs2_do_fill_super: c->blocks[27] =3D 0x0x360000
JFFS2 error: (1) jffs2_do_fill_super: c->blocks[28] =3D 0x0x380000
JFFS2 error: (1) jffs2_do_fill_super: c->blocks[29] =3D 0x0x3a0000
JFFS2 error: (1) jffs2_do_fill_super: c->blocks[30] =3D 0x0x3c0000
JFFS2 error: (1) jffs2_do_fill_super: c->blocks[31] =3D 0x0x3e0000
JFFS2 error: (1) jffs2_do_fill_super: c->blocks[32] =3D 0x0x400000
JFFS2 error: (1) jffs2_do_fill_super: c->blocks[33] =3D 0x0x420000
JFFS2 error: (1) jffs2_do_fill_super: c->blocks[34] =3D 0x0x440000
JFFS2 error: (1) jffs2_do_fill_super: c->blocks[35] =3D 0x0x460000
JFFS2 error: (1) jffs2_do_fill_super: c->blocks[36] =3D 0x0x480000
JFFS2 error: (1) jffs2_do_fill_super: c->blocks[37] =3D 0x0x4a0000
JFFS2 error: (1) jffs2_do_fill_super: c->blocks[38] =3D 0x0x4c0000
JFFS2 error: (1) jffs2_do_fill_super: c->blocks[39] =3D 0x0x4e0000
JFFS2 error: (1) jffs2_do_fill_super: c->blocks[40] =3D 0x0x500000
JFFS2 error: (1) jffs2_do_fill_super: c->blocks[41] =3D 0x0x520000
JFFS2 error: (1) jffs2_do_fill_super: c->blocks[42] =3D 0x0x540000
JFFS2 error: (1) jffs2_do_fill_super: c->blocks[43] =3D 0x0x560000
JFFS2 error: (1) jffs2_do_fill_super: c->blocks[44] =3D 0x0x580000
JFFS2 error: (1) jffs2_do_fill_super: c->blocks[45] =3D 0x0x5a0000
JFFS2 error: (1) jffs2_do_fill_super: c->blocks[46] =3D 0x0x5c0000
JFFS2 error: (1) jffs2_do_fill_super: c->blocks[47] =3D 0x0x5e0000
JFFS2 error: (1) jffs2_do_fill_super: c->blocks[48] =3D 0x0x600000
JFFS2 error: (1) jffs2_do_fill_super: c->blocks[49] =3D 0x0x000000

Ofter loading modules and trying to change some file information.
JFFS2 error: (389) __jffs2_dbg_acct_sanity_check_nolock: c->nr_blocks =
=3D
0x0x000031
JFFS2 error: (389) __jffs2_dbg_acct_sanity_check_nolock: c->blocks[0] =
=3D
0x0x000000
JFFS2 error: (389) __jffs2_dbg_acct_sanity_check_nolock: c->blocks[1] =
=3D
0x0x000000
JFFS2 error: (389) __jffs2_dbg_acct_sanity_check_nolock: c->blocks[2] =
=3D
0x0x000000
JFFS2 error: (389) __jffs2_dbg_acct_sanity_check_nolock: c->blocks[3] =
=3D
0x0xffffffff
JFFS2 error: (389) __jffs2_dbg_acct_sanity_check_nolock: c->blocks[4] =
=3D
0x0xffffffff
JFFS2 error: (389) __jffs2_dbg_acct_sanity_check_nolock: c->blocks[5] =
=3D
0x0x0a0000
JFFS2 error: (389) __jffs2_dbg_acct_sanity_check_nolock: c->blocks[6] =
=3D
0x0x0c0000
JFFS2 error: (389) __jffs2_dbg_acct_sanity_check_nolock: c->blocks[7] =
=3D
0x0x0e0000
... normal values ...
JFFS2 error: (389) __jffs2_dbg_acct_sanity_check_nolock: c->blocks[47] =
=3D
0x0x5e0000
JFFS2 error: (389) __jffs2_dbg_acct_sanity_check_nolock: c->blocks[48] =
=3D
0x0x600000
JFFS2 error: (389) __jffs2_dbg_acct_sanity_check_nolock: c->blocks[49] =
=3D
0x0x000000
JFFS2 error: (389) __jffs2_dbg_acct_sanity_check_nolock: eeep, space
accounting for block at 0xffffffff is screwed.
JFFS2 error: (389) __jffs2_dbg_acct_sanity_check_nolock: free 0xffffffff
+ dirty 0x00002e + used 0xffffffcf + wasted 0x000000 + unchecked
0xffffffff !=3D total 0x020000.
------------[ cut here ]------------
kernel BUG at fs/jffs2/debug.c:49!
Oops: Kernel BUG, sig: 9 [#1]
FRAME_POINTER chip: 0x01f:0x1e82 rev 2
Modules linked in: wpr_msp430 wpr_event wpr_power wpr_gpio wpr_debug
ubifs crc16 ubi
PC is at __jffs2_dbg_acct_sanity_check_nolock+0x118/0x1ac
LR is at release_console_sem+0x14e/0x154
pc : [<9008db78>]    lr : [<9001b79a>]    Not tainted
sp : 91535dbc  r12: 000000ab  r11: 00012455
r10: ffffffff  r9 : 00000000  r8 : 00400004
r7 : 91535df4  r6 : 91534000  r5 : 91c5a800  r4 : 7f936ec8
r3 : 00000000  r2 : 00000000  r1 : 00000000  r0 : 00000000
Flags: qvnzc
Mode bits: hjmde....g
CPU Mode: Supervisor
Process: mv [389] (task: 91c5b900 thread: 91534000)
Stack: (0x91535dbc to 0x91536000)
5da0:
00000185
5dc0: 9008dc14 ffffffff 0000002e ffffffcf 00000000 ffffffff 00020000
00000185
5de0: 9008dc14 ffffffff 91c0a0d0 91c5a820 91c5a810 900865fa 91535e30
91c0a0d0
5e00: 91c5a800 7f936ec8 0000002f 91ce5c3c 00000030 918264dc 90089876
91535e58
5e20: 9167f240 00000000 7f936ec8 00000000 90089586 91535e5c 91ce02a0
00000000
5e40: 7f936ec8 00000000 91807d68 00000006 918264dc 91c5a800 9662e05e
90084ac6
5e60: 91535e90 00000008 00000000 7f936ec8 91807d94 91807d94 91826480
00000061
5e80: 00000061 91865300 91c5a800 00000000 90054806 91535eb4 91865300
00000000
5ea0: 7f936ec8 00000000 91807d94 91826480 91807d94 90055d04 91535f80
00000000
5ec0: 91865300 7f936ec8 91826480 91806a80 91806a80 91c27000 91c26000
00000000
5ee0: 91c78180 91806a80 105f6d63 00000008 91c27000 00000010 00000000
00000000
5f00: 91433000 0000d648 00000000 00000000 00000000 00000000 0000000c
0000d000
5f20: 90051908 91535f44 7f936c28 91535f58 91c78180 91806a80 9662e05e
00000006
5f40: 91c26000 00000010 00000000 00000000 91535f58 7f936ec8 00005401
00000034
5f60: 91433000 90029934 91535f78 916f4000 91535fb8 00000000 90015c30
91535f94
5f80: 90055d62 91535fa4 0009a8e0 00000000 7f936ec8 7f936ec4 00000000
80000000
5fa0: 91534000 90010132 00000000 0009a8e0 00000000 7f936ec8 00000001
0000d24e
5fc0: 00057648 7f936cb0 7f936f7b 7f936f82 0000d648 7f936d24 00000026
7f936f82
5fe0: 0009a8e0 00000000 7f936ec8 7f936ec4 00000000 7f936f82 00000000
7f936f7b
Call trace:
 [<900865fa>] jffs2_mark_node_obsolete+0x12a/0x3a0
 [<90089586>] jffs2_do_unlink+0xa2/0x164
 [<90084ac6>] jffs2_rename+0x158/0x22e
 [<90054806>] vfs_rename+0x142/0x17c
 [<90055d04>] sys_renameat+0x118/0x168
 [<90055d62>] sys_rename+0xe/0x10
 [<90010132>] syscall_return+0x0/0x12

Killed

____________________________________________________
=20
Eirik Aanonsen
SW Developer
E-mail: eaa@wprmedical.com=20
Phone: +47 90 68 11 92
Fax: +47 37 03 56 77
____________________________________________________
