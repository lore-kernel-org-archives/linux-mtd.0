Received: from mail7-213.sinamail.sina.com.cn ([202.108.7.213])
 by bombadil.infradead.org with smtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dT4wD-0004UJ-Oc
 for linux-mtd@lists.infradead.org; Thu, 06 Jul 2017 11:27:17 +0000
From: "Zhou" <zhouwarcraft@sina.com>
To: <dedekind1@gmail.com>,
	"'Richard Weinberger'" <richard@nod.at>
Cc: "'linux-mtd'" <linux-mtd@lists.infradead.org>
References: <20170704061551.B6D4481000E5@webmail.sinamail.sina.com.cn>	
 <febf67f4-7e1d-3aa8-5003-0b4283a8cb4a@nod.at>
 <1499323662.18035.45.camel@gmail.com>
In-Reply-To: <1499323662.18035.45.camel@gmail.com>
Subject: RE: ubifs error after power-cut
Date: Thu, 6 Jul 2017 19:26:39 +0800
Message-ID: <000601d2f64a$bce7b400$36b71c00$@com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Language: zh-cn
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi Artem=20

I do the MTD tests

My flash chip is Nor-flash,i just do speed and stress stress

#
#
#
# insmod mtd_stresstest.ko dev=3D4
[  148.944257]
[  148.945834] =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[  148.951594] mtd_stresstest: MTD device: 4
[  148.956693] mtd_stresstest: not NAND flash, assume page size is 512 =
bytes.
[  148.963606] mtd_stresstest: MTD device size 10485760, eraseblock size =
65536, page size 512, count of eraseblocks 160, pages per eraseblock =
128, OOB size 0
[  148.982190] mtd_stresstest: doing operations
[  148.986511] mtd_stresstest: 0 operations done
[  267.492503] mtd_stresstest: 1024 operations done
[  380.597048] mtd_stresstest: 2048 operations done
[  498.965403] mtd_stresstest: 3072 operations done
[  613.959071] mtd_stresstest: 4096 operations done
[  727.582584] mtd_stresstest: 5120 operations done
[  843.713623] mtd_stresstest: 6144 operations done
[  965.796715] mtd_stresstest: 7168 operations done
[ 1083.998768] mtd_stresstest: 8192 operations done
[ 1197.049802] mtd_stresstest: 9216 operations done
[ 1278.214729] mtd_stresstest: finished, 10000 operations done
[ 1278.220812] =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
#

# insmod mtd_speedtest.ko dev=3D4
[ 1360.104141]
[ 1360.105671] =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[ 1360.111465] mtd_speedtest: MTD device: 4
[ 1360.116184] mtd_speedtest: not NAND flash, assume page size is 512 =
bytes.
[ 1360.123027] mtd_speedtest: MTD device size 10485760, eraseblock size =
65536, page size 512, count of eraseblocks 160, pages per eraseblock =
128, OOB size 0
[ 1384.841783] mtd_speedtest: testing eraseblock write speed
[ 1396.455062] mtd_speedtest: eraseblock write speed is 882 KiB/s
[ 1396.460934] mtd_speedtest: testing eraseblock read speed
[ 1396.893461] mtd_speedtest: eraseblock read speed is 23981 KiB/s
[ 1421.649779] mtd_speedtest: testing page write speed
[ 1434.075620] mtd_speedtest: page write speed is 824 KiB/s
[ 1434.080961] mtd_speedtest: testing page read speed
[ 1434.602291] mtd_speedtest: page read speed is 19844 KiB/s
[ 1459.405787] mtd_speedtest: testing 2 page write speed
[ 1471.246926] mtd_speedtest: 2 page write speed is 865 KiB/s
[ 1471.252434] mtd_speedtest: testing 2 page read speed
[ 1471.725673] mtd_speedtest: 2 page read speed is 21880 KiB/s
[ 1471.731294] mtd_speedtest: Testing erase speed
[ 1496.521813] mtd_speedtest: erase speed is 413 KiB/s
[ 1496.526725] mtd_speedtest: Testing 2x multi-block erase speed
[ 1521.129789] mtd_speedtest: 2x multi-block erase speed is 416 KiB/s
[ 1521.136005] mtd_speedtest: Testing 4x multi-block erase speed
[ 1545.757781] mtd_speedtest: 4x multi-block erase speed is 415 KiB/s
[ 1545.763983] mtd_speedtest: Testing 8x multi-block erase speed
[ 1570.389788] mtd_speedtest: 8x multi-block erase speed is 415 KiB/s
[ 1570.395995] mtd_speedtest: Testing 16x multi-block erase speed
[ 1594.994377] mtd_speedtest: 16x multi-block erase speed is 416 KiB/s
[ 1595.000670] mtd_speedtest: Testing 32x multi-block erase speed
[ 1619.621789] mtd_speedtest: 32x multi-block erase speed is 416 KiB/s
[ 1619.628082] mtd_speedtest: Testing 64x multi-block erase speed
[ 1644.221800] mtd_speedtest: 64x multi-block erase speed is 416 KiB/s
[ 1644.228087] mtd_speedtest: finished
[ 1644.232147] =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

I think the test's result is fine,maybe not hardware issue or mtd issue.

And I found something strange.

First error:I send you before,it caused by mount,indexing node is =
corrupted

[    2.580988] UBIFS: background thread "ubifs_bgt2_0" started, PID 76
[    2.587396] UBIFS error (pid 75): ubifs_check_node: bad CRC: =
calculated 0x4463c479, read 0xccafc492
[    2.596418] UBIFS error (pid 75): ubifs_check_node: bad node at LEB =
23:22600
[    2.603445]  magic          0x6101831
[    2.607097]  crc            0xccafc492
[    2.610838]  node_type      9 (indexing node)
[    2.615184]  group_type     0 (no node group)
[    2.619528]  sqnum          6557
[    2.622751]  len            48
[    2.625803]  child_cnt      1
[    2.628747]  level          0
[    2.631710]  Branches:
[    2.634076]  0: LEB 11:27936 len 160 key (bad key type: 0xffffffff, =
0xffffffff)
[    2.641370] CPU: 0 PID: 75 Comm: mount Not tainted 3.14.19 #1
[    2.647137] [<c0015910>] (unwind_backtrace) from [<c0011ff8>] =
(show_stack+0x10/0x14)
[    2.654868] [<c0011ff8>] (show_stack) from [<c0475264>] =
(dump_stack+0x80/0x90)
[    2.662080] [<c0475264>] (dump_stack) from [<c01a5c00>] =
(ubifs_check_node+0x180/0x298)
[    2.669983] [<c01a5c00>] (ubifs_check_node) from [<c01a7448>] =
(ubifs_read_node+0xe4/0x2e4)
[    2.678240] [<c01a7448>] (ubifs_read_node) from [<c01b17b0>] =
(dbg_old_index_check_init+0x64/0xa4)
[    2.687090] [<c01b17b0>] (dbg_old_index_check_init) from [<c01a2a18>] =
(ubifs_mount+0xe0c/0x1f10)
[    2.695859] [<c01a2a18>] (ubifs_mount) from [<c00a8428>] =
(mount_fs+0x14/0xcc)
[    2.702991] [<c00a8428>] (mount_fs) from [<c00c04b0>] =
(vfs_kern_mount+0x48/0x108)
[    2.710463] [<c00c04b0>] (vfs_kern_mount) from [<c00c2dd4>] =
(do_mount+0x1b8/0xa54)
[    2.718021] [<c00c2dd4>] (do_mount) from [<c00c39d4>] =
(SyS_mount+0x84/0xb8)
[    2.724978] [<c00c39d4>] (SyS_mount) from [<c000ebe0>] =
(ret_fast_syscall+0x0/0x30)
[    2.732527] UBIFS error (pid 75): ubifs_read_node: expected node type =
9
[    2.739139] UBIFS: background thread "ubifs_bgt2_0" stops
mount: mounting ubi2:sflashfs2 on /data2 failed: Structure needs =
cleaning

Second error:the NEW one ,it caused by ls,In my mount script,after =
mounting,i use ls to check my partition.
This time is inode node.

[    1.925846] UBIFS: recovery completed
[    1.929611] UBIFS: mounted UBI device 1, volume 0, name "sflashfs1"
[    1.935864] UBIFS: LEB size: 65408 bytes (63 KiB), min./max. I/O unit =
sizes: 8 bytes/256 bytes
[    1.944452] UBIFS: FS size: 9549568 bytes (9 MiB, 146 LEBs), journal =
size 523265 bytes (0 MiB, 7 LEBs)
[    1.953727] UBIFS: reserved for root: 451049 bytes (440 KiB)
[    1.959374] UBIFS: media format: w4/r0 (latest is w4/r0), UUID =
0B65F047-B1AB-416C-B509-52608BF5CD50, small LPT model
/data1:
[    2.084260] UBIFS error (pid 60): ubifs_check_node: bad CRC: =
calculated 0x2603efdc, read 0x6265efa9
[    2.093535] UBIFS error (pid 60): ubifs_check_node: bad node at LEB =
11:2200
[    2.100479]  magic          0x6101831
[    2.104139]  crc            0x6265efa9
[    2.107879]  node_type      0 (inode node)
[    2.111965]  group_type     2 (last of node group)
[    2.116742]  sqnum          861
[    2.119878]  len            160
[    2.123016]  key            (68, inode)
[    2.126842]  creat_sqnum    857
[    2.129978]  size           1152310
[    2.133443]  nlink          1
[    2.136407]  atime          33.0
[    2.139629]  mtime          33.0
[    2.142852]  ctime          33.0
[    2.146073]  uid            0
[    2.149021]  gid            0
[    2.151985]  mode           33188
[    2.155293]  flags          0x1
[    2.158429]  xattr_cnt      0
[    2.161377]  xattr_size     0
[    2.164339]  xattr_names    0
[    2.167302]  compr_type     0x1
[    2.170439]  data len       0
[    2.173395] CPU: 0 PID: 60 Comm: ls Not tainted 3.14.19 #1
[    2.178902] [<c0015910>] (unwind_backtrace) from [<c0011ff8>] =
(show_stack+0x10/0x14)
[    2.186632] [<c0011ff8>] (show_stack) from [<c0475264>] =
(dump_stack+0x80/0x90)
[    2.193844] [<c0475264>] (dump_stack) from [<c01a5c00>] =
(ubifs_check_node+0x180/0x298)
[    2.201747] [<c01a5c00>] (ubifs_check_node) from [<c01a7448>] =
(ubifs_read_node+0xe4/0x2e4)
[    2.209990] [<c01a7448>] (ubifs_read_node) from [<c01c7d14>] =
(ubifs_tnc_read_node+0x4c/0x1e8)
[    2.218491] [<c01c7d14>] (ubifs_tnc_read_node) from [<c01ab158>] =
(ubifs_tnc_locate+0x1a4/0x1ac)
[    2.227164] [<c01ab158>] (ubifs_tnc_locate) from [<c01a16ac>] =
(ubifs_iget+0x98/0x5f8)
[    2.234973] [<c01a16ac>] (ubifs_iget) from [<c019e880>] =
(ubifs_lookup+0x120/0x244)
[    2.242531] [<c019e880>] (ubifs_lookup) from [<c00ad564>] =
(lookup_real+0x20/0x4c)
[    2.250003] [<c00ad564>] (lookup_real) from [<c00adeb0>] =
(__lookup_hash+0x34/0x3c)
[    2.257563] [<c00adeb0>] (__lookup_hash) from [<c00aeab0>] =
(lookup_slow+0x38/0xa4)
[    2.265119] [<c00aeab0>] (lookup_slow) from [<c00b0638>] =
(path_lookupat+0x6d8/0x720)
[    2.272844] [<c00b0638>] (path_lookupat) from [<c00b06a0>] =
(filename_lookup.isra.54+0x20/0x60)
[    2.281431] [<c00b06a0>] (filename_lookup.isra.54) from [<c00b2f2c>] =
(user_path_at_empty+0x50/0x78)
[    2.290451] [<c00b2f2c>] (user_path_at_empty) from [<c00b2f68>] =
(user_path_at+0x14/0x1c)
[    2.298521] [<c00b2f68>] (user_path_at) from [<c00a9038>] =
(vfs_fstatat+0x44/0x98)
[    2.305986] [<c00a9038>] (vfs_fstatat) from [<c00a9748>] =
(SyS_lstat64+0x14/0x30)
[    2.313366] [<c00a9748>] (SyS_lstat64) from [<c000ebe0>] =
(ret_fast_syscall+0x0/0x30)
[    2.321083] UBIFS error (pid 60): ubifs_read_node: expected node type =
0
[    2.327676] UBIFS error (pid 60): ubifs_iget: failed to read inode =
68, error -117
[    2.335171] UBIFS error (pid 60): ubifs_lookup: dead directory entry =
'flashNo3', error -117
[    2.343522] UBIFS warning (pid 60): ubifs_ro_mode: switched to =
read-only mode, error -117
[    2.351684] CPU: 0 PID: 60 Comm: ls Not tainted 3.14.19 #1
[    2.357169] [<c0015910>] (unwind_backtrace) from [<c0011ff8>] =
(show_stack+0x10/0x14)
[    2.364898] [<c0011ff8>] (show_stack) from [<c0475264>] =
(dump_stack+0x80/0x90)
[    2.372110] [<c0475264>] (dump_stack) from [<c019e994>] =
(ubifs_lookup+0x234/0x244)
[    2.379664] [<c019e994>] (ubifs_lookup) from [<c00ad564>] =
(lookup_real+0x20/0x4c)
[    2.387137] [<c00ad564>] (lookup_real) from [<c00adeb0>] =
(__lookup_hash+0x34/0x3c)
[    2.394698] [<c00adeb0>] (__lookup_hash) from [<c00aeab0>] =
(lookup_slow+0x38/0xa4)
[    2.402256] [<c00aeab0>] (lookup_slow) from [<c00b0638>] =
(path_lookupat+0x6d8/0x720)
[    2.409979] [<c00b0638>] (path_lookupat) from [<c00b06a0>] =
(filename_lookup.isra.54+0x20/0x60)
[    2.418566] [<c00b06a0>] (filename_lookup.isra.54) from [<c00b2f2c>] =
(user_path_at_empty+0x50/0x78)
[    2.427586] [<c00b2f2c>] (user_path_at_empty) from [<c00b2f68>] =
(user_path_at+0x14/0x1c)
[    2.435655] [<c00b2f68>] (user_path_at) from [<c00a9038>] =
(vfs_fstatat+0x44/0x98)
[    2.443122] [<c00a9038>] (vfs_fstatat) from [<c00a9748>] =
(SyS_lstat64+0x14/0x30)
[    2.450501] [<c00a9748>] (SyS_lstat64) from [<c000ebe0>] =
(ret_fast_syscall+0x0/0x30)
ls: /data1/flashNo3: Structure needs cleaning

Like Richard said,maybe something wrong with Nor-flash configuration.

Do you have any suggestion,what should I check next stage.

Best Wishes
Zhou
-----Original Message-----
From: Artem Bityutskiy [mailto:dedekind1@gmail.com]=20
Sent: Thursday, July 06, 2017 2:48 PM
To: Richard Weinberger; zhouwarcraft@sina.com
Cc: linux-mtd
Subject: Re: ubifs error after power-cut


On Tue, 2017-07-04 at 08:56 +0200, Richard Weinberger wrote:
> > what  you think about this problem? Is it a hardware problem?
>=20
> It could be a hardware issues, yes. But also a misconfiguration
> of your flash chip.
> Maybe you give your flash not enough time to write data and after a
> power-cut
> already written data corrupts.

Do the MTD tests still work? Makes sense to run them.
