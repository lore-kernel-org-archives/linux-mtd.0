Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BB31C74A5B
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Mar 2023 03:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MbC4mYesSn4dZOqS+HdE+76g74xoIH7bbU2xdEe8jdw=; b=RzPfMtsJIM2g+k
	V6M1yF46wCB2C7UCd75KRRljIDihNIS1f7hh+m38ag9h5p+CxWT9Ws4Eqo1N52UAjHBBxmG/W3F9n
	ULk0r5BNRvSUzUU9lJf014BdF1jI3QBMfClA/ggoxCcXkEZIc2sRsZ1qSCU+FV7WvrKY45wtV2OVs
	lKx6N7iUaZ+ZS6US7wDlQb+JRg2pFqBeD5WYMNxV9zPPg89MhErHE8flbZVVxxdpiu8Z73bxia2qS
	l+v2uf/s5F36ApkB7wRtw6nh2EDtRzmBTrqhHx4ivDuReXeEBNTCDsLzuLupw8kAWrgmc+pIMhd/q
	Zi3g354fGZKB/TIRkkNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd0w1-000p1k-1o;
	Fri, 17 Mar 2023 03:39:17 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd0vy-000p0W-2A
	for linux-mtd@lists.infradead.org;
	Fri, 17 Mar 2023 03:39:16 +0000
Received: by mail-ed1-x52d.google.com with SMTP id x3so15414981edb.10
        for <linux-mtd@lists.infradead.org>; Thu, 16 Mar 2023 20:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679024352;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pPZr6bO/SQPfasA3UiO/t5cUe8GMvLS8Z2UPRxffU7o=;
        b=V0og13ZPm0oaswj3RGxKffzc9I0y/p1nQmsqRKmgQeiRheWdNopv7tC0aldhPVsanb
         jft5mPTrLQ+s7yY9V2cdub1Nu8irxBPoufd01QwmaXmw7+HvRoO/2oBXLzpLbjWG28e+
         zjf+LAgpwzw8Mn+uFR69gMHmbKwzxdL7dj58XET+vNMWEBDfM77lfxrj61S9rjBFEh8L
         F1YT12Yt0LhnyAarPCNKowukllLFRpjahkxXXY2A37h3Pbxw+me3Tyc6EwGdX/CnMyj3
         h12i/VryrSRq+irxKfshTd5zRlpfQSM1VC/lW6XXKAx5TV2tieTPaigqJgXWtBRQEV1E
         Lx4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679024352;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pPZr6bO/SQPfasA3UiO/t5cUe8GMvLS8Z2UPRxffU7o=;
        b=fKkkmUZLwfsRG1mNqPXAtN6bYucgF8KwNx9z8frDkbXi85JpcBnI8bQUFJPHNXlCRm
         ZPugbAqzUdVtMN+EX7z5DgazOmU53QseWQnXKJabPvBB2b/g5aicDlSEpUFzjoP71+54
         /gxsPvP5xCyf11oA4uYjRqd38LdxxLxctoWCgiIbeBdUJJwNYtdlPtwuXjWPM4rPuMXq
         4jeqchC+nf1G7ekdJGQafFNm3JufbD4kYRWZUnP+VWbRmPydmOmRmBN7XBV1CgelQwVp
         tik6ebOdc0qWewAnPjVrchKzNOM83fqlaLi+XuuvXSXy1w1p36tBBxVv1dJj4+RyNQjn
         kdSg==
X-Gm-Message-State: AO0yUKXNyOWE+8RZmQWul3O4zaiLFghTwwjQNgBqJOSvBA4e3HeKTA0X
	ng3N4dn/HNI99j3wfF6cYD/P3A==
X-Google-Smtp-Source: AK7set+o1Mn2S/mIOV8dXN4+bZTv0XprlEnP3QlwKzURv9/t2gIAL+BSvySVxtsww0qVLHGhF3CBVQ==
X-Received: by 2002:a17:906:a18e:b0:921:5cce:6599 with SMTP id s14-20020a170906a18e00b009215cce6599mr11710080ejy.41.1679024352042;
        Thu, 16 Mar 2023 20:39:12 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.78])
        by smtp.gmail.com with ESMTPSA id f17-20020a170906c09100b009306ebc79d3sm404065ejz.59.2023.03.16.20.39.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Mar 2023 20:39:11 -0700 (PDT)
Message-ID: <2e2050ee-69eb-9c8a-6a4b-3d9b1b8e9286@linaro.org>
Date: Fri, 17 Mar 2023 03:39:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 3/8] mtd: spi-nor: Reorder the preparation vs locking
 steps
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org
Cc: Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>,
 Jaime Liao <jaimeliao.tw@gmail.com>, Alvin Zhou <alvinzhou@mxic.com.tw>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michal Simek <monstr@monstr.eu>, linux-arm-kernel@lists.infradead.org
References: <20230201113603.293758-1-miquel.raynal@bootlin.com>
 <20230201113603.293758-4-miquel.raynal@bootlin.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230201113603.293758-4-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230316_203914_722580_B0C151C7 
X-CRM114-Status: GOOD (  21.10  )
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



On 2/1/23 11:35, Miquel Raynal wrote:
> The ->prepare()/->unprepare() hooks are now legacy, we no longer accept
> new drivers supporting them. The only remaining controllers using them
> acquires a per-chip mutex, which should not interfere with the rest of
> the operation done in the core. As a result, we should be safe to
> reorganize these helpers to first perform the preparation, before
> acquiring the core locks. This is necessary in order to be able to
> improve the locking mechanism in the core (coming next). No side effects
> are expected.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

> ---
>  drivers/mtd/spi-nor/core.c | 23 ++++++++++-------------
>  1 file changed, 10 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 3845de9c874c..01932dbaa5b9 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -1071,27 +1071,24 @@ static void spi_nor_set_4byte_opcodes(struct spi_nor *nor)
>  	}
>  }
>  
> -int spi_nor_lock_and_prep(struct spi_nor *nor)
> +int spi_nor_prep_and_lock(struct spi_nor *nor)
>  {
>  	int ret = 0;
>  
> -	mutex_lock(&nor->lock);
> -
> -	if (nor->controller_ops &&  nor->controller_ops->prepare) {
> +	if (nor->controller_ops && nor->controller_ops->prepare)
>  		ret = nor->controller_ops->prepare(nor);
> -		if (ret) {
> -			mutex_unlock(&nor->lock);
> -			return ret;
> -		}
> -	}
> +
> +	mutex_lock(&nor->lock);
> +
>  	return ret;
>  }
>  
>  void spi_nor_unlock_and_unprep(struct spi_nor *nor)
>  {
> +	mutex_unlock(&nor->lock);
> +
>  	if (nor->controller_ops && nor->controller_ops->unprepare)
>  		nor->controller_ops->unprepare(nor);
> -	mutex_unlock(&nor->lock);
>  }
>  
>  static u32 spi_nor_convert_addr(struct spi_nor *nor, loff_t addr)
> @@ -1447,7 +1444,7 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
>  	addr = instr->addr;
>  	len = instr->len;
>  
> -	ret = spi_nor_lock_and_prep(nor);
> +	ret = spi_nor_prep_and_lock(nor);
>  	if (ret)
>  		return ret;
>  
> @@ -1707,7 +1704,7 @@ static int spi_nor_read(struct mtd_info *mtd, loff_t from, size_t len,
>  
>  	dev_dbg(nor->dev, "from 0x%08x, len %zd\n", (u32)from, len);
>  
> -	ret = spi_nor_lock_and_prep(nor);
> +	ret = spi_nor_prep_and_lock(nor);
>  	if (ret)
>  		return ret;
>  
> @@ -1753,7 +1750,7 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
>  
>  	dev_dbg(nor->dev, "to 0x%08x, len %zd\n", (u32)to, len);
>  
> -	ret = spi_nor_lock_and_prep(nor);
> +	ret = spi_nor_prep_and_lock(nor);
>  	if (ret)
>  		return ret;
>  

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
