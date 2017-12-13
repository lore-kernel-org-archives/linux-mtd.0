Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eP3ZD-0003gM-OJ
 for linux-mtd@lists.infradead.org; Wed, 13 Dec 2017 09:43:14 +0000
From: Richard Weinberger <richard@nod.at>
To: Jaap de Jong <jaap.dejong@nedap.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: Mounting issue with old uboot and new rootfs
Date: Wed, 13 Dec 2017 10:43:16 +0100
Message-ID: <5001344.Umix9c0TK6@blindfold>
In-Reply-To: <a9bb7f99-d877-ccf8-8918-25d8ce91baa0@nedap.com>
References: <d868125b-638e-4007-7a90-22937ffca9c6@nedap.com>
 <2249046.8pz4TdecgU@blindfold>
 <a9bb7f99-d877-ccf8-8918-25d8ce91baa0@nedap.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jaap,

Am Mittwoch, 13. Dezember 2017, 08:45:44 CET schrieb Jaap de Jong:
> On 12-12-17 17:29, Richard Weinberger wrote:
> > Jaap,
> > 
> > Am Montag, 11. Dezember 2017, 16:03:25 CET schrieb Jaap de Jong:
> >> Hi All,
> >> 
> >> Some time ago I posted a question with a slightly different subject.
> >> Now that I found out a bit more the previous subject is no longer
> >> relevant.
> >> 
> >> But I still have issues with mounting in a mixed environment.
> >> I have this board with an older u-boot (2010.09) in combination with a
> >> more
> >> recent kernel (4.9.28).
> >> 
> >> The parameters in uboot:
> >>          root=ubi0 rw ubi.mtd=3 rootfstype=ubifs
> >> 
> >> mtdparts=atmel_nand:128K(bootstrap),256K(u-boot-env),640K(u-boot),-(rootf
> >> s)
> >> 
> >> U-boot runs `ubi part rootfs` as one of the steps in the startup process
> >> to
> >> load the kernel. When doing that u-boot reports that the ubi volume is
> >> resized. This is due to the fact that the rootfs is written with the
> >> u-boot
> >> `nand write` command, writing a ubi formatted image.
> >> 
> >> When booting the unit the kernel panics:
> >>          [    1.523437] ubi0 error: ubi_read_volume_table: the layout
> >>          volume
> >> 
> >> was not found [    1.539062] ubi0 error: ubi_attach_mtd_dev: failed to
> >> attach mtd3, error -22 [    1.546875] UBI error: cannot attach mtd3
> >> 
> >>          [    1.546875] Kernel panic - not syncing: VFS: Unable to mount
> >>          root
> >> 
> >> fs on unknown-block(0,0) [    1.546875] Rebooting in 1 seconds..RomBOOT
> >> 
> >> Then u-boot restarts and tells:
> >>          UBI warning: process_lvol: volume table copy #1 is corrupted
> >>          UBI: create volume table (copy #1)
> >>          UBI: volume table was restored
> >> 
> >> But is able to load the kernel and transfer control to it.
> >> This second run of this kernel does not panic anymore and just starts as
> >> expected! Also, new reboots don't show u-boot issues!
> >> 
> >> Some other combinations:
> >>          u-boot        kernel        result
> >>          2010.09     2.6.35        fine
> >>          2010.09     4.9.28        panic
> >>          2016.03     2.6.35        fine
> >>          2016.03     4.9.28        fine
> >> 
> >> One thing that I noticed is that the newer u-boot resizes to around 40
> >> less
> >> LEBs than the older u-boot does. Related?
> > 
> > Resize? Or missing?
> > This is definitely odd and should not happen.
> 
> Below the output of the old uboot when doing its `ubi part rootfs` on a
> new freshly flashed ubi root file system:
> - resizing the volume
> 
>      Creating 1 MTD partitions on "nand0":
>      0x000000100000-0x000020000000 : "mtd=3"
>      UBI: attaching mtd1 to ubi0
>      UBI: physical eraseblock size:   131072 bytes (128 KiB)
>      UBI: logical eraseblock size:    129024 bytes
>      UBI: smallest flash I/O unit:    2048
>      UBI: sub-page size:              512
>      UBI: VID header offset:          512 (aligned 512)
>      UBI: data offset:                2048
>      UBI: volume 0 ("my-rootfs") re-sized from 933 to 4042 LEBs

Does everything work as expected if you don't set the resize flag in ubinize?
Maybe this is the culprit.

Thanks,
//richard
