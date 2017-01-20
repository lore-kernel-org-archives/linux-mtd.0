Received: from mail-it0-f46.google.com ([209.85.214.46])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cUUlc-0006hI-TW
 for linux-mtd@lists.infradead.org; Fri, 20 Jan 2017 08:41:54 +0000
Received: by mail-it0-f46.google.com with SMTP id 203so14757769ith.0
 for <linux-mtd@lists.infradead.org>; Fri, 20 Jan 2017 00:41:31 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <27071da2f01d48141e8ac3dfaa13255d@mail.crapouillou.net>
References: <20170117231421.16310-1-paul@crapouillou.net>
 <20170118071530.GA18989@ulmo.ba.sec>
 <27071da2f01d48141e8ac3dfaa13255d@mail.crapouillou.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 20 Jan 2017 09:40:30 +0100
Message-ID: <CACRpkdaeu9OxaSPeOrkKtKNQGUQh4puCFw8A2h=xhqVdDWgoow@mail.gmail.com>
Subject: Re: [PATCH 00/13] Ingenic JZ4740 / JZ4780 pinctrl driver
To: Paul Cercueil <paul@crapouillou.net>
Cc: Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
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

On Thu, Jan 19, 2017 at 12:19 PM, Paul Cercueil <paul@crapouillou.net> wrote:

> The problem with pinctrl and PWM, is that the pinctrl API works by "states".
> A default state, sleep state, and basically any custom state that the
> devicetree
> provides. This works well until you need to control individually each pin;
> with
> 8 pins, you would need 2^8 states, each one corresponding to a given
> configuration.

I do not really understand, do you really use all 2^8 states in a given
system?

The pin control states are to be used for practical situations, not
for all theoretical situations.

You should define in your device tree the states that your
particular system will use. Not all possible states on all possible
systems.

Yours,
Linus Walleij
