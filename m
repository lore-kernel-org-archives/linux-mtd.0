Received: from mail-io0-x232.google.com ([2607:f8b0:4001:c06::232])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cfoSd-0001UM-Iz
 for linux-mtd@lists.infradead.org; Mon, 20 Feb 2017 13:57:06 +0000
Received: by mail-io0-x232.google.com with SMTP id j18so26630692ioe.2
 for <linux-mtd@lists.infradead.org>; Mon, 20 Feb 2017 05:56:43 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <fd3c507484a9ee34a08c9f92e60624db@mail.crapouillou.net>
References: <27071da2f01d48141e8ac3dfaa13255d@mail.crapouillou.net>
 <20170125185207.23902-1-paul@crapouillou.net>
 <20170125185207.23902-2-paul@crapouillou.net>
 <20170130203617.hpljtcmzava3rq2n@rob-hp-laptop>
 <12dc62a7255bd453ff4e5e89f93ebc58@mail.crapouillou.net>
 <CACRpkdbAgy4sh6NT5DdQD6EQtOZEwevohEA6OGRcVz98yqS52Q@mail.gmail.com>
 <fd3c507484a9ee34a08c9f92e60624db@mail.crapouillou.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 20 Feb 2017 14:56:41 +0100
Message-ID: <CACRpkdbAA33FFrMgx-eZPmpBBfQ_hF+=dSu0hANVthdbadicDg@mail.gmail.com>
Subject: Re: [PATCH v3 01/14] Documentation: dt/bindings: Document
 pinctrl-ingenic
To: Paul Cercueil <paul@crapouillou.net>
Cc: Rob Herring <robh@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
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

On Thu, Feb 9, 2017 at 6:28 PM, Paul Cercueil <paul@crapouillou.net> wrote:

> I was thinking that instead of having one pinctrl-ingenic instance covering
> 0x600 of register space, and 6 instances of gpio-ingenic having 0x100 each,
> I could just have 6 instances of pinctrl-ingenic, each one with an instance
> of gpio-ingenic declared as a sub-node, each handling just 0x100 of memory
> space.

My head is spinning,  but I think I get it. What is wrong with the solution
I proposed with one pin control instance covering the whole 0x600 and with 6
subnodes of GPIO?

The GPIO nodes do not even have to have an address range associated with
them you know, that can be distributed out with regmap code accessing
the parent regmap.

Yours,
Linus Walleij
