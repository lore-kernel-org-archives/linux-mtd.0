Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eKRZo-0005wp-Hk
 for linux-mtd@lists.infradead.org; Thu, 30 Nov 2017 16:20:45 +0000
From: Richard Weinberger <richard@nod.at>
To: Jaap de Jong <jaap.dejong@nedap.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: Mounting issue with old rootfs and new kernel
Date: Thu, 30 Nov 2017 17:20:44 +0100
Message-ID: <6030766.nKoDj6T6s8@blindfold>
In-Reply-To: <e144d66c-c754-ad6d-bd0c-ef5384ae7a78@nedap.com>
References: <d868125b-638e-4007-7a90-22937ffca9c6@nedap.com>
 <CAFLxGvwW_1ydC9XHFG+-UvY_L=h9TLQ5Eh0jgcGBPFyU9qf0-w@mail.gmail.com>
 <e144d66c-c754-ad6d-bd0c-ef5384ae7a78@nedap.com>
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

Am Donnerstag, 30. November 2017, 16:42:33 CET schrieb Jaap de Jong:
> Hi Richard,
> 
> On 30-11-17 16:28, Richard Weinberger wrote:
> > Jaap,
> > 
> > On Thu, Nov 30, 2017 at 4:22 PM, Jaap de Jong <jaap.dejong@nedap.com> 
wrote:
> >> Hi
> >> 
> >> I'm hoping for some pointers.
> >> 
> >> I have this a created with openembedded classic.
> >> 
> >> It works just fine when running with an old kernel (2.6.35)
> >> 
> >> Now with the same rootfs and a newer kernel (4.9.28) it damages the old
> >> rootfs in such a way that it becomes unusable.
> >> 
> >> This is the error it shows:
> >>                          [    1.523437] ubi0 error:
> >>                          ubi_read_volume_table: the layout volume was
> >>                          not found [    1.531250] ubi0 error:
> >>                          ubi_attach_mtd_dev: failed to attach mtd3,
> >>                          error -22> 
> > Are these really the only erros/warnings from UBI?
> 
> Yes. Also ran it without 'quiet' as kernel parameter and that also does
> not show extra errors.

Hm, but U-Boot comes first? Maybe it damaged the UBI image already.

> If I boot u-boot and try to mount it there, some other errors are show
> although basically the same
> 
>     U-Boot> ubi part rootfs
>     UBI: mtd1 is detached from ubi0
>     Creating 1 MTD partitions on "nand0":
>     0x000000100000-0x000020000000 : "mtd=3"
>     UBI: attaching mtd1 to ubi0
>     UBI: physical eraseblock size:   131072 bytes (128 KiB)
>     UBI: logical eraseblock size:    129024 bytes
>     UBI: smallest flash I/O unit:    2048
>     UBI: sub-page size:              512
>     UBI: VID header offset:          512 (aligned 512)
>     UBI: data offset:                2048
>     UBI: attached mtd1 to ubi0
>     UBI: MTD device name:            "mtd=3"
>     UBI: MTD device size:            511 MiB
>     UBI: number of good PEBs:        4088
>     UBI: number of bad PEBs:         0
>     UBI: max. allowed volumes:       128
>     UBI: wear-leveling threshold:    4096
>     UBI: number of internal volumes: 1
>     UBI: number of user volumes:     1
>     UBI: available PEBs:             40
>     UBI: total number of reserved PEBs: 4048
>     UBI: number of PEBs reserved for bad PEB handling: 40
>     UBI: max/mean erase counter: 2/0
> 
>     U-Boot> ubifsmount rootfs
>     UBIFS error (pid 0): ubifs_read_node: bad node type (255 but expected 6)
> UBIFS error (pid 0): ubifs_read_node: bad node at LEB 0:0
>     Error reading superblock on volume 'ubi:rootfs'!
> 
> >>                          [    1.539062] UBI error: cannot attach mtd3
> >>                          [    1.546875] Kernel panic - not syncing: VFS:
> >>                          Unable to mount root fs on unknown-block(0,0) [
> >>                             1.546875] Rebooting in 1 seconds..RomBOOT
> >> 
> >> As far as I can see the kernel configuration seems to be ok.
> >> 
> >> Any ideas?
> > 
> > If the MTD layout had changed I'd expect more errors from UBI.
> > Is this NAND?
> 
> Yes nandflash
> 
> > Did you compare the MTD partition layout and number of bad blocks?
> 
> Do you mean before and after?

Yes. Something must be different.
Page size? Sub pages? Number or erase blocks, etc...

Thanks,
//richard
