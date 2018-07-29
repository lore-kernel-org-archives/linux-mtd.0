Received: from mail-io0-x242.google.com ([2607:f8b0:4001:c06::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fjsRD-0003r1-NK
 for linux-mtd@lists.infradead.org; Sun, 29 Jul 2018 20:37:13 +0000
Received: by mail-io0-x242.google.com with SMTP id l14-v6so8215019iob.7
 for <linux-mtd@lists.infradead.org>; Sun, 29 Jul 2018 13:37:01 -0700 (PDT)
MIME-Version: 1.0
References: <20180718235710.18242-1-jmkrzyszt@gmail.com>
 <20180718235710.18242-8-jmkrzyszt@gmail.com>
 <20180719084447.239a1b92@bbrezillon>
In-Reply-To: <20180719084447.239a1b92@bbrezillon>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 29 Jul 2018 22:36:49 +0200
Message-ID: <CACRpkdZfiCN3U57s-7hGnbO9W-=pOjt0mL0w=Jv_+5WBdkEuig@mail.gmail.com>
Subject: Re: [RFC PATCH 7/8] mtd: rawnand: ams-delta: Check sanity of data
 GPIO resource
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Janusz Krzysztofik <jmkrzyszt@gmail.com>,
 =?UTF-8?Q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>,
 ext Tony Lindgren <tony@atomide.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Grygorii Strashko <grygorii.strashko@ti.com>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Kevin Hilman <khilman@kernel.org>, Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Mark Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux-OMAP <linux-omap@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jul 19, 2018 at 8:44 AM Boris Brezillon
<boris.brezillon@bootlin.com> wrote:

> I guess you'd prefer to have the pin values in a bitmap instead of an
> array of integers. That's probably something you can discuss with
> Linus, see if he would accept to change the prototype of
> gpiod_get_raw_array_value().

I am not so smart as to see the overall effects but if what
you're saying is that we shouldn't have designed these functions
and callbacks using arrays of integers (or longs) and instead
pass bitmaps, you may be just right. It intuitively sounds better.
But I'm not good with bitmaps.

We would have to refactor the world though.

Yours,
Linus Walleij
