Date: Tue, 18 Sep 2018 15:58:49 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, David
 Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Nicolas
 Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Ludovic Desroches
 <ludovic.desroches@microchip.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: rawnand: atmel: Fix potential NULL pointer
 dereference
Message-ID: <20180918155849.178c5f48@bbrezillon>
In-Reply-To: <20180918135555.GA18114@embeddedor.com>
References: <20180918135555.GA18114@embeddedor.com>
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

On Tue, 18 Sep 2018 08:55:55 -0500
"Gustavo A. R. Silva" <gustavo@embeddedor.com> wrote:

> There is a potential execution path in which function
> of_find_compatible_node() returns NULL. In such a case,
> we end up having a NULL pointer dereference when accessing
> pointer *nfc_np* in function of_clk_get().
> 
> So, we better don't take any chances and fix this by null
> checking pointer *nfc_np* before calling of_clk_get().
> 
> Addresses-Coverity-ID: 1473052 ("Dereference null return value")
> Fixes: f88fc122cc34 ("mtd: nand: Cleanup/rework the atmel_nand driver")
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>

Reviewed-by: Boris Brezillon <boris.brezillon@bootlin.com>

> ---
> Changes in v2:
>  - Add Fixes tag to the commit log.
>  - Remove blank line before null checking nfc_np.
> 
>  drivers/mtd/nand/raw/atmel/nand-controller.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
> index a38633a..5bfbe97 100644
> --- a/drivers/mtd/nand/raw/atmel/nand-controller.c
> +++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
> @@ -2034,6 +2034,10 @@ atmel_hsmc_nand_controller_legacy_init(struct atmel_hsmc_nand_controller *nc)
>  	nand_np = dev->of_node;
>  	nfc_np = of_find_compatible_node(dev->of_node, NULL,
>  					 "atmel,sama5d3-nfc");
> +	if (!nfc_np) {
> +		dev_err(dev, "Could not find device node for sama5d3-nfc\n");
> +		return -ENODEV;
> +	}
>  
>  	nc->clk = of_clk_get(nfc_np, 0);
>  	if (IS_ERR(nc->clk)) {
