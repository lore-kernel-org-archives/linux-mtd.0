Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AC7FC433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 26 May 2022 16:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HYGGLFKdIU6/nw2jH8ePltUpWNNTRNdwRYDHXFGWAOU=; b=Siuy0D7zwPrGr/
	RwwbVb/WMdsIVIVYyOLQRxUw7fheYn6rb6Kijyir5tiZljLuiQq/6PeGWSC0g3hUD1U/V+A8aSYuJ
	E3zOKnbN4+rkhPMPey9wlJY2Qtv2KfG8aLrleJ16fEjst2+FiVKXcXe5fKI9UNS2KtfIGVh9GaCd7
	U4qOqOPRe4qXeaTGlHAlU1+ttnsCtlweRJRsvtDa04YpY47hzrO3Aa/27st1ckoTbWRvqGIsU3T6p
	NFEcH5cunfIHgZOuNQiaJ1qNBS7lin4eKdh2uk9jibbWvoZ0BIoqlseXiUiNvm8h8YfdBaZYXudGS
	+8b1PcAt+d3cWo/3z3GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuGLB-00FP13-KH; Thu, 26 May 2022 16:28:01 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuGKw-00FOyM-O1
	for linux-mtd@lists.infradead.org; Thu, 26 May 2022 16:27:50 +0000
Received: by mail-pl1-x629.google.com with SMTP id n8so1872619plh.1
        for <linux-mtd@lists.infradead.org>; Thu, 26 May 2022 09:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=4vutIBHqxzPtRizpru9FIl4V8pZQd9bQbIhzf9Wl6YM=;
        b=fYIUii+ilJ6xYpJ/aW7FWU4cHzVZhJ8tF7CN/IwV+ecrBavxUSQQmuxvcSMjL8U44x
         6iTAlBS0cN5hnPjmUPOQ00jVxY3DvWF7Q1tgpZfPecxbsGAPvss7VFtwcUxvsY/CCFP8
         MNGkHYNq9RQNdtiYWoWygRrZQKj+DuPAs+mA8b2Vr5QYSYJ+ItH65JCWkewhQ54JWhIl
         SpNdnhSy7WqZbPBldKQaDf6gYtVJXIylFYmWgVw7BrlpDsVfNNDBWlew3a2+ZoTM4rSH
         Gm9Rn7/5LA7G8yquhdsNw2RzlGViPAQWVT/5hWQIHshikVeBCWobCqmIqJvpvDjkdh3d
         jLKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=4vutIBHqxzPtRizpru9FIl4V8pZQd9bQbIhzf9Wl6YM=;
        b=tXVpPOeGrNuhqLXuAl7AAC6R2jyGEJFvL7bNFoGAKkEiXWEE0z/rmewdnWXCi/PSwb
         RMHldP/UAFniRTWGjPdCiIV1KVF2OJaETVKMDJoj6T0EFOCncnjVqeKmr4tusgAQRAin
         rni22LvheT16l5bzAkj689w0iVMGmtccCu/CKQTeL7uW1Ainj3g/looPOgWO3espT8Vv
         PivT3N+ohSs9IHvsVRmFdB7kgelr8TagKcLpLnYElju7K7MhD4K9dd7tM9tOVdWBxk5c
         B7fuNv/+6nwCVK2WsP15PNjez36/DAq2350VAGLj3yoMxL/B6c3aTHXUUsF6PLItSoDe
         IKDw==
X-Gm-Message-State: AOAM531ezqH2swqTM5e6znqwjw/6PA/CAwDLfT2DsDko6u990druI/Tb
	urMt6vgVEucve0NFsy4/M77rTA==
X-Google-Smtp-Source: ABdhPJxDqS/Z3pSXV5Ra/3fFBt04uf3IzrKccw9F+aLXlXccc6U1sN8lO/y6czwPUNvcJgeJcgf6AQ==
X-Received: by 2002:a17:902:a413:b0:156:15b:524a with SMTP id p19-20020a170902a41300b00156015b524amr38615941plq.106.1653582464964;
        Thu, 26 May 2022 09:27:44 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.gmail.com with ESMTPSA id x1-20020a633101000000b003f60a8d7dadsm1733424pgx.15.2022.05.26.09.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 09:27:44 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Liang Yang <liang.yang@amlogic.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: Liang Yang <liang.yang@amlogic.com>, Rob Herring <robh+dt@kernel.org>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Jianxin Pan
 <jianxin.pan@amlogic.com>, Victor Wan <victor.wan@amlogic.com>, XianWei
 Zhao <xianwei.zhao@amlogic.com>, Kelvin Zhang <kelvin.zhang@amlogic.com>,
 BiChao Zheng <bichao.zheng@amlogic.com>, YongHui
 Yu <yonghui.yu@amlogic.com>, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/4] mtd: rawnand: meson: refine resource getting in
 probe
In-Reply-To: <20220513123404.48513-4-liang.yang@amlogic.com>
References: <20220513123404.48513-1-liang.yang@amlogic.com>
 <20220513123404.48513-4-liang.yang@amlogic.com>
Date: Thu, 26 May 2022 09:27:43 -0700
Message-ID: <7hzgj48dj4.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220526_092746_790461_F8EB049F 
X-CRM114-Status: GOOD (  15.98  )
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

Liang Yang <liang.yang@amlogic.com> writes:

> Signed-off-by: Liang Yang <liang.yang@amlogic.com>

Patch should have a changelog.

Reviewed-by: Kevin Hilman <khilman@baylibre.com>

> ---
>  drivers/mtd/nand/raw/meson_nand.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
> index cc93667a1e7f..6e50387475bb 100644
> --- a/drivers/mtd/nand/raw/meson_nand.c
> +++ b/drivers/mtd/nand/raw/meson_nand.c
> @@ -1378,7 +1378,6 @@ static int meson_nfc_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct meson_nfc *nfc;
> -	struct resource *res;
>  	int ret, irq;
>  
>  	nfc = devm_kzalloc(dev, sizeof(*nfc), GFP_KERNEL);
> @@ -1395,8 +1394,7 @@ static int meson_nfc_probe(struct platform_device *pdev)
>  
>  	nfc->dev = dev;
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	nfc->reg_base = devm_ioremap_resource(dev, res);
> +	nfc->reg_base = devm_platform_ioremap_resource_byname(pdev, "nfc");
>  	if (IS_ERR(nfc->reg_base))
>  		return PTR_ERR(nfc->reg_base);
>  
> -- 
> 2.34.1
>
>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
