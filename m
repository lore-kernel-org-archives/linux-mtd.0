Received: from mail-out.m-online.net ([212.18.0.9])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TJwzA-0007nj-Ki
 for linux-mtd@lists.infradead.org; Fri, 05 Oct 2012 01:45:53 +0000
From: Marek Vasut <marex@denx.de>
To: linux-mtd@lists.infradead.org
Subject: GPMI NAND crashes with UBIFS
Date: Fri, 5 Oct 2012 03:45:49 +0200
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201210050345.49507.marex@denx.de>
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 Huang Shijie <b32955@freescale.com>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello guys,

I tried integck from mtd-utils 1.5.0 on GPMI NAND driver since I suspect it 
still has issues with UBI. See the outcome for yourself, log attached. Any 
suggestions would be very appreciated.

:~/mtd-utils-1.5.0/tests/fs-tests/integrity# ./integck /media
integck: pid 492, testing "ubifs" at "/media/cf"[  203.450000] UBIFS warning 
(pid 492): power_cut_emulated: failing after 19403ms

[  203.450000] UBIFS warning (pid 492): dbg_leb_write: actually write 2048 bytes 
to LEB 4:0 (the buffer was corrupted)
[  203.470000] UBIFS warning (pid 492): dbg_leb_write: actually write 2048 bytes 
to LEB 8:2048 (the buffer was corrupted)
[  203.480000] UBIFS warning (pid 492): dbg_leb_write: actually write 2048 bytes 
to LEB 1:4096 (the buffer was corrupted)
[  203.490000] UBIFS warning (pid 492): dbg_leb_write: actually write 2048 bytes 
to LEB 2:4096 (the buffer was corrupted)
[  203.510000] UBIFS: un-mount UBI device 0, volume 0
[  203.520000] UBIFS: background thread "ubifs_bgt0_0" stops
[  203.520000] UBIFS warning (pid 492): dbg_leb_write: actually write 2048 bytes 
to LEB 1:6144 (the buffer was corrupted)
[  203.530000] UBIFS warning (pid 492): dbg_leb_write: actually write 2048 bytes 
to LEB 2:6144 (the buffer was corrupted)
[  203.560000] UBIFS: background thread "ubifs_bgt0_0" started, PID 494
[  203.650000] UBIFS warning (pid 492): power_cut_emulated: failing in master 
LEB 1
[  203.660000] UBIFS warning (pid 492): power_cut_emulated: ========== Power cut 
emulated ==========
[  203.670000] [<8001315c>] (unwind_backtrace+0x0/0xf0) from [<801c96c4>] 
(power_cut_emulated+0x300/0x65c)
[  203.680000] [<801c96c4>] (power_cut_emulated+0x300/0x65c) from [<801ce924>] 
(dbg_leb_write+0x40/0x1b0)
[  203.690000] [<801ce924>] (dbg_leb_write+0x40/0x1b0) from [<801a9314>] 
(ubifs_leb_write+0x58/0x130)
[  203.700000] [<801a9314>] (ubifs_leb_write+0x58/0x130) from [<801aac44>] 
(ubifs_write_node+0xc4/0x1b4)
[  203.710000] [<801aac44>] (ubifs_write_node+0xc4/0x1b4) from [<801b0a9c>] 
(ubifs_write_master+0x104/0x18c)
[  203.720000] [<801b0a9c>] (ubifs_write_master+0x104/0x18c) from [<801a6d9c>] 
(ubifs_mount+0x10e0/0x16f4)
[  203.730000] [<801a6d9c>] (ubifs_mount+0x10e0/0x16f4) from [<800a0e8c>] 
(mount_fs+0x14/0xd0)
[  203.740000] [<800a0e8c>] (mount_fs+0x14/0xd0) from [<800b9528>] 
(vfs_kern_mount+0x4c/0xc0)
[  203.750000] [<800b9528>] (vfs_kern_mount+0x4c/0xc0) from [<800b95f0>] 
(do_kern_mount+0x34/0xd0)
[  203.750000] [<800b95f0>] (do_kern_mount+0x34/0xd0) from [<800ba6f4>] 
(do_mount+0x118/0x710)
[  203.760000] [<800ba6f4>] (do_mount+0x118/0x710) from [<800bad70>] 
(sys_mount+0x84/0xc4)
[  203.770000] [<800bad70>] (sys_mount+0x84/0xc4) from [<8000eba0>] 
(ret_fast_syscall+0x0/0x2c)
[  203.780000] UBIFS warning (pid 492): corrupt_data: filled bytes 262-2047 with 
random data
[  203.790000] UBIFS warning (pid 492): dbg_leb_write: actually write 2048 bytes 
to LEB 1:8192 (the buffer was corrupted)
[  203.800000] UBIFS error (pid 492): ubifs_leb_write: writing 2048 bytes to LEB 
1:8192 failed, error -30
[  203.810000] UBIFS warning (pid 492): ubifs_ro_mode: switched to read-only 
mode, error -30
[  203.820000] [<8001315c>] (unwind_backtrace+0x0/0xf0) from [<801a93d4>] 
(ubifs_leb_write+0x118/0x130)
[  203.830000] [<801a93d4>] (ubifs_leb_write+0x118/0x130) from [<801aac44>] 
(ubifs_write_node+0xc4/0x1b4)
[  203.840000] [<801aac44>] (ubifs_write_node+0xc4/0x1b4) from [<801b0a9c>] 
(ubifs_write_master+0x104/0x18c)
[  203.850000] [<801b0a9c>] (ubifs_write_master+0x104/0x18c) from [<801a6d9c>] 
(ubifs_mount+0x10e0/0x16f4)
[  203.870000] [<801a6d9c>] (ubifs_mount+0x10e0/0x16f4) from [<800a0e8c>] 
(mount_fs+0x14/0xd0)
[  203.870000] [<800a0e8c>] (mount_fs+0x14/0xd0) from [<800b9528>] 
(vfs_kern_mount+0x4c/0xc0)
[  203.880000] [<800b9528>] (vfs_kern_mount+0x4c/0xc0) from [<800b95f0>] 
(do_kern_mount+0x34/0xd0)
[  203.890000] [<800b95f0>] (do_kern_mount+0x34/0xd0) from [<800ba6f4>] 
(do_mount+0x118/0x710)
[  203.900000] [<800ba6f4>] (do_mount+0x118/0x710) from [<800bad70>] 
(sys_mount+0x84/0xc4)
[  203.910000] [<800bad70>] (sys_mount+0x84/0xc4) from [<8000eba0>] 
(ret_fast_syscall+0x0/0x2c)
[  203.920000] [<8001315c>] (unwind_backtrace+0x0/0xf0) from [<801a93d8>] 
(ubifs_leb_write+0x11c/0x130)
[  203.930000] [<801a93d8>] (ubifs_leb_write+0x11c/0x130) from [<801aac44>] 
(ubifs_write_node+0xc4/0x1b4)
[  203.940000] [<801aac44>] (ubifs_write_node+0xc4/0x1b4) from [<801b0a9c>] 
(ubifs_write_master+0x104/0x18c)
[  203.950000] [<801b0a9c>] (ubifs_write_master+0x104/0x18c) from [<801a6d9c>] 
(ubifs_mount+0x10e0/0x16f4)
[  203.960000] [<801a6d9c>] (ubifs_mount+0x10e0/0x16f4) from [<800a0e8c>] 
(mount_fs+0x14/0xd0)
[  203.970000] [<800a0e8c>] (mount_fs+0x14/0xd0) from [<800b9528>] 
(vfs_kern_mount+0x4c/0xc0)
[  203.980000] [<800b9528>] (vfs_kern_mount+0x4c/0xc0) from [<800b95f0>] 
(do_kern_mount+0x34/0xd0)
[  203.990000] [<800b95f0>] (do_kern_mount+0x34/0xd0) from [<800ba6f4>] 
(do_mount+0x118/0x710)
[  204.000000] [<800ba6f4>] (do_mount+0x118/0x710) from [<800bad70>] 
(sys_mount+0x84/0xc4)
[  204.010000] [<800bad70>] (sys_mount+0x84/0xc4) from [<8000eba0>] 
(ret_fast_syscall+0x0/0x2c)
[  204.020000]  magic          0x6101831
[  204.020000]  crc            0x970eb552
[  204.020000]  node_type      7 (master node)
[  204.030000]  group_type     0 (no node group)
[  204.030000]  sqnum          20
[  204.040000]  len            512
[  204.040000]  highest_inum   66
[  204.040000]  commit number  1
[  204.050000]  flags          0x3
[  204.050000]  log_lnum       4
[  204.050000]  root_lnum      13
[  204.050000]  root_offs      0
[  204.060000]  root_len       168
[  204.060000]  gc_lnum        12
[  204.060000]  ihead_lnum     13
[  204.070000]  ihead_offs     2048
[  204.070000]  index_size     168
[  204.070000]  lpt_lnum       8
[  204.080000]  lpt_offs       2124
[  204.080000]  nhead_lnum     8
[  204.080000]  nhead_offs     4096
[  204.090000]  ltab_lnum      8
[  204.090000]  ltab_offs      2048
[  204.090000]  lsave_lnum     0
[  204.100000]  lsave_offs     0
[  204.100000]  lscan_lnum     11
[  204.100000]  leb_cnt        1984
[  204.100000]  empty_lebs     1971
[  204.110000]  idx_lebs       1
[  204.110000]  total_free     250519552
[  204.110000]  total_dirty    3160
[  204.120000]  total_used     768
[  204.120000]  total_dead     0
[  204.120000]  total_dark     12115968
[  204.140000] UBIFS: background thread "ubifs_bgt0_0" stops
integck: unmounted /media/cf, but cannot mount it back R/W (line 3200, error 30 
(Read-only file system))
integck: error!: condition '!__err' failed in recover_tested_fs() at 
integck.c:3200
integck: error 30 (Read-only file system)

Best regards,
Marek Vasut
