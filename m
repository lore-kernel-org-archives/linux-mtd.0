Received: from smtp6.centerbeam.com ([64.95.134.54])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LN9ql-0003ig-4E
	for linux-mtd@lists.infradead.org; Wed, 14 Jan 2009 17:48:21 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: Unable to handle kernel NULL pointer dereference ;
	PC is at jffs2_get_inode_nodes
Date: Wed, 14 Jan 2009 09:48:11 -0800
Message-ID: <705901BA1DF18142AB3DE716DDF374F80213DB9D@CBA0E2K03.CBA0.centerbeam.com>
From: "Manu Rao" <MRao@AlienTechnology.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all:

We are noticing this problem on our embedded ARM9 device running 2.6.22
kernel(compiled with gcc 4.0.1). We have a samsung NAND device that we
store the Filesystem on ( the kernel and uboot are on a dataflash).

I am able to reproduce the problem even when I NFS boot and mount the
Filesystem. It does not happen till I mount the fs.

I notice is says the PS is in jffs2_get_inode_nodes + offset. I would be
grateful for any pointers on how to proceed.

Thanks
Manu Rao
San Jose


JFFS2 notice: (724) check_node_data: wrong data CRC in data node at
0x037f2600: read 0xb6fe9a6c, calculated 0x4bec7625.
Unable to handle kernel NULL pointer dereference at virtual address
0000001e
pgd =3D c0004000
[0000001e] *pgd=3D00000000
Internal error: Oops: 17 [#1]
Modules linked in: artc
CPU: 0    Not tainted  (2.6.22.2.alien.x650 #1)
PC is at jffs2_get_inode_nodes+0x7e4/0xd04
LR is at jffs2_get_inode_nodes+0x7e0/0xd04
pc : [<c00e88e8>]    lr : [<c00e88e4>]    psr: 60000013
sp : c3b8be04  ip : c3b8be04  fp : c3b8be58
r10: c3b26400  r9 : 00000000  r8 : c3cdc200
r7 : 0000bc00  r6 : c3de1a3c  r5 : c34f5fc0  r4 : 00000000
r3 : 00000001  r2 : c3526a60  r1 : 0000ba00  r0 : 00000000
Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  Segment user
Control: 0005317f  Table: 235c4000  DAC: 00000015
Process jffs2_gcd_mtd0 (pid: 724, stack limit =3D 0xc3b8a258)
Stack: (0xc3b8be04 to 0xc3b8c000)
be00:          c3b8be2c c3b26400 c3b8be58 c3b8be1c c3b8be68 c3c7da00
c3b8a000
be20: c3de1a30 00000044 000001b4 000001b4 c3b8be68 c3d57a70 c3c7da00
c3b8beb8
be40: c3cdc200 00000000 00000000 c3b8beb4 c3b8be5c c00e8e44 c00e8114
00000000
be60: c3b8be7c c3b8be70 c3526a60 00000000 000000e0 00000000 00000000
00000000
be80: 00000000 c3c7da00 c3cdc200 c3c7da00 c3d57a70 c3cdc200 fffffff4
c3cdc22c
bea0: 00000000 00000000 c3b8bf18 c3b8beb8 c00e9678 c00e8e18 e0021985
00000122
bec0: 877839f5 000005a0 60000013 00000001 c3cdc200 00000000 c3cdc22c
00000000
bee0: 00000000 c3b8bf08 c3b8bef4 c0034d38 c3b8bf30 c3b8bf00 c01e410c
c3d57a70
bf00: 00000001 c3cdc200 00000000 c3b8bf58 c3b8bf1c c00ed60c c00e962c
00000000
bf20: 00000000 c3b8bf48 c3b8bf48 c3b8bf38 c0042f34 00000013 c3b8a000
c3cdc200
bf40: 00000000 00000000 00000000 c3b8bff4 c3b8bf5c c00eebf8 c00ed4a0
00000001
bf60: 00000000 00000080 00000000 00000000 00000000 00000002 00000000
00000000
bf80: 555502f7 00000005 64616572 00000500 cfcfcf00 cfcfcfcf 00000000
00000000
bfa0: 00000000 c3b8bfb0 c0023e64 c0035960 00000000 c3cdc200 c00eeb08
c003acb0
bfc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000
00000000
bfe0: 00000000 00000000 00000000 c3b8bff8 c003acb0 c00eeb18 00000000
00000000
Backtrace:
[<c00e8104>] (jffs2_get_inode_nodes+0x0/0xd04) from [<c00e8e44>]
(jffs2_do_read_inode_internal+0x3c/0x814)
[<c00e8e08>] (jffs2_do_read_inode_internal+0x0/0x814) from [<c00e9678>]
(jffs2_do_crccheck_inode+0x5c/0xac)
[<c00e961c>] (jffs2_do_crccheck_inode+0x0/0xac) from [<c00ed60c>]
(jffs2_garbage_collect_pass+0x17c/0x73c)
 r7:00000000 r6:c3cdc200 r5:00000001 r4:c3d57a70
[<c00ed490>] (jffs2_garbage_collect_pass+0x0/0x73c) from [<c00eebf8>]
(jffs2_garbage_collect_thread+0xf0/0x118)
[<c00eeb08>] (jffs2_garbage_collect_thread+0x0/0x118) from [<c003acb0>]
(do_exit+0x0/0x7c4)
 r6:00000000 r5:00000000 r4:00000000
Code: ea000087 e1a00004 eb008404 e1a04000 (e1d431be)
eth0: link up, 100Mbps, full-duplex, lpa 0x45E1
Cleaning /var/run /var/lock.

Setting the System Clock using the Hardware Clock as reference...
System Clock set. Local time: Wed Jan 14 09:36:22 GMT+8 2009

Running ntpdate to synchronize clock.
Unable to handle kernel NULL pointer dereference at virtual address
00000004
pgd =3D c0004000
[00000004] *pgd=3D00000000
Internal error: Oops: 17 [#2]
Modules linked in: artc
CPU: 0    Not tainted  (2.6.22.2.alien.x650 #1)
PC is at sig_ignored+0x48/0x84
LR is at __init_begin+0x3fff8000/0x30
pc : [<c00424a8>]    lr : [<00000000>]    psr: 40000093
sp : c038fec8  ip : 00000000  fp : c038fed4
r10: 00000000  r9 : 00000000  r8 : 00000000
r7 : c0260d44  r6 : 00000001  r5 : 00000001  r4 : c0375320
r3 : 00000000  r2 : 00000014  r1 : 00000001  r0 : c0375320
Flags: nZcv  IRQs off  FIQs on  Mode SVC_32  Segment kernel
Control: 0005317f  Table: 23424000  DAC: 00000017
Process pdflush (pid: 47, stack limit =3D 0xc038e258)
Stack: (0xc038fec8 to 0xc0390000)
fec0:                   c038fef0 c038fed8 c0042960 c0042470 80000013
00000000
fee0: c038e000 c038ff04 c038fef4 c0042a20 c0042934 c3cdc200 c038ff14
c038ff08
ff00: c0042a50 c0042a08 c038ff28 c038ff18 c00eead0 c0042a40 c3cdc200
c038ff40
ff20: c038ff2c c00eeda4 c00eeaa8 c3cdc400 c3cdc43c c038ff58 c038ff44
c007cedc
ff40: c00eed88 c038ffb0 c0264360 c038ffa0 c038ff5c c0064960 c007ce78
00000000
ff60: 00000000 c038ff88 00000000 00000000 00000000 00000000 00000000
00000000
ff80: 00000025 00000000 00000000 c038ffb0 c0264360 c038ffd8 c038ffa4
c006573c
ffa0: c0064920 c03bda40 c0064910 00000000 c038ffb0 c038ffb0 ffff9804
c038e000
ffc0: 00000000 c0065628 00000000 c038fff4 c038ffdc c004be20 c0065638
00000000
ffe0: 00000000 00000000 00000000 c038fff8 c003acb0 c004bdd8 00000000
00000000
Backtrace:
[<c0042460>] (sig_ignored+0x0/0x84) from [<c0042960>]
(specific_send_sig_info+0x3c/0xd4)
[<c0042924>] (specific_send_sig_info+0x0/0xd4) from [<c0042a20>]
(send_sig_info+0x28/0x38)
 r6:c038e000 r5:00000000 r4:80000013
[<c00429f8>] (send_sig_info+0x0/0x38) from [<c0042a50>]
(send_sig+0x20/0x24)
 r4:c3cdc200
[<c0042a30>] (send_sig+0x0/0x24) from [<c00eead0>]
(jffs2_garbage_collect_trigger+0x38/0x3c)
[<c00eea98>] (jffs2_garbage_collect_trigger+0x0/0x3c) from [<c00eeda4>]
(jffs2_write_super+0x2c/0x48)
 r4:c3cdc200
[<c00eed78>] (jffs2_write_super+0x0/0x48) from [<c007cedc>]
(sync_supers+0x74/0xb4)
 r5:c3cdc43c r4:c3cdc400
[<c007ce68>] (sync_supers+0x0/0xb4) from [<c0064960>]
(wb_kupdate+0x50/0x144)
 r5:c0264360 r4:c038ffb0
[<c0064910>] (wb_kupdate+0x0/0x144) from [<c006573c>]
(pdflush+0x114/0x1dc)
 r5:c0264360 r4:c038ffb0
[<c0065628>] (pdflush+0x0/0x1dc) from [<c004be20>] (kthread+0x58/0x90)
 r7:00000000 r6:c0065628 r5:00000000 r4:c038e000
[<c004bdc8>] (kthread+0x0/0x90) from [<c003acb0>] (do_exit+0x0/0x7c4)
 r6:00000000 r5:00000000 r4:00000000
Code: 1a00000e e59031d8 e3a02014 e023329c (e5930004)
WARNING: at kernel/exit.c:869 do_exit()
[<c002793c>] (dump_stack+0x0/0x14) from [<c003acfc>]
(do_exit+0x4c/0x7c4)
[<c003acb0>] (do_exit+0x0/0x7c4) from [<c0027f84>] (die+0x1ac/0x1f8)
[<c0027dd8>] (die+0x0/0x1f8) from [<c0029594>]
(__do_kernel_fault+0x6c/0x7c)
 r7:00000017 r6:00000000 r5:c038fe80 r4:00000004
[<c0029528>] (__do_kernel_fault+0x0/0x7c) from [<c0029844>]
(do_page_fault+0x1e8/0x200)
 r7:c038fe80 r6:c03bda40 r5:c025e0c0 r4:ffffffff
[<c002965c>] (do_page_fault+0x0/0x200) from [<c0023200>]
(do_DataAbort+0x3c/0xa0)
[<c00231c4>] (do_DataAbort+0x0/0xa0) from [<c0023a20>]
(__dabt_svc+0x40/0x60)
Exception stack(0xc038fe80 to 0xc038fec8)
fe80: c0375320 00000001 00000014 00000000 c0375320 00000001 00000001
c0260d44
fea0: 00000000 00000000 00000000 c038fed4 00000000 c038fec8 00000000
c00424a8
fec0: 40000093 ffffffff
 r8:00000000 r7:c0260d44 r6:00000001 r5:c038feb4 r4:ffffffff
[<c0042460>] (sig_ignored+0x0/0x84) from [<c0042960>]
(specific_send_sig_info+0x3c/0xd4)
[<c0042924>] (specific_send_sig_info+0x0/0xd4) from [<c0042a20>]
(send_sig_info+0x28/0x38)
 r6:c038e000 r5:00000000 r4:80000013
[<c00429f8>] (send_sig_info+0x0/0x38) from [<c0042a50>]
(send_sig+0x20/0x24)
 r4:c3cdc200
[<c0042a30>] (send_sig+0x0/0x24) from [<c00eead0>]
(jffs2_garbage_collect_trigger+0x38/0x3c)
[<c00eea98>] (jffs2_garbage_collect_trigger+0x0/0x3c) from [<c00eeda4>]
(jffs2_write_super+0x2c/0x48)
 r4:c3cdc200
[<c00eed78>] (jffs2_write_super+0x0/0x48) from [<c007cedc>]
(sync_supers+0x74/0xb4)
 r5:c3cdc43c r4:c3cdc400
[<c007ce68>] (sync_supers+0x0/0xb4) from [<c0064960>]
(wb_kupdate+0x50/0x144)
 r5:c0264360 r4:c038ffb0
[<c0064910>] (wb_kupdate+0x0/0x144) from [<c006573c>]
(pdflush+0x114/0x1dc)
 r5:c0264360 r4:c038ffb0
[<c0065628>] (pdflush+0x0/0x1dc) from [<c004be20>] (kthread+0x58/0x90)
 r7:00000000 r6:c0065628 r5:00000000 r4:c038e000
[<c004bdc8>] (kthread+0x0/0x90) from [<c003acb0>] (do_exit+0x0/0x7c4)
 r6:00000000 r5:00000000 r4:00000000
