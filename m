Received: from mail-it0-x236.google.com ([2607:f8b0:4001:c0b::236])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d8lqz-0007KB-42
 for linux-mtd@lists.infradead.org; Thu, 11 May 2017 11:01:54 +0000
Received: by mail-it0-x236.google.com with SMTP id e65so17416370ita.1
 for <linux-mtd@lists.infradead.org>; Thu, 11 May 2017 04:01:32 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <7941dbfbaeaf5c23bb177e66165060d3@crapouillou.net>
References: <20170402204244.14216-2-paul@crapouillou.net>
 <20170428200824.10906-1-paul@crapouillou.net>
 <20170428200824.10906-4-paul@crapouillou.net>
 <7941dbfbaeaf5c23bb177e66165060d3@crapouillou.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 11 May 2017 13:01:30 +0200
Message-ID: <CACRpkdYR8Y77VXrNz=NwczgxZvitkO72bAYcDuhneZbVVsT6=g@mail.gmail.com>
Subject: Re: [PATCH v5 03/14] pinctrl: add a pinctrl driver for the Ingenic
 jz47xx SoCs
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
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, May 3, 2017 at 11:12 AM, Paul Cercueil <paul@crapouillou.net> wrote:

> The dependency on MFD is gone but now I notice I forgot to remove the
> 'select MFD_CORE'
> in the Kconfig. It'd be great if you can make a quick edit when merging
> this,
> otherwise I'll send a v6.

No problem I can fix it up.

Yours,
Linus Walleij
