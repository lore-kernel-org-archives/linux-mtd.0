Date: Tue, 17 Dec 2013 00:50:27 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
Subject: Re: [PATCH v3 7/9] mtd: nand: davinci: adjust DT properties to MTD
 generic
Message-ID: <20131217085027.GK12034@norris-Latitude-E6410>
References: <1386264358-9738-1-git-send-email-ivan.khoronzhuk@ti.com>
 <1386264358-9738-8-git-send-email-ivan.khoronzhuk@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1386264358-9738-8-git-send-email-ivan.khoronzhuk@ti.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 grygorii.strashko@ti.com, Russell King <linux@arm.linux.org.uk>,
 Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@kernel.crashing.org>, Rob Herring <rob.herring@calxeda.com>,
 linux-kernel@vger.kernel.org, Santosh Shilimkar <santosh.shilimkar@ti.com>,
 Rob Landley <rob@landley.net>, linux-mtd@lists.infradead.org,
 dwmw2@infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Dec 05, 2013 at 07:25:55PM +0200, Ivan Khoronzhuk wrote:
> --- a/drivers/mtd/nand/davinci_nand.c
> +++ b/drivers/mtd/nand/davinci_nand.c
> @@ -558,6 +557,8 @@ static struct davinci_nand_pdata
>  			"ti,davinci-mask-chipsel", &prop))
>  			pdata->mask_chipsel = prop;
>  		if (!of_property_read_string(pdev->dev.of_node,
> +			"nand-ecc-mode", &mode) ||

Is it possible to use the of_get_nand_ecc_mode() helper? It's
unfortunate that davinci_nand had to use custom bindings in the first
place, making this more difficult... So I can take this patch as-is.

> +		    !of_property_read_string(pdev->dev.of_node,
>  			"ti,davinci-ecc-mode", &mode)) {
>  			if (!strncmp("none", mode, 4))
>  				pdata->ecc_mode = NAND_ECC_NONE;
> @@ -570,11 +571,15 @@ static struct davinci_nand_pdata
>  			"ti,davinci-ecc-bits", &prop))
>  			pdata->ecc_bits = prop;
>  		if (!of_property_read_u32(pdev->dev.of_node,
> +			"nand-bus-width", &prop) ||

Similar story here, with of_get_nand_bus_width().

> +		    !of_property_read_u32(pdev->dev.of_node,
>  			"ti,davinci-nand-buswidth", &prop))
>  			if (prop == 16)
>  				pdata->options |= NAND_BUSWIDTH_16;
> -		if (of_find_property(pdev->dev.of_node,
> -			"ti,davinci-nand-use-bbt", &len))
> +		if (of_property_read_bool(pdev->dev.of_node,
> +			"nand-on-flash-bbt") ||
> +		    of_property_read_bool(pdev->dev.of_node,
> +			"ti,davinci-nand-use-bbt"))
>  			pdata->bbt_options = NAND_BBT_USE_FLASH;
>  	}
>  

Brian
