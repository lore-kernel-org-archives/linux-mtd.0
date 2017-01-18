Received: from mail-qt0-x235.google.com ([2607:f8b0:400d:c0d::235])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cU00B-0007NI-Ps
 for linux-mtd@lists.infradead.org; Wed, 18 Jan 2017 23:50:53 +0000
Received: by mail-qt0-x235.google.com with SMTP id l7so38798067qtd.1
 for <linux-mtd@lists.infradead.org>; Wed, 18 Jan 2017 15:50:30 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20170117231421.16310-6-paul@crapouillou.net>
References: <20170117231421.16310-1-paul@crapouillou.net>
 <20170117231421.16310-6-paul@crapouillou.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 19 Jan 2017 00:50:29 +0100
Message-ID: <CACRpkdZ-2-mOiEwiRUoMU+X4RG1jik7edPK0nsu_kYy5Pi7N1g@mail.gmail.com>
Subject: Re: [PATCH 05/13] MIPS: jz4740: DTS: Add node for the jz4740-pinctrl
 driver
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
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 18, 2017 at 12:14 AM, Paul Cercueil <paul@crapouillou.net> wrote:

> For a description of the devicetree node, please read
> Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.txt
>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

(...)

> +       pinctrl: ingenic-pinctrl@10010000 {
> +               compatible = "ingenic,jz4740-pinctrl";
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               ranges;
> +
> +               gpio-chips {
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
> +                       ranges;
> +
> +                       gpa: gpa {
> +                               reg = <0x10010000 0x100>;
> +
> +                               gpio-controller;
> +                               #gpio-cells = <2>;
> +
> +                               interrupt-controller;
> +                               #interrupt-cells = <2>;
> +
> +                               interrupt-parent = <&intc>;
> +                               interrupts = <28>;
> +
> +                               ingenic,pull-ups = <0xffffffff>;
> +                       };
> +
> +                       gpb: gpb {
> +                               reg = <0x10010100 0x100>;
> +
> +                               gpio-controller;
> +                               #gpio-cells = <2>;
> +
> +                               interrupt-controller;
> +                               #interrupt-cells = <2>;
> +
> +                               interrupt-parent = <&intc>;
> +                               interrupts = <27>;
> +
> +                               ingenic,pull-ups = <0xffffffff>;
> +                       };
> +
> +                       gpc: gpc {
> +                               reg = <0x10010200 0x100>;
> +
> +                               gpio-controller;
> +                               #gpio-cells = <2>;
> +
> +                               interrupt-controller;
> +                               #interrupt-cells = <2>;
> +
> +                               interrupt-parent = <&intc>;
> +                               interrupts = <26>;
> +
> +                               ingenic,pull-ups = <0xffffffff>;
> +                       };
> +
> +                       gpd: gpd {
> +                               reg = <0x10010300 0x100>;
> +
> +                               gpio-controller;
> +                               #gpio-cells = <2>;
> +
> +                               interrupt-controller;
> +                               #interrupt-cells = <2>;
> +
> +                               interrupt-parent = <&intc>;
> +                               interrupts = <25>;
> +
> +                               ingenic,pull-ups = <0xdfffffff>;
> +                       };
> +               };

Just pull all these down two levels and make them one device
each instead of having them inside the pin controller node
like this.

Then make a pin controller node separately, it can reference the
pin controller by phandles if necessary, and use the standard
gpio-ranges property to cross make GPIO and pin control.

It seems you driver is similar to for example the
drivers/pinctrl/nomadik/* pin controller.

Look in arch/arm/boot/dts/ste-dbx500.dtsi for examples,
NB: I'm not fully using standard bindings in it, because they
were not invented at the time.

Yours,
Linus Walleij
