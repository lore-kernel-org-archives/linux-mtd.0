Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37735C32793
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Jan 2023 07:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W1rgmZhuTusk15Gkaz7GCgu/oT8ej2lhOKrVPdMyeds=; b=1fodAw2Fc0Sxb0
	s28dVubMxDF6/9tMELyE0bQGdVievMfBwn7kTLNIgLsvsmnyKuipANGVz9OZc7oO7PI/+O04bjRm7
	+1njy63zZen3pq0DaCRy8JVGpR7+fQQTwQDmONRhRzSN0Z30n02Rb4L9NjLGVncyLrxneDqwVpypK
	OcwW+g6xO3jb8tyV9DyAW7cDEPWu7llwt2A4QBelto2HpD4HLHAFzy4pvKMzUsM1LRkjnot8fXIaE
	AVKn4J2dFbMiBNEjCd1iM7bDhg1AjcLwM4JZosgf3eLaH4VuIKR/OHaMK2IGSTLohC1PKbEl6Up5a
	cDF0zpWcS0ctCgL/yNwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI32j-00HHQp-I2; Wed, 18 Jan 2023 07:39:33 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI2xw-00HFNV-Qu
	for linux-mtd@lists.infradead.org; Wed, 18 Jan 2023 07:34:38 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 7-20020a17090a098700b002298931e366so1313195pjo.2
        for <linux-mtd@lists.infradead.org>; Tue, 17 Jan 2023 23:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9wbILlnDvL3M1wKEovzOwMxQbxbvumT2vGqmnM40UCM=;
        b=UKDnmgmuA6suxkwABCL1M9rykIcFf6DQK/PwSgOW/M8e18QIjmvGqwFdrTpbkOPAvM
         fRw1QieJwaWHHw6ZRcW1otxISQSuLNgIwU0heg0+f9Fs025Rrq1YpwTpFcTPRon5mSzt
         i3f474XfPfi0ggcrNsfrlYfay6bpio4QLyYXpmcxnPSnwU8bcWYpoD74aaOpWHrK2o1t
         kde5E9mLxpDm2GoxRzqqLjIA+7cIcsL+8ArEDd4Em6Ub4iWoVSY2mjo58ZWEa8UFOQ/p
         c4Arojwod0Y+rL4gyo0bUm8MSoisj4gb1y18vTublhCaLbOwVmwhKHHXsgb/TZdn5Fqe
         PbKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9wbILlnDvL3M1wKEovzOwMxQbxbvumT2vGqmnM40UCM=;
        b=wpYzuObjV5FExVgzhMYHuSfbQF0QfdZBGHPkDl41a+HxMThnpzAwwsbqdEy/DNDL/f
         7nndo8OjY+hGYz9aQA8p3iYI1wCn2kXL4CivBCTQV/Q15JYb+8qqtH0qCmXwmJBoE7i7
         FxOCeL7Do0nmwJqHt1wYIkk/CkNb/Mzplu1ef4liX+nTBMlba92dlu1sgevRrIv5BTMn
         KzkvNm6TRk+vWPLjdlwCS8yyh+0Omi69mvnVcm4gMqjP1baQYsSsA+aV5iDVhxL8ISQL
         Rge9S79MYgLmxkZFxJpSVgsnzs5MZYIjuV62NjdYLTHYioTUA8LNls91/odQMQ7mwNXm
         mk5A==
X-Gm-Message-State: AFqh2koYejuXcPUNU5XW0cizrwR5TMUeJiHMc2KSdRDwe+qAPxZf4DAc
	pagxmRzd3oknU3zhgWdyb3s=
X-Google-Smtp-Source: AMrXdXuzWG1b/rb+Ewq4s4Y6XmcrE57FMXK2Xy9ueeGFYtf4TE3LKaIdZ4VsHZ/F81XltYfninD7Ng==
X-Received: by 2002:a17:902:e04c:b0:194:a706:49c9 with SMTP id x12-20020a170902e04c00b00194a70649c9mr4970365plx.9.1674027275052;
        Tue, 17 Jan 2023 23:34:35 -0800 (PST)
Received: from [192.168.0.10] (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id v11-20020a170902f0cb00b00180033438a0sm22440927pla.106.2023.01.17.23.34.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jan 2023 23:34:34 -0800 (PST)
Message-ID: <30f99da3-6da7-e732-df5b-e8d61c4cde93@gmail.com>
Date: Wed, 18 Jan 2023 16:34:31 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/2] mtd: spi-nor: spansion: Consider reserved bits in
 CFR5 register
Content-Language: en-US
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Takahiro.Kuwano@infineon.com
Cc: linux-mtd@lists.infradead.org, pratyush@kernel.org, michael@walle.cc,
 miquel.raynal@bootlin.com, richard@nod.at, Bacem.Daassi@infineon.com,
 stable@vger.kernel.org
References: <493d9a10-aaf3-70f6-36c3-9a2cf39f0759@linaro.org>
 <20230110164703.83413-1-tudor.ambarus@linaro.org>
From: Takahiro Kuwano <tkuw584924@gmail.com>
In-Reply-To: <20230110164703.83413-1-tudor.ambarus@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_233436_913680_DBCC3594 
X-CRM114-Status: GOOD (  13.18  )
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

On 1/11/2023 1:47 AM, Tudor Ambarus wrote:
> CFR5[6] is reserved bit and must be always 1. Set it to comply with flash
> requirements. While fixing SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_{EN, DS}
> definition, stop using magic numbers and describe the missing bit fields
> in CFR5 register. This is useful for both readability and future possible
> addition of Octal STR mode support.
> 
> Fixes: c3266af101f2 ("mtd: spi-nor: spansion: add support for Cypress Semper flash")
> Cc: stable@vger.kernel.org
> Reported-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  drivers/mtd/spi-nor/spansion.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
> index b621cdfd506f..07fe0f6fdfe3 100644
> --- a/drivers/mtd/spi-nor/spansion.c
> +++ b/drivers/mtd/spi-nor/spansion.c
> @@ -21,8 +21,13 @@
>  #define SPINOR_REG_CYPRESS_CFR3V		0x00800004
>  #define SPINOR_REG_CYPRESS_CFR3V_PGSZ		BIT(4) /* Page size. */
>  #define SPINOR_REG_CYPRESS_CFR5V		0x00800006
> -#define SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_EN	0x3
> -#define SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_DS	0
> +#define SPINOR_REG_CYPRESS_CFR5_BIT6		BIT(6)
> +#define SPINOR_REG_CYPRESS_CFR5_DDR		BIT(1)
> +#define SPINOR_REG_CYPRESS_CFR5_OPI		BIT(0)
> +#define SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_EN				\
> +	(SPINOR_REG_CYPRESS_CFR5_BIT6 |	SPINOR_REG_CYPRESS_CFR5_DDR |	\
> +	 SPINOR_REG_CYPRESS_CFR5_OPI)
> +#define SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_DS	SPINOR_REG_CYPRESS_CFR5_BIT6
>  #define SPINOR_OP_CYPRESS_RD_FAST		0xee
>  
>  /* Cypress SPI NOR flash operations. */

Thank you, Tudor!
I will fix u-boot in the same manner.

Takahiro

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
