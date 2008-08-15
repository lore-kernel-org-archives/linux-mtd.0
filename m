Received: from mta.songnetworks.no ([62.73.241.54] helo=pebbles.fastcom.no)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KU263-00008h-Mg
	for linux-mtd@lists.infradead.org; Fri, 15 Aug 2008 16:24:17 +0000
Received: from wpr01.wprmedical.local (unknown [80.239.107.60])
	by pebbles.fastcom.no (Postfix) with ESMTP id 62A5E61AF
	for <linux-mtd@lists.infradead.org>;
	Fri, 15 Aug 2008 18:05:56 +0200 (DFT)
Content-class: urn:content-classes:message
Subject: SV: Jffs2 crach in 2.6.25.6.atmel.1
Date: Fri, 15 Aug 2008 18:10:10 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Message-ID: <6B5648EA2E2C2D42AF2FF7691522AD92417C8C@wpr01.wprmedical.local>
In-Reply-To: <1218203287.12232.165.camel@pmac.infradead.org>
References: <6B5648EA2E2C2D42AF2FF7691522AD92417C1C@wpr01.wprmedical.local>
	<20080808150524.5263de89@hskinnemo-gx745.norway.atmel.com>
	<1218203287.12232.165.camel@pmac.infradead.org>
From: "Eirik Aanonsen" <eaa@wprmedical.com>
To: "David Woodhouse" <dwmw2@infradead.org>,
	"Haavard Skinnemoen" <haavard.skinnemoen@atmel.com>
Cc: kernel@avr32linux.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi

I added the following lines in fs/jffs2/debug.c
In __jffs2_dbg_acct_sanity_check_nolock

I use a intel 8MByte NOR flash P33.

int i_dbg;

JFFS2_ERROR("c->nr_blocks =3D 0x%#08x\n", c->nr_blocks);

for (i_dbg =3D 0; i_dbg <=3D c->nr_blocks; i_dbg++)
{
	*jeb_dedgb =3D c->blocks[i_dbg];
	JFFS2_ERROR("c->blocks[%d] =3D 0x%#08x\n",i_dbg,
jeb_dedgb->offset);
}

Strange values in blocks 0 - 4. ( U-boot has reserved the first 4
sectors )
The root filsystem is located from 0x20000 to 0x640000
I added some board specific code below.

JFFS2 error: (348) __jffs2_dbg_acct_sanity_check_nolock: c->nr_blocks =
=3D
0x0x000031
JFFS2 error: (348) __jffs2_dbg_acct_sanity_check_nolock: c->blocks[0] =
=3D
0x0xffffffff
JFFS2 error: (348) __jffs2_dbg_acct_sanity_check_nolock: c->blocks[1] =
=3D
0x0xffffffff
JFFS2 error: (348) __jffs2_dbg_acct_sanity_check_nolock: c->blocks[2] =
=3D
0x0xffffffff
JFFS2 error: (348) __jffs2_dbg_acct_sanity_check_nolock: c->blocks[3] =
=3D
0x0xffffffff
JFFS2 error: (348) __jffs2_dbg_acct_sanity_check_nolock: c->blocks[4] =
=3D
0x0xffffffff
JFFS2 error: (348) __jffs2_dbg_acct_sanity_check_nolock: c->blocks[5] =
=3D
0x0x0a0000
JFFS2 error: (348) __jffs2_dbg_acct_sanity_check_nolock: c->blocks[6] =
=3D
0x0x0c0000
JFFS2 error: (348) __jffs2_dbg_acct_sanity_check_nolock: c->blocks[7] =
=3D
0x0x0e0000
JFFS2 error: (348) __jffs2_dbg_acct_sanity_check_nolock: c->blocks[8] =
=3D
0x0x100000
JFFS2 error: (348) __jffs2_dbg_acct_sanity_check_nolock: c->blocks[9] =
=3D
0x0x120000
JFFS2 error: (348) __jffs2_dbg_acct_sanity_check_nolock: c->blocks[10] =
=3D
0x0x140000
JFFS2 error: (348) __jffs2_dbg_acct_sanity_check_nolock: c->blocks[11] =
=3D
0x0x160000
JFFS2 error: (348) __jffs2_dbg_acct_sanity_check_nolock: c->blocks[12] =
=3D
0x0x180000
JFFS2 error: (348) __jffs2_dbg_acct_sanity_check_nolock: c->blocks[13] =
=3D
0x0x1a0000
JFFS2 error: (348) __jffs2_dbg_acct_sanity_check_nolock: c->blocks[14] =
=3D
0x0x1c0000
JFFS2 error: (348) __jffs2_dbg_acct_sanity_check_nolock: c->blocks[15] =
=3D
0x0x1e0000
JFFS2 error: (348) __jffs2_dbg_acct_sanity_check_nolock: c->blocks[16] =
=3D
0x0x200000
JFFS2 error: (348) __jffs2_dbg_acct_sanity_check_nolock: c->blocks[17] =
=3D
0x0x220000
JFFS2 error: (348) __jffs2_dbg_acct_sanity_check_nolock: c->blocks[18] =
=3D
0x0x240000
JFFS2 error: (348) __jffs2_dbg_acct_sanity_check_nolock: c->blocks[19] =
=3D
0x0x260000
JFFS2 error: (348) __jffs2_dbg_acct_sanity_check_nolock: c->blocks[20] =
=3D
0x0x280000
JFFS2 error: (348) __jffs2_dbg_acct_sanity_check_nolock: c->blocks[21] =
=3D
0x0x2a0000
JFFS2 error: (348) __jffs2_dbg_acct_sanity_check_nolock: c->blocks[22] =
=3D
0x0x2c0000
JFFS2 error: (348) __jffs2_dbg_acct_sanity_check_nolock: c->blocks[23] =
=3D
0x0x2e0000
JFFS2 error: (348) __jffs2_dbg_acct_sanity_check_nolock: c->blocks[24] =
=3D
0x0x300000
JFFS2 error: (348) __jffs2_dbg_acct_sanity_check_nolock: c->blocks[25] =
=3D
0x0x320000
JFFS2 error: (348) __jffs2_dbg_acct_sanity_check_nolock: c->blocks[26] =
=3D
0x0x340000
JFFS2 error: (348) __jffs2_dbg_acct_sanity_check_nolock: c->blocks[27] =
=3D
0x0x360000
JFFS2 error: (348) __jffs2_dbg_acct_sanity_check_nolock: c->blocks[28] =
=3D
0x0x380000
JFFS2 error: (348) __jffs2_dbg_acct_sanity_check_nolock: c->blocks[29] =
=3D
0x0x3a0000
JFFS2 error: (348) __jffs2_dbg_acct_sanity_check_nolock: c->blocks[30] =
=3D
0x0x3c0000
JFFS2 error: (348) __jffs2_dbg_acct_sanity_check_nolock: c->blocks[31] =
=3D
0x0x3e0000
JFFS2 error: (348) __jffs2_dbg_acct_sanity_check_nolock: c->blocks[32] =
=3D
0x0x400000
JFFS2 error: (348) __jffs2_dbg_acct_sanity_check_nolock: c->blocks[33] =
=3D
0x0x420000
JFFS2 error: (348) __jffs2_dbg_acct_sanity_check_nolock: c->blocks[34] =
=3D
0x0x440000
JFFS2 error: (348) __jffs2_dbg_acct_sanity_check_nolock: c->blocks[35] =
=3D
0x0x460000
JFFS2 error: (348) __jffs2_dbg_acct_sanity_check_nolock: c->blocks[36] =
=3D
0x0x480000
JFFS2 error: (348) __jffs2_dbg_acct_sanity_check_nolock: c->blocks[37] =
=3D
0x0x4a0000
JFFS2 error: (348) __jffs2_dbg_acct_sanity_check_nolock: c->blocks[38] =
=3D
0x0x4c0000
JFFS2 error: (348) __jffs2_dbg_acct_sanity_check_nolock: c->blocks[39] =
=3D
0x0x4e0000
JFFS2 error: (348) __jffs2_dbg_acct_sanity_check_nolock: c->blocks[40] =
=3D
0x0x500000
JFFS2 error: (348) __jffs2_dbg_acct_sanity_check_nolock: c->blocks[41] =
=3D
0x0x520000
JFFS2 error: (348) __jffs2_dbg_acct_sanity_check_nolock: c->blocks[42] =
=3D
0x0x540000
JFFS2 error: (348) __jffs2_dbg_acct_sanity_check_nolock: c->blocks[43] =
=3D
0x0x560000
JFFS2 error: (348) __jffs2_dbg_acct_sanity_check_nolock: c->blocks[44] =
=3D
0x0x580000
JFFS2 error: (348) __jffs2_dbg_acct_sanity_check_nolock: c->blocks[45] =
=3D
0x0x5a0000
JFFS2 error: (348) __jffs2_dbg_acct_sanity_check_nolock: c->blocks[46] =
=3D
0x0x5c0000
JFFS2 error: (348) __jffs2_dbg_acct_sanity_check_nolock: c->blocks[47] =
=3D
0x0x5e0000
JFFS2 error: (348) __jffs2_dbg_acct_sanity_check_nolock: c->blocks[48] =
=3D
0x0x600000
JFFS2 error: (348) __jffs2_dbg_acct_sanity_check_nolock: c->blocks[49] =
=3D
0x0x000000
JFFS2 error: (348) __jffs2_dbg_acct_sanity_check_nolock: eeep, space
accounting for block at 0xffffffff is screwed.
JFFS2 error: (348) __jffs2_dbg_acct_sanity_check_nolock: free 0x000000 +
dirty 0x0000ba + used 0xffffff43 + wasted 0x000000 + unchecked
0xffffffff !=3D total 0x020000.
------------[ cut here ]------------
kernel BUG at fs/jffs2/debug.c:49!
Oops: Kernel BUG, sig: 9 [#1]
FRAME_POINTER chip: 0x01f:0x1e82 rev 2
Modules linked in: wpr_msp430 wpr_event wpr_power wpr_gpio wpr_debug
ubifs crc16 ubi
PC is at __jffs2_dbg_acct_sanity_check_nolock+0x118/0x1ac
LR is at release_console_sem+0x14e/0x154
pc : [<9008da90>]    lr : [<9001b79a>]    Not tainted
sp : 91ce3d1c  r12: 000000a9  r11: 00006b28
r10: ffffffff  r9 : 00000000  r8 : 00400004
r7 : 91ce3d54  r6 : 91ce2000  r5 : 91c45800  r4 : 91ce3e68
r3 : 00000000  r2 : 00000000  r1 : 00000000  r0 : 00000000
Flags: qvnzc
Mode bits: hjmde....g
CPU Mode: Supervisor
Process: vi [348] (task: 91e60000 thread: 91ce2000)
Stack: (0x91ce3d1c to 0x91ce4000)
3d00:
0000015c
3d20: 9008db2c 00000000 000000ba ffffff43 00000000 ffffffff 00020000
0000015c
3d40: 9008db2c ffffffff 91c0a09c 91c45820 91c45810 9008659e 91ce3d90
91c0a09c
3d60: 91c45800 91ce3e68 000000bb 91cdd9d8 000000bc 00000040 9180dd68
00000000
3d80: 91cdc000 00597ab4 91c45800 91468df0 9008546c 91ce3db4 91e5fe58
91e5fe58
3da0: 91ce3e68 00000000 9180dd7c 91c45800 00000040 900858a0 91ce3dc8
91e5fe28
3dc0: 91e5fe58 91ce3e68 9008d0f0 91ce3e0c 00000000 91cdc000 91ce3e68
9180dd68
3de0: 9180dd94 91468df0 00000040 91ce3e68 00000008 91c45800 00000000
00000000
3e00: 00000000 0000854c 9010fa70 9008d230 91ce3e30 91837300 91ce3e68
000b6f00
3e20: 91ce3e68 9180dd94 000081fd 91837300 9005c818 91ce3e44 00008068
00000008
3e40: 000b6f00 9004e900 91ce3e9c 00008068 91837300 000b6f00 00000000
91837300
3e60: 91837300 91ce2000 00008068 9180dd94 00000000 000b6f00 00000000
00000000
3e80: 00000025 00000000 00000025 00000000 00000025 00000000 000b6f00
90054992
3ea0: 91ce3eb0 00000200 9180dd94 000b6f00 900566b4 91ce3ef8 00000000
91ce3f1c
3ec0: 000b6f00 91806a80 000001b6 91837300 91ce2000 000001b6 00008242
00000002
3ee0: 00000000 00000000 00000000 9004129e 91c78280 91837300 9004e53a
91ce3f6c
3f00: 00008241 91ce3f1c 000b6f00 91c26000 000001b6 ffffff9c 91ce2000
91c78280
3f20: 91837300 1c73e870 0000000a 91c26000 00000300 00000000 00000000
91ce3f5c
3f40: 00000003 91c7f488 000b6f00 00008241 91c7f480 91ce2000 91ce2000
9004f20e
3f60: 00008242 000001b6 9146f100 9004f21e 91ce3f80 00008241 00000003
000b6f00
3f80: 9004f25e 91ce3fa4 0009a8e0 000b6f7c 000b6f00 0000000c 7ffe5c88
80000000
3fa0: 91ce2000 90010132 00000000 0009a8e0 000b6f7c 000b6f00 00000000
00020ea2
3fc0: 0000d0e0 7ffe5bb4 000b9708 00008241 000001b6 000001b6 00000005
000b60d8
3fe0: 0009a8e0 000b6f7c 000b6f00 0000000c 7ffe5c88 000b6f00 000b9708
000b9708
Call trace:
 [<9008659e>] jffs2_mark_node_obsolete+0x12a/0x3a0
 [<9008546c>] jffs2_obsolete_node_frag+0x20/0x38
 [<900858a0>] jffs2_truncate_fragtree+0x4c/0x98
 [<9008d0f0>] jffs2_do_setattr+0x58c/0x658
 [<9008d230>] jffs2_setattr+0x18/0x1c
 [<9005c818>] notify_change+0xd8/0xfc
 [<9004e900>] do_truncate+0x54/0x64
 [<90054992>] may_open+0x10e/0x128
 [<900566b4>] open_namei+0x1f4/0x4c4
 [<9004e53a>] do_filp_open+0x1e/0x2c
 [<9004f21e>] do_sys_open+0x32/0x5c
 [<9004f25e>] sys_open+0xe/0x10
 [<90010132>] syscall_return+0x0/0x12

Killed


My mtd_partitions looks like this:
static struct mtd_partition flash_parts[] =3D {
	{/* MTD0 */
		.name           =3D "u-boot",
		.offset         =3D 0x00000000,
		.size           =3D 0x00020000,           /*  128 KiB */
		.mask_flags     =3D MTD_WRITEABLE,
	},
	{/* MTD1 */
		.name           =3D "root",
		.offset         =3D 0x00020000,=20
		.size           =3D 0x00620000,		/* 6272 KiB */
	},
	{/* MTD2 */
		.name           =3D "kernel1",
		.offset         =3D 0x00640000,
		.size           =3D 0x000E0000,		/*  896 KiB */
	},
	{/* MTD3 */
		.name           =3D "modules",
		.offset         =3D 0x00720000,
		.size           =3D 0x000C0000,		/*  768 KiB */
	},
	{/* MTD4 */
		.name           =3D "env",
		.offset         =3D 0x007E0000,
		.size           =3D 0x00020000,		/*  128 KiB */
		.mask_flags     =3D MTD_WRITEABLE,

____________________________________________________
=20
Eirik Aanonsen
SW Developer
E-mail: eaa@wprmedical.com=20
Phone: +47 90 68 11 92
Fax: +47 37 03 56 77
____________________________________________________

=20


> -----Opprinnelig melding-----
> Fra: David Woodhouse [mailto:dwmw2@infradead.org]
> Sendt: 8. august 2008 15:48
> Til: Haavard Skinnemoen
> Kopi: Eirik Aanonsen; linux-mtd@lists.infradead.org;
kernel@avr32linux.org
> Emne: Re: Jffs2 crach in 2.6.25.6.atmel.1
>=20
> On Fri, 2008-08-08 at 15:05 +0200, Haavard Skinnemoen wrote:
> > > JFFS2 error: (349) __jffs2_dbg_acct_sanity_check_nolock: eeep,
space
> > > accounting for block at 0xffffffff is screwed.
>=20
> That's very suspicious. We set jeb->offset for each eraseblock when
the
> file system is first mounted, and never change it. Either the block
> pointer is bogus, or something has scribbled on the memory.
>=20
> Can you check the eraseblock pointer? Determine whether it's within
the
> c->blocks[c->nr_blocks] array?
>=20
> --
> David Woodhouse                            Open Source Technology
Centre
> David.Woodhouse@intel.com                              Intel
Corporation
>=20
>=20
