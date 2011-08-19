Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QuV6f-0005IW-38
	for linux-mtd@lists.infradead.org; Fri, 19 Aug 2011 19:51:53 +0000
Received: by bke17 with SMTP id 17so3050317bke.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 19 Aug 2011 12:51:50 -0700 (PDT)
Subject: Re: [PATCHv4] mtd: gpio-nand: add device tree bindings
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jamie Iles <jamie@jamieiles.com>
Date: Fri, 19 Aug 2011 22:51:46 +0300
In-Reply-To: <20110815152447.GI2636@pulham.picochip.com>
References: <1312902747-21372-1-git-send-email-jamie@jamieiles.com>
	<1313418543.2600.2.camel@sauron>
	<20110815143816.GH2636@pulham.picochip.com>
	<1313419536.2600.7.camel@sauron>
	<20110815152447.GI2636@pulham.picochip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Message-ID: <1313783508.4475.8.camel@koala>
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

On Mon, 2011-08-15 at 16:24 +0100, Jamie Iles wrote:
> @@ -178,7 +249,7 @@ static int __devexit gpio_nand_remove(struct platform_device *dev)
>  
>  	nand_release(&gpiomtd->mtd_info);
>  
> -	res = platform_get_resource(dev, IORESOURCE_MEM, 1);
> +	res = gpio_nand_get_io_sync(dev);

Why do you call 'gpio_nand_get_io_sync(dev)' here, in
'gpio_nand_remove()' function? You should have it in gpiomtd->io_sync.
Right?

If this is the case, then you do not need a separate
'gpio_nand_get_io_sync()' function at all, you can make
'gpio_nand_get_config()' to fetch the io_sync information from the DT.
And then you will have one single function which gets data from DT, not
2 -> simpler code.

Do I miss something?

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
