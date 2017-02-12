Received: from mail-it0-x22f.google.com ([2607:f8b0:4001:c0b::22f])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cd15G-0001fI-8P
 for linux-mtd@lists.infradead.org; Sun, 12 Feb 2017 20:49:25 +0000
Received: by mail-it0-x22f.google.com with SMTP id 203so167592268ith.0
 for <linux-mtd@lists.infradead.org>; Sun, 12 Feb 2017 12:49:01 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <b032ad924ae905ce4fd11535d08c29a8@mail.crapouillou.net>
References: <27071da2f01d48141e8ac3dfaa13255d@mail.crapouillou.net>
 <20170125185207.23902-1-paul@crapouillou.net>
 <20170125185207.23902-5-paul@crapouillou.net>
 <CACRpkdaqQ2==B1_o-Ru81Nbu_kUF+Kxn=XFYms-1e=nAtHiJ4A@mail.gmail.com>
 <b032ad924ae905ce4fd11535d08c29a8@mail.crapouillou.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 12 Feb 2017 21:48:59 +0100
Message-ID: <CACRpkdbusY=gsZ=a9yGfRMi5t=+539OwKt0i5FNczxNyEVPHwg@mail.gmail.com>
Subject: Re: [PATCH v3 04/14] GPIO: Add gpio-ingenic driver
To: Paul Cercueil <paul@crapouillou.net>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
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

On Thu, Feb 9, 2017 at 6:14 PM, Paul Cercueil <paul@crapouillou.net> wrote:

>> If you're not just replacing these with GPIO_GENERIC, please also
>> include a .get_direction() callback.
>
> My .direction_input() and .direction_output() callbacks just call into
> the pinctrl driver, using pinctrl_gpio_direction_[in,out]put().
> I didn't find a way to get the direction info from the pinctrl driver,
> is that something that the core should provide?

Hm OK you have a clear point there, there is no such callback.

OK I do not require you to fix that at this time.

I am hesitant about providing ever more callbacks from GPIO
to pin control, I might need some help for consolidation here.

With Mika's patches we have a .set_config() call to
pinctrl_gpio_set_config() so essentially
we *could* actually refactor all pin control drivers providing
a GPIO back-end to use:

pinctrl_gpio_set_config(gpio, PIN_CONF_PACKED(PIN_CONFIG_INPUT_ENABLE, 0));
pinctrl_gpio_set_config(gpio, PIN_CONF_PACKED(PIN_CONFIG_OUTPUT, val));

And replace the calls to pinctrl_gpio_direction_input()
and pinctrl_gpio_direction_output() with this throughout.

It makes things a bit simpler. If we need to figure things
out the reverse direction then pinctrl_gpio_get_config()
should be implemented and used as back-end for
figuring out direction.

Yours,
Linus Walleij
