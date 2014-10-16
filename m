Received: from mail-vc0-x232.google.com ([2607:f8b0:400c:c03::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xeh5n-0005RX-D8
 for linux-mtd@lists.infradead.org; Thu, 16 Oct 2014 09:11:32 +0000
Received: by mail-vc0-f178.google.com with SMTP id hq12so2308599vcb.23
 for <linux-mtd@lists.infradead.org>; Thu, 16 Oct 2014 02:10:58 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CACna6rxapt_J8qjMb37UnQ5iFE3DJ06U8nok_Fw=RO5UHs6Vsg@mail.gmail.com>
References: <CACna6rxapt_J8qjMb37UnQ5iFE3DJ06U8nok_Fw=RO5UHs6Vsg@mail.gmail.com>
Date: Thu, 16 Oct 2014 11:10:58 +0200
Message-ID: <CAFLxGvzCAaixC6ahfqRfr+7SRrrrrQ8ubA3WrfqzCPwfLP=tOg@mail.gmail.com>
Subject: Re: UBI: ignore/overwrite old data/PEBs after flashing
From: Richard Weinberger <richard.weinberger@gmail.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Felix Fietkau <nbd@openwrt.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Oct 16, 2014 at 7:34 AM, Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>=
 wrote:
> Hi,
>
> I need some help with flashing UBI images.
>
> I work with Broadcom ARM SoCs that use a CFE bootloader. In most cases
> it doesn't provide a way to clear flash content before flashing the
> firmware. It means that if I have 120 MiB of space for the firmware
> and I flash 20 MiB firmware, the rest of flash (100 MiB) won't be
> cleared. My partitioner driver will create 2 MiB partition for kernel
> and 118 MiB partition for UBI.
>
> So the result is that UBI partition contains 18 MiB of prebuilt
> (ubinize-d) image and 100 MiB of rubbish. This will lead to problems
> like:
> UBI warning: scan_peb: valid VID header but corrupted EC header at PEB 17
>
> UBI will find some old PEBs, try to use them, this may even lead to
> situation where the data from previous install will be still
> available!
>
>
> Of course, I'm aware I should not upgrade my images this way all the
> time. Normally I would simply use
> $ ubiformat /dev/mtd0 -f ubi.img
> , but I'm trying to handle some corner cases. Sometimes the firmware
> may be broken and user may not be able to boot. In such case I need to
> be able to re-flash the firmware using bootloader (and sacrifice the
> wearing info).
>
>
> Is there some way to tell UBI to ignore & overwrite all flash data
> (including PEBs) that are placed after the flashed (ubinize-d) image?
> Could we add some magic PEB that will tell UBI that all the flash
> content after that single PEB is rubbish?

I'm confused. Do you always use the same UBI sequence number?
If you flash only 20MiB why do you create a much larger MTD partition?

> --
> Rafa=C5=82
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/



--=20
Thanks,
//richard
