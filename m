Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g5UaN-0003i0-0E
 for linux-mtd@lists.infradead.org; Thu, 27 Sep 2018 11:36:00 +0000
Date: Thu, 27 Sep 2018 13:35:13 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, Zhouyang Jia <jiazhouyang09@gmail.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org (open list)
Subject: Re: [PATCH v2 3/8] mtd: maps: gpio-addr-flash: Use devm_* functions
Message-ID: <20180927133513.487666f0@bbrezillon>
In-Reply-To: <20180905143643.9871-4-ricardo.ribalda@gmail.com>
References: <20180905143643.9871-1-ricardo.ribalda@gmail.com>
 <20180905143643.9871-4-ricardo.ribalda@gmail.com>
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

On Wed,  5 Sep 2018 16:36:38 +0200
Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com> wrote:
> @@ -234,9 +234,11 @@ static int gpio_flash_probe(struct platform_device *pdev)
>  	state->map.copy_to    = gf_copy_to;
>  	state->map.bankwidth  = pdata->width;
>  	state->map.size       = state->win_size * (1 << state->gpio_count);
> -	state->map.virt       = ioremap_nocache(memory->start, state->win_size);
> -	if (!state->map.virt)
> -		return -ENOMEM;
> +	state->map.virt	      = devm_ioremap_resource(&pdev->dev, memory);
> +	if (IS_ERR(state->map.virt)) {
> +		dev_err(&pdev->dev, "failed to map memory\n");

You can drop this error message, devm_ioremap_resource() already takes
care of that (no need to send a new version, I'll fix it when applying).

> +		return PTR_ERR(state->map.virt);
> +	}
