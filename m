Received: from mail-gw0-f49.google.com ([74.125.83.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qsy8O-0002xg-Qc
	for linux-mtd@lists.infradead.org; Mon, 15 Aug 2011 14:27:21 +0000
Received: by gwb1 with SMTP id 1so3393249gwb.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 15 Aug 2011 07:27:19 -0700 (PDT)
Subject: Re: [PATCHv4] mtd: gpio-nand: add device tree bindings
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jamie Iles <jamie@jamieiles.com>
Date: Mon, 15 Aug 2011 17:28:57 +0300
In-Reply-To: <1312902747-21372-1-git-send-email-jamie@jamieiles.com>
References: <1312902747-21372-1-git-send-email-jamie@jamieiles.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1313418543.2600.2.camel@sauron>
Mime-Version: 1.0
Cc: Scott Wood <scottwood@freescale.com>, David Woodhouse <dwmw2@infradead.org>,
	devicetree-discuss@lists.ozlabs.org, linux-mtd@lists.infradead.org,
	Grant Likely <grant.likely@secretlab.ca>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-08-09 at 16:12 +0100, Jamie Iles wrote:
> -	res1 = platform_get_resource(dev, IORESOURCE_MEM, 1);
> +	if (!dev->dev.of_node)
> +		res1 = platform_get_resource(dev, IORESOURCE_MEM, 1);
> +	else
> +		res1 = gpio_nand_of_get_io_sync(&dev->dev);
> +
>  	if (res1) {
>  		gpiomtd->io_sync = request_and_remap(res1, 4, "NAND sync", &ret);
>  		if (!gpiomtd->io_sync) {
> @@ -257,7 +362,16 @@ static int __devinit gpio_nand_probe(struct platform_device *dev)
>  		}
>  	}
>  
> -	memcpy(&gpiomtd->plat, dev->dev.platform_data, sizeof(gpiomtd->plat));
> +	if (dev->dev.of_node)
> +		kfree(res1);
> +
> +	if (dev->dev.platform_data)
> +		memcpy(&gpiomtd->plat, dev->dev.platform_data,
> +		       sizeof(gpiomtd->plat));
> +	else
> +		ret = gpio_nand_of_get_config(&dev->dev, &gpiomtd->plat);
> +	if (ret)
> +		goto err_nce;
>  

So with this code you can mix platform data and DT? Say, io_sync may
come from platform data and the rest from the DT? Is this normal
practice?

-- 
Best Regards,
Artem Bityutskiy
