Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB0C5CCFA03
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Nov 2025 16:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N7qhuaNCJec1wj+Qig6GmZn/ulBmM90h1HKzNXJ6mCU=; b=Vad1twVSkrIw+I
	izLkRY4PolhQZ/6fn0VkxYW7w3PB1vsDYgDaF0jdIXQjuJTAUTXFOcehGi3/7lgI5PYoiVyyUhXzU
	fKHQo/r+k6tLSdmS0tYBJUMVq99cFaSN7/Ziw09gvhb1Vid7xKm7tdvXQ7k5+Uzqe+By3aH39J29M
	f6ZjSWhUHVZuCq9GIJdGXl0kJI6mq91V/Yu1rHohCAMt0RYeZKKaNUqtQQkf3HDLCt7Ms7Qvd77/X
	gaL0SUcb8C2U/6P72JKSffaxmf80JiyzVABtkDQJUPOMdspVmOrjK+UzirqZzhLyZFoV/wV4VTlOx
	+2fV+8/EirG4b+LBEQbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFxJa-0000000AFkP-053d;
	Mon, 03 Nov 2025 16:21:54 +0000
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFxJX-0000000AFje-1Zfx;
	Mon, 03 Nov 2025 16:21:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1762186908; bh=/VbFNPsAjPx/Ya9C7TeCbLeOU9I9kKRA46UQ/FZCv0g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LYVLh+u39IoJPjE7h4ucaYQtPP5UtRleC7wsXbxDs/X8oXA49K2AMexgppGuxcVvF
	 if3KHi0zHKd8bAZ9yZ7NoeczEN6uD5hYVBctF37oy77JA93Jkca8pH4norti5ZwKJr
	 vAUiq3u3R05G3bmL1u0SKLg9BsbzNbyxA9Yb6XLF79LNksnF7J8/kLqqOYvUCENuR6
	 M5UGa5XuJ3yxFeJFzpT+GJZKakaXsKHFo0m+sQkimO2AmFEa6f/HmXAJJFGvcsipNc
	 vQlY0D9sNNOSxsY6WfXdXg612H8Rfsbr3Io0TxmicLIuPmtiWXrzKZ3dZAq7CCI1r1
	 F30zLfWbo6SDw==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 241B13DE8CC;
	Mon,  3 Nov 2025 16:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1762186908; bh=/VbFNPsAjPx/Ya9C7TeCbLeOU9I9kKRA46UQ/FZCv0g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LYVLh+u39IoJPjE7h4ucaYQtPP5UtRleC7wsXbxDs/X8oXA49K2AMexgppGuxcVvF
	 if3KHi0zHKd8bAZ9yZ7NoeczEN6uD5hYVBctF37oy77JA93Jkca8pH4norti5ZwKJr
	 vAUiq3u3R05G3bmL1u0SKLg9BsbzNbyxA9Yb6XLF79LNksnF7J8/kLqqOYvUCENuR6
	 M5UGa5XuJ3yxFeJFzpT+GJZKakaXsKHFo0m+sQkimO2AmFEa6f/HmXAJJFGvcsipNc
	 vQlY0D9sNNOSxsY6WfXdXg612H8Rfsbr3Io0TxmicLIuPmtiWXrzKZ3dZAq7CCI1r1
	 F30zLfWbo6SDw==
Received: from [172.20.4.186] (unknown [185.60.252.187])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mleia.com (Postfix) with ESMTPSA id D514A3DE66A;
	Mon,  3 Nov 2025 16:21:47 +0000 (UTC)
Message-ID: <57f7989d-6f05-4b1b-a31b-4b1dca308ffb@mleia.com>
Date: Mon, 3 Nov 2025 18:21:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: rawnand: lpc32xx_slc: fix GPIO descriptor leak on
 probe error and remove
To: Haotian Zhang <vulab@iscas.ac.cn>, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, piotr.wojtaszczyk@timesys.com
Cc: dmitry.torokhov@gmail.com, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251028094747.1089-1-vulab@iscas.ac.cn>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <20251028094747.1089-1-vulab@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20251103_162148_170040_1F9A61DE 
X-CRM114-Status: GOOD (  17.85  )
/bin/ln: failed to access 'reaver_cache/texts/20251103_162148_170040_1F9A61DE': No such file or directory
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_162148_170040_1F9A61DE 
X-CRM114-Status: GOOD (  18.38  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 10/28/25 11:47, Haotian Zhang wrote:
> The driver calls gpiod_get_optional() in the probe function but
> never calls gpiod_put() in the remove function or in the probe
> error path. This leads to a GPIO descriptor resource leak.
> The lpc32xx_mlc.c driver in the same directory handles this
> correctly by calling gpiod_put() on both paths.
> 
> Add gpiod_put() in the remove function and in the probe error path
> to fix the resource leak.
> 
> Fixes: 6b923db2867c ("mtd: rawnand: lpc32xx_slc: switch to using gpiod API")
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>

The problem is well identified, thank you for the fix.

> ---
>   drivers/mtd/nand/raw/lpc32xx_slc.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/mtd/nand/raw/lpc32xx_slc.c b/drivers/mtd/nand/raw/lpc32xx_slc.c
> index b54d76547ffb..fea3705a2138 100644
> --- a/drivers/mtd/nand/raw/lpc32xx_slc.c
> +++ b/drivers/mtd/nand/raw/lpc32xx_slc.c
> @@ -937,6 +937,7 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
>   	dma_release_channel(host->dma_chan);
>   enable_wp:
>   	lpc32xx_wp_enable(host);
> +	gpiod_put(host->wp_gpio);
>   
>   	return res;
>   }
> @@ -962,6 +963,7 @@ static void lpc32xx_nand_remove(struct platform_device *pdev)
>   	writel(tmp, SLC_CTRL(host->io_base));
>   
>   	lpc32xx_wp_enable(host);
> +	gpiod_put(host->wp_gpio);
>   }
>   
>   static int lpc32xx_nand_resume(struct platform_device *pdev)

The fix can be greatly improved though, I kindly ask you to send v2 by switching
from gpiod_get_optional() to resource managed devm_gpiod_get_optional().

Thank you in advance.

-- 
Best wishes,
Vladimir

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
