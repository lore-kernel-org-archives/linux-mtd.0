Received: from mail-it0-x22e.google.com ([2607:f8b0:4001:c0b::22e])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d2dZd-0005pn-LG
 for linux-mtd@lists.infradead.org; Mon, 24 Apr 2017 12:58:40 +0000
Received: by mail-it0-x22e.google.com with SMTP id x188so53542406itb.0
 for <linux-mtd@lists.infradead.org>; Mon, 24 Apr 2017 05:58:16 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <e4aaf8c3e8a54df2c5878f8e873e290f@crapouillou.net>
References: <20170125185207.23902-2-paul@crapouillou.net>
 <20170402204244.14216-1-paul@crapouillou.net>
 <20170402204244.14216-7-paul@crapouillou.net>
 <CACRpkdbXe1Xxk93jqLXBdEDwWOnWD+CkZrqvok-PcmWxzBbSZA@mail.gmail.com>
 <e4aaf8c3e8a54df2c5878f8e873e290f@crapouillou.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 24 Apr 2017 14:58:00 +0200
Message-ID: <CACRpkdZ8o1OFC0HGaVuLWy5JbnHjeXmAYorii7eX=XvJNkSSvA@mail.gmail.com>
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

On Fri, Apr 7, 2017 at 3:57 PM, Paul Cercueil <paul@crapouillou.net> wrote:

> I think the 'reg' property makes more sense, yes. I'll fix this in the v5,
> this
> week-end. Do you think it can go in 4.12?

Surely, Torvalds just cut an -rc8 giving me more time to queue more
material, and I really like this series.

Yours,
Linus Walleij
