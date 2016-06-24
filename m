Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bGREW-0008TV-6L
 for linux-mtd@lists.infradead.org; Fri, 24 Jun 2016 13:33:22 +0000
Date: Fri, 24 Jun 2016 15:33:07 +0200
From: Anatolij Gustschin <agust@denx.de>
To: linux-mtd@lists.infradead.org
Subject: Is UBI volume update broken?
Message-ID: <20160624153307.13d1c850@crub>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/tyt0ZdHE37Aq7C/D_7nqmAT"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--MP_/tyt0ZdHE37Aq7C/D_7nqmAT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,

after UBI volume update the UBIFS file system in the volume cannot be
mounted any more. I'm testing it with kernel 4.7.0-rc4 and mtd-utils
version 1.5.2 from git tree. The UBI volume is on SPI-NOR flash in
15.4 MiB big MTD partition. UBI debugging is enabled with

echo 'format "UBI DBG" +pf' > /sys/kernel/debug/dynamic_debug/control
echo 'format "UBIFS DBG" +pf' > /sys/kernel/debug/dynamic_debug/control

Mounting with "mount -t ubifs ubi0:data /mnt" fails with -EINVAL, but
I can't see any obvious error message in the generated debug log:
...
[   60.046082] ubifs_mount: UBIFS DBG gen (pid 353): name ubi0:data, flags 0x8000
[   60.046122] ubi_open_volume_path: UBI DBG gen (pid 353): open volume ubi0:data, mode 1
[   60.046184] ubi_open_volume_nm: UBI DBG gen (pid 353): open device 0, volume data, mode 1
[   60.046508] ubi_open_volume: UBI DBG gen (pid 353): open device 0, volume 0, mode 1
[   60.046764] ubifs_mount: UBIFS DBG gen (pid 353): opened ubi0_0
[   60.047210] ubi_open_volume: UBI DBG gen (pid 353): open device 0, volume 0, mode 2
[   60.049054] ubi_is_mapped: UBI DBG gen (pid 353): test LEB 0:0
[   60.049250] ubifs_read_node: UBIFS DBG io (pid 353): LEB 0:0, superblock node, length 4096
[   60.049287] ubi_leb_read: UBI DBG gen (pid 353): read 4096 bytes from LEB 0:0:0
[   60.049729] ubi_eba_read_leb: UBI DBG eba (pid 353): read 4096 bytes from offset 0 of LEB 0:0, PEB 216
[   60.049766] ubi_io_read: UBI DBG io (pid 353): read 4096 bytes from PEB 216:128
[   60.058205] ubi_close_volume: UBI DBG gen (pid 353): close device 0, volume 0, mode 2
[   60.058281] ubi_close_volume: UBI DBG gen (pid 353): close device 0, volume 0, mode 1

With a patched kernel (used debug patch is attached) the debug log finally
looks more meaningful:
...
[  108.766421] ubifs_mount: UBIFS DBG gen (pid 355): name ubi0:data, flags 0x8000
[  108.766459] ubi_open_volume_path: UBI DBG gen (pid 355): open volume ubi0:data, mode 1
[  108.766521] ubi_open_volume_nm: UBI DBG gen (pid 355): open device 0, volume data, mode 1
[  108.766871] ubi_open_volume: UBI DBG gen (pid 355): open device 0, volume 0, mode 1
[  108.767143] ubifs_mount: UBIFS DBG gen (pid 355): opened ubi0_0
[  108.767599] ubi_open_volume: UBI DBG gen (pid 355): open device 0, volume 0, mode 2
[  108.769531] ubi_is_mapped: UBI DBG gen (pid 355): test LEB 0:0
[  108.769740] ubifs_read_node: UBIFS DBG io (pid 355): LEB 0:0, superblock node, length 4096
[  108.769794] ubi_leb_read: UBI DBG gen (pid 355): read 4096 bytes from LEB 0:0:0
[  108.772041] ubi_eba_read_leb: UBI DBG eba (pid 355): read 4096 bytes from offset 0 of LEB 0:0, PEB 216
[  108.772080] ubi_io_read: UBI DBG io (pid 355): read 4096 bytes from PEB 216:128
[  108.778304] UBIFS error (ubi0:0 pid 355): ubifs_read_node: bad node type (0 but expected 6)
[  108.786777] ubi_is_mapped: UBI DBG gen (pid 355): test LEB 0:0
[  108.786816] UBIFS error (ubi0:0 pid 355): ubifs_read_node: bad node at LEB 0:0, LEB mapping status 1
[  108.796053] Not a node, first 24 bytes:
[  108.799799] 00000000: 55 42 49 23 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 40 00 00 00 80        UBI#...............@....
[  108.812963] magic 0x23494255
[  108.815882] CPU: 3 PID: 355 Comm: mount Tainted: G        W       4.7.0-rc4-dirty #170
[  108.823818] Hardware name: Freescale i.MX6 Quad/DualLite (Device Tree)
[  108.830363] Backtrace: 
[  108.832872] [<c010d148>] (dump_backtrace) from [<c010d340>] (show_stack+0x18/0x1c)
[  108.840460]  r7:dd1a4000 r6:600f0013 r5:00000000 r4:c0f21d7c
[  108.846249] [<c010d328>] (show_stack) from [<c03f1678>] (dump_stack+0xb4/0xe8)
[  108.853502] [<c03f15c4>] (dump_stack) from [<c035db74>] (ubifs_read_node+0x320/0x358)
[  108.861349]  r10:dd5ee000 r9:00000006 r8:00001000 r7:00000000 r6:00000000 r5:00000000
[  108.869320]  r4:dd5ef000 r3:00000000
[  108.872971] [<c035d854>] (ubifs_read_node) from [<c035a05c>] (ubifs_read_sb_node+0x5c/0xc0)
[  108.881337]  r10:00000001 r9:c1753b9c r8:dd5ef008 r7:dd5ef000 r6:dd739800 r5:dd5ee000
[  108.889308]  r4:dd5ef000
[  108.891892] [<c035a000>] (ubifs_read_sb_node) from [<c035a86c>] (ubifs_read_superblock+0x764/0x121c)
[  108.901041]  r5:dd5ef000 r4:00000000
[  108.904691] [<c035a108>] (ubifs_read_superblock) from [<c0358774>] (ubifs_mount+0x9fc/0x2030)
[  108.913232]  r10:00000001 r9:c1753b9c r8:dd5ef008 r7:dd5ef000 r6:dd739800 r5:dd6a5600
[  108.921202]  r4:00000000
[  108.923796] [<c0357d78>] (ubifs_mount) from [<c021df3c>] (mount_fs+0x1c/0xb0)
[  108.930949]  r10:dd6a5480 r9:00000000 r8:c0240510 r7:c0f1e57c r6:c0f1e57c r5:dd6a5580
[  108.938918]  r4:c0357d78
[  108.941506] [<c021df20>] (mount_fs) from [<c023cc7c>] (vfs_kern_mount+0x5c/0x134)
[  108.949004]  r6:00008000 r5:dd6a5580 r4:dd047f00
[  108.953725] [<c023cc20>] (vfs_kern_mount) from [<c0240510>] (do_mount+0x1a8/0xd70)
[  108.961311]  r9:00008000 r8:c0f1e57c r7:dd6a5580 r6:00000020 r5:00000000 r4:c0f126b4
[  108.969208] [<c0240368>] (do_mount) from [<c02414b0>] (SyS_mount+0x9c/0xc4)
[  108.976181]  r10:00000000 r9:dd1a4000 r8:00008000 r7:bea94eac r6:00000000 r5:dd6a5580
[  108.984105]  r4:dd6a5480
[  108.986673] [<c0241414>] (SyS_mount) from [<c0108ae0>] (ret_fast_syscall+0x0/0x1c)
[  108.994247]  r8:c0108c84 r7:00000015 r6:b6fc46e0 r5:00008000 r4:00000000
[  109.001101] ubifs_read_sb_node: UBIFS DBG gen (pid 355): ubifs_read_node err -22
[  109.001132] ubifs_read_superblock: UBIFS DBG gen (pid 355): ubifs_read_sb_node ret -22
[  109.003596] ubi_close_volume: UBI DBG gen (pid 355): close device 0, volume 0, mode 2
[  109.003634] ubi_close_volume: UBI DBG gen (pid 355): close device 0, volume 0, mode 1

Here is a summary of how the volume update image is created and how
the UBI device and volume is setup in the test:

# mkfs.ubifs -v -r data -m 8 -e 65408 -c 240 -o data.img

# cat data.cfg 
[data_volume]
mode=ubi
image=data.img
vol_id=0
vol_type=dynamic
vol_size=15697920
vol_name=data
vol_flags=autoresize
vol_alignment=1

# ubinize -v -o data.ubi -m 1 -p 64KiB -O 64 data.cfg

# ubiformat /dev/mtd4
ubiformat: mtd4 (nor), size 16121856 bytes (15.4 MiB), 246 eraseblocks of 65536 bytes (64.0 KiB), min. I/O size 1 bytes
libscan: scanning eraseblock 245 -- 100 % complete  
ubiformat: 246 eraseblocks have valid erase counter, mean value is 3
ubiformat: formatting eraseblock 245 -- 100 % complete

# ubiattach -m 4
[  764.131752] ubi0: default fastmap pool size: 10
[  764.136314] ubi0: default fastmap WL pool size: 5
[  764.141150] ubi0: attaching mtd4
[  764.445449] ubi0: scanning is finished
[  764.479099] ubi0: attached mtd4 (name "data", size 15 MiB)
[  764.484643] ubi0: PEB size: 65536 bytes (64 KiB), LEB size: 65408 bytes
[  764.491293] ubi0: min./max. I/O unit sizes: 1/256, sub-page size 1
[  764.497485] ubi0: VID header offset: 64 (aligned 64), data offset: 128
[  764.504050] ubi0: good PEBs: 246, bad PEBs: 0, corrupted PEBs: 0
[  764.510090] ubi0: user volume: 0, internal volumes: 1, max. volumes count: 128
[  764.517325] ubi0: max/mean erase counter: 10/4, WL threshold: 4096, image sequence number: 1488855089
[  764.526574] ubi0: available PEBs: 240, total reserved PEBs: 6, PEBs reserved for bad PEB handling: 0
[  764.535795] ubi0: background thread "ubi_bgt0d" started, PID 367
UBI device number 0, total 246 LEBs (16090368 bytes, 15.3 MiB), available 240 LEBs (15697920 bytes, 15.0 MiB), LEB size 65408 bytes (63.9 KiB)

# ubimkvol /dev/ubi0  -N data -m
Set volume size to 15697920
Volume ID 0, size 240 LEBs (15697920 bytes, 15.0 MiB), LEB size 65408 bytes (63.9 KiB), dynamic, name "data", alignment 1

# ubiupdatevol /dev/ubi0_0 data.ubi
# echo $?
0

# mount -t ubifs ubi0:data /mnt
mount: mounting ubi0:data on /mnt failed: Invalid argument

I think that the data.ubi image is okay because after formatting the
MTD partition with this very image mounting works:

# ubiformat /dev/mtd4 -f data.ubi 
ubiformat: mtd4 (nor), size 16121856 bytes (15.4 MiB), 246 eraseblocks of 65536 bytes (64.0 KiB), min. I/O size 1 bytes
libscan: scanning eraseblock 245 -- 100 % complete  
ubiformat: 246 eraseblocks have valid erase counter, mean value is 5
ubiformat: flashing eraseblock 14 -- 100 % complete  
ubiformat: formatting eraseblock 245 -- 100 % complete

# ubiattach -m 4
UBI device number 0, total 246 LEBs (16090368 bytes, 15.3 MiB), available 0 LEBs (0 bytes), LEB size 65408 bytes (63.9 KiB)

# mount -t ubifs ubi0:data /mnt
# ls /mnt/
test   test2

But what is wrong with the volume update? Could anyone please
confirm that the UBI volume update works? Am I missing some
important detail?

Thanks,

Anatolij

--MP_/tyt0ZdHE37Aq7C/D_7nqmAT
Content-Type: text/x-patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=ubifs-extended-debug.diff

diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index 69e287e2..bc8396b 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -310,6 +310,7 @@ void ubifs_dump_node(const struct ubifs_info *c, const void *node)
 		pr_err("Not a node, first %zu bytes:", UBIFS_CH_SZ);
 		print_hex_dump(KERN_ERR, "", DUMP_PREFIX_OFFSET, 32, 1,
 			       (void *)node, UBIFS_CH_SZ, 1);
+		pr_err("magic 0x%08x\n", le32_to_cpu(ch->magic));
 		return;
 	}
 
diff --git a/fs/ubifs/io.c b/fs/ubifs/io.c
index 97be412..e2ddc55 100644
--- a/fs/ubifs/io.c
+++ b/fs/ubifs/io.c
@@ -984,8 +984,10 @@ int ubifs_read_node(const struct ubifs_info *c, void *buf, int type, int len,
 	ubifs_assert(type >= 0 && type < UBIFS_NODE_TYPES_CNT);
 
 	err = ubifs_leb_read(c, lnum, buf, offs, len, 0);
-	if (err && err != -EBADMSG)
+	if (err && err != -EBADMSG) {
+		dbg_gen("ubifs_leb_read ret %d", err);
 		return err;
+	}
 
 	if (type != ch->node_type) {
 		ubifs_errc(c, "bad node type (%d but expected %d)",
@@ -1010,7 +1012,7 @@ int ubifs_read_node(const struct ubifs_info *c, void *buf, int type, int len,
 out:
 	ubifs_errc(c, "bad node at LEB %d:%d, LEB mapping status %d", lnum,
 		   offs, ubi_is_mapped(c->ubi, lnum));
-	if (!c->probing) {
+	if (!c->probing || c->mounting) {
 		ubifs_dump_node(c, buf);
 		dump_stack();
 	}
diff --git a/fs/ubifs/sb.c b/fs/ubifs/sb.c
index 3cbb904..b96f4b7 100644
--- a/fs/ubifs/sb.c
+++ b/fs/ubifs/sb.c
@@ -493,6 +493,7 @@ struct ubifs_sb_node *ubifs_read_sb_node(struct ubifs_info *c)
 	err = ubifs_read_node(c, sup, UBIFS_SB_NODE, UBIFS_SB_NODE_SZ,
 			      UBIFS_SB_LNUM, 0);
 	if (err) {
+		dbg_gen("ubifs_read_node err %d", err);
 		kfree(sup);
 		return ERR_PTR(err);
 	}
@@ -530,13 +531,16 @@ int ubifs_read_superblock(struct ubifs_info *c)
 
 	if (c->empty) {
 		err = create_default_filesystem(c);
+		dbg_gen("create_default_filesystem ret %d", err);
 		if (err)
 			return err;
 	}
 
 	sup = ubifs_read_sb_node(c);
-	if (IS_ERR(sup))
+	if (IS_ERR(sup)) {
+		dbg_gen("ubifs_read_sb_node ret %ld", PTR_ERR(sup));
 		return PTR_ERR(sup);
+	}
 
 	c->fmt_version = le32_to_cpu(sup->fmt_version);
 	c->ro_compat_version = le32_to_cpu(sup->ro_compat_version);
@@ -558,6 +562,7 @@ int ubifs_read_superblock(struct ubifs_info *c)
 				err = -EROFS;
 			} else
 				err = -EINVAL;
+			dbg_gen("ubifs_assert ret %d", err);
 			goto out;
 		}
 
@@ -633,6 +638,7 @@ int ubifs_read_superblock(struct ubifs_info *c)
 				c->old_leb_cnt, c->leb_cnt);
 			sup->leb_cnt = cpu_to_le32(c->leb_cnt);
 			err = ubifs_write_sb_node(c, sup);
+			dbg_gen("ubifs_write_sb_node ret %d", err);
 			if (err)
 				goto out;
 			c->old_leb_cnt = c->leb_cnt;
@@ -650,6 +656,7 @@ int ubifs_read_superblock(struct ubifs_info *c)
 	c->main_first = c->leb_cnt - c->main_lebs;
 
 	err = validate_sb(c, sup);
+	dbg_gen("validate_sb ret %d", err);
 out:
 	kfree(sup);
 	return err;
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index ddf9f6b9..33e6948 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -1788,7 +1788,7 @@ void ubifs_warn(const struct ubifs_info *c, const char *fmt, ...);
  */
 #define ubifs_errc(c, fmt, ...)						\
 do {									\
-	if (!(c)->probing)						\
+	if (!(c)->probing  || (c)->mounting)				\
 		ubifs_err(c, fmt, ##__VA_ARGS__);			\
 } while (0)
 

--MP_/tyt0ZdHE37Aq7C/D_7nqmAT--
