Received: from smtp4-g21.free.fr ([2a01:e0c:1:1599::13])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ghME5-0006mT-Vw
 for linux-mtd@lists.infradead.org; Wed, 09 Jan 2019 22:21:31 +0000
Subject: Re: [PATCH v3 15/22] mtd: rawnand: fsmc: Stop implementing
 ->select_chip()
To: Boris Brezillon <bbrezillon@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Will Deacon <will.deacon@arm.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 Maxim Levitsky <maximlevitsky@gmail.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Richard Weinberger <richard@nod.at>, Janusz Krzysztofik
 <jmkrzyszt@gmail.com>, Stefan Agner <stefan@agner.ch>,
 Marek Vasut <marek.vasut@gmail.com>, Harvey Hunt
 <harveyhuntnexus@gmail.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, Han Xu <han.xu@nxp.com>,
 Xiaolei Li <xiaolei.li@mediatek.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
References: <20181111075524.13123-1-boris.brezillon@bootlin.com>
 <20181111075524.13123-16-boris.brezillon@bootlin.com>
 <CACRpkdYTXO4AXt79Ny-EsbWvd0kR7=auz_73UF6f+nEXfZ_HmA@mail.gmail.com>
 <20190109204441.6aeab463@bbrezillon>
From: Marc Gonzalez <marc.w.gonzalez@free.fr>
Message-ID: <c642fe39-8109-f4fd-9cb8-88cc7262472d@free.fr>
Date: Wed, 9 Jan 2019 23:20:40 +0100
MIME-Version: 1.0
In-Reply-To: <20190109204441.6aeab463@bbrezillon>
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 09/01/2019 20:44, Boris Brezillon wrote:

> Might be caused by a missing barrier: when de-asserting the CE line, we
> must make sure all accesses to the ->data_va range have been done.
> Can you try with the following diff applied?
> 
> --->8---
> diff --git a/drivers/mtd/nand/raw/fsmc_nand.c b/drivers/mtd/nand/raw/fsmc_nand.c
> index 325b4414dccc..264d809c2d37 100644
> --- a/drivers/mtd/nand/raw/fsmc_nand.c
> +++ b/drivers/mtd/nand/raw/fsmc_nand.c
> @@ -598,16 +598,21 @@ static void fsmc_ce_ctrl(struct fsmc_nand_data *host, bool assert)
>  {
>         u32 pc = readl(host->regs_va + FSMC_PC);
>  
> -       if (!assert)
> +       if (!assert) {
> +               /*
> +                * Make sure all previous read/write have been done before
> +                * de-asserting the CE line.
> +                */
> +               mb();
>                 writel_relaxed(pc & ~FSMC_ENABLE, host->regs_va + FSMC_PC);
> -       else
> +       } else {
>                 writel_relaxed(pc | FSMC_ENABLE, host->regs_va + FSMC_PC);
> -
> -       /*
> -        * nCE line changes must be applied before returning from this
> -        * function.
> -        */
> -       mb();
> +               /*
> +                * nCE assertion must be applied before returning from this
> +                * function.
> +                */
> +               mb();
> +       }

+ Will Deacon, an expert on arm mmio shenanigans.
e.g. https://elinux.org/images/a/a8/Uh-oh-Its-IO-Ordering-Will-Deacon-Arm.pdf

As far as I understand (which isn't very far), a memory barrier (however
strong) cannot guarantee that all (posted) writes have reached a device
(unless the underlying bus explicitly provides such guarantees?)

At best, a memory barrier guarantees that the mmio writes have "left" the CPU
and its "coherency fabric" (shared LLC). Thus subsequent accesses are
guaranteed to appear "later" on the bus. (Much hand-waving sorry)

I've been told that the one true way to ensure that a posted write has reached
a device is simply to read the value back, i.e. writel+readl.

If I'm wrong, I'd like to be schooled :-)

Regards.
