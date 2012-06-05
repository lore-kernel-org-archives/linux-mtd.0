Received: from mail-wi0-f177.google.com ([209.85.212.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sbu1A-0005ly-PP
 for linux-mtd@lists.infradead.org; Tue, 05 Jun 2012 13:41:53 +0000
Received: by wibhm14 with SMTP id hm14so3041510wib.0
 for <linux-mtd@lists.infradead.org>; Tue, 05 Jun 2012 06:41:50 -0700 (PDT)
Date: Tue, 5 Jun 2012 16:41:42 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Richard Weinberger <richard@nod.at>
Subject: ubi: fastmap: v7: ubi_update_fastmap failure
Message-ID: <20120605164142.02d9e235@pixies.home.jungo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Artem Bityutskiy <dedekind1@gmail.com>, adrian.hunter@intel.com,
 Heinz.Egger@linutronix.de, linux-mtd@lists.infradead.org, tim.bird@am.sony.com,
 tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Richard,

I got the below UBI error when working with fastmap v7 (linux-ubi.git,
branch fastmap, HEAD at bd8313d).

Had no time to investigate (could be fixed by your v7+ patches); please
take a look if you can.

Setup:
- Beagle with SLC NAND.
- ubi.mtd=4 root=ubi0:beagleboard-rootfs rootfstype=ubifs
- A single volume on the ubi0 device (the ubifs rootfs).

The board booted several times succesfully with fastmap-v7.
Then I got the error below, when ubifs was mounted (note UBI attach was
successful).

Switched to non-fastmap kernel, board booted successfully (with ubifs
mounted succesfully).

Regards,
Shmulik

[    3.222808] UBIFS: recovery needed
[    3.281646] UBI error: __ubi_wl_get_peb: no free eraseblocks
[    3.287750] UBI error: ubi_wl_get_fm_peb: no free eraseblocks
[    3.294952] UBI error: ubi_update_fastmap: Erase counter overflow!
[    3.301483] UBI warning: ubi_ro_mode: switch to read-only mode
[    3.307739] [<c00191f4>] (unwind_backtrace+0x0/0xf8) from [<c02c2694>] (ubi_wl_get_peb+0x254/0x270)
[    3.317291] [<c02c2694>] (ubi_wl_get_peb+0x254/0x270) from [<c02be600>] (ubi_eba_atomic_leb_change+0x168/0x320)
[    3.327941] [<c02be600>] (ubi_eba_atomic_leb_change+0x168/0x320) from [<c02bccec>] (ubi_leb_change+0xb8/0xd4)
[    3.338409] [<c02bccec>] (ubi_leb_change+0xb8/0xd4) from [<c01b9b9c>] (ubifs_leb_change+0x28/0x88)
[    3.347900] [<c01b9b9c>] (ubifs_leb_change+0x28/0x88) from [<c01ca238>] (ubifs_recover_leb+0x390/0x700)
[    3.357818] [<c01ca238>] (ubifs_recover_leb+0x390/0x700) from [<c01c00f8>] (ubifs_replay_journal+0xa80/0x105c)
[    3.368347] [<c01c00f8>] (ubifs_replay_journal+0xa80/0x105c) from [<c01b7ec4>] (ubifs_mount+0xd4c/0x1408)
[    3.378448] [<c01b7ec4>] (ubifs_mount+0xd4c/0x1408) from [<c00d82f4>] (mount_fs+0x44/0x178)
[    3.387298] [<c00d82f4>] (mount_fs+0x44/0x178) from [<c00eea74>] (vfs_kern_mount+0x4c/0xb4)
[    3.396118] [<c00eea74>] (vfs_kern_mount+0x4c/0xb4) from [<c00eeedc>] (do_kern_mount+0x34/0xd0)
[    3.405303] [<c00eeedc>] (do_kern_mount+0x34/0xd0) from [<c00f0630>] (do_mount+0x2d8/0x710)
[    3.414123] [<c00f0630>] (do_mount+0x2d8/0x710) from [<c00f0af4>] (sys_mount+0x84/0xc4)
[    3.422576] [<c00f0af4>] (sys_mount+0x84/0xc4) from [<c05c9bac>] (mount_block_root+0xec/0x228)
[    3.431671] [<c05c9bac>] (mount_block_root+0xec/0x228) from [<c05c9f74>] (prepare_namespace+0x8c/0x1b8)
[    3.441589] [<c05c9f74>] (prepare_namespace+0x8c/0x1b8) from [<c05c98f4>] (kernel_init+0x15c/0x194)
[    3.451141] [<c05c98f4>] (kernel_init+0x15c/0x194) from [<c00141d0>] (kernel_thread_exit+0x0/0x8)
[    3.460540] UBIFS error (pid 1): ubifs_leb_change: changing 36864 bytes in LEB 3185 failed, error -22
[    3.470275] UBIFS warning (pid 1): ubifs_ro_mode: switched to read-only mode, error -22
[    3.478729] [<c00191f4>] (unwind_backtrace+0x0/0xf8) from [<c01b9bf0>] (ubifs_leb_change+0x7c/0x88)
[    3.488281] [<c01b9bf0>] (ubifs_leb_change+0x7c/0x88) from [<c01ca238>] (ubifs_recover_leb+0x390/0x700)
[    3.498199] [<c01ca238>] (ubifs_recover_leb+0x390/0x700) from [<c01c00f8>] (ubifs_replay_journal+0xa80/0x105c)
[    3.508728] [<c01c00f8>] (ubifs_replay_journal+0xa80/0x105c) from [<c01b7ec4>] (ubifs_mount+0xd4c/0x1408)
[    3.518829] [<c01b7ec4>] (ubifs_mount+0xd4c/0x1408) from [<c00d82f4>] (mount_fs+0x44/0x178)
[    3.527648] [<c00d82f4>] (mount_fs+0x44/0x178) from [<c00eea74>] (vfs_kern_mount+0x4c/0xb4)
[    3.536468] [<c00eea74>] (vfs_kern_mount+0x4c/0xb4) from [<c00eeedc>] (do_kern_mount+0x34/0xd0)
[    3.545654] [<c00eeedc>] (do_kern_mount+0x34/0xd0) from [<c00f0630>] (do_mount+0x2d8/0x710)
[    3.554473] [<c00f0630>] (do_mount+0x2d8/0x710) from [<c00f0af4>] (sys_mount+0x84/0xc4)
[    3.562927] [<c00f0af4>] (sys_mount+0x84/0xc4) from [<c05c9bac>] (mount_block_root+0xec/0x228)
[    3.572021] [<c05c9bac>] (mount_block_root+0xec/0x228) from [<c05c9f74>] (prepare_namespace+0x8c/0x1b8)
[    3.581939] [<c05c9f74>] (prepare_namespace+0x8c/0x1b8) from [<c05c98f4>] (kernel_init+0x15c/0x194)
[    3.591491] [<c05c98f4>] (kernel_init+0x15c/0x194) from [<c00141d0>] (kernel_thread_exit+0x0/0x8)
[    3.600830] UBIFS error (pid 1): ubifs_recover_leb: LEB 3185 scanning failed
[    3.613342] List of all partitions:
[    3.617126] 1f00             512 mtdblock0  (driver?)
[    3.622528] 1f01            1920 mtdblock1  (driver?)
[    3.627899] 1f02             128 mtdblock2  (driver?)
[    3.633209] 1f03            4096 mtdblock3  (driver?)
[    3.638580] 1f04          517632 mtdblock4  (driver?)
[    3.643920] No filesystem could mount root, tried:  ubifs
[    3.649749] Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,0)
