Received: from houmail004.halliburton.com ([34.254.16.16]
	helo=HOUMAIL004.corp.halliburton.com)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DBN2x-00007J-Ag
	for linux-mtd@lists.infradead.org; Tue, 15 Mar 2005 20:10:04 -0500
Received: from HOUEXGR001.corp.halliburton.com
	(houexgr001.corp.halliburton.com [34.224.35.122])
	by HOUMAIL004.corp.halliburton.com (8.13.3/8.13.3) with ESMTP id
	j2G1ApK1014587
	for <linux-mtd@lists.infradead.org>; Tue, 15 Mar 2005 19:10:51 -0600
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Mar 2005 19:09:53 -0600
Message-ID: <487B538D08487B4D8FEC138A13D4F6AC509BA5@HOUEXCH077.corp.halliburton.com>
From: "Sergei Sharonov" <Sergei.Sharonov@Halliburton.com>
To: <linux-mtd@lists.infradead.org>
Subject: failed write verify causes segmentation fault
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I believe I ran into a problem that might not have shown up under normal

test conditions. I was testing NAND flash endurance at elevated=20
temperatures and after a few weeks of continuous=20
write/remount/read/verify/erase of a 10 MByte random test file=20
the nand_verify_pages() failed and caused segmentation fault.
Test setup: at91rm9200 based custom board, linux 2.6.10 patched with
mtd-snapshot-20050123, JFFS2 filesystem (non-root) on a 2 Gbit Toshiba=20
NAND chip, write verify enabled, compression disabled.=20
Seems that when (eventually) write verify failed the system could not=20
handle it graciously. Has anybody seen this before?

BTW, I cannot get my regular corporate mailing system (outlook/exchange)

to work correctly with the rules this list imposes.=20
I tried gmane this morning and the post have not showed up.=20
I am open to any suggestions on other free mailing=20
services that are known to work for this list.


Relevant startup messages:
-------------------8<-----------------
NAND device: Manufacturer ID: 0x98, Chip ID: 0xda=20
(Toshiba NAND 256MiB 3,3V 8-bit)
Scanning device for bad blocks
Creating 1 MTD partitions on "NAND 256MiB 3,3V 8-bit":
0x00000000-0x10000000 : "Storage"
mtd: Giving out device 3 to Storage
-------------------8<-----------------


Error output:
-------------------8<-----------------
Creating file </mnt/flash/flashtest_1499_932674.log>.. OK
Writing 10000000 bytes.. nand_verify_pages: Failed write verify,=20
page 0x00013dfd <5>Write of 4164 bytes at 0x09efe1bc failed. retur4
jffs2_flash_writev(): Non-contiguous write to 09eff200
Unable to handle kernel NULL pointer dereference at virtual=20
address 00000000
pgd =3D c1e00000
[00000000] *pgd=3D202a3011, *pte=3D00000000, *ppte=3D00000000
Internal error: Oops: 807 [#1]
Modules linked in:
CPU: 0
PC is at jffs2_flash_writev+0x188/0x5a0
LR is at 0x1
pc : [<c00d9dc4>]    lr : [<00000001>]    Not tainted
sp : c1271bc8  ip : 60000093  fp : c1271c40
r10: 00000000  r9 : 09ee0000  r8 : 00000000
r7 : 09eff200  r6 : c125f800  r5 : ffffffff  r4 : 00000000
r3 : 00000000  r2 : 00000000  r1 : 0a485cda  r0 : 0000003a
Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  Segment user
Control: C000717F  Table: 21E00000  DAC: 00000015
Process flashtest (pid: 1880, stack limit =3D 0xc1270190)
Stack: (0xc1271bc8 to 0xc1272000)
1bc0:                   04b6061b 0337050e 062b0676 0662060a c125f91c
09eff200
1be0: 00000000 06ca066e ffffffff 00000000 00000000 00000002 c1271c78
03e9066d
1c00: 05e10000 06da064d 05050415 05df06be 06d605ff 065f0535 09eff200
00000000
1c20: c18c34f4 c15d6d50 c125f800 c0a3be54 c18c34f4 c1271cb0 c1271c48
c00d0694
1c40: c00d9c50 09eff200 00000000 c1271c74 00001932 00000dbc c1a42000
c1271cb0
1c60: 00000002 00000000 c1dcae34 c15d6d50 00000000 00000000 c18c34f4
00000044
1c80: c1a41000 00000dbc c1271ce0 00000000 c18c34f4 c15d6d50 c125f800
00143000
1ca0: 00000000 c1271d10 c1271cb4 c00d14b0 c00d0530 00000dbc 09eff200
00000003
1cc0: 00000001 00000000 c1a41000 00000dbc 00000dbc c1a41000 00000e00
09eff200
1ce0: e1f14050 e1f14050 c18c351c c18c3518 00000000 c18c34f4 c15d6d78
c15d6d50
1d00: c024d820 c1271d60 c1271d14 c00ccae4 c00d11d8 00143000 00001000
c1271d2c
1d20: c125f800 00001000 00000000 00000000 000e3b49 000e3b49 00001000
00000000
1d40: c020b644 c024d820 00143000 00000000 00000000 c1271e00 c1271d64
c004ad34
1d60: c00cc94c 00001000 00153f24 00001000 c15d6d78 c01cf8dc c15d6e10
c19411e0
1d80: 00000001 c1271e6c 00000000 c1271f10 00000000 7b271da0 00000002
00000000
1da0: c024d800 c024d820 c0249720 c02430e0 c023dec0 c023dee0 c024d580
c024d5a0
1dc0: c024d5c0 c024d5e0 c024ce80 c024cea0 c024cec0 c024cee0 00000000
00000000
1de0: 00000000 c1271e34 c19411e0 00000000 00000000 c1271e68 c1271e08
c004b3c8
1e00: c004a9e4 00000000 00000000 c1271f74 00846680 00143000 00000000
c15d6d78
1e20: 00989680 c1271f74 c1271f10 c1271e6c 00000001 00989680 00000000
00000000
1e40: 00000000 c126fd40 c1271ecc c1271e6c 00000000 00000000 c1271f74
c1271f08
1e60: c1271e6c c004b4f4 c004af88 c1271e78 c010ac54 00000000 00000001
ffffffff
1e80: c19411e0 c1295804 00000000 c1271ef0 00000000 c00fcb6c 60000093
c126fd40
1ea0: 00000000 00000000 4005a361 c1270000 c1149be4 c1271ed8 c1271ec4
c002c1cc
1ec0: c002c134 c126fd40 c00432b8 c1271ecc c1271ecc c00f6968 c002c1b0
00000019
1ee0: 00000019 c15d6de0 c15d6e10 00000000 c15d6d78 c19411e0 00010f24
c1271f3c
1f00: c1271f0c c004b730 c004b480 000e3b44 00010f24 00989680 00000000
c19411e0
1f20: 00000000 00000000 00989680 c1271f74 c1271f70 c1271f40 c00636b0
c004b6e4
1f40: 00000001 c1271fb0 c1941204 fffffff7 c19411e0 c1271f74 00000000
00000000
1f60: 40058178 c1271fa4 c1271f74 c00637ac c00635dc 00000000 00000000
00000000
1f80: 002625a0 0026259f 00010f24 00000004 c001b924 c1270000 00000000
c1271fa8
1fa0: c001b7a0 c006376c 002625a0 c0033964 00000003 00010f24 00989680
4005a348
1fc0: 002625a0 0026259f 00010f24 00000003 000e3b42 befffd24 40058178
000005db
1fe0: 00010eec befffc1c 00008828 40046ce0 60000010 00000003 e1a05000
e1a0c001
Backtrace:
[<c00d9c40>] (jffs2_flash_writev+0x4/0x5a0) from [<c00d0694>]
(jffs2_write_dnode+0x174/0x684)
[<c00d0520>] (jffs2_write_dnode+0x0/0x684) from [<c00d14b0>]
(jffs2_write_inode_range+0x2e8/0x46c)
[<c00d11c8>] (jffs2_write_inode_range+0x0/0x46c) from [<c00ccae4>]
(jffs2_commit_write+0x1a8/0x304)
[<c00cc93c>] (jffs2_commit_write+0x0/0x304) from [<c004ad34>]
(generic_file_buffered_write+0x364/0x5a8)
[<c004a9d4>] (generic_file_buffered_write+0x4/0x5a8) from [<c004b3c8>]
(__generic_file_aio_write_nolock+0x450/0x478)
[<c004af78>] (__generic_file_aio_write_nolock+0x0/0x478) from
[<c004b4f4>]
(__generic_file_write_nolock+0x84/0xac)
[<c004b470>] (__generic_file_write_nolock+0x0/0xac) from [<c004b730>]
(generic_file_write+0x5c/0xe8)
 r9 =3D 00010F24  r8 =3D C19411E0  r7 =3D C15D6D78  r6 =3D 00000000
 r5 =3D C15D6E10  r4 =3D C15D6DE0
[<c004b6d4>] (generic_file_write+0x0/0xe8) from [<c00636b0>]=20
(vfs_write+0xe4/0x11c)
[<c00635cc>] (vfs_write+0x0/0x11c) from [<c00637ac>]=20
(sys_write+0x50/0x74)
[<c006375c>] (sys_write+0x0/0x74) from [<c001b7a0>]=20
ret_fast_syscall+0x0/0x2c)
 r9 =3D C1270000  r8 =3D C001B924  r7 =3D 00000004  r6 =3D 00010F24
 r5 =3D 0026259F  r4 =3D 002625A0
Code: 159f035c 10812003 1bfd5662 e3a03000 (e5833000)
 Segmentation fault
#
-------------------8<-----------------

After rebooting the file system appears to be intact except that the=20
last file was partially written (1323008 bytes instead of 10000000)=20
and CRC error:

# mount /mnt/flash/
# jffs2_get_inode_nodes(): Data CRC failed on node at 0x09efe1bc:=20
Read 0x440f7cb2, calculated 0x1db0b909

Will take any help/advice offered ;-)
Thanks,

Sergei Sharonov
