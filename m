Received: from mail-io0-x230.google.com ([2607:f8b0:4001:c06::230])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dcAl9-00008c-B9
 for linux-mtd@lists.infradead.org; Mon, 31 Jul 2017 13:29:25 +0000
Received: by mail-io0-x230.google.com with SMTP id m88so102193677iod.2
 for <linux-mtd@lists.infradead.org>; Mon, 31 Jul 2017 06:29:02 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170703135555.GA686@linux-mips.org>
References: <20170402204244.14216-2-paul@crapouillou.net>
 <20170428200824.10906-1-paul@crapouillou.net>
 <20170428200824.10906-6-paul@crapouillou.net>
 <CACRpkdauf5c2i4o5i8QY8YHPNjizkvTu6kAbnquWiP_=v2=KdQ@mail.gmail.com>
 <1499013301.1477.0@smtp.crapouillou.net>
 <CACRpkdb=Zti+C+2me_WP0=m6z12G5Kz+W_cPcZsw=CVzBO_wAg@mail.gmail.com>
 <20170703135555.GA686@linux-mips.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 31 Jul 2017 15:29:00 +0200
Message-ID: <CACRpkdZKAR-Ya-j-g=uyb24s1KqyEhbKOxzi=BdAaa29L1BO+w@mail.gmail.com>
Subject: Re: [PATCH v5 05/14] MIPS: ingenic: Enable pinctrl for all ingenic
 SoCs
To: Ralf Baechle <ralf@linux-mips.org>
Cc: Paul Cercueil <paul@crapouillou.net>, Alexandre Courbot <gnurou@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
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

On Mon, Jul 3, 2017 at 3:55 PM, Ralf Baechle <ralf@linux-mips.org> wrote:
> On Mon, Jul 03, 2017 at 11:07:09AM +0200, Linus Walleij wrote:
>
>> > There has been no word from Ralf, is this going into 4.13?
>
> Acked-by: Ralf Baechle <ralf@linux-mips.org>
>
> for the whole series.

Thanks Ralf, I missed to add this in, but everything seems to have
landed smoothly in v4.13.

Yours,
Linus Walleij
