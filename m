Received: from mail-qt0-f173.google.com ([209.85.216.173])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bxDeL-0007dF-Jm
 for linux-mtd@lists.infradead.org; Thu, 20 Oct 2016 13:44:51 +0000
Received: by mail-qt0-f173.google.com with SMTP id s49so54050103qta.0
 for <linux-mtd@lists.infradead.org>; Thu, 20 Oct 2016 06:44:29 -0700 (PDT)
Subject: Re: [PATCH 00/10] Introduce Juniper PTXPMB CPLD driver
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=utf-8
From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
In-Reply-To: <CACRpkdYkgondu3NuReFg=FZ29Xzi0zncpku0+++_OSsPnUs+Ew@mail.gmail.com>
Date: Thu, 20 Oct 2016 16:43:41 +0300
Cc: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Alexandre Courbot <gnurou@gmail.com>, Mark Rutland <mark.rutland@arm.com>,
 Frank Rowand <frowand.list@gmail.com>, Wolfram Sang <wsa@the-dreams.de>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Wim Van Sebroeck <wim@iguana.be>, Guenter Roeck <linux@roeck-us.net>,
 Peter Rosin <peda@axentia.se>, Debjit Ghosh <dghosh@juniper.net>,
 Georgi Vlaev <gvlaev@juniper.net>, Guenter Roeck <groeck@juniper.net>,
 JawaharBalaji Thirumalaisamy <jawaharb@juniper.net>,
 Rajat Jain <rajatjain@juniper.net>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 linux-watchdog@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <E368DA67-BAD4-462C-9323-548E55A2E7D2@konsulko.com>
References: <1475853451-22121-1-git-send-email-pantelis.antoniou@konsulko.com>
 <CACRpkdYkgondu3NuReFg=FZ29Xzi0zncpku0+++_OSsPnUs+Ew@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Linus,

> On Oct 20, 2016, at 16:42 , Linus Walleij <linus.walleij@linaro.org> =
wrote:
>=20
> On Fri, Oct 7, 2016 at 5:17 PM, Pantelis Antoniou
> <pantelis.antoniou@konsulko.com> wrote:
>=20
>> Add Juniper's PTXPMB FPGA CPLD driver. Those FPGAs
>> are present in Juniper's PTX series of routers.
>>=20
>> The MFD driver provices watchdog/i2c/gpio/mtd devices.
>=20
> Since it's quite a bunch of patches to quite a bunch of controllers
> I think it's best if you get the MFD parts ready and merged through
> Lee first for v4.10, then we can add the subdrivers on top, maybe
> in v4.11, or on top of an immutable branch from Lee once he is
> happy with the core if the MFD core is finished quickly.
>=20

Will do.

> I will review all the GPIO stuff though so you can revise these
> patches too :)
>=20

Goodie :)

> Yours,
> Linus Walleij

Regards

=E2=80=94 Pantelis
