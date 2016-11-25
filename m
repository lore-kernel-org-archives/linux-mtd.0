Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cAGKq-0007WE-28
 for linux-mtd@lists.infradead.org; Fri, 25 Nov 2016 13:14:54 +0000
Subject: Re: [BUG?] ubi.fm_autoconvert=1 on first boot
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>, linux-mtd@lists.infradead.org
References: <20161125113412.3ozyc7bjjecjahnb@pengutronix.de>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <4d53ffff-a294-8238-bab1-004416e8d7be@nod.at>
Date: Fri, 25 Nov 2016 14:14:16 +0100
MIME-Version: 1.0
In-Reply-To: <20161125113412.3ozyc7bjjecjahnb@pengutronix.de>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Steffen,

On 25.11.2016 12:34, Steffen Trumtrar wrote:
> Hi!
> 
> I'm trying to use ubi.fm_autoconvert=1 with the current (v4.9-rc6) mainline kernel.
> I have the following setup:
> 
> - kernel commandline:
> 	(...) root=ubi0:root ubi.mtd=nand0.root1 ubi.mtd=nand0.data rootfstype=ubifs rw ubi.fm_autoconvert=1
> 	mtdparts=gpmi-nand:(...),6M(nand0.kernel1),6M(nand0.kernel2),68M(nand0.root1),68M(nand0.root2),-(nand0.data)
> 
> - root1 partition: (is not empty when flashed)
> 
> 	mtdinfo /dev/mtd6
> 	mtd6
> 	Name:                           nand0.root1
> 	Type:                           nand
> 	Eraseblock size:                131072 bytes, 128.0 KiB
> 	Amount of eraseblocks:          544 (71303168 bytes, 68.0 MiB)
> 	Minimum input/output unit size: 2048 bytes
> 	Sub-page size:                  2048 bytes
> 	OOB size:                       64 bytes
> 	Character device major/minor:   90:12
> 	Bad blocks are allowed:         true
> 	Device is writable:             true
> 
> - data partition: (is empty when flashed)
> 
> 	mtdinfo /dev/mtd8
> 	mtd8
> 	Name:                           nand0.data
> 	Type:                           nand
> 	Eraseblock size:                131072 bytes, 128.0 KiB
> 	Amount of eraseblocks:          846 (110886912 bytes, 105.8 MiB)
> 	Minimum input/output unit size: 2048 bytes
> 	Sub-page size:                  2048 bytes
> 	OOB size:                       64 bytes
> 	Character device major/minor:   90:16
> 	Bad blocks are allowed:         true
> 	Device is writable:             true
> 
> - bootlog:
> 
> [    1.697223] ubi0: default fastmap pool size: 25
> [    1.701908] ubi0: default fastmap WL pool size: 12
> [    1.706725] ubi0: attaching mtd6
> (...)
> [    2.476067] ubi0: scanning is finished
> [    2.499649] ubi0: attached mtd6 (name "nand0.root1", size 68 MiB)
> [    2.505785] ubi0: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
> [    2.512780] ubi0: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
> [    2.519657] ubi0: VID header offset: 2048 (aligned 2048), data offset: 4096
> [    2.526640] ubi0: good PEBs: 544, bad PEBs: 0, corrupted PEBs: 0
> [    2.532721] ubi0: user volume: 1, internal volumes: 1, max. volumes count: 128
> [    2.540025] ubi0: max/mean erase counter: 2/0, WL threshold: 4096, image sequence number: 666882056
> [    2.549164] ubi0: available PEBs: 0, total reserved PEBs: 544, PEBs reserved for bad PEB handling: 40
> [    2.558509] ubi0: background thread "ubi_bgt0d" started, PID 39
> [    2.564508] ubi1: default fastmap pool size: 40
> [    2.569135] ubi1: default fastmap WL pool size: 20
> [    2.573950] ubi1: attaching mtd8
> (...)
> [    3.167543] ubi1: scanning is finished
> [    3.190860] ubi1 error: ubi_refill_pools: no free eraseblocks
> [    3.196670] ubi1 error: ubi_update_fastmap: could not find any anchor PEB
> [    3.203608] ubi1 warning: ubi_update_fastmap: Unable to write new fastmap, err=-28
> [    3.211299] ubi1 error: ubi_refill_pools: no free eraseblocks
> [    3.217082] ubi1 error: ubi_update_fastmap: could not find any anchor PEB
> [    3.223965] ubi1 warning: ubi_update_fastmap: Unable to write new fastmap, err=-28
> [    3.231632] ubi1 error: ubi_wl_get_peb: Unable to get a free PEB from user WL pool
> [    3.239320] ubi1 warning: ubi_eba_atomic_leb_change: switch to read-only mode
> [    3.255341] Hardware name: Freescale MXS (Device Tree)
> [    3.260616] [<c000ed60>] (unwind_backtrace) from [<c000d0a4>] (show_stack+0x10/0x14)
> [    3.268483] [<c000d0a4>] (show_stack) from [<c020d364>] (ubi_eba_atomic_leb_change+0x3c4/0x3e0)
> [    3.277232] [<c020d364>] (ubi_eba_atomic_leb_change) from [<c020470c>] (ubi_update_layout_vol+0x38/0x54)
> [    3.286826] [<c020470c>] (ubi_update_layout_vol) from [<c0204e00>] (ubi_change_vtbl_record+0x8c/0x110)
> [    3.296247] [<c0204e00>] (ubi_change_vtbl_record) from [<c0206a60>] (ubi_resize_volume+0x158/0x2e0)
> [    3.305406] [<c0206a60>] (ubi_resize_volume) from [<c02079f4>] (autoresize+0x68/0x130)
> [    3.313437] [<c02079f4>] (autoresize) from [<c0208518>] (ubi_attach_mtd_dev+0x4c4/0xd54)
> [    3.321641] [<c0208518>] (ubi_attach_mtd_dev) from [<c0452828>] (ubi_init+0x1bc/0x25c)
> [    3.329688] [<c0452828>] (ubi_init) from [<c0009594>] (do_one_initcall+0x3c/0x17c)
> [    3.337306] [<c0009594>] (do_one_initcall) from [<c0440cf0>] (kernel_init_freeable+0x108/0x1d0)
> [    3.346123] [<c0440cf0>] (kernel_init_freeable) from [<c0345a98>] (kernel_init+0x8/0xf8)
> [    3.354331] [<c0345a98>] (kernel_init) from [<c000a2d0>] (ret_from_fork+0x14/0x24)
> [    3.362017] ubi1 error: autoresize: cannot auto-resize volume 0
> [    3.369308] UBI error: cannot attach mtd8
> (...)
> [    3.394947] UBIFS (ubi0:0): background thread "ubifs_bgt0_0" started, PID 40
> [    3.482996] UBIFS (ubi0:0): recovery needed
> [    3.739605] UBIFS (ubi0:0): recovery completed
> [    3.744224] UBIFS (ubi0:0): UBIFS: mounted UBI device 0, volume 0, name "root"
> [    3.751583] UBIFS (ubi0:0): LEB size: 126976 bytes (124 KiB), min./max. I/O unit sizes: 2048 bytes/2048 bytes
> [    3.761600] UBIFS (ubi0:0): FS size: 61837312 bytes (58 MiB, 487 LEBs), journal size 9023488 bytes (8 MiB, 72 LEBs)
> [    3.772122] UBIFS (ubi0:0): reserved for root: 0 bytes (0 KiB)
> [    3.778051] UBIFS (ubi0:0): media format: w4/r0 (latest is w4/r0), UUID 79048B39-39D6-4BA2-89CF-8F2A0C699060, small LPT model
> 
> As you can see mtd8 can not be autoresized and attached.
> What works however is: booting first with ubi.fm_autoconvert=0 and then enabling
> it on the second boot.
> 
> Am I holding it wrong or is this a bug?

A bug. :(
What you're trying to do used to work and works also here on my test bed.
Can you please share the kernel logs verbatim?
I miss some infos from UBI.

Thanks,
//richard
