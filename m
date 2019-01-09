Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ghKfS-0002CV-8D
 for linux-mtd@lists.infradead.org; Wed, 09 Jan 2019 20:41:39 +0000
Received: by mail-lj1-x244.google.com with SMTP id c19-v6so7681625lja.5
 for <linux-mtd@lists.infradead.org>; Wed, 09 Jan 2019 12:41:37 -0800 (PST)
MIME-Version: 1.0
References: <20181111075524.13123-1-boris.brezillon@bootlin.com>
 <20181111075524.13123-16-boris.brezillon@bootlin.com>
 <CACRpkdYTXO4AXt79Ny-EsbWvd0kR7=auz_73UF6f+nEXfZ_HmA@mail.gmail.com>
 <20190109204441.6aeab463@bbrezillon>
In-Reply-To: <20190109204441.6aeab463@bbrezillon>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 9 Jan 2019 21:41:24 +0100
Message-ID: <CACRpkdaw-=RujxNa8Dk2VsW=RGwrgRZNiZ7P9PRDe3g71TJbWA@mail.gmail.com>
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

On Wed, Jan 9, 2019 at 8:45 PM Boris Brezillon <bbrezillon@kernel.org> wrote:
> [Me]
> > I will experiment with some delay valued and try to read some data
> > sheets but if you already have hints on how to deal with this I'd
> > like to hear!
>
> Might be caused by a missing barrier: when de-asserting the CE line, we
> must make sure all accesses to the ->data_va range have been done.
> Can you try with the following diff applied?

Tried it, but it sadly does not help :/

The machine crashes at the same place when doing ther first
64 bytes read.

I suppose the old code would hold CE enabled across all the
commands?

Since the old code contained this:

       /* Support only one CS */
       if (chipnr > 0)
               return;

I guess that is normal for FSMC: only one CS. It seems a bit
aggressive to toggle CS on/off between every command like this,
I suspect the FSMC isn't really built for that but shakes apart
or something.

I will send a version of your patch that keeps CS enabled
for your consideration. (worksforme).

Yours,
Linus Walleij
