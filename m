Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ghLaX-0007gQ-2i
 for linux-mtd@lists.infradead.org; Wed, 09 Jan 2019 21:40:38 +0000
Received: by mail-lf1-x143.google.com with SMTP id y14so6757435lfg.13
 for <linux-mtd@lists.infradead.org>; Wed, 09 Jan 2019 13:40:36 -0800 (PST)
MIME-Version: 1.0
References: <20190109205530.5158-1-linus.walleij@linaro.org>
 <20190109222125.73171ae9@bbrezillon>
In-Reply-To: <20190109222125.73171ae9@bbrezillon>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 9 Jan 2019 22:40:22 +0100
Message-ID: <CACRpkdaouj-0gC4p1Ymx+guxDLO7R0FzQZncgNQjaHkGuiAhLQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: rawnand: fsmc: Keep CE enabled fix mb() drain
To: Boris Brezillon <bbrezillon@kernel.org>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 9, 2019 at 10:21 PM Boris Brezillon <bbrezillon@kernel.org> wrote:
> On Wed,  9 Jan 2019 21:55:30 +0100
> Linus Walleij <linus.walleij@linaro.org> wrote:

> > This patch keeps the CE (chip enable, the only chip select)
> > signal from the FSMC block enabled from the first command
> > after probe() or resume() until the driver either suspend()
> > or remove(). Create a state variable to track this.
>
> I just read the Spear600 reference manual, and I'm not sure the
> BANK_ENABLE bit controls the CE line. My understanding is that it just
> marks the bank as active and CE line is asserted when you actually
> access the AHB mem bank range (probably after making sure the FSMC bus
> is idle).

The Nomadik STn8815 says (for this bit):

PBKEN PC-card/NAND-Flash chip-select enable.
Enables the corresponding chip-select.
If a disabled chip-select is accessed, an HRESP = ERROR is generated
on the AHB bus.
0: disabled (default after reset)
1: enabled

The same for Nomadik STn8820 and the Ux500 variants.

So "enable" might very well have the meaning you say above,
it's just very unclear and confusing.

> If I'm correct, I'd recommend dropping fsmc_ce_ctrl() and marking the
> bank enabled at probe time.

This already happens in fsmc_nand_setup() so we just
need to delete some code then.

But maybe we should disable it during remove()
at least?

Yours,
Linus Walleij
