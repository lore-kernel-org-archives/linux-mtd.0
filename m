Received: from mail-io0-f177.google.com ([209.85.223.177])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cZePM-00008U-Da
 for linux-mtd@lists.infradead.org; Fri, 03 Feb 2017 14:00:17 +0000
Received: by mail-io0-f177.google.com with SMTP id l66so17892348ioi.1
 for <linux-mtd@lists.infradead.org>; Fri, 03 Feb 2017 05:59:51 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <699f0c63e95ecdafe6946fdcdbb97a37@mail.crapouillou.net>
References: <27071da2f01d48141e8ac3dfaa13255d@mail.crapouillou.net>
 <20170125185207.23902-1-paul@crapouillou.net>
 <20170125185207.23902-5-paul@crapouillou.net>
 <CACRpkdbcO+1c7izYpn0sb1mkE1ORFETMq=xtzVi1hKbJz0EWfw@mail.gmail.com>
 <699f0c63e95ecdafe6946fdcdbb97a37@mail.crapouillou.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 3 Feb 2017 14:58:50 +0100
Message-ID: <CACRpkdZNodsRJ33wTJGgrAJpSs=_bXa0yv5ate_7XwjKR0xEnw@mail.gmail.com>
Subject: Re: [PATCH v3 04/14] GPIO: Add gpio-ingenic driver
To: Paul Cercueil <paul@crapouillou.net>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Ralf Baechle <ralf@linux-mips.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Maarten ter Huurne <maarten@treewalker.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Paul Burton <paul.burton@imgtec.com>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Linux MIPS <linux-mips@linux-mips.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 James Hogan <james.hogan@imgtec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jan 31, 2017 at 4:29 PM, Paul Cercueil <paul@crapouillou.net> wrote=
:
> Le 2017-01-31 15:20, Linus Walleij a =C3=A9crit :
>
>>> + of_property_read_u32(dev->of_node, "base", &jzgc->gc.base);
>>
>>
>> Remove this. Dynamic allocation should be fine, if you're using the
>> new userspace ABI like tools/gpio/* or libgpiod and only that and
>> in-kernel
>> consumers, dynamic numbers are just fine.
>
>
> The problem is that the QI_LB60 board code still have a lot of references
> to global GPIO numbers. Just grep for JZ_GPIO_PORT in
> arch/mips/jz4740/board-qi_lb60.c to see what I mean...

OK I understand we might need a compromise here to get the code moving.

But we need to keep it out of the device tree.

I think it's better to put a base table relative to the memory base in
the driver in that case:

unsigned int gpio_global_base;

switch (memory_base_address) {
case 0x41000000:
    gpio_global_base =3D 0x00;
    break;
case 0x42000000:
    gpio_global_base =3D 0x20;

(...)

etc. (Those are not your base addresses but you get the idea).

Include a few comments like:

/*
 * DO NOT EXPAND THIS: FOR BACKWARD GPIO NUMBERSPACE
 * COMPATIBIBILITY ONLY: WORK TO TRANSITION CONSUMERS TO
 * USE THE GPIO DESCRIPTOR API IN <linux/gpio/consumer.h> INSTEAD.
 */

Then I'll be happy :)

Yours,
Linus Walleij
