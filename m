Received: from mail-fx0-f222.google.com ([209.85.220.222])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NUoMP-0007Rl-KK
	for linux-mtd@lists.infradead.org; Tue, 12 Jan 2010 21:33:14 +0000
Received: by fxm22 with SMTP id 22so27251087fxm.2
	for <linux-mtd@lists.infradead.org>;
	Tue, 12 Jan 2010 13:33:08 -0800 (PST)
Subject: Re: Fail to mount ubifs
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jon Ringle <jon@ringle.org>
In-Reply-To: <152584231001111620i6b397f43n49733caa8f92f472@mail.gmail.com>
References: <152584231001111056n2d174f8fmef6641c4fee99781@mail.gmail.com>
	<152584231001111620i6b397f43n49733caa8f92f472@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 12 Jan 2010 23:33:06 +0200
Message-Id: <1263331986.3445.7.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-01-11 at 19:20 -0500, Jon Ringle wrote:
> I should be able to mount an empty ubi volume as ubifs right?
> But I get this on a freshly made volume:
> UBIFS error (pid 1493): check_lpt_crc: invalid crc in LPT node: crc
> cbcb calc cbfb

Yes.

> 
> I'm not sure what to try now...
> 
> Jon
> 
> (initramfs) ubinfo -a
> UBI version:                    1
> Count of UBI devices:           1
> UBI control device major/minor: 10:60
> Present UBI devices:            ubi0
> 
> ubi0
> Volumes count:                           2
> Logical eraseblock size:                 130944 bytes, f KiB
> Total amount of logical eraseblocks:     249 (32605056 bytes, f MiB)
> Amount of available logical eraseblocks: 112 (14665728 bytes, f MiB)
> Maximum count of volumes                 128
> Count of bad physical eraseblocks:       0
> Count of reserved physical eraseblocks:  0
> Current maximum erase counter value:     72
> Minimum input/output unit size:          1 byte
> Character device major/minor:            253:0
> Present volumes:                         0, 1
> 
> Volume ID:   0 (on ubi0)
> Type:        static
> Alignment:   1
> Size:        27 LEBs (3535488 bytes, f MiB)
> Data bytes:  3481728 bytes (f MiB)
> State:       OK
> Name:        kernel
> Character device major/minor: 253:1
> -----------------------------------
> Volume ID:   1 (on ubi0)
> Type:        static
> Alignment:   1
> Size:        106 LEBs (13880064 bytes, f MiB)
> Data bytes:  13844480 bytes (f MiB)
> State:       OK
> Name:        squashfs
> Character device major/minor: 253:2
> (initramfs)
> (initramfs) ubimkvol -m -N ubifs /dev/ubi0
> Set volume size to 14665728
> Volume ID 2, size 112 LEBs (14665728 bytes, f MiB), LEB size 130944
> bytes (f KiB), dynamic, name "ubifs", alignment 1
> (initramfs)
> (initramfs) mkdir /mnt
> (initramfs) mount -t ubifs ubi0:ubifs /mnt
> [  277.900000] UBIFS: default file-system created
> [  277.980000] UBIFS DBG (pid 1497): ubifs_bg_thread: background
> thread "ubifs_bgt0_2" started, PID 1497
> [  278.260000] UBIFS error (pid 1493): check_lpt_crc: invalid crc in
> LPT node: crc cbcb calc cbfb
> [  278.260000] [<c01822bc>] (unwind_backtrace+0x0/0x160) from
> [<bf071a34>] (check_lpt_crc+0x9c/0xb0 [ubifs])
> [  278.270000] [<bf071a34>] (check_lpt_crc+0x9c/0xb0 [ubifs]) from
> [<bf071b24>] (unpack_pnode+0xdc/0xfc [ubifs])
> [  278.280000] [<bf071b24>] (unpack_pnode+0xdc/0xfc [ubifs]) from
> [<bf071d8c>] (scan_get_pnode+0x248/0x2ec [ubifs])
> [  278.300000] [<bf071d8c>] (scan_get_pnode+0x248/0x2ec [ubifs]) from
> [<bf072738>] (ubifs_lpt_scan_nolock+0x3f8/0x518 [ubifs])
> [  278.310000] [<bf072738>] (ubifs_lpt_scan_nolock+0x3f8/0x518
> [ubifs]) from [<bf0754b8>] (dbg_check_lprops+0xf8/0x2e4 [ubifs])
> [  278.320000] [<bf0754b8>] (dbg_check_lprops+0xf8/0x2e4 [ubifs]) from
> [<bf051ff4>] (mount_ubifs+0x6a4/0x1620 [ubifs])
> [  278.330000] [<bf051ff4>] (mount_ubifs+0x6a4/0x1620 [ubifs]) from
> [<bf053d20>] (ubifs_fill_super+0x318/0x42c [ubifs])
> [  278.340000] [<bf053d20>] (ubifs_fill_super+0x318/0x42c [ubifs])
> from [<bf053f0c>] (ubifs_get_sb+0xd8/0x22c [ubifs])
> [  278.350000] [<bf053f0c>] (ubifs_get_sb+0xd8/0x22c [ubifs]) from
> [<c01f5360>] (vfs_kern_mount+0x68/0x12c)
> [  278.360000] [<c01f5360>] (vfs_kern_mount+0x68/0x12c) from
> [<c01f5468>] (do_kern_mount+0x34/0xdc)
> [  278.370000] [<c01f5468>] (do_kern_mount+0x34/0xdc) from
> [<c020dad0>] (do_mount+0x210/0x244)
> [  278.380000] [<c020dad0>] (do_mount+0x210/0x244) from [<c020dba0>]
> (sys_mount+0x9c/0xd0)
> [  278.390000] [<c020dba0>] (sys_mount+0x9c/0xd0) from [<c017c9e0>]
> (ret_fast_syscall+0x0/0x2c)
> [  278.400000] UBIFS DBG (pid 1497): ubifs_bg_thread: background
> thread "ubifs_bgt0_2" stops
> mount: Invalid argument

Do you see this problem with mtdram, which emulates NOR in RAM? The
problem is very strange. See modinfo mtdram for its parameters.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
