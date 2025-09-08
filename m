Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21547CA1013
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Sep 2025 10:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SKU4T8YHeKVh/T9p7Nvy1sPHcrj//3g5RrDCVMT35+A=; b=qr+nq5erhGiImX
	17BqiAghUnZcvqDqBNNX4e4RDkZVaa1brJDcZGfYT9Q8y5z2zaWAzFwaMDN/tMrVujlj9MqcG0NNp
	w5knHocTjo2QGxuSlCu5pd+RCg91zMuM/n0JeKkOUoH0wIvwCv0rHSYVdhnsa85lBPqQZ7HOXrj3p
	ePBPVQw2vW+aDNY2tOhJtTpT7G7boJILqlEYuVkU0nelXBYl8KtSp2fMN2kKgSe1GRlwsg4l1Kff3
	lGUz8ONNFMfajk0jmFrSQx0VhHtOd81bM0HXAHceO+mEHB4uxRaEms568GuSQS4942XFwnXNd9+if
	/iG8ibB3h4jr6T8GHryA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvYnG-0000000GGjG-3Cjm;
	Mon, 08 Sep 2025 10:08:14 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvYAq-0000000G1w8-3OsI
	for linux-mtd@lists.infradead.org;
	Mon, 08 Sep 2025 09:28:34 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-b49c1c130c9so2829886a12.0
        for <linux-mtd@lists.infradead.org>; Mon, 08 Sep 2025 02:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757323712; x=1757928512; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1aIO/Jc9gNb+dffbLCO11wsfc76FxYTcfSF7E2zqgos=;
        b=NcVCZFATaapBnhNW86rgStcZAj05auIPsKGXWZo8N5x7qZREnqzO3/60OF6gnnAy4z
         2HQfGeRkCWalnKSrXNpr5ysY8F/n1vYiCcS7GqD+1ALCxJq2LDA6ZhcchYRLUKed5WT0
         gjXdT6NzpICYUuiuESYXkD+y1n8HcobtRDg7PIHjamMF/67CYf2G8IZFf8uZNVbdB5wP
         oZWG2hONCsdyIJPgyLbw/u0EU17Q1/03mHiY2+1K01E8l3JPKf3eprCOQ73BJ/FTzgNu
         /WqoKz3PX7VGi98dh9FzXrlaC3Ip7waEF9UUfcSntMzT/X6BlAiXjUDJ4BomSfKchY9v
         ttxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757323712; x=1757928512;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1aIO/Jc9gNb+dffbLCO11wsfc76FxYTcfSF7E2zqgos=;
        b=DhwcsO3ZwxaD1CO7tJ1gWBKFMQ5Lp16mW0zlVxnmLvBN+bv5di/oZG4e4KHeaKK3Ur
         Z/oS1C+vaL3EyPkZvEDo/GsoBI60TWqnOJcV3Fr0f6cOER5iMrtN2DIqPSvyg/WCZzEo
         52s7esQ9/cyMhkT9679s48lCZJDd4lNX7ArKA2bi1sfU3+E+NDXWsY5oQQbdCt6BSNuL
         k/l1+nY6On2L1A4zLLGBSyNvZWq1JFD89rXQlDfyHKBuk3o8gAf/ium8yWNJTtewzl1M
         sIjr4nXKzRls1Z0zY3lifHevkXxk3cUPUnYgGAQ6EgW0YfCIueM3ZTvvfWOUyGYGoAHf
         6wJw==
X-Gm-Message-State: AOJu0Yyk8eDXyzhQlfv+BkOPvpN45zELCVXR2DjnmDGy70B5wED2Ds3O
	OzQfxuhjlOUO6NyXr1TLs05SSa5EyOPJob2o6xR/JQpPtgn8z2qYpHIB
X-Gm-Gg: ASbGncuHrA5apgRH/kQJJd6VHyHld9zQ6TMz51UqNRXWzdn/EJGmxAyYCf9oO+M6w/E
	sgvqU/9jl05muTHK+tVKnXiZCqNMHlUgulCPawxOKUt51Z9CIG8WhqYLsScUSj9XzHcgaL5h4al
	UBhPtmVH5T1L2cHmivAz0yVZHFU1Y++YmJZRB5JEP6rPbvabQ9i4yjunlGNR8YdprHBkO/bYHlR
	jvqxDXlzd6QPJSsRpYbsnlPT781iJTs5qWmqHDsxcENDYltafxlEqCHcz5OfhN/yWlFKb2BKM/E
	kBSKzIfBxvuRoPxD2g8cDEbN+7n/BfT+ZOYjxT1QVSVBx7VNwqjrWN8xZ4OPnY00VWTPkVK/Y5v
	b6YXJ+a0B1n1o0vJhQyO4wMRERGzxwB4CYeXo6aL5JavVU4UhuBNUwwwRjrVa9MLTMHHNJWFZ
X-Google-Smtp-Source: AGHT+IEXLmGTm7mVbd9WymfKCr5IMKeWD2CbkcCLjMtCRO58i9jj5tdNIyt6wYAt2uN9AQbVTvai8Q==
X-Received: by 2002:a05:6a21:339b:b0:250:429b:9e6c with SMTP id adf61e73a8af0-25344dc4b0cmr11777361637.40.1757323711541;
        Mon, 08 Sep 2025 02:28:31 -0700 (PDT)
Received: from [192.168.0.5] (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b5207352e9csm8326243a12.48.2025.09.08.02.28.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 02:28:31 -0700 (PDT)
Message-ID: <73bd7d59-0029-480c-b1a8-ec5ad5b16553@gmail.com>
Date: Mon, 8 Sep 2025 18:28:26 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: spansion: Modify addr_mode_nbytes for DTR
 mode
To: Santhosh Kumar K <s-k6@ti.com>, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, tudor.ambarus@linaro.org,
 pratyush@kernel.org, mwalle@kernel.org
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 praneeth@ti.com, p-mantena@ti.com, a-dutta@ti.com, u-kumar1@ti.com
References: <20250904131309.3095165-1-s-k6@ti.com>
Content-Language: en-US
From: Takahiro Kuwano <tkuw584924@gmail.com>
In-Reply-To: <20250904131309.3095165-1-s-k6@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_022833_004397_259B2697 
X-CRM114-Status: GOOD (  18.88  )
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

On 9/4/2025 10:13 PM, Santhosh Kumar K wrote:
> The nor->params->addr_mode_nbytes parameter defines the address byte
> count for the current addressing mode. When transitioning between SDR
> and DDR modes, this parameter must be properly updated to maintain the
> correct addressing behavior. So, implement the necessary updates to
> nor->params->addr_mode_nbytes during both DDR mode enablement and
> disablement operations to ensure address byte counts remain consistent
> with the active transfer mode.
> 
The address byte count for the current addressing mode is defined as
params->addr_nbytes. The params->addr_mode_nbytes tracks flash's internal
addressing mode and is not used in octal DDR mode.

> Signed-off-by: Santhosh Kumar K <s-k6@ti.com>
> ---
> 
> Tested on TI's AM62x SK
> Logs: https://gist.github.com/santhosh21/8d69756bd54605d79086b00850e1083a
> 
> ---
>  drivers/mtd/spi-nor/spansion.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
> index a0296c871634..678f7f4052c9 100644
> --- a/drivers/mtd/spi-nor/spansion.c
> +++ b/drivers/mtd/spi-nor/spansion.c
> @@ -230,6 +230,8 @@ static int cypress_nor_octal_dtr_en(struct spi_nor *nor)
>  			return ret;
>  	}
>  
> +	nor->params->addr_mode_nbytes = 4;
> +
Are there any problems if we don't do this?

>  	/* Read flash ID to make sure the switch was successful. */
>  	ret = spi_nor_read_id(nor, nor->addr_nbytes, 3, buf,
>  			      SNOR_PROTO_8_8_8_DTR);
> @@ -275,6 +277,8 @@ static int cypress_nor_octal_dtr_dis(struct spi_nor *nor)
>  			return ret;
>  	}
>  
> +	nor->params->addr_mode_nbytes = 3;
> +
This doesn't work in case flash's internal address mode is 4.

>  	/* Read flash ID to make sure the switch was successful. */
>  	ret = spi_nor_read_id(nor, 0, 0, buf, SNOR_PROTO_1_1_1);
>  	if (ret) {

Thanks,
Takahiro


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
