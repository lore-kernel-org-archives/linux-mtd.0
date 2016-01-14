Received: from mail.kernel.org ([198.145.29.136])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aJWZo-0000Ra-It
 for linux-mtd@lists.infradead.org; Thu, 14 Jan 2016 01:19:49 +0000
Date: Wed, 13 Jan 2016 19:19:24 -0600
From: Rob Herring <robh@kernel.org>
To: Romain Izard <romain.izard.pro@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 Yang Wenyou <Wenyou.Yang@atmel.com>, Josh Wu <rainyfeeling@outlook.com>,
 Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: Re: [PATCH v1 2/5] mtd: atmel_nand: Support variable RB_EDGE
 interrupts
Message-ID: <20160114011924.GA31786@rob-hp-laptop>
References: <1452702857-2240-1-git-send-email-romain.izard.pro@gmail.com>
 <1452702857-2240-3-git-send-email-romain.izard.pro@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1452702857-2240-3-git-send-email-romain.izard.pro@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 13, 2016 at 05:34:14PM +0100, Romain Izard wrote:
> The NFC controller used to accelerate the NAND transfers on SAMA5 chips
> can use either RB_EDGE0 or RB_EDGE3 as its ready/busy interrupt bit.
> 
> Use the controller's compatible string to select the correct bit.
> 
> Signed-off-by: Romain Izard <romain.izard.pro@gmail.com>
> Reviewed-by: Wenyou Yang <Wenyou.yang@atmel.com>
> ---
>  .../devicetree/bindings/mtd/atmel-nand.txt         |  2 +-
>  drivers/mtd/nand/atmel_nand.c                      | 39 +++++++++++++++++-----
>  drivers/mtd/nand/atmel_nand_nfc.h                  |  5 ++-
>  3 files changed, 36 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/atmel-nand.txt b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
> index 7d4c8eb775a5..89b0db9801b0 100644
> --- a/Documentation/devicetree/bindings/mtd/atmel-nand.txt
> +++ b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
> @@ -34,7 +34,7 @@ Optional properties:
>  - nand-on-flash-bbt: boolean to enable on flash bbt option if not present false
>  - Nand Flash Controller(NFC) is a slave driver under Atmel nand flash
>    - Required properties:
> -    - compatible : "atmel,sama5d3-nfc".
> +    - compatible : "atmel,sama5d3-nfc" or "atmel,sama5d4-nfc".
>      - reg : should specify the address and size used for NFC command registers,
>              NFC registers and NFC Sram. NFC Sram address and size can be absent
>              if don't want to use it.

For the binding: 

Acked-by: Rob Herring <robh@kernel.org>

[...]

> @@ -2352,6 +2360,12 @@ static int atmel_nand_nfc_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> +	priv = of_match_device(atmel_nand_nfc_match, &pdev->dev)->data;

Use of_device_get_match_data

> +	if (NULL == priv)
> +		return -ENODEV;
> +
> +	nfc->rb_edge = priv->rb_edge;
> +
>  	nfc_writel(nfc->hsmc_regs, IDR, 0xffffffff);
>  	nfc_readl(nfc->hsmc_regs, SR);	/* clear the NFC_SR */
>  
