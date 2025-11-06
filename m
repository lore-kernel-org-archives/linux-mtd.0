Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FA4CCCFA05
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Nov 2025 14:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vzq2D8kCc2VN5xh1e6cF3v4e5vsbTgi0+p3n/T7uc/s=; b=iXFcR2K2nCPW0y
	MdNuXvi7vWjdwP8bqMGvSaM/X/biJZ/oxcyYahCdUAq9gwxU2UqVuIVpnTk9uc6UYPPkAUXq3jvN1
	BKxmKRFEkuz/TY8oWkduryEJD2Lx3TkR/Q/7KAhli3o0leryTkXEeuz6YgTa/U8PtgJZDWYGaHSWa
	+QCflZTD31ve/PIQXLvjvwAGNEhNOxC7Q4TqEEdGn0wXgMEfhMoVqhcSl/BQMSZfs0edppU+e5Sf/
	QiLFqp7WE3RfXerBy5N6jxhSYME1wl3fUBVgVNo8khe20rmBTb2L8EmqkMMOH8VcuNvEmpxLvYVOR
	oYZdZSBo9+J/ugePwWCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH0rv-0000000Fgju-0JEZ;
	Thu, 06 Nov 2025 14:21:43 +0000
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH0rs-0000000Fgj4-0ill;
	Thu, 06 Nov 2025 14:21:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1762438896; bh=/gqnxohTzecfr3QbwlBSQI2vHR/UDx9rUe02QDDlnhU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=F/zcqDeY83kg2SLHuBCftSmclw4vcyHLyXVgw+Y7RBiJql0PRsiBYHJcMGk+R+v7R
	 B9VHPfVmg3WwLe2seTcARp9tZ72hGRsy0Y1LLmMeYEUQ85jKWkoTk4vgPFtSptH8WM
	 WfXAduWq7dzOr4sqnd6mHdJaUcJ7146u9o05GbG0Vbd4vwqlkAE2wwCEC3cOw4aCgd
	 a3P87Vz3bH7b1W0BOOjgag9stDXSugaIGVcZmmF9atFRU8T93oH83+f9g3OTJQ/v68
	 OFm9BybHFl7SvY21K9qqMXv1l7+q9NDl8HUpMbKehaS5oN3JhRqwa7PuvYp4+7ecsj
	 8DWDfmDlmlP7g==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id B56C73DF743;
	Thu,  6 Nov 2025 14:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1762438896; bh=/gqnxohTzecfr3QbwlBSQI2vHR/UDx9rUe02QDDlnhU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=F/zcqDeY83kg2SLHuBCftSmclw4vcyHLyXVgw+Y7RBiJql0PRsiBYHJcMGk+R+v7R
	 B9VHPfVmg3WwLe2seTcARp9tZ72hGRsy0Y1LLmMeYEUQ85jKWkoTk4vgPFtSptH8WM
	 WfXAduWq7dzOr4sqnd6mHdJaUcJ7146u9o05GbG0Vbd4vwqlkAE2wwCEC3cOw4aCgd
	 a3P87Vz3bH7b1W0BOOjgag9stDXSugaIGVcZmmF9atFRU8T93oH83+f9g3OTJQ/v68
	 OFm9BybHFl7SvY21K9qqMXv1l7+q9NDl8HUpMbKehaS5oN3JhRqwa7PuvYp4+7ecsj
	 8DWDfmDlmlP7g==
Received: from [172.20.148.102] (unknown [87.213.113.147])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mleia.com (Postfix) with ESMTPSA id 5E60B3DF425;
	Thu,  6 Nov 2025 14:21:36 +0000 (UTC)
Message-ID: <8b2197ea-d110-4693-8683-5e8b12860922@mleia.com>
Date: Thu, 6 Nov 2025 16:21:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: rawnand: lpc32xx_slc: Convert to use
 devm_gpiod_get_optional()
To: Haotian Zhang <vulab@iscas.ac.cn>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251104100842.369-1-vulab@iscas.ac.cn>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <20251104100842.369-1-vulab@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20251106_142136_766134_492B555A 
X-CRM114-Status: GOOD (  15.69  )
/bin/ln: failed to access 'reaver_cache/texts/20251106_142136_766134_492B555A': No such file or directory
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_142136_766134_492B555A 
X-CRM114-Status: GOOD (  18.59  )
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

On 11/4/25 12:08, Haotian Zhang wrote:
> The initial fix for a GPIO descriptor leak added manual gpiod_put()
> calls in the error path and remove function.
> 
> This follow-up patch improves upon the fix by switching to the
> resource-managed devm_gpiod_get_optional() API.
> 
> Suggested-by: Vladimir Zapolskiy <vz@mleia.com>
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
> ---
>   drivers/mtd/nand/raw/lpc32xx_slc.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/lpc32xx_slc.c b/drivers/mtd/nand/raw/lpc32xx_slc.c
> index fea3705a2138..3ca30e7dce33 100644
> --- a/drivers/mtd/nand/raw/lpc32xx_slc.c
> +++ b/drivers/mtd/nand/raw/lpc32xx_slc.c
> @@ -854,7 +854,7 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
>   	}
>   
>   	/* Start with WP disabled, if available */
> -	host->wp_gpio = gpiod_get_optional(&pdev->dev, NULL, GPIOD_OUT_LOW);
> +	host->wp_gpio = devm_gpiod_get_optional(&pdev->dev, NULL, GPIOD_OUT_LOW);
>   	res = PTR_ERR_OR_ZERO(host->wp_gpio);
>   	if (res) {
>   		if (res != -EPROBE_DEFER)
> @@ -937,7 +937,6 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
>   	dma_release_channel(host->dma_chan);
>   enable_wp:
>   	lpc32xx_wp_enable(host);
> -	gpiod_put(host->wp_gpio);
>   
>   	return res;
>   }
> @@ -963,7 +962,6 @@ static void lpc32xx_nand_remove(struct platform_device *pdev)
>   	writel(tmp, SLC_CTRL(host->io_base));
>   
>   	lpc32xx_wp_enable(host);
> -	gpiod_put(host->wp_gpio);
>   }
>   
>   static int lpc32xx_nand_resume(struct platform_device *pdev)

Thank you so much for the change!

Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>

-- 
Best wishes,
Vladimir


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
