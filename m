Return-Path: <SRS0=cUeG=NX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38E9EC432BE
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Sep 2021 08:50:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F268860C3E
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Sep 2021 08:50:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F268860C3E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=f6kWAK1+efx3nK0qkqVeP+WsFD9rxkfYvj/+FvKpe3w=; b=L0b/5jVdxZwpnuGfgO9VQeEnZk
	OI5CRQkVajWlK41n1W3L3eCjEMI04vGghH+Fbze8zRV7FZjx3NVzXpD8dBVncX7aIexEcOZDtPIRD
	cbtmAeKZPbLRLFBsbjgO/RAOytMiannW0gGu07/279DBlhZqfi6NR7O2SA1azCXKgEEKFq77R9G/5
	hs0RRBZz2lGOLqyNF4zVB2loQrXEDrh5CrDa3ssndXFYhuqtq/9fEuc+V9pgLuUSqULPCeCZR6GDS
	M3vmXuSfpXk4P3gvUVptL3oWUSmwJgx6GYdUJqsHuEFbyALlgJZc2ON7NwqEHGQ1kdz1TonkpG/2+
	euiPt07Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLLvd-004epY-7r; Wed, 01 Sep 2021 08:49:05 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLLOB-004WTK-6h
 for linux-mtd@lists.infradead.org; Wed, 01 Sep 2021 08:14:33 +0000
Received: by mail-wm1-x32c.google.com with SMTP id
 l7-20020a1c2507000000b002e6be5d86b3so1288147wml.3
 for <linux-mtd@lists.infradead.org>; Wed, 01 Sep 2021 01:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YrKVWBO1f/vW38Nzw0ET7Dtvvx+9TDWUyIhOz8vqs7c=;
 b=i/B3G1QjYGIKPhWb4mR83VZKwR3jlpFDSE4OlAn/5FfTm2eOXa+r91g/pQQzhUDijQ
 cFIcs6CRQwVvdhJ+3kE4FRr6MYWfoJ0qA4NMIBLLgAdM5ckRXIbGikB/WLdyfHQrVfgf
 +WvquCPK7qoc9BfzkWKoIp7tZfdWNBd0CcK3LmXLn0PHXY3cnQ1sTo8E86GHzGxnnZB5
 Q7cThkviMKoosz4L3WVsAtLBWyh9iXnTAQGMjfXhgkLj9KCcbA4YjXuT2+tJNh9kNhPv
 H1zmPrjpA+MX2iIEcz7YiGtJ2gBfykfoUTBvPJjyGoJWFaRsQaHmdv4AxH/sPP0nvSCb
 YVXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=YrKVWBO1f/vW38Nzw0ET7Dtvvx+9TDWUyIhOz8vqs7c=;
 b=QgMauNKJGYsSANHCMAxxJnmQSuG1YnZjGA48Vbjl7WeVedgPyDZPoZ2eolHM0HEvoo
 LW0ZkHdAMT8ZRov535Y2eGkL4VI2FoxESpCiMILdW9j9rT+HIyIxqjoYIpwG6+/u1Xx0
 t4umijmUdK11vwwJ0l+ido2KXXpL4iw1CJMKTiraonzUfWUEwzsw1mgxcqMf5tbNqffs
 UoghI7fVMpzhnGIkZiHY5/3/du46grAAzRcEl5wZiLIULiYdIahkC7UKKSwIcC/Jrv/2
 cywvcVIaVtm4OfkExVCFf3emq1eUTpyfSyhiIKbX258qnYgvgVcCs8ALXT9yKFdKM34B
 egGg==
X-Gm-Message-State: AOAM532NCNhiRW6B3x878oxl6+Rc2T+v+vK6iA7/GwQbm0HunGoFZRUa
 +ZXxewlQCye72vVUemelt6Y+7g==
X-Google-Smtp-Source: ABdhPJy56BIXwV6S+CNtfU74OvWAfHGQFSrCbv//ooL8zb7ycm/Q6XDk7np66gkBwQP0broPCUxdHA==
X-Received: by 2002:a1c:443:: with SMTP id 64mr8358428wme.180.1630484069127;
 Wed, 01 Sep 2021 01:14:29 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:dc57:bccf:6106:11d1?
 ([2001:861:44c0:66c0:dc57:bccf:6106:11d1])
 by smtp.gmail.com with ESMTPSA id o26sm4626093wmc.17.2021.09.01.01.14.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Sep 2021 01:14:28 -0700 (PDT)
Subject: Re: [PATCH] mtd: rawnand: oxnas: Make use of the helper function
 devm_platform_ioremap_resource()
To: Cai Huoqing <caihuoqing@baidu.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-oxnas@groups.io, linux-kernel@vger.kernel.org
References: <20210901074207.9333-1-caihuoqing@baidu.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <61ab65d3-bf52-5701-95d2-476b8c2d719c@baylibre.com>
Date: Wed, 1 Sep 2021 10:14:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210901074207.9333-1-caihuoqing@baidu.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210901_011431_382863_28A4F20E 
X-CRM114-Status: GOOD (  19.36  )
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

On 01/09/2021 09:42, Cai Huoqing wrote:
> Use the devm_platform_ioremap_resource() helper instead of
> calling platform_get_resource() and devm_ioremap_resource()
> separately
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> ---
>  drivers/mtd/nand/raw/oxnas_nand.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/oxnas_nand.c b/drivers/mtd/nand/raw/oxnas_nand.c
> index f44947043e5a..cd112d45e0b5 100644
> --- a/drivers/mtd/nand/raw/oxnas_nand.c
> +++ b/drivers/mtd/nand/raw/oxnas_nand.c
> @@ -79,7 +79,6 @@ static int oxnas_nand_probe(struct platform_device *pdev)
>  	struct oxnas_nand_ctrl *oxnas;
>  	struct nand_chip *chip;
>  	struct mtd_info *mtd;
> -	struct resource *res;
>  	int count = 0;
>  	int err = 0;
>  	int i;
> @@ -92,8 +91,7 @@ static int oxnas_nand_probe(struct platform_device *pdev)
>  
>  	nand_controller_init(&oxnas->base);
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	oxnas->io_base = devm_ioremap_resource(&pdev->dev, res);
> +	oxnas->io_base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(oxnas->io_base))
>  		return PTR_ERR(oxnas->io_base);
>  
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
