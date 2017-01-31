Received: from mail-it0-x230.google.com ([2607:f8b0:4001:c0b::230])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cYZEx-0005xx-CU
 for linux-mtd@lists.infradead.org; Tue, 31 Jan 2017 14:17:00 +0000
Received: by mail-it0-x230.google.com with SMTP id 203so217419677ith.0
 for <linux-mtd@lists.infradead.org>; Tue, 31 Jan 2017 06:16:38 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20170125185207.23902-7-paul@crapouillou.net>
References: <27071da2f01d48141e8ac3dfaa13255d@mail.crapouillou.net>
 <20170125185207.23902-1-paul@crapouillou.net>
 <20170125185207.23902-7-paul@crapouillou.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 31 Jan 2017 15:16:37 +0100
Message-ID: <CACRpkdbzzF7jSHZZD2dCixeVZDLVa3R7-1avXwyKc1-RQDK9jw@mail.gmail.com>
Subject: Re: [PATCH v3 06/14] MIPS: jz4740: DTS: Add nodes for ingenic pinctrl
 and gpio drivers
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

On Wed, Jan 25, 2017 at 7:51 PM, Paul Cercueil <paul@crapouillou.net> wrote:

> For a description of the pinctrl devicetree node, please read
> Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.txt
>
> For a description of the gpio devicetree nodes, please read
> Documentation/devicetree/bindings/gpio/ingenic,gpio.txt
>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  arch/mips/boot/dts/ingenic/jz4740.dtsi | 194 +++++++++++++++++++++++++++++++++
>  1 file changed, 194 insertions(+)
>
> v2: Changed the devicetree bindings to match the new driver
> v3: No changes

This looks good to me, except the use of ingenic,pins instead
of just pins and the GPIO base property
which needs to be removed from the DT bindings and
the driver alike.

But now we're discussing where to put these GPIO controllers
in the device tree in another thread. Maybe as subnodes of the
pin controller...

Yours,
Linus Walleij
