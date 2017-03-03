Received: from cnshjsmin03.alcatel-sbell.com.cn ([116.246.26.71])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cjis4-000785-BT
 for linux-mtd@lists.infradead.org; Fri, 03 Mar 2017 08:47:30 +0000
From: YUAN Linyu <Linyu.Yuan@alcatel-sbell.com.cn>
To: Adrian Hunter <adrian.hunter@intel.com>, Artem Bityutskiy
 <dedekind1@gmail.com>, Richard Weinberger <richard@nod.at>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: ubifs change to read-only
Date: Fri, 3 Mar 2017 08:46:54 +0000
Message-ID: <8729016553E3654398EA69218DA29EEF15A8569B@cnshjmbx02>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I got following two error report and ubifs on NAND flash become RO, but I c=
an't reproduce it.

Linux version is 3.12.37.

could you have a look ?=20

how it happen or if any patch can fix it ?

[1]
[68020.765091] UBIFS error (pid 27992): ubifs_read_node: bad node type (255=
 but expected 2)
[68020.773762] UBIFS error (pid 27992): ubifs_read_node: bad node at LEB 22=
02:0, LEB mapping status 1
[68020.783064] Not a node, first 24 bytes:
[68020.786727] 00000000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff=
 ff ff ff ff ff ff ff                          ........................
[68020.799788] CPU: 0 PID: 27992 Comm: unionfs Tainted: G           O 3.12.=
37-rt51 #3
[68020.807363]b0
[68020.853337] [c0000001e0803980] [c0000000002778e4] .ubifs_tnc_remove_nm+0=
xa4/0x1b0
[68020.860841] [c0000001e0803a60] [c000000000261e6c] .ubifs_jnl_update+0x2c=
c/0x760
[68020.868173] [c0000001e0803b60] [c000000000267920] .ubifs_unlink+0x1b0/0x=
350
[68020.875153] [c0000001e0803c50] [c00000000013b814] .vfs_unlink+0xf4/0x1a0
[68020.881867] [c0000001e0803ce0] [c00000000013ba8c] .do_unlinkat+0x1cc/0x2=
90
[68020.888756] [c0000001e0803e30] [c000000000000598] system_call+0x38/0xc4

[68020.895388] UBIFS warning (pid 27992): ubifs_ro_mode: switched to read-o=
nly mode, error -22
[68020.903749] CPU: 0 PID: 27992 Comm: unionfs Tainted: G           O 3.12.=
37-rt51 #3
[68020.911329] Call Trace:
[68020.913780] [c0000001e08038a0] [c00000000000932c] .show_stack+0x8c/0x1f0=
 (unreliable)
[68020.921633] [c0000001e0803970] [c0000000006a2f48] .dump_stack+0x8c/0xb8
[68020.928262] [c0000001e08039f0] [c00000000026f76c] .ubifs_ro_mode.part.6+=
0x5c/0x70
[68020.935762] [c0000001e0803a60] [c000000000261e84] .ubifs_jnl_update+0x2e=
4/0x760
[68020.943091] [c0000001e0803b60] [c000000000267920] .ubifs_unlink+0x1b0/0x=
350
[68020.950070] [c0000001e0803c50] [c00000000013b814] .vfs_unlink+0xf4/0x1a0
[68020.956784] [c0000001e0803ce0] [c00000000013ba8c] .do_unlinkat+0x1cc/0x2=
90
[68020.963672] [c0000001e0803e30] [c000000000000598] system_call+0x38/0xc4


[2]
[68410.729733] UBIFS error (pid 27992): ubifs_read_node: bad node type (255=
 but expected 2)
[68410.737840] UBIFS error (pid 27992): ubifs_read_node: bad node at LEB 22=
02:0, LEB mapping status 1
[68410.746810] Not a node, first 24 bytes:
[68410.750475] 00000000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff=
 ff ff ff ff ff ff ff                          ........................
[68410.763533] CPU: 1 PID: 27992 Comm: unionfs Tainted: G           O 3.12.=
37-rt51 #3
[68410.771111] Call Trace:
[68410.773568] [c0000001e08037b0] [c00000000000932c] .show_stack+0x8c/0x1f0=
 (unreliable)
[68410.781419] [c0000001e0803880] [c0000000006a2f48] .dump_stack+0x8c/0xb8
[68410.788052] [c0000001e0803900] [c000000000271dd4] .ubifs_read_node+0x1c4=
/0x310
[68410.795286] [c0000001e08039b0] [c0000000002968fc] .ubifs_tnc_read_node+0=
x5c/0x1b0
[68410.802781] [c0000001e0803a80] [c000000000273430] .tnc_read_node_nm+0x11=
0/0x240
[68410.810113] [c0000001e0803b10] [c0000000002781b0] .ubifs_tnc_next_ent+0x=
1b0/0x220
[68410.817613] [c0000001e0803c00] [c0000000002681ac] .ubifs_readdir+0x17c/0=
x5b0
[68410.824675] [c0000001e0803cd0] [c00000000013f43c] .iterate_dir+0xcc/0x11=
0
[68410.831475] [c0000001e0803d70] [c00000000013fb0c] .SyS_getdents64+0x8c/0=
x150
[68410.838535] [c0000001e0803e30] [c000000000000598] system_call+0x38/0xc4
[68410.845167] UBIFS error (pid 27992): ubifs_readdir: cannot find next dir=
entry, error -22

Thanks
