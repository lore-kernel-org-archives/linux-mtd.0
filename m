Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cij7M-0003xE-AT
 for linux-mtd@lists.infradead.org; Tue, 28 Feb 2017 14:51:11 +0000
Date: Tue, 28 Feb 2017 15:50:45 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Richard Weinberger <richard@nod.at>
Cc: Steffen Trumtrar <s.trumtrar@pengutronix.de>,
 linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [BUG?] ubi.fm_autoconvert=1 on first boot
Message-ID: <20170228145045.jlutsmkbrzrq4zam@pengutronix.de>
References: <20161125113412.3ozyc7bjjecjahnb@pengutronix.de>
 <4d53ffff-a294-8238-bab1-004416e8d7be@nod.at>
 <20161125135152.f4npajnz5x76f5x7@pengutronix.de>
 <6708b0f4-63e4-663f-794a-13b95f38a928@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6708b0f4-63e4-663f-794a-13b95f38a928@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Richard,

On Wed, Jan 25, 2017 at 09:58:34AM +0100, Richard Weinberger wrote:
> Steffen,
> 
> Am 25.11.2016 um 14:51 schrieb Steffen Trumtrar:
> > [    3.167543] ubi1: scanning is finished
> > [    3.190860] ubi1 error: ubi_refill_pools: no free eraseblocks
> > [    3.196670] ubi1 error: ubi_update_fastmap: could not find any anchor PEB
> > [    3.203608] ubi1 warning: ubi_update_fastmap: Unable to write new fastmap, err=-28
> > [    3.211299] ubi1 error: ubi_refill_pools: no free eraseblocks
> > [    3.217082] ubi1 error: ubi_update_fastmap: could not find any anchor PEB
> > [    3.223965] ubi1 warning: ubi_update_fastmap: Unable to write new fastmap, err=-28
> > [    3.231632] ubi1 error: ubi_wl_get_peb: Unable to get a free PEB from user WL pool
> > [    3.239320] ubi1 warning: ubi_eba_atomic_leb_change: switch to read-only mode
> > [    3.246484] CPU: 0 PID: 1 Comm: swapper Not tainted 4.9.0-rc6 #45
> > [    3.255341] Hardware name: Freescale MXS (Device Tree)
> > [    3.260616] [<c000ed60>] (unwind_backtrace) from [<c000d0a4>] (show_stack+0x10/0x14)
> > [    3.268483] [<c000d0a4>] (show_stack) from [<c020d364>] (ubi_eba_atomic_leb_change+0x3c4/0x3e0)
> > [    3.277232] [<c020d364>] (ubi_eba_atomic_leb_change) from [<c020470c>] (ubi_update_layout_vol+0x38/0x54)
> > [    3.286826] [<c020470c>] (ubi_update_layout_vol) from [<c0204e00>] (ubi_change_vtbl_record+0x8c/0x110)
> > [    3.296247] [<c0204e00>] (ubi_change_vtbl_record) from [<c0206a60>] (ubi_resize_volume+0x158/0x2e0)
> > [    3.305406] [<c0206a60>] (ubi_resize_volume) from [<c02079f4>] (autoresize+0x68/0x130)
> > [    3.313437] [<c02079f4>] (autoresize) from [<c0208518>] (ubi_attach_mtd_dev+0x4c4/0xd54)
> > [    3.321641] [<c0208518>] (ubi_attach_mtd_dev) from [<c0452828>] (ubi_init+0x1bc/0x25c)
> > [    3.329688] [<c0452828>] (ubi_init) from [<c0009594>] (do_one_initcall+0x3c/0x17c)
> > [    3.337306] [<c0009594>] (do_one_initcall) from [<c0440cf0>] (kernel_init_freeable+0x108/0x1d0)
> > [    3.346123] [<c0440cf0>] (kernel_init_freeable) from [<c0345a98>] (kernel_init+0x8/0xf8)
> > [    3.354331] [<c0345a98>] (kernel_init) from [<c000a2d0>] (ret_from_fork+0x14/0x24)
> > [    3.362017] ubi1 error: autoresize: cannot auto-resize volume 0
> > [    3.369308] UBI error: cannot attach mtd8[    3.373284] stmp3xxx-rtc 80056000.rtc: setting system clock to 1970-01-01 00:57:18 UTC (3438)
> > [    3.382547] usb0_vbus: disabling
> > [    3.386189] uart-pl011 80074000.serial: no DMA platform data
> > [    3.394947] UBIFS (ubi0:0): background thread "ubifs_bgt0_0" started, PID 40
> > [    3.482996] UBIFS (ubi0:0): recovery needed
> > [    3.739605] UBIFS (ubi0:0): recovery completed
> > [    3.744224] UBIFS (ubi0:0): UBIFS: mounted UBI device 0, volume 0, name "root"
> > [    3.751583] UBIFS (ubi0:0): LEB size: 126976 bytes (124 KiB), min./max. I/O unit sizes: 2048 bytes/2048 bytes
> > [    3.761600] UBIFS (ubi0:0): FS size: 61837312 bytes (58 MiB, 487 LEBs), journal size 9023488 bytes (8 MiB, 72 LEBs)
> > [    3.772122] UBIFS (ubi0:0): reserved for root: 0 bytes (0 KiB)
> > [    3.778051] UBIFS (ubi0:0): media format: w4/r0 (latest is w4/r0), UUID 79048B39-39D6-4BA2-89CF-8F2A0C699060, small LPT model
> > [    3.791974] VFS: Mounted root (ubifs filesystem) on device 0:14.
> > [    3.801380] devtmpfs: mounted
> > [    3.805096] Freeing unused kernel memory: 144K (c0440000 - c0464000)
> > [    3.811571] This architecture does not have kernel memory protection.
> > mounting filesystems...[    4.463895] UBIFS error (pid: 44): cannot open "ubi1:data", error -19done.
> 
> Can you please give the attached patch a try?
> It is untested since I cannot reproduce.

The patch works. I also had problems reproducing this until I realized
the difference is in ubiformat vs. plain flash_erase/nandwrite. When flashed
with ubiformat everything works fine. When we use plain nandwrite the scanned
empty PEBs do not have a ec header and go to the erase list instead of the
free list. Now the autoresize operation triggers a ubi_update_fastmap
which does not find a free block because all potentially free blocks are
sitting on the erase list.

Doing the volume resize after the wear leveling thread has been started
as you suggested works, so:

Tested-by: Sascha Hauer <s.hauer@pengutronix.de>

For reference: To reproduce try the following:

ubi.ini:
--------
[volume]
mode=ubi
vol_id=1
vol_size=30MiB
vol_type=dynamic
vol_name=volume1
vol_alignment=1
vol_flags=autoresize

ubinize -m 2048 -s 2048 -o ubi.img ubi.ini -p 131072
echo Y > /sys/module/ubi/parameters/fm_autoconvert
flash_erase /dev/mtd0 0 0
nandwrite /dev/mtd0 ubi.img
ubiattach -m 0

Sascha

> diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
> index 85d54f37e28f..264734c4b892 100644
> --- a/drivers/mtd/ubi/build.c
> +++ b/drivers/mtd/ubi/build.c
> @@ -986,12 +986,6 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num,
>  		goto out_free;
>  	}
>  
> -	if (ubi->autoresize_vol_id != -1) {
> -		err = autoresize(ubi, ubi->autoresize_vol_id);
> -		if (err)
> -			goto out_detach;
> -	}
> -
>  	/* Make device "available" before it becomes accessible via sysfs */
>  	ubi_devices[ubi_num] = ubi;
>  
> @@ -1039,9 +1033,17 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num,
>  	wake_up_process(ubi->bgt_thread);
>  	spin_unlock(&ubi->wl_lock);
>  
> +	if (ubi->autoresize_vol_id != -1) {
> +		err = autoresize(ubi, ubi->autoresize_vol_id);
> +		if (err)
> +			goto out_kthread;
> +	}
> +
>  	ubi_notify_all(ubi, UBI_VOLUME_ADDED, NULL);
>  	return ubi_num;
>  
> +out_kthread:
> +	kthread_stop(ubi->bgt_thread);
>  out_debugfs:
>  	ubi_debugfs_exit_dev(ubi);
>  out_uif:


-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
