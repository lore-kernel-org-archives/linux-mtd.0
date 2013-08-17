Received: from mail-pa0-x231.google.com ([2607:f8b0:400e:c03::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VAnph-0002uJ-EW
 for linux-mtd@lists.infradead.org; Sat, 17 Aug 2013 21:14:50 +0000
Received: by mail-pa0-f49.google.com with SMTP id ld10so3172534pab.8
 for <linux-mtd@lists.infradead.org>; Sat, 17 Aug 2013 14:14:28 -0700 (PDT)
Date: Sat, 17 Aug 2013 14:14:23 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Alexander Shiyan <shc_work@mail.ru>
Subject: Re: [PATCH v4 1/4] mtd: nand: gpio: Add DT property to automatically
 determine bus width
Message-ID: <20130817211423.GF11210@norris.computersforpeace.net>
References: <1376637583-12485-1-git-send-email-shc_work@mail.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1376637583-12485-1-git-send-email-shc_work@mail.ru>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Ian Campbell <ian.campbell@citrix.com>, Pawel Moll <pawel.moll@arm.com>,
 Stephen Warren <swarren@wwwdotorg.org>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Rob Herring <rob.herring@calxeda.com>, linux-mtd@lists.infradead.org,
 Grant Likely <grant.likely@linaro.org>, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 16, 2013 at 11:19:42AM +0400, Alexander Shiyan wrote:
> This patch adds a property to automatically determine the NAND
> bus width. This property works if the bus width is not specified
> explicitly.
> 
> Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
> ---
>  .../devicetree/bindings/mtd/gpio-control-nand.txt        |  2 ++
>  drivers/mtd/nand/gpio.c                                  | 16 ++++++++++++----
>  2 files changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt b/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt
> index 36ef07d..91070d0 100644
> --- a/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt
> +++ b/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt
> @@ -19,6 +19,8 @@ Optional properties:
>    defaults to 1 byte.
>  - chip-delay : chip dependent delay for transferring data from array to
>    read registers (tR).  If not present then a default of 20us is used.
> +- gpio-control-nand,bank-width-auto : Device bus width is determined
> +  automatically if "bank-width" is omitted (Boolean).
>  - gpio-control-nand,io-sync-reg : A 64-bit physical address for a read
>    location used to guard against bus reordering with regards to accesses to
>    the GPIO's and the NAND flash data bus.  If present, then after changing
> diff --git a/drivers/mtd/nand/gpio.c b/drivers/mtd/nand/gpio.c
> index e826f89..8eea181 100644
> --- a/drivers/mtd/nand/gpio.c
> +++ b/drivers/mtd/nand/gpio.c
> @@ -116,6 +116,10 @@ static int gpio_nand_get_config_of(const struct device *dev,
>  			dev_err(dev, "invalid bank-width %u\n", val);
>  			return -EINVAL;
>  		}
> +	} else {

Combine with the 'if' and make it 'else if'.

> +		if (of_get_property(dev->of_node,
> +				    "gpio-control-nand,bank-width-auto", NULL))

of_property_read_bool()

> +			plat->options |= NAND_BUSWIDTH_AUTO;
>  	}
>  
>  	plat->gpio_rdy = of_get_gpio(dev->of_node, 0);
> @@ -223,6 +227,14 @@ static int gpio_nand_probe(struct platform_device *pdev)
>  	if (IS_ERR(chip->IO_ADDR_R))
>  		return PTR_ERR(chip->IO_ADDR_R);
>  
> +	ret = gpio_nand_get_config(&pdev->dev, &gpiomtd->plat);
> +	if (ret)
> +		return ret;
> +
> +	if (resource_size(res) < 2)
> +		gpiomtd->plat.options &= ~(NAND_BUSWIDTH_16 |
> +					   NAND_BUSWIDTH_AUTO);

I can't quite figure out what the significance of resource_size(res) < 2
is. It doesn't quite match my reading of the device-tree documentation.
Maybe I'm being dense. Is the resource provided as either an 8-bit IO
address (length=1) or 16-bit IO address (length=2)?

> +
>  	res = gpio_nand_get_io_sync(pdev);
>  	if (res) {
>  		gpiomtd->io_sync = devm_ioremap_resource(&pdev->dev, res);
> @@ -230,10 +242,6 @@ static int gpio_nand_probe(struct platform_device *pdev)
>  			return PTR_ERR(gpiomtd->io_sync);
>  	}
>  
> -	ret = gpio_nand_get_config(&pdev->dev, &gpiomtd->plat);
> -	if (ret)
> -		return ret;
> -
>  	ret = devm_gpio_request(&pdev->dev, gpiomtd->plat.gpio_nce, "NAND NCE");
>  	if (ret)
>  		return ret;

I can fixup the first 2 without a resend. Depending on your response to
the third comment, I'll apply this.

Thanks,
Brian
