Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ghLQp-000336-D4
 for linux-mtd@lists.infradead.org; Wed, 09 Jan 2019 21:30:37 +0000
Received: by mail-lf1-x141.google.com with SMTP id u18so6738271lff.10
 for <linux-mtd@lists.infradead.org>; Wed, 09 Jan 2019 13:30:33 -0800 (PST)
MIME-Version: 1.0
References: <20181111075524.13123-1-boris.brezillon@bootlin.com>
 <20181111075524.13123-16-boris.brezillon@bootlin.com>
 <CACRpkdYTXO4AXt79Ny-EsbWvd0kR7=auz_73UF6f+nEXfZ_HmA@mail.gmail.com>
 <20190109204441.6aeab463@bbrezillon>
 <CACRpkdaw-=RujxNa8Dk2VsW=RGwrgRZNiZ7P9PRDe3g71TJbWA@mail.gmail.com>
 <20190109215443.67cec30c@bbrezillon>
In-Reply-To: <20190109215443.67cec30c@bbrezillon>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 9 Jan 2019 22:30:18 +0100
Message-ID: <CACRpkdbijrpG_r1X+-cNQmyusVC_879az5V2Hiv_Aa-yAz0iow@mail.gmail.com>
Subject: Re: [PATCH v3 15/22] mtd: rawnand: fsmc: Stop implementing
 ->select_chip()
To: Boris Brezillon <bbrezillon@kernel.org>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 Maxim Levitsky <maximlevitsky@gmail.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Richard Weinberger <richard@nod.at>,
 Marc Gonzalez <marc.w.gonzalez@free.fr>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>,
 Stefan Agner <stefan@agner.ch>, Marek Vasut <marek.vasut@gmail.com>,
 Harvey Hunt <harveyhuntnexus@gmail.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, Han Xu <han.xu@nxp.com>,
 Xiaolei Li <xiaolei.li@mediatek.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 9, 2019 at 9:54 PM Boris Brezillon <bbrezillon@kernel.org> wrote:
> [Me]
> > I guess that is normal for FSMC: only one CS. It seems a bit
> > aggressive to toggle CS on/off between every command like this,
> > I suspect the FSMC isn't really built for that but shakes apart
> > or something.
>
> Hm, that would be weird. There's indeed timing constraints on the NAND
> chip side, but none infringing those constraints should not trigger an
> external abort exception.

The manual contains this (the same bit, just another name than
in the driver):

PBKEN PC-card/NAND-Flash chip-select enable.
Enables the corresponding chip-select.
If a disabled chip-select is accessed, an HRESP = ERROR is generated
on the AHB bus.
0: disabled (default after reset)
1: enabled

> Can you check which phys range is remapped at
> 0xcc960000?

No idea how to do that but I'll see if I can figure it out...

Yours,
Linus Walleij
