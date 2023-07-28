Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9520C0015E
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jul 2023 02:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=taj6gGXPI1nqAg0kIK4Rfd2QuvCouyMnjVnsSanYbZc=; b=b5gm/1MjuI8SOj
	89uPseB9mOm+uR9xNWgcrp61vz7uvZOO+vHYMQd4/n2LoYGdv8UfKq7OhsiokrsHz4OFE4d4ydS04
	xd88pIqPIGJCx0d/VoAhdFn/g3Q0HJyThmLcb64X8h7mTpMkpJtsuDvBYnqGK7iJHGdaCBC1vDW2F
	YRKd2dNiN4eRYxr2+jpQ5Fe71FbMNLFwK1jCCLyTC+ZYObcYLo35+9cvSPZg5IsuFIJhC/INAJrOf
	WJ+vrhwJxVR01AH4CFpEcX3DijFyN8MCOaaM66zdinP9K4iEUhxjwM5iwazjQ8yXd0M0+oTZxBN7Z
	K1WD74TxbV5ehE0eNvUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPD2T-001GbD-2L;
	Fri, 28 Jul 2023 02:17:09 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPD2K-001GZB-1c
	for linux-mtd@lists.infradead.org;
	Fri, 28 Jul 2023 02:17:02 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-314172bac25so1560583f8f.3
        for <linux-mtd@lists.infradead.org>; Thu, 27 Jul 2023 19:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690510617; x=1691115417;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FL+Cct8YoSZBnjRSpNiileFI2J9v9RT572FgI2bhH4s=;
        b=hLFSjzjAUAgcVZEdR+uvs/pNXkYb1J3v9PHiLh75GqTAV4MV7UNrz/+tfc/OA9KPDz
         5GotDQYUK8eVDWhR+Vzb+tSnyFhbIvYKLkvabcU5uxnipVwi3nZU/7f3s++LwWcy5IcM
         qMjyX/sn3OIbMUn44QX1bVv+GP4HhsrBy6JsIMHliTpIY6AbyRVRPehrpDfTRSaS0EZh
         LGZxO9H4ZzYLmG3ls2TNY1+VaHgRojtABE8VhjfD1UtGvQk41udV+J+XSIHrN5ZasYN3
         5LmB5vYlRJ+xisB4UNCU5Z38MojpitIUNTUF7aeBagyXxghQRZIsAA53ypFNxrGV4m4o
         sReA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690510617; x=1691115417;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FL+Cct8YoSZBnjRSpNiileFI2J9v9RT572FgI2bhH4s=;
        b=N6t51UOMQAwRL4MdV9oYGnJGp0TtrOIbmmmPomnuwAvi4raqE6UCmXIwxrmeqyoDG3
         lPZw1Kec5JMMGGK6tQm6cJZqcEZRD71GiCCO8/baYUlueOkAeWXANzRgufFVJzrLXPgT
         Q2BTBeDNqino8IXmkzRiKwPJTOvQ0nQLzX86ViFhQHbMZM9orOkI/ogkNkEyGkh64KtM
         trSxfAuExYBR+/ToRAP6m5ia5z1HtNL+lt70rXXknG/q9pCS36m4bNn6FSuiXSQ++qDO
         3DF92hu08k7kiYQq7kpeKuKE2oLe9D23PRjZgNFDHirLHlcme7PaCrZ7H5pnxNMLm1Y8
         nS6w==
X-Gm-Message-State: ABy/qLYu5Lcagp2IID8EcXwgHLfQ2Emw9F9YnEEylXWGRXDTTUrTLAbq
	0+K8ja6yurw33JwXqyqPVUmxxw==
X-Google-Smtp-Source: APBJJlFz0zuPjN3o7fTQJxOTn73qD7YEoPMipx475JurTjXZjW30u4xnCdz3cd7nJHOpUoZoUfzpWw==
X-Received: by 2002:adf:ec0a:0:b0:317:718a:e83f with SMTP id x10-20020adfec0a000000b00317718ae83fmr572822wrn.68.1690510614590;
        Thu, 27 Jul 2023 19:16:54 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.48])
        by smtp.gmail.com with ESMTPSA id y18-20020a5d6212000000b003143c6e09ccsm3551709wru.16.2023.07.27.19.16.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jul 2023 19:16:53 -0700 (PDT)
Message-ID: <5654b89a-161b-701e-415f-74b2368f90f1@linaro.org>
Date: Fri, 28 Jul 2023 03:16:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/8] mtd: rawnand: qcom: Use the BIT() macro
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Md Sadre Alam <quic_mdalam@quicinc.com>,
 Sricharan Ramabadhran <quic_srichara@quicinc.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Pratyush Yadav <pratyush@kernel.org>,
 Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20230716144612.32132-1-miquel.raynal@bootlin.com>
 <20230716144612.32132-2-miquel.raynal@bootlin.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230716144612.32132-2-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_191700_573607_49688B66 
X-CRM114-Status: GOOD (  13.88  )
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



On 7/16/23 15:46, Miquel Raynal wrote:
> Fix the following checkpatch warning:
>     "CHECK: Prefer using the BIT macro"
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  drivers/mtd/nand/raw/qcom_nandc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
> index b1e69d634d4a..023c8b36426b 100644
> --- a/drivers/mtd/nand/raw/qcom_nandc.c
> +++ b/drivers/mtd/nand/raw/qcom_nandc.c
> @@ -123,8 +123,8 @@
>  /* NAND_ERASED_CW_DETECT_CFG bits */
>  #define	ERASED_CW_ECC_MASK		1
>  #define	AUTO_DETECT_RES			0
> -#define	MASK_ECC			(1 << ERASED_CW_ECC_MASK)
> -#define	RESET_ERASED_DET		(1 << AUTO_DETECT_RES)
> +#define	MASK_ECC			BIT(ERASED_CW_ECC_MASK)
> +#define	RESET_ERASED_DET		BIT(AUTO_DETECT_RES)
>  #define	ACTIVE_ERASED_DET		(0 << AUTO_DETECT_RES)
>  #define	CLR_ERASED_PAGE_DET		(RESET_ERASED_DET | MASK_ECC)
>  #define	SET_ERASED_PAGE_DET		(ACTIVE_ERASED_DET | MASK_ECC)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
