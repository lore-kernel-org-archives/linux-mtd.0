Received: from mail-bn1bln0171.outbound.protection.outlook.com
 ([2a01:111:f400:7c10::1:171]
 helo=na01-bn1-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WR3Lp-0005IM-KQ
 for linux-mtd@lists.infradead.org; Fri, 21 Mar 2014 17:35:28 +0000
Message-ID: <1395423296.12479.354.camel@snotra.buserror.net>
Subject: Re: [PATCH] mtd: m25p80: Modify the name of mtd_info
From: Scott Wood <scottwood@freescale.com>
To: Hou Zhiqiang <B48286@freescale.com>
Date: Fri, 21 Mar 2014 12:34:56 -0500
In-Reply-To: <1395400578-5637-1-git-send-email-B48286@freescale.com>
References: <1395400578-5637-1-git-send-email-B48286@freescale.com>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linuxppc-dev@ozlabs.org, mingkai.hu@freescale.com,
 linux-mtd@lists.infradead.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2014-03-21 at 19:16 +0800, Hou Zhiqiang wrote:
> @@ -1009,8 +1012,17 @@ static int m25p_probe(struct spi_device *spi)
>  
>  	if (data && data->name)
>  		flash->mtd.name = data->name;
> -	else
> -		flash->mtd.name = dev_name(&spi->dev);
> +	else{

Whitespace

> +		ret = of_address_to_resource(mnp, 0, &res);
> +		if (ret) {
> +			dev_err(&spi->dev, "failed to get spi master resource\n");
> +			return ret;
> +		}
> +		flash->mtd.name = kasprintf(GFP_KERNEL, "spi%x.%d",
> +				(unsigned)res.start, spi->chip_select);

Don't use "unsigned" by itself.  Don't cast physical addresses to
"unsigned int" -- use "unsigned long long".

-Scott
