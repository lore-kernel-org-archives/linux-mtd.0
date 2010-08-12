Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OjVmZ-0005cY-4q
	for linux-mtd@lists.infradead.org; Thu, 12 Aug 2010 11:17:12 +0000
Received: by bwz14 with SMTP id 14so146741bwz.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 12 Aug 2010 04:17:08 -0700 (PDT)
Date: Thu, 12 Aug 2010 15:17:05 +0400
From: Anton Vorontsov <cbouatmailru@gmail.com>
To: Dan Carpenter <error27@gmail.com>
Subject: Re: [patch 2/2] mtd/m25p80: fix test for end of loop
Message-ID: <20100812111705.GA9966@oksana.dev.rtsoft.ru>
References: <20100812075827.GO645@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20100812075827.GO645@bicker>
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	Mike Frysinger <vapier@gentoo.org>, kernel-janitors@vger.kernel.org,
	Gabor Juhos <juhosg@openwrt.org>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Aug 12, 2010 at 09:58:27AM +0200, Dan Carpenter wrote:
> "plat_id" is always non-NULL here.  There is a zero element on the end
> of the m25p_ids[] array and if we hit the end of the loop then plat_id
> points to that.
> 
> This would lead to a NULL pointer dereference later on in the function.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Acked-by: Anton Vorontsov <cbouatmailru@gmail.com>

Thanks,

> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index 83c9086..6f512b5 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -793,7 +793,7 @@ static int __devinit m25p_probe(struct spi_device *spi)
>  			break;
>  		}
>  
> -		if (plat_id)
> +		if (i < ARRAY_SIZE(m25p_ids) - 1)
>  			id = plat_id;
>  		else
>  			dev_warn(&spi->dev, "unrecognized id %s\n", data->type);

-- 
Anton Vorontsov
email: cbouatmailru@gmail.com
irc://irc.freenode.net/bd2
