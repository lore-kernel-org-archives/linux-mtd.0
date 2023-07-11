Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 146BCEB64DC
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Jul 2023 18:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UsnkBe8uU/6ABJwS2HVyLemKHt8ocjxGS9r/Vf3VvlM=; b=uVB4Y2e5F+BJLp
	i3V5cEsD1CgcfBq5LFkKEtGPQLDHoSiSFuF+fqnOmT+zDMKrB32ajk4cxduUrO543FDpHXUAECw7i
	l2DOxwoRRvtCqq3F0B8oamfqbRuoqGMQ914nXxcd8m6PlXS9fAajzBStOEGX2KzYGtNfaT3N6FTvF
	GEGeRty7EM20M+QbeCd52LPvu7S00FR2KzGtxjc9m6njgcXyWASYjhQgmbwun+FDVg1CwwHFvPnd5
	LquX9+9sZ9GY6ngYYxYulrSwJlxo8Pr6/eD9TLyMZreKHViOLotQsIitRNbTfRJP6tKwb2iObfI0p
	4HfEOfzKLWMDqKHyJVrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJI10-00FeDy-0V;
	Tue, 11 Jul 2023 18:23:10 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJI0x-00FeDO-2M;
	Tue, 11 Jul 2023 18:23:08 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3fbf1b82d9cso62892545e9.2;
        Tue, 11 Jul 2023 11:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689099786; x=1691691786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E7xPaNuGxjRVce9if/BkLrzBXCRANFyenyUfHAqEJI4=;
        b=qw9DZGtJtiv5SMYXbeSqGBDE2tktVR1mtvGA18xXWNWGPUNx/4O/F7gqNn6XGZiAm7
         M2CL+ZrNoWd1R7k64Mq8q1Xv2i2768qfiNBlh1TH9ZC0jWukI7o42iWHWtMo8rbpX5Fm
         wmIUPZnHXq8KLJfiOyMXFMvNAIK9Zz532+cu5yi0xO9pqjsFHh5IZMF2UqjN6EIyd523
         sUvML+62H3KBwK32NzOSmxkpjMLV2cy4FiEyxUUqK6uivBfTMHgU5mweSxqpXftBfdf+
         yKhaBcTt0nyWcmMZa7kY2Jt7HS0N7rGFaarSg5NAoSvPuNF5ePoR1GrMcSej4rDVqx5w
         FAng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689099786; x=1691691786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E7xPaNuGxjRVce9if/BkLrzBXCRANFyenyUfHAqEJI4=;
        b=jGSIbm4piVc5u/7gHxcoaud+wytEpI7MVSsIzPQboMht4y+nasIg1rwQT+4UgAsIkA
         tFZigC3xNSsnNo/q7IkETx4w9+CpiknMA8sTEAxcXAGCoh8ugqQKN6gsf8105Kbs/nDq
         eo1Y2JnyG0UczO2tRL0hrutOxNHifxMTzZdquV6JYuhvaxo3+E5OtD+bDCn97p+U31kt
         dkyIT3+Pz88iL65XXk1S3G2WGHd/ByJDFt+/mZQTWf0h6yKhxZ+lF8SfY9QBrDoUr9Ex
         WHNqCWXOpj8yHgH99DJFgehNYLs43Oziw3iTZPt8NxVyX0JqHJkOgnXEJq+PMEHlCvV9
         U13A==
X-Gm-Message-State: ABy/qLZSZjyMHU0YgfzMyLLkPKRAiwRfOc5dN7QfjsriTQS3kjepldr1
	3FhD/WPCMvphV/DLY9MIBI4=
X-Google-Smtp-Source: APBJJlHWLKu+Ss4FLYKlJKMc415q932H2IE9tLV4rBu9e7rP9nTkJGw1cSnX8i+/joaCcRGaRo4fJA==
X-Received: by 2002:a5d:4582:0:b0:313:ede8:9f13 with SMTP id p2-20020a5d4582000000b00313ede89f13mr15134045wrq.32.1689099786086;
        Tue, 11 Jul 2023 11:23:06 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id d17-20020adfe891000000b003143cdc5949sm2967568wrm.9.2023.07.11.11.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 11:23:05 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Yangtao Li <frank.li@vivo.com>
Cc: Yangtao Li <frank.li@vivo.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/18] mtd: rawnand: sunxi: Use
 devm_platform_get_and_ioremap_resource()
Date: Tue, 11 Jul 2023 20:23:03 +0200
Message-ID: <2230707.iZASKD2KPV@jernej-laptop>
In-Reply-To: <20230707040622.78174-1-frank.li@vivo.com>
References: <20230707040622.78174-1-frank.li@vivo.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_112307_771852_851ADA48 
X-CRM114-Status: GOOD (  13.79  )
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

Dne petek, 07. julij 2023 ob 06:06:05 CEST je Yangtao Li napisal(a):
> Convert platform_get_resource(), devm_ioremap_resource() to a single
> call to devm_platform_get_and_ioremap_resource(), as this is exactly
> what this function does.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/mtd/nand/raw/sunxi_nand.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/sunxi_nand.c
> b/drivers/mtd/nand/raw/sunxi_nand.c index 9884304634f6..db36bd755b8d 100644
> --- a/drivers/mtd/nand/raw/sunxi_nand.c
> +++ b/drivers/mtd/nand/raw/sunxi_nand.c
> @@ -2087,8 +2087,7 @@ static int sunxi_nfc_probe(struct platform_device
> *pdev) nand_controller_init(&nfc->controller);
>  	INIT_LIST_HEAD(&nfc->chips);
> 
> -	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	nfc->regs = devm_ioremap_resource(dev, r);
> +	nfc->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &r);
>  	if (IS_ERR(nfc->regs))
>  		return PTR_ERR(nfc->regs);





______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
