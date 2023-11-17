Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3FBEC197A0
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Nov 2023 09:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gi0XI5oChMWmiTnmdYfAiYWLrPSBoXe2eBP1zchqdZc=; b=2/fyr7FU5z0rMY
	I76VtG8WrzRIrrH0TqHRfcR9WuSbnOXVGE3bI8pM4mM15hatYuQdX49QhVidNaTktR559czv3oOma
	2f10H06s8l/FBBWLj5GJS7EV55BMkoiLNFeCXTKgs9I7Ek5hxbvXpHYEEqswk6NWexByxtH21TFKJ
	/qpYFmcFG0Mt6QxmqtGgw88ma6WTH09HFtCb50huMYvqbbxQ3YIP1pF9E08ZSyz9+a+VIErkZuX72
	CbgpJ8BSZ1pDwLu10TddJAze2RVDq2w2Kbba1CAKVv6QUMirmAgWBhMYfKaucEuvZV1PnW4vQWMRz
	Jx+sDs4meYWMEjYw3FSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3uyg-0062YH-2W;
	Fri, 17 Nov 2023 09:17:30 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3uye-0062WC-0e
	for linux-mtd@lists.infradead.org;
	Fri, 17 Nov 2023 09:17:29 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-9e5dd91b0acso239035566b.1
        for <linux-mtd@lists.infradead.org>; Fri, 17 Nov 2023 01:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700212645; x=1700817445; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aSE+lRnRjGEHS1+ZXygbYQ9vnQXtIsLKZ82nzYXavqI=;
        b=u6kRhMh0waP2ugtNUTydMqUuMCuYJifxt2AFaGPRugaW7zXFmf2O61WnIywPDVh2tT
         p61QS1zVHMGpQ/poZq8bLgZyWhu+1JlTwt9Z1dGxrPVYX7KfaULZYKX+uqgk/M3fKDRx
         DE5c3neVRJJf4WUjjopMtHnpPCSoZRhx7SHrXrwv/cTL4lVvaMkT+V/tkjkX70KBsZP/
         e/plJVzKOxz//0t0NuBj2kShNaEQ6vilcWUJJOBBGwZMdQwTesIfFtP0eHjeKMZA1aOw
         lwr8g3vn9LFflBxX+jyBHsSRl8rZKCypj4DWlfwXXfN11M7v4sHDirU0IEH0xTerKMc8
         vGXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700212645; x=1700817445;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aSE+lRnRjGEHS1+ZXygbYQ9vnQXtIsLKZ82nzYXavqI=;
        b=YaDvehF+eKJ5WEvU1TD7LJUi9Q6SX2D7KxrV7LHBOeWluNBVkn3BmEhfzlTyBfSWqb
         k1A2UTAcfgrSnG3u7UY4J8zPr6gsZR1TRodRHQXN88bSvEcIahYpvmB7HtgGt/cRyvMV
         hcWmvC6mcNSuYIQJbPxUvkCwIyeDTlz8qGB7xIOfJedQWdPab2Ls7Ew5VFKcXE8zZck4
         3u0WRlcbwyoBAMp97sD4jKNx96yqPA6SgUOwA5kvCksBnevzj6TrrhADceA6ps6x7lAR
         yxGywK3PeonmuTc8EBwowlUAZC9B/DBnSSIEois90HMJUl+2S+QBs9HVXjFnI2Un+Gpx
         J1wQ==
X-Gm-Message-State: AOJu0Yxdqn0OrsjGyCznHUOgc8gcLPeEdxmiLb76TYLg9/w/gvOWC6F+
	lyMWf0SH7iNLX+OYSWvEN/MNDg==
X-Google-Smtp-Source: AGHT+IHg9ymNOET+sKVBIE6eXJhZM+9LtjnoPGAhLbadXSe3S5rhtee9EkyjcAV80nWNlQwTLQFRPA==
X-Received: by 2002:a17:906:fc0a:b0:9e0:5d5c:aa81 with SMTP id ov10-20020a170906fc0a00b009e05d5caa81mr14962546ejb.27.1700212644784;
        Fri, 17 Nov 2023 01:17:24 -0800 (PST)
Received: from [192.168.1.111] ([37.251.220.47])
        by smtp.gmail.com with ESMTPSA id f12-20020a1709062c4c00b009ddcfbac9e7sm575831ejh.84.2023.11.17.01.17.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Nov 2023 01:17:24 -0800 (PST)
Message-ID: <694aa042-ab25-44ca-b0fb-8cc95ba537ed@linaro.org>
Date: Fri, 17 Nov 2023 09:17:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/6] spi: spi-mem: Allow specifying the byte order in
 DTR mode
Content-Language: en-US
To: Jaime Liao <jaimeliao.tw@gmail.com>, linux-mtd@lists.infradead.org,
 pratyush@kernel.org, michael@walle.cc, miquel.raynal@bootlin.com
Cc: leoyu@mxic.com.tw, jaimeliao@mxic.com.tw
References: <20231117083853.33329-1-jaimeliao.tw@gmail.com>
 <20231117083853.33329-3-jaimeliao.tw@gmail.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20231117083853.33329-3-jaimeliao.tw@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231117_011728_240942_1FFEA8C8 
X-CRM114-Status: GOOD (  19.39  )
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



On 11/17/23 08:38, Jaime Liao wrote:
> From: JaimeLiao <jaimeliao@mxic.com.tw>
> 
> There are NOR flashes (Macronix) that swap the bytes on a 16-bit
> boundary when configured in Octal DTR mode. The byte order of
> 16-bit words is swapped when read or written in Octal Double
> Transfer Rate (DTR) mode compared to Single Transfer Rate (STR)
> modes. If one writes D0 D1 D2 D3 bytes using 1-1-1 mode, and uses
> 8D-8D-8D SPI mode for reading, it will read back D1 D0 D3 D2.
> Swapping the bytes may introduce some endianness problems. It can
> affect the boot sequence if the entire boot sequence is not handled
> in either 8D-8D-8D mode or 1-1-1 mode. So we must swap the bytes
> back to have the same byte order as in STR modes. Fortunately there
> are controllers that could swap the bytes back at runtime,
> addressing the flash's endiannesses requirements. Provide a way for
> the upper layers to specify the byte order in Octal DTR mode.
> 
> Merge Tudor's patch and add modifications for suiting newer version
> of Linux kernel.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
> ---
>  drivers/spi/spi-mem.c       | 4 ++++
>  include/linux/spi/spi-mem.h | 6 ++++++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
> index edd7430d4c05..9c03b5617fff 100644
> --- a/drivers/spi/spi-mem.c
> +++ b/drivers/spi/spi-mem.c
> @@ -172,6 +172,10 @@ bool spi_mem_default_supports_op(struct spi_mem *mem,
>  		if (!spi_mem_controller_is_capable(ctlr, dtr))
>  			return false;
>  
> +		if (op->data.dtr_swab16 &&
> +		    !(spi_mem_controller_is_capable(ctlr, dtr_swab16)))
> +			return false;
> +

so if the controller supports swapping back the bytes, then 8d-8d-8d
will be supported, otherwise not. Shall the swap back be user configurable?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
