Date: Thu, 1 Mar 2018 18:35:20 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-mtd@lists.infradead.org, Jason Cooper <jason@lakedaemon.net>, Andrew
 Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, linux-arm-kernel@lists.infradead.org,
 Antoine Tenart <antoine.tenart@bootlin.com>, Nadav Haklai
 <nadavh@marvell.com>, Shadi Ammouri <shadi@marvell.com>, Omri Itach
 <omrii@marvell.com>, Hanna Hawa <hannah@marvell.com>, Igal Liberman
 <igall@marvell.com>, Marcin Wojtas <mw@semihalf.com>
Subject: Re: [PATCH] mtd: nand: marvell: Fix clock resource by adding a
 register clock
Message-ID: <20180301183520.4251439a@bbrezillon>
In-Reply-To: <20180228143553.12485-1-gregory.clement@bootlin.com>
References: <20180228143553.12485-1-gregory.clement@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Greg,

On Wed, 28 Feb 2018 15:35:53 +0100
Gregory CLEMENT <gregory.clement@bootlin.com> wrote:

> On Armada 7K/8K we need to explicitly enable the register clock. This
> clock is optional because not all the SoCs using this IP need it but at
> least for Armada 7K/8K it is actually mandatory.
> 
> The binding documentation is updated accordingly.
> 
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> ---
>  Documentation/devicetree/bindings/mtd/marvell-nand.txt |  6 +++++-
>  drivers/mtd/nand/marvell_nand.c                        | 14 ++++++++++++++
>  2 files changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/marvell-nand.txt b/Documentation/devicetree/bindings/mtd/marvell-nand.txt
> index c08fb477b3c6..4ee9813bf88f 100644
> --- a/Documentation/devicetree/bindings/mtd/marvell-nand.txt
> +++ b/Documentation/devicetree/bindings/mtd/marvell-nand.txt
> @@ -14,7 +14,11 @@ Required properties:
>  - #address-cells: shall be set to 1. Encode the NAND CS.
>  - #size-cells: shall be set to 0.
>  - interrupts: shall define the NAND controller interrupt.
> -- clocks: shall reference the NAND controller clock.
> +- clocks: shall reference the NAND controller clocks, the second one is
> +  optional but needed for the Armada 7K/8K SoCs
> +- clock-names: mandatory if there is a second clock, in this case the
> +   name must be "core" for the first clock and "reg" for the second
> +   one

Hm, not sure this is a good idea to impose a specific order. I know you
do that to avoid changing the code requesting the core clk, but I'd
prefer to have a solution where we first search for a clock named
"core" (devm_clk_get(&pdev->dev, "core")), and if it's missing,
fall back to devm_clk_get(&pdev->dev, NULL).

>  - marvell,system-controller: Set to retrieve the syscon node that handles
>    NAND controller related registers (only required with the
>    "marvell,armada-8k-nand[-controller]" compatibles).
> diff --git a/drivers/mtd/nand/marvell_nand.c b/drivers/mtd/nand/marvell_nand.c
> index 2196f2a233d6..be874c636b5f 100644
> --- a/drivers/mtd/nand/marvell_nand.c
> +++ b/drivers/mtd/nand/marvell_nand.c
> @@ -321,6 +321,7 @@ struct marvell_nfc {
>  	struct device *dev;
>  	void __iomem *regs;
>  	struct clk *ecc_clk;
> +	struct clk *reg_clk;
>  	struct completion complete;
>  	unsigned long assigned_cs;
>  	struct list_head chips;
> @@ -2747,6 +2748,17 @@ static int marvell_nfc_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> +	nfc->reg_clk = devm_clk_get(&pdev->dev, "reg");

Can we move that before the "core" clock (which for some unknown reason
is called ecc_clk in the driver) is prepared, so that you don't have to
call clk_disable_unprepare() here.

> +	if (IS_ERR(nfc->reg_clk) && PTR_ERR(nfc->reg_clk) == -EPROBE_DEFER) {
> +		clk_disable_unprepare(nfc->ecc_clk);
> +		return -EPROBE_DEFER;
> +	}

Why not:

	if (IS_ERR(nfc->reg_clk) && PTR_ERR(nfc->reg_clk) != -ENOENT)
		return PTR_ERR(nfc->reg_clk);

?

AFAIR, if the clk is not defined, ENOENT is returned, and you want to
propagate all error codes, not only EPROBE_DEFER otherwise.

Another solution would be to retrieve the reg clk only on platforms
that need it (based on the compatible). This way you won't have to test
for -ENOENT and could simply propagate the error to the upper layer.

> +	if (!IS_ERR(nfc->reg_clk)) {
> +		ret = clk_prepare_enable(nfc->reg_clk);
> +		if (ret)
> +			goto unprepare_clk;

This is wrong: you've put a clk_disable_unprepare(nfc->reg_clk) call in
the unprepare_clk path, which means you'll disable/unprepare a clk that
has not been successfully prepared/enabled => unbalanced refcounting.

Please define a new label and rename the old one.

> +	}
> +
>  	marvell_nfc_disable_int(nfc, NDCR_ALL_INT);
>  	marvell_nfc_clear_int(nfc, NDCR_ALL_INT);
>  	ret = devm_request_irq(dev, irq, marvell_nfc_isr,
> @@ -2780,6 +2792,7 @@ static int marvell_nfc_probe(struct platform_device *pdev)
>  	return 0;
>  
>  unprepare_clk:
> +	clk_disable_unprepare(nfc->reg_clk);
>  	clk_disable_unprepare(nfc->ecc_clk);
>  
>  	return ret;
> @@ -2797,6 +2810,7 @@ static int marvell_nfc_remove(struct platform_device *pdev)
>  	}
>  
>  	clk_disable_unprepare(nfc->ecc_clk);
> +	clk_disable_unprepare(nfc->reg_clk);
>  
>  	return 0;
>  }

Regards,

Boris

-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
