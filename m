Received: from mail-it0-x234.google.com ([2607:f8b0:4001:c0b::234])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cYZIK-0007o1-HX
 for linux-mtd@lists.infradead.org; Tue, 31 Jan 2017 14:20:30 +0000
Received: by mail-it0-x234.google.com with SMTP id k200so28686205itb.1
 for <linux-mtd@lists.infradead.org>; Tue, 31 Jan 2017 06:20:07 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20170125185207.23902-5-paul@crapouillou.net>
References: <27071da2f01d48141e8ac3dfaa13255d@mail.crapouillou.net>
 <20170125185207.23902-1-paul@crapouillou.net>
 <20170125185207.23902-5-paul@crapouillou.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 31 Jan 2017 15:20:04 +0100
Message-ID: <CACRpkdbcO+1c7izYpn0sb1mkE1ORFETMq=xtzVi1hKbJz0EWfw@mail.gmail.com>
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
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Forgot to mention this:

On Wed, Jan 25, 2017 at 7:51 PM, Paul Cercueil <paul@crapouillou.net> wrote:
> This driver handles the GPIOs of all the Ingenic JZ47xx SoCs
> currently supported by the upsteam Linux kernel.
>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
(...)
> +       jzgc->gc.base = -1;

Nice

> +       of_property_read_u32(dev->of_node, "base", &jzgc->gc.base);

Remove this. Dynamic allocation should be fine, if you're using the
new userspace ABI like tools/gpio/* or libgpiod and only that and in-kernel
consumers, dynamic numbers are just fine.

If you have old sysfs userspace that you need to support using the
global GPIO numberspace, please look into ways to phase that out.

Yours,
Linus Walleij
