Received: from mail-lb0-x22f.google.com ([2a00:1450:4010:c04::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VCrq4-0004V6-OT
 for linux-mtd@lists.infradead.org; Fri, 23 Aug 2013 13:55:46 +0000
Received: by mail-lb0-f175.google.com with SMTP id 13so497167lba.20
 for <linux-mtd@lists.infradead.org>; Fri, 23 Aug 2013 06:55:21 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CACQ1gAgOS5kpykb1jxnRJUNCmdC1jwmmWr5cQ7aazKVvMjBPWQ@mail.gmail.com>
References: <CACQ1gAgOS5kpykb1jxnRJUNCmdC1jwmmWr5cQ7aazKVvMjBPWQ@mail.gmail.com>
From: Richard Genoud <richard.genoud@gmail.com>
Date: Fri, 23 Aug 2013 15:55:01 +0200
Message-ID: <CACQ1gAj2bNOnnCqLjALW0LiXYiDw_CTYUTgsE4Jd5pH9DkWadA@mail.gmail.com>
Subject: Re: Fastmap and Atmel sam-ba
To: Richard Weinberger <richard@nod.at>, Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[arg ! I forgot to cc the mtd list. This new gmail interface is a pain !]

2013/8/23 Richard Genoud <richard.genoud@gmail.com>:
> Hi Artem, Richard,
>
> I'm starting to use fastmap (and I saved 650ms on a 240MiB partition,
> allowing to boot in less than 2sec :) ) and I ran into a bug (or I
> missed something).
>
> When I use ubinize to make a ubi image, then flash this image with
> Atmel's sam-ba.
>
> Then, if I boot a kernel with fastmap *not compiled*, it's ok.
> ( booting the kernel with "console=ttyS0,115200 loglevel=8 rw
> root=ubi0:rootfs rootfstype=ubifs ubi.mtd=UBI" )
> BUT, if I do the same with a kernel with fastmap compiled (but not
> activated), I've got that kind of error:
>
> [    0.687500] UBI: default fastmap pool size: 95
> [    0.695312] UBI: default fastmap WL pool size: 25
> [    0.695312] UBI: attaching mtd2 to ubi0
> [    0.703125] UBI DBG gen (pid 1): sizeof(struct ubi_ainf_peb) 48
> [    0.710937] UBI DBG gen (pid 1): sizeof(struct ubi_wl_entry) 20
> [    0.710937] UBI DBG gen (pid 1): min_io_size      2048
> [    0.718750] UBI DBG gen (pid 1): max_write_size   2048
> [    0.718750] UBI DBG gen (pid 1): hdrs_min_io_size 2048
> [    0.726562] UBI DBG gen (pid 1): ec_hdr_alsize    2048
> [    0.734375] UBI DBG gen (pid 1): vid_hdr_alsize   2048
> [    0.734375] UBI DBG gen (pid 1): vid_hdr_offset   2048
> [    0.742187] UBI DBG gen (pid 1): vid_hdr_aloffset 2048
> [    0.742187] UBI DBG gen (pid 1): vid_hdr_shift    0
> [    0.750000] UBI DBG gen (pid 1): leb_start        4096
> [    0.757812] UBI DBG gen (pid 1): max_erroneous    196
> [    0.757812] UBI DBG gen (pid 1): process PEB 0
> [    0.765625] UBI DBG bld (pid 1): scan PEB 0
> [    0.765625] UBI DBG io (pid 1): read EC header from PEB 0
> [    0.773437] UBI DBG io (pid 1): read 64 bytes from PEB 0:0
> [    0.781250] UBI DBG io (pid 1): read VID header from PEB 0
> [    0.781250] UBI DBG io (pid 1): read 2048 bytes from PEB 0:2048
> [    0.789062] UBI DBG bld (pid 1): PEB 0, LEB 2147479551:0, EC 0,
> sqnum 0, bitflips 0
> [    0.796875] UBI DBG bld (pid 1): added volume 2147479551
> [    0.804687] UBI DBG gen (pid 1): process PEB 1
> [...]
> [   64.093750] UBI: scanning is finished
> [   64.093750] UBI DBG gen (pid 1): max. sequence number:       0
> [   64.101562] UBI DBG gen (pid 1): check layout volume
> [   64.101562] UBI DBG io (pid 1): read 22528 bytes from PEB 0:4096
> [   64.109375] UBI DBG io (pid 1): read 22528 bytes from PEB 1:4096
> [   64.125000] UBI DBG wl (pid 1): schedule erasure of PEB 430, EC 0, torture 0
> [...]
> [   74.140625] UBI DBG wl (pid 1): add PEB 0 EC 0 to the used tree
> [   74.148437] UBI DBG wl (pid 1): add PEB 1 EC 0 to the used tree
> [...]
> [   76.414062] UBI DBG wl (pid 1): found 1964 PEBs
> [   76.421875] UBI DBG eba (pid 1): initialize EBA sub-system
> [   76.421875] UBI DBG eba (pid 1): EBA sub-system is initialized
> [   76.429687] UBI DBG gen (pid 1): ubi0 major is 252
> [   76.437500] UBI DBG gen (pid 1): add volume 0
> [   76.445312] UBI DBG gen (pid 1): add volume 2
> [   76.445312] UBI: attached mtd2 (name "UBI", size 245 MiB) to ubi0
> [   76.453125] UBI: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
> [   76.460937] UBI: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
> [   76.460937] UBI: VID header offset: 2048 (aligned 2048), data offset: 4096
> [   76.468750] UBI: good PEBs: 1964, bad PEBs: 0, corrupted PEBs: 0
> [   76.476562] UBI: user volume: 2, internal volumes: 1, max. volumes count: 128
> [   76.484375] UBI: max/mean erase counter: 1/0, WL threshold: 4096,
> image sequence number: 27202009
> [   76.492187] UBI: available PEBs: 926, total reserved PEBs: 1038,
> PEBs reserved for bad PEB handling: 40
> [   76.500000] UBIFS DBG gen (pid 1): name ubi0:rootfs, flags 0x8000
> [   76.507812] UBI DBG gen (pid 1): open volume ubi0:rootfs, mode 1
> [   76.507812] UBI DBG gen (pid 1): open device 0, volume rootfs, mode 1
> [   76.515625] UBI DBG gen (pid 1): open device 0, volume 0, mode 1
> [   76.523437] UBIFS DBG gen (pid 1): opened ubi0_0
> [   76.523437] UBI DBG gen (pid 1): open device 0, volume 0, mode 2
> [   76.531250] UBI: background thread "ubi_bgt0d" started, PID 352
> [   76.539062] UBI DBG gen (pid 1): test LEB 0:0
> [   76.546875] UBIFS DBG io (pid 1): LEB 0:0, superblock node, length 4096
> [   76.546875] UBI DBG gen (pid 1): read 4096 bytes from LEB 0:0:0
> [   76.554687] UBI DBG eba (pid 1): read 4096 bytes from offset 0 of
> LEB 0:0, PEB 2
> [   76.562500] UBI DBG io (pid 1): read 4096 bytes from PEB 2:4096
> [   76.570312] UBI DBG wl (pid 352): erase PEB 430 EC 0 LEB -1:-1
> [   76.570312] UBI DBG wl (pid 352): erase PEB 430, old EC 0
> [   76.578125] UBI DBG io (pid 352): erase PEB 430
> [   76.578125] UBIFS DBG mnt (pid 1): Auto resizing (sb) from 405 LEBs
> to 512 LEBs
> [   76.585937] UBI DBG gen (pid 1): atomically write 4096 bytes to LEB 0:0
> [   76.593750] UBIFS error (pid 1): ubifs_leb_change: changing 4096
> bytes in LEB 0 failed, error -28  <---- that's the problem I presume
> [   76.601562] UBIFS warning (pid 1): ubifs_ro_mode: switched to
> read-only mode, error -28
> [   76.609375] CPU: 0 PID: 1 Comm: swapper Not tainted
> 3.11.0-rc6-00144-g431413c-dirty #4
> [   76.617187] [<c0012e20>] (unwind_backtrace+0x0/0xe0) from
> [<c0010bb8>] (show_stack+0x10/0x14)
> [   76.625000] [<c0010bb8>] (show_stack+0x10/0x14) from [<c00e9e30>]
> (ubifs_leb_change+0xb8/0x114)
> [   76.632812] [<c00e9e30>] (ubifs_leb_change+0xb8/0x114) from
> [<c00e92a0>] (ubifs_read_superblock+0x4d0/0x8f8)
> [   76.640625] [<c00e92a0>] (ubifs_read_superblock+0x4d0/0x8f8) from
> [<c0256c60>] (mount_ubifs+0x470/0x1324)
> [   76.648437] [<c0256c60>] (mount_ubifs+0x470/0x1324) from
> [<c00e7d90>] (ubifs_mount+0x4dc/0x63c)
> [   76.656250] [<c00e7d90>] (ubifs_mount+0x4dc/0x63c) from
> [<c0079748>] (mount_fs+0x10/0xbc)
> [   76.664062] [<c0079748>] (mount_fs+0x10/0xbc) from [<c008cfe0>]
> (vfs_kern_mount+0x4c/0xc0)
> [   76.671875] [<c008cfe0>] (vfs_kern_mount+0x4c/0xc0) from
> [<c008ee70>] (do_mount+0x6cc/0x7ec)
> [   76.679687] [<c008ee70>] (do_mount+0x6cc/0x7ec) from [<c008f014>]
> (SyS_mount+0x84/0xb8)
> [   76.687500] [<c008f014>] (SyS_mount+0x84/0xb8) from [<c033fdf4>]
> (mount_block_root+0x108/0x23c)
> [   76.695312] [<c033fdf4>] (mount_block_root+0x108/0x23c) from
> [<c03401b8>] (prepare_namespace+0x88/0x1b0)
> [   76.703125] [<c03401b8>] (prepare_namespace+0x88/0x1b0) from
> [<c033fb1c>] (kernel_init_freeable+0x168/0x1ac)
> [   76.710937] [<c033fb1c>] (kernel_init_freeable+0x168/0x1ac) from
> [<c0253e1c>] (kernel_init+0x8/0xe4)
> [   76.718750] [<c0253e1c>] (kernel_init+0x8/0xe4) from [<c000e590>]
> (ret_from_fork+0x14/0x24)
> [   76.726562] CPU: 0 PID: 1 Comm: swapper Not tainted
> 3.11.0-rc6-00144-g431413c-dirty #4
> [   76.734375] [<c0012e20>] (unwind_backtrace+0x0/0xe0) from
> [<c0010bb8>] (show_stack+0x10/0x14)
> [   76.742187] [<c0010bb8>] (show_stack+0x10/0x14) from [<c00e9e34>]
> (ubifs_leb_change+0xbc/0x114)
> [   76.750000] [<c00e9e34>] (ubifs_leb_change+0xbc/0x114) from
> [<c00e92a0>] (ubifs_read_superblock+0x4d0/0x8f8)
> [   76.757812] [<c00e92a0>] (ubifs_read_superblock+0x4d0/0x8f8) from
> [<c0256c60>] (mount_ubifs+0x470/0x1324)
> [   76.765625] [<c0256c60>] (mount_ubifs+0x470/0x1324) from
> [<c00e7d90>] (ubifs_mount+0x4dc/0x63c)
> [   76.773437] [<c00e7d90>] (ubifs_mount+0x4dc/0x63c) from
> [<c0079748>] (mount_fs+0x10/0xbc)
> [   76.781250] [<c0079748>] (mount_fs+0x10/0xbc) from [<c008cfe0>]
> (vfs_kern_mount+0x4c/0xc0)
> [   76.789062] [<c008cfe0>] (vfs_kern_mount+0x4c/0xc0) from
> [<c008ee70>] (do_mount+0x6cc/0x7ec)
> [   76.796875] [<c008ee70>] (do_mount+0x6cc/0x7ec) from [<c008f014>]
> (SyS_mount+0x84/0xb8)
> [   76.804687] [<c008f014>] (SyS_mount+0x84/0xb8) from [<c033fdf4>]
> (mount_block_root+0x108/0x23c)
> [   76.812500] [<c033fdf4>] (mount_block_root+0x108/0x23c) from
> [<c03401b8>] (prepare_namespace+0x88/0x1b0)
> [   76.820312] [<c03401b8>] (prepare_namespace+0x88/0x1b0) from
> [<c033fb1c>] (kernel_init_freeable+0x168/0x1ac)
> [   76.828125] [<c033fb1c>] (kernel_init_freeable+0x168/0x1ac) from
> [<c0253e1c>] (kernel_init+0x8/0xe4)
> [   76.835937] [<c0253e1c>] (kernel_init+0x8/0xe4) from [<c000e590>]
> (ret_from_fork+0x14/0x24)
> [   76.843750] UBI DBG wl (pid 352): erased PEB 430, new EC 1
> [   76.851562] UBI DBG io (pid 352): write EC header to PEB 430
> [   76.859375] UBI DBG io (pid 352): write 2048 bytes to PEB 430:0
> [   76.859375] UBI DBG gen (pid 1): close device 0, volume 0, mode 2
> [   76.867187] UBI DBG gen (pid 1): close device 0, volume 0, mode 1
> [   76.875000] VFS: Cannot open root device "ubi0:rootfs" or
> unknown-block(0,0): error -28
>
> NB: sam-ba flashes with the trimffs method. If I disable trimffs in
> sam-ba and use mkfs.ubifs with -F, I've got the same error.
>
> NB2: If, instead of booting on the ubi partition, I boot on NFS, and
> then use ubiattach + mount, it's working ok with fastmap.
>
> Did I missed something ?
>
>
> Best regards,
> Richard.



-- 
for me, ck means con kolivas and not calvin klein... does it mean I'm a geek ?
