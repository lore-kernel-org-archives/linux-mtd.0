Received: from mail-vc0-x233.google.com ([2607:f8b0:400c:c03::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XZQsU-00028v-J2
 for linux-mtd@lists.infradead.org; Wed, 01 Oct 2014 20:52:03 +0000
Received: by mail-vc0-f179.google.com with SMTP id im17so885240vcb.24
 for <linux-mtd@lists.infradead.org>; Wed, 01 Oct 2014 13:51:39 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <542C66EB.5000105@gmail.com>
References: <542C66EB.5000105@gmail.com>
Date: Wed, 1 Oct 2014 22:51:39 +0200
Message-ID: <CAFLxGvz0cKDdUNjQHyNcW3VbtQGW5FkamSJv+vx786TRBqDCkA@mail.gmail.com>
Subject: Re: UBI ECC errors on kernel 3.16.2
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Angelo Dureghello <angelo70@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 1, 2014 at 10:41 PM, Angelo Dureghello <angelo70@gmail.com> wrote:
> Dear all,
>
> i am working on an embedded system: arm TI AM1808 cpu with a nand flash
> mt29f1g08abb.
>
> The flash is 128MB, no-subages, pages as 2048bytes, OOB 64 bytes
>
> Type:                           nand
> Eraseblock size:                131072 bytes, 128.0 KiB
> Amount of eraseblocks:          480 (62914560 bytes, 60.0 MiB)
> Minimum input/output unit size: 2048 bytes
> Sub-page size:                  512 bytes
> OOB size:                       64 bytes
> Character device major/minor:   90:12
> Bad blocks are allowed:         true
> Device is writable:             true
>
> I had UBI/UBIFS working fine with kernel 3.5.1 (flashing it through u.boot).
> As ecclayout, from my board.c, i was setting up a custom one:
>
> /* NAND ECC modified to reflect the DaVinci RBL layout (i.e. 512B rather
> than 2kB)
>  * patch from http://processors.wiki.ti.com/index.php/DM365_Nand_ECC_layout
>  */
> static struct nand_ecclayout ipam390_nand_ecclayout = {
>     .eccbytes    = 40,
>     .eccpos        = {6, 7, 8, 9, 10, 11, 12, 13, 14, 15,
>               22, 23, 24, 25, 26, 27, 28, 29, 30, 31,
>               38, 39, 40, 41, 42, 43, 44, 45, 46, 47,
>               54, 55, 56, 57, 58, 59, 60, 61, 62, 63,
>     },
>     .oobfree    = {{2, 4}, {16, 6}, {32, 6}, {48, 6} },
> };
>
>
> Now i am moving to kernel 3.16.2.
>
> With quite same config, the same UBI image now produces several errors
>
> platform barix-ipam390.0: Driver barix-ipam390 requests probe deferral
> UBI: scanning is finished
> UBI: volume 0 ("rootfs") re-sized from 205 to 456 LEBs
> UBI: attached mtd6 (name "rootfs", size 60 MiB) to ubi0
> UBI: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
> UBI: min./max. I/O unit sizes: 2048/2048, sub-page size 512
> UBI: VID header offset: 2048 (aligned 2048), data offset: 4096
> UBI: good PEBs: 480, bad PEBs: 0, corrupted PEBs: 0
> UBI: user volume: 1, internal volumes: 1, max. volumes count: 128
> UBI: max/mean erase counter: 1/0, WL threshold: 4096, image sequence number:
> 1641262122
> UBI: available PEBs: 0, total reserved PEBs: 480, PEBs reserved for bad PEB
> handling: 20
> UBI: background thread "ubi_bgt0d" started, PID 1025
> davinci_emac 1e20000.ethernet: failed to get EMAC clock
> davinci_emac: probe of 1e20000.ethernet failed with error -16
> davinci_emac davinci_emac.1: Runtime PM disabled, clock forced on.
> davinci_emac davinci_emac.1: Runtime PM disabled, clock forced on.
> davinci_emac davinci_emac.1: Runtime PM disabled, clock forced on.
> barix-ipam390 barix-ipam390.0: ASoC: platform davinci-pcm-audio not
> registered
> gpio-keys gpio-keys.0: Unable to get irq number for GPIO 126, error -6
> platform barix-ipam390.0: Driver barix-ipam390 requests probe deferral
> omap_rtc da830-rtc: setting system clock to 2014-10-01 18:55:35 UTC
> (1412189735)
> ALSA device list:
>   No soundcards found.
> UBI warning: ubi_io_read: error -74 (ECC error) while reading 4096 bytes
> from PEB 2:4096, read only 4096 bytes, retry
> UBI warning: ubi_io_read: error -74 (ECC error) while reading 4096 bytes
> from PEB 2:4096, read only 4096 bytes, retry
> UBI warning: ubi_io_read: error -74 (ECC error) while reading 4096 bytes
> from PEB 2:4096, read only 4096 bytes, retry
> UBI error: ubi_io_read: error -74 (ECC error) while reading 4096 bytes from
> PEB 2:4096, read 4096 bytes
> UBIFS: background thread "ubifs_bgt0_0" started, PID 1032
>
>
> I tred also to boot a jffs2 file system and had similar ECC errors.
>
> I suspect something in the mtd/ecc part is changed in a way that my custom
> ecc is no more valid.
>
> Every help is very appreciated.

Do mtd and ubi tests pass?

-- 
Thanks,
//richard
