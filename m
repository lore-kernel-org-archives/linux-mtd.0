Received: from mail-io0-x232.google.com ([2607:f8b0:4001:c06::232])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cwQRp-0005Ed-75
 for linux-mtd@lists.infradead.org; Fri, 07 Apr 2017 09:44:54 +0000
Received: by mail-io0-x232.google.com with SMTP id b140so46315683iof.1
 for <linux-mtd@lists.infradead.org>; Fri, 07 Apr 2017 02:44:32 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170402204244.14216-7-paul@crapouillou.net>
References: <20170125185207.23902-2-paul@crapouillou.net>
 <20170402204244.14216-1-paul@crapouillou.net>
 <20170402204244.14216-7-paul@crapouillou.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 7 Apr 2017 11:44:31 +0200
Message-ID: <CACRpkdbXe1Xxk93jqLXBdEDwWOnWD+CkZrqvok-PcmWxzBbSZA@mail.gmail.com>
Subject: Re: [PATCH v4 06/14] MIPS: jz4740: DTS: Add nodes for ingenic pinctrl
 and gpio drivers
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

> For a description of the pinctrl devicetree node, please read
> Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.txt
>
> For a description of the gpio devicetree nodes, please read
> Documentation/devicetree/bindings/gpio/ingenic,gpio.txt
>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  arch/mips/boot/dts/ingenic/jz4740.dtsi | 61 ++++++++++++++++++++++++++++++++++
>  1 file changed, 61 insertions(+)
>
>  v2: Changed the devicetree bindings to match the new driver
>  v3: No changes
>  v4: Update the bindings for the v4 version of the drivers
(...)

> +       pinctrl: ingenic-pinctrl@10010000 {
> +               compatible = "ingenic,jz4740-pinctrl";
> +               reg = <0x10010000 0x400>;
> +
> +               gpa: gpio-controller@0 {
> +                       compatible = "ingenic,gpio-bank-a", "ingenic,jz4740-gpio";

As Sergei and Rob notes, the bank compatible properties look
a bit strange. Especially if they are all the same essentially.

I like Sergei's idea to simply use the reg property if what you want
is really a unique ID number. What do you think about this?

Yours,
Linus Walleij
