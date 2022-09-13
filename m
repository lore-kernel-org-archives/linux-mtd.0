Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4258FC6FA82
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Sep 2022 07:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9bORTDlQ8rpMlLvzlBAD5mHVPv3eMfUsWHKUH9/XXqg=; b=SU3+mUdqA6mzF9
	KujPKD9CIihliP5DAR/ig+GnhVeVZrmMs6EzzcZ7sRmPKXoofxjYC3Pyvbv6t22jVjNdkdr4REp60
	dAECF5gwCN4ax4pas5xFto9zObelffF8ypYAiiCkd7D0ziPihKTQE9zkArooeDZs8hxBpuXq1GMTZ
	NA8eaxZ6y/K7oGpK9phRB5/87VcJMrlkk3t5TTvZI5o4cNvHwuRQY8jmTg31agVq0pOaxdr7fWXo8
	oz/79hybXypAA7tVrCZmZUJXHZ/EdR7Kx7MSfLx9sVHfPggOTc0c2A0alcJhkpLRDn7AE8Aqf02ai
	9Hy46/O7bsv6dVA7vA/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY0UE-003eRP-08; Tue, 13 Sep 2022 07:37:38 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY0U2-003eI4-4K
	for linux-mtd@lists.infradead.org; Tue, 13 Sep 2022 07:37:36 +0000
Received: by mail-ej1-x62f.google.com with SMTP id dv25so25403685ejb.12
        for <linux-mtd@lists.infradead.org>; Tue, 13 Sep 2022 00:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date;
        bh=lzCjj4e1n9t9IQqzlLuW7nZyRLt7gzrz/oqLfcOYBJo=;
        b=QAyx8P59UPICELew93zou/RH2Ml+kd2I7MRmcDtbbz5eEhudPk6ezVT+I4rqcvHjzh
         EOALXHwNQ9hS9s0FcwvkO5KKVQX89qNB6JvTFWH6sR1LvndNJdnAIpk3gI0JW5ULodRN
         PSPMEytd8qxx7RNmAAjZFKClYbIMnMg2qEEyjzbofj9QZG1NVKF5rJAT4KqMKjUSqytu
         0t4boLURlDeJeGGqhqx/gvDmt1hUvuIPqYzpimRO3WhY1p4P1RGWWdq+LT9svwh7sSm5
         PlHEcx5TEHIZPx/Vpl9iSWWla9mpXgvV3hqn56VBIcwI7ptul60KYlG4cfLqj3toTz2Q
         51Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date;
        bh=lzCjj4e1n9t9IQqzlLuW7nZyRLt7gzrz/oqLfcOYBJo=;
        b=qAJ5lfICk2hLCnN33fpz6hPvrztwg48GXxgh25bOtf8u24arHe0Ic9QNJ3US6Epeci
         OmH2WVsvrt4bgQeylXKT0517N3tsD5nqM/zNyg864QOVI4UzJpyFplMNGlhYDail50Jy
         8J1TRWeJdrzBcTL6qi9PHHOVZTkL3dY2OHyxBYBksFYHYekKjlmztsZi3dgVdcKwtF9T
         hJmGU0bykGusQCUxNHBBZgbJY/O6Q5h2dbZk3TDEWQLM/le36KpC3n/NxsXQN1YtzEHL
         1BFeIQ/JmmjONTnr+huq8hxf7H9a5D8yQtvUGMxIZkZ4nJoDbZtMdda7Z297b9uVi1yO
         SIgA==
X-Gm-Message-State: ACgBeo36YYp8866DOE3pi/GC/f9gqYCOU5YTjxKdWkzk0sZMAxHCnldR
	+uv579g+nGC+C93XfmTfL8c=
X-Google-Smtp-Source: AA6agR5F+AIP1OradTbq3GgwPQDWo1ENqpICuNDTzLf0vNAx5BDUiZAweHJLerxTyQ+7k7Lsc/IvXg==
X-Received: by 2002:a17:907:6e0b:b0:73d:5850:ca15 with SMTP id sd11-20020a1709076e0b00b0073d5850ca15mr21398115ejc.344.1663054642389;
        Tue, 13 Sep 2022 00:37:22 -0700 (PDT)
Received: from [192.168.26.149] (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.googlemail.com with ESMTPSA id e17-20020a170906249100b00778e3e2830esm191067ejb.9.2022.09.13.00.37.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Sep 2022 00:37:21 -0700 (PDT)
Message-ID: <43059215-aa56-e8c5-53a4-143643058797@gmail.com>
Date: Tue, 13 Sep 2022 09:37:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
Subject: Re: [PATCH 1/1] mtd: mtdpart: Fix cosmetic print
To: Adrian Zaharia <Adrian.Zaharia@windriver.com>,
 linux-mtd@lists.infradead.org
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 jani.nurminen@windriver.com, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20220825060407.335475-1-Adrian.Zaharia@windriver.com>
 <20220825060407.335475-2-Adrian.Zaharia@windriver.com>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <20220825060407.335475-2-Adrian.Zaharia@windriver.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_003726_275097_661C60AF 
X-CRM114-Status: GOOD (  20.06  )
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

On 25.08.2022 08:04, Adrian Zaharia wrote:
> From: Jani Nurminen <jani.nurminen@windriver.com>
> 
> The print of the MTD partitions during boot are off-by-one for the size.
> Fix this and show the real last offset.

I see that PCI subsystem and printk() + %pR do that. Probably more. I
guess it makes sense but I'm also wondering if/how confusing is that
change going to be for users. We did printing like that for probably
dozens of years.


> Fixes: 3d6f657ced2b ("mtd: mtdpart: Fix cosmetic print")

I can't find that hash / commit anywhere. Are you sure it exists?


> Signed-off-by: Jani Nurminen <jani.nurminen@windriver.com>
> Signed-off-by: Adrian Zaharia <Adrian.Zaharia@windriver.com>
> ---
>   drivers/mtd/mtdpart.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
> index d442fa94c872..fab10e6d4171 100644
> --- a/drivers/mtd/mtdpart.c
> +++ b/drivers/mtd/mtdpart.c
> @@ -118,7 +118,7 @@ static struct mtd_info *allocate_partition(struct mtd_info *parent,
>   		child->part.size = parent_size - child->part.offset;
>   
>   	printk(KERN_NOTICE "0x%012llx-0x%012llx : \"%s\"\n",
> -	       child->part.offset, child->part.offset + child->part.size,
> +	       child->part.offset, child->part.offset + child->part.size - 1,
>   	       child->name);
>   
>   	/* let's do some sanity checks */


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
