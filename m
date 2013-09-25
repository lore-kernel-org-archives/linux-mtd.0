Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VOn0Y-0005BY-EQ
 for linux-mtd@lists.infradead.org; Wed, 25 Sep 2013 11:11:53 +0000
Message-ID: <5242C4C1.2030401@nod.at>
Date: Wed, 25 Sep 2013 13:10:57 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Richard Genoud <richard.genoud@gmail.com>
Subject: Re: BUG: fastmap and u-boot's ubi write command
References: <5242C213.3080808@gmail.com>
In-Reply-To: <5242C213.3080808@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: u-boot@lists.denx.de, linux-mtd@lists.infradead.org,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

Am 25.09.2013 12:59, schrieb Richard Genoud:
> 
> [CC u-boot ML since it may not be a kernel only related bug(s)]
> 
> Hi Richard, Artem,
> 
> I'm still playing with fastmap and I ran into something.
> It's involving u-boot's "ubi write" command and fastmap.
> What I'm doing is:
> - Flashing a mtd partition with a userspace.ubi image via u-boot
> - Booting linux one or to times
> - Flashing the UBI volume rootfs with a rootfs.ubifs image via u-boot
> - Booting linux one or to times.
> 
> And, depending on fastmap not compiled/disable/auto I've got an ubi_assert that fails and a slowpath warning.
> 
> Here's the story:
> U-Boot 2013.07
> Kernel 3.11.1

Before we waste time, please ensure that you have all recent UBI fixes applied.
UBI: Fix PEB leak in wear_leveling_worker() (Merged into 3.12-rc1, on it's way to -stable)
UBI: Fix invalidate_fastmap() (Merged into 3.12-rc1)
UBI: Fix refill_wl_user_pool() (Pending, http://lkml.org/lkml/2013/8/26/121)

> NAND:
> - 128KiB PEB
> - 2KiB page
> - 2048 PEB
> - no subpage
> mapping is:
> 0x000000000000-0x000000020000 : "dtb"  (128KiB)
> 0x000000020000-0x000000a00000 : "Kernel" (9.875KiB)
> 0x000000a00000-0x00000ff80000 : "UBI" (245.5 KiB)
> 0x00000ff80000-0x000010000000 : "BBT" (512KiB)
> 
> 1- With Fastmap NOT compiled
> - Flashing the UBI mtd partition under u-boot:
>> fatload usb 0 0x20008000 /userspace.ubi
>> nand device ubi
>> nand erase.part ubi
> NAND erase.part: device 0 offset 0xa00000, size 0xf580000
> OK
>> nand write.trimffs 0x20008000 ubi 35a0000
> NAND write: device 0 offset 0xa00000, size 0x35a0000
>  56229888 bytes written: OK
> Booting a non-FASTMAP kernel:
> [...]
> [    0.789062] UBI: attaching mtd2 to ubi0
> [    1.351562] UBI: scanning is finished
> [    1.367187] UBI: attached mtd2 (name "UBI", size 245 MiB) to ubi0
> [    1.375000] UBI: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
> [    1.382812] UBI: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
> [    1.390625] UBI: VID header offset: 2048 (aligned 2048), data offset: 4096
> [    1.398437] UBI: good PEBs: 1964, bad PEBs: 0, corrupted PEBs: 0
> [    1.398437] UBI: user volume: 3, internal volumes: 1, max. volumes count: 128
> [    1.406250] UBI: max/mean erase counter: 0/0, WL threshold: 4096, image sequence number: 891983656
> [    1.414062] UBI: available PEBs: 2, total reserved PEBs: 1962, PEBs reserved for bad PEB handling: 40
> [    1.421875] UBI: background thread "ubi_bgt0d" started, PID 354
> [    1.437500] UBIFS: background thread "ubifs_bgt0_0" started, PID 356
> [    1.523437] UBIFS: mounted UBI device 0, volume 0, name "rootfs"
> [    1.523437] UBIFS: LEB size: 126976 bytes (124 KiB), min./max. I/O unit sizes: 2048 bytes/2048 bytes
> [    1.531250] UBIFS: FS size: 63614976 bytes (60 MiB, 501 LEBs), journal size 8634368 bytes (8 MiB, 68 LEBs)
> [    1.539062] UBIFS: reserved for root: 0 bytes (0 KiB)
> [    1.546875] UBIFS: media format: w4/r0 (latest is w4/r0), UUID 47FE5308-55FD-4F1C-BD13-C23AED232326, small LPT model
> 
> => OK
> 
> Now, under u-boot, flashing only the ubi volume "rootfs":
>> fatload usb 0 0x20008000 /rootfs.ubifs
> 54218752 bytes read in 3259 ms (15.9 MiB/s)
>> ubi part ubi
> UBI: attaching mtd1 to ubi0
> UBI: physical eraseblock size:   131072 bytes (128 KiB)
> UBI: logical eraseblock size:    126976 bytes
> UBI: smallest flash I/O unit:    2048
> UBI: VID header offset:          2048 (aligned 2048)
> UBI: data offset:                4096
> UBI: attached mtd1 to ubi0
> UBI: MTD device name:            "mtd=2"
> UBI: MTD device size:            245 MiB
> UBI: number of good PEBs:        1964
> UBI: number of bad PEBs:         0
> UBI: max. allowed volumes:       128
> UBI: wear-leveling threshold:    4096
> UBI: number of internal volumes: 1
> UBI: number of user volumes:     3
> UBI: available PEBs:             23
> UBI: total number of reserved PEBs: 1941
> UBI: number of PEBs reserved for bad PEB handling: 19
> UBI: max/mean erase counter: 2/0
>> ubi write 0x20008000 rootfs 33b5000
> 54218752 bytes written to volume rootfs
> 
> Booting the same kernel:
> [    0.812500] UBI: attaching mtd2 to ubi0
> [    1.664062] UBI: scanning is finished
> [    1.687500] UBI: attached mtd2 (name "UBI", size 245 MiB) to ubi0
> [    1.687500] UBI: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
> [    1.695312] UBI: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
> [    1.703125] UBI: VID header offset: 2048 (aligned 2048), data offset: 4096
> [    1.710937] UBI: good PEBs: 1964, bad PEBs: 0, corrupted PEBs: 0
> [    1.718750] UBI: user volume: 3, internal volumes: 1, max. volumes count: 128
> [    1.718750] UBI: max/mean erase counter: 3/1, WL threshold: 4096, image sequence number: 891983656
> [    1.726562] UBI: available PEBs: 2, total reserved PEBs: 1962, PEBs reserved for bad PEB handling: 40
> [    1.734375] UBI: background thread "ubi_bgt0d" started, PID 354
> [    1.750000] UBIFS: background thread "ubifs_bgt0_0" started, PID 356
> [    1.789062] UBIFS: mounted UBI device 0, volume 0, name "rootfs"
> [    1.796875] UBIFS: LEB size: 126976 bytes (124 KiB), min./max. I/O unit sizes: 2048 bytes/2048 bytes
> [    1.804687] UBIFS: FS size: 63614976 bytes (60 MiB, 501 LEBs), journal size 8634368 bytes (8 MiB, 68 LEBs)
> [    1.812500] UBIFS: reserved for root: 0 bytes (0 KiB)
> [    1.812500] UBIFS: media format: w4/r0 (latest is w4/r0), UUID 47FE5308-55FD-4F1C-BD13-C23AED232326, small LPT model
> 
> => all OK
> 
> 2- With Fastmap compiled and ubi.fm_autoconvert=0
> - Flashing the UBI mtd partition under u-boot:
>> fatload usb 0 0x20008000 /userspace.ubi
>> nand device ubi
>> nand erase.part ubi
> NAND erase.part: device 0 offset 0xa00000, size 0xf580000
> OK
>> nand write.trimffs 0x20008000 ubi 35a0000
> NAND write: device 0 offset 0xa00000, size 0x35a0000
>  56229888 bytes written: OK
> Booting a FASTMAP kernel:
> [...]
> [    0.812500] UBI: default fastmap pool size: 95
> [    0.820312] UBI: default fastmap WL pool size: 25
> [    0.820312] UBI: attaching mtd2 to ubi0
> [    1.289062] UBI: scanning is finished
> [    1.304687] UBI: attached mtd2 (name "UBI", size 245 MiB) to ubi0
> [    1.312500] UBI: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
> [    1.320312] UBI: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
> [    1.328125] UBI: VID header offset: 2048 (aligned 2048), data offset: 4096
> [    1.328125] UBI: good PEBs: 1964, bad PEBs: 0, corrupted PEBs: 0
> [    1.335937] UBI: user volume: 3, internal volumes: 1, max. volumes count: 128
> [    1.343750] UBI: max/mean erase counter: 0/0, WL threshold: 4096, image sequence number: 891983656
> [    1.351562] UBI: available PEBs: 0, total reserved PEBs: 1964, PEBs reserved for bad PEB handling: 40
> [    1.359375] UBI: background thread "ubi_bgt0d" started, PID 355
> [    1.453125] UBIFS: background thread "ubifs_bgt0_0" started, PID 357
> [    1.515625] UBIFS: mounted UBI device 0, volume 0, name "rootfs"
> [    1.515625] UBIFS: LEB size: 126976 bytes (124 KiB), min./max. I/O unit sizes: 2048 bytes/2048 bytes
> [    1.523437] UBIFS: FS size: 63614976 bytes (60 MiB, 501 LEBs), journal size 8634368 bytes (8 MiB, 68 LEBs)
> [    1.531250] UBIFS: reserved for root: 0 bytes (0 KiB)
> [    1.539062] UBIFS: media format: w4/r0 (latest is w4/r0), UUID 47FE5308-55FD-4F1C-BD13-C23AED232326, small LPT model
> => OK
> 
> 
> Rebooting: :
> [    0.812500] UBI: default fastmap pool size: 95
> [    0.820312] UBI: default fastmap WL pool size: 25
> [    0.820312] UBI: attaching mtd2 to ubi0
> [    1.578125] UBI: scanning is finished
> [    1.601562] UBI: attached mtd2 (name "UBI", size 245 MiB) to ubi0
> [    1.609375] UBI: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
> [    1.617187] UBI: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
> [    1.617187] UBI: VID header offset: 2048 (aligned 2048), data offset: 4096
> [    1.625000] UBI: good PEBs: 1964, bad PEBs: 0, corrupted PEBs: 0
> [    1.632812] UBI: user volume: 3, internal volumes: 1, max. volumes count: 128
> [    1.640625] UBI: max/mean erase counter: 2/0, WL threshold: 4096, image sequence number: 891983656
> [    1.648437] UBI: available PEBs: 0, total reserved PEBs: 1964, PEBs reserved for bad PEB handling: 40
> [    1.656250] UBI: background thread "ubi_bgt0d" started, PID 355
> 
> Still ok.
> 
> Now, under u-boot, flashing only the ubi volume "rootfs":
>> fatload usb 0 0x20008000 /rootfs.ubifs
> 54218752 bytes read in 3259 ms (15.9 MiB/s)
>> ubi part ubi
> UBI: attaching mtd1 to ubi0
> UBI: physical eraseblock size:   131072 bytes (128 KiB)
> UBI: logical eraseblock size:    126976 bytes
> UBI: smallest flash I/O unit:    2048
> UBI: VID header offset:          2048 (aligned 2048)
> UBI: data offset:                4096
> UBI: attached mtd1 to ubi0
> UBI: MTD device name:            "mtd=2"
> UBI: MTD device size:            245 MiB
> UBI: number of good PEBs:        1964
> UBI: number of bad PEBs:         0
> UBI: max. allowed volumes:       128
> UBI: wear-leveling threshold:    4096
> UBI: number of internal volumes: 1
> UBI: number of user volumes:     3
> UBI: available PEBs:             23
> UBI: total number of reserved PEBs: 1941
> UBI: number of PEBs reserved for bad PEB handling: 19
> UBI: max/mean erase counter: 2/0
>> ubi write 0x20008000 rootfs 33b5000
> 54218752 bytes written to volume rootfs
> 
> Booting the same kernel:
> [    0.804687] UBI: default fastmap pool size: 95
> [    0.812500] UBI: default fastmap WL pool size: 25
> [    0.812500] UBI: attaching mtd2 to ubi0
> [    1.570312] UBI: scanning is finished
> [    1.593750] UBI: attached mtd2 (name "UBI", size 245 MiB) to ubi0
> [    1.601562] UBI: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
> [    1.609375] UBI: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
> [    1.609375] UBI: VID header offset: 2048 (aligned 2048), data offset: 4096
> [    1.617187] UBI: good PEBs: 1964, bad PEBs: 0, corrupted PEBs: 0
> [    1.625000] UBI: user volume: 3, internal volumes: 1, max. volumes count: 128
> [    1.632812] UBI: max/mean erase counter: 3/1, WL threshold: 4096, image sequence number: 891983656
> [    1.640625] UBI: available PEBs: 0, total reserved PEBs: 1964, PEBs reserved for bad PEB handling: 40
> [    1.648437] UBI: background thread "ubi_bgt0d" started, PID 355
> [    1.664062] UBIFS: background thread "ubifs_bgt0_0" started, PID 357
> [    1.703125] UBIFS: mounted UBI device 0, volume 0, name "rootfs"
> [    1.710937] UBIFS: LEB size: 126976 bytes (124 KiB), min./max. I/O unit sizes: 2048 bytes/2048 bytes
> [    1.718750] UBIFS: FS size: 63614976 bytes (60 MiB, 501 LEBs), journal size 8634368 bytes (8 MiB, 68 LEBs)
> [    1.726562] UBIFS: reserved for root: 0 bytes (0 KiB)
> [    1.734375] UBIFS: media format: w4/r0 (latest is w4/r0), UUID 47FE5308-55FD-4F1C-BD13-C23AED232326, small LPT model
> => All OK (I rebooted one or two times, no problem showing up)
> 
> Now, booting with ubi.fm_autoconvert=1:
> [    0.812500] UBI: default fastmap pool size: 95
> [    0.820312] UBI: default fastmap WL pool size: 25
> [    0.820312] UBI: attaching mtd2 to ubi0
> [    1.578125] UBI: scanning is finished
> [    1.601562] UBI: attached mtd2 (name "UBI", size 245 MiB) to ubi0
> [    1.609375] UBI: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
> [    1.609375] UBI: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
> [    1.617187] UBI: VID header offset: 2048 (aligned 2048), data offset: 4096
> [    1.625000] UBI: good PEBs: 1964, bad PEBs: 0, corrupted PEBs: 0
> [    1.632812] UBI: user volume: 3, internal volumes: 1, max. volumes count: 128
> [    1.640625] UBI: max/mean erase counter: 3/1, WL threshold: 4096, image sequence number: 891983656
> [    1.648437] UBI: available PEBs: 0, total reserved PEBs: 1964, PEBs reserved for bad PEB handling: 40
> [    1.656250] UBI: background thread "ubi_bgt0d" started, PID 355
> [    1.671875] UBIFS: background thread "ubifs_bgt0_0" started, PID 357
> [    1.710937] UBIFS: mounted UBI device 0, volume 0, name "rootfs"
> [    1.718750] UBIFS: LEB size: 126976 bytes (124 KiB), min./max. I/O unit sizes: 2048 bytes/2048 bytes
> [    1.726562] UBIFS: FS size: 63614976 bytes (60 MiB, 501 LEBs), journal size 8634368 bytes (8 MiB, 68 LEBs)
> [    1.734375] UBIFS: reserved for root: 0 bytes (0 KiB)
> [    1.742187] UBIFS: media format: w4/r0 (latest is w4/r0), UUID 47FE5308-55FD-4F1C-BD13-C23AED232326, small LPT model
> => Still OK
> Rebooting again with ubi.fm_autoconvert=1:
> [    0.812500] UBI: default fastmap pool size: 95
> [    0.820312] UBI: default fastmap WL pool size: 25
> [    0.820312] UBI: attaching mtd2 to ubi0
> [    0.851562] UBI error: ubi_scan_fastmap: Attach by fastmap failed, doing a full scan!

This is not the top most error. Do you have to full log?
Would be nice to know why fastmap has fallen back to a full scan.

> [    1.593750] UBI: scanning is finished
> [    1.601562] UBI assert failed in ubi_wl_init at 1967 (pid 1)
> [    1.609375] CPU: 0 PID: 1 Comm: swapper Not tainted 3.11.1 #5
> [    1.617187] [<c0012e20>] (unwind_backtrace+0x0/0xe0) from [<c0010bb8>] (show_stack+0x10/0x14)
> [    1.625000] [<c0010bb8>] (show_stack+0x10/0x14) from [<c01a0704>] (ubi_wl_init+0x3d0/0x4b8)
> [    1.632812] [<c01a0704>] (ubi_wl_init+0x3d0/0x4b8) from [<c01a2cd4>] (ubi_attach+0x270/0x34c)
> [    1.640625] [<c01a2cd4>] (ubi_attach+0x270/0x34c) from [<c0197678>] (ubi_attach_mtd_dev+0x2b8/0x86c)
> [    1.648437] [<c0197678>] (ubi_attach_mtd_dev+0x2b8/0x86c) from [<c0346630>] (ubi_init+0x1d8/0x29c)
> [    1.656250] [<c0346630>] (ubi_init+0x1d8/0x29c) from [<c0008810>] (do_one_initcall+0x94/0x144)
> [    1.664062] [<c0008810>] (do_one_initcall+0x94/0x144) from [<c0335a9c>] (kernel_init_freeable+0xe8/0x1ac)
> [    1.671875] [<c0335a9c>] (kernel_init_freeable+0xe8/0x1ac) from [<c0251500>] (kernel_init+0x8/0xe4)
> [    1.679687] [<c0251500>] (kernel_init+0x8/0xe4) from [<c000e590>] (ret_from_fork+0x14/0x24)
> [    1.695312] UBI: attached mtd2 (name "UBI", size 245 MiB) to ubi0
> [    1.703125] UBI: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
> [    1.703125] UBI: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
> [    1.710937] UBI: VID header offset: 2048 (aligned 2048), data offset: 4096
> [    1.718750] UBI: good PEBs: 1964, bad PEBs: 0, corrupted PEBs: 0
> [    1.726562] UBI: user volume: 3, internal volumes: 1, max. volumes count: 128
> [    1.726562] UBI: max/mean erase counter: 3/1, WL threshold: 4096, image sequence number: 891983656
> [    1.734375] UBI: available PEBs: 0, total reserved PEBs: 1964, PEBs reserved for bad PEB handling: 40
> [    1.742187] UBI: background thread "ubi_bgt0d" started, PID 355
> [    1.757812] UBIFS: background thread "ubifs_bgt0_0" started, PID 357
> [    1.796875] UBIFS: mounted UBI device 0, volume 0, name "rootfs"
> [    1.804687] UBIFS: LEB size: 126976 bytes (124 KiB), min./max. I/O unit sizes: 2048 bytes/2048 bytes
> [    1.812500] UBIFS: FS size: 63614976 bytes (60 MiB, 501 LEBs), journal size 8634368 bytes (8 MiB, 68 LEBs)
> [    1.820312] UBIFS: reserved for root: 0 bytes (0 KiB)
> [    1.820312] UBIFS: media format: w4/r0 (latest is w4/r0), UUID 47FE5308-55FD-4F1C-BD13-C23AED232326, small LPT model
> [    1.828125] VFS: Mounted root (ubifs filesystem) on device 0:11.
> [    1.835937] devtmpfs: mounted
> [    1.835937] Freeing unused kernel memory: 112K (c0335000 - c0351000)
> [    2.187500] UBI error: ubi_update_fastmap: could not find any anchor PEB
> [    2.195312] UBI warning: ubi_update_fastmap: Unable to write new fastmap, err=-28
> => If I reboot again, I still have those error messages.
> 
> 
> 3- With Fastmap compiled and ubi.fm_autoconvert=1
> - Flashing the UBI mtd partition under u-boot:
>> fatload usb 0 0x20008000 /userspace.ubi
>> nand device ubi
>> nand erase.part ubi
> NAND erase.part: device 0 offset 0xa00000, size 0xf580000
> OK
>> nand write.trimffs 0x20008000 ubi 35a0000
> NAND write: device 0 offset 0xa00000, size 0x35a0000
>  56229888 bytes written: OK
> Booting a FASTMAP kernel with ubi.fm_autoconvert=1:
> [...]
> [    0.812500] UBI: default fastmap pool size: 95
> [    0.820312] UBI: default fastmap WL pool size: 25
> [    0.820312] UBI: attaching mtd2 to ubi0
> [    1.289062] UBI: scanning is finished
> [    1.304687] UBI: attached mtd2 (name "UBI", size 245 MiB) to ubi0
> [    1.312500] UBI: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
> [    1.320312] UBI: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
> [    1.328125] UBI: VID header offset: 2048 (aligned 2048), data offset: 4096
> [    1.328125] UBI: good PEBs: 1964, bad PEBs: 0, corrupted PEBs: 0
> [    1.335937] UBI: user volume: 3, internal volumes: 1, max. volumes count: 128
> [    1.343750] UBI: max/mean erase counter: 0/0, WL threshold: 4096, image sequence number: 891983656
> [    1.351562] UBI: available PEBs: 0, total reserved PEBs: 1964, PEBs reserved for bad PEB handling: 40
> [    1.359375] UBI: background thread "ubi_bgt0d" started, PID 355
> [    1.437500] UBI error: ubi_update_fastmap: could not find any anchor PEB
> [    1.445312] UBI warning: ubi_update_fastmap: Unable to write new fastmap, err=-28
> =>OK
> 
> Rebooting 2 times to let FASTMAP show its power:
> [    0.812500] UBI: default fastmap pool size: 95
> [    0.820312] UBI: default fastmap WL pool size: 25
> [    0.820312] UBI: attaching mtd2 to ubi0
> [    0.929687] UBI: attached by fastmap
> [    0.937500] UBI: fastmap pool size: 95
> [    0.937500] UBI: fastmap WL pool size: 25
> [    0.960937] UBI: attached mtd2 (name "UBI", size 245 MiB) to ubi0
> GREAT !
> 
> Now, under u-boot, flashing only the ubi volume "rootfs":
>> fatload usb 0 0x20008000 /rootfs.ubifs
> 54218752 bytes read in 3259 ms (15.9 MiB/s)
>> ubi part ubi
> UBI: attaching mtd1 to ubi0
> UBI: physical eraseblock size:   131072 bytes (128 KiB)
> UBI: logical eraseblock size:    126976 bytes
> UBI: smallest flash I/O unit:    2048
> UBI: VID header offset:          2048 (aligned 2048)
> UBI: data offset:                4096
> UBI: "delete" compatible internal volume 2147479552:0 found, remove it
> UBI: attached mtd1 to ubi0
> UBI: MTD device name:            "mtd=2"
> UBI: MTD device size:            245 MiB
> UBI: number of good PEBs:        1964
> UBI: number of bad PEBs:         0
> UBI: max. allowed volumes:       128
> UBI: wear-leveling threshold:    4096
> UBI: number of internal volumes: 1
> UBI: number of user volumes:     3
> UBI: available PEBs:             23
> UBI: total number of reserved PEBs: 1941
> UBI: number of PEBs reserved for bad PEB handling: 19
> UBI: max/mean erase counter: 2/0
>> ubi write 0x20008000 rootfs 33b5000
> 54218752 bytes written to volume rootfs
> 
> =>FASTMAP internal volume has been erased, which is the expected behaviour.
> 
> Booting the same kernel, still with ubi.fm_autoconvert=1:
> [...]
> [    0.812500] UBI: default fastmap pool size: 95
> [    0.820312] UBI: default fastmap WL pool size: 25
> [    0.820312] UBI: attaching mtd2 to ubi0
> [    1.585937] UBI: scanning is finished
> [    1.601562] UBI: attached mtd2 (name "UBI", size 245 MiB) to ubi0
> [    1.609375] UBI: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
> [    1.617187] UBI: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
> [    1.625000] UBI: VID header offset: 2048 (aligned 2048), data offset: 4096
> [    1.625000] UBI: good PEBs: 1964, bad PEBs: 0, corrupted PEBs: 0
> [    1.632812] UBI: user volume: 3, internal volumes: 1, max. volumes count: 128
> [    1.640625] UBI: max/mean erase counter: 4/1, WL threshold: 4096, image sequence number: 891983656
> [    1.648437] UBI: available PEBs: 0, total reserved PEBs: 1964, PEBs reserved for bad PEB handling: 40
> [    1.656250] UBI: background thread "ubi_bgt0d" started, PID 355
> [    1.703125] UBIFS: background thread "ubifs_bgt0_0" started, PID 357
> [    1.734375] UBIFS: mounted UBI device 0, volume 0, name "rootfs"
> [    1.742187] UBIFS: LEB size: 126976 bytes (124 KiB), min./max. I/O unit sizes: 2048 bytes/2048 bytes
> [    1.750000] UBIFS: FS size: 63614976 bytes (60 MiB, 501 LEBs), journal size 8634368 bytes (8 MiB, 68 LEBs)
> [    1.757812] UBIFS: reserved for root: 0 bytes (0 KiB)
> [    1.765625] UBIFS: media format: w4/r0 (latest is w4/r0), UUID 47FE5308-55FD-4F1C-BD13-C23AED232326, small LPT model
> =>OK this time, let's reboot:
> 
> [    0.812500] UBI: default fastmap pool size: 95
> [    0.820312] UBI: default fastmap WL pool size: 25
> [    0.820312] UBI: attaching mtd2 to ubi0
> [    0.914062] UBI error: scan_pool: bad image seq: 0x0, expected: 0x352a9728
> [    0.921875] ------------[ cut here ]------------
> [    0.929687] WARNING: CPU: 0 PID: 1 at drivers/mtd/ubi/fastmap.c:829 ubi_attach_fastmap+0xd38/0xda0()

This bug got most likely fixed by "UBI: Fix PEB leak in wear_leveling_worker()".

> [    0.937500] Modules linked in:
> [    0.937500] CPU: 0 PID: 1 Comm: swapper Not tainted 3.11.1 #5
> [    0.945312] [<c0012e20>] (unwind_backtrace+0x0/0xe0) from [<c0010bb8>] (show_stack+0x10/0x14)
> [    0.953125] [<c0010bb8>] (show_stack+0x10/0x14) from [<c001ab2c>] (warn_slowpath_common+0x60/0x80)
> [    0.960937] [<c001ab2c>] (warn_slowpath_common+0x60/0x80) from [<c001ab64>] (warn_slowpath_null+0x18/0x1c)
> [    0.968750] [<c001ab64>] (warn_slowpath_null+0x18/0x1c) from [<c01a5c8c>] (ubi_attach_fastmap+0xd38/0xda0)
> [    0.976562] [<c01a5c8c>] (ubi_attach_fastmap+0xd38/0xda0) from [<c01a62d4>] (ubi_scan_fastmap+0x5b4/0x7b8)
> [    0.984375] [<c01a62d4>] (ubi_scan_fastmap+0x5b4/0x7b8) from [<c01a2c2c>] (ubi_attach+0x1c8/0x34c)
> [    0.992187] [<c01a2c2c>] (ubi_attach+0x1c8/0x34c) from [<c0197678>] (ubi_attach_mtd_dev+0x2b8/0x86c)
> [    1.000000] [<c0197678>] (ubi_attach_mtd_dev+0x2b8/0x86c) from [<c0346630>] (ubi_init+0x1d8/0x29c)
> [    1.007812] [<c0346630>] (ubi_init+0x1d8/0x29c) from [<c0008810>] (do_one_initcall+0x94/0x144)
> [    1.015625] [<c0008810>] (do_one_initcall+0x94/0x144) from [<c0335a9c>] (kernel_init_freeable+0xe8/0x1ac)
> [    1.023437] [<c0335a9c>] (kernel_init_freeable+0xe8/0x1ac) from [<c0251500>] (kernel_init+0x8/0xe4)
> [    1.031250] [<c0251500>] (kernel_init+0x8/0xe4) from [<c000e590>] (ret_from_fork+0x14/0x24)
> [    1.039062] ---[ end trace 313a7957427257d8 ]---
> [    1.039062] UBI error: ubi_scan_fastmap: Attach by fastmap failed, doing a full scan!
> [    1.781250] UBI: scanning is finished
> [    1.796875] UBI assert failed in ubi_wl_init at 1967 (pid 1)
> [    1.796875] CPU: 0 PID: 1 Comm: swapper Tainted: G        W    3.11.1 #5
> [    1.804687] [<c0012e20>] (unwind_backtrace+0x0/0xe0) from [<c0010bb8>] (show_stack+0x10/0x14)
> [    1.812500] [<c0010bb8>] (show_stack+0x10/0x14) from [<c01a0704>] (ubi_wl_init+0x3d0/0x4b8)
> [    1.820312] [<c01a0704>] (ubi_wl_init+0x3d0/0x4b8) from [<c01a2cd4>] (ubi_attach+0x270/0x34c)
> [    1.828125] [<c01a2cd4>] (ubi_attach+0x270/0x34c) from [<c0197678>] (ubi_attach_mtd_dev+0x2b8/0x86c)
> [    1.835937] [<c0197678>] (ubi_attach_mtd_dev+0x2b8/0x86c) from [<c0346630>] (ubi_init+0x1d8/0x29c)
> [    1.843750] [<c0346630>] (ubi_init+0x1d8/0x29c) from [<c0008810>] (do_one_initcall+0x94/0x144)
> [    1.851562] [<c0008810>] (do_one_initcall+0x94/0x144) from [<c0335a9c>] (kernel_init_freeable+0xe8/0x1ac)
> [    1.859375] [<c0335a9c>] (kernel_init_freeable+0xe8/0x1ac) from [<c0251500>] (kernel_init+0x8/0xe4)
> [    1.867187] [<c0251500>] (kernel_init+0x8/0xe4) from [<c000e590>] (ret_from_fork+0x14/0x24)
> [    1.882812] UBI: attached mtd2 (name "UBI", size 245 MiB) to ubi0
> [    1.890625] UBI: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
> [    1.898437] UBI: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
> [    1.898437] UBI: VID header offset: 2048 (aligned 2048), data offset: 4096
> [    1.906250] UBI: good PEBs: 1964, bad PEBs: 0, corrupted PEBs: 0
> [    1.914062] UBI: user volume: 3, internal volumes: 1, max. volumes count: 128
> [    1.921875] UBI: max/mean erase counter: 4/1, WL threshold: 4096, image sequence number: 891983656
> [    1.929687] UBI: available PEBs: 0, total reserved PEBs: 1964, PEBs reserved for bad PEB handling: 40
> [    1.937500] UBI: background thread "ubi_bgt0d" started, PID 355
> [    1.953125] UBIFS: background thread "ubifs_bgt0_0" started, PID 357
> [    1.992187] UBIFS: mounted UBI device 0, volume 0, name "rootfs"
> [    2.000000] UBIFS: LEB size: 126976 bytes (124 KiB), min./max. I/O unit sizes: 2048 bytes/2048 bytes
> [    2.007812] UBIFS: FS size: 63614976 bytes (60 MiB, 501 LEBs), journal size 8634368 bytes (8 MiB, 68 LEBs)
> [    2.015625] UBIFS: reserved for root: 0 bytes (0 KiB)
> [    2.023437] UBIFS: media format: w4/r0 (latest is w4/r0), UUID 47FE5308-55FD-4F1C-BD13-C23AED232326, small LPT model
> [    2.031250] VFS: Mounted root (ubifs filesystem) on device 0:11.
> [    2.039062] devtmpfs: mounted
> [    2.046875] Freeing unused kernel memory: 112K (c0335000 - c0351000)
> [    2.390625] UBI error: ubi_update_fastmap: could not find any anchor PEB
> [    2.398437] UBI warning: ubi_update_fastmap: Unable to write new fastmap, err=-28

Thanks,
//richard
