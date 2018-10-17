Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gCjHx-0005Br-8q
 for linux-mtd@lists.infradead.org; Wed, 17 Oct 2018 10:42:55 +0000
Received: by mail-qk1-x731.google.com with SMTP id x8-v6so16130240qka.4
 for <linux-mtd@lists.infradead.org>; Wed, 17 Oct 2018 03:42:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAGkQfmNuROsD29jR_7opiXcfPB6=FuaoxaK-hF5Ezz7r-1pBZA@mail.gmail.com>
In-Reply-To: <CAGkQfmNuROsD29jR_7opiXcfPB6=FuaoxaK-hF5Ezz7r-1pBZA@mail.gmail.com>
From: Romain Izard <romain.izard.pro@gmail.com>
Date: Wed, 17 Oct 2018 12:42:28 +0200
Message-ID: <CAGkQfmMphvck9rraYq+o8zA254q7ETYyniiUV-QBsUR9X+OFKQ@mail.gmail.com>
Subject: Re: Clock configuration for the SAMA5D2 NAND controller
To: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-mtd <linux-mtd@lists.infradead.org>, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

+linux-mtd, linux-clk

Le mer. 10 oct. 2018 =C3=A0 19:05, Romain Izard
<romain.izard.pro@gmail.com> a =C3=A9crit :
>
> Hello,
>
> While evaluating a new flash memory chip for my product based on a SAMA5D=
2
> chip, I tried to update my software to use the latest device tree binding=
s.
>
> Until now, I was using the legacy bindings for the NAND controller, that
> preserved the timings configured by the bootloader in the EBI registers. =
The
> bindings introduced in Linux 4.13 are used together with the NAND driver =
to
> reconfigure the timings of the memory interface to match the speed profil=
e
> declared by some NAND components.
>
> However, when comparing the timings in the registers, there was a large
> difference between what I calculated by hand in the past and the values
> configured by the drivers. The difference was in fact a 2 factor.
>
> For me, the issue is due to the clock configuration declared in the SAMA5=
D2
> device tree: The reference clock used by the nand-controller driver is th=
e
> clock for its parent node, which is directly the Master Clock. And on my
> end, what I understood when writing the clock settings for my bootloader =
was
> that the reference clock was the HSMC clock, which derives from the H32MX
> clock, which runs at half the rate of the Master Clock.
>
> The documentation for the SAMA5D2 is not very precise on this topic, so I
> would like to have some feedback. Is the clock used as a reference for th=
e
> chip select configuration registers the Master Clock itself, or is it the
> peripheral clock for the HSMC module ?
>
>
> Best regards,
> --
> Romain Izard
