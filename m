Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C12A0C4345F
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Apr 2024 06:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cIdPIPT+OHREuv67rL6qpmHks+hmU77XtEkxvvS0FRQ=; b=sqQDv+P9pVFNw2
	C8ulnTFEdOL+2ynL4erJ43zSz+1qhfvFsCvT12Mlm3NFb9XuSe9XC+cMWzCcMRYkeqXxQPZW5R41i
	4TPW5ytl2tNh4cIKP/b5pIGtwFAptvdMS2NJ0ll8Te6uC5aCmEx0vBE7EuAYvW95XPoX2l7Sa+Ynn
	fvhe4+xayYIDBR2yPlnwGg1RnRj0E8mn3BEO0RMIvfpDQmT+ATKWt4zCX4q17xp+5FfiFT3lpz5yH
	gZ2V2qRlo6+cWadjWhTkEJ5pjkhvw+R6BFkzW00bjGv7molwPO1Y6Rnapdgp4oTYC0U6iefDFkvQj
	YRizSI3ushWJfW1luLEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rynMb-0000000CHVD-0O9e;
	Mon, 22 Apr 2024 06:41:17 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rynMX-0000000CHU0-2sKY
	for linux-mtd@lists.infradead.org;
	Mon, 22 Apr 2024 06:41:15 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-41a77836fa6so1563705e9.2
        for <linux-mtd@lists.infradead.org>; Sun, 21 Apr 2024 23:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713768071; x=1714372871; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+IHMmWa7PCm5h8KXXIvVWID6BVHToSqTvpYZtQwLUQk=;
        b=W222uxGRbDAKXLGU7hSrbGKT5w3zx9VYo9Dx9g20H760Npi85N/oqQDHRBxVy6EnAP
         tSl4yiHFNhtWtZJcwykIvs639o9+ImW2hFt9MIkM3GBMZWLglzeSpT5dEwm2Jhh4O27n
         +a9HWWPf8L58ZsA6BHs527+8/JVW0HbjrBDBiDuG7uSrvGKlm5HPL+DdWiegiiz4grnd
         DyIIGJkedBH7hqOxH6SFCtNc3TL4bMaGHsTBF18sDrIkl6OcamLpcqp9VIKqnddpwWzj
         oJ0EjiMMvpqOiKxVd1o1nfXopSEJ2D0qeGDxhkPJh/sCGJnPQ4TRmtcJQANid69H+OG+
         tH4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713768071; x=1714372871;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+IHMmWa7PCm5h8KXXIvVWID6BVHToSqTvpYZtQwLUQk=;
        b=BGSta4S6pmDxfP3Id0R9eiMuUPeXkoQ97tx9leSUxDgOJuNaxD0JgMMCLYsmCSeqGJ
         0GRkBZVidPXj1uM+XmVN3mAek+3ulp/vlrmYn6ysv9yHWCKATaHwz5y77sXUns25JvZV
         OBjntRU4oUWH9aHLNEOcNhK8OD3AUbpYQ/WLfdk37dvijJt6sSon/LjsCTkdEK6J1qVq
         +3AsjG0FLIjmTYgWo14RwWpr8MBPD1YLd332+8wfYeCORmB65el9vQa+7DD75/yS0zdz
         BorcVfZXXITvZ56WJeEUeEKDUeL+QiwlgZDkXHl9cx5Z0FkelOqtuuliB6xH2YuPuTnW
         1I5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVovbMFdCC+Bdy37TryAfmlQgmXUKIsKyLcOn3f+cvy1qjmDSn3kKIwya1VSyHOx4sQg9OYKWInlnCwFzNghFf19l+dP29N1QPeQOWRmA==
X-Gm-Message-State: AOJu0Yx64f2E3re2vliTnQzM5olcJOm4MkjivBtFSiCUtHa8uECgyuKn
	udcpB7hHaf9ghclEpBAlVL1aJulprgeTp7Q4a8c5tn5fMrZ5KEyxmrTxQVqB4xQ=
X-Google-Smtp-Source: AGHT+IEW9O3L/i7BiWlbcsSQolNhambRTqEe1b8s9RDn7Ue11cH9c0q2wutS4BoKQT65qaxLYC8MWQ==
X-Received: by 2002:a05:600c:4587:b0:417:e00c:fdb8 with SMTP id r7-20020a05600c458700b00417e00cfdb8mr9055250wmo.1.1713768070878;
        Sun, 21 Apr 2024 23:41:10 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.100])
        by smtp.gmail.com with ESMTPSA id be7-20020a05600c1e8700b0041a5b68ea32sm2186473wmb.27.2024.04.21.23.41.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Apr 2024 23:41:10 -0700 (PDT)
Message-ID: <ea3b32a8-7a1c-4a32-beb5-acc6f6435954@linaro.org>
Date: Mon, 22 Apr 2024 07:41:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] mtd: spi-nor: simplify spi_nor_get_flash_info()
To: Michael Walle <mwalle@kernel.org>, Pratyush Yadav <pratyush@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Ricardo Ribalda <ribalda@kernel.org>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
References: <20240419141249.609534-1-mwalle@kernel.org>
 <20240419141249.609534-6-mwalle@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20240419141249.609534-6-mwalle@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240421_234113_847875_0014D1FD 
X-CRM114-Status: GOOD (  24.90  )
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



On 4/19/24 15:12, Michael Walle wrote:
> Rework spi_nor_get_flash_info() to make it look more straight forward
> and esp. don't return early. The latter is a preparation to check for
> deprecated flashes.
> 
> Signed-off-by: Michael Walle <mwalle@kernel.org>
> Reviewed-by: Pratyush Yadav <pratyush@kernel.org>
> ---
>  drivers/mtd/spi-nor/core.c | 45 ++++++++++++++++++--------------------
>  1 file changed, 21 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 4e2ae6642d4c..8e4ae1317870 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -3294,39 +3294,36 @@ static const struct flash_info *spi_nor_match_name(struct spi_nor *nor,
>  static const struct flash_info *spi_nor_get_flash_info(struct spi_nor *nor,
>  						       const char *name)
>  {
> -	const struct flash_info *info = NULL;
> +	const struct flash_info *jinfo = NULL, *info = NULL;
>  
>  	if (name)
>  		info = spi_nor_match_name(nor, name);
> -	/* Try to auto-detect if chip name wasn't specified or not found */
> -	if (!info)
> -		return spi_nor_detect(nor);
> -
>  	/*
> -	 * If caller has specified name of flash model that can normally be
> -	 * detected using JEDEC, let's verify it.
> +	 * Auto-detect if chip name wasn't specified or not found, or the chip
> +	 * has an ID. If the chip supposedly has an ID, we also do an
> +	 * auto-detection to compare it later.
>  	 */
> -	if (name && info->id) {
> -		const struct flash_info *jinfo;
> -
> +	if (!info || info->id) {
>  		jinfo = spi_nor_detect(nor);
> -		if (IS_ERR(jinfo)) {
> +		if (IS_ERR(jinfo))
>  			return jinfo;
> -		} else if (jinfo != info) {

you can remove else if with if (jinfo != info)

> -			/*
> -			 * JEDEC knows better, so overwrite platform ID. We
> -			 * can't trust partitions any longer, but we'll let
> -			 * mtd apply them anyway, since some partitions may be
> -			 * marked read-only, and we don't want to loose that
> -			 * information, even if it's not 100% accurate.
> -			 */
> -			dev_warn(nor->dev, "found %s, expected %s\n",
> -				 jinfo->name, info->name);

keep the warning where it was
> -			info = jinfo;

move this so that it belongs to if (!info || info->id)
> -		}
>  	}
>

and then return info. Does it work?


	if (name)
		info = spi_nor_match_name(nor, name);

	if (!info || info->id) {
		jinfo = spi_nor_detect(nor);
		if (IS_ERR(jinfo))
			return jinfo;
		
		if (jinfo != info)
			dev_warn(();
		info = jinfo;
	}

	return info;

> -	return info;
> +	/*
> +	 * If caller has specified name of flash model that can normally be
> +	 * detected using JEDEC, let's verify it.
> +	 */
> +	if (info && jinfo && jinfo != info)> +		dev_warn(nor->dev, "found %s, expected %s\n",
> +			 jinfo->name, info->name);
> +
> +	/*
> +	 * JEDEC knows better, so overwrite platform ID. We can't trust
> +	 * partitions any longer, but we'll let mtd apply them anyway, since
> +	 * some partitions may be marked read-only, and we don't want to loose
> +	 * that information, even if it's not 100% accurate.
> +	 */
> +	return jinfo ?: info;

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
