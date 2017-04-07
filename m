Received: from mail-it0-x235.google.com ([2607:f8b0:4001:c0b::235])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cwQP8-0004A6-Dx
 for linux-mtd@lists.infradead.org; Fri, 07 Apr 2017 09:42:07 +0000
Received: by mail-it0-x235.google.com with SMTP id y18so40064355itc.1
 for <linux-mtd@lists.infradead.org>; Fri, 07 Apr 2017 02:41:45 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170402204244.14216-4-paul@crapouillou.net>
References: <20170125185207.23902-2-paul@crapouillou.net>
 <20170402204244.14216-1-paul@crapouillou.net>
 <20170402204244.14216-4-paul@crapouillou.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 7 Apr 2017 11:41:44 +0200
Message-ID: <CACRpkdbeudhXDE8KEgB_kZSAUUwS4Sd3=+GyR0YZ2-PQnEa9zw@mail.gmail.com>
Subject: Re: [PATCH v4 03/14] pinctrl-ingenic: add a pinctrl driver for the
 Ingenic jz47xx SoCs
To: Paul Cercueil <paul@crapouillou.net>, Lee Jones <lee.jones@linaro.org>
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

> This driver handles pin configuration and pin muxing for the
> JZ4740 and JZ4780 SoCs from Ingenic.
>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
(...)
> +       select MFD_CORE
(...)
> +#include <linux/mfd/core.h>

That's unorthodox. Still quite pretty!
I would nee Lee Jones to say something about this, as it is
essentially hijacking MFD into the pinctrl subsystem.

> +static struct mfd_cell ingenic_pinctrl_mfd_cells[] = {
> +       {
> +               .id = 0,
> +               .name = "GPIOA",
> +               .of_compatible = "ingenic,gpio-bank-a",
> +       },
> +       {
> +               .id = 1,
> +               .name = "GPIOB",
> +               .of_compatible = "ingenic,gpio-bank-b",
> +       },
> +       {
> +               .id = 2,
> +               .name = "GPIOC",
> +               .of_compatible = "ingenic,gpio-bank-c",
> +       },
> +       {
> +               .id = 3,
> +               .name = "GPIOD",
> +               .of_compatible = "ingenic,gpio-bank-d",
> +       },
> +       {
> +               .id = 4,
> +               .name = "GPIOE",
> +               .of_compatible = "ingenic,gpio-bank-e",
> +       },
> +       {
> +               .id = 5,
> +               .name = "GPIOF",
> +               .of_compatible = "ingenic,gpio-bank-f",
> +       },
> +};
(...)
> +       err = devm_mfd_add_devices(dev, 0, ingenic_pinctrl_mfd_cells,
> +                       ARRAY_SIZE(ingenic_pinctrl_mfd_cells), NULL, 0, NULL);
> +       if (err) {
> +               dev_err(dev, "Failed to add MFD devices\n");
> +               return err;
> +       }

I guess the alternative would be to reimplement the MFD structure.

Did you check the approach to use "simple-mfd" and just let the subnodes
spawn as devices that way? I guess you did and this adds something
necessary.

Yours,
Linus Walleij
