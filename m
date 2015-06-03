Received: from smtp10.smtpout.orange.fr ([80.12.242.132]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z0EIP-0002CC-PQ
 for linux-mtd@lists.infradead.org; Wed, 03 Jun 2015 19:25:51 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Antoine Tenart <antoine.tenart@free-electrons.com>
Subject: Re: [PATCH 1/7] mtd: pxa3xx_nand: add a non mandatory ECC clock
References: <1433266351-22587-1-git-send-email-antoine.tenart@free-electrons.com>
 <1433266351-22587-2-git-send-email-antoine.tenart@free-electrons.com>
Date: Wed, 03 Jun 2015 21:23:58 +0200
In-Reply-To: <1433266351-22587-2-git-send-email-antoine.tenart@free-electrons.com>
 (Antoine Tenart's message of "Tue, 2 Jun 2015 19:32:25 +0200")
Message-ID: <87bngw61f5.fsf@belgarion.home>
MIME-Version: 1.0
Content-Type: text/plain
Cc: zmxu@marvell.com, boris.brezillon@free-electrons.com,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 ezequiel.garcia@free-electrons.com, jszhang@marvell.com,
 computersforpeace@gmail.com, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org, sebastian.hesselbarth@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Antoine Tenart <antoine.tenart@free-electrons.com> writes:

> Some controllers (as the coming Berlin nand controller) need to enable
> an ECC clock. Add support for this clock in the pxa3xx nand driver, and
> leave it as non mandatory.
> -	info->clk = devm_clk_get(&pdev->dev, NULL);
> +	info->clk = devm_clk_get(&pdev->dev, "nfc");
>  	if (IS_ERR(info->clk)) {
> -		dev_err(&pdev->dev, "failed to get nand clock\n");
> -		return PTR_ERR(info->clk);
> +		info->clk = devm_clk_get(&pdev->dev, NULL);
> +
> +		if (IS_ERR(info->clk)) {
> +			dev_err(&pdev->dev, "failed to get nand clock\n");
> +			return PTR_ERR(info->clk);
> +		}
I suppose this is done to keep the compatibility with existing pxa3xx/berlin
clock code, which was defined without a con_id. More specifically I'm thinking
of the function clk_find().

Now maybe it would be cleaner to keep you "nfc" change, remove the failback plan
with NULL as an con_id, and change the clock providers. I cannot speak for
berlin/others, but for pxa3xx, this is one 3 hunks change in :
 - drivers/clk/pxa/clk-pxa3xx.c

Cheers.

--
Robert
