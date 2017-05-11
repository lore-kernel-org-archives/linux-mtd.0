Received: from mail-io0-x22c.google.com ([2607:f8b0:4001:c06::22c])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d8lw6-0000oE-01
 for linux-mtd@lists.infradead.org; Thu, 11 May 2017 11:07:11 +0000
Received: by mail-io0-x22c.google.com with SMTP id k91so18899925ioi.1
 for <linux-mtd@lists.infradead.org>; Thu, 11 May 2017 04:06:49 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <3a779fca-5a56-44e5-2acf-12b8abdaf906@crapouillou.net>
References: <20170402204244.14216-2-paul@crapouillou.net>
 <20170428200824.10906-1-paul@crapouillou.net>
 <20170428200824.10906-5-paul@crapouillou.net>
 <3a779fca-5a56-44e5-2acf-12b8abdaf906@crapouillou.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 11 May 2017 13:06:47 +0200
Message-ID: <CACRpkdb+uQpdOfCFTKaMvp=nUxksA0=FWCDbY+JbB_=jDDcXfA@mail.gmail.com>
Subject: Re: [PATCH v5 04/14] GPIO: Add gpio-ingenic driver
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

On Mon, May 8, 2017 at 12:05 AM, Paul Cercueil <paul@crapouillou.net> wrote:

> It looks like the gpio_get_value() is broken on jz4740.
>
> I'll send a v6.

OK I don't apply this series then, waiting for v6.

The series looks good so as soon you think it is finished
I can apply it I think.

Yours,
Linus Walleij
