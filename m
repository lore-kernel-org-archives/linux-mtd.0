Received: from mail-la0-x236.google.com ([2a00:1450:4010:c03::236])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WWBUd-0007po-Bh
 for linux-mtd@lists.infradead.org; Fri, 04 Apr 2014 21:17:50 +0000
Received: by mail-la0-f54.google.com with SMTP id mc6so2980660lab.27
 for <linux-mtd@lists.infradead.org>; Fri, 04 Apr 2014 14:17:18 -0700 (PDT)
Subject: Re: [PATCH] mtd: cfi_cmdset_0001 - fixup for PC28F512P33TFA
From: Christoph Fritz <chf.fritz@googlemail.com>
To: Christian Riesch <christian.riesch@gmail.com>
In-Reply-To: <49896FD866D95E20142E6B80@[172.22.2.41]>
References: <1396287151.4857.50.camel@mars>
 <OFA78F5CB9.63C292B4-ONC1257CAC.006FBDC4-C1257CAC.0070B588@transmode.se>
 <1396303460.4857.111.camel@mars>
 <OFA7BCC382.7C5EA8B7-ONC1257CAD.002CA0C1-C1257CAD.002EAA92@LocalDomain>
 <OFCD64B0EF.BC0E327D-ONC1257CAD.003CE517-C1257CAD.003DCE3D@transmode.se>
 <1396364991.4850.37.camel@mars>
 <OFDA5ED549.208718B9-ONC1257CAD.0068922B-C1257CAD.006990F4@transmode.se>
 <1396393830.6474.31.camel@mars>
 <OF12157674.86C034EE-ONC1257CAE.00287492-C1257CAE.0028C422@transmode.se>
 <49896FD866D95E20142E6B80@[172.22.2.41]>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 04 Apr 2014 23:17:13 +0200
Message-ID: <1396646233.17753.237.camel@mars>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Marius Achilles <M.Achilles@phytec.de>,
 Joakim Tjernlund <joakim.tjernlund@transmode.se>,
 Artem Bityutskiy <dedekind1@gmail.com>, linux-mtd@lists.infradead.org,
 Andrea Adami <andrea.adami@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2014-04-02 at 11:04 +0200, Christian Riesch wrote:
> 
> After reading TN-12-06 I guess the correct order should be
> 
> 1) 0xff
> 2) the existing 0xd0/0x70
> 3) wait 500us
> 
> right? Could you send a patch of the combination you tried (and that did 
> not work) for discussion?

The board is back on my desk and I did some further promising tests.
Test-Patches are below in this mail. To give an overview, this is what
my current git log looks like:

$ git log --oneline -28
1acde12 Revert "TESTHACK 13: -PASSED-"
44de693 TESTHACK 13: -PASSED-
41203f3 Revert "TESTHACK 12: -PASSED-"
83c520c TESTHACK 12: -PASSED-
fedac61 Revert "TESTHACK 11: -FAILED-"
e1f4df2 TESTHACK 11: -FAILED-
03b705a Revert "TESTHACK 10: -FAILED-"
9810836 TESTHACK 10: -FAILED-
1ecddf2 Revert "TESTHACK 9: -FAILED-"
4dac438 TESTHACK 9: -FAILED-
42dd94f Revert "TESTHACK 8: -FAILED-"
850f605 TESTHACK 8: -FAILED-
6335821 Revert "TESTHACK 7: -PASSED-"
79c3298 TESTHACK 7: -PASSED-
80000ee Revert "TESTHACK 6: -FAILED-"
0b0079f TESTHACK 6: -FAILED-
315b230 Revert "TESTHACK 5: -FAILED-"
0ee67b8 TESTHACK 5: -FAILED-
304f593 Revert "TESTHACK 4: -FAILED-"
da72ff8 TESTHACK 4: -FAILED-
9ccb30a Revert "TESTHACK 3: -FAILED-"
ba6d200 TESTHACK 3: -FAILED-
a3b0dc6 Revert "TESTHACK 2: -FAILED-"
e74d245 TESTHACK 2: -FAILED-
7ec17ff Revert "TESTHACK 1: -FAILED-"
42e6185 TESTHACK 1: -FAILED-
2237c97 Revert "mtd: cfi_cmdset_0001 - fixup for PC28F512P33TFA"

This NOR-flash becomes stable with delay times > 1ms, which is contrary
to what TN-12-06 says, quote: "In all cases, the maximum delay value is
500μs".

Preferably I would go with a cleaned up version of patch "TESTHACK 12",
after some more stress testings have been passed. What do you think?

I now also have a contact to Micron, so I hope they can shed some light
on this issue.

Thanks
 --Christoph

Subject: TESTHACK 1: -FAILED-

UBIFS error (pid 60): ubifs_read_node: bad node type (1 but expected 2)
UBIFS error (pid 60): ubifs_read_node: bad node at LEB 226:60344, LEB mapping status 1
Not a node, first 24 bytes:
00000000: 31 14 10 05 03 43 57 73 31 01 01 00 00 00 00 00 37 00 00 00 01 01 00 00                          1....CWs1.......7.......
CPU: 0 PID: 60 Comm: udevd Not tainted 3.14.0-rc7+ #751
Backtrace:
[<800114e4>] (dump_backtrace) from [<80011684>] (show_stack+0x18/0x1c)
 r6:87bd8000 r5:871f66c0 r4:ffffffea r3:00000000
[<8001166c>] (show_stack) from [<805e3038>] (dump_stack+0x20/0x28)
[<805e3018>] (dump_stack) from [<801fb8a8>] (ubifs_read_node+0x234/0x2ac)
[<801fb674>] (ubifs_read_node) from [<80219820>] (ubifs_tnc_read_node+0x12c/0x13c)
 r10:87248800 r9:87248830 r8:00000030 r7:87bd8000 r6:00000002 r5:871f66c0
 r4:87248830
[<802196f4>] (ubifs_tnc_read_node) from [<801fd14c>] (tnc_read_node_nm+0x68/0x1e0)
 r7:87bd8328 r6:87bd8000 r5:871f66c0 r4:87248830
[<801fd0e4>] (tnc_read_node_nm) from [<80200168>] (ubifs_tnc_next_ent+0x11c/0x1ac)
 r7:87bd8328 r6:871f66c0 r5:87bd8000 r4:87237f00
[<8020004c>] (ubifs_tnc_next_ent) from [<801f2268>] (ubifs_readdir+0x1c0/0x4c0)
 r10:00003718 r9:00000037 r8:00000000 r7:87235280 r6:871f6678 r5:87237f60
 r4:871f6640
[<801f20a8>] (ubifs_readdir) from [<800d138c>] (iterate_dir+0x80/0xa4)
 r10:00000000 r9:87236000 r8:00000000 r7:8742d878 r6:87237f60 r5:8742d8fc
 r4:87235280
[<800d130c>] (iterate_dir) from [<800d1514>] (SyS_getdents64+0x80/0xe8)
 r8:87235280 r7:87235280 r6:00008000 r5:00000002 r4:00825458 r3:800d1024
[<800d1494>] (SyS_getdents64) from [<8000e620>] (ret_fast_syscall+0x0/0x48)
 r10:00000000 r8:8000e7e4 r7:000000d9 r6:00825440 r5:00000002 r4:00825458
UBIFS error (pid 60): ubifs_readdir: cannot find next direntry, error -22
---
 drivers/mtd/chips/cfi_cmdset_0001.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index 7751443..1b3ba65 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -793,7 +793,7 @@ static int chip_ready (struct map_info *map, struct flchip *chip, unsigned long
 		     (mode == FL_WRITING && (cfip->SuspendCmdSupport & 1))))
 			goto sleep;
 
-
+		map_write(map, CMD(0xFF), adr); /* TESTHACK */
 		/* Erase suspend */
 		map_write(map, CMD(0xB0), adr);
 
@@ -803,6 +803,7 @@ static int chip_ready (struct map_info *map, struct flchip *chip, unsigned long
 		 * mode so we get the right data. --rmk
 		 */
 		map_write(map, CMD(0x70), adr);
+		cfi_udelay(500); /* TESTHACK */
 		chip->oldstate = FL_ERASING;
 		chip->state = FL_ERASE_SUSPENDING;
 		chip->erase_suspended = 1;
-- 
1.7.10.4

Subject: TESTHACK 2: -FAILED-

UBIFS error (pid 48): ubifs_read_node: bad node type (5 but expected 9)
UBIFS error (pid 48): ubifs_read_node: bad node at LEB 63:15800, LEB mapping status 1
Not a node, first 24 bytes:
00000000: 31 14 10 05 14 5d 21 35 d5 1f 30 00 00 00 00 00 5c 00 00 00 05 00 00 00                          1....]!5..0.....\.......
CPU: 0 PID: 48 Comm: S00udev Not tainted 3.14.0-rc7+ #752
Backtrace:
[<800114e4>] (dump_backtrace) from [<80011684>] (show_stack+0x18/0x1c)
 r6:87bd8000 r5:87b64d80 r4:ffffffea r3:00000000
[<8001166c>] (show_stack) from [<805e2ff8>] (dump_stack+0x20/0x28)
[<805e2fd8>] (dump_stack) from [<801fb8a8>] (ubifs_read_node+0x234/0x2ac)
[<801fb674>] (ubifs_read_node) from [<80219218>] (ubifs_load_znode+0xa0/0x57c)
 r10:8722dc5c r9:87a46000 r8:00000000 r7:00000002 r6:0000006c r5:87bd8000
 r4:8721d600
[<80219178>] (ubifs_load_znode) from [<801feaec>] (ubifs_lookup_level0+0xc4/0x1e4)
 r10:8722dc5c r9:87a46000 r8:00000000 r7:00000002 r6:8722dcb0 r5:87bd8000
 r4:8722dc58
[<801fea28>] (ubifs_lookup_level0) from [<801fec54>] (ubifs_tnc_locate+0x48/0x198)
 r10:000003dd r8:00000000 r7:00000000 r6:87bd8328 r5:8722dcb0 r4:87bd8000
[<801fec0c>] (ubifs_tnc_locate) from [<801f5b58>] (ubifs_iget+0x7c/0x888)
 r10:000003dd r9:00000000 r8:41c7b4ac r7:871be400 r6:87bd8000 r5:87422b80
 r4:87a46000
[<801f5adc>] (ubifs_iget) from [<801f34b4>] (ubifs_lookup+0xfc/0x1e8)
 r10:000003dd r9:00000000 r8:41c7b4ac r7:871be400 r6:87bd8000 r5:874155c0
 r4:874190b8
[<801f33b8>] (ubifs_lookup) from [<800c8f04>] (lookup_real+0x28/0x58)
 r10:8722dd9c r8:00000000 r7:87bd901b r6:874107e8 r5:874107e8 r4:874190b8
[<800c8edc>] (lookup_real) from [<800c9fd0>] (__lookup_hash+0x3c/0x4c)
 r5:874107e8 r4:00000011
[<800c9f94>] (__lookup_hash) from [<800ca024>] (lookup_slow+0x44/0xa8)
 r5:8722dd9c r4:8722de60
[<800c9fe0>] (lookup_slow) from [<800cacf4>] (link_path_walk+0x2fc/0x7e0)
 r7:87bd901b r6:8722c000 r5:87bd901a r4:8722de60
[<800ca9f8>] (link_path_walk) from [<800cbb00>] (path_lookupat+0x5c/0x704)
 r10:00000000 r9:8722c000 r8:87bd9010 r7:8722c000 r6:00000000 r5:00000041
 r4:8722de60
[<800cbaa4>] (path_lookupat) from [<800cc1d0>] (filename_lookup+0x28/0x68)
 r10:00000000 r9:8722c000 r8:8722df00 r7:8722de60 r6:ffffff9c r5:87bd9000
 r4:00000001
[<800cc1a8>] (filename_lookup) from [<800ce9ac>] (user_path_at_empty+0x5c/0x84)
 r7:ffffff9c r6:8722de60 r5:00000001 r4:87bd9000
[<800ce950>] (user_path_at_empty) from [<800ce9f0>] (user_path_at+0x1c/0x24)
 r8:ffffff9c r7:011e2d5c r6:8722df40 r5:00000001 r4:8722df00
[<800ce9d4>] (user_path_at) from [<800c49b0>] (vfs_fstatat+0x54/0x98)
[<800c495c>] (vfs_fstatat) from [<800c4a40>] (vfs_stat+0x24/0x28)
 r10:00000000 r8:8000e7e4 r7:000000c3 r6:00000001 r5:011e2d24 r4:7e976c50
[<800c4a1c>] (vfs_stat) from [<800c4c68>] (SyS_stat64+0x1c/0x38)
[<800c4c4c>] (SyS_stat64) from [<8000e620>] (ret_fast_syscall+0x0/0x48)
 r4:7e976d80
UBIFS error (pid 48): ubifs_iget: failed to read inode 1039, error -22
UBIFS error (pid 48): ubifs_lookup: dead directory entry 'udev', error -22
UBIFS warning (pid 48): ubifs_ro_mode: switched to read-only mode, error -22
CPU: 0 PID: 48 Comm: S00udev Not tainted 3.14.0-rc7+ #752
Backtrace:
[<800114e4>] (dump_backtrace) from [<80011684>] (show_stack+0x18/0x1c)
 r6:87bd8000 r5:ffffffea r4:874190b8 r3:00000000
[<8001166c>] (show_stack) from [<805e2ff8>] (dump_stack+0x20/0x28)
[<805e2fd8>] (dump_stack) from [<801f991c>] (ubifs_ro_mode+0x6c/0x78)
[<801f98b0>] (ubifs_ro_mode) from [<801f3584>] (ubifs_lookup+0x1cc/0x1e8)
[<801f33b8>] (ubifs_lookup) from [<800c8f04>] (lookup_real+0x28/0x58)
 r10:8722dd9c r8:00000000 r7:87bd901b r6:874107e8 r5:874107e8 r4:874190b8
[<800c8edc>] (lookup_real) from [<800c9fd0>] (__lookup_hash+0x3c/0x4c)
 r5:874107e8 r4:00000011
[<800c9f94>] (__lookup_hash) from [<800ca024>] (lookup_slow+0x44/0xa8)
 r5:8722dd9c r4:8722de60
[<800c9fe0>] (lookup_slow) from [<800cacf4>] (link_path_walk+0x2fc/0x7e0)
 r7:87bd901b r6:8722c000 r5:87bd901a r4:8722de60
[<800ca9f8>] (link_path_walk) from [<800cbb00>] (path_lookupat+0x5c/0x704)
 r10:00000000 r9:8722c000 r8:87bd9010 r7:8722c000 r6:00000000 r5:00000041
 r4:8722de60
[<800cbaa4>] (path_lookupat) from [<800cc1d0>] (filename_lookup+0x28/0x68)
 r10:00000000 r9:8722c000 r8:8722df00 r7:8722de60 r6:ffffff9c r5:87bd9000
 r4:00000001
[<800cc1a8>] (filename_lookup) from [<800ce9ac>] (user_path_at_empty+0x5c/0x84)
 r7:ffffff9c r6:8722de60 r5:00000001 r4:87bd9000
[<800ce950>] (user_path_at_empty) from [<800ce9f0>] (user_path_at+0x1c/0x24)
 r8:ffffff9c r7:011e2d5c r6:8722df40 r5:00000001 r4:8722df00
[<800ce9d4>] (user_path_at) from [<800c49b0>] (vfs_fstatat+0x54/0x98)
[<800c495c>] (vfs_fstatat) from [<800c4a40>] (vfs_stat+0x24/0x28)
 r10:00000000 r8:8000e7e4 r7:000000c3 r6:00000001 r5:011e2d24 r4:7e976c50
[<800c4a1c>] (vfs_stat) from [<800c4c68>] (SyS_stat64+0x1c/0x38)
[<800c4c4c>] (SyS_stat64) from [<8000e620>] (ret_fast_syscall+0x0/0x48)
 r4:7e976d80
---
 drivers/mtd/chips/cfi_cmdset_0001.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index 7751443..6c66a4c 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -1003,8 +1003,10 @@ static void put_chip(struct map_info *map, struct flchip *chip, unsigned long ad
 		   sending the 0x70 (Read Status) command to an erasing
 		   chip and expecting it to be ignored, that's what we
 		   do. */
+		map_write(map, CMD(0xFF), adr);
 		map_write(map, CMD(0xd0), adr);
 		map_write(map, CMD(0x70), adr);
+		cfi_udelay(500);
 		chip->oldstate = FL_READY;
 		chip->state = FL_ERASING;
 		break;
-- 
1.7.10.4

Subject: TESTHACK 3: -FAILED-

waiting for devices...UBIFS error (pid 60): ubifs_read_node: bad node type (1 but expected 2)
UBIFS error (pid 60): ubifs_read_node: bad node at LEB 232:70168, LEB mapping status 1
        magic          0x6101831
        crc            0xc5d4fc9
        node_type      1 (data node)
        group_type     1 (in node group)
        sqnum          136617
        len            66
        key            (1529, direntry, 0x6df0531)
        size           268450275
        compr_typ      0
        data size      18
        data:
        00000000: 00 00 09 00 00 00 00 00 71 75 65 75 65 2e 74 6d 70 00
CPU: 0 PID: 60 Comm: udevd Not tainted 3.14.0-rc7+ #753
Backtrace:
[<800114e4>] (dump_backtrace) from [<80011684>] (show_stack+0x18/0x1c)
 r6:87bd8000 r5:8733a380 r4:ffffffea r3:00000000
[<8001166c>] (show_stack) from [<805e3160>] (dump_stack+0x20/0x28)
[<805e3140>] (dump_stack) from [<801fb8a8>] (ubifs_read_node+0x234/0x2ac)
[<801fb674>] (ubifs_read_node) from [<801fb9e0>] (ubifs_read_node_wbuf+0xc0/0x320)
 r10:87bccd5c r9:00000002 r8:000000e8 r7:00011218 r6:87bd8000 r5:8733a380
 r4:87bcccf0
[<801fb920>] (ubifs_read_node_wbuf) from [<80219748>] (ubifs_tnc_read_node+0x54/0x13c)
 r10:87502398 r9:875023c0 r8:87bd8000 r7:87bd8000 r6:00000002 r5:8733a380
 r4:871ac390
[<802196f4>] (ubifs_tnc_read_node) from [<801fcdb8>] (matches_name+0xa4/0xd4)
 r7:87bd8000 r6:871ac390 r5:875023c0 r4:8733a380
[<801fcd14>] (matches_name) from [<801fce2c>] (resolve_collision+0x44/0x2fc)
 r8:87bd8000 r7:87257ce4 r6:87257d58 r5:87257ce0 r4:87bd8000 r3:00000060
[<801fcde8>] (resolve_collision) from [<801ffaf4>] (ubifs_tnc_remove_nm+0x8c/0x12c)
 r10:87502398 r9:87502198 r8:00000001 r7:875023c0 r6:87bd8328 r5:87257d58
 r4:87bd8000
[<801ffa68>] (ubifs_tnc_remove_nm) from [<801ee9ec>] (ubifs_jnl_rename+0x58c/0x8c4)
 r8:000005f1 r7:87bd8000 r6:0adf0631 r5:874f1050 r4:87253c00
[<801ee460>] (ubifs_jnl_rename) from [<801f2854>] (ubifs_rename+0x29c/0x6a4)
 r10:87502170 r9:87502398 r8:874f1050 r7:8742cae0 r6:00000005 r5:874f2b80
 r4:8742cae0
[<801f25b8>] (ubifs_rename) from [<800cd3c4>] (vfs_rename+0x3fc/0x524)
 r10:00000000 r9:8742cae0 r8:874f2b80 r7:8742cae0 r6:00000000 r5:87502170
 r4:87502398
[<800ccfc8>] (vfs_rename) from [<800cf3bc>] (SyS_renameat+0x1e4/0x294)
 r10:ffffff9c r9:00000000 r8:7e81b6e0 r7:ffffff9c r6:87329000 r5:8732c000
 r4:87502398
[<800cf1d8>] (SyS_renameat) from [<800cf490>] (SyS_rename+0x24/0x28)
 r10:00000000 r9:87256000 r8:8000e7e4 r7:00000026 r6:0086a108 r5:00000000
 r4:0086a108
[<800cf46c>] (SyS_rename) from [<8000e620>] (ret_fast_syscall+0x0/0x48)
UBIFS warning (pid 60): ubifs_ro_mode: switched to read-only mode, error -22
CPU: 0 PID: 60 Comm: udevd Not tainted 3.14.0-rc7+ #753
Backtrace:
[<800114e4>] (dump_backtrace) from [<80011684>] (show_stack+0x18/0x1c)
 r6:ffffffea r5:874f1050 r4:87253c00 r3:00000000
[<8001166c>] (show_stack) from [<805e3160>] (dump_stack+0x20/0x28)
[<805e3140>] (dump_stack) from [<801f991c>] (ubifs_ro_mode+0x6c/0x78)
[<801f98b0>] (ubifs_ro_mode) from [<801ee8b0>] (ubifs_jnl_rename+0x450/0x8c4)
[<801ee460>] (ubifs_jnl_rename) from [<801f2854>] (ubifs_rename+0x29c/0x6a4)
 r10:87502170 r9:87502398 r8:874f1050 r7:8742cae0 r6:00000005 r5:874f2b80
 r4:8742cae0
[<801f25b8>] (ubifs_rename) from [<800cd3c4>] (vfs_rename+0x3fc/0x524)
 r10:00000000 r9:8742cae0 r8:874f2b80 r7:8742cae0 r6:00000000 r5:87502170
 r4:87502398
[<800ccfc8>] (vfs_rename) from [<800cf3bc>] (SyS_renameat+0x1e4/0x294)
 r10:ffffff9c r9:00000000 r8:7e81b6e0 r7:ffffff9c r6:87329000 r5:8732c000
 r4:87502398
[<800cf1d8>] (SyS_renameat) from [<800cf490>] (SyS_rename+0x24/0x28)
 r10:00000000 r9:87256000 r8:8000e7e4 r7:00000026 r6:0086a108 r5:00000000
 r4:0086a108
[<800cf46c>] (SyS_rename) from [<8000e620>] (ret_fast_syscall+0x0/0x48)
UBIFS error (pid 30): make_reservation: cannot reserve 160 bytes in jhead 1, error -30
UBIFS error (pid 30): ubifs_write_inode: can't write inode 14769, error -30
UBIFS error (pid 30): make_reservation: cannot reserve 160 bytes in jhead 1, error -30
UBIFS error (pid 30): ubifs_write_inode: can't write inode 14771, error -30
UBIFS error (pid 30): make_reservation: cannot reserve 160 bytes in jhead 1, error -30
UBIFS error (pid 30): ubifs_write_inode: can't write inode 14770, error -30
UBIFS error (pid 30): make_reservation: cannot reserve 160 bytes in jhead 1, error -30
UBIFS error (pid 30): ubifs_write_inode: can't write inode 14772, error -30
UBIFS error (pid 30): make_reservation: cannot reserve 160 bytes in jhead 1, error -30
UBIFS error (pid 30): ubifs_write_inode: can't write inode 14773, error -30
UBIFS error (pid 30): make_reservation: cannot reserve 160 bytes in jhead 1, error -30
UBIFS error (pid 30): ubifs_write_inode: can't write inode 14775, error -30
UBIFS error (pid 30): make_reservation: cannot reserve 160 bytes in jhead 1, error -30
UBIFS error (pid 30): ubifs_write_inode: can't write inode 14774, error -30
UBIFS error (pid 30): make_reservation: cannot reserve 160 bytes in jhead 1, error -30
UBIFS error (pid 30): ubifs_write_inode: can't write inode 14776, error -30
UBIFS error (pid 30): make_reservation: cannot reserve 160 bytes in jhead 1, error -30
UBIFS error (pid 30): ubifs_write_inode: can't write inode 14797, error -30
UBIFS error (pid 30): make_reservation: cannot reserve 160 bytes in jhead 1, error -30
UBIFS error (pid 30): ubifs_write_inode: can't write inode 14800, error -30
UBIFS error (pid 30): make_reservation: cannot reserve 160 bytes in jhead 1, error -30
UBIFS error (pid 30): ubifs_write_inode: can't write inode 14818, error -30
UBIFS error (pid 30): make_reservation: cannot reserve 160 bytes in jhead 1, error -30
UBIFS error (pid 30): ubifs_write_inode: can't write inode 14819, error -30

udevadm settle - timeout of 10 seconds reached, the event queue contains:
  /sys/devices/platform/mxc_ahb/imx35-sdma/dma/dma1chan6 (795)
failed
---
 drivers/mtd/chips/cfi_cmdset_0001.c |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index 7751443..51e326a 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -795,6 +795,7 @@ static int chip_ready (struct map_info *map, struct flchip *chip, unsigned long
 
 
 		/* Erase suspend */
+		map_write(map, CMD(0xFF), adr);
 		map_write(map, CMD(0xB0), adr);
 
 		/* If the flash has finished erasing, then 'erase suspend'
@@ -803,6 +804,7 @@ static int chip_ready (struct map_info *map, struct flchip *chip, unsigned long
 		 * mode so we get the right data. --rmk
 		 */
 		map_write(map, CMD(0x70), adr);
+		cfi_udelay(500);
 		chip->oldstate = FL_ERASING;
 		chip->state = FL_ERASE_SUSPENDING;
 		chip->erase_suspended = 1;
@@ -1003,10 +1005,12 @@ static void put_chip(struct map_info *map, struct flchip *chip, unsigned long ad
 		   sending the 0x70 (Read Status) command to an erasing
 		   chip and expecting it to be ignored, that's what we
 		   do. */
+		map_write(map, CMD(0xFF), adr);
 		map_write(map, CMD(0xd0), adr);
 		map_write(map, CMD(0x70), adr);
 		chip->oldstate = FL_READY;
 		chip->state = FL_ERASING;
+		cfi_udelay(500);
 		break;
 
 	case FL_XIP_WHILE_ERASING:
-- 
1.7.10.4

Subject: TESTHACK 4: -FAILED-

UBIFS error (pid 1): ubifs_read_node: bad node type (5 but expected 9)
UBIFS error (pid 1): ubifs_read_node: bad node at LEB 225:80208, LEB mapping status 1
Not a node, first 24 bytes:
00000000: 31 14 10 05 11 4d 41 4c 15 14 01 00 00 00 00 00 5c 00 00 00 05 00 00 00                          1....MAL........\.......
CPU: 0 PID: 1 Comm: swapper Not tainted 3.14.0-rc7+ #755
Backtrace:
[<800114e4>] (dump_backtrace) from [<80011684>] (show_stack+0x18/0x1c)
 r6:87bd8000 r5:87b64840 r4:ffffffea r3:00000000
[<8001166c>] (show_stack) from [<805e3384>] (dump_stack+0x20/0x28)
[<805e3364>] (dump_stack) from [<801fb8a8>] (ubifs_read_node+0x234/0x2ac)
[<801fb674>] (ubifs_read_node) from [<80219218>] (ubifs_load_znode+0xa0/0x57c)
 r10:87843bb4 r9:ffffffff r8:00000000 r7:00000002 r6:0000006c r5:87bd8000
 r4:87191a00
[<80219178>] (ubifs_load_znode) from [<801feaec>] (ubifs_lookup_level0+0xc4/0x1e4)
 r10:87843bb4 r9:ffffffff r8:00000000 r7:00000002 r6:87843c00 r5:87bd8000
 r4:87843bb0
[<801fea28>] (ubifs_lookup_level0) from [<802000b4>] (ubifs_tnc_next_ent+0x68/0x1ac)
 r10:00000000 r8:000025b8 r7:87bd8328 r6:87843bf0 r5:87bd8000 r4:87843c00
[<8020004c>] (ubifs_tnc_next_ent) from [<80200284>] (ubifs_tnc_remove_ino+0x8c/0x150)
 r10:00000000 r9:ffffffff r8:000025b8 r7:87bd8000 r6:871ab5e0 r5:87bd8000
 r4:87bd8c24
[<802001f8>] (ubifs_tnc_remove_ino) from [<802030bc>] (ubifs_replay_journal+0xd5c/0x1614)
 r10:87bd8c24 r9:00000000 r8:000025b8 r7:87bd8000 r6:871ab5e0 r5:871ab5c0
 r4:87bd8c24
[<80202360>] (ubifs_replay_journal) from [<801f7438>] (ubifs_mount+0x10d4/0x1778)
 r10:00000003 r9:801f4320 r8:87bd8008 r7:0001ff80 r6:87bd8000 r5:87bcc400
 r4:00000000
[<801f6364>] (ubifs_mount) from [<800c3888>] (mount_fs+0x1c/0xd8)
 r10:00000000 r9:87842000 r8:00008000 r7:800df420 r6:808246f0 r5:808246f0
 r4:87b64540
[<800c386c>] (mount_fs) from [<800dd28c>] (vfs_kern_mount+0x5c/0x144)
 r9:87842000 r8:00008000 r6:87bc2dc0 r5:808246f0 r4:87b64540
[<800dd230>] (vfs_kern_mount) from [<800df420>] (do_mount+0x1a0/0xa38)
 r10:87bc2e00 r8:87bc2dc0 r7:00000000 r6:808246f0 r5:00000020 r4:80819548
[<800df280>] (do_mount) from [<800e000c>] (SyS_mount+0x8c/0xc0)
 r10:807fddc4 r9:87fdcee0 r8:000000b9 r7:00000000 r6:00008000 r5:807fddc4
 r4:87827000
[<800dff80>] (SyS_mount) from [<807d3fb0>] (mount_block_root+0x104/0x23c)
 r7:871f7000 r6:807fddb8 r5:00008000 r4:871f7000
[<807d3eac>] (mount_block_root) from [<807d438c>] (prepare_namespace+0x94/0x1cc)
 r10:80808198 r9:807d34c0 r8:000000b9 r7:8085efc0 r6:807fdd90 r5:807fddc4
 r4:807fddb8
[<807d42f8>] (prepare_namespace) from [<807d3c64>] (kernel_init_freeable+0x178/0x1bc)
 r5:00000007 r4:807fddb0
[<807d3aec>] (kernel_init_freeable) from [<805de91c>] (kernel_init+0x10/0xec)
 r10:00000000 r9:00000000 r8:00000000 r7:00000000 r6:00000000 r5:805de90c
 r4:00000000
[<805de90c>] (kernel_init) from [<8000e6e8>] (ret_from_fork+0x14/0x2c)
 r4:00000000 r3:00000000
UBIFS: background thread "ubifs_bgt0_0" stops
List of all partitions:
1f00             256 mtdblock0  (driver?)
1f01             128 mtdblock1  (driver?)
1f02            2048 mtdblock2  (driver?)
1f03           63104 mtdblock3  (driver?)
No filesystem could mount root, tried:  ubifs
Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,0)
drm_kms_helper: panic occurred, switching back to text console
---
 drivers/mtd/chips/cfi_cmdset_0001.c |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index 7751443..c660510 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -795,6 +795,7 @@ static int chip_ready (struct map_info *map, struct flchip *chip, unsigned long
 
 
 		/* Erase suspend */
+		map_write(map, CMD(0xFF), adr);
 		map_write(map, CMD(0xB0), adr);
 
 		/* If the flash has finished erasing, then 'erase suspend'
@@ -803,6 +804,7 @@ static int chip_ready (struct map_info *map, struct flchip *chip, unsigned long
 		 * mode so we get the right data. --rmk
 		 */
 		map_write(map, CMD(0x70), adr);
+		cfi_udelay(500);
 		chip->oldstate = FL_ERASING;
 		chip->state = FL_ERASE_SUSPENDING;
 		chip->erase_suspended = 1;
@@ -1003,10 +1005,12 @@ static void put_chip(struct map_info *map, struct flchip *chip, unsigned long ad
 		   sending the 0x70 (Read Status) command to an erasing
 		   chip and expecting it to be ignored, that's what we
 		   do. */
+		map_write(map, CMD(0xFF), adr);
 		map_write(map, CMD(0xd0), adr);
 		map_write(map, CMD(0x70), adr);
 		chip->oldstate = FL_READY;
 		chip->state = FL_ERASING;
+		cfi_udelay(500);
 		break;
 
 	case FL_XIP_WHILE_ERASING:
@@ -1881,12 +1885,15 @@ static int __xipram do_erase_oneblock(struct map_info *map, struct flchip *chip,
 	ENABLE_VPP(map);
 	xip_disable(map, chip, adr);
 
+	map_write(map, CMD(0xFF), adr);
 	/* Clear the status register first */
 	map_write(map, CMD(0x50), adr);
 
+	map_write(map, CMD(0xFF), adr);
 	/* Now erase */
 	map_write(map, CMD(0x20), adr);
 	map_write(map, CMD(0xD0), adr);
+	cfi_udelay(500);
 	chip->state = FL_ERASING;
 	chip->erase_suspended = 0;
 
-- 
1.7.10.4

Subject: TESTHACK 5: -FAILED-

UBIFS: background thread "ubifs_bgt0_0" started, PID 38
UBIFS: recovery needed
UBIFS: recovery completed
UBIFS: mounted UBI device 0, volume 0, name "root"
UBIFS: LEB size: 130944 bytes (127 KiB), min./max. I/O unit sizes: 8 bytes/1024 bytes
UBIFS: FS size: 62722176 bytes (59 MiB, 479 LEBs), journal size 3142656 bytes (2 MiB, 24 LEBs)
UBIFS: reserved for root: 2962522 bytes (2893 KiB)
UBIFS: media format: w4/r0 (latest is w4/r0), UUID A99471B3-AF9C-4AD1-BADA-24160A897F38, small LPT model
UBIFS error (pid 1): ubifs_check_node: bad CRC: calculated 0x1f1060dc, read 0x3d7aa58
UBIFS error (pid 1): ubifs_check_node: bad node at LEB 186:69160
        magic          0x6101831
        crc            0x3d7aa58
        node_type      9 (indexing node)
        group_type     0 (no node group)
        sqnum          21552
        len            188
        child_cnt      8
        level          0
        Branches:
        0: LEB 214:98416 len 160 key (1, inode)
        1: LEB 214:98192 len 58 key (1, direntry, 0x002121)
        2: LEB 20:58800 len 60 key (1, direntry, 0x23605a)
        3: LEB 20:124216 len 60 key (1, direntry, 0x23ee05)
        4: LEB 20:87728 len 60 key (1, direntry, 0x24a603)
        5: LEB 20:124752 len 60 key (1, direntry, 0x2697f6)
        6: LEB 11:544 len 60 key (1, direntry, 0x271d65)
CPU: 0 PID: 1 Comm: swapper Not tainted 3.14.0-rc7+ #756
Backtrace:
[<800114e4>] (dump_backtrace) from [<80011684>] (show_stack+0x18/0x1c)
 r6:87bd8000 r5:00010e28 r4:87b64840 r3:00000000
[<8001166c>] (show_stack) from [<805e2edc>] (dump_stack+0x20/0x28)
[<805e2ebc>] (dump_stack) from [<801fa168>] (ubifs_check_node+0x1c0/0x2c4)
[<801f9fa8>] (ubifs_check_node) from [<801fb758>] (ubifs_read_node+0xe4/0x2ac)
 r10:00000009 r8:000000bc r7:00010e28 r6:87bd8000 r5:87b64840 r4:00000000
[<801fb674>] (ubifs_read_node) from [<80219218>] (ubifs_load_znode+0xa0/0x57c)
 r10:87843cbc r9:87a46000 r8:00000000 r7:00000003 r6:000000bc r5:87bd8000
 r4:871ad300
[<80219178>] (ubifs_load_znode) from [<801feaec>] (ubifs_lookup_level0+0xc4/0x1e4)
 r10:87843cbc r9:87a46000 r8:00000000 r7:00000003 r6:87843d10 r5:87bd8000
 r4:87843cb8
[<801fea28>] (ubifs_lookup_level0) from [<801fec54>] (ubifs_tnc_locate+0x48/0x198)
 r10:00000003 r8:00000000 r7:00000000 r6:87bd8328 r5:87843d10 r4:87bd8000
[<801fec0c>] (ubifs_tnc_locate) from [<801f5b58>] (ubifs_iget+0x7c/0x888)
 r10:00000003 r9:801f4320 r8:87bd8008 r7:00000000 r6:87bd8000 r5:87414000
 r4:87a46000
[<801f5adc>] (ubifs_iget) from [<801f6dd0>] (ubifs_mount+0xa6c/0x1778)
 r10:00000003 r9:801f4320 r8:87bd8008 r7:00000000 r6:87bd8000 r5:87bcc400
 r4:00000000
[<801f6364>] (ubifs_mount) from [<800c3888>] (mount_fs+0x1c/0xd8)
 r10:00000000 r9:87842000 r8:00008000 r7:800df420 r6:808246f0 r5:808246f0
 r4:87b64540
[<800c386c>] (mount_fs) from [<800dd28c>] (vfs_kern_mount+0x5c/0x144)
 r9:87842000 r8:00008000 r6:87bc2dc0 r5:808246f0 r4:87b64540
[<800dd230>] (vfs_kern_mount) from [<800df420>] (do_mount+0x1a0/0xa38)
 r10:87bc2e00 r8:87bc2dc0 r7:00000000 r6:808246f0 r5:00000020 r4:80819548
[<800df280>] (do_mount) from [<800e000c>] (SyS_mount+0x8c/0xc0)
 r10:807fddc4 r9:87fdcee0 r8:000000b9 r7:00000000 r6:00008000 r5:807fddc4
 r4:87827000
[<800dff80>] (SyS_mount) from [<807d3fb0>] (mount_block_root+0x104/0x23c)
 r7:871f7000 r6:807fddb8 r5:00008000 r4:871f7000
[<807d3eac>] (mount_block_root) from [<807d438c>] (prepare_namespace+0x94/0x1cc)
 r10:80808198 r9:807d34c0 r8:000000b9 r7:8085efc0 r6:807fdd90 r5:807fddc4
 r4:807fddb8
[<807d42f8>] (prepare_namespace) from [<807d3c64>] (kernel_init_freeable+0x178/0x1bc)
 r5:00000007 r4:807fddb0
[<807d3aec>] (kernel_init_freeable) from [<805de474>] (kernel_init+0x10/0xec)
 r10:00000000 r9:00000000 r8:00000000 r7:00000000 r6:00000000 r5:805de464
 r4:00000000
[<805de464>] (kernel_init) from [<8000e6e8>] (ret_from_fork+0x14/0x2c)
 r4:00000000 r3:00000000
UBIFS error (pid 1): ubifs_read_node: expected node type 9
UBIFS error (pid 1): ubifs_iget: failed to read inode 1, error -117
UBIFS: background thread "ubifs_bgt0_0" stops
VFS: Cannot open root device "ubi0:root" or unknown-block(0,0): error -117
Please append a correct "root=" boot option; here are the available partitions:
1f00             256 mtdblock0  (driver?)
1f01             128 mtdblock1  (driver?)
1f02            2048 mtdblock2  (driver?)
1f03           63104 mtdblock3  (driver?)
Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,0)
drm_kms_helper: panic occurred, switching back to text console
---
 drivers/mtd/chips/cfi_cmdset_0001.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index 7751443..0693c2f 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -474,6 +474,8 @@ struct mtd_info *cfi_cmdset_0001(struct map_info *map, int primary)
 			return NULL;
 		}
 
+		extp->SuspendCmdSupport &= ~1; /*HACK*/
+
 		/* Install our own private info structure */
 		cfi->cmdset_priv = extp;
 
-- 
1.7.10.4

Subject: TESTHACK 6: -FAILED-

https://github.com/andrea-adami/meta-handheld/commit/52dd18e45a388310dd6db9396034422dd8b1ba0e

taken from:

http://patchwork.ozlabs.org/patch/143476/

waiting for devices...UBIFS error (pid 60): ubifs_check_node: bad magic 0x5101401, expected 0x6101831
UBIFS error (pid 60): ubifs_check_node: bad node at LEB 171:29552
Not a node, first 24 bytes:
00000000: 01 14 10 05 c5 5f 7c 75 0c 53 00 00 00 00 00 00 42 00 00 00 02 01 00 00                          ....._|u.S......B.......
CPU: 0 PID: 60 Comm: udevd Not tainted 3.14.0-rc7+ #759
Backtrace:
[<800114e4>] (dump_backtrace) from [<80011684>] (show_stack+0x18/0x1c)
 r6:87bd8000 r5:00007370 r4:872b5700 r3:00000000
[<8001166c>] (show_stack) from [<805e2fc8>] (dump_stack+0x20/0x28)
[<805e2fa8>] (dump_stack) from [<801fa168>] (ubifs_check_node+0x1c0/0x2c4)
[<801f9fa8>] (ubifs_check_node) from [<801fb758>] (ubifs_read_node+0xe4/0x2ac)
 r10:00000002 r8:00000042 r7:00007370 r6:87bd8000 r5:872b5700 r4:00000000
[<801fb674>] (ubifs_read_node) from [<801fb9e0>] (ubifs_read_node_wbuf+0xc0/0x320)
 r10:87bccd5c r9:00000002 r8:000000ab r7:00007370 r6:87bd8000 r5:872b5700
 r4:87bcccf0
[<801fb920>] (ubifs_read_node_wbuf) from [<80219748>] (ubifs_tnc_read_node+0x54/0x13c)
 r10:875047e8 r9:87504810 r8:87bd8000 r7:87bd8000 r6:00000002 r5:872b5700
 r4:87244948
[<802196f4>] (ubifs_tnc_read_node) from [<801fcdb8>] (matches_name+0xa4/0xd4)
 r7:87bd8000 r6:87244948 r5:87504810 r4:872b5700
[<801fcd14>] (matches_name) from [<801fce2c>] (resolve_collision+0x44/0x2fc)
 r8:87bd8000 r7:87247ce4 r6:87247d58 r5:87247ce0 r4:87bd8000 r3:00000018
[<801fcde8>] (resolve_collision) from [<801ffaf4>] (ubifs_tnc_remove_nm+0x8c/0x12c)
 r10:875047e8 r9:87504980 r8:00000001 r7:87504810 r6:87bd8328 r5:87247d58
 r4:87bd8000
[<801ffa68>] (ubifs_tnc_remove_nm) from [<801ee9ec>] (ubifs_jnl_rename+0x58c/0x8c4)
 r8:000004e2 r7:87bd8000 r6:0adf0631 r5:874f8ae0 r4:87257e00
[<801ee460>] (ubifs_jnl_rename) from [<801f2854>] (ubifs_rename+0x29c/0x6a4)
 r10:87504958 r9:875047e8 r8:874f8ae0 r7:874233a8 r6:00000004 r5:874f95c0
 r4:874233a8
[<801f25b8>] (ubifs_rename) from [<800cd3c4>] (vfs_rename+0x3fc/0x524)
 r10:00000000 r9:874233a8 r8:874f95c0 r7:874233a8 r6:00000000 r5:87504958
 r4:875047e8
[<800ccfc8>] (vfs_rename) from [<800cf3bc>] (SyS_renameat+0x1e4/0x294)
 r10:ffffff9c r9:00000000 r8:7efa86e0 r7:ffffff9c r6:87bda000 r5:87bdc000
 r4:875047e8
[<800cf1d8>] (SyS_renameat) from [<800cf490>] (SyS_rename+0x24/0x28)
 r10:00000000 r9:87246000 r8:8000e7e4 r7:00000026 r6:017da108 r5:00000000
 r4:017da108
[<800cf46c>] (SyS_rename) from [<8000e620>] (ret_fast_syscall+0x0/0x48)
UBIFS error (pid 60): ubifs_read_node: expected node type 2
UBIFS warning (pid 60): ubifs_ro_mode: switched to read-only mode, error -117
CPU: 0 PID: 60 Comm: udevd Not tainted 3.14.0-rc7+ #759
Backtrace:
[<800114e4>] (dump_backtrace) from [<80011684>] (show_stack+0x18/0x1c)
 r6:ffffff8b r5:874f8ae0 r4:87257e00 r3:00000000
[<8001166c>] (show_stack) from [<805e2fc8>] (dump_stack+0x20/0x28)
[<805e2fa8>] (dump_stack) from [<801f991c>] (ubifs_ro_mode+0x6c/0x78)
[<801f98b0>] (ubifs_ro_mode) from [<801ee8b0>] (ubifs_jnl_rename+0x450/0x8c4)
[<801ee460>] (ubifs_jnl_rename) from [<801f2854>] (ubifs_rename+0x29c/0x6a4)
 r10:87504958 r9:875047e8 r8:874f8ae0 r7:874233a8 r6:00000004 r5:874f95c0
 r4:874233a8
[<801f25b8>] (ubifs_rename) from [<800cd3c4>] (vfs_rename+0x3fc/0x524)
 r10:00000000 r9:874233a8 r8:874f95c0 r7:874233a8 r6:00000000 r5:87504958
 r4:875047e8
[<800ccfc8>] (vfs_rename) from [<800cf3bc>] (SyS_renameat+0x1e4/0x294)
 r10:ffffff9c r9:00000000 r8:7efa86e0 r7:ffffff9c r6:87bda000 r5:87bdc000
 r4:875047e8
[<800cf1d8>] (SyS_renameat) from [<800cf490>] (SyS_rename+0x24/0x28)
 r10:00000000 r9:87246000 r8:8000e7e4 r7:00000026 r6:017da108 r5:00000000
 r4:017da108
[<800cf46c>] (SyS_rename) from [<8000e620>] (ret_fast_syscall+0x0/0x48)
UBIFS error (pid 30): make_reservation: cannot reserve 160 bytes in jhead 1, error -30
UBIFS error (pid 30): ubifs_write_inode: can't write inode 1855, error -30
UBIFS error (pid 30): make_reservation: cannot reserve 160 bytes in jhead 1, error -30
UBIFS error (pid 30): ubifs_write_inode: can't write inode 1857, error -30
UBIFS error (pid 30): make_reservation: cannot reserve 160 bytes in jhead 1, error -30
UBIFS error (pid 30): ubifs_write_inode: can't write inode 1856, error -30
UBIFS error (pid 30): make_reservation: cannot reserve 160 bytes in jhead 1, error -30
UBIFS error (pid 30): ubifs_write_inode: can't write inode 1858, error -30
UBIFS error (pid 30): make_reservation: cannot reserve 160 bytes in jhead 1, error -30
UBIFS error (pid 30): ubifs_write_inode: can't write inode 1862, error -30
UBIFS error (pid 30): make_reservation: cannot reserve 160 bytes in jhead 1, error -30
UBIFS error (pid 30): ubifs_write_inode: can't write inode 1865, error -30
UBIFS error (pid 30): make_reservation: cannot reserve 160 bytes in jhead 1, error -30
UBIFS error (pid 30): ubifs_write_inode: can't write inode 1864, error -30
UBIFS error (pid 30): make_reservation: cannot reserve 160 bytes in jhead 1, error -30
UBIFS error (pid 30): ubifs_write_inode: can't write inode 1866, error -30
UBIFS error (pid 30): make_reservation: cannot reserve 160 bytes in jhead 1, error -30
UBIFS error (pid 30): ubifs_write_inode: can't write inode 1895, error -30
UBIFS error (pid 30): make_reservation: cannot reserve 160 bytes in jhead 1, error -30
UBIFS error (pid 30): ubifs_write_inode: can't write inode 1897, error -30
UBIFS error (pid 30): make_reservation: cannot reserve 160 bytes in jhead 1, error -30
UBIFS error (pid 30): ubifs_write_inode: can't write inode 1906, error -30
UBIFS error (pid 30): make_reservation: cannot reserve 160 bytes in jhead 1, error -30
UBIFS error (pid 30): ubifs_write_inode: can't write inode 1907, error -30

udevadm settle - timeout of 10 seconds reached, the event queue contains:
---
 drivers/mtd/chips/cfi_cmdset_0001.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index 7751443..9a933fe 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -1208,7 +1208,7 @@ static int inval_cache_and_wait_for_operation(
 		unsigned int chip_op_time, unsigned int chip_op_time_max)
 {
 	struct cfi_private *cfi = map->fldrv_priv;
-	map_word status, status_OK = CMD(0x80);
+	map_word status, status_OK = CMD(0x80), status_76 = (chip->state == FL_ERASING) ? CMD(0xc0) : CMD(0x80);
 	int chip_state = chip->state;
 	unsigned int timeo, sleep_time, reset_timeo;
 
@@ -1237,7 +1237,7 @@ static int inval_cache_and_wait_for_operation(
 		}
 
 		status = map_read(map, cmd_adr);
-		if (map_word_andequal(map, status, status_OK, status_OK))
+		if (map_word_andequal(map, status, status_76, status_OK))
 			break;
 
 		if (chip->erase_suspended && chip_state == FL_ERASING)  {
-- 
1.7.10.4

Subject: TESTHACK 7: -PASSED-

---
 drivers/mtd/chips/cfi_cmdset_0001.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index 7751443..7acaf9c 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -1003,8 +1003,10 @@ static void put_chip(struct map_info *map, struct flchip *chip, unsigned long ad
 		   sending the 0x70 (Read Status) command to an erasing
 		   chip and expecting it to be ignored, that's what we
 		   do. */
+		map_write(map, CMD(0xFF), adr);
 		map_write(map, CMD(0xd0), adr);
 		map_write(map, CMD(0x70), adr);
+		cfi_udelay(1024);
 		chip->oldstate = FL_READY;
 		chip->state = FL_ERASING;
 		break;
-- 
1.7.10.4

Subject: TESTHACK 8: -FAILED-

UBIFS error (pid 60): ubifs_check_node: bad magic 0x5101431, expected 0x6101831
UBIFS error (pid 60): ubifs_check_node: bad node at LEB 176:27712
Not a node, first 24 bytes:
00000000: 31 14 10 05 4c 44 5c 51 7d 75 00 00 00 00 00 00 50 00 00 00 00 01 00 00                          1...LD\Q}u......P.......
CPU: 0 PID: 60 Comm: udevd Not tainted 3.14.0-rc7+ #761
Backtrace:
[<800114e4>] (dump_backtrace) from [<80011684>] (show_stack+0x18/0x1c)
 r6:87bd8000 r5:00006c40 r4:87a46000 r3:00000000
[<8001166c>] (show_stack) from [<805e2ff8>] (dump_stack+0x20/0x28)
[<805e2fd8>] (dump_stack) from [<801fa168>] (ubifs_check_node+0x1c0/0x2c4)
[<801f9fa8>] (ubifs_check_node) from [<801fb758>] (ubifs_read_node+0xe4/0x2ac)
 r10:00000000 r8:000000a0 r7:00006c40 r6:87bd8000 r5:87a46000 r4:00000000
[<801fb674>] (ubifs_read_node) from [<801fb9e0>] (ubifs_read_node_wbuf+0xc0/0x320)
 r10:87bccd5c r9:00000000 r8:000000b0 r7:00006c40 r6:87bd8000 r5:87a46000
 r4:87bcccf0
[<801fb920>] (ubifs_read_node_wbuf) from [<80219748>] (ubifs_tnc_read_node+0x54/0x13c)
 r10:00000000 r9:87a46000 r8:00000000 r7:87bd8000 r6:00000000 r5:87a46000
 r4:8723dcf8
[<802196f4>] (ubifs_tnc_read_node) from [<801fed9c>] (ubifs_tnc_locate+0x190/0x198)
 r7:00000000 r6:87bd8328 r5:8723dd68 r4:87bd8000
[<801fec0c>] (ubifs_tnc_locate) from [<801f5b58>] (ubifs_iget+0x7c/0x888)
 r10:000004e5 r9:00000000 r8:41736e1b r7:871bec00 r6:87bd8000 r5:8742e358
 r4:87a46000
[<801f5adc>] (ubifs_iget) from [<801f34b4>] (ubifs_lookup+0xfc/0x1e8)
 r10:000004e5 r9:00000000 r8:41736e1b r7:871bec00 r6:87bd8000 r5:8742cae0
 r4:8745e678
[<801f33b8>] (ubifs_lookup) from [<800c8f04>] (lookup_real+0x28/0x58)
 r10:00000000 r8:8723de80 r7:87426cf0 r6:00020000 r5:8723df5c r4:8745e678
[<800c8edc>] (lookup_real) from [<800cdd24>] (do_last.isra.42+0x73c/0xb7c)
 r5:8723df5c r4:8723ded0
[<800cd5e8>] (do_last.isra.42) from [<800ce220>] (path_openat+0xbc/0x5e0)
 r10:8723c000 r9:00000000 r8:00000000 r7:8723de80 r6:8723df5c r5:87251280
 r4:8723ded0
[<800ce164>] (path_openat) from [<800cea84>] (do_filp_open+0x34/0x88)
 r10:00000000 r9:8723c000 r8:8000e7e4 r7:87bdb000 r6:ffffff9c r5:00000001
 r4:8723df5c
[<800cea50>] (do_filp_open) from [<800bf910>] (do_sys_open+0x118/0x1d4)
 r7:00000005 r6:ffffff9c r5:87bdb000 r4:00000008
[<800bf7f8>] (do_sys_open) from [<800bf9f4>] (SyS_open+0x28/0x2c)
 r10:00000000 r8:8000e7e4 r7:00000005 r6:00000008 r5:0001c182 r4:000c67e8
[<800bf9cc>] (SyS_open) from [<8000e620>] (ret_fast_syscall+0x0/0x48)
UBIFS error (pid 60): ubifs_read_node: expected node type 0
UBIFS error (pid 60): ubifs_iget: failed to read inode 2946, error -117
UBIFS error (pid 60): ubifs_lookup: dead directory entry 'b7:4', error -117
UBIFS warning (pid 60): ubifs_ro_mode: switched to read-only mode, error -117
CPU: 0 PID: 60 Comm: udevd Not tainted 3.14.0-rc7+ #761
Backtrace:
[<800114e4>] (dump_backtrace) from [<80011684>] (show_stack+0x18/0x1c)
 r6:87bd8000 r5:ffffff8b r4:8745e678 r3:00000000
[<8001166c>] (show_stack) from [<805e2ff8>] (dump_stack+0x20/0x28)
[<805e2fd8>] (dump_stack) from [<801f991c>] (ubifs_ro_mode+0x6c/0x78)
[<801f98b0>] (ubifs_ro_mode) from [<801f3584>] (ubifs_lookup+0x1cc/0x1e8)
[<801f33b8>] (ubifs_lookup) from [<800c8f04>] (lookup_real+0x28/0x58)
 r10:00000000 r8:8723de80 r7:87426cf0 r6:00020000 r5:8723df5c r4:8745e678
[<800c8edc>] (lookup_real) from [<800cdd24>] (do_last.isra.42+0x73c/0xb7c)
 r5:8723df5c r4:8723ded0
[<800cd5e8>] (do_last.isra.42) from [<800ce220>] (path_openat+0xbc/0x5e0)
 r10:8723c000 r9:00000000 r8:00000000 r7:8723de80 r6:8723df5c r5:87251280
 r4:8723ded0
[<800ce164>] (path_openat) from [<800cea84>] (do_filp_open+0x34/0x88)
 r10:00000000 r9:8723c000 r8:8000e7e4 r7:87bdb000 r6:ffffff9c r5:00000001
 r4:8723df5c
[<800cea50>] (do_filp_open) from [<800bf910>] (do_sys_open+0x118/0x1d4)
 r7:00000005 r6:ffffff9c r5:87bdb000 r4:00000008
[<800bf7f8>] (do_sys_open) from [<800bf9f4>] (SyS_open+0x28/0x2c)
 r10:00000000 r8:8000e7e4 r7:00000005 r6:00000008 r5:0001c182 r4:000c67e8
[<800bf9cc>] (SyS_open) from [<8000e620>] (ret_fast_syscall+0x0/0x48)
waiting for devices...UBIFS error (pid 30): make_reservation: cannot reserve 160 bytes in jhead 1, error -30
UBIFS error (pid 30): ubifs_write_inode: can't write inode 3064, error -30
failed
---
 drivers/mtd/chips/cfi_cmdset_0001.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index 7751443..01b58b0 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -1003,8 +1003,10 @@ static void put_chip(struct map_info *map, struct flchip *chip, unsigned long ad
 		   sending the 0x70 (Read Status) command to an erasing
 		   chip and expecting it to be ignored, that's what we
 		   do. */
+		map_write(map, CMD(0xFF), adr);
 		map_write(map, CMD(0xd0), adr);
 		map_write(map, CMD(0x70), adr);
+		cfi_udelay(600);
 		chip->oldstate = FL_READY;
 		chip->state = FL_ERASING;
 		break;
-- 
1.7.10.4

Subject: TESTHACK 9: -FAILED-

UBIFS: background thread "ubifs_bgt0_0" started, PID 38
UBIFS: recovery needed
UBIFS error (pid 1): ubifs_read_node: bad node type (5 but expected 9)
UBIFS error (pid 1): ubifs_read_node: bad node at LEB 170:87664, LEB mapping status 1
Not a node, first 24 bytes:
00000000: 31 14 10 05 4c 4c 04 d4 7d 47 00 00 00 00 00 00 5c 00 00 0c 05 00 00 00                          1...LL..}G......\.......
CPU: 0 PID: 1 Comm: swapper Not tainted 3.14.0-rc7+ #762
Backtrace:
[<800114e4>] (dump_backtrace) from [<80011684>] (show_stack+0x18/0x1c)
 r6:87bd8000 r5:87b64840 r4:ffffffea r3:00000000
[<8001166c>] (show_stack) from [<805e2ff8>] (dump_stack+0x20/0x28)
[<805e2fd8>] (dump_stack) from [<801fb8a8>] (ubifs_read_node+0x234/0x2ac)
[<801fb674>] (ubifs_read_node) from [<80219218>] (ubifs_load_znode+0xa0/0x57c)
 r10:87843bb4 r9:ffffffff r8:00000000 r7:00000002 r6:0000006c r5:87bd8000
 r4:871a0900
[<80219178>] (ubifs_load_znode) from [<801feaec>] (ubifs_lookup_level0+0xc4/0x1e4)
 r10:87843bb4 r9:ffffffff r8:00000000 r7:00000002 r6:87843c00 r5:87bd8000
 r4:87843bb0
[<801fea28>] (ubifs_lookup_level0) from [<802000b4>] (ubifs_tnc_next_ent+0x68/0x1ac)
 r10:00000000 r8:000023b0 r7:87bd8328 r6:87843bf0 r5:87bd8000 r4:87843c00
[<8020004c>] (ubifs_tnc_next_ent) from [<80200284>] (ubifs_tnc_remove_ino+0x8c/0x150)
 r10:00000000 r9:ffffffff r8:000023b0 r7:87bd8000 r6:87192ca0 r5:87bd8000
 r4:87bd8c24
[<802001f8>] (ubifs_tnc_remove_ino) from [<802030bc>] (ubifs_replay_journal+0xd5c/0x1614)
 r10:87bd8c24 r9:00000000 r8:000023b0 r7:87bd8000 r6:87192ca0 r5:87192c80
 r4:87bd8c24
[<80202360>] (ubifs_replay_journal) from [<801f7438>] (ubifs_mount+0x10d4/0x1778)
 r10:00000003 r9:801f4320 r8:87bd8008 r7:0001ff80 r6:87bd8000 r5:87bcc400
 r4:00000000
[<801f6364>] (ubifs_mount) from [<800c3888>] (mount_fs+0x1c/0xd8)
 r10:00000000 r9:87842000 r8:00008000 r7:800df420 r6:808246f0 r5:808246f0
 r4:87b64540
[<800c386c>] (mount_fs) from [<800dd28c>] (vfs_kern_mount+0x5c/0x144)
 r9:87842000 r8:00008000 r6:87bc2dc0 r5:808246f0 r4:87b64540
[<800dd230>] (vfs_kern_mount) from [<800df420>] (do_mount+0x1a0/0xa38)
 r10:87bc2e00 r8:87bc2dc0 r7:00000000 r6:808246f0 r5:00000020 r4:80819548
[<800df280>] (do_mount) from [<800e000c>] (SyS_mount+0x8c/0xc0)
 r10:807fddc4 r9:87fdcee0 r8:000000b9 r7:00000000 r6:00008000 r5:807fddc4
 r4:87827000
[<800dff80>] (SyS_mount) from [<807d3fb0>] (mount_block_root+0x104/0x23c)
 r7:871f7000 r6:807fddb8 r5:00008000 r4:871f7000
[<807d3eac>] (mount_block_root) from [<807d438c>] (prepare_namespace+0x94/0x1cc)
 r10:80808198 r9:807d34c0 r8:000000b9 r7:8085efc0 r6:807fdd90 r5:807fddc4
 r4:807fddb8
[<807d42f8>] (prepare_namespace) from [<807d3c64>] (kernel_init_freeable+0x178/0x1bc)
 r5:00000007 r4:807fddb0
[<807d3aec>] (kernel_init_freeable) from [<805de590>] (kernel_init+0x10/0xec)
 r10:00000000 r9:00000000 r8:00000000 r7:00000000 r6:00000000 r5:805de580
 r4:00000000
[<805de580>] (kernel_init) from [<8000e6e8>] (ret_from_fork+0x14/0x2c)
 r4:00000000 r3:00000000
UBIFS: background thread "ubifs_bgt0_0" stops
---
 drivers/mtd/chips/cfi_cmdset_0001.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index 7751443..0d9c419 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -1003,8 +1003,10 @@ static void put_chip(struct map_info *map, struct flchip *chip, unsigned long ad
 		   sending the 0x70 (Read Status) command to an erasing
 		   chip and expecting it to be ignored, that's what we
 		   do. */
+		map_write(map, CMD(0xFF), adr);
 		map_write(map, CMD(0xd0), adr);
 		map_write(map, CMD(0x70), adr);
+		cfi_udelay(800);
 		chip->oldstate = FL_READY;
 		chip->state = FL_ERASING;
 		break;
-- 
1.7.10.4

Subject: TESTHACK 10: -FAILED-

UBIFS error (pid 166): ubifs_read_node: bad node length 2514, expected 2530
UBIFS error (pid 166): ubifs_read_node: bad node at LEB 169:0, LEB mapping status 1
        magic          0x6101831
        crc            0x9c75c8e1
        node_type      1 (data node)
        group_type     0 (no node group)
        sqnum          15388
        len            2514
        key            (1226, data, 37)
        size           4096
        compr_typ      1
        data size      2466
        data:
        00000000: 09 00 00 00 00 72 65 61 6c 6d 25 73 20 6c 01 0c 25 73 2f 00 25 73 20 20 20 20 63 61 63 68 65 cc
        00000020: 02 0f 6c 6f 63 61 6c 25 73 00 00 00 25 73 72 65 6a 65 63 74 70 01 01 25 73 6d 63 bc 00 0b 62 72
---
 drivers/mtd/chips/cfi_cmdset_0001.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index 7751443..30addc6 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -1003,8 +1003,10 @@ static void put_chip(struct map_info *map, struct flchip *chip, unsigned long ad
 		   sending the 0x70 (Read Status) command to an erasing
 		   chip and expecting it to be ignored, that's what we
 		   do. */
+		map_write(map, CMD(0xFF), adr);
 		map_write(map, CMD(0xd0), adr);
 		map_write(map, CMD(0x70), adr);
+		cfi_udelay(900);
 		chip->oldstate = FL_READY;
 		chip->state = FL_ERASING;
 		break;
-- 
1.7.10.4

Subject: TESTHACK 11: -FAILED-

UBIFS: mounted UBI device 0, volume 0, name "root"
UBIFS: LEB size: 130944 bytes (127 KiB), min./max. I/O unit sizes: 8 bytes/1024 bytes
UBIFS: FS size: 62722176 bytes (59 MiB, 479 LEBs), journal size 3142656 bytes (2 MiB, 24 LEBs)
UBIFS: reserved for root: 2962522 bytes (2893 KiB)
UBIFS: media format: w4/r0 (latest is w4/r0), UUID 3BC6E247-A173-42BB-8469-40E5297AD6F6, small LPT model
VFS: Mounted root (ubifs filesystem) on device 0:10.
UBIFS error (pid 1): ubifs_check_node: bad CRC: calculated 0xbce7372e, read 0xb0d6d3dc
UBIFS error (pid 1): ubifs_check_node: bad node at LEB 63:107480
        magic          0x6101831
        crc            0xb0d6d3dc
        node_type      9 (indexing node)
        group_type     0 (no node group)
        sqnum          11689
        len            148
        child_cnt      6
        level          1
        Branches:
        0: LEB 63:104480 len 108 key (753, direntry, 0x1e75851)
        1: LEB 63:109016 len 76 key (760, inode)
        2: LEB 15:17912 len 128 key (774, direntry, 0x3edd6c2)
        3: LEB 63:105304 len 108 key (774, direntry, 0x135224ab)
        4: LEB 63:89720 len 108 key (776, inode)
        5: LEB 63:107312 len 104 key (777, inode)
CPU: 0 PID: 1 Comm: swapper Not tainted 3.14.0-rc7+ #764
Backtrace:
[<800114e4>] (dump_backtrace) from [<80011684>] (show_stack+0x18/0x1c)
 r6:87bd8000 r5:0001a3d8 r4:87b64840 r3:00000000
[<8001166c>] (show_stack) from [<805e2fe4>] (dump_stack+0x20/0x28)
[<805e2fc4>] (dump_stack) from [<801fa168>] (ubifs_check_node+0x1c0/0x2c4)
[<801f9fa8>] (ubifs_check_node) from [<801fb758>] (ubifs_read_node+0xe4/0x2ac)
 r10:00000009 r8:00000094 r7:0001a3d8 r6:87bd8000 r5:87b64840 r4:00000000
[<801fb674>] (ubifs_read_node) from [<80219218>] (ubifs_load_znode+0xa0/0x57c)
 r10:87843c44 r9:87a46000 r8:00000000 r7:00000004 r6:00000094 r5:87bd8000
 r4:87203f00
[<80219178>] (ubifs_load_znode) from [<801feaec>] (ubifs_lookup_level0+0xc4/0x1e4)
 r10:87843c44 r9:87a46000 r8:00000000 r7:00000004 r6:87843c98 r5:87bd8000
 r4:87843c40
[<801fea28>] (ubifs_lookup_level0) from [<801fec54>] (ubifs_tnc_locate+0x48/0x198)
 r10:00000001 r8:00000000 r7:00000000 r6:87bd8328 r5:87843c98 r4:87bd8000
[<801fec0c>] (ubifs_tnc_locate) from [<801f5b58>] (ubifs_iget+0x7c/0x888)
 r10:00000001 r9:87843d78 r8:4023ee05 r7:871fec00 r6:87bd8000 r5:874142b8
 r4:87a46000
[<801f5adc>] (ubifs_iget) from [<801f34b4>] (ubifs_lookup+0xfc/0x1e8)
 r10:00000001 r9:87843d78 r8:4023ee05 r7:871fec00 r6:87bd8000 r5:87414000
 r4:87410170
[<801f33b8>] (ubifs_lookup) from [<800c8f04>] (lookup_real+0x28/0x58)
 r10:871a4c00 r8:87bd9010 r7:87842000 r6:87410228 r5:87410228 r4:87410170
[<800c8edc>] (lookup_real) from [<800c9fd0>] (__lookup_hash+0x3c/0x4c)
 r5:87410228 r4:00000001
[<800c9f94>] (__lookup_hash) from [<800ca024>] (lookup_slow+0x44/0xa8)
 r5:87843d78 r4:87843e00
[<800c9fe0>] (lookup_slow) from [<800cc148>] (path_lookupat+0x6a4/0x704)
 r7:87842000 r6:00000000 r5:00000041 r4:87843e00
[<800cbaa4>] (path_lookupat) from [<800cc1d0>] (filename_lookup+0x28/0x68)
 r10:871a4c00 r9:807d34c0 r8:871a4980 r7:87843e00 r6:ffffff9c r5:87843de0
 r4:00000001
[<800cc1a8>] (filename_lookup) from [<800cc2a0>] (do_path_lookup+0x30/0x38)
 r7:00000000 r6:00008000 r5:87843e98 r4:87843e00
[<800cc270>] (do_path_lookup) from [<800cc4a0>] (kern_path+0x34/0x4c)
[<800cc46c>] (kern_path) from [<800df300>] (do_mount+0x80/0xa38)
 r5:80757b04 r4:87bd9010
[<800df280>] (do_mount) from [<800e000c>] (SyS_mount+0x8c/0xc0)
 r10:80808198 r9:807d34c0 r8:000000b9 r7:00000000 r6:00008000 r5:80757b04
 r4:87bd9000
[<800dff80>] (SyS_mount) from [<80301790>] (devtmpfs_mount+0x4c/0x8c)
 r7:8085efc0 r6:807fdd90 r5:807fddc4 r4:8784c0c0
[<80301744>] (devtmpfs_mount) from [<807d4468>] (prepare_namespace+0x170/0x1cc)
 r4:807fddb8
[<807d42f8>] (prepare_namespace) from [<807d3c64>] (kernel_init_freeable+0x178/0x1bc)
 r5:00000007 r4:807fddb0
[<807d3aec>] (kernel_init_freeable) from [<805de57c>] (kernel_init+0x10/0xec)
 r10:00000000 r9:00000000 r8:00000000 r7:00000000 r6:00000000 r5:805de56c
 r4:00000000
[<805de56c>] (kernel_init) from [<8000e6e8>] (ret_from_fork+0x14/0x2c)
 r4:00000000 r3:00000000
UBIFS error (pid 1): ubifs_read_node: expected node type 9
UBIFS error (pid 1): ubifs_iget: failed to read inode 770, error -117
UBIFS error (pid 1): ubifs_lookup: dead directory entry 'dev', error -117
UBIFS warning (pid 1): ubifs_ro_mode: switched to read-only mode, error -117
CPU: 0 PID: 1 Comm: swapper Not tainted 3.14.0-rc7+ #764
Backtrace:
[<800114e4>] (dump_backtrace) from [<80011684>] (show_stack+0x18/0x1c)
 r6:87bd8000 r5:ffffff8b r4:87410170 r3:00000000
[<8001166c>] (show_stack) from [<805e2fe4>] (dump_stack+0x20/0x28)
[<805e2fc4>] (dump_stack) from [<801f991c>] (ubifs_ro_mode+0x6c/0x78)
[<801f98b0>] (ubifs_ro_mode) from [<801f3584>] (ubifs_lookup+0x1cc/0x1e8)
[<801f33b8>] (ubifs_lookup) from [<800c8f04>] (lookup_real+0x28/0x58)
 r10:871a4c00 r8:87bd9010 r7:87842000 r6:87410228 r5:87410228 r4:87410170
[<800c8edc>] (lookup_real) from [<800c9fd0>] (__lookup_hash+0x3c/0x4c)
 r5:87410228 r4:00000001
[<800c9f94>] (__lookup_hash) from [<800ca024>] (lookup_slow+0x44/0xa8)
 r5:87843d78 r4:87843e00
[<800c9fe0>] (lookup_slow) from [<800cc148>] (path_lookupat+0x6a4/0x704)
 r7:87842000 r6:00000000 r5:00000041 r4:87843e00
[<800cbaa4>] (path_lookupat) from [<800cc1d0>] (filename_lookup+0x28/0x68)
 r10:871a4c00 r9:807d34c0 r8:871a4980 r7:87843e00 r6:ffffff9c r5:87843de0
 r4:00000001
[<800cc1a8>] (filename_lookup) from [<800cc2a0>] (do_path_lookup+0x30/0x38)
 r7:00000000 r6:00008000 r5:87843e98 r4:87843e00
[<800cc270>] (do_path_lookup) from [<800cc4a0>] (kern_path+0x34/0x4c)
[<800cc46c>] (kern_path) from [<800df300>] (do_mount+0x80/0xa38)
 r5:80757b04 r4:87bd9010
[<800df280>] (do_mount) from [<800e000c>] (SyS_mount+0x8c/0xc0)
 r10:80808198 r9:807d34c0 r8:000000b9 r7:00000000 r6:00008000 r5:80757b04
 r4:87bd9000
[<800dff80>] (SyS_mount) from [<80301790>] (devtmpfs_mount+0x4c/0x8c)
 r7:8085efc0 r6:807fdd90 r5:807fddc4 r4:8784c0c0
[<80301744>] (devtmpfs_mount) from [<807d4468>] (prepare_namespace+0x170/0x1cc)
 r4:807fddb8
[<807d42f8>] (prepare_namespace) from [<807d3c64>] (kernel_init_freeable+0x178/0x1bc)
 r5:00000007 r4:807fddb0
[<807d3aec>] (kernel_init_freeable) from [<805de57c>] (kernel_init+0x10/0xec)
 r10:00000000 r9:00000000 r8:00000000 r7:00000000 r6:00000000 r5:805de56c
 r4:00000000
[<805de56c>] (kernel_init) from [<8000e6e8>] (ret_from_fork+0x14/0x2c)
 r4:00000000 r3:00000000
devtmpfs: error mounting -117
Freeing unused kernel memory: 212K (807d3000 - 80808000)
Failed to execute /usr/sbin/init (error -2).  Attempting defaults...
---
 drivers/mtd/chips/cfi_cmdset_0001.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index 7751443..0f800af 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -1003,8 +1003,10 @@ static void put_chip(struct map_info *map, struct flchip *chip, unsigned long ad
 		   sending the 0x70 (Read Status) command to an erasing
 		   chip and expecting it to be ignored, that's what we
 		   do. */
+		map_write(map, CMD(0xFF), adr);
 		map_write(map, CMD(0xd0), adr);
 		map_write(map, CMD(0x70), adr);
+		cfi_udelay(1000);
 		chip->oldstate = FL_READY;
 		chip->state = FL_ERASING;
 		break;
-- 
1.7.10.4

Subject: TESTHACK 12: -PASSED-

$ time bonnie\+\+ -d . -u service -s 8 -r 1
Using uid:500, gid:100.
Writing with putc()...done
Writing intelligently...done
Rewriting...done
Reading with getc()...done
Reading intelligently...done
start 'em...done...done...done...
Create files in sequential order...
done.
Stat files in sequential order...done.
Delete files in sequential order...done.
Create files in random order...done.
Stat files in random order...done.
Delete files in random order...done.
Version 1.03e       ------Sequential Output------ --Sequential Input- --Random-
                    -Per Chr- --Block-- -Rewrite- -Per Chr- --Block-- --Seeks--
Machine        Size K/sec %CP K/sec %CP K/sec %CP K/sec %CP K/sec %CP  /sec %CP
                 8M  2604  99 +++++ +++ +++++ +++  2639  99 +++++ +++  8324  97
                    ------Sequential Create------ --------Random Create--------
                    -Create-- --Read--- -Delete-- -Create-- --Read--- -Delete--
              files  /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP
                 16   465  80  7636  99   292  58   154  27 28330 100   253  52
phyCORE,8M,2604,99,+++++,+++,+++++,+++,2639,99,+++++,+++,8324.3,97,16,465,80,7636,99,292,58,154,27,28330,100,253,52
real    4m 37.46s
user    0m 7.14s
sys     2m 7.84s

---
 drivers/mtd/chips/cfi_cmdset_0001.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index 7751443..196bb32 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -1003,8 +1003,10 @@ static void put_chip(struct map_info *map, struct flchip *chip, unsigned long ad
 		   sending the 0x70 (Read Status) command to an erasing
 		   chip and expecting it to be ignored, that's what we
 		   do. */
+		map_write(map, CMD(0xFF), adr);
 		map_write(map, CMD(0xd0), adr);
 		map_write(map, CMD(0x70), adr);
+		cfi_udelay(1200);
 		chip->oldstate = FL_READY;
 		chip->state = FL_ERASING;
 		break;
-- 
1.7.10.4

Subject: TESTHACK 13: -PASSED-

$ time bonnie\+\+ -d . -u service -s 8 -r 1
Using uid:500, gid:100.
Writing with putc()...done
Writing intelligently...done
Rewriting...done
Reading with getc()...done
Reading intelligently...done
start 'em...done...done...done...
Create files in sequential order...
done.
Stat files in sequential order...done.
Delete files in sequential order...done.
Create files in random order...done.
Stat files in random order...done.
Delete files in random order...done.
Version 1.03e       ------Sequential Output------ --Sequential Input- --Random-
                    -Per Chr- --Block-- -Rewrite- -Per Chr- --Block-- --Seeks--
Machine        Size K/sec %CP K/sec %CP K/sec %CP K/sec %CP K/sec %CP  /sec %CP
                 8M  2601  99 +++++ +++ +++++ +++  2638  99 +++++ +++  8369  98
                    ------Sequential Create------ --------Random Create--------
                    -Create-- --Read--- -Delete-- -Create-- --Read--- -Delete--
              files  /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP
                 16   373  64  3740  48   310  61   140  24 28748 100   258  53
phyCORE,8M,2601,99,+++++,+++,+++++,+++,2638,99,+++++,+++,8369.4,98,16,373,64,3740,48,310,61,140,24,28748,100,258,53
real    4m 54.67s
user    0m 6.67s
sys     2m 7.54s
---
 drivers/mtd/chips/cfi_cmdset_0001.c |   13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index 7751443..eb951b1 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -279,6 +279,18 @@ static void fixup_use_write_buffers(struct mtd_info *mtd)
 	}
 }
 
+static void fixup_micron_pc28f512p33(struct mtd_info *mtd)
+{
+	struct map_info *map = mtd->priv;
+	struct cfi_private *cfi = map->fldrv_priv;
+	struct cfi_pri_intelext *cfip = cfi->cmdset_priv;
+
+	if (cfip->FeatureSupport & 2) {
+		printk(KERN_INFO "Disable Suspend Erase\n");
+		cfip->FeatureSupport &= ~2;
+	}
+}
+
 /*
  * Some chips power-up with all sectors locked by default.
  */
@@ -309,6 +321,7 @@ static struct cfi_fixup cfi_fixup_table[] = {
 #endif
 	{ CFI_MFR_ST, 0x00ba, /* M28W320CT */ fixup_st_m28w320ct },
 	{ CFI_MFR_ST, 0x00bb, /* M28W320CB */ fixup_st_m28w320cb },
+	{ CFI_MFR_INTEL, 0x8964, /* PC28F512P33 */ fixup_micron_pc28f512p33 },
 	{ CFI_MFR_INTEL, CFI_ID_ANY, fixup_unlock_powerup_lock },
 	{ 0, 0, NULL }
 };
-- 
1.7.10.4
