Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eOnR8-0002g6-7F
 for linux-mtd@lists.infradead.org; Tue, 12 Dec 2017 16:29:47 +0000
From: Richard Weinberger <richard@nod.at>
To: Jaap de Jong <jaap.dejong@nedap.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: Mounting issue with old uboot and new rootfs
Date: Tue, 12 Dec 2017 17:29:51 +0100
Message-ID: <2249046.8pz4TdecgU@blindfold>
In-Reply-To: <1513004605320.75417@nedap.com>
References: <d868125b-638e-4007-7a90-22937ffca9c6@nedap.com>
 <c08a36e5-10ac-29ae-46d7-d598068dd897@nedap.com>
 <1513004605320.75417@nedap.com>
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

Am Montag, 11. Dezember 2017, 16:03:25 CET schrieb Jaap de Jong:
> Hi All,
> 
> Some time ago I posted a question with a slightly different subject.
> Now that I found out a bit more the previous subject is no longer relevant.
> 
> But I still have issues with mounting in a mixed environment.
> I have this board with an older u-boot (2010.09) in combination with a more
> recent kernel (4.9.28).
> 
> The parameters in uboot:
>         root=ubi0 rw ubi.mtd=3 rootfstype=ubifs
>        
> mtdparts=atmel_nand:128K(bootstrap),256K(u-boot-env),640K(u-boot),-(rootfs)
> 
> U-boot runs `ubi part rootfs` as one of the steps in the startup process to
> load the kernel. When doing that u-boot reports that the ubi volume is
> resized. This is due to the fact that the rootfs is written with the u-boot
> `nand write` command, writing a ubi formatted image.
> 
> When booting the unit the kernel panics:
>         [    1.523437] ubi0 error: ubi_read_volume_table: the layout volume
> was not found [    1.539062] ubi0 error: ubi_attach_mtd_dev: failed to
> attach mtd3, error -22 [    1.546875] UBI error: cannot attach mtd3
>         [    1.546875] Kernel panic - not syncing: VFS: Unable to mount root
> fs on unknown-block(0,0) [    1.546875] Rebooting in 1 seconds..RomBOOT
> Then u-boot restarts and tells:
>         UBI warning: process_lvol: volume table copy #1 is corrupted
>         UBI: create volume table (copy #1)
>         UBI: volume table was restored
> But is able to load the kernel and transfer control to it.
> This second run of this kernel does not panic anymore and just starts as
> expected! Also, new reboots don't show u-boot issues!
> 
> Some other combinations:
>         u-boot        kernel        result
>         2010.09     2.6.35        fine
>         2010.09     4.9.28        panic
>         2016.03     2.6.35        fine
>         2016.03     4.9.28        fine
> 
> One thing that I noticed is that the newer u-boot resizes to around 40 less
> LEBs than the older u-boot does. Related?

Resize? Or missing?
This is definitely odd and should not happen.

Thanks,
//richard
