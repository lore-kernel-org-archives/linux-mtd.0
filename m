Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6DD1D711CA
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Nov 2024 10:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IhP1gq6hHHVz1MAwdxUgyIlJV/N/s5oNerZaL7l7Kkw=; b=btCbV/YSj9oPfT
	vrMGlg8NjRayOAKlQ/FXpyG4TjONL5WGEuvW1EC9Qj1LkGd8/KZSacnehq0xE6CE2qwCP8R031wob
	oqm420NaOZiOYdq88BdvfdhsdtgjOyHsysyIVOB7Gwv0HHkq4Wxa61PFhbyrbi0jyFJjJCcyZOPS9
	IQHrr67c1Aqx23bQI/yvRJ1W02H8H7bIMDXAzd2IVLlNK3EwT4uf3KE/tmYVgaGPEiQzPObGGHRcm
	Yinii5jUBoPddLPUDu2CVEjg1WaqVv/Z4D9owwk64LS5t/DwWuc16O6H10i/ZyuIlBG8TvpuRVaS5
	X17QH8nw9rLt2rjx7NiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE4Va-0000000HNIM-2cPf;
	Thu, 21 Nov 2024 10:33:58 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tE4VX-0000000HNHu-3FYJ
	for linux-mtd@lists.infradead.org;
	Thu, 21 Nov 2024 10:33:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8C15BA403A6;
	Thu, 21 Nov 2024 10:32:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89D30C4CECC;
	Thu, 21 Nov 2024 10:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732185234;
	bh=sJGGSmvAilmDQmy9p7wUGIrBHdDuzJ4K8Tyz3YhDAew=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hCZZ5iTOhoDys0bnaEXTzWzFUjTiU7V4hbUHgvsFGMm7G+eWtqpysfTh7E3Q9zjg8
	 a8yXZk8yZocJr1cLm50Alddanr3u5wotuQircK8lo8xr5GWPH6PZ/wzcVr3iFobb7D
	 pEse1nfa8UAeZ5lt4mpMatI/b6o56z8aBvY7v/yWg3dqu8tYH3Kpn02Kpgnj949z5Z
	 Ze7TATeb3RGBYum+GzV3gnWupo7FCl7IQrGi/RnSIJfm+L1EUxqdyO8b3DNZKoksnQ
	 SqlWMrIdEBVRLMcnaAVoCTNRBQtFTecL9vvRZjf5HfsHKdLGZ1rYU1cQy2+z5YaRQO
	 v5RSU2fzJu9WQ==
Message-ID: <3a74b938-072e-443c-bf48-d97aff969a17@kernel.org>
Date: Thu, 21 Nov 2024 11:33:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/10] memory: ti-aemif: Export aemif_*_cs_timings()
To: Bastien Curutchet <bastien.curutchet@bootlin.com>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Herve Codina <herve.codina@bootlin.com>,
 Christopher Cordahi <christophercordahi@nanometrics.ca>
References: <20241115132631.264609-1-bastien.curutchet@bootlin.com>
 <20241115132631.264609-7-bastien.curutchet@bootlin.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20241115132631.264609-7-bastien.curutchet@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_023355_962852_AB1C184A 
X-CRM114-Status: GOOD (  16.04  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 15/11/2024 14:26, Bastien Curutchet wrote:
>  	return 0;
>  }
> +EXPORT_SYMBOL(aemif_check_cs_timings);
>  
>  /**
>   * aemif_set_cs_timings - Set the timing configuration of a given chip select.
> @@ -173,7 +158,7 @@ static int aemif_check_cs_timings(struct aemif_cs_timings *timings)
>   *
>   * @return: 0 on success, else negative errno.
>   */
> -static int aemif_set_cs_timings(struct aemif_device *aemif, u8 cs, struct aemif_cs_timings *timings)
> +int aemif_set_cs_timings(struct aemif_device *aemif, u8 cs, struct aemif_cs_timings *timings)
>  {
>  	unsigned int offset;
>  	u32 val, set;
> @@ -195,13 +180,16 @@ static int aemif_set_cs_timings(struct aemif_device *aemif, u8 cs, struct aemif_
>  
>  	offset = A1CR_OFFSET + cs * 4;
>  
> +	mutex_lock(&aemif->config_cs_lock);
>  	val = readl(aemif->base + offset);
>  	val &= ~TIMINGS_MASK;
>  	val |= set;
>  	writel(val, aemif->base + offset);
> +	mutex_unlock(&aemif->config_cs_lock);
>  
>  	return 0;
>  }
> +EXPORT_SYMBOL(aemif_set_cs_timings);


EXPORT_SYMBOL_GPL everywhere, these are quite specific to driver's
internals, so internal implementation.

Also, all of exported functions need to have correct kerneldoc but I
think they don't. At least missing(), so maybe rest also did not conform
to kernel doc style.

>  
>  /**
>   * aemif_calc_rate - calculate timing data.
> @@ -257,10 +245,12 @@ static int aemif_config_abus(struct platform_device *pdev, int csnum)
>  	if (data->enable_ss)
>  		set |= ACR_SSTROBE_MASK;
>  
> +	mutex_lock(&aemif->config_cs_lock);
>  	val = readl(aemif->base + offset);
>  	val &= ~CONFIG_MASK;
>  	val |= set;
>  	writel(val, aemif->base + offset);
> +	mutex_unlock(&aemif->config_cs_lock);
>  
>  	return aemif_set_cs_timings(aemif, data->cs - aemif->cs_offset, &data->timings);
>  }
> @@ -399,6 +389,7 @@ static int aemif_probe(struct platform_device *pdev)
>  	if (IS_ERR(aemif->base))
>  		return PTR_ERR(aemif->base);
>  
> +	mutex_init(&aemif->config_cs_lock);
>  	if (np) {
>  		/*
>  		 * For every controller device node, there is a cs device node
> diff --git a/include/linux/memory/ti-aemif.h b/include/linux/memory/ti-aemif.h
> new file mode 100644
> index 000000000000..0640d30f6321
> --- /dev/null
> +++ b/include/linux/memory/ti-aemif.h
> @@ -0,0 +1,32 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef __TI_AEMIF_H
> +#define __TI_AEMIF_H


Use some longer header guard, e.g. __MEMORY_TI_AEMIF_H

> +
> +/**



Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
