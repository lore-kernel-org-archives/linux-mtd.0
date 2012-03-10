Received: from mail-gx0-f177.google.com ([209.85.161.177])
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S6FSv-0003fq-Tm
 for linux-mtd@lists.infradead.org; Sat, 10 Mar 2012 06:07:43 +0000
Received: by ggnk1 with SMTP id k1so1664904ggn.36
 for <linux-mtd@lists.infradead.org>; Fri, 09 Mar 2012 22:07:37 -0800 (PST)
MIME-Version: 1.0
Date: Sat, 10 Mar 2012 07:07:36 +0100
Message-ID: <CAHMF36G-dXbjZfBMnzEuqK_bkNM81+aCZW5gDHSAKEeyE8VKTg@mail.gmail.com>
Subject: UBIFS crash (was Re: Problems with mtd_oobtest)
From: Matej Kupljen <matej.kupljen@gmail.com>
To: linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear all,

>> Now, I'll do some intentional power cuts, and when the problem
>> appears, I'll post a kernel log here.
>
> Please, be aware of the unstable bits issue which not one dares to
> resolve in UBIFS, but many people yelled...
>
> http://www.linux-mtd.infradead.org/doc/ubifs.html#L_unstable_bits

Thanks for the link, I'll check it.

Now, I did what I said, and after some power crashes, I get:
==============================================================================
[    1.576000] UBIFS: recovery needed
[    1.584000] UBIFS error (pid 1): check_lpt_crc: invalid crc in LPT
node: crc f382 calc f342
[    1.588000] [<c002ba14>] (unwind_backtrace+0x0/0xe0) from
[<c0124604>] (check_lpt_crc+0x78/0x90)
[    1.592000] [<c0124604>] (check_lpt_crc+0x78/0x90) from
[<c01246e4>] (ubifs_unpack_nnode+0xc8/0xd8)
[    1.596000] [<c01246e4>] (ubifs_unpack_nnode+0xc8/0xd8) from
[<c01248e8>] (ubifs_read_nnode+0xc8/0x188)
[    1.600000] [<c01248e8>] (ubifs_read_nnode+0xc8/0x188) from
[<c01249c4>] (ubifs_get_nnode+0x1c/0x30)
[    1.604000] [<c01249c4>] (ubifs_get_nnode+0x1c/0x30) from
[<c01257d8>] (ubifs_lpt_lookup_dirty+0x6c/0x258)
[    1.608000] [<c01257d8>] (ubifs_lpt_lookup_dirty+0x6c/0x258) from
[<c0119d1c>] (ubifs_replay_journal+0x28/0x14d0)
[    1.612000] [<c0119d1c>] (ubifs_replay_journal+0x28/0x14d0) from
[<c010ec9c>] (ubifs_fill_super+0xc08/0x12b8)
[    1.616000] [<c010ec9c>] (ubifs_fill_super+0xc08/0x12b8) from
[<c0110314>] (ubifs_get_sb+0x1f4/0x258)
[    1.620000] [<c0110314>] (ubifs_get_sb+0x1f4/0x258) from
[<c008ae14>] (vfs_kern_mount+0x50/0xd0)
[    1.624000] [<c008ae14>] (vfs_kern_mount+0x50/0xd0) from
[<c008aed8>] (do_kern_mount+0x34/0xd8)
[    1.628000] [<c008aed8>] (do_kern_mount+0x34/0xd8) from
[<c009e618>] (do_mount+0x5e4/0x648)
[    1.632000] [<c009e618>] (do_mount+0x5e4/0x648) from [<c009e700>]
(sys_mount+0x84/0xc4)
[    1.636000] [<c009e700>] (sys_mount+0x84/0xc4) from [<c0008ba4>]
(do_mount_root+0x20/0xb4)
[    1.640000] [<c0008ba4>] (do_mount_root+0x20/0xb4) from
[<c0008e24>] (mount_block_root+0xe8/0x20c)
[    1.644000] [<c0008e24>] (mount_block_root+0xe8/0x20c) from
[<c00090d8>] (prepare_namespace+0x8c/0x1c8)
[    1.648000] [<c00090d8>] (prepare_namespace+0x8c/0x1c8) from
[<c000874c>] (kernel_init+0xd4/0x10c)
[    1.652000] [<c000874c>] (kernel_init+0xd4/0x10c) from [<c0026df0>]
(kernel_thread_exit+0x0/0x8)
[    1.656000] UBIFS error (pid 1): ubifs_read_nnode: error -22
reading nnode at 8:6651
[    1.660000] [<c002ba14>] (unwind_backtrace+0x0/0xe0) from
[<c0124984>] (ubifs_read_nnode+0x164/0x188)
[    1.664000] [<c0124984>] (ubifs_read_nnode+0x164/0x188) from
[<c01249c4>] (ubifs_get_nnode+0x1c/0x30)
[    1.668000] [<c01249c4>] (ubifs_get_nnode+0x1c/0x30) from
[<c01257d8>] (ubifs_lpt_lookup_dirty+0x6c/0x258)
[    1.672000] [<c01257d8>] (ubifs_lpt_lookup_dirty+0x6c/0x258) from
[<c0119d1c>] (ubifs_replay_journal+0x28/0x14d0)
[    1.676000] [<c0119d1c>] (ubifs_replay_journal+0x28/0x14d0) from
[<c010ec9c>] (ubifs_fill_super+0xc08/0x12b8)
[    1.680000] [<c010ec9c>] (ubifs_fill_super+0xc08/0x12b8) from
[<c0110314>] (ubifs_get_sb+0x1f4/0x258)
[    1.684000] [<c0110314>] (ubifs_get_sb+0x1f4/0x258) from
[<c008ae14>] (vfs_kern_mount+0x50/0xd0)
[    1.688000] [<c008ae14>] (vfs_kern_mount+0x50/0xd0) from
[<c008aed8>] (do_kern_mount+0x34/0xd8)
[    1.692000] [<c008aed8>] (do_kern_mount+0x34/0xd8) from
[<c009e618>] (do_mount+0x5e4/0x648)
[    1.696000] [<c009e618>] (do_mount+0x5e4/0x648) from [<c009e700>]
(sys_mount+0x84/0xc4)
[    1.700000] [<c009e700>] (sys_mount+0x84/0xc4) from [<c0008ba4>]
(do_mount_root+0x20/0xb4)
[    1.704000] [<c0008ba4>] (do_mount_root+0x20/0xb4) from
[<c0008e24>] (mount_block_root+0xe8/0x20c)
[    1.708000] [<c0008e24>] (mount_block_root+0xe8/0x20c) from
[<c00090d8>] (prepare_namespace+0x8c/0x1c8)
[    1.712000] [<c00090d8>] (prepare_namespace+0x8c/0x1c8) from
[<c000874c>] (kernel_init+0xd4/0x10c)
[    1.716000] [<c000874c>] (kernel_init+0xd4/0x10c) from [<c0026df0>]
(kernel_thread_exit+0x0/0x8)
[    1.724000] List of all partitions:
[    1.728000] 1f00             128 mtdblock0 (driver?)
[    1.732000] 1f01          109824 mtdblock1 (driver?)
[    1.736000] No filesystem could mount root, tried:  ubifs
[    1.740000] Kernel panic - not syncing: VFS: Unable to mount root
fs on unknown-block(0,0)

==============================================================================

I re-flashed the unit, rebooted several time and:
==============================================================================
[    1.576000] UBIFS error (pid 1): ubifs_scan: garbage
[    1.616000] UBI: scrubbed PEB 3 (LEB 0:1), data moved to PEB 2
[    1.644000] UBIFS error (pid 1): ubifs_recover_master_node: failed
to recover master node
==============================================================================

Again, with the same result:
==============================================================================
[    1.608000] UBIFS: recovery needed
[    1.752000] UBIFS error (pid 1): ubifs_check_node: bad magic
0x6104531, expected 0x6101831
[    1.756000] UBIFS error (pid 1): ubifs_check_node: bad node at LEB 140:81848
[    1.760000] [<c002ba14>] (unwind_backtrace+0x0/0xe0) from
[<c01122f4>] (ubifs_check_node+0x264/0x2a8)
[    1.764000] [<c01122f4>] (ubifs_check_node+0x264/0x2a8) from
[<c0112c80>] (ubifs_read_node+0x184/0x274)
[    1.772000] [<c0112c80>] (ubifs_read_node+0x184/0x274) from
[<c012da9c>] (ubifs_load_znode+0xc0/0x50c)
[    1.776000] [<c012da9c>] (ubifs_load_znode+0xc0/0x50c) from
[<c0116288>] (ubifs_lookup_level0+0x104/0x1c8)
[    1.780000] [<c0116288>] (ubifs_lookup_level0+0x104/0x1c8) from
[<c01165e0>] (ubifs_tnc_next_ent+0x74/0x178)
[    1.784000] [<c01165e0>] (ubifs_tnc_next_ent+0x74/0x178) from
[<c0117e1c>] (ubifs_tnc_remove_ino+0x50/0x180)
[    1.788000] [<c0117e1c>] (ubifs_tnc_remove_ino+0x50/0x180) from
[<c011acac>] (ubifs_replay_journal+0xfb8/0x14d0)
[    1.792000] [<c011acac>] (ubifs_replay_journal+0xfb8/0x14d0) from
[<c010ec9c>] (ubifs_fill_super+0xc08/0x12b8)
[    1.796000] [<c010ec9c>] (ubifs_fill_super+0xc08/0x12b8) from
[<c0110314>] (ubifs_get_sb+0x1f4/0x258)
[    1.800000] [<c0110314>] (ubifs_get_sb+0x1f4/0x258) from
[<c008ae14>] (vfs_kern_mount+0x50/0xd0)
[    1.804000] [<c008ae14>] (vfs_kern_mount+0x50/0xd0) from
[<c008aed8>] (do_kern_mount+0x34/0xd8)
[    1.808000] [<c008aed8>] (do_kern_mount+0x34/0xd8) from
[<c009e618>] (do_mount+0x5e4/0x648)
[    1.812000] [<c009e618>] (do_mount+0x5e4/0x648) from [<c009e700>]
(sys_mount+0x84/0xc4)
[    1.816000] [<c009e700>] (sys_mount+0x84/0xc4) from [<c0008ba4>]
(do_mount_root+0x20/0xb4)
[    1.820000] [<c0008ba4>] (do_mount_root+0x20/0xb4) from
[<c0008e24>] (mount_block_root+0xe8/0x20c)
[    1.824000] [<c0008e24>] (mount_block_root+0xe8/0x20c) from
[<c00090d8>] (prepare_namespace+0x8c/0x1c8)
[    1.828000] [<c00090d8>] (prepare_namespace+0x8c/0x1c8) from
[<c000874c>] (kernel_init+0xd4/0x10c)
[    1.832000] [<c000874c>] (kernel_init+0xd4/0x10c) from [<c0026df0>]
(kernel_thread_exit+0x0/0x8)
[    1.836000] UBIFS error (pid 1): ubifs_read_node: expected node type 9
[    1.844000] VFS: Cannot open root device "ubi0:ubi_rootfs" or
unknown-block(0,0)
[    1.848000] Please append a correct "root=" boot option; here are
the available partitions:
[    1.852000] 1f00             128 mtdblock0 (driver?)
[    1.856000] 1f01          109824 mtdblock1 (driver?)
[    1.860000] b300         7842816 mmcblk0 driver: mmcblk
[    1.868000]   b301         7838720 mmcblk0p1
[    1.872000] Kernel panic - not syncing: VFS: Unable to mount root
fs on unknown-block(0,0)
==============================================================================


Please note, that I have several similar devices and majority of them
don't have this problem.
The one I am using now, seems to crash with different errors.
Is this the symptom I could expect from the problem mentioned in the
link you provided?
Any other problem?

Thank you and Best Regards,
Matej Kupljen
