Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F38F6C6FA8F
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Aug 2023 07:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PUdD8GbIG6c3djLNzOjU/Sj03+WMq7Sf9J4vnWlhslk=; b=Tj9h60J0YdhS5h
	u/HHtzhmQIsvGHKoIGRLuLZJpOujTOmlWgHtMi6mVkQjjHuzESGxIye3AC5rpWekYdL8XqmKcndZ9
	GGyQq74qNsYqg/vJfHwF5z4z1VETa0pId7Fcldq3QMva/TkbhZiG/JIhkQktOLbni0AZoSEJsMMdC
	SZA/ewaQwO1Hv6SnmxAFDpzXqFEVIhFKf/Y+uVo+u79kf39wzpc6+lhE+8hY1VWmGTEQ52z3e1CRL
	Mc97zWlZ+i54JNNmzTbGl3VPJ9J8E+1Cscj7jyiFMRYiWM349bxJ8R/AY0oXwlPXvEdGesItyU8UH
	WAx9ovrUNVWu1ULiEScA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ5FT-002UFX-0z;
	Thu, 24 Aug 2023 07:59:23 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ5FR-002UEO-0T
	for linux-mtd@lists.infradead.org;
	Thu, 24 Aug 2023 07:59:22 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3ff5ddb4329so3544835e9.0
        for <linux-mtd@lists.infradead.org>; Thu, 24 Aug 2023 00:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692863953; x=1693468753;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TRrvqQ3IZLAdSlE7q0JdmLktMWfLBLUB6iMUFk1H1B0=;
        b=b7awhB3JxPGC1U2utUaUWUoMqd5Gi2fgvsWc4MTD3rdnH9vz9kK4Y8SYb9N2esmkbs
         ms9rCQ+i7pXPHElIaDYezbALOQAC8QgeP3bzI68a/2XUQ8P+QQhBDt+SD2nfoQCdF9bE
         lQz+6bUOgaN85hdZE1ZEHKRI9E5+RaRTVEouHJ9NYWZbhmSysTvUQZy6r7J/wk3RBcvO
         VYI+kBWkxgLzkkbgfTVyQ8bFbHCFFzo9qnmYU0uu+sBHAj1shWZuNqX3CXNuvASBKn3z
         cWuq7X+rJ6euOw8AFyoWHoh0TKPo5k8GIDUa8AztLaAyqikRC4nFXeK+wF7AiBUgHczr
         o5DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692863953; x=1693468753;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TRrvqQ3IZLAdSlE7q0JdmLktMWfLBLUB6iMUFk1H1B0=;
        b=iOnvYOSPXVQCSNJP4duuDM60OE53V1SOvrzDaCqqIiJFbK4hIk1fsVgJ51KgTU/ZtC
         nALoZfYeJ2ap/FsWa2xuCFhgCN5+ijYO6cj3BsOuTtqmQdvWKPlajDsh9kaVGzQwhNGa
         3qFWeQpwLT/KQ0RP1O/BCUTUn4zGOl6sLS9h7DRSsycK9dH3+GG6bOB86mhFPfWoyNVK
         h/qWhr1HiXUU16f4OEgyzuryGkSB9asqAQud3mIDmLhVnMbcY7NtlLl+vx+LtZxlCqwp
         aEr2ScM1O4uNy4i3G0MXC6AQnzzH+BeUIvVg2qZbE4GTaTESAj78MJ7kip9lIVX8TXrT
         wzTg==
X-Gm-Message-State: AOJu0YxM6Lo3AjMTAU5NfjrN1rHVsoXUfmCe8qRgSeIvxzYS3Bm74yvR
	Fvo8JuMOq4+xoCAjUqVHHcS7Pg==
X-Google-Smtp-Source: AGHT+IHpWEv8c9m4s79ebXxyWhXfYXtwG0Bdy7u8GYkIalo4ANdcTW+fEYNeCRHcVdjsYx6LUQi2nw==
X-Received: by 2002:a05:600c:210e:b0:3ff:516b:5c4c with SMTP id u14-20020a05600c210e00b003ff516b5c4cmr3495753wml.18.1692863953436;
        Thu, 24 Aug 2023 00:59:13 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.239])
        by smtp.gmail.com with ESMTPSA id 21-20020a05600c029500b003fe1a96845bsm1834769wmk.2.2023.08.24.00.59.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Aug 2023 00:59:13 -0700 (PDT)
Message-ID: <94b1a5eb-e49c-e19e-a16f-7453930d36ec@linaro.org>
Date: Thu, 24 Aug 2023 08:59:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH v2 03/41] mtd: spi-nor: xilinx: use SPI_NOR_ID() in
 S3AN_INFO()
Content-Language: en-US
To: Michael Walle <mwalle@kernel.org>, Pratyush Yadav <pratyush@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
References: <20230807-mtd-flash-info-db-rework-v2-0-291a0f39f8d8@kernel.org>
 <20230807-mtd-flash-info-db-rework-v2-3-291a0f39f8d8@kernel.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230807-mtd-flash-info-db-rework-v2-3-291a0f39f8d8@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_005921_190076_14AD7397 
X-CRM114-Status: GOOD (  14.87  )
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



On 8/22/23 08:09, Michael Walle wrote:
> In commit 59273180299a ("mtd: spi-nor: Create macros to define chip IDs
> and geometries") SPI_NOR_ID() were introduced, but it did only update
> the INFO() macro in core.h. Also use it in S3AN_INFO().
> 
> Signed-off-by: Michael Walle <mwalle@kernel.org>

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

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
