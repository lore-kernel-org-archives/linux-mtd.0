Received: from mail-qt0-f180.google.com ([209.85.216.180])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cU8hk-0004Mx-Ks
 for linux-mtd@lists.infradead.org; Thu, 19 Jan 2017 09:08:26 +0000
Received: by mail-qt0-f180.google.com with SMTP id l7so57584814qtd.1
 for <linux-mtd@lists.infradead.org>; Thu, 19 Jan 2017 01:08:04 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20170117231421.16310-14-paul@crapouillou.net>
References: <20170117231421.16310-1-paul@crapouillou.net>
 <20170117231421.16310-14-paul@crapouillou.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 19 Jan 2017 10:07:03 +0100
Message-ID: <CACRpkdYMm0iWxmEGyQyEz4JfWukXNyGXO1rqw1dSiABgHdA1tQ@mail.gmail.com>
Subject: Re: [PATCH 13/13] MIPS: jz4740: Remove custom GPIO code
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

> All the drivers for the various hardware elements of the jz4740 SoC have
> been modified to use the pinctrl framework for their pin configuration
> needs.
> As such, this platform code is now unused and can be deleted.
>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

I feel I might have come across as a bit harsh in the previous review of the
patches leading up to this one. In that case I'm sorry.

I can clearly see that the intent of the series is to remove this hopelessly
idiomatic code from the MIPS hurdle, and move these systems over
to standard frameworks.

In a way, if I look at the kernel as a whole, it would likely look better
after these patches were merged, than before. Even with the
shortcomings I painted out in the previous review comments.

A very complicated piece of messy code is cut from MIPS.

I think this is very valuable work and well worth persuing, so please
go ahead and work with the series, your effort is very much appreciated!

Yours,
Linus Walleij
