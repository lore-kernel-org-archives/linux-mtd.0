Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60C1FC6FA99
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Mar 2023 13:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8vwPmlqQu9EdbSaLxUBOLDbAKeWeJMQQp6VbWuxjpkk=; b=Ztq4RFhml3hoQvgb1e59IHTKhG
	OUdMDOePvwHU7O7OgAoGV+EfVkO76/JXSorsZ20GsnfYt3LckdNZ8EawUUyP7i91xdXg7sbfgEP2c
	XsV+K3dO9+a9t12/QuJ2G8PEkIj45Ca4T2D/roIrcPtwm32hMGNZpXPbugb7REOebMFnHI9NW/sb4
	XeNPR8EW4ID0KVnFTPJ+wGcmmN4iyxstq0yLglFo0JjjnvbLIC3AjGqWQ4zQYMIvdTxt1icJNQVk+
	ohYc3nYfkhUPPeQcv+X81UroMHKKUApxTT9shMt3Guw0BG4BrcsFTaXGyTumSaJ/HM6o5xbNmBmWy
	P5maPR4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZAc1-00Cp3v-CL; Mon, 06 Mar 2023 13:10:45 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZAbg-00CoyH-Lg
	for linux-mtd@lists.infradead.org; Mon, 06 Mar 2023 13:10:43 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 5AED0100;
	Mon,  6 Mar 2023 14:10:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1678108222;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m7e+OX1FjG1oLDQmgqdErP2Xdqhpdb5ywqFAubBxipQ=;
	b=V5Ri+jVIXbiZp7mRq+g+lgRvp7rblrZEF2yjdgDJIVFOcGWNt/vvNs3mXSZiCn0MKyO2GR
	pL0bX1hT7rJG1ROWeyS+ME6q+xn6yVY720e+6a/7SSjWNA9VJbaIRlRkYzbhNyrNd/Rrqk
	Ee7chMOzH5YRQE1itTiye/Vsk+i2vtBQ6qi9hT16dWpgWMgQg/LwsG4fvAzHdMsWocQGGO
	9JK4UBrbyoujftD6HDRpJZvg6Y2IjdOrlBhfbebvSsYZvZyFvIub3XBInM4PJa6NPOfVab
	6WrvDmD3KL3ork8JzNPdyz2PUIcA54lD7crBJgvNBDT32qxEU3XuUzdC5HYOUQ==
MIME-Version: 1.0
Date: Mon, 06 Mar 2023 14:10:22 +0100
From: Michael Walle <michael@walle.cc>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav
 <pratyush@kernel.org>, linux-mtd@lists.infradead.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] mtd: Avoid printing error messages on probe deferrals
In-Reply-To: <20230301152440.531465-1-miquel.raynal@bootlin.com>
References: <20230301152440.531465-1-miquel.raynal@bootlin.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <7a9d652112b2619e3aaa4afd0e24d0ce@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_051035_437312_5B2EA7A7 
X-CRM114-Status: GOOD (  18.54  )
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

Am 2023-03-01 16:24, schrieb Miquel Raynal:
> There is no reason to complain about probe errors in case of deferrals.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/mtdcore.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index 0feacb9fbdac..d163c690750a 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -518,6 +518,7 @@ static int mtd_nvmem_add(struct mtd_info *mtd)
>  {
>  	struct device_node *node = mtd_get_of_node(mtd);
>  	struct nvmem_config config = {};
> +	int ret;
> 
>  	config.id = -1;

just noticed that magic value. If you care replace it with 
NVMEM_DEVID_NONE.

>  	config.dev = &mtd->dev;
> @@ -535,12 +536,15 @@ static int mtd_nvmem_add(struct mtd_info *mtd)
> 
>  	mtd->nvmem = nvmem_register(&config);
>  	if (IS_ERR(mtd->nvmem)) {
> +		ret = PTR_ERR(mtd->nvmem);
>  		/* Just ignore if there is no NVMEM support in the kernel */
> -		if (PTR_ERR(mtd->nvmem) == -EOPNOTSUPP) {
> +		if (ret == -EOPNOTSUPP) {
>  			mtd->nvmem = NULL;
>  		} else {
> -			dev_err(&mtd->dev, "Failed to register NVMEM device\n");
> -			return PTR_ERR(mtd->nvmem);
> +			if (ret != -EPROBE_DEFER)

Since you have a proper "struct device" to operate on, you can also use
dev_err_probe() which the same but also save the reason for the 
deferral.

-michael

> +				dev_err(&mtd->dev,
> +					"Failed to register NVMEM device (%d)\n", ret);
> +			return ret;
>  		}
>  	}

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
