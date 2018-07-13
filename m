Received: from mail.lassacher.co.at ([176.9.228.176] helo=lassacher.co.at)
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fdvst-0007cE-R9
 for linux-mtd@lists.infradead.org; Fri, 13 Jul 2018 11:05:23 +0000
Received: from localhost (localhost [127.0.0.1])
 by lassacher.co.at (Postfix) with ESMTP id CB1138C2B79
 for <linux-mtd@lists.infradead.org>; Fri, 13 Jul 2018 13:04:54 +0200 (CEST)
Received: from lassacher.co.at ([127.0.0.1])
 by localhost (webmail1.server.lassacher.co.at [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id 0uAhd751VD9X for <linux-mtd@lists.infradead.org>;
 Fri, 13 Jul 2018 13:04:52 +0200 (CEST)
Received: from [IPv6:2a02:758:738:1002:e09c:6922:25aa:325a] (unknown
 [IPv6:2a02:758:738:1002:e09c:6922:25aa:325a])
 (Authenticated sender: sebastian@lassacher.co.at)
 by lassacher.co.at (Postfix) with ESMTPSA id EE1A98C2390
 for <linux-mtd@lists.infradead.org>; Fri, 13 Jul 2018 13:04:51 +0200 (CEST)
From: Sebastian Lassacher <sebastian@lassacher.co.at>
Subject: Writing to UBIFS leads to all threads accessing files are stuck in
 nand_get_device
To: linux-mtd@lists.infradead.org
Message-ID: <b90d2024-6b20-7b94-65f8-d5e1547ab001@lassacher.co.at>
Date: Fri, 13 Jul 2018 13:04:51 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi there,

I ran into troubles when writing files on an UBIFS volume.
This happens on three different systems with similar conditions.
Since they where installed on customer sides I'm not sure what caused
the problems in the first place.
My theory is that all three suffered from a power cut.

As reported by the command df there should be enough space:
Filesystem=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 Size=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Used Avail=
able Use% Mounted on
none=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 26.5M=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0 26.5M=C2=A0=C2=A0=
 0% /dev
ubi0:root=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 441.6M=C2=A0=C2=A0=C2=A0 101.4M=C2=A0=C2=A0=C2=A0 340.=
2M=C2=A0 23% /mnt/images

But when I write to to the UBIFS, some processes get stuck, for instance:=

=46rom ash inside an initramfs those commands working fine and no errors
are reported:
$ mount -t ubifs -o noatime,nodiratime,chk_data_crc ubi0:root /mnt/images=

$ ls -l /mnt/images/test
$ dd if=3D/dev/urandom of=3D/mnt/images/test/urandom_1k bs=3D1k count=3D1=


After a few minutes I ran to be sure the the background sync has already
started:
$ ls -l /mnt/images/test
and it did not return which later on got me this:
[=C2=A0 480.130000] INFO: task ls:149 blocked for more than 120 seconds.
[=C2=A0 480.130000]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Not tainted 4.4.6=
6-SEM #15
[=C2=A0 480.140000] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
disables this message.
[=C2=A0 480.140000] ls=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 D c044cc28=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=
=A0 149=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1 0x00000000
[=C2=A0 480.150000] Backtrace:
[=C2=A0 480.150000] [<c044ca14>] (__schedule) from [<c044cf9c>]
(schedule+0xa0/0xb8)
[=C2=A0 480.160000]=C2=A0 r10:c2312000 r9:c25b9aa8 r8:c22b4a98 r7:0000001=
5
r6:ffffe000 r5:c20fa818
[=C2=A0 480.170000]=C2=A0 r4:c25b8000
[=C2=A0 480.170000] [<c044cefc>] (schedule) from [<c02e5ec8>]
(nand_get_device+0xf8/0x110)
[=C2=A0 480.180000]=C2=A0 r5:c20fa818 r4:c22b4a90
[=C2=A0 480.180000] [<c02e5dd0>] (nand_get_device) from [<c02ea410>]
(nand_read+0x28/0x84)
[=C2=A0 480.190000]=C2=A0 r9:00000000 r8:01400000 r7:00000000 r6:08c06000=

r5:c25b9af4 r4:c20fab70
[=C2=A0 480.200000] [<c02ea3e8>] (nand_read) from [<c02df6fc>]
(part_read+0x50/0x88)
[=C2=A0 480.200000]=C2=A0 r7:000001e0 r6:00000000 r5:00000000 r4:c2312000=

[=C2=A0 480.210000] [<c02df6ac>] (part_read) from [<c02dcca0>]
(mtd_read+0x6c/0xa4)
[=C2=A0 480.220000]=C2=A0 r9:00000000 r8:07806000 r6:00000043 r5:00000000=
 r4:173fa000
[=C2=A0 480.220000] [<c02dcc34>] (mtd_read) from [<c02dcd28>]
(mtd_read_slc_mode+0x50/0xe0)
[=C2=A0 480.230000]=C2=A0 r10:c25b9c24 r9:00000000 r8:07806000 r7:000001e=
0
r6:00000043 r5:00000043
[=C2=A0 480.240000]=C2=A0 r4:c2312000
[=C2=A0 480.240000] [<c02dccd8>] (mtd_read_slc_mode) from [<c02fe8fc>]
(ubi_io_read+0x168/0x338)
[=C2=A0 480.250000]=C2=A0 r10:c2528980 r9:00000004 r8:00006000 r7:000001e=
0
r6:00000043 r5:c302d000
[=C2=A0 480.260000]=C2=A0 r4:c302d000
[=C2=A0 480.260000] [<c02fe794>] (ubi_io_read) from [<c02fc484>]
(ubi_eba_read_leb+0x344/0x458)
[=C2=A0 480.270000]=C2=A0 r10:c23ca400 r9:000001e0 r8:00000000 r7:0000004=
3
r6:0000039e r5:00000000
[=C2=A0 480.280000]=C2=A0 r4:c302d000
[=C2=A0 480.280000] [<c02fc140>] (ubi_eba_read_leb) from [<c02fafe0>]
(ubi_leb_read+0xc4/0x114)
[=C2=A0 480.290000]=C2=A0 r10:00000000 r9:c302d000 r8:00005000 r7:0000039=
e
r6:00000043 r5:00000000
[=C2=A0 480.290000]=C2=A0 r4:c23ca400
[=C2=A0 480.300000] [<c02faf1c>] (ubi_leb_read) from [<c01ae394>]
(ubifs_leb_read+0x34/0x98)
[=C2=A0 480.310000]=C2=A0 r10:00000002 r9:c2528980 r8:00005000 r7:0000039=
e
r6:00000043 r5:c302e000
[=C2=A0 480.310000]=C2=A0 r4:c302e000
[=C2=A0 480.320000] [<c01ae360>] (ubifs_leb_read) from [<c01b0324>]
(ubifs_read_node+0x18c/0x340)
[=C2=A0 480.320000]=C2=A0 r8:00000043 r7:c092d2d0 r6:0000039e r5:00005000=
 r4:c302e000
[=C2=A0 480.330000] [<c01b0198>] (ubifs_read_node) from [<c01b0684>]
(ubifs_read_node_wbuf+0x1ac/0x378)
[=C2=A0 480.340000]=C2=A0 r10:00000043 r9:00000002 r8:c2528980 r7:0000039=
e
r6:c24496a0 r5:00005000
[=C2=A0 480.350000]=C2=A0 r4:c302e000
[=C2=A0 480.350000] [<c01b04d8>] (ubifs_read_node_wbuf) from [<c01cefb4>]=

(ubifs_tnc_read_node+0x54/0x1ec)
[=C2=A0 480.360000]=C2=A0 r10:c2528980 r9:40000000 r8:c302e314 r7:0000000=
2
r6:c2528980 r5:c302e000
[=C2=A0 480.370000]=C2=A0 r4:c2524e78
[=C2=A0 480.370000] [<c01cef60>] (ubifs_tnc_read_node) from [<c01b1700>]
(tnc_read_node_nm+0x1c0/0x1f4)
[=C2=A0 480.380000]=C2=A0 r8:c302e314 r7:c302e000 r6:c2528980 r5:c302e000=
 r4:c2524e78
[=C2=A0 480.390000] [<c01b1540>] (tnc_read_node_nm) from [<c01b5404>]
(ubifs_tnc_next_ent+0x228/0x274)
[=C2=A0 480.390000]=C2=A0 r7:c25b9ee8 r6:00000048 r5:c302e000 r4:c2524e00=

[=C2=A0 480.400000] [<c01b51dc>] (ubifs_tnc_next_ent) from [<c01a7118>]
(ubifs_readdir+0x20c/0x4c4)
[=C2=A0 480.410000]=C2=A0 r10:c092cd48 r9:00000000 r8:c28c81c8 r7:c302e00=
0
r6:c234e600 r5:c25b9f68
[=C2=A0 480.420000]=C2=A0 r4:c0102e8c
[=C2=A0 480.420000] [<c01a6f0c>] (ubifs_readdir) from [<c0102cc0>]
(iterate_dir+0x74/0xf8)
[=C2=A0 480.430000]=C2=A0 r10:00000000 r9:c25b8000 r8:c28c8238 r7:c234e60=
8
r6:00000000 r5:c25b9f68
[=C2=A0 480.430000]=C2=A0 r4:c234e600
[=C2=A0 480.440000] [<c0102c4c>] (iterate_dir) from [<c0103158>]
(SyS_getdents64+0x84/0xe4)
[=C2=A0 480.440000]=C2=A0 r10:00000000 r9:c25b8000 r8:c000f8c4 r7:c234e60=
0
r6:c234e600 r5:00008000
[=C2=A0 480.450000]=C2=A0 r4:000a80b0
[=C2=A0 480.450000] [<c01030d4>] (SyS_getdents64) from [<c000f720>]
(ret_fast_syscall+0x0/0x34)
[=C2=A0 480.460000]=C2=A0 r7:000000d9 r6:b6f95570 r5:000a8094 r4:000a80b0=


In a similar test when I create a directory, call sync, then write to a
file the background thread is also effected together with the ls command.=

This output is from another test perfomed on the same device (also one
backtrace for ls is present):

[=C2=A0 960.130000] INFO: task ubifs_bgt0_0:132 blocked for more than 120=

seconds.
[=C2=A0 960.130000]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Not tainted 4.4.6=
6-SEM-MK11 #12
[=C2=A0 960.140000] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
disables this message.
[=C2=A0 960.140000] ubifs_bgt0_0=C2=A0=C2=A0=C2=A0 D c044cc28=C2=A0=C2=A0=
=C2=A0=C2=A0 0=C2=A0=C2=A0 132=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2 0x00000000=

[=C2=A0 960.150000] Backtrace:
[=C2=A0 960.150000] [<c044ca14>] (__schedule) from [<c044cf9c>]
(schedule+0xa0/0xb8)
[=C2=A0 960.160000]=C2=A0 r10:c251b000 r9:c249fc50 r8:c22c3a98 r7:0000000=
7
r6:ffffe000 r5:c20fa818
[=C2=A0 960.170000]=C2=A0 r4:c249e000
[=C2=A0 960.170000] [<c044cefc>] (schedule) from [<c02e5ec8>]
(nand_get_device+0xf8/0x110)
[=C2=A0 960.180000]=C2=A0 r5:c20fa818 r4:c22c3a90
[=C2=A0 960.180000] [<c02e5dd0>] (nand_get_device) from [<c02e780c>]
(nand_write+0x28/0x84)
[=C2=A0 960.190000]=C2=A0 r9:00000000 r8:06cbf000 r7:00000000 r6:080bf000=

r5:c249fc9c r4:c20fab70
[=C2=A0 960.200000] [<c02e77e4>] (nand_write) from [<c02df0f0>]
(part_write+0x48/0x50)
[=C2=A0 960.210000]=C2=A0 r7:00001000 r6:0003f000 r5:00000000 r4:01400000=

[=C2=A0 960.210000] [<c02df0a8>] (part_write) from [<c02dbcf0>]
(mtd_write+0x84/0x9c)
[=C2=A0 960.220000]=C2=A0 r5:00000000 r4:c02df0a8
[=C2=A0 960.220000] [<c02dbc6c>] (mtd_write) from [<c02dbd4c>]
(mtd_write_slc_mode+0x44/0xcc)
[=C2=A0 960.230000]=C2=A0 r9:00000000 r8:06cbf000 r7:00001000 r6:0003f000=

r5:00001000 r4:c2310000
[=C2=A0 960.240000] [<c02dbd08>] (mtd_write_slc_mode) from [<c02ff8ec>]
(ubi_io_write+0x37c/0x60c)
[=C2=A0 960.250000]=C2=A0 r10:00000000 r9:c251b000 r8:000001b2 r7:0000100=
0
r6:0003f000 r5:000001b2
[=C2=A0 960.250000]=C2=A0 r4:c302d000
[=C2=A0 960.260000] [<c02ff570>] (ubi_io_write) from [<c02fc7b0>]
(ubi_eba_write_leb+0xf4/0x77c)
[=C2=A0 960.260000]=C2=A0 r10:c248f280 r9:00000457 r8:000001b2 r7:0000045=
7
r6:00000000 r5:00000000
[=C2=A0 960.270000]=C2=A0 r4:c302d000
[=C2=A0 960.270000] [<c02fc6bc>] (ubi_eba_write_leb) from [<c02fb254>]
(ubi_leb_write+0x110/0x138)
[=C2=A0 960.280000]=C2=A0 r10:c248f280 r9:00000000 r8:c302d000 r7:0000045=
7
r6:0003e000 r5:c23c8400
[=C2=A0 960.290000]=C2=A0 r4:00001000
[=C2=A0 960.290000] [<c02fb144>] (ubi_leb_write) from [<c01ae498>]
(ubifs_leb_write+0xa0/0x130)
[=C2=A0 960.300000]=C2=A0 r10:0003e000 r9:00000084 r8:00001000 r7:0003e00=
0
r6:00000457 r5:c251b000
[=C2=A0 960.310000]=C2=A0 r4:c251a000
[=C2=A0 960.310000] [<c01ae3f8>] (ubifs_leb_write) from [<c01af0d4>]
(ubifs_wbuf_sync_nolock+0x294/0x350)
[=C2=A0 960.320000]=C2=A0 r8:00000b70 r7:00000490 r6:00001000 r5:c251a000=
 r4:c2449740
[=C2=A0 960.330000] [<c01aee40>] (ubifs_wbuf_sync_nolock) from [<c01af4a8=
>]
(ubifs_bg_wbufs_sync+0x104/0x1b0)
[=C2=A0 960.340000]=C2=A0 r10:00000000 r9:00000000 r8:000000a0 r7:c244976=
4
r6:00000002 r5:c2449740
[=C2=A0 960.350000]=C2=A0 r4:c251a000
[=C2=A0 960.350000] [<c01af3a4>] (ubifs_bg_wbufs_sync) from [<c01bab58>]
(ubifs_bg_thread+0xb8/0x1e8)
[=C2=A0 960.360000]=C2=A0 r9:00000000 r8:ffffe000 r7:c095e770 r6:c251a924=

r5:00000000 r4:c251a000
[=C2=A0 960.360000] [<c01baaa0>] (ubifs_bg_thread) from [<c003c6b8>]
(kthread+0xfc/0x10c)
[=C2=A0 960.370000]=C2=A0 r8:c01baaa0 r7:c251a000 r6:00000000 r5:c248f540=
 r4:c249e000
[=C2=A0 960.380000] [<c003c5bc>] (kthread) from [<c000f7c8>]
(ret_from_fork+0x14/0x2c)
[=C2=A0 960.390000]=C2=A0 r8:00000000 r7:00000000 r6:00000000 r5:c003c5bc=
 r4:c248f540

Printing the stacktraces only happens when UBIFS is mounted async. In
sync mode there are none.
But the behavior is the same: writing some data besides creating
directories or touching files leads to all access to files on the UBIFS
get stuck.

As stated before, multiple systems are effected and all of them share
one common debug output close to or at the end:
[=C2=A0 742.010000] ubifs_wbuf_write_nolock: UBIFS DBG io (pid 59): 4144
bytes (data node) to jhead 0 (GC) wbuf at LEB 644:208896
[=C2=A0 742.020000] ubifs_wbuf_write_nolock: UBIFS DBG io (pid 59): write=

4096 bytes to LEB 644:208896
Depending on which system I perform the write test I get a different LEB
of course.

I assume that all threads are waiting in
mtd/nand/nand_base.c:nand_get_device() for the right nand device state,
but it does get right anyhow.
Since read access is no problem before writing something I wonder if the
nand device is left in the wrong state when writing data to it and
something unexpected happens.

I currently do not know how I can investigate the issue any more.
Maybe you can see something in the full log output and/or can point me
in the right direction.

Thanks,
Sebastian

PS: Here is the full output of the first example:
/ # mount -t ubifs -o noatime,nodiratime,chk_data_crc ubi0:root /mnt/imag=
es
[=C2=A0=C2=A0 16.480000] ubifs_mount: UBIFS DBG gen (pid 81): name ubi0:r=
oot,
flags 0x0
[=C2=A0=C2=A0 16.480000] ubifs_mount: UBIFS DBG gen (pid 81): opened ubi0=
_0
[=C2=A0=C2=A0 16.490000] ubifs_read_node: UBIFS DBG io (pid 81): LEB 0:0,=

superblock node, length 4096
[=C2=A0=C2=A0 16.500000] ubifs_start_scan: UBIFS DBG scan (pid 81): scan =
LEB 1:0
[=C2=A0=C2=A0 16.510000] UBIFS (ubi0:0): background thread "ubifs_bgt0_0"=
 started,
PID 82
[=C2=A0=C2=A0 16.570000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 1:0
(258048 bytes left)
[=C2=A0=C2=A0 16.570000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
master node at LEB 1:0
[=C2=A0=C2=A0 16.580000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 1:512
(257536 bytes left)
[=C2=A0=C2=A0 16.590000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
padding node at LEB 1:512
[=C2=A0=C2=A0 16.600000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): 3556=
 bytes
padded at LEB 1:512, offset now 4096
[=C2=A0=C2=A0 16.610000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 1:4096
(253952 bytes left)
[=C2=A0=C2=A0 16.620000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
master node at LEB 1:4096
[=C2=A0=C2=A0 16.620000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 1:4608
(253440 bytes left)
[=C2=A0=C2=A0 16.630000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
padding node at LEB 1:4608
[=C2=A0=C2=A0 16.640000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): 3556=
 bytes
padded at LEB 1:4608, offset now 8192
[=C2=A0=C2=A0 16.650000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 1:8192
(249856 bytes left)
[=C2=A0=C2=A0 16.660000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
master node at LEB 1:8192
[=C2=A0=C2=A0 16.670000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 1:8704
(249344 bytes left)
[=C2=A0=C2=A0 16.670000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
padding node at LEB 1:8704
[=C2=A0=C2=A0 16.680000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): 3556=
 bytes
padded at LEB 1:8704, offset now 12288
[=C2=A0=C2=A0 16.690000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 1:12288
(245760 bytes left)
[=C2=A0=C2=A0 16.700000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
master node at LEB 1:12288
[=C2=A0=C2=A0 16.710000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 1:12800
(245248 bytes left)
[=C2=A0=C2=A0 16.720000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
padding node at LEB 1:12800
[=C2=A0=C2=A0 16.730000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): 3556=
 bytes
padded at LEB 1:12800, offset now 16384
[=C2=A0=C2=A0 16.740000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 1:16384
(241664 bytes left)
[=C2=A0=C2=A0 16.740000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
master node at LEB 1:16384
[=C2=A0=C2=A0 16.750000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 1:16896
(241152 bytes left)
[=C2=A0=C2=A0 16.760000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
padding node at LEB 1:16896
[=C2=A0=C2=A0 16.770000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): 3556=
 bytes
padded at LEB 1:16896, offset now 20480
[=C2=A0=C2=A0 16.780000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 1:20480
(237568 bytes left)
[=C2=A0=C2=A0 16.790000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
master node at LEB 1:20480
[=C2=A0=C2=A0 16.790000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 1:20992
(237056 bytes left)
[=C2=A0=C2=A0 16.800000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
padding node at LEB 1:20992
[=C2=A0=C2=A0 16.810000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): 3556=
 bytes
padded at LEB 1:20992, offset now 24576
[=C2=A0=C2=A0 16.820000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 1:24576
(233472 bytes left)
[=C2=A0=C2=A0 16.830000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
master node at LEB 1:24576
[=C2=A0=C2=A0 16.840000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 1:25088
(232960 bytes left)
[=C2=A0=C2=A0 16.850000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
padding node at LEB 1:25088
[=C2=A0=C2=A0 16.850000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): 3556=
 bytes
padded at LEB 1:25088, offset now 28672
[=C2=A0=C2=A0 16.860000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 1:28672
(229376 bytes left)
[=C2=A0=C2=A0 16.870000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
master node at LEB 1:28672
[=C2=A0=C2=A0 16.880000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 1:29184
(228864 bytes left)
[=C2=A0=C2=A0 16.890000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
padding node at LEB 1:29184
[=C2=A0=C2=A0 16.900000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): 3556=
 bytes
padded at LEB 1:29184, offset now 32768
[=C2=A0=C2=A0 16.910000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 1:32768
(225280 bytes left)
[=C2=A0=C2=A0 16.920000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
master node at LEB 1:32768
[=C2=A0=C2=A0 16.920000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 1:33280
(224768 bytes left)
[=C2=A0=C2=A0 16.930000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
padding node at LEB 1:33280
[=C2=A0=C2=A0 16.940000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): 3556=
 bytes
padded at LEB 1:33280, offset now 36864
[=C2=A0=C2=A0 16.950000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 1:36864
(221184 bytes left)
[=C2=A0=C2=A0 16.960000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
master node at LEB 1:36864
[=C2=A0=C2=A0 16.970000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 1:37376
(220672 bytes left)
[=C2=A0=C2=A0 16.970000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
padding node at LEB 1:37376
[=C2=A0=C2=A0 16.980000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): 3556=
 bytes
padded at LEB 1:37376, offset now 40960
[=C2=A0=C2=A0 16.990000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 1:40960
(217088 bytes left)
[=C2=A0=C2=A0 17.000000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
master node at LEB 1:40960
[=C2=A0=C2=A0 17.010000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 1:41472
(216576 bytes left)
[=C2=A0=C2=A0 17.020000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
padding node at LEB 1:41472
[=C2=A0=C2=A0 17.030000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): 3556=
 bytes
padded at LEB 1:41472, offset now 45056
[=C2=A0=C2=A0 17.040000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 1:45056
(212992 bytes left)
[=C2=A0=C2=A0 17.040000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
master node at LEB 1:45056
[=C2=A0=C2=A0 17.050000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 1:45568
(212480 bytes left)
[=C2=A0=C2=A0 17.060000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
padding node at LEB 1:45568
[=C2=A0=C2=A0 17.070000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): 3556=
 bytes
padded at LEB 1:45568, offset now 49152
[=C2=A0=C2=A0 17.080000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 1:49152
(208896 bytes left)
[=C2=A0=C2=A0 17.090000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
master node at LEB 1:49152
[=C2=A0=C2=A0 17.090000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 1:49664
(208384 bytes left)
[=C2=A0=C2=A0 17.100000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
padding node at LEB 1:49664
[=C2=A0=C2=A0 17.110000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): 3556=
 bytes
padded at LEB 1:49664, offset now 53248
[=C2=A0=C2=A0 17.120000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 1:53248
(204800 bytes left)
[=C2=A0=C2=A0 17.130000] watchdog watchdog0: watchdog did not stop!
[=C2=A0=C2=A0 17.140000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
master node at LEB 1:53248
[=C2=A0=C2=A0 17.150000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 1:53760
(204288 bytes left)
[=C2=A0=C2=A0 17.160000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
padding node at LEB 1:53760
[=C2=A0=C2=A0 17.160000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): 3556=
 bytes
padded at LEB 1:53760, offset now 57344
[=C2=A0=C2=A0 17.170000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 1:57344
(200704 bytes left)
[=C2=A0=C2=A0 17.180000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
master node at LEB 1:57344
[=C2=A0=C2=A0 17.190000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 1:57856
(200192 bytes left)
[=C2=A0=C2=A0 17.200000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
padding node at LEB 1:57856
[=C2=A0=C2=A0 17.210000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): 3556=
 bytes
padded at LEB 1:57856, offset now 61440
[=C2=A0=C2=A0 17.220000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 1:61440
(196608 bytes left)
[=C2=A0=C2=A0 17.230000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
master node at LEB 1:61440
[=C2=A0=C2=A0 17.230000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 1:61952
(196096 bytes left)
[=C2=A0=C2=A0 17.240000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
padding node at LEB 1:61952
[=C2=A0=C2=A0 17.250000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): 3556=
 bytes
padded at LEB 1:61952, offset now 65536
[=C2=A0=C2=A0 17.260000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 1:65536
(192512 bytes left)
[=C2=A0=C2=A0 17.270000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
master node at LEB 1:65536
[=C2=A0=C2=A0 17.280000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 1:66048
(192000 bytes left)
[=C2=A0=C2=A0 17.280000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
padding node at LEB 1:66048
[=C2=A0=C2=A0 17.290000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): 3556=
 bytes
padded at LEB 1:66048, offset now 69632
[=C2=A0=C2=A0 17.300000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 1:69632
(188416 bytes left)
[=C2=A0=C2=A0 17.310000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
master node at LEB 1:69632
[=C2=A0=C2=A0 17.320000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 1:70144
(187904 bytes left)
[=C2=A0=C2=A0 17.330000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
padding node at LEB 1:70144
[=C2=A0=C2=A0 17.340000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): 3556=
 bytes
padded at LEB 1:70144, offset now 73728
[=C2=A0=C2=A0 17.350000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 1:73728
(184320 bytes left)
[=C2=A0=C2=A0 17.350000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
master node at LEB 1:73728
[=C2=A0=C2=A0 17.360000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 1:74240
(183808 bytes left)
[=C2=A0=C2=A0 17.370000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
padding node at LEB 1:74240
[=C2=A0=C2=A0 17.380000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): 3556=
 bytes
padded at LEB 1:74240, offset now 77824
[=C2=A0=C2=A0 17.390000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 1:77824
(180224 bytes left)
[=C2=A0=C2=A0 17.400000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
master node at LEB 1:77824
[=C2=A0=C2=A0 17.400000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 1:78336
(179712 bytes left)
[=C2=A0=C2=A0 17.410000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
padding node at LEB 1:78336
[=C2=A0=C2=A0 17.420000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): 3556=
 bytes
padded at LEB 1:78336, offset now 81920
[=C2=A0=C2=A0 17.430000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 1:81920
(176128 bytes left)
[=C2=A0=C2=A0 17.440000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
master node at LEB 1:81920
[=C2=A0=C2=A0 17.450000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 1:82432
(175616 bytes left)
[=C2=A0=C2=A0 17.460000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
padding node at LEB 1:82432
[=C2=A0=C2=A0 17.460000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): 3556=
 bytes
padded at LEB 1:82432, offset now 86016
[=C2=A0=C2=A0 17.470000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 1:86016
(172032 bytes left)
[=C2=A0=C2=A0 17.480000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
master node at LEB 1:86016
[=C2=A0=C2=A0 17.490000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 1:86528
(171520 bytes left)
[=C2=A0=C2=A0 17.500000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
padding node at LEB 1:86528
[=C2=A0=C2=A0 17.510000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): 3556=
 bytes
padded at LEB 1:86528, offset now 90112
[=C2=A0=C2=A0 17.520000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 1:90112
(167936 bytes left)
[=C2=A0=C2=A0 17.520000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
master node at LEB 1:90112
[=C2=A0=C2=A0 17.530000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 1:90624
(167424 bytes left)
[=C2=A0=C2=A0 17.540000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
padding node at LEB 1:90624
[=C2=A0=C2=A0 17.550000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): 3556=
 bytes
padded at LEB 1:90624, offset now 94208
[=C2=A0=C2=A0 17.560000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 1:94208
(163840 bytes left)
[=C2=A0=C2=A0 17.570000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
master node at LEB 1:94208
[=C2=A0=C2=A0 17.580000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 1:94720
(163328 bytes left)
[=C2=A0=C2=A0 17.580000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
padding node at LEB 1:94720
[=C2=A0=C2=A0 17.590000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): 3556=
 bytes
padded at LEB 1:94720, offset now 98304
[=C2=A0=C2=A0 17.600000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 1:98304
(159744 bytes left)
[=C2=A0=C2=A0 17.610000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
master node at LEB 1:98304
[=C2=A0=C2=A0 17.620000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 1:98816
(159232 bytes left)
[=C2=A0=C2=A0 17.630000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
padding node at LEB 1:98816
[=C2=A0=C2=A0 17.640000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): 3556=
 bytes
padded at LEB 1:98816, offset now 102400
[=C2=A0=C2=A0 17.650000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 1:102400
(155648 bytes left)
[=C2=A0=C2=A0 17.650000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
master node at LEB 1:102400
[=C2=A0=C2=A0 17.660000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 1:102912
(155136 bytes left)
[=C2=A0=C2=A0 17.670000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
padding node at LEB 1:102912
[=C2=A0=C2=A0 17.680000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): 3556=
 bytes
padded at LEB 1:102912, offset now 106496
[=C2=A0=C2=A0 17.690000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 1:106496
(151552 bytes left)
[=C2=A0=C2=A0 17.700000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
master node at LEB 1:106496
[=C2=A0=C2=A0 17.710000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 1:107008
(151040 bytes left)
[=C2=A0=C2=A0 17.710000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
padding node at LEB 1:107008
[=C2=A0=C2=A0 17.720000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): 3556=
 bytes
padded at LEB 1:107008, offset now 110592
[=C2=A0=C2=A0 17.730000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 1:110592
(147456 bytes left)
[=C2=A0=C2=A0 17.740000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
master node at LEB 1:110592
[=C2=A0=C2=A0 17.750000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 1:111104
(146944 bytes left)
[=C2=A0=C2=A0 17.760000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
padding node at LEB 1:111104
[=C2=A0=C2=A0 17.770000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): 3556=
 bytes
padded at LEB 1:111104, offset now 114688
[=C2=A0=C2=A0 17.780000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 1:114688
(143360 bytes left)
[=C2=A0=C2=A0 17.780000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
master node at LEB 1:114688
[=C2=A0=C2=A0 17.790000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 1:115200
(142848 bytes left)
[=C2=A0=C2=A0 17.800000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
padding node at LEB 1:115200
[=C2=A0=C2=A0 17.810000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): 3556=
 bytes
padded at LEB 1:115200, offset now 118784
[=C2=A0=C2=A0 17.820000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 1:118784
(139264 bytes left)
[=C2=A0=C2=A0 17.830000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
master node at LEB 1:118784
[=C2=A0=C2=A0 17.840000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 1:119296
(138752 bytes left)
[=C2=A0=C2=A0 17.840000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
padding node at LEB 1:119296
[=C2=A0=C2=A0 17.850000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): 3556=
 bytes
padded at LEB 1:119296, offset now 122880
[=C2=A0=C2=A0 17.860000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 1:122880
(135168 bytes left)
[=C2=A0=C2=A0 17.870000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): hit =
empty
space at LEB 1:122880
[=C2=A0=C2=A0 17.880000] ubifs_end_scan: UBIFS DBG scan (pid 81): stop sc=
anning
LEB 1 at offset 122880
[=C2=A0=C2=A0 17.890000] ubifs_start_scan: UBIFS DBG scan (pid 81): scan =
LEB 2:0
[=C2=A0=C2=A0 17.950000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 2:0
(258048 bytes left)
[=C2=A0=C2=A0 17.950000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
master node at LEB 2:0
[=C2=A0=C2=A0 17.960000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 2:512
(257536 bytes left)
[=C2=A0=C2=A0 17.970000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
padding node at LEB 2:512
[=C2=A0=C2=A0 17.980000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): 3556=
 bytes
padded at LEB 2:512, offset now 4096
[=C2=A0=C2=A0 17.990000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 2:4096
(253952 bytes left)
[=C2=A0=C2=A0 18.000000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
master node at LEB 2:4096
[=C2=A0=C2=A0 18.000000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 2:4608
(253440 bytes left)
[=C2=A0=C2=A0 18.010000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
padding node at LEB 2:4608
[=C2=A0=C2=A0 18.020000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): 3556=
 bytes
padded at LEB 2:4608, offset now 8192
[=C2=A0=C2=A0 18.030000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 2:8192
(249856 bytes left)
[=C2=A0=C2=A0 18.040000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
master node at LEB 2:8192
[=C2=A0=C2=A0 18.050000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 2:8704
(249344 bytes left)
[=C2=A0=C2=A0 18.050000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
padding node at LEB 2:8704
[=C2=A0=C2=A0 18.060000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): 3556=
 bytes
padded at LEB 2:8704, offset now 12288
[=C2=A0=C2=A0 18.070000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 2:12288
(245760 bytes left)
[=C2=A0=C2=A0 18.080000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
master node at LEB 2:12288
[=C2=A0=C2=A0 18.090000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 2:12800
(245248 bytes left)
[=C2=A0=C2=A0 18.100000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
padding node at LEB 2:12800
[=C2=A0=C2=A0 18.110000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): 3556=
 bytes
padded at LEB 2:12800, offset now 16384
[=C2=A0=C2=A0 18.120000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 2:16384
(241664 bytes left)
[=C2=A0=C2=A0 18.120000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
master node at LEB 2:16384
[=C2=A0=C2=A0 18.130000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 2:16896
(241152 bytes left)
[=C2=A0=C2=A0 18.140000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
padding node at LEB 2:16896
[=C2=A0=C2=A0 18.150000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): 3556=
 bytes
padded at LEB 2:16896, offset now 20480
[=C2=A0=C2=A0 18.160000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 2:20480
(237568 bytes left)
[=C2=A0=C2=A0 18.170000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
master node at LEB 2:20480
[=C2=A0=C2=A0 18.180000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 2:20992
(237056 bytes left)
[=C2=A0=C2=A0 18.180000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
padding node at LEB 2:20992
[=C2=A0=C2=A0 18.190000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): 3556=
 bytes
padded at LEB 2:20992, offset now 24576
[=C2=A0=C2=A0 18.200000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 2:24576
(233472 bytes left)
[=C2=A0=C2=A0 18.210000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
master node at LEB 2:24576
[=C2=A0=C2=A0 18.220000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 2:25088
(232960 bytes left)
[=C2=A0=C2=A0 18.230000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
padding node at LEB 2:25088
[=C2=A0=C2=A0 18.230000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): 3556=
 bytes
padded at LEB 2:25088, offset now 28672
[=C2=A0=C2=A0 18.240000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 2:28672
(229376 bytes left)
[=C2=A0=C2=A0 18.250000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
master node at LEB 2:28672
[=C2=A0=C2=A0 18.260000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 2:29184
(228864 bytes left)
[=C2=A0=C2=A0 18.270000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
padding node at LEB 2:29184
[=C2=A0=C2=A0 18.280000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): 3556=
 bytes
padded at LEB 2:29184, offset now 32768
[=C2=A0=C2=A0 18.290000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 2:32768
(225280 bytes left)
[=C2=A0=C2=A0 18.300000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
master node at LEB 2:32768
[=C2=A0=C2=A0 18.300000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 2:33280
(224768 bytes left)
[=C2=A0=C2=A0 18.310000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
padding node at LEB 2:33280
[=C2=A0=C2=A0 18.320000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): 3556=
 bytes
padded at LEB 2:33280, offset now 36864
[=C2=A0=C2=A0 18.330000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 2:36864
(221184 bytes left)
[=C2=A0=C2=A0 18.340000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
master node at LEB 2:36864
[=C2=A0=C2=A0 18.350000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 2:37376
(220672 bytes left)
[=C2=A0=C2=A0 18.350000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
padding node at LEB 2:37376
[=C2=A0=C2=A0 18.360000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): 3556=
 bytes
padded at LEB 2:37376, offset now 40960
[=C2=A0=C2=A0 18.370000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 2:40960
(217088 bytes left)
[=C2=A0=C2=A0 18.380000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
master node at LEB 2:40960
[=C2=A0=C2=A0 18.390000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 2:41472
(216576 bytes left)
[=C2=A0=C2=A0 18.400000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
padding node at LEB 2:41472
[=C2=A0=C2=A0 18.410000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): 3556=
 bytes
padded at LEB 2:41472, offset now 45056
[=C2=A0=C2=A0 18.420000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 2:45056
(212992 bytes left)
[=C2=A0=C2=A0 18.420000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
master node at LEB 2:45056
[=C2=A0=C2=A0 18.430000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 2:45568
(212480 bytes left)
[=C2=A0=C2=A0 18.440000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
padding node at LEB 2:45568
[=C2=A0=C2=A0 18.450000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): 3556=
 bytes
padded at LEB 2:45568, offset now 49152
[=C2=A0=C2=A0 18.460000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 2:49152
(208896 bytes left)
[=C2=A0=C2=A0 18.470000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
master node at LEB 2:49152
[=C2=A0=C2=A0 18.470000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 2:49664
(208384 bytes left)
[=C2=A0=C2=A0 18.480000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
padding node at LEB 2:49664
[=C2=A0=C2=A0 18.490000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): 3556=
 bytes
padded at LEB 2:49664, offset now 53248
[=C2=A0=C2=A0 18.500000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 2:53248
(204800 bytes left)
[=C2=A0=C2=A0 18.510000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
master node at LEB 2:53248
[=C2=A0=C2=A0 18.520000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 2:53760
(204288 bytes left)
[=C2=A0=C2=A0 18.530000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
padding node at LEB 2:53760
[=C2=A0=C2=A0 18.530000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): 3556=
 bytes
padded at LEB 2:53760, offset now 57344
[=C2=A0=C2=A0 18.540000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 2:57344
(200704 bytes left)
[=C2=A0=C2=A0 18.550000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
master node at LEB 2:57344
[=C2=A0=C2=A0 18.560000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 2:57856
(200192 bytes left)
[=C2=A0=C2=A0 18.570000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
padding node at LEB 2:57856
[=C2=A0=C2=A0 18.580000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): 3556=
 bytes
padded at LEB 2:57856, offset now 61440
[=C2=A0=C2=A0 18.590000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 2:61440
(196608 bytes left)
[=C2=A0=C2=A0 18.590000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
master node at LEB 2:61440
[=C2=A0=C2=A0 18.600000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 2:61952
(196096 bytes left)
[=C2=A0=C2=A0 18.610000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
padding node at LEB 2:61952
[=C2=A0=C2=A0 18.620000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): 3556=
 bytes
padded at LEB 2:61952, offset now 65536
[=C2=A0=C2=A0 18.630000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 2:65536
(192512 bytes left)
[=C2=A0=C2=A0 18.640000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
master node at LEB 2:65536
[=C2=A0=C2=A0 18.650000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 2:66048
(192000 bytes left)
[=C2=A0=C2=A0 18.650000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
padding node at LEB 2:66048
[=C2=A0=C2=A0 18.660000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): 3556=
 bytes
padded at LEB 2:66048, offset now 69632
[=C2=A0=C2=A0 18.670000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 2:69632
(188416 bytes left)
[=C2=A0=C2=A0 18.680000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
master node at LEB 2:69632
[=C2=A0=C2=A0 18.690000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 2:70144
(187904 bytes left)
[=C2=A0=C2=A0 18.700000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
padding node at LEB 2:70144
[=C2=A0=C2=A0 18.710000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): 3556=
 bytes
padded at LEB 2:70144, offset now 73728
[=C2=A0=C2=A0 18.720000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 2:73728
(184320 bytes left)
[=C2=A0=C2=A0 18.720000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
master node at LEB 2:73728
[=C2=A0=C2=A0 18.730000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 2:74240
(183808 bytes left)
[=C2=A0=C2=A0 18.740000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
padding node at LEB 2:74240
[=C2=A0=C2=A0 18.750000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): 3556=
 bytes
padded at LEB 2:74240, offset now 77824
[=C2=A0=C2=A0 18.760000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 2:77824
(180224 bytes left)
[=C2=A0=C2=A0 18.770000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
master node at LEB 2:77824
[=C2=A0=C2=A0 18.770000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 2:78336
(179712 bytes left)
[=C2=A0=C2=A0 18.780000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
padding node at LEB 2:78336
[=C2=A0=C2=A0 18.790000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): 3556=
 bytes
padded at LEB 2:78336, offset now 81920
[=C2=A0=C2=A0 18.800000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 2:81920
(176128 bytes left)
[=C2=A0=C2=A0 18.810000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
master node at LEB 2:81920
[=C2=A0=C2=A0 18.820000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 2:82432
(175616 bytes left)
[=C2=A0=C2=A0 18.830000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
padding node at LEB 2:82432
[=C2=A0=C2=A0 18.830000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): 3556=
 bytes
padded at LEB 2:82432, offset now 86016
[=C2=A0=C2=A0 18.840000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 2:86016
(172032 bytes left)
[=C2=A0=C2=A0 18.850000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
master node at LEB 2:86016
[=C2=A0=C2=A0 18.860000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 2:86528
(171520 bytes left)
[=C2=A0=C2=A0 18.870000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
padding node at LEB 2:86528
[=C2=A0=C2=A0 18.880000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): 3556=
 bytes
padded at LEB 2:86528, offset now 90112
[=C2=A0=C2=A0 18.890000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 2:90112
(167936 bytes left)
[=C2=A0=C2=A0 18.890000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
master node at LEB 2:90112
[=C2=A0=C2=A0 18.900000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 2:90624
(167424 bytes left)
[=C2=A0=C2=A0 18.910000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
padding node at LEB 2:90624
[=C2=A0=C2=A0 18.920000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): 3556=
 bytes
padded at LEB 2:90624, offset now 94208
[=C2=A0=C2=A0 18.930000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 2:94208
(163840 bytes left)
[=C2=A0=C2=A0 18.940000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
master node at LEB 2:94208
[=C2=A0=C2=A0 18.950000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 2:94720
(163328 bytes left)
[=C2=A0=C2=A0 18.950000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
padding node at LEB 2:94720
[=C2=A0=C2=A0 18.960000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): 3556=
 bytes
padded at LEB 2:94720, offset now 98304
[=C2=A0=C2=A0 18.970000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 2:98304
(159744 bytes left)
[=C2=A0=C2=A0 18.980000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
master node at LEB 2:98304
[=C2=A0=C2=A0 18.990000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 2:98816
(159232 bytes left)
[=C2=A0=C2=A0 19.000000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
padding node at LEB 2:98816
[=C2=A0=C2=A0 19.010000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): 3556=
 bytes
padded at LEB 2:98816, offset now 102400
[=C2=A0=C2=A0 19.020000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 2:102400
(155648 bytes left)
[=C2=A0=C2=A0 19.020000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
master node at LEB 2:102400
[=C2=A0=C2=A0 19.030000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 2:102912
(155136 bytes left)
[=C2=A0=C2=A0 19.040000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
padding node at LEB 2:102912
[=C2=A0=C2=A0 19.050000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): 3556=
 bytes
padded at LEB 2:102912, offset now 106496
[=C2=A0=C2=A0 19.060000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 2:106496
(151552 bytes left)
[=C2=A0=C2=A0 19.070000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
master node at LEB 2:106496
[=C2=A0=C2=A0 19.080000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 2:107008
(151040 bytes left)
[=C2=A0=C2=A0 19.080000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
padding node at LEB 2:107008
[=C2=A0=C2=A0 19.090000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): 3556=
 bytes
padded at LEB 2:107008, offset now 110592
[=C2=A0=C2=A0 19.100000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 2:110592
(147456 bytes left)
[=C2=A0=C2=A0 19.110000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
master node at LEB 2:110592
[=C2=A0=C2=A0 19.120000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 2:111104
(146944 bytes left)
[=C2=A0=C2=A0 19.130000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
padding node at LEB 2:111104
[=C2=A0=C2=A0 19.140000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): 3556=
 bytes
padded at LEB 2:111104, offset now 114688
[=C2=A0=C2=A0 19.150000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 2:114688
(143360 bytes left)
[=C2=A0=C2=A0 19.150000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
master node at LEB 2:114688
[=C2=A0=C2=A0 19.160000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 2:115200
(142848 bytes left)
[=C2=A0=C2=A0 19.170000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
padding node at LEB 2:115200
[=C2=A0=C2=A0 19.180000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): 3556=
 bytes
padded at LEB 2:115200, offset now 118784
[=C2=A0=C2=A0 19.190000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 2:118784
(139264 bytes left)
[=C2=A0=C2=A0 19.200000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
master node at LEB 2:118784
[=C2=A0=C2=A0 19.210000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 2:119296
(138752 bytes left)
[=C2=A0=C2=A0 19.210000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
padding node at LEB 2:119296
[=C2=A0=C2=A0 19.220000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): 3556=
 bytes
padded at LEB 2:119296, offset now 122880
[=C2=A0=C2=A0 19.230000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 2:122880
(135168 bytes left)
[=C2=A0=C2=A0 19.240000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): hit =
empty
space at LEB 2:122880
[=C2=A0=C2=A0 19.250000] ubifs_end_scan: UBIFS DBG scan (pid 81): stop sc=
anning
LEB 2 at offset 122880
[=C2=A0=C2=A0 19.260000] ubifs_read_node: UBIFS DBG io (pid 81): LEB 747:=
1792,
indexing node, length 68
[=C2=A0=C2=A0 19.270000] lpt_init_rd: UBIFS DBG lp (pid 81): space_bits 1=
5
[=C2=A0=C2=A0 19.270000] lpt_init_rd: UBIFS DBG lp (pid 81): lpt_lnum_bit=
s 2
[=C2=A0=C2=A0 19.280000] lpt_init_rd: UBIFS DBG lp (pid 81): lpt_offs_bit=
s 18
[=C2=A0=C2=A0 19.280000] lpt_init_rd: UBIFS DBG lp (pid 81): lpt_spc_bits=
 18
[=C2=A0=C2=A0 19.290000] lpt_init_rd: UBIFS DBG lp (pid 81): pcnt_bits 9
[=C2=A0=C2=A0 19.300000] lpt_init_rd: UBIFS DBG lp (pid 81): lnum_bits 11=

[=C2=A0=C2=A0 19.300000] lpt_init_rd: UBIFS DBG lp (pid 81): pnode_sz 18
[=C2=A0=C2=A0 19.310000] lpt_init_rd: UBIFS DBG lp (pid 81): nnode_sz 13
[=C2=A0=C2=A0 19.310000] lpt_init_rd: UBIFS DBG lp (pid 81): ltab_sz 12
[=C2=A0=C2=A0 19.320000] lpt_init_rd: UBIFS DBG lp (pid 81): lsave_sz 355=

[=C2=A0=C2=A0 19.320000] lpt_init_rd: UBIFS DBG lp (pid 81): lsave_cnt 25=
6
[=C2=A0=C2=A0 19.330000] lpt_init_rd: UBIFS DBG lp (pid 81): lpt_hght 5
[=C2=A0=C2=A0 19.340000] lpt_init_rd: UBIFS DBG lp (pid 81): big_lpt 0
[=C2=A0=C2=A0 19.340000] lpt_init_rd: UBIFS DBG lp (pid 81): LPT root is =
at 7:12497
[=C2=A0=C2=A0 19.350000] lpt_init_rd: UBIFS DBG lp (pid 81): LPT head is =
at 7:16384
[=C2=A0=C2=A0 19.350000] lpt_init_rd: UBIFS DBG lp (pid 81): LPT ltab is =
at 7:12288
[=C2=A0=C2=A0 19.360000] ubifs_write_node: UBIFS DBG io (pid 81): LEB 1:1=
22880,
master node, length 512 (aligned 4096)
[=C2=A0=C2=A0 19.370000] ubifs_write_node: UBIFS DBG io (pid 81): LEB 2:1=
22880,
master node, length 512 (aligned 4096)
[=C2=A0=C2=A0 19.380000] ubifs_add_lpt_dirt: UBIFS DBG lp (pid 81): LEB 7=
 add 13
to 16017
[=C2=A0=C2=A0 19.390000] ubifs_add_lpt_dirt: UBIFS DBG lp (pid 81): LEB 7=
 add 12
to 16030
[=C2=A0=C2=A0 19.400000] ubifs_add_lpt_dirt: UBIFS DBG lp (pid 81): LEB 7=
 add 13
to 16042
[=C2=A0=C2=A0 19.400000] ubifs_add_lpt_dirt: UBIFS DBG lp (pid 81): LEB 7=
 add 13
to 16055
[=C2=A0=C2=A0 19.410000] ubifs_add_lpt_dirt: UBIFS DBG lp (pid 81): LEB 7=
 add 13
to 16068
[=C2=A0=C2=A0 19.420000] ubifs_add_lpt_dirt: UBIFS DBG lp (pid 81): LEB 7=
 add 13
to 16081
[=C2=A0=C2=A0 19.430000] ubifs_add_lpt_dirt: UBIFS DBG lp (pid 81): LEB 7=
 add 18
to 16094
[=C2=A0=C2=A0 19.430000] ubifs_lpt_lookup_dirty: UBIFS DBG lp (pid 81): L=
EB 1720,
free 0, dirty 250872, flags 34
[=C2=A0=C2=A0 19.440000] ubifs_change_lp: UBIFS DBG lp (pid 81): LEB 1720=
, free
-2147483647, dirty -2147483647, flags 50
[=C2=A0=C2=A0 19.450000] ubifs_lpt_lookup_dirty: UBIFS DBG lp (pid 81): L=
EB 1720,
free 0, dirty 250872, flags 34
[=C2=A0=C2=A0 19.460000] ubifs_replay_journal: UBIFS DBG mnt (pid 81): st=
art
replaying the journal
[=C2=A0=C2=A0 19.470000] replay_log_leb: UBIFS DBG mnt (pid 81): replay l=
og LEB 3:0
[=C2=A0=C2=A0 19.480000] ubifs_start_scan: UBIFS DBG scan (pid 81): scan =
LEB 3:0
[=C2=A0=C2=A0 19.540000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 3:0
(258048 bytes left)
[=C2=A0=C2=A0 19.540000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
commit start node at LEB 3:0
[=C2=A0=C2=A0 19.550000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 3:32
(258016 bytes left)
[=C2=A0=C2=A0 19.560000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
reference node at LEB 3:32
[=C2=A0=C2=A0 19.570000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 3:96
(257952 bytes left)
[=C2=A0=C2=A0 19.580000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
reference node at LEB 3:96
[=C2=A0=C2=A0 19.580000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 3:160
(257888 bytes left)
[=C2=A0=C2=A0 19.590000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): scan=
ning
padding node at LEB 3:160
[=C2=A0=C2=A0 19.600000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): 3908=
 bytes
padded at LEB 3:160, offset now 4096
[=C2=A0=C2=A0 19.610000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 3:4096
(253952 bytes left)
[=C2=A0=C2=A0 19.620000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): hit =
empty
space at LEB 3:4096
[=C2=A0=C2=A0 19.630000] ubifs_end_scan: UBIFS DBG scan (pid 81): stop sc=
anning
LEB 3 at offset 4096
[=C2=A0=C2=A0 19.630000] replay_log_leb: UBIFS DBG mnt (pid 81): commit s=
tart
sqnum 48183645
[=C2=A0=C2=A0 19.640000] add_replay_bud: UBIFS DBG mnt (pid 81): add repl=
ay bud
LEB 644:208896, head 0
[=C2=A0=C2=A0 19.650000] ubifs_add_bud: UBIFS DBG log (pid 81): LEB 644:2=
08896,
jhead 0 (GC), bud_bytes 49152
[=C2=A0=C2=A0 19.660000] add_replay_bud: UBIFS DBG mnt (pid 81): add repl=
ay bud
LEB 926:36864, head 1
[=C2=A0=C2=A0 19.670000] ubifs_add_bud: UBIFS DBG log (pid 81): LEB 926:3=
6864,
jhead 1 (base), bud_bytes 270336
[=C2=A0=C2=A0 19.680000] replay_log_leb: UBIFS DBG mnt (pid 81): replay l=
og LEB 4:0
[=C2=A0=C2=A0 19.680000] ubifs_start_scan: UBIFS DBG scan (pid 81): scan =
LEB 4:0
[=C2=A0=C2=A0 19.690000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=
 4:0
(258048 bytes left)
[=C2=A0=C2=A0 19.700000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): hit =
empty
space at LEB 4:0
[=C2=A0=C2=A0 19.700000] ubifs_end_scan: UBIFS DBG scan (pid 81): stop sc=
anning
LEB 4 at offset 0
[=C2=A0=C2=A0 19.710000] replay_bud: UBIFS DBG mnt (pid 81): replay bud L=
EB 644,
head 0, offs 208896, is_last 1
[=C2=A0=C2=A0 19.720000] ubifs_start_scan: UBIFS DBG scan (pid 81): scan =
LEB
644:208896
[=C2=A0=C2=A0 19.740000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=

644:208896 (49152 bytes left)
[=C2=A0=C2=A0 19.750000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): hit =
empty
space at LEB 644:208896
[=C2=A0=C2=A0 19.760000] ubifs_end_scan: UBIFS DBG scan (pid 81): stop sc=
anning
LEB 644 at offset 208896
[=C2=A0=C2=A0 19.760000] replay_bud: UBIFS DBG mnt (pid 81): bud LEB 644 =
replied:
dirty 0, free 49152
[=C2=A0=C2=A0 19.770000] replay_bud: UBIFS DBG mnt (pid 81): replay bud L=
EB 926,
head 1, offs 36864, is_last 1
[=C2=A0=C2=A0 19.780000] ubifs_start_scan: UBIFS DBG scan (pid 81): scan =
LEB 926:36864
[=C2=A0=C2=A0 19.830000] ubifs_scan: UBIFS DBG scan (pid 81): look at LEB=

926:36864 (221184 bytes left)
[=C2=A0=C2=A0 19.840000] ubifs_scan_a_node: UBIFS DBG scan (pid 81): hit =
empty
space at LEB 926:36864
[=C2=A0=C2=A0 19.850000] ubifs_end_scan: UBIFS DBG scan (pid 81): stop sc=
anning
LEB 926 at offset 36864
[=C2=A0=C2=A0 19.860000] replay_bud: UBIFS DBG mnt (pid 81): bud LEB 926 =
replied:
dirty 0, free 221184
[=C2=A0=C2=A0 19.870000] ubifs_add_lpt_dirt: UBIFS DBG lp (pid 81): LEB 7=
 add 13
to 16112
[=C2=A0=C2=A0 19.880000] ubifs_add_lpt_dirt: UBIFS DBG lp (pid 81): LEB 7=
 add 13
to 16125
[=C2=A0=C2=A0 19.880000] ubifs_add_lpt_dirt: UBIFS DBG lp (pid 81): LEB 7=
 add 13
to 16138
[=C2=A0=C2=A0 19.890000] ubifs_add_lpt_dirt: UBIFS DBG lp (pid 81): LEB 7=
 add 13
to 16151
[=C2=A0=C2=A0 19.900000] ubifs_add_lpt_dirt: UBIFS DBG lp (pid 81): LEB 7=
 add 18
to 16164
[=C2=A0=C2=A0 19.910000] ubifs_lpt_lookup_dirty: UBIFS DBG lp (pid 81): L=
EB 644,
free 49152, dirty 136656, flags 1
[=C2=A0=C2=A0 19.910000] ubifs_change_lp: UBIFS DBG lp (pid 81): LEB 644,=
 free
49152, dirty 136656, flags 17
[=C2=A0=C2=A0 19.920000] ubifs_lpt_lookup_dirty: UBIFS DBG lp (pid 81): L=
EB 644,
free 49152, dirty 136656, flags 1
[=C2=A0=C2=A0 19.930000] ubifs_wbuf_seek_nolock: UBIFS DBG io (pid 81): L=
EB
644:208896, jhead 0 (GC)
[=C2=A0=C2=A0 19.940000] ubifs_add_lpt_dirt: UBIFS DBG lp (pid 81): LEB 7=
 add 13
to 16182
[=C2=A0=C2=A0 19.950000] ubifs_add_lpt_dirt: UBIFS DBG lp (pid 81): LEB 7=
 add 13
to 16195
[=C2=A0=C2=A0 19.960000] ubifs_add_lpt_dirt: UBIFS DBG lp (pid 81): LEB 7=
 add 13
to 16208
[=C2=A0=C2=A0 19.960000] ubifs_add_lpt_dirt: UBIFS DBG lp (pid 81): LEB 7=
 add 18
to 16221
[=C2=A0=C2=A0 19.970000] ubifs_lpt_lookup_dirty: UBIFS DBG lp (pid 81): L=
EB 926,
free 221184, dirty 35560, flags 3
[=C2=A0=C2=A0 19.980000] ubifs_change_lp: UBIFS DBG lp (pid 81): LEB 926,=
 free
221184, dirty 35560, flags 19
[=C2=A0=C2=A0 19.990000] ubifs_lpt_lookup_dirty: UBIFS DBG lp (pid 81): L=
EB 926,
free 221184, dirty 35560, flags 3
[=C2=A0=C2=A0 20.000000] ubifs_wbuf_seek_nolock: UBIFS DBG io (pid 81): L=
EB
926:36864, jhead 1 (base)
[=C2=A0=C2=A0 20.010000] ubifs_replay_journal: UBIFS DBG mnt (pid 81): fi=
nished,
log head LEB 3:4096, max_sqnum 48183652, highest_inum 252
[=C2=A0=C2=A0 20.020000] ubifs_lpt_lookup_dirty: UBIFS DBG lp (pid 81): L=
EB 643,
free 258048, dirty 0, flags 4
[=C2=A0=C2=A0 20.030000] ubifs_change_lp: UBIFS DBG lp (pid 81): LEB 643,=
 free
258048, dirty 0, flags 20
[=C2=A0=C2=A0 20.030000] ubifs_lpt_lookup_dirty: UBIFS DBG lp (pid 81): L=
EB 643,
free 258048, dirty 0, flags 4
[=C2=A0=C2=A0 20.040000] UBIFS (ubi0:0): UBIFS: mounted UBI device 0, vol=
ume 0,
name "root"
[=C2=A0=C2=A0 20.050000] UBIFS (ubi0:0): LEB size: 258048 bytes (252 KiB)=
,
min./max. I/O unit sizes: 4096 bytes/4096 bytes
[=C2=A0=C2=A0 20.060000] UBIFS (ubi0:0): FS size: 493903872 bytes (471 Mi=
B, 1914
LEBs), journal size 9420800 bytes (8 MiB, 37 LEBs)
[=C2=A0=C2=A0 20.070000] UBIFS (ubi0:0): reserved for root: 0 bytes (0 Ki=
B)
[=C2=A0=C2=A0 20.080000] UBIFS (ubi0:0): media format: w4/r0 (latest is w=
4/r0),
UUID 9B699AB7-D22F-4714-9879-DD0E1E577BF6, small LPT model
[=C2=A0=C2=A0 20.090000] mount_ubifs: UBIFS DBG gen (pid 81): default com=
pressor:=C2=A0 lzo
[=C2=A0=C2=A0 20.100000] mount_ubifs: UBIFS DBG gen (pid 81): data journa=
l heads:=C2=A0 1
[=C2=A0=C2=A0 20.100000] mount_ubifs: UBIFS DBG gen (pid 81): log LEBs:=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
4 (3 - 6)
[=C2=A0=C2=A0 20.110000] mount_ubifs: UBIFS DBG gen (pid 81): LPT area LE=
Bs:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
2 (7 - 8)
[=C2=A0=C2=A0 20.120000] mount_ubifs: UBIFS DBG gen (pid 81): orphan area=
 LEBs:=C2=A0=C2=A0=C2=A0
1 (9 - 9)
[=C2=A0=C2=A0 20.120000] mount_ubifs: UBIFS DBG gen (pid 81): main area L=
EBs:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
1914 (10 - 1923)
[=C2=A0=C2=A0 20.130000] mount_ubifs: UBIFS DBG gen (pid 81): index LEBs:=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 59
[=C2=A0=C2=A0 20.140000] mount_ubifs: UBIFS DBG gen (pid 81): total index=
 bytes:=C2=A0=C2=A0
1240624 (1211 KiB, 1 MiB)
[=C2=A0=C2=A0 20.150000] mount_ubifs: UBIFS DBG gen (pid 81): key hash ty=
pe:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0
[=C2=A0=C2=A0 20.150000] mount_ubifs: UBIFS DBG gen (pid 81): tree fanout=
:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 8
[=C2=A0=C2=A0 20.160000] mount_ubifs: UBIFS DBG gen (pid 81): reserved GC=
 LEB:=C2=A0=C2=A0=C2=A0=C2=A0 643
[=C2=A0=C2=A0 20.170000] mount_ubifs: UBIFS DBG gen (pid 81): max. znode =
size=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 240
[=C2=A0=C2=A0 20.170000] mount_ubifs: UBIFS DBG gen (pid 81): max. index =
node size 192
[=C2=A0=C2=A0 20.180000] mount_ubifs: UBIFS DBG gen (pid 81): node sizes:=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
data 48, inode 160, dentry 56
[=C2=A0=C2=A0 20.190000] mount_ubifs: UBIFS DBG gen (pid 81): node sizes:=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
trun 56, sb 4096, master 512
[=C2=A0=C2=A0 20.200000] mount_ubifs: UBIFS DBG gen (pid 81): node sizes:=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
ref 64, cmt. start 32, orph 32
[=C2=A0=C2=A0 20.210000] mount_ubifs: UBIFS DBG gen (pid 81): max. node s=
izes:=C2=A0=C2=A0=C2=A0=C2=A0
data 4144, inode 4256 dentry 312, idx 188
[=C2=A0=C2=A0 20.220000] mount_ubifs: UBIFS DBG gen (pid 81): dead waterm=
ark:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
4096
[=C2=A0=C2=A0 20.230000] mount_ubifs: UBIFS DBG gen (pid 81): dark waterm=
ark:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
8192
[=C2=A0=C2=A0 20.230000] mount_ubifs: UBIFS DBG gen (pid 81): LEB overhea=
d:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
1120
[=C2=A0=C2=A0 20.240000] mount_ubifs: UBIFS DBG gen (pid 81): max. dark s=
pace:=C2=A0=C2=A0=C2=A0=C2=A0
15679488 (15312 KiB, 14 MiB)
[=C2=A0=C2=A0 20.250000] mount_ubifs: UBIFS DBG gen (pid 81): maximum bud=
 bytes:=C2=A0=C2=A0
8388608 (8192 KiB, 8 MiB)
[=C2=A0=C2=A0 20.260000] mount_ubifs: UBIFS DBG gen (pid 81): BG commit b=
ud bytes:
6815744 (6656 KiB, 6 MiB)
[=C2=A0=C2=A0 20.270000] mount_ubifs: UBIFS DBG gen (pid 81): current bud=
 bytes=C2=A0=C2=A0=C2=A0
270336 (264 KiB, 0 MiB)
[=C2=A0=C2=A0 20.270000] mount_ubifs: UBIFS DBG gen (pid 81): max. seq. n=
umber:=C2=A0=C2=A0=C2=A0
48183652
[=C2=A0=C2=A0 20.280000] mount_ubifs: UBIFS DBG gen (pid 81): commit numb=
er:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
29060
[=C2=A0=C2=A0 20.290000] ubifs_iget: UBIFS DBG gen (pid 81): inode 1
[=C2=A0=C2=A0 20.290000] ubifs_lookup_level0: UBIFS DBG tnc (pid 81): sea=
rch key
(1, inode)
[=C2=A0=C2=A0 20.300000] ubifs_read_node: UBIFS DBG io (pid 81): LEB 747:=
1792,
indexing node, length 68
[=C2=A0=C2=A0 20.310000] read_znode: UBIFS DBG tnc (pid 81): LEB 747:1792=
, level
5, 2 branch
[=C2=A0=C2=A0 20.320000] ubifs_read_node: UBIFS DBG io (pid 81): LEB 624:=
656,
indexing node, length 188
[=C2=A0=C2=A0 20.330000] read_znode: UBIFS DBG tnc (pid 81): LEB 624:656,=
 level 4,
8 branch
[=C2=A0=C2=A0 20.330000] ubifs_read_node: UBIFS DBG io (pid 81): LEB 624:=
464,
indexing node, length 188
[=C2=A0=C2=A0 20.340000] read_znode: UBIFS DBG tnc (pid 81): LEB 624:464,=
 level 3,
8 branch
[=C2=A0=C2=A0 20.350000] ubifs_read_node: UBIFS DBG io (pid 81): LEB 624:=
352,
indexing node, length 108
[=C2=A0=C2=A0 20.360000] read_znode: UBIFS DBG tnc (pid 81): LEB 624:352,=
 level 2,
4 branch
[=C2=A0=C2=A0 20.370000] ubifs_read_node: UBIFS DBG io (pid 81): LEB 624:=
224,
indexing node, length 128
[=C2=A0=C2=A0 20.370000] read_znode: UBIFS DBG tnc (pid 81): LEB 624:224,=
 level 1,
5 branch
[=C2=A0=C2=A0 20.380000] ubifs_read_node: UBIFS DBG io (pid 81): LEB 624:=
112,
indexing node, length 108
[=C2=A0=C2=A0 20.390000] read_znode: UBIFS DBG tnc (pid 81): LEB 624:112,=
 level 0,
4 branch
[=C2=A0=C2=A0 20.400000] ubifs_lookup_level0: UBIFS DBG tnc (pid 81): fou=
nd 1, lvl
0, n 0
[=C2=A0=C2=A0 20.400000] ubifs_read_node_wbuf: UBIFS DBG io (pid 81): LEB=

926:8416, inode node, length 160, jhead 1 (base)
[=C2=A0=C2=A0 20.410000] ubifs_read_node: UBIFS DBG io (pid 81): LEB 926:=
8416,
inode node, length 160
/ # [=C2=A0=C2=A0 22.140000] watchdog watchdog0: watchdog did not stop!
[=C2=A0=C2=A0 27.150000] watchdog watchdog0: watchdog did not stop!
[=C2=A0=C2=A0 32.160000] watchdog watchdog0: watchdog did not stop!
/ # dmesg | grep UBI | grep -v DBG
[=C2=A0=C2=A0 16.510000] UBIFS (ubi0:0): background thread "ubifs_bgt0_0"=
 started,
PID 82
[=C2=A0=C2=A0 20.040000] UBIFS (ubi0:0): UBIFS: mounted UBI device 0, vol=
ume 0,
name "root"
[=C2=A0=C2=A0 20.050000] UBIFS (ubi0:0): LEB size: 258048 bytes (252 KiB)=
,
min./max. I/O unit sizes: 4096 bytes/4096 bytes
[=C2=A0=C2=A0 20.060000] UBIFS (ubi0:0): FS size: 493903872 bytes (471 Mi=
B, 1914
LEBs), journal size 9420800 bytes (8 MiB, 37 LEBs)
[=C2=A0=C2=A0 20.070000] UBIFS (ubi0:0): reserved for root: 0 bytes (0 Ki=
B)
[=C2=A0=C2=A0 20.080000] UBIFS (ubi0:0): media format: w4/r0 (latest is w=
4/r0),
UUID 9B699AB7-D22F-4714-9879-DD0E1E577BF6, small LPT model
/ # [=C2=A0=C2=A0 37.170000] watchdog watchdog0: watchdog did not stop!
[=C2=A0=C2=A0 42.180000] watchdog watchdog0: watchdog did not stop!
[=C2=A0=C2=A0 47.190000] watchdog watchdog0: watchdog did not stop!
[=C2=A0=C2=A0 52.200000] watchdog watchdog0: watchdog did not stop!
[snip] only 5s apart watchdog messages
[=C2=A0 132.350000] watchdog watchdog0: watchdog did not stop!

/ #
/ # dd if=3D/dev/urandom of=3D/mnt/images/test/urandom_1k bs=3D1k count=3D=
1
[=C2=A0 135.830000] ubifs_lookup: UBIFS DBG gen (pid 110): 'test' in dir =
ino 1
[=C2=A0 135.840000] ubifs_lookup_level0: UBIFS DBG tnc (pid 110): search =
key
(1, direntry, 0x1c4ddc5)
[=C2=A0 135.850000] ubifs_lookup_level0: UBIFS DBG tnc (pid 110): found 1=
,
lvl 0, n 3
[=C2=A0 135.850000] ubifs_read_node_wbuf: UBIFS DBG io (pid 110): LEB
926:8192, direntry node, length 61, jhead 1 (base)
[=C2=A0 135.860000] ubifs_read_node: UBIFS DBG io (pid 110): LEB 926:8192=
,
direntry node, length 61
[=C2=A0 135.870000] ubifs_iget: UBIFS DBG gen (pid 110): inode 249
[=C2=A0 135.880000] ubifs_lookup_level0: UBIFS DBG tnc (pid 110): search =
key
(249, inode)
[=C2=A0 135.890000] ubifs_read_node: UBIFS DBG io (pid 110): LEB 747:1640=
,
indexing node, length 148
[=C2=A0 135.890000] read_znode: UBIFS DBG tnc (pid 110): LEB 747:1640, le=
vel
4, 6 branch
[=C2=A0 135.900000] ubifs_read_node: UBIFS DBG io (pid 110): LEB 747:1512=
,
indexing node, length 128
[=C2=A0 135.910000] read_znode: UBIFS DBG tnc (pid 110): LEB 747:1512, le=
vel
3, 5 branch
[=C2=A0 135.920000] ubifs_read_node: UBIFS DBG io (pid 110): LEB 747:1344=
,
indexing node, length 168
[=C2=A0 135.930000] read_znode: UBIFS DBG tnc (pid 110): LEB 747:1344, le=
vel
2, 7 branch
[=C2=A0 135.930000] ubifs_read_node: UBIFS DBG io (pid 110): LEB 747:464,=

indexing node, length 128
[=C2=A0 135.940000] read_znode: UBIFS DBG tnc (pid 110): LEB 747:464, lev=
el
1, 5 branch
[=C2=A0 135.950000] ubifs_read_node: UBIFS DBG io (pid 110): LEB 747:112,=

indexing node, length 108
[=C2=A0 135.960000] read_znode: UBIFS DBG tnc (pid 110): LEB 747:112, lev=
el
0, 4 branch
[=C2=A0 135.970000] ubifs_lookup_level0: UBIFS DBG tnc (pid 110): found 1=
,
lvl 0, n 2
[=C2=A0 135.970000] ubifs_read_node_wbuf: UBIFS DBG io (pid 110): LEB
926:28904, inode node, length 160, jhead 1 (base)
[=C2=A0 135.980000] ubifs_read_node: UBIFS DBG io (pid 110): LEB 926:2890=
4,
inode node, length 160
[=C2=A0 135.990000] ubifs_lookup: UBIFS DBG gen (pid 110): 'urandom_1k' i=
n
dir ino 249
[=C2=A0 136.000000] ubifs_lookup_level0: UBIFS DBG tnc (pid 110): search =
key
(249, direntry, 0x101b358e)
[=C2=A0 136.010000] ubifs_read_node: UBIFS DBG io (pid 110): LEB 747:224,=

indexing node, length 108
[=C2=A0 136.020000] read_znode: UBIFS DBG tnc (pid 110): LEB 747:224, lev=
el
0, 4 branch
[=C2=A0 136.020000] ubifs_lookup_level0: UBIFS DBG tnc (pid 110): found 1=
,
lvl 0, n 0
[=C2=A0 136.030000] ubifs_read_node_wbuf: UBIFS DBG io (pid 110): LEB
926:12288, direntry node, length 67, jhead 1 (base)
[=C2=A0 136.040000] ubifs_read_node: UBIFS DBG io (pid 110): LEB 926:1228=
8,
direntry node, length 67
[=C2=A0 136.050000] ubifs_iget: UBIFS DBG gen (pid 110): inode 250
[=C2=A0 136.060000] ubifs_lookup_level0: UBIFS DBG tnc (pid 110): search =
key
(250, inode)
[=C2=A0 136.060000] ubifs_lookup_level0: UBIFS DBG tnc (pid 110): found 1=
,
lvl 0, n 2
[=C2=A0 136.070000] ubifs_read_node_wbuf: UBIFS DBG io (pid 110): LEB
926:16384, inode node, length 160, jhead 1 (base)
[=C2=A0 136.080000] ubifs_read_node: UBIFS DBG io (pid 110): LEB 926:1638=
4,
inode node, length 160
[=C2=A0 136.090000] ubifs_getxattr: UBIFS DBG gen (pid 110): xattr
'security.capability', ino 250 ('urandom_1k'), buf size 0
[=C2=A0 136.100000] ubifs_lookup_level0: UBIFS DBG tnc (pid 110): search =
key
(250, xentry, 0x10888ae6)
[=C2=A0 136.110000] ubifs_lookup_level0: UBIFS DBG tnc (pid 110): found 0=
,
lvl 0, n 3
[=C2=A0 136.120000] ubifs_setattr: UBIFS DBG gen (pid 110): ino 250, mode=

0x81a4, ia_valid 0xa068
[=C2=A0 136.120000] do_truncation: UBIFS DBG gen (pid 110): ino 250, size=

1024 -> 0
[=C2=A0 136.130000] ubifs_jnl_truncate: UBIFS DBG jnl (pid 110): ino 250,=

size 1024 -> 0
[=C2=A0 136.140000] write_head: UBIFS DBG jnl (pid 110): jhead 1 (base), =
LEB
926:36864, len 216
[=C2=A0 136.150000] ubifs_wbuf_write_nolock: UBIFS DBG io (pid 110): 216
bytes (inode node) to jhead 1 (base) wbuf at LEB 926:36864
[=C2=A0 136.160000] ubifs_lpt_lookup_dirty: UBIFS DBG lp (pid 110): LEB 9=
26,
free 221184, dirty 35560, flags 16
[=C2=A0 136.170000] ubifs_change_lp: UBIFS DBG lp (pid 110): LEB 926, fre=
e
220968, dirty 35560, flags 16
[=C2=A0 136.180000] ubifs_lpt_lookup_dirty: UBIFS DBG lp (pid 110): LEB 9=
26,
free 221184, dirty 35560, flags 16
[=C2=A0 136.190000] new_wbuf_timer_nolock: UBIFS DBG io (pid 110): set ti=
mer
for jhead 1 (base), 3000-5000 millisecs
[=C2=A0 136.200000] ubifs_tnc_add: UBIFS DBG tnc (pid 110): 926:36864, le=
n
160, key (250, inode)
[=C2=A0 136.200000] lookup_level0_dirty: UBIFS DBG tnc (pid 110): search =
and
dirty key (250, inode)
[=C2=A0 136.210000] ubifs_add_lpt_dirt: UBIFS DBG lp (pid 110): LEB 7 add=
 13
to 16239
[=C2=A0 136.220000] ubifs_add_lpt_dirt: UBIFS DBG lp (pid 110): LEB 7 add=
 13
to 16252
[=C2=A0 136.230000] ubifs_add_lpt_dirt: UBIFS DBG lp (pid 110): LEB 7 add=
 18
to 16265
[=C2=A0 136.240000] ubifs_lpt_lookup_dirty: UBIFS DBG lp (pid 110): LEB 7=
47,
free 45056, dirty 205576, flags 34
[=C2=A0 136.240000] ubifs_change_lp: UBIFS DBG lp (pid 110): LEB 747, fre=
e
-2147483647, dirty 205644, flags 34
[=C2=A0 136.250000] ubifs_lpt_lookup_dirty: UBIFS DBG lp (pid 110): LEB 7=
47,
free 45056, dirty 205576, flags 34
[=C2=A0 136.260000] ubifs_lpt_lookup_dirty: UBIFS DBG lp (pid 110): LEB 7=
47,
free 45056, dirty 205648, flags 34
[=C2=A0 136.270000] ubifs_change_lp: UBIFS DBG lp (pid 110): LEB 747, fre=
e
-2147483647, dirty 205796, flags 34
[=C2=A0 136.280000] ubifs_lpt_lookup_dirty: UBIFS DBG lp (pid 110): LEB 7=
47,
free 45056, dirty 205648, flags 34
[=C2=A0 136.290000] ubifs_lpt_lookup_dirty: UBIFS DBG lp (pid 110): LEB 7=
47,
free 45056, dirty 205800, flags 34
[=C2=A0 136.300000] ubifs_change_lp: UBIFS DBG lp (pid 110): LEB 747, fre=
e
-2147483647, dirty 205928, flags 34
[=C2=A0 136.310000] ubifs_lpt_lookup_dirty: UBIFS DBG lp (pid 110): LEB 7=
47,
free 45056, dirty 205800, flags 34
[=C2=A0 136.320000] ubifs_lpt_lookup_dirty: UBIFS DBG lp (pid 110): LEB 7=
47,
free 45056, dirty 205928, flags 34
[=C2=A0 136.330000] ubifs_change_lp: UBIFS DBG lp (pid 110): LEB 747, fre=
e
-2147483647, dirty 206096, flags 34
[=C2=A0 136.340000] ubifs_lpt_lookup_dirty: UBIFS DBG lp (pid 110): LEB 7=
47,
free 45056, dirty 205928, flags 34
[=C2=A0 136.350000] ubifs_lpt_lookup_dirty: UBIFS DBG lp (pid 110): LEB 7=
47,
free 45056, dirty 206096, flags 34
[=C2=A0 136.360000] ubifs_change_lp: UBIFS DBG lp (pid 110): LEB 747, fre=
e
-2147483647, dirty 206224, flags 34
[=C2=A0 136.370000] ubifs_lpt_lookup_dirty: UBIFS DBG lp (pid 110): LEB 7=
47,
free 45056, dirty 206096, flags 34
[=C2=A0 136.380000] ubifs_lpt_lookup_dirty: UBIFS DBG lp (pid 110): LEB 7=
47,
free 45056, dirty 206224, flags 34
[=C2=A0 136.390000] ubifs_change_lp: UBIFS DBG lp (pid 110): LEB 747, fre=
e
-2147483647, dirty 206332, flags 34
[=C2=A0 136.400000] ubifs_lpt_lookup_dirty: UBIFS DBG lp (pid 110): LEB 7=
47,
free 45056, dirty 206224, flags 34
[=C2=A0 136.400000] lookup_level0_dirty: UBIFS DBG tnc (pid 110): found 1=
,
lvl 0, n 2
[=C2=A0 136.410000] ubifs_lpt_lookup_dirty: UBIFS DBG lp (pid 110): LEB 9=
26,
free 220968, dirty 35560, flags 16
[=C2=A0 136.420000] ubifs_change_lp: UBIFS DBG lp (pid 110): LEB 926, fre=
e
-2147483647, dirty 35720, flags 16
[=C2=A0 136.430000] ubifs_lpt_lookup_dirty: UBIFS DBG lp (pid 110): LEB 9=
26,
free 220968, dirty 35560, flags 16
[=C2=A0 136.440000] ubifs_lpt_lookup_dirty: UBIFS DBG lp (pid 110): LEB 9=
26,
free 220968, dirty 35720, flags 16
[=C2=A0 136.450000] ubifs_change_lp: UBIFS DBG lp (pid 110): LEB 926, fre=
e
-2147483647, dirty 35776, flags 16
[=C2=A0 136.460000] ubifs_lpt_lookup_dirty: UBIFS DBG lp (pid 110): LEB 9=
26,
free 220968, dirty 35720, flags 16
[=C2=A0 136.470000] ubifs_lookup_level0: UBIFS DBG tnc (pid 110): search =
key
(250, data, 0)
[=C2=A0 136.480000] ubifs_lookup_level0: UBIFS DBG tnc (pid 110): found 1=
,
lvl 0, n 3
[=C2=A0 136.480000] tnc_delete: UBIFS DBG tnc (pid 110): deleting key (25=
0,
data, 0)
[=C2=A0 136.490000] ubifs_add_lpt_dirt: UBIFS DBG lp (pid 110): LEB 7 add=
 13
to 16283
[=C2=A0 136.500000] ubifs_add_lpt_dirt: UBIFS DBG lp (pid 110): LEB 7 add=
 13
to 16296
[=C2=A0 136.510000] ubifs_add_lpt_dirt: UBIFS DBG lp (pid 110): LEB 7 add=
 13
to 16309
[=C2=A0 136.510000] ubifs_add_lpt_dirt: UBIFS DBG lp (pid 110): LEB 7 add=
 18
to 16322
[=C2=A0 136.520000] ubifs_lpt_lookup_dirty: UBIFS DBG lp (pid 110): LEB 1=
111,
free 0, dirty 8280, flags 1
[=C2=A0 136.530000] ubifs_change_lp: UBIFS DBG lp (pid 110): LEB 1111, fr=
ee
-2147483647, dirty 9352, flags 1
[=C2=A0 136.540000] ubifs_lpt_lookup_dirty: UBIFS DBG lp (pid 110): LEB 1=
111,
free 0, dirty 8280, flags 1
[=C2=A0 136.550000] ubifs_lookup_level0: UBIFS DBG tnc (pid 110): search =
key
(250, data, 0)
[=C2=A0 136.550000] ubifs_lookup_level0: UBIFS DBG tnc (pid 110): found 0=
,
lvl 0, n 2
[=C2=A0 136.560000] ubifs_read_node: UBIFS DBG io (pid 110): LEB 747:336,=

indexing node, length 128
[=C2=A0 136.570000] read_znode: UBIFS DBG tnc (pid 110): LEB 747:336, lev=
el
0, 5 branch
[=C2=A0 136.580000] ubifs_getxattr: UBIFS DBG gen (pid 110): xattr
'security.capability', ino 250 ('urandom_1k'), buf size 0
[=C2=A0 136.590000] ubifs_lookup_level0: UBIFS DBG tnc (pid 110): search =
key
(250, xentry, 0x10888ae6)
[=C2=A0 136.600000] ubifs_lookup_level0: UBIFS DBG tnc (pid 110): found 0=
,
lvl 0, n 2
[=C2=A0 136.600000] do_readpage: UBIFS DBG gen (pid 110): ino 250, pg 0,
i_size 0, flags 0x5
[=C2=A0 136.610000] ubifs_write_end: UBIFS DBG gen (pid 110): ino 250, po=
s 0,
pg 0, len 1024, copied 1024, i_size 0
[=C2=A0 136.620000] ubifs_dirty_inode: UBIFS DBG gen (pid 110): inode 250=

1+0 records in
1+0 records out
/ # [=C2=A0 137.360000] watchdog watchdog0: watchdog did not stop!
[=C2=A0 141.040000] wbuf_timer_callback_nolock: UBIFS DBG io (pid 0): jhe=
ad 1
(base)
[=C2=A0 141.040000] ubifs_bg_wbufs_sync: UBIFS DBG io (pid 82): synchroni=
ze
[=C2=A0 141.050000] ubifs_wbuf_sync_nolock: UBIFS DBG io (pid 82): LEB
926:36864, 216 bytes, jhead 1 (base)
[=C2=A0 141.060000] ubifs_lpt_lookup_dirty: UBIFS DBG lp (pid 82): LEB 92=
6,
free 220968, dirty 35776, flags 16
[=C2=A0 141.070000] ubifs_change_lp: UBIFS DBG lp (pid 82): LEB 926, free=

217088, dirty 39656, flags 16
[=C2=A0 141.080000] ubifs_lpt_lookup_dirty: UBIFS DBG lp (pid 82): LEB 92=
6,
free 220968, dirty 35776, flags 16
[=C2=A0 142.370000] watchdog watchdog0: watchdog did not stop!
[=C2=A0 147.380000] watchdog watchdog0: watchdog did not stop!
[=C2=A0 152.390000] watchdog watchdog0: watchdog did not stop!
[=C2=A0 157.390000] watchdog watchdog0: watchdog did not stop!
[=C2=A0 162.400000] watchdog watchdog0: watchdog did not stop!
[=C2=A0 166.680000] ubifs_writepage: UBIFS DBG gen (pid 59): ino 250, pg =
0,
pg flags 0x92d
[=C2=A0 166.680000] ubifs_write_inode: UBIFS DBG gen (pid 59): inode 250,=

mode 0x81a4, nlink 1
[=C2=A0 166.690000] ubifs_jnl_write_inode: UBIFS DBG jnl (pid 59): ino 25=
0,
nlink 1
[=C2=A0 166.700000] write_head: UBIFS DBG jnl (pid 59): jhead 1 (base), L=
EB
926:40960, len 160
[=C2=A0 166.710000] ubifs_wbuf_write_nolock: UBIFS DBG io (pid 59): 160 b=
ytes
(inode node) to jhead 1 (base) wbuf at LEB 926:40960
[=C2=A0 166.720000] ubifs_lpt_lookup_dirty: UBIFS DBG lp (pid 59): LEB 92=
6,
free 217088, dirty 39656, flags 16
[=C2=A0 166.730000] ubifs_change_lp: UBIFS DBG lp (pid 59): LEB 926, free=

216928, dirty 39656, flags 16
[=C2=A0 166.730000] ubifs_lpt_lookup_dirty: UBIFS DBG lp (pid 59): LEB 92=
6,
free 217088, dirty 39656, flags 16
[=C2=A0 166.740000] new_wbuf_timer_nolock: UBIFS DBG io (pid 59): set tim=
er
for jhead 1 (base), 3000-5000 millisecs
[=C2=A0 166.750000] ubifs_tnc_add: UBIFS DBG tnc (pid 59): 926:40960, len=

160, key (250, inode)
[=C2=A0 166.760000] lookup_level0_dirty: UBIFS DBG tnc (pid 59): search a=
nd
dirty key (250, inode)
[=C2=A0 166.770000] lookup_level0_dirty: UBIFS DBG tnc (pid 59): found 1,=
 lvl
0, n 2
[=C2=A0 166.780000] ubifs_lpt_lookup_dirty: UBIFS DBG lp (pid 59): LEB 92=
6,
free 216928, dirty 39656, flags 16
[=C2=A0 166.790000] ubifs_change_lp: UBIFS DBG lp (pid 59): LEB 926, free=

-2147483647, dirty 39816, flags 16
[=C2=A0 166.800000] ubifs_lpt_lookup_dirty: UBIFS DBG lp (pid 59): LEB 92=
6,
free 216928, dirty 39656, flags 16
[=C2=A0 166.810000] ubifs_jnl_write_data: UBIFS DBG jnl (pid 59): ino 250=
,
blk 0, len 1024, key (250, data, 0)
[=C2=A0 166.810000] ubifs_find_free_space: UBIFS DBG find (pid 59): min_s=
pace
1072
[=C2=A0 167.170000] reserve_space: UBIFS DBG jnl (pid 59): no free space =
in
jhead 2 (data), run GC
[=C2=A0 167.180000] ubifs_gc_should_commit: UBIFS DBG cmt (pid 59): commi=
t
not requested
[=C2=A0 167.180000] ubifs_gc_should_commit: UBIFS DBG cmt (pid 59): commi=
t
not requested
[=C2=A0 167.190000] ubifs_find_dirty_leb: UBIFS DBG find (pid 59): found =
LEB
1682, free 0, dirty 253904, flags 0x1
[=C2=A0 167.200000] ubifs_change_lp: UBIFS DBG lp (pid 59): LEB 1682, fre=
e
-2147483647, dirty -2147483647, flags 17
[=C2=A0 167.210000] ubifs_add_lpt_dirt: UBIFS DBG lp (pid 59): LEB 8 add =
13
to 247688
[=C2=A0 167.220000] ubifs_add_lpt_dirt: UBIFS DBG lp (pid 59): LEB 8 add =
18
to 247701
[=C2=A0 167.220000] ubifs_lpt_lookup_dirty: UBIFS DBG lp (pid 59): LEB 16=
82,
free 0, dirty 253904, flags 1
[=C2=A0 167.230000] ubifs_garbage_collect: UBIFS DBG gc (pid 59): found L=
EB
1682: free 0, dirty 253904, sum 253904 (min. space 4096)
[=C2=A0 167.240000] ubifs_start_scan: UBIFS DBG scan (pid 59): scan LEB 1=
682:0
[=C2=A0 167.300000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB 1682=
:0
(258048 bytes left)
[=C2=A0 167.310000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning =
data
node at LEB 1682:0
[=C2=A0 167.320000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB 1682=
:424
(257624 bytes left)
[=C2=A0 167.330000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning
padding node at LEB 1682:424
[=C2=A0 167.340000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): 3644 byte=
s
padded at LEB 1682:424, offset now 4096
[=C2=A0 167.350000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:4096 (253952 bytes left)
[=C2=A0 167.360000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning =
data
node at LEB 1682:4096
[=C2=A0 167.360000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:5080 (252968 bytes left)
[=C2=A0 167.370000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning
padding node at LEB 1682:5080
[=C2=A0 167.380000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): 3084 byte=
s
padded at LEB 1682:5080, offset now 8192
[=C2=A0 167.390000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:8192 (249856 bytes left)
[=C2=A0 167.400000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning =
data
node at LEB 1682:8192
[=C2=A0 167.410000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:9704 (248344 bytes left)
[=C2=A0 167.420000] watchdog watchdog0: watchdog did not stop!
[=C2=A0 167.430000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning
padding node at LEB 1682:9704
[=C2=A0 167.430000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): 2556 byte=
s
padded at LEB 1682:9704, offset now 12288
[=C2=A0 167.440000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:12288 (245760 bytes left)
[=C2=A0 167.450000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning =
data
node at LEB 1682:12288
[=C2=A0 167.460000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:12856 (245192 bytes left)
[=C2=A0 167.470000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning
padding node at LEB 1682:12856
[=C2=A0 167.480000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): 3500 byte=
s
padded at LEB 1682:12856, offset now 16384
[=C2=A0 167.490000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:16384 (241664 bytes left)
[=C2=A0 167.500000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning =
data
node at LEB 1682:16384
[=C2=A0 167.510000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:16928 (241120 bytes left)
[=C2=A0 167.510000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning
padding node at LEB 1682:16928
[=C2=A0 167.520000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): 3524 byte=
s
padded at LEB 1682:16928, offset now 20480
[=C2=A0 167.530000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:20480 (237568 bytes left)
[=C2=A0 167.540000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning =
data
node at LEB 1682:20480
[=C2=A0 167.550000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:21096 (236952 bytes left)
[=C2=A0 167.560000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning
padding node at LEB 1682:21096
[=C2=A0 167.570000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): 3452 byte=
s
padded at LEB 1682:21096, offset now 24576
[=C2=A0 167.580000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:24576 (233472 bytes left)
[=C2=A0 167.580000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning =
data
node at LEB 1682:24576
[=C2=A0 167.590000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:24912 (233136 bytes left)
[=C2=A0 167.600000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning
padding node at LEB 1682:24912
[=C2=A0 167.610000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): 3732 byte=
s
padded at LEB 1682:24912, offset now 28672
[=C2=A0 167.620000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:28672 (229376 bytes left)
[=C2=A0 167.630000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning =
data
node at LEB 1682:28672
[=C2=A0 167.640000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:29952 (228096 bytes left)
[=C2=A0 167.650000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning
padding node at LEB 1682:29952
[=C2=A0 167.650000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): 2788 byte=
s
padded at LEB 1682:29952, offset now 32768
[=C2=A0 167.660000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:32768 (225280 bytes left)
[=C2=A0 167.670000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning =
data
node at LEB 1682:32768
[=C2=A0 167.680000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:34560 (223488 bytes left)
[=C2=A0 167.690000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning
padding node at LEB 1682:34560
[=C2=A0 167.700000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): 2276 byte=
s
padded at LEB 1682:34560, offset now 36864
[=C2=A0 167.710000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:36864 (221184 bytes left)
[=C2=A0 167.720000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning =
data
node at LEB 1682:36864
[=C2=A0 167.730000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:38152 (219896 bytes left)
[=C2=A0 167.730000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning
padding node at LEB 1682:38152
[=C2=A0 167.740000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): 2780 byte=
s
padded at LEB 1682:38152, offset now 40960
[=C2=A0 167.750000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:40960 (217088 bytes left)
[=C2=A0 167.760000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning =
data
node at LEB 1682:40960
[=C2=A0 167.770000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:41632 (216416 bytes left)
[=C2=A0 167.780000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning
padding node at LEB 1682:41632
[=C2=A0 167.790000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): 3396 byte=
s
padded at LEB 1682:41632, offset now 45056
[=C2=A0 167.800000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:45056 (212992 bytes left)
[=C2=A0 167.800000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning =
data
node at LEB 1682:45056
[=C2=A0 167.810000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:45680 (212368 bytes left)
[=C2=A0 167.820000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning
padding node at LEB 1682:45680
[=C2=A0 167.830000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): 3444 byte=
s
padded at LEB 1682:45680, offset now 49152
[=C2=A0 167.840000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:49152 (208896 bytes left)
[=C2=A0 167.850000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning =
data
node at LEB 1682:49152
[=C2=A0 167.860000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:49744 (208304 bytes left)
[=C2=A0 167.870000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning
padding node at LEB 1682:49744
[=C2=A0 167.870000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): 3476 byte=
s
padded at LEB 1682:49744, offset now 53248
[=C2=A0 167.880000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:53248 (204800 bytes left)
[=C2=A0 167.890000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning =
data
node at LEB 1682:53248
[=C2=A0 167.900000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:53808 (204240 bytes left)
[=C2=A0 167.910000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning
padding node at LEB 1682:53808
[=C2=A0 167.920000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): 3508 byte=
s
padded at LEB 1682:53808, offset now 57344
[=C2=A0 167.930000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:57344 (200704 bytes left)
[=C2=A0 167.940000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning =
data
node at LEB 1682:57344
[=C2=A0 167.940000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:57720 (200328 bytes left)
[=C2=A0 167.950000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning
padding node at LEB 1682:57720
[=C2=A0 167.960000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): 3692 byte=
s
padded at LEB 1682:57720, offset now 61440
[=C2=A0 167.970000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:61440 (196608 bytes left)
[=C2=A0 167.980000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning =
data
node at LEB 1682:61440
[=C2=A0 167.990000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:62008 (196040 bytes left)
[=C2=A0 168.000000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning
padding node at LEB 1682:62008
[=C2=A0 168.010000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): 3500 byte=
s
padded at LEB 1682:62008, offset now 65536
[=C2=A0 168.020000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:65536 (192512 bytes left)
[=C2=A0 168.020000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning =
data
node at LEB 1682:65536
[=C2=A0 168.030000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:66112 (191936 bytes left)
[=C2=A0 168.040000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning
padding node at LEB 1682:66112
[=C2=A0 168.050000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): 3492 byte=
s
padded at LEB 1682:66112, offset now 69632
[=C2=A0 168.060000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:69632 (188416 bytes left)
[=C2=A0 168.070000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning =
data
node at LEB 1682:69632
[=C2=A0 168.080000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:70216 (187832 bytes left)
[=C2=A0 168.090000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning
padding node at LEB 1682:70216
[=C2=A0 168.090000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): 3484 byte=
s
padded at LEB 1682:70216, offset now 73728
[=C2=A0 168.100000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:73728 (184320 bytes left)
[=C2=A0 168.110000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning =
data
node at LEB 1682:73728
[=C2=A0 168.120000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:73920 (184128 bytes left)
[=C2=A0 168.130000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning
padding node at LEB 1682:73920
[=C2=A0 168.140000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): 3876 byte=
s
padded at LEB 1682:73920, offset now 77824
[=C2=A0 168.150000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:77824 (180224 bytes left)
[=C2=A0 168.160000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning =
data
node at LEB 1682:77824
[=C2=A0 168.160000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:78072 (179976 bytes left)
[=C2=A0 168.170000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning
padding node at LEB 1682:78072
[=C2=A0 168.180000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): 3820 byte=
s
padded at LEB 1682:78072, offset now 81920
[=C2=A0 168.190000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:81920 (176128 bytes left)
[=C2=A0 168.200000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning =
data
node at LEB 1682:81920
[=C2=A0 168.210000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:82216 (175832 bytes left)
[=C2=A0 168.220000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning
padding node at LEB 1682:82216
[=C2=A0 168.230000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): 3772 byte=
s
padded at LEB 1682:82216, offset now 86016
[=C2=A0 168.240000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:86016 (172032 bytes left)
[=C2=A0 168.240000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning =
data
node at LEB 1682:86016
[=C2=A0 168.250000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:86288 (171760 bytes left)
[=C2=A0 168.260000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning
padding node at LEB 1682:86288
[=C2=A0 168.270000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): 3796 byte=
s
padded at LEB 1682:86288, offset now 90112
[=C2=A0 168.280000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:90112 (167936 bytes left)
[=C2=A0 168.290000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning =
data
node at LEB 1682:90112
[=C2=A0 168.300000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:90360 (167688 bytes left)
[=C2=A0 168.310000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning
padding node at LEB 1682:90360
[=C2=A0 168.310000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): 3820 byte=
s
padded at LEB 1682:90360, offset now 94208
[=C2=A0 168.320000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:94208 (163840 bytes left)
[=C2=A0 168.330000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning =
data
node at LEB 1682:94208
[=C2=A0 168.340000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:96184 (161864 bytes left)
[=C2=A0 168.350000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning
padding node at LEB 1682:96184
[=C2=A0 168.360000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): 2092 byte=
s
padded at LEB 1682:96184, offset now 98304
[=C2=A0 168.370000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:98304 (159744 bytes left)
[=C2=A0 168.380000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning =
data
node at LEB 1682:98304
[=C2=A0 168.380000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:100040 (158008 bytes left)
[=C2=A0 168.390000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning
padding node at LEB 1682:100040
[=C2=A0 168.400000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): 2332 byte=
s
padded at LEB 1682:100040, offset now 102400
[=C2=A0 168.410000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:102400 (155648 bytes left)
[=C2=A0 168.420000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning =
data
node at LEB 1682:102400
[=C2=A0 168.430000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:103656 (154392 bytes left)
[=C2=A0 168.440000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning
padding node at LEB 1682:103656
[=C2=A0 168.450000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): 2812 byte=
s
padded at LEB 1682:103656, offset now 106496
[=C2=A0 168.460000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:106496 (151552 bytes left)
[=C2=A0 168.470000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning =
data
node at LEB 1682:106496
[=C2=A0 168.470000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:107808 (150240 bytes left)
[=C2=A0 168.480000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning
padding node at LEB 1682:107808
[=C2=A0 168.490000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): 2756 byte=
s
padded at LEB 1682:107808, offset now 110592
[=C2=A0 168.500000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:110592 (147456 bytes left)
[=C2=A0 168.510000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning =
data
node at LEB 1682:110592
[=C2=A0 168.520000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:111600 (146448 bytes left)
[=C2=A0 168.530000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning
padding node at LEB 1682:111600
[=C2=A0 168.540000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): 3060 byte=
s
padded at LEB 1682:111600, offset now 114688
[=C2=A0 168.550000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:114688 (143360 bytes left)
[=C2=A0 168.550000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning =
data
node at LEB 1682:114688
[=C2=A0 168.560000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:115200 (142848 bytes left)
[=C2=A0 168.570000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning
padding node at LEB 1682:115200
[=C2=A0 168.580000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): 3556 byte=
s
padded at LEB 1682:115200, offset now 118784
[=C2=A0 168.590000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:118784 (139264 bytes left)
[=C2=A0 168.600000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning =
data
node at LEB 1682:118784
[=C2=A0 168.610000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:118920 (139128 bytes left)
[=C2=A0 168.620000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning
padding node at LEB 1682:118920
[=C2=A0 168.620000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): 3932 byte=
s
padded at LEB 1682:118920, offset now 122880
[=C2=A0 168.630000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:122880 (135168 bytes left)
[=C2=A0 168.640000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning =
data
node at LEB 1682:122880
[=C2=A0 168.650000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:122984 (135064 bytes left)
[=C2=A0 168.660000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning
padding node at LEB 1682:122984
[=C2=A0 168.670000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): 3964 byte=
s
padded at LEB 1682:122984, offset now 126976
[=C2=A0 168.680000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:126976 (131072 bytes left)
[=C2=A0 168.690000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning =
data
node at LEB 1682:126976
[=C2=A0 168.700000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:127576 (130472 bytes left)
[=C2=A0 168.700000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning
padding node at LEB 1682:127576
[=C2=A0 168.710000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): 3468 byte=
s
padded at LEB 1682:127576, offset now 131072
[=C2=A0 168.720000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:131072 (126976 bytes left)
[=C2=A0 168.730000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning =
data
node at LEB 1682:131072
[=C2=A0 168.740000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:131912 (126136 bytes left)
[=C2=A0 168.750000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning =
data
node at LEB 1682:131912
[=C2=A0 168.760000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:134552 (123496 bytes left)
[=C2=A0 168.770000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning
padding node at LEB 1682:134552
[=C2=A0 168.770000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): 588 bytes=

padded at LEB 1682:134552, offset now 135168
[=C2=A0 168.780000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:135168 (122880 bytes left)
[=C2=A0 168.790000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning =
data
node at LEB 1682:135168
[=C2=A0 168.800000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:139176 (118872 bytes left)
[=C2=A0 168.810000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning =
data
node at LEB 1682:139176
[=C2=A0 168.820000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:143320 (114728 bytes left)
[=C2=A0 168.830000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning
padding node at LEB 1682:143320
[=C2=A0 168.840000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): 12 bytes
padded at LEB 1682:143320, offset now 143360
[=C2=A0 168.850000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:143360 (114688 bytes left)
[=C2=A0 168.850000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning =
data
node at LEB 1682:143360
[=C2=A0 168.860000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:145392 (112656 bytes left)
[=C2=A0 168.870000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning =
data
node at LEB 1682:145392
[=C2=A0 168.880000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:147888 (110160 bytes left)
[=C2=A0 168.890000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning
padding node at LEB 1682:147888
[=C2=A0 168.900000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): 3636 byte=
s
padded at LEB 1682:147888, offset now 151552
[=C2=A0 168.910000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:151552 (106496 bytes left)
[=C2=A0 168.920000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning =
data
node at LEB 1682:151552
[=C2=A0 168.920000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:153120 (104928 bytes left)
[=C2=A0 168.930000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning =
data
node at LEB 1682:153120
[=C2=A0 168.940000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:154408 (103640 bytes left)
[=C2=A0 168.950000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning
padding node at LEB 1682:154408
[=C2=A0 168.960000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): 1212 byte=
s
padded at LEB 1682:154408, offset now 155648
[=C2=A0 168.970000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:155648 (102400 bytes left)
[=C2=A0 168.980000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning =
data
node at LEB 1682:155648
[=C2=A0 168.990000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:156944 (101104 bytes left)
[=C2=A0 168.990000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning =
data
node at LEB 1682:156944
[=C2=A0 169.000000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:158312 (99736 bytes left)
[=C2=A0 169.010000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning
padding node at LEB 1682:158312
[=C2=A0 169.020000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): 1404 byte=
s
padded at LEB 1682:158312, offset now 159744
[=C2=A0 169.030000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:159744 (98304 bytes left)
[=C2=A0 169.040000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning =
data
node at LEB 1682:159744
[=C2=A0 169.050000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:161120 (96928 bytes left)
[=C2=A0 169.060000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning =
data
node at LEB 1682:161120
[=C2=A0 169.060000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:163032 (95016 bytes left)
[=C2=A0 169.070000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning
padding node at LEB 1682:163032
[=C2=A0 169.080000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): 780 bytes=

padded at LEB 1682:163032, offset now 163840
[=C2=A0 169.090000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:163840 (94208 bytes left)
[=C2=A0 169.100000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning =
data
node at LEB 1682:163840
[=C2=A0 169.110000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:165760 (92288 bytes left)
[=C2=A0 169.120000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning =
data
node at LEB 1682:165760
[=C2=A0 169.130000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:167744 (90304 bytes left)
[=C2=A0 169.130000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning
padding node at LEB 1682:167744
[=C2=A0 169.140000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): 164 bytes=

padded at LEB 1682:167744, offset now 167936
[=C2=A0 169.150000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:167936 (90112 bytes left)
[=C2=A0 169.160000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning =
data
node at LEB 1682:167936
[=C2=A0 169.170000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:169936 (88112 bytes left)
[=C2=A0 169.180000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning =
data
node at LEB 1682:169936
[=C2=A0 169.190000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:170856 (87192 bytes left)
[=C2=A0 169.200000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning
padding node at LEB 1682:170856
[=C2=A0 169.200000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): 1148 byte=
s
padded at LEB 1682:170856, offset now 172032
[=C2=A0 169.210000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:172032 (86016 bytes left)
[=C2=A0 169.220000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning =
data
node at LEB 1682:172032
[=C2=A0 169.230000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:173408 (84640 bytes left)
[=C2=A0 169.240000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning =
data
node at LEB 1682:173408
[=C2=A0 169.250000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:175248 (82800 bytes left)
[=C2=A0 169.260000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning
padding node at LEB 1682:175248
[=C2=A0 169.270000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): 852 bytes=

padded at LEB 1682:175248, offset now 176128
[=C2=A0 169.280000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:176128 (81920 bytes left)
[=C2=A0 169.280000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning =
data
node at LEB 1682:176128
[=C2=A0 169.290000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:177984 (80064 bytes left)
[=C2=A0 169.300000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning =
data
node at LEB 1682:177984
[=C2=A0 169.310000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:178800 (79248 bytes left)
[=C2=A0 169.320000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning
padding node at LEB 1682:178800
[=C2=A0 169.330000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): 1396 byte=
s
padded at LEB 1682:178800, offset now 180224
[=C2=A0 169.340000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:180224 (77824 bytes left)
[=C2=A0 169.350000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning =
data
node at LEB 1682:180224
[=C2=A0 169.350000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:181208 (76840 bytes left)
[=C2=A0 169.360000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning =
data
node at LEB 1682:181208
[=C2=A0 169.370000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:182632 (75416 bytes left)
[=C2=A0 169.380000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning
padding node at LEB 1682:182632
[=C2=A0 169.390000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): 1660 byte=
s
padded at LEB 1682:182632, offset now 184320
[=C2=A0 169.400000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:184320 (73728 bytes left)
[=C2=A0 169.410000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning =
data
node at LEB 1682:184320
[=C2=A0 169.420000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:185760 (72288 bytes left)
[=C2=A0 169.420000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning =
data
node at LEB 1682:185760
[=C2=A0 169.430000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:186608 (71440 bytes left)
[=C2=A0 169.440000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning
padding node at LEB 1682:186608
[=C2=A0 169.450000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): 1780 byte=
s
padded at LEB 1682:186608, offset now 188416
[=C2=A0 169.460000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:188416 (69632 bytes left)
[=C2=A0 169.470000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning =
data
node at LEB 1682:188416
[=C2=A0 169.480000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:188928 (69120 bytes left)
[=C2=A0 169.490000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning =
data
node at LEB 1682:188928
[=C2=A0 169.490000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:189600 (68448 bytes left)
[=C2=A0 169.500000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning
padding node at LEB 1682:189600
[=C2=A0 169.510000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): 2884 byte=
s
padded at LEB 1682:189600, offset now 192512
[=C2=A0 169.520000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:192512 (65536 bytes left)
[=C2=A0 169.530000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning =
data
node at LEB 1682:192512
[=C2=A0 169.540000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:193184 (64864 bytes left)
[=C2=A0 169.550000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning =
data
node at LEB 1682:193184
[=C2=A0 169.550000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:193520 (64528 bytes left)
[=C2=A0 169.560000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning
padding node at LEB 1682:193520
[=C2=A0 169.570000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): 3060 byte=
s
padded at LEB 1682:193520, offset now 196608
[=C2=A0 169.580000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:196608 (61440 bytes left)
[=C2=A0 169.590000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning =
data
node at LEB 1682:196608
[=C2=A0 169.600000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:196944 (61104 bytes left)
[=C2=A0 169.610000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning =
data
node at LEB 1682:196944
[=C2=A0 169.620000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:197120 (60928 bytes left)
[=C2=A0 169.620000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning
padding node at LEB 1682:197120
[=C2=A0 169.630000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): 3556 byte=
s
padded at LEB 1682:197120, offset now 200704
[=C2=A0 169.640000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:200704 (57344 bytes left)
[=C2=A0 169.650000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning =
data
node at LEB 1682:200704
[=C2=A0 169.660000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:200888 (57160 bytes left)
[=C2=A0 169.670000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning =
data
node at LEB 1682:200888
[=C2=A0 169.680000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:201016 (57032 bytes left)
[=C2=A0 169.690000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning
padding node at LEB 1682:201016
[=C2=A0 169.690000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): 3756 byte=
s
padded at LEB 1682:201016, offset now 204800
[=C2=A0 169.700000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:204800 (53248 bytes left)
[=C2=A0 169.710000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning =
data
node at LEB 1682:204800
[=C2=A0 169.720000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:205056 (52992 bytes left)
[=C2=A0 169.730000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning
padding node at LEB 1682:205056
[=C2=A0 169.740000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): 3812 byte=
s
padded at LEB 1682:205056, offset now 208896
[=C2=A0 169.750000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:208896 (49152 bytes left)
[=C2=A0 169.760000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning =
data
node at LEB 1682:208896
[=C2=A0 169.770000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:209160 (48888 bytes left)
[=C2=A0 169.770000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning
padding node at LEB 1682:209160
[=C2=A0 169.780000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): 3804 byte=
s
padded at LEB 1682:209160, offset now 212992
[=C2=A0 169.790000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:212992 (45056 bytes left)
[=C2=A0 169.800000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning =
data
node at LEB 1682:212992
[=C2=A0 169.810000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:213560 (44488 bytes left)
[=C2=A0 169.820000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning
padding node at LEB 1682:213560
[=C2=A0 169.830000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): 3500 byte=
s
padded at LEB 1682:213560, offset now 217088
[=C2=A0 169.840000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:217088 (40960 bytes left)
[=C2=A0 169.850000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning =
data
node at LEB 1682:217088
[=C2=A0 169.850000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:217864 (40184 bytes left)
[=C2=A0 169.860000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning
padding node at LEB 1682:217864
[=C2=A0 169.870000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): 3292 byte=
s
padded at LEB 1682:217864, offset now 221184
[=C2=A0 169.880000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:221184 (36864 bytes left)
[=C2=A0 169.890000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning =
data
node at LEB 1682:221184
[=C2=A0 169.900000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:221616 (36432 bytes left)
[=C2=A0 169.910000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning
padding node at LEB 1682:221616
[=C2=A0 169.920000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): 3636 byte=
s
padded at LEB 1682:221616, offset now 225280
[=C2=A0 169.930000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:225280 (32768 bytes left)
[=C2=A0 169.930000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning =
data
node at LEB 1682:225280
[=C2=A0 169.940000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:225696 (32352 bytes left)
[=C2=A0 169.950000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning
padding node at LEB 1682:225696
[=C2=A0 169.960000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): 3652 byte=
s
padded at LEB 1682:225696, offset now 229376
[=C2=A0 169.970000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:229376 (28672 bytes left)
[=C2=A0 169.980000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning =
data
node at LEB 1682:229376
[=C2=A0 169.990000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:229816 (28232 bytes left)
[=C2=A0 170.000000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning
padding node at LEB 1682:229816
[=C2=A0 170.000000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): 3628 byte=
s
padded at LEB 1682:229816, offset now 233472
[=C2=A0 170.010000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:233472 (24576 bytes left)
[=C2=A0 170.020000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning =
data
node at LEB 1682:233472
[=C2=A0 170.030000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:234048 (24000 bytes left)
[=C2=A0 170.040000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning
padding node at LEB 1682:234048
[=C2=A0 170.050000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): 3492 byte=
s
padded at LEB 1682:234048, offset now 237568
[=C2=A0 170.060000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:237568 (20480 bytes left)
[=C2=A0 170.070000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning =
data
node at LEB 1682:237568
[=C2=A0 170.080000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:238112 (19936 bytes left)
[=C2=A0 170.080000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning
padding node at LEB 1682:238112
[=C2=A0 170.090000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): 3524 byte=
s
padded at LEB 1682:238112, offset now 241664
[=C2=A0 170.100000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:241664 (16384 bytes left)
[=C2=A0 170.110000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning =
data
node at LEB 1682:241664
[=C2=A0 170.120000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:242152 (15896 bytes left)
[=C2=A0 170.130000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning
padding node at LEB 1682:242152
[=C2=A0 170.140000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): 3580 byte=
s
padded at LEB 1682:242152, offset now 245760
[=C2=A0 170.150000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:245760 (12288 bytes left)
[=C2=A0 170.160000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning =
data
node at LEB 1682:245760
[=C2=A0 170.160000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:246296 (11752 bytes left)
[=C2=A0 170.170000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning
padding node at LEB 1682:246296
[=C2=A0 170.180000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): 3532 byte=
s
padded at LEB 1682:246296, offset now 249856
[=C2=A0 170.190000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:249856 (8192 bytes left)
[=C2=A0 170.200000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning =
data
node at LEB 1682:249856
[=C2=A0 170.210000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:250280 (7768 bytes left)
[=C2=A0 170.220000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning
padding node at LEB 1682:250280
[=C2=A0 170.230000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): 3644 byte=
s
padded at LEB 1682:250280, offset now 253952
[=C2=A0 170.240000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:253952 (4096 bytes left)
[=C2=A0 170.240000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning =
data
node at LEB 1682:253952
[=C2=A0 170.250000] ubifs_scan: UBIFS DBG scan (pid 59): look at LEB
1682:254392 (3656 bytes left)
[=C2=A0 170.260000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): scanning
padding node at LEB 1682:254392
[=C2=A0 170.270000] ubifs_scan_a_node: UBIFS DBG scan (pid 59): 3628 byte=
s
padded at LEB 1682:254392, offset now 258048
[=C2=A0 170.280000] ubifs_end_scan: UBIFS DBG scan (pid 59): stop scannin=
g
LEB 1682 at offset 258048
[=C2=A0 170.290000] ubifs_garbage_collect_leb: UBIFS DBG gc (pid 59): dat=
a
LEB 1682 (free 0, dirty 253904)
[=C2=A0 170.300000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): search k=
ey
(76, data, 12731)
[=C2=A0 170.310000] ubifs_read_node: UBIFS DBG io (pid 59): LEB 1215:9992=
,
indexing node, length 188
[=C2=A0 170.310000] read_znode: UBIFS DBG tnc (pid 59): LEB 1215:9992, le=
vel
3, 8 branch
[=C2=A0 170.320000] ubifs_read_node: UBIFS DBG io (pid 59): LEB 485:12872=
,
indexing node, length 188
[=C2=A0 170.330000] read_znode: UBIFS DBG tnc (pid 59): LEB 485:12872, le=
vel
2, 8 branch
[=C2=A0 170.340000] ubifs_read_node: UBIFS DBG io (pid 59): LEB 1775:1610=
4,
indexing node, length 188
[=C2=A0 170.350000] read_znode: UBIFS DBG tnc (pid 59): LEB 1775:16104, l=
evel
1, 8 branch
[=C2=A0 170.360000] ubifs_read_node: UBIFS DBG io (pid 59): LEB 1775:1591=
2,
indexing node, length 188
[=C2=A0 170.370000] read_znode: UBIFS DBG tnc (pid 59): LEB 1775:15912, l=
evel
0, 8 branch
[=C2=A0 170.370000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): found 1,=
 lvl
0, n 1
[=C2=A0 170.380000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): search k=
ey
(76, data, 12731)
[=C2=A0 170.390000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): found 1,=
 lvl
0, n 1
[=C2=A0 170.390000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): search k=
ey
(76, data, 12731)
[=C2=A0 170.400000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): found 1,=
 lvl
0, n 1
[=C2=A0 170.410000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): search k=
ey
(76, data, 12732)
[=C2=A0 170.420000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): found 1,=
 lvl
0, n 2
[=C2=A0 170.420000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): search k=
ey
(76, data, 12732)
[=C2=A0 170.430000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): found 1,=
 lvl
0, n 2
[=C2=A0 170.440000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): search k=
ey
(76, data, 12732)
[=C2=A0 170.450000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): found 1,=
 lvl
0, n 2
[=C2=A0 170.450000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): search k=
ey
(76, data, 12732)
[=C2=A0 170.460000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): found 1,=
 lvl
0, n 2
[=C2=A0 170.470000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): search k=
ey
(76, data, 12733)
[=C2=A0 170.480000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): found 1,=
 lvl
0, n 3
[=C2=A0 170.480000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): search k=
ey
(76, data, 12733)
[=C2=A0 170.490000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): found 1,=
 lvl
0, n 3
[=C2=A0 170.500000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): search k=
ey
(76, data, 12733)
[=C2=A0 170.510000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): found 1,=
 lvl
0, n 3
[=C2=A0 170.510000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): search k=
ey
(76, data, 12733)
[=C2=A0 170.520000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): found 1,=
 lvl
0, n 3
[=C2=A0 170.530000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): search k=
ey
(76, data, 12734)
[=C2=A0 170.540000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): found 1,=
 lvl
0, n 4
[=C2=A0 170.540000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): search k=
ey
(76, data, 12734)
[=C2=A0 170.550000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): found 1,=
 lvl
0, n 4
[=C2=A0 170.560000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): search k=
ey
(76, data, 12734)
[=C2=A0 170.570000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): found 1,=
 lvl
0, n 4
[=C2=A0 170.570000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): search k=
ey
(76, data, 12734)
[=C2=A0 170.580000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): found 1,=
 lvl
0, n 4
[=C2=A0 170.590000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): search k=
ey
(76, data, 12735)
[=C2=A0 170.600000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): found 1,=
 lvl
0, n 5
[=C2=A0 170.600000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): search k=
ey
(76, data, 12735)
[=C2=A0 170.610000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): found 1,=
 lvl
0, n 5
[=C2=A0 170.620000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): search k=
ey
(76, data, 12735)
[=C2=A0 170.630000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): found 1,=
 lvl
0, n 5
[=C2=A0 170.630000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): search k=
ey
(76, data, 12735)
[=C2=A0 170.640000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): found 1,=
 lvl
0, n 5
[=C2=A0 170.650000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): search k=
ey
(76, data, 12736)
[=C2=A0 170.660000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): found 1,=
 lvl
0, n 6
[=C2=A0 170.660000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): search k=
ey
(76, data, 12736)
[=C2=A0 170.670000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): found 1,=
 lvl
0, n 6
[=C2=A0 170.680000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): search k=
ey
(76, data, 12736)
[=C2=A0 170.690000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): found 1,=
 lvl
0, n 6
[=C2=A0 170.690000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): search k=
ey
(76, data, 12736)
[=C2=A0 170.700000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): found 1,=
 lvl
0, n 6
[=C2=A0 170.710000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): search k=
ey
(76, data, 12737)
[=C2=A0 170.720000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): found 1,=
 lvl
0, n 7
[=C2=A0 170.720000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): search k=
ey
(76, data, 12737)
[=C2=A0 170.730000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): found 1,=
 lvl
0, n 7
[=C2=A0 170.740000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): search k=
ey
(76, data, 12737)
[=C2=A0 170.750000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): found 1,=
 lvl
0, n 7
[=C2=A0 170.750000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): search k=
ey
(76, data, 12737)
[=C2=A0 170.760000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): found 1,=
 lvl
0, n 7
[=C2=A0 170.770000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): search k=
ey
(76, data, 12738)
[=C2=A0 170.780000] ubifs_read_node: UBIFS DBG io (pid 59): LEB 485:10952=
,
indexing node, length 188
[=C2=A0 170.790000] read_znode: UBIFS DBG tnc (pid 59): LEB 485:10952, le=
vel
1, 8 branch
[=C2=A0 170.790000] ubifs_read_node: UBIFS DBG io (pid 59): LEB 1775:1629=
6,
indexing node, length 188
[=C2=A0 170.800000] read_znode: UBIFS DBG tnc (pid 59): LEB 1775:16296, l=
evel
0, 8 branch
[=C2=A0 170.810000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): found 1,=
 lvl
0, n 0
[=C2=A0 170.820000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): search k=
ey
(76, data, 12738)
[=C2=A0 170.830000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): found 1,=
 lvl
0, n 0
[=C2=A0 170.830000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): search k=
ey
(76, data, 12738)
[=C2=A0 170.840000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): found 1,=
 lvl
0, n 0
[=C2=A0 170.850000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): search k=
ey
(76, data, 12738)
[=C2=A0 170.850000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): found 1,=
 lvl
0, n 0
[=C2=A0 170.860000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): search k=
ey
(76, data, 12739)
[=C2=A0 170.870000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): found 1,=
 lvl
0, n 1
[=C2=A0 170.880000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): search k=
ey
(76, data, 2180)
[=C2=A0 170.880000] ubifs_read_node: UBIFS DBG io (pid 59): LEB 1215:4616=
,
indexing node, length 188
[=C2=A0 170.890000] read_znode: UBIFS DBG tnc (pid 59): LEB 1215:4616, le=
vel
3, 8 branch
[=C2=A0 170.900000] ubifs_read_node: UBIFS DBG io (pid 59): LEB 1215:4424=
,
indexing node, length 188
[=C2=A0 170.910000] read_znode: UBIFS DBG tnc (pid 59): LEB 1215:4424, le=
vel
2, 8 branch
[=C2=A0 170.920000] ubifs_read_node: UBIFS DBG io (pid 59): LEB 1215:4232=
,
indexing node, length 188
[=C2=A0 170.930000] read_znode: UBIFS DBG tnc (pid 59): LEB 1215:4232, le=
vel
1, 8 branch
[=C2=A0 170.930000] ubifs_read_node: UBIFS DBG io (pid 59): LEB 1215:3848=
,
indexing node, length 188
[=C2=A0 170.940000] read_znode: UBIFS DBG tnc (pid 59): LEB 1215:3848, le=
vel
0, 8 branch
[=C2=A0 170.950000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): found 1,=
 lvl
0, n 2
[=C2=A0 170.960000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): search k=
ey
(76, data, 2181)
[=C2=A0 170.970000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): found 1,=
 lvl
0, n 3
[=C2=A0 170.970000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): search k=
ey
(76, data, 2247)
[=C2=A0 170.980000] ubifs_read_node: UBIFS DBG io (pid 59): LEB 1775:3048=
,
indexing node, length 188
[=C2=A0 170.990000] read_znode: UBIFS DBG tnc (pid 59): LEB 1775:3048, le=
vel
1, 8 branch
[=C2=A0 171.000000] ubifs_read_node: UBIFS DBG io (pid 59): LEB 1775:2856=
,
indexing node, length 188
[=C2=A0 171.010000] read_znode: UBIFS DBG tnc (pid 59): LEB 1775:2856, le=
vel
0, 8 branch
[=C2=A0 171.010000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): found 1,=
 lvl
0, n 5
[=C2=A0 171.020000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): search k=
ey
(76, data, 2248)
[=C2=A0 171.030000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): found 1,=
 lvl
0, n 6
[=C2=A0 171.040000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): search k=
ey
(76, data, 19026)
[=C2=A0 171.040000] ubifs_read_node: UBIFS DBG io (pid 59): LEB 1215:1095=
2,
indexing node, length 188
[=C2=A0 171.050000] read_znode: UBIFS DBG tnc (pid 59): LEB 1215:10952, l=
evel
3, 8 branch
[=C2=A0 171.060000] ubifs_read_node: UBIFS DBG io (pid 59): LEB 1215:1076=
0,
indexing node, length 188
[=C2=A0 171.070000] read_znode: UBIFS DBG tnc (pid 59): LEB 1215:10760, l=
evel
2, 8 branch
[=C2=A0 171.080000] ubifs_read_node: UBIFS DBG io (pid 59): LEB 1215:1056=
8,
indexing node, length 188
[=C2=A0 171.090000] read_znode: UBIFS DBG tnc (pid 59): LEB 1215:10568, l=
evel
1, 8 branch
[=C2=A0 171.090000] ubifs_read_node: UBIFS DBG io (pid 59): LEB 1775:2090=
4,
indexing node, length 188
[=C2=A0 171.100000] read_znode: UBIFS DBG tnc (pid 59): LEB 1775:20904, l=
evel
0, 8 branch
[=C2=A0 171.110000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): found 1,=
 lvl
0, n 0
[=C2=A0 171.120000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): search k=
ey
(76, data, 19027)
[=C2=A0 171.130000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): found 1,=
 lvl
0, n 1
[=C2=A0 171.130000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): search k=
ey
(76, data, 19029)
[=C2=A0 171.140000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): found 1,=
 lvl
0, n 3
[=C2=A0 171.150000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): search k=
ey
(76, data, 19030)
[=C2=A0 171.150000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): found 1,=
 lvl
0, n 4
[=C2=A0 171.160000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): search k=
ey
(76, data, 19030)
[=C2=A0 171.170000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): found 1,=
 lvl
0, n 4
[=C2=A0 171.180000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): search k=
ey
(76, data, 19031)
[=C2=A0 171.180000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): found 1,=
 lvl
0, n 5
[=C2=A0 171.190000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): search k=
ey
(76, data, 19031)
[=C2=A0 171.200000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): found 1,=
 lvl
0, n 5
[=C2=A0 171.210000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): search k=
ey
(76, data, 19032)
[=C2=A0 171.210000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): found 1,=
 lvl
0, n 6
[=C2=A0 171.220000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): search k=
ey
(76, data, 19032)
[=C2=A0 171.230000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): found 1,=
 lvl
0, n 6
[=C2=A0 171.240000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): search k=
ey
(76, data, 19033)
[=C2=A0 171.240000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): found 1,=
 lvl
0, n 7
[=C2=A0 171.250000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): search k=
ey
(76, data, 19033)
[=C2=A0 171.260000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): found 1,=
 lvl
0, n 7
[=C2=A0 171.270000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): search k=
ey
(76, data, 19034)
[=C2=A0 171.270000] ubifs_read_node: UBIFS DBG io (pid 59): LEB 1431:2224=
8,
indexing node, length 188
[=C2=A0 171.280000] read_znode: UBIFS DBG tnc (pid 59): LEB 1431:22248, l=
evel
0, 8 branch
[=C2=A0 171.290000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): found 1,=
 lvl
0, n 0
[=C2=A0 171.300000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): search k=
ey
(76, data, 19035)
[=C2=A0 171.310000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): found 1,=
 lvl
0, n 1
[=C2=A0 171.310000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): search k=
ey
(76, data, 19036)
[=C2=A0 171.320000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): found 1,=
 lvl
0, n 2
[=C2=A0 171.330000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): search k=
ey
(76, data, 19036)
[=C2=A0 171.340000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): found 1,=
 lvl
0, n 2
[=C2=A0 171.340000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): search k=
ey
(76, data, 19037)
[=C2=A0 171.350000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): found 1,=
 lvl
0, n 3
[=C2=A0 171.360000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): search k=
ey
(76, data, 19038)
[=C2=A0 171.370000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): found 1,=
 lvl
0, n 4
[=C2=A0 171.370000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): search k=
ey
(76, data, 19039)
[=C2=A0 171.380000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): found 1,=
 lvl
0, n 5
[=C2=A0 171.390000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): search k=
ey
(76, data, 19039)
[=C2=A0 171.400000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): found 1,=
 lvl
0, n 5
[=C2=A0 171.400000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): search k=
ey
(76, data, 19040)
[=C2=A0 171.410000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): found 1,=
 lvl
0, n 6
[=C2=A0 171.420000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): search k=
ey
(76, data, 19042)
[=C2=A0 171.430000] ubifs_read_node: UBIFS DBG io (pid 59): LEB 1215:1018=
4,
indexing node, length 188
[=C2=A0 171.430000] read_znode: UBIFS DBG tnc (pid 59): LEB 1215:10184, l=
evel
0, 8 branch
[=C2=A0 171.440000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): found 1,=
 lvl
0, n 0
[=C2=A0 171.450000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): search k=
ey
(76, data, 19043)
[=C2=A0 171.460000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): found 1,=
 lvl
0, n 1
[=C2=A0 171.460000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): search k=
ey
(76, data, 19043)
[=C2=A0 171.470000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): found 1,=
 lvl
0, n 1
[=C2=A0 171.480000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): search k=
ey
(76, data, 19044)
[=C2=A0 171.490000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): found 1,=
 lvl
0, n 2
[=C2=A0 171.490000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): search k=
ey
(76, data, 19044)
[=C2=A0 171.500000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): found 1,=
 lvl
0, n 2
[=C2=A0 171.510000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): search k=
ey
(76, data, 19045)
[=C2=A0 171.520000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): found 1,=
 lvl
0, n 3
[=C2=A0 171.520000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): search k=
ey
(76, data, 19045)
[=C2=A0 171.530000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): found 1,=
 lvl
0, n 3
[=C2=A0 171.540000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): search k=
ey
(76, data, 19046)
[=C2=A0 171.550000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): found 1,=
 lvl
0, n 4
[=C2=A0 171.550000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): search k=
ey
(76, data, 12739)
[=C2=A0 171.560000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): found 1,=
 lvl
0, n 1
[=C2=A0 171.570000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): search k=
ey
(76, data, 12739)
[=C2=A0 171.580000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): found 1,=
 lvl
0, n 1
[=C2=A0 171.580000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): search k=
ey
(76, data, 12739)
[=C2=A0 171.590000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): found 1,=
 lvl
0, n 1
[=C2=A0 171.600000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): search k=
ey
(76, data, 12740)
[=C2=A0 171.610000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): found 1,=
 lvl
0, n 2
[=C2=A0 171.610000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): search k=
ey
(76, data, 12740)
[=C2=A0 171.620000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): found 1,=
 lvl
0, n 2
[=C2=A0 171.630000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): search k=
ey
(76, data, 12740)
[=C2=A0 171.640000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): found 1,=
 lvl
0, n 2
[=C2=A0 171.640000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): search k=
ey
(76, data, 12740)
[=C2=A0 171.650000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): found 1,=
 lvl
0, n 2
[=C2=A0 171.660000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): search k=
ey
(76, data, 12741)
[=C2=A0 171.670000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): found 1,=
 lvl
0, n 3
[=C2=A0 171.670000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): search k=
ey
(76, data, 12741)
[=C2=A0 171.680000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): found 1,=
 lvl
0, n 3
[=C2=A0 171.690000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): search k=
ey
(76, data, 12741)
[=C2=A0 171.700000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): found 1,=
 lvl
0, n 3
[=C2=A0 171.700000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): search k=
ey
(76, data, 12741)
[=C2=A0 171.710000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): found 1,=
 lvl
0, n 3
[=C2=A0 171.720000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): search k=
ey
(76, data, 12742)
[=C2=A0 171.730000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): found 1,=
 lvl
0, n 4
[=C2=A0 171.730000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): search k=
ey
(76, data, 12742)
[=C2=A0 171.740000] ubifs_lookup_level0: UBIFS DBG tnc (pid 59): found 1,=
 lvl
0, n 4
[=C2=A0 171.750000] wbuf_timer_callback_nolock: UBIFS DBG io (pid 59): jh=
ead
1 (base)
[=C2=A0 171.760000] ubifs_bg_wbufs_sync: UBIFS DBG io (pid 82): synchroni=
ze
[=C2=A0 171.760000] ubifs_wbuf_sync_nolock: UBIFS DBG io (pid 82): LEB
926:40960, 160 bytes, jhead 1 (base)
[=C2=A0 171.770000] ubifs_lpt_lookup_dirty: UBIFS DBG lp (pid 82): LEB 92=
6,
free 216928, dirty 39816, flags 16
[=C2=A0 171.780000] ubifs_change_lp: UBIFS DBG lp (pid 82): LEB 926, free=

212992, dirty 43752, flags 16
[=C2=A0 171.790000] ubifs_lpt_lookup_dirty: UBIFS DBG lp (pid 82): LEB 92=
6,
free 216928, dirty 39816, flags 16
[=C2=A0 171.800000] ubifs_wbuf_write_nolock: UBIFS DBG io (pid 59): 4144
bytes (data node) to jhead 0 (GC) wbuf at LEB 644:208896
[=C2=A0 171.810000] ubifs_wbuf_write_nolock: UBIFS DBG io (pid 59): write=

4096 bytes to LEB 644:208896
[=C2=A0 172.450000] watchdog watchdog0: watchdog did not stop!
[=C2=A0 177.600000] watchdog watchdog0: watchdog did not stop!
[=C2=A0 183.160000] watchdog watchdog0: watchdog did not stop!
[=C2=A0 188.350000] watchdog watchdog0: watchdog did not stop!
[snip] only 5s apart watchdog messages
[=C2=A0 312.050000] watchdog watchdog0: watchdog did not stop!
[=C2=A0 317.190000] watchdog watchdog0: watchdog did not stop!
[=C2=A0 322.470000] watchdog watchdog0: watchdog did not stop!

/ # [=C2=A0 328.220000] watchdog watchdog0: watchdog did not stop!

/ # ls -l /mnt/images/test
[=C2=A0 332.810000] ubifs_readdir: UBIFS DBG gen (pid 149): dir ino 249,
f_pos 0x0
[=C2=A0 332.820000] ubifs_tnc_next_ent: UBIFS DBG tnc (pid 149): (lowest)=

(249, direntry, 0x000000)
[=C2=A0 332.820000] ubifs_lookup_level0: UBIFS DBG tnc (pid 149): search =
key
(249, direntry, 0x000000)
[=C2=A0 332.830000] ubifs_lookup_level0: UBIFS DBG tnc (pid 149): found 0=
,
lvl 0, n 2
[=C2=A0 332.840000] ubifs_read_node_wbuf: UBIFS DBG io (pid 149): LEB
926:20480, direntry node, length 67, jhead 1 (base)
[=C2=A0 332.850000] ubifs_read_node: UBIFS DBG io (pid 149): LEB 926:2048=
0,
direntry node, length 67
[=C2=A0 333.270000] watchdog watchdog0: watchdog did not stop!
[=C2=A0 338.300000] watchdog watchdog0: watchdog did not stop!
[snip] only 5s apart watchdog messages
[=C2=A0 480.130000] INFO: task ls:149 blocked for more than 120 seconds.
[=C2=A0 480.130000]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Not tainted 4.4.6=
6-SEM-MK10 #15
[=C2=A0 480.140000] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
disables this message.
[=C2=A0 480.140000] ls=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 D c044cc28=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=
=A0 149=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1 0x00000000
[=C2=A0 480.150000] Backtrace:
[=C2=A0 480.150000] [<c044ca14>] (__schedule) from [<c044cf9c>]
(schedule+0xa0/0xb8)
[=C2=A0 480.160000]=C2=A0 r10:c2312000 r9:c25b9aa8 r8:c22b4a98 r7:0000001=
5
r6:ffffe000 r5:c20fa818
[=C2=A0 480.170000]=C2=A0 r4:c25b8000
[=C2=A0 480.170000] [<c044cefc>] (schedule) from [<c02e5ec8>]
(nand_get_device+0xf8/0x110)
[=C2=A0 480.180000]=C2=A0 r5:c20fa818 r4:c22b4a90
[=C2=A0 480.180000] [<c02e5dd0>] (nand_get_device) from [<c02ea410>]
(nand_read+0x28/0x84)
[=C2=A0 480.190000]=C2=A0 r9:00000000 r8:01400000 r7:00000000 r6:08c06000=

r5:c25b9af4 r4:c20fab70
[=C2=A0 480.200000] [<c02ea3e8>] (nand_read) from [<c02df6fc>]
(part_read+0x50/0x88)
[=C2=A0 480.200000]=C2=A0 r7:000001e0 r6:00000000 r5:00000000 r4:c2312000=

[=C2=A0 480.210000] [<c02df6ac>] (part_read) from [<c02dcca0>]
(mtd_read+0x6c/0xa4)
[=C2=A0 480.220000]=C2=A0 r9:00000000 r8:07806000 r6:00000043 r5:00000000=
 r4:173fa000
[=C2=A0 480.220000] [<c02dcc34>] (mtd_read) from [<c02dcd28>]
(mtd_read_slc_mode+0x50/0xe0)
[=C2=A0 480.230000]=C2=A0 r10:c25b9c24 r9:00000000 r8:07806000 r7:000001e=
0
r6:00000043 r5:00000043
[=C2=A0 480.240000]=C2=A0 r4:c2312000
[=C2=A0 480.240000] [<c02dccd8>] (mtd_read_slc_mode) from [<c02fe8fc>]
(ubi_io_read+0x168/0x338)
[=C2=A0 480.250000]=C2=A0 r10:c2528980 r9:00000004 r8:00006000 r7:000001e=
0
r6:00000043 r5:c302d000
[=C2=A0 480.260000]=C2=A0 r4:c302d000
[=C2=A0 480.260000] [<c02fe794>] (ubi_io_read) from [<c02fc484>]
(ubi_eba_read_leb+0x344/0x458)
[=C2=A0 480.270000]=C2=A0 r10:c23ca400 r9:000001e0 r8:00000000 r7:0000004=
3
r6:0000039e r5:00000000
[=C2=A0 480.280000]=C2=A0 r4:c302d000
[=C2=A0 480.280000] [<c02fc140>] (ubi_eba_read_leb) from [<c02fafe0>]
(ubi_leb_read+0xc4/0x114)
[=C2=A0 480.290000]=C2=A0 r10:00000000 r9:c302d000 r8:00005000 r7:0000039=
e
r6:00000043 r5:00000000
[=C2=A0 480.290000]=C2=A0 r4:c23ca400
[=C2=A0 480.300000] [<c02faf1c>] (ubi_leb_read) from [<c01ae394>]
(ubifs_leb_read+0x34/0x98)
[=C2=A0 480.310000]=C2=A0 r10:00000002 r9:c2528980 r8:00005000 r7:0000039=
e
r6:00000043 r5:c302e000
[=C2=A0 480.310000]=C2=A0 r4:c302e000
[=C2=A0 480.320000] [<c01ae360>] (ubifs_leb_read) from [<c01b0324>]
(ubifs_read_node+0x18c/0x340)
[=C2=A0 480.320000]=C2=A0 r8:00000043 r7:c092d2d0 r6:0000039e r5:00005000=
 r4:c302e000
[=C2=A0 480.330000] [<c01b0198>] (ubifs_read_node) from [<c01b0684>]
(ubifs_read_node_wbuf+0x1ac/0x378)
[=C2=A0 480.340000]=C2=A0 r10:00000043 r9:00000002 r8:c2528980 r7:0000039=
e
r6:c24496a0 r5:00005000
[=C2=A0 480.350000]=C2=A0 r4:c302e000
[=C2=A0 480.350000] [<c01b04d8>] (ubifs_read_node_wbuf) from [<c01cefb4>]=

(ubifs_tnc_read_node+0x54/0x1ec)
[=C2=A0 480.360000]=C2=A0 r10:c2528980 r9:40000000 r8:c302e314 r7:0000000=
2
r6:c2528980 r5:c302e000
[=C2=A0 480.370000]=C2=A0 r4:c2524e78
[=C2=A0 480.370000] [<c01cef60>] (ubifs_tnc_read_node) from [<c01b1700>]
(tnc_read_node_nm+0x1c0/0x1f4)
[=C2=A0 480.380000]=C2=A0 r8:c302e314 r7:c302e000 r6:c2528980 r5:c302e000=
 r4:c2524e78
[=C2=A0 480.390000] [<c01b1540>] (tnc_read_node_nm) from [<c01b5404>]
(ubifs_tnc_next_ent+0x228/0x274)
[=C2=A0 480.390000]=C2=A0 r7:c25b9ee8 r6:00000048 r5:c302e000 r4:c2524e00=

[=C2=A0 480.400000] [<c01b51dc>] (ubifs_tnc_next_ent) from [<c01a7118>]
(ubifs_readdir+0x20c/0x4c4)
[=C2=A0 480.410000]=C2=A0 r10:c092cd48 r9:00000000 r8:c28c81c8 r7:c302e00=
0
r6:c234e600 r5:c25b9f68
[=C2=A0 480.420000]=C2=A0 r4:c0102e8c
[=C2=A0 480.420000] [<c01a6f0c>] (ubifs_readdir) from [<c0102cc0>]
(iterate_dir+0x74/0xf8)
[=C2=A0 480.430000]=C2=A0 r10:00000000 r9:c25b8000 r8:c28c8238 r7:c234e60=
8
r6:00000000 r5:c25b9f68
[=C2=A0 480.430000]=C2=A0 r4:c234e600
[=C2=A0 480.440000] [<c0102c4c>] (iterate_dir) from [<c0103158>]
(SyS_getdents64+0x84/0xe4)
[=C2=A0 480.440000]=C2=A0 r10:00000000 r9:c25b8000 r8:c000f8c4 r7:c234e60=
0
r6:c234e600 r5:00008000
[=C2=A0 480.450000]=C2=A0 r4:000a80b0
[=C2=A0 480.450000] [<c01030d4>] (SyS_getdents64) from [<c000f720>]
(ret_fast_syscall+0x0/0x34)
[=C2=A0 480.460000]=C2=A0 r7:000000d9 r6:b6f95570 r5:000a8094 r4:000a80b0=

[=C2=A0 483.050000] watchdog watchdog0: watchdog did not stop!

=C2=A0
