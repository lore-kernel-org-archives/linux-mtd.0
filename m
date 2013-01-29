Received: from ia-in-x022f.1e100.net ([2607:f8b0:4001:c02::22f]
 helo=mail-ia0-x22f.google.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1U0BCz-0004sP-LZ
 for linux-mtd@lists.infradead.org; Tue, 29 Jan 2013 13:26:42 +0000
Received: by mail-ia0-f175.google.com with SMTP id r4so529006iaj.6
 for <linux-mtd@lists.infradead.org>; Tue, 29 Jan 2013 05:26:40 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CACna6ry0xPuzEAcDRB=hrTT71A5+WoJTZMGwaUS3RjSE4CcgLw@mail.gmail.com>
References: <CACna6ry0xPuzEAcDRB=hrTT71A5+WoJTZMGwaUS3RjSE4CcgLw@mail.gmail.com>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Tue, 29 Jan 2013 14:26:19 +0100
Message-ID: <CAOiHx=k4h-ZHijqbuN+95GjVxs-FLGZsnh3vc_x2W6bO-n1P_w@mail.gmail.com>
Subject: Re: Handling serial flashes on Broadcom SOCs
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Paul Fertser <fercerpav@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>,
 linux-wireless@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 28 January 2013 12:37, Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wrote:
> (snip)
> I don't think extending m25p80.c to support SSB/BCMA is acceptable, so
> we've two options now:
>
> 1) Just implement serial flashes support in separated driver operating
> on ssb/bcma buses.
> Easy to do, but requires some code duplication with m25p80.c
>
> 2) Fake SPI master in ssb & bcma and use m25p80.c
> I think it's much more complicated, as there probably isn't any real
> SPI on Broadcom devices. We have to fake/emulate it's operations. From
> early overview, some words-tips are: struct spi_master,
> spi_alloc_master, spi_register_master.
> I also don't know well m25p80.c is going to support chipsets on
> Broadcom devices. With some luck, we will have to extend it's database
> only. But it may happen we will have to add some/many modifications in
> m25p80.c as well.
> Another problem is early flash access. To boot properly we need to
> access serial flash very early to read NVRAM from it (plain text
> partition with board settings). This may be required even before we
> get "alloc" available, which may require additional extra hacks in
> m25p80.c.

Going from my experience in implementing/rewriting an SPI controller
driver, and having played around with the Broadcom sflash driver, I'd
definitely vote for 1). The expectations to an SPI controller are
quite broad, and the possibilities of the serial flash controller are
quite limited, so making it work with m25p80 will be likely add more
code than could be saved by emulating an SPI controller.

What I think might be doable is to export the SPI flashes list of
m25p80 list and letting both drivers use it. Not sure how much there
is to gain, though.


Jonas
