Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2BBDC28B20
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Apr 2025 12:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rC9EgeabgR7vXnMSXL4n3Gx+5GD8r8Y0vuqdFxSZgAU=; b=YhZWEHQ6dIqjnd
	uKKR1GFLAFRDaVfve/Mver8Ax4AWRok2CQUUu2mUgmKv3UK4IjDzXE+xi+47DbRyv1YhxScR01/RI
	zOHXBphJqK0prPuw198q85of+PncaejCpsCLmALbmDWd7xJcWidjy6YkwCSaGlzJhhYCZWvewIk/j
	oUvpZ7G0UGhocuiBDBz2WVHb/gYG+287H5HhT0VV9HRbLmmkdJ5QNhF1nc5VUQUj/ZPLIey4ogGoV
	U/ctvuxtmOsmQTKOYboNwm37et6NdWAtirdqv6MKfET225hmNvVtK5ouYEcjwZL3VF0f2ljZSwQr2
	YWK/vlPRL8GsfBc21Ocg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzwqJ-000000061B9-0FUJ;
	Wed, 02 Apr 2025 12:05:15 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzwqG-000000061AB-2cgY
	for linux-mtd@lists.infradead.org;
	Wed, 02 Apr 2025 12:05:13 +0000
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-7c5b2472969so655296185a.1
        for <linux-mtd@lists.infradead.org>; Wed, 02 Apr 2025 05:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743595511; x=1744200311; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bkTi7Bcj38WU+Rd3hReHr6Wh69RvlQ9bdv7n2XEkdhI=;
        b=k1XOt/c8zop68Yl33WxMDiIa4uGWJvfL9fRsbN42WanwpDi1z5hfwTAWhv/OC3oQi9
         Au/UMAaqa/kNnQfk3qrpwAGZ6pTD8pb/hj3Zwmib/TJifVTXi/ICVOQAUNM6Yb8YxLtA
         7F39d4lOB5JzuqVtpp5s2KH9ubsV9YSiObZgiKCuMdMEE8vOSxEAXmn3o1G9EmmW+JD/
         5vs65DrrK0xyGAqsD9Gg7nRN6gXUv4/4r1stdPNRW4KjU6b2kgg7luknoxLG9dJbBUfy
         1pVrey1vo5QUpqeOJ5EBsBiBJluPenedlCB0yJZdZSoLFJqU6nsQW1o086pY+nO63M1/
         2kqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743595511; x=1744200311;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bkTi7Bcj38WU+Rd3hReHr6Wh69RvlQ9bdv7n2XEkdhI=;
        b=mPNrZt/ogFXw22F4L6x/uzsEch/vlCUjKH4NjX5eC9Xj76AcNQIFfdVG+JPE+kET3y
         j+tEUs/EijJMO4nCZl7kF2jFT1GQaZX7vg+UMVnpEDICbOBIyZ3+y4V1eqK0BejnHWAd
         j2+sIEJdW/dz8y9BDFfaHkr46T7AnVBmCCZ8hFW46pE9QYvF4H7CEHCCyNI5XjBp0K6V
         SuDf4UwvqoP1ekaSeWe4meE3Obgtxyp8Z+wiHnuxgV+JISqxKPJ/FRnLsCCvymOaC9ik
         4oSbkhuLI+1nyWNsCRmqKElQXIZVLMfhaodMcqrxPc8+6npkMN5gQtkUvy7e720tpXrh
         6hvg==
X-Forwarded-Encrypted: i=1; AJvYcCUZ/5+lGlqK+/PGGEny9/P2yiqm4qHJaX0ndW0ToR0exZuY4C72Q+uzaimQ/O9DG28V/c3vAHYCdkU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3vZHDnf7S3CPpm6bXdqzx1rzjZs6z9dpLaW7wwsCXqNYf8V79
	JppSP/RUUahAjbApf2eRinB81q5ox+de0l//8fRQd5+fYptskdkrJQMTmEkfjhk=
X-Gm-Gg: ASbGncsli97HNTPR6wm4oQUsm7UW/SRVbuOMj+j1KT6OeXwCG5H6r3Oz2SQjguxblBI
	+3WRUPgfRu9Lu2UaBkJrUMMfwP+1ZRHT39l3ZECk9YRCQY1k8A9lnNnU0oBxXqpDhBCSQP98KPm
	jWRmAhK3XHIRuxtA7h4UHIKYJaf+L4dsnXxxvh9vdckzdOoY4afpjXzMv3/94TiVRbRDIY6+jcs
	J6Y1z+zR3ZBqo4lPrXYyiAxiH6V/JKXKPhgOWKLIPdaDYqvAvhdcMmWeo7DZ7yA6CWvu8tZo7L1
	yGX2igni4xU5i8ugsGabGVZwk6iHQN9h7jKemLOPgLVO9oX2D6/EpA==
X-Google-Smtp-Source: AGHT+IGZ+TKjPjyzpfLvNQqi7skImvMdilaWdCsfXLZWph14f22OHARyD1wKqUPvDzE7YHLPRIWcKg==
X-Received: by 2002:a05:620a:4407:b0:7c5:962b:e87c with SMTP id af79cd13be357-7c7664d7c44mr309610985a.44.1743595511400;
        Wed, 02 Apr 2025 05:05:11 -0700 (PDT)
Received: from [192.168.0.14] ([79.115.63.146])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c5f7765150sm776116585a.81.2025.04.02.05.05.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 05:05:10 -0700 (PDT)
Message-ID: <e8c9891d-cd30-473c-837a-8243f20379ba@linaro.org>
Date: Wed, 2 Apr 2025 13:05:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] mtd: spi-nor: macronix: Remove duplicate flash info
 entries
To: Cheng Ming Lin <linchengming884@gmail.com>, pratyush@kernel.org,
 mwalle@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: alvinzhou@mxic.com.tw, leoyu@mxic.com.tw,
 Cheng Ming Lin <chengminglin@mxic.com.tw>
References: <20250402085129.1027670-1-linchengming884@gmail.com>
 <20250402085129.1027670-3-linchengming884@gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250402085129.1027670-3-linchengming884@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_050512_671023_102E3F9E 
X-CRM114-Status: GOOD (  13.87  )
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



On 4/2/25 9:51 AM, Cheng Ming Lin wrote:
> From: Cheng Ming Lin <chengminglin@mxic.com.tw>
> 
> To clean up the code and reduce duplication, this entry is removed.
> 
> Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  drivers/mtd/spi-nor/macronix.c | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
> index 2acd8e28d1c4..07e0bd0b70a0 100644
> --- a/drivers/mtd/spi-nor/macronix.c
> +++ b/drivers/mtd/spi-nor/macronix.c
> @@ -160,13 +160,6 @@ static const struct flash_info macronix_nor_parts[] = {
>  		/* MX25U51245G */
>  		.id = SNOR_ID(0xc2, 0x25, 0x3a),
>  		.fixups = &macronix_qpp4b_fixups,
> -	}, {
> -		.id = SNOR_ID(0xc2, 0x25, 0x3a),
> -		.name = "mx66u51235f",
> -		.size = SZ_64M,
> -		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
> -		.fixup_flags = SPI_NOR_4B_OPCODES,
> -		.fixups = &macronix_qpp4b_fixups,
>  	}, {
>  		/* MX66U1G45G */
>  		.id = SNOR_ID(0xc2, 0x25, 0x3b),


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
