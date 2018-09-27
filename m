Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g5Udv-0004GQ-86
 for linux-mtd@lists.infradead.org; Thu, 27 Sep 2018 11:39:40 +0000
Date: Thu, 27 Sep 2018 13:39:03 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, Zhouyang Jia <jiazhouyang09@gmail.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org (open list)
Subject: Re: [PATCH v2 7/8] mtd: maps: gpio-addr-flash: Add support for
 device-tree devices
Message-ID: <20180927133903.43195296@bbrezillon>
In-Reply-To: <20180905143643.9871-8-ricardo.ribalda@gmail.com>
References: <20180905143643.9871-1-ricardo.ribalda@gmail.com>
 <20180905143643.9871-8-ricardo.ribalda@gmail.com>
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

On Wed,  5 Sep 2018 16:36:42 +0200
Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com> wrote:

> +static int gpio_flash_probe_gpios(struct platform_device *pdev,
> +				  struct async_state *state)
> +{
> +	struct physmap_flash_data *pdata;
> +	struct device_node *dn;
> +	struct resource *gpios = NULL;
> +	int i;
> +
> +	dn = pdev->dev.of_node;
> +	if (dn) {
> +		state->gpio_count = of_gpio_count(dn);
> +	} else {
> +		pdata = dev_get_platdata(&pdev->dev);
> +		if (!pdata)
> +			return -EINVAL;
> +		gpios = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
> +		if (IS_ERR(gpios) || !gpios->end)
> +			return -EINVAL;
> +		state->gpio_count = gpios->end;
> +	}
> +
> +	state->gpio_addrs = devm_kzalloc(&pdev->dev,
> +					 sizeof(state->gpio_addrs[0])
> +						* state->gpio_count,
> +					 GFP_KERNEL);
> +	if (!state->gpio_addrs)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < state->gpio_count; i++) {
> +		long gpio;
> +		int ret;
> +
> +		if (dn)
> +			gpio = of_get_gpio(dn, i);
> +		else
> +			gpio = ((unsigned long *)gpios->start)[i];
> +

Hm, we should probably switch to GPIO descs (instead of GPIO numbers)
before adding DT support. This should make the code much more simpler
and remove one more user of the old/deprecated GPIO API.

> +		if (gpio < 0)
> +			return gpio;
> +
> +		ret =  devm_gpio_request(&pdev->dev, gpio, DRIVER_NAME);
> +		if (ret < 0) {
> +			dev_err(&pdev->dev, "failed to request gpio %ld\n",
> +				gpio);
> +			return ret;
> +		}
> +		state->gpio_addrs[i] = gpio;
> +		gpio_direction_output(state->gpio_addrs[i], 0);
> +	}
> +
> +	return 0;
> +}
