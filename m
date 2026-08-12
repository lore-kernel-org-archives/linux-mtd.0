Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39049C5AD5A
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Aug 2026 09:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JfnWcFrzReEufFNf+AkZma2bP827MmtptfYcaT4rk7Q=; b=N5TSIQQqapc9qX
	/OET9rAn9W4fb5S4USfnloLkfHDbtihEzZV+PmDEEuY/m1spCht4WNObEYQjJv+5DKTau7s85Zr51
	KMyWHdi7K6g0m0N1gSZ0oSI/BXEEOWXhUjigH+EHBKYT2zhPxniQx2Ixq23tWnf3W9bA9/ACggxss
	zOJoh7MLM6GHtcy6zoSSm992AWiLQ+Rw4aUTSmETqLmiYIn8tHe3LcW/X4oYD0PI3g7+xlF1d79hk
	4bk+MgH+jLCrF92nR2adamNyfh5YKs5dKXsk39ILBE15DtApwttaFRK/4Txl0437MGJDiLStD6FYp
	QVr3v3DXNYOnVMEpspSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu5aT-0000000FoQ1-1fZa;
	Wed, 12 Aug 2026 09:49:29 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu5aP-0000000FoOt-2p3e
	for linux-mtd@lists.infradead.org;
	Wed, 12 Aug 2026 09:49:28 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-47f71156e1aso317885f8f.3
        for <linux-mtd@lists.infradead.org>; Wed, 12 Aug 2026 02:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786528164; x=1787132964; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KNnL3c87mu/DIX31ZmKg4EMDsyOIpMA1GsTwk82rq7I=;
        b=Q7mRhGfuPxicMcfCBdRJvR5AWWtMs8uU9MSSn/ElSpwSrAIpRpxyO76acnkKnVckat
         9idyWcIt1KW6ynjwlem3wpv64m0QSzSrHsUb2fSaaaecVpmWXJAgBb7upTMfcxzQUlHk
         OnHyeh3zNzMzjN/kwfCPhnZphJQPMAAIl8wrXcS1djPjpRSTwEGaTNAoRtiAr9VQG60s
         bJonO6dkE1XFAw4Cb3IKItbMUtzQ5DQYIW9FuDs8xzMBUxFZFuOtXmNHA0tqnOaa3Zn+
         Fef3Yg54DXg2VkbhugFGAAKv8OtvVHsTNqieszastihBlFC8BMlAF4h2oKZH1IgKzvIb
         XbOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786528164; x=1787132964;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KNnL3c87mu/DIX31ZmKg4EMDsyOIpMA1GsTwk82rq7I=;
        b=F8tlwjyrkf8NwWGHtdQMyi48eTiKSa/ZkhZ9QFe/VNuaf3ejmuitj2BFDtRoX4rFdO
         XENwDG7oMeUoeFGyqordp2nLzX4u3BmLzVfGFUmCahjUqXmIbaivje5xoZYcnUggycB0
         QKQmKVGH7N4+UNYX1eSX3k1EG8JjSRC9c4v3ued2msf4W26JPjJBODdBhQIay5Ymsn0Y
         U8DyxwtpW/cgoEy+vaz+CEbVldTQUz3mK+2SxxH0g1tq/UoI4QJyzzpr/MYRaD5J4VpX
         Y3sE7oegbwka8riwMgIAjMFOvxl+gNLzHo/bzqzD7PFEaT3+/cGBI2I1or/FoIVzDhz8
         gd7A==
X-Forwarded-Encrypted: i=1; AHgh+Rrr9xc0rMNnp5Jf0+1LORalv9rJlwCNLmXurGud7ikPBBwQXN3Jl1Ozp4+GiDItjFMtdny+6+uNDso=@lists.infradead.org
X-Gm-Message-State: AOJu0YzdSAMukwRPpD+muHDRMlZ/TuAqF2eBjwMwcHdGJUFf3JruLTWV
	fr3YfSAUs0OnB8qmT8vynphpECPntKML4v0m+DeRM2EADWZRyXZbqLsY1dZ/emzckPw=
X-Gm-Gg: AR+sD1297Vz14nvbyT5GoKKUXIvc9XJgVBRyCJzcRkqrTdrCLZhB7wchvGYE8nJVh1k
	fgQnqGWN0HJ691GpJldA1IK35xlSA82QKGreX1qh3WLw+qEgtGVIVc5FFPMgC0fNEst8bREoUDZ
	DAsdv2PzvxnF4vyKKRzQcVcrqxDnWoec74xBgCnVjhZX67wy6OkHaS4SVb+MGwzDB6K+lgUxQxU
	8+8tVOxWgnwqFHKswkEVXlnMpBIB9T9N4G0g/PXloRY/I7SDFtk2ROKOkpWGtWT5Ji8HPUqW0HH
	a9gzkK+xTKeNhyetPJqFfnhNu/O2k4+risCroq6MJtN8/5CemOiBAgYbb9hY6v7/Qg0hbSVY1GQ
	OvAmO8zFyuxuvqNGW/sStUs9uQwaij1XHd8gTLbciluv+IbrE5sqVWa7Mh7Ia3eXElBNUqycUjp
	vEX2g4jjIr06509RGO3f5okd+NgNX+qXPTwrkE42m7nMn6u8hMnrpift6mfum5beLQXqACv14g0
	9iT7LYs
X-Received: by 2002:a05:6000:41c2:b0:47f:aead:f81b with SMTP id ffacd0b85a97d-48152c75b41mr4968917f8f.21.1786528163621;
        Wed, 12 Aug 2026 02:49:23 -0700 (PDT)
Received: from [192.168.0.252] ([79.115.63.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48150d5cba0sm5984868f8f.25.2026.08.12.02.49.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 02:49:23 -0700 (PDT)
Message-ID: <5a4670bb-e24c-4adb-889a-01f54f04d32c@linaro.org>
Date: Wed, 12 Aug 2026 12:49:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] mtd: spi-nor: use guard() in
 spi_nor_rww_start_exclusive
To: Runyu Xiao <runyu.xiao@seu.edu.cn>
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, jianhao.xu@seu.edu.cn
References: <20260811041349.333176-1-runyu.xiao@seu.edu.cn>
 <20260811083111.403453-1-runyu.xiao@seu.edu.cn>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260811083111.403453-1-runyu.xiao@seu.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_024925_737218_9AB48D5E 
X-CRM114-Status: GOOD (  18.46  )
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



On 8/11/26 11:31 AM, Runyu Xiao wrote:
> Commit 03e7bb864d9a ("mtd: spi-nor: use scope-based mutex cleanup
> helpers") converted the RWW start helpers to scoped mutex cleanup, but
> left spi_nor_rww_start_exclusive() using a plain mutex_lock().
> 
> spi_nor_rww_start_exclusive() is used as a wait_event_killable()
> condition. When it returns false on the busy path, the raw mutex_lock()
> leaves nor->lock held and blocks the operation that must clear the RWW
> state in spi_nor_rww_end_exclusive().
> 
> Use guard(mutex) here as well so this helper matches the other RWW
> start helpers and releases nor->lock on the false return path.
> 
> Fixes: 03e7bb864d9a ("mtd: spi-nor: use scope-based mutex cleanup helpers")
> Cc: stable@vger.kernel.org
> Signed-off-by: Runyu Xiao <runyu.xiao@seu.edu.cn>

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

> ---
> Changes in v3:
> - Reframe the changelog around the scoped-helper conversion that missed
>   spi_nor_rww_start_exclusive().
> 
> Changes in v2:
> - Replace the analysis-style explanation with a short maintainer-facing
>   description of the busy-path lock hold.
> - Keep the fix focused on using guard(mutex) so the mutex is released on
>   both paths.
> 
> drivers/mtd/spi-nor/core.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index ccf4396cdcd0..8bc117b46e02 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -1310,7 +1310,7 @@ static bool spi_nor_rww_start_exclusive(struct spi_nor *nor)
>  {
>  	struct spi_nor_rww *rww = &nor->rww;
>  
> -	mutex_lock(&nor->lock);
> +	guard(mutex)(&nor->lock);
>  
>  	if (rww->ongoing_io || rww->ongoing_rd || rww->ongoing_pe)
>  		return false;


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
