Received: from mail-gx0-f12.google.com ([209.85.217.12])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KT3NV-0001XL-93
	for linux-mtd@lists.infradead.org; Tue, 12 Aug 2008 23:34:13 +0000
Received: by gxk5 with SMTP id 5so548079gxk.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 12 Aug 2008 16:34:12 -0700 (PDT)
Message-ID: <9c9fda240808121634q7128ed30w40635e34d4a7fcf9@mail.gmail.com>
Date: Wed, 13 Aug 2008 08:34:12 +0900
From: "Kyungmin Park" <kmpark@infradead.org>
Sender: kyungmin78@gmail.com
To: "Stefan Roese" <sr@denx.de>
Subject: Re: [U-Boot] U-Boot and UBI
In-Reply-To: <200808121311.27026.sr@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1218220016.2328.109.camel@localhost.localdomain>
	<200808112202.24363.sr@denx.de>
	<9c9fda240808120325va530f61q13b4836f9b8202b5@mail.gmail.com>
	<200808121311.27026.sr@denx.de>
Cc: u-boot@lists.denx.de, linux-mtd@lists.infradead.org, arnez@de.ibm.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Tue, Aug 12, 2008 at 8:11 PM, Stefan Roese <sr@denx.de> wrote:
> On Tuesday 12 August 2008, Kyungmin Park wrote:
>> > On Monday 11 August 2008, Kyungmin Park wrote:
>> >> Actually the Samsung implemented the UBI support on U-boot already and
>> >> has used it internally. The big difference is the code base. It's
>> >> based on kernel UBI code. Yes it's not fit well to u-boot ecosystem so
>> >> it created the ubi wrapper for u-boot.
>> >
>> > And how does NAND/OneNAND booting with UBI support fit into this? I
>> > assume that you have some size restrictions for the IPL/SPL on your
>> > platforms as well.
>>
>> It's not yet covered. it's TODO
>
> I see.
>

Yes, we should make a u-boot within one block size since flash only
guarantees the first one block as bad block free. e.g., exactly
(128KiB - 2KiB) size if OneNAND case.
For this, we need to code or size optimization.
If this is solved, we can use flash as bad block free device with UBI.

Also there are some issues related with ubi partitioning.

It's just rough ideas. For make a system as reasonable it creates two
UBI devices, one for boot-loader and another for kernel. If we make
only one UBI device, we should read whole flash blocks to read kernel.
but it's not reasonable.

1. UBI image for bootloader.
    boot params (rw), kernel(ro), [Optional] initrd (ro)

Even though it has r/w area, we regards it as static volume for
performance since boot params almost read only. I think If UBI has
only static volumes we can optimize it more. we don't need to mirror
layout volume. no wear leveling and so on. For this, of course, we
need special handling for boot params.

2. UBI image for kernel.
    rootfs(ro/rw), datafs(rw), and others(??)

Feel free, you make it for your purposes.

Thank you,
Kyungmin Park
