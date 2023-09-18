Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54C30C46CA1
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Sep 2023 05:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wTVct76FxYiR4E4rS2mIkjs1BG9jM+2IriJ4n+8oTlU=; b=zDyV6jU9ja4X3R
	fbgXFcqNGy0Yv6d0ZFsuPOy08GMuNczFXJWJt+9K+tbjyZbf/cECbBdUpaEPj0aP+QRtvFIYgjBbT
	9psHsFiD3M0g6gVcBzV+JrGHeR1un4cNgLdJUOV3uZHb1H4RDwowJrQgsFVrAEQVswpUeHkLxCgP4
	jXilWR0HoTx2FiHCHiay+MR5sfeCsTMxkEis19xCznV+L/jIk0Uqt03OPgunpBQt0Qda8ip/qXyIZ
	5Z0VE6taseOYuxBiPGTul8ApSGuegNSIE/WRo/VVfuSEHFoz+ud4xi+B49H2w4rI1219savYEa+Hg
	aiSm640u2n3YROUCwogA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qi6i9-00ERRQ-21;
	Mon, 18 Sep 2023 05:22:17 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qi6i7-00ERQe-1k
	for linux-mtd@lists.infradead.org;
	Mon, 18 Sep 2023 05:22:16 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-502b1bbe5c3so6763491e87.1
        for <linux-mtd@lists.infradead.org>; Sun, 17 Sep 2023 22:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695014531; x=1695619331; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9xE3jrbcUNNXJHY0aoh5BT2j+82gLvN+aYglDsTpRCQ=;
        b=xVd8Es2DGnYRFFPnz9YNoAwCmZ7Und0DxZHrciZxzp7tYbZ/FQDsIQO5Lv5Fpdsu+F
         Z254G44JqXkmcCaEHyZg30l17hgzo+/PT3tEIbaDjNFe/4vs4y6ZAJLXUmKRAijfjE9j
         NYr7ku4k8fx5R7+GuyLhgtwO9Obx/hRzrAJ3XGPy89sxevE9I7B+4oPFqNanbKkc2Fs9
         jcFQUyf67mUbh5WTRqeINatFrrnLB8Dp3C1AA39djabiXjlbQw78p9Gy7cbdpNLk8NLL
         GEahhVbLOUOtGZKbrHKhxBH+amG+Ws2TKm6dKHsOiQLIGW/72AzqYdJtzSDffvD94S8A
         hzMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695014531; x=1695619331;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9xE3jrbcUNNXJHY0aoh5BT2j+82gLvN+aYglDsTpRCQ=;
        b=YdKy8xdEVL0HxHjEznxPHpRQBJAZldlfX/50KNDyjT1ky/suIFf7Epxys8eZl8w6Xt
         9S6rfKWsLEyPf9vnlzupBRf4u9MObkmW+LvIJLq8rTtTr7OpF9zVmWbmfQGSeFOSqe+s
         xUVpvOVmaqfY0UfZsIuL9xCtmSNiOc06iOawe2RkjjigwRvDyyKbZhh80ykGso8ZcgUV
         Il2WkcLW5sKlalPqsMK+r3Q4qMUSSzFlKxqE/JgakezBw7QYbvMxfjD31SPPTqYW/tu3
         6JbgDK5hgyCVhsTITs7SInLGtjiJy+X+eT90aEvuEBihRxvXzA8yrc0vx52PuUTK9bjb
         ytnw==
X-Gm-Message-State: AOJu0YwNn+FE/oluLc+JIzU5Dt4cgWsRUkY+KpZilUcVdtmjOskU9uTv
	0vhHvexewE2d2B6dKCRl0BAEUA==
X-Google-Smtp-Source: AGHT+IEm0YC9QfvVPPEi5UDAGaF61jNVRufoiKL3DXuon+U6JOSwfO2SAxWy0VL1644C0fxbfdMY2w==
X-Received: by 2002:a19:6446:0:b0:500:b9e3:91bd with SMTP id b6-20020a196446000000b00500b9e391bdmr6252492lfj.41.1695014530768;
        Sun, 17 Sep 2023 22:22:10 -0700 (PDT)
Received: from [172.20.10.8] ([213.233.104.217])
        by smtp.gmail.com with ESMTPSA id cz20-20020a0564021cb400b00530c46e2b32sm2818400edb.34.2023.09.17.22.22.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Sep 2023 22:22:10 -0700 (PDT)
Message-ID: <4319a1e2-a8bf-bb53-fed7-d2cd0beb3458@linaro.org>
Date: Mon, 18 Sep 2023 08:22:08 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v3 03/41] mtd: spi-nor: xilinx: use SPI_NOR_ID() in
 S3AN_INFO()
Content-Language: en-US
To: Michael Walle <mwalle@kernel.org>, Pratyush Yadav <pratyush@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
References: <20230807-mtd-flash-info-db-rework-v3-0-e60548861b10@kernel.org>
 <20230807-mtd-flash-info-db-rework-v3-3-e60548861b10@kernel.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230807-mtd-flash-info-db-rework-v3-3-e60548861b10@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230917_222215_584600_2F4AC87C 
X-CRM114-Status: GOOD (  14.31  )
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



On 08.09.2023 13:16, Michael Walle wrote:
> In commit 59273180299a ("mtd: spi-nor: Create macros to define chip IDs
> and geometries") SPI_NOR_ID() were introduced, but it did only update
				^was. I will update when applying.

> the INFO() macro in core.h. Also use it in S3AN_INFO().
> 
> Signed-off-by: Michael Walle <mwalle@kernel.org>
> Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  drivers/mtd/spi-nor/xilinx.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/xilinx.c b/drivers/mtd/spi-nor/xilinx.c
> index 00d53eae5ee8..de5189c38432 100644
> --- a/drivers/mtd/spi-nor/xilinx.c
> +++ b/drivers/mtd/spi-nor/xilinx.c
> @@ -22,12 +22,7 @@
>  		   SPI_MEM_OP_DATA_IN(1, buf, 0))
>  
>  #define S3AN_INFO(_jedec_id, _n_sectors, _page_size)			\
> -		.id = {							\
> -			((_jedec_id) >> 16) & 0xff,			\
> -			((_jedec_id) >> 8) & 0xff,			\
> -			(_jedec_id) & 0xff				\
> -			},						\
> -		.id_len = 3,						\
> +		SPI_NOR_ID(_jedec_id, 0),				\
>  		.sector_size = (8 * (_page_size)),			\
>  		.n_sectors = (_n_sectors),				\
>  		.page_size = (_page_size),				\
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
