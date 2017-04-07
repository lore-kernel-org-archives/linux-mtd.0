Received: from mail-it0-x232.google.com ([2607:f8b0:4001:c0b::232])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cwQIH-00088f-8s
 for linux-mtd@lists.infradead.org; Fri, 07 Apr 2017 09:35:03 +0000
Received: by mail-it0-x232.google.com with SMTP id y18so3254342itc.1
 for <linux-mtd@lists.infradead.org>; Fri, 07 Apr 2017 02:34:40 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170402204244.14216-5-paul@crapouillou.net>
References: <20170125185207.23902-2-paul@crapouillou.net>
 <20170402204244.14216-1-paul@crapouillou.net>
 <20170402204244.14216-5-paul@crapouillou.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 7 Apr 2017 11:34:38 +0200
Message-ID: <CACRpkdaH1J8J6y9cBEfspiAUYTB+NXcoOK1j4Uzud943TgVsow@mail.gmail.com>
Subject: Re: [PATCH v4 04/14] GPIO: Add gpio-ingenic driver
To: Paul Cercueil <paul@crapouillou.net>
Cc: Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Maarten ter Huurne <maarten@treewalker.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Paul Burton <paul.burton@imgtec.com>,
 James Hogan <james.hogan@imgtec.com>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Linux MIPS <linux-mips@linux-mips.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Apr 2, 2017 at 10:42 PM, Paul Cercueil <paul@crapouillou.net> wrote:

> This driver handles the GPIOs of all the Ingenic JZ47xx SoCs
> currently supported by the upsteam Linux kernel.
>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

I guess you saw the Kconfig complaint from the build robot, please fix that
so we get silent builds.

>  v2: Consider it's a new patch. Completely rewritten from v1.
>  v3: Add missing include <linux/pinctrl/consumer.h> and drop semicolon after }
>  v4: Completely rewritten from v3.

I really like v4 :)

> +static inline bool gpio_get_value(struct ingenic_gpio_chip *jzgc, u8 offset)

Actually the return value should be an int.

I know, it is a historical artifact, if we change it we need to change
it everywhere.

> +       /* DO NOT EXPAND THIS: FOR BACKWARD GPIO NUMBERSPACE COMPATIBIBILITY
> +        * ONLY: WORK TO TRANSITION CONSUMERS TO USE THE GPIO DESCRIPTOR API IN
> +        * <linux/gpio/consumer.h> INSTEAD.
> +        */
> +       jzgc->gc.base = cell->id * 32;

OK then :)

This is merge material.

Yours,
Linus Walleij
