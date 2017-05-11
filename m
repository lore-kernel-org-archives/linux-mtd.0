Received: from mail-io0-x22d.google.com ([2607:f8b0:4001:c06::22d])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d8ly9-0001Nk-57
 for linux-mtd@lists.infradead.org; Thu, 11 May 2017 11:09:18 +0000
Received: by mail-io0-x22d.google.com with SMTP id f102so18871396ioi.2
 for <linux-mtd@lists.infradead.org>; Thu, 11 May 2017 04:08:56 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170428200824.10906-6-paul@crapouillou.net>
References: <20170402204244.14216-2-paul@crapouillou.net>
 <20170428200824.10906-1-paul@crapouillou.net>
 <20170428200824.10906-6-paul@crapouillou.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 11 May 2017 13:08:55 +0200
Message-ID: <CACRpkdaYRmB=i-=k4vfFYL6wHVrpNo1w11xnLGbu+6YPPmT8vA@mail.gmail.com>
Subject: Re: [PATCH v5 05/14] MIPS: ingenic: Enable pinctrl for all ingenic
 SoCs
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

On Fri, Apr 28, 2017 at 10:08 PM, Paul Cercueil <paul@crapouillou.net> wrote:

> There is a pinctrl driver for each of the Ingenic SoCs supported by the
> upstream Linux kernel. In order to switch away from the old GPIO
> platform code, we now enable the pinctrl drivers by default for the
> Ingenic SoCs.
>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  arch/mips/Kconfig | 1 +

So please tell me your desired merge strategy for these bits. I can
provide an immutable branch for pinctrl if you want to pull the deps in
or we can just merge this orthogonally in the MIPS tree and let things
smoothen together in the merge window.

This goes for everything outside of pinctrl/gpio.

If I should merge patches for other subsystems I need ACKs from
the maintainers of MIPS etc.

Yours,
Linus Walleij
