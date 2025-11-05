Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E93C1CCFA0D
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Nov 2025 15:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vajo3DKPwLgZ+9b6e8alUGrmMvoPXj2NYqtyIqIjyvs=; b=14b0D9M99uFBb3
	TR8wXkkYoTSwYNfm/RYfkrRoU6NnvYv3uTtXT5fHVCw87sMBADqhzXwqjgbHKNo6Y6emXRnzY4X+O
	EuBETE0JE44Dz0i/dKeHvkTyEBPSc5bmguO5kqwFhI7JfKb70FeUcYkF5VmbL4Da1cpaof0e8mIXP
	zk1MB4GNSXeAtT/Lq22jcILeyeGJjnomJo4K8v5EyQSNzQrdmKnNH+JO0uesZ9C7Bxr4AJR+S8N3k
	VgeKe5uWZu87XFHQU62Lifx1uDcdz0csKG6DT9rqXoatwakZICl58NVBivEr/VW2Mne04RSOjhaDJ
	lrdDKuEYz4zRUg9zJ9Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGfg3-0000000DyKV-2sdN;
	Wed, 05 Nov 2025 15:44:03 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGfg1-0000000DyK7-1W4h
	for linux-mtd@lists.infradead.org;
	Wed, 05 Nov 2025 15:44:02 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-b7260435287so204460066b.3
        for <linux-mtd@lists.infradead.org>; Wed, 05 Nov 2025 07:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762357439; x=1762962239; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CSVtmYaRorpLg3ihHdyCGNJLkC8P7NNl8FUvIMwjsNY=;
        b=tIDiLo9LDpRSWBbiA7iwNYXeKWdKmoOY3YStkR5gXZbWv+f2cVLn787I44TLVJlIi9
         /rTwhlbhPUEeqvfK9CpiRjgZ7glVJ/Gl7IzyHGYT8yH2UAwCTDXsiBkJKEp1sBsLFYlP
         9UpDdvTrRrZbVG20BNdzD7Hn4+dbulz0AmyhXgHATo6bZsBZQ0DFhWBR6nWbS3sf5JSk
         aLausAkmrdjG1zcBRGZ1VmGZjqmziRdfMAsMlYZ5lgbAmllePk5mPXGHgKzHmFbhV2ZT
         rBYalX7vsm1bVvq1n0wzC7eECJHpkvgzSLp620irwQz6c7XXnylfHzT+ptnM6vTjFKLf
         ziAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762357439; x=1762962239;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CSVtmYaRorpLg3ihHdyCGNJLkC8P7NNl8FUvIMwjsNY=;
        b=X1nGbeWThh7ZPCQFUcykGcwoSW78QDQhXys+0/KGxbTgXArV2Nh+xfZCHbF5nvQQiD
         b74Nbk/heXxBMjq1KKztSZM8L+/p3R2A2CZTqnUd84KdSnpAsJblKAir2fvQE+evkfVM
         aIUgyWo05Bry6lKar5hsRezOysqf27xSixLTKqKiJN8bxgFUi4MRyYnOcQ171SlEqMJI
         NCqtO5VKWfo0rfsZd9Q1X2ua1p/xKFHZfLEaUVnIGVhKYPBk8Ao7jdMGHsAB4lHKuFU8
         T743VpqpLLt4HviSpG9KG4gkn3belNXgCD8wjBbJSnhx6QRtcUv17yUxexADlxd/J/Rl
         ECjA==
X-Forwarded-Encrypted: i=1; AJvYcCWo41nXalGRI2kfsv8xQDxBh9pWrLeNKbbKZqr95Rj8GGjKLdRwc1j+LVRT0aiCL1SXHX51pOhhEzY=@lists.infradead.org
X-Gm-Message-State: AOJu0YyQ3e3EJuQKXxAT2pxCjK2einqW7UhsM9OmuxxL+GJOKV2jfdRk
	5MZT6d8/A4U3xUAoBPuDZAJDdA7o7i7m6rVDae/JULE5fP/283KhKZEgEEbABHEBwguXPSMzxhX
	SPJOf9l3Peg==
X-Gm-Gg: ASbGncuccOoIrznXEFw0BMMxSgz1Upv3ohydLoitoAY4igZlq1nBYbPdkuk1FjpiCeP
	hhuSVprlQg6SD5cwzUTUuQMFBpMXPxAiRE3ADCBvx6SkwpC6WCpI0KNx2yHzaqff/IAatuPEZPm
	voOVP/AJxZ+DCawHg4jv6w0VGlAxLQwYXNt760HBn7C8yT3lC90UGNr1pqOo7eGy7gCvzzwvX6E
	H82k/5P+mkKOtlVpCjPHwurvBBRdHBBlZZthI2bLTD57Ws2fI/KtNd1j2nYqWKCXn7xqxjllBF0
	jycZ5Vb5XIq5s38r09Q97T1U+Eq/EWanGgo/bUO8wkDb2E5Ktl0ZFtme+8d4ACh6W/aHQW8AerK
	f2SUMMp+jUou2Ju4NfkvKUwnYDDO/e/D41be1qZXZDYoPJF0GKxWnLOiZE8RuMNQ+N/sXgx8xni
	fKTxw1tzXxlRZvztRcizeTg4k=
X-Google-Smtp-Source: AGHT+IFa7/X97763xpJ1l9X3Sq82I4dFTfY6YWJOkY+3Eh/I0wcCHNCHX/dwcVa4BdzknLf2omKPmA==
X-Received: by 2002:a17:907:2da5:b0:b42:f820:b7c with SMTP id a640c23a62f3a-b7265586f9cmr328010166b.41.1762357439537;
        Wed, 05 Nov 2025 07:43:59 -0800 (PST)
Received: from [172.20.148.132] ([87.213.113.147])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b723d6f8c5bsm514160166b.20.2025.11.05.07.43.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Nov 2025 07:43:59 -0800 (PST)
Message-ID: <0be97b27-4f8b-4d22-a653-154e87ecbc78@linaro.org>
Date: Wed, 5 Nov 2025 16:43:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/28] spi: spi-mem: Create a repeated address operation
To: Miquel Raynal <miquel.raynal@bootlin.com>, Mark Brown
 <broonie@kernel.org>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steam Lin <STLin2@winbond.com>, Santhosh Kumar K <s-k6@ti.com>,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
References: <20251031-winbond-v6-17-rc1-oddr-v1-0-be42de23ebf1@bootlin.com>
 <20251031-winbond-v6-17-rc1-oddr-v1-2-be42de23ebf1@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20251031-winbond-v6-17-rc1-oddr-v1-2-be42de23ebf1@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_074401_446191_E90D7D4E 
X-CRM114-Status: GOOD (  15.74  )
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



On 10/31/25 6:26 PM, Miquel Raynal wrote:
> In octal DTR mode, while the command opcode is *always* repeated,

this info is wrong: opcode can be repeated, inverted or a dedicated 16bit,
so please fix this to not mislead readers

> addresses may either be long enough to cover at least two bytes (in
> which case the existing macro works), or otherwise for single byte
> addresses, the byte must also be duplicated and sent twice: on each
> front of the clock. Create a macro for this common case.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  include/linux/spi/spi-mem.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
> index 81c9c7e793b6ab894675e0198d412d84b8525c2e..e4db0924898ce5b17d2b6d4269495bb968db2871 100644
> --- a/include/linux/spi/spi-mem.h
> +++ b/include/linux/spi/spi-mem.h
> @@ -43,6 +43,14 @@
>  		.dtr = true,					\
>  	}
>  
> +#define SPI_MEM_DTR_OP_RPT_ADDR(__val, __buswidth)		\

I find the name too generic. This is an macro for 1 byte addresses, right?

> +	{							\
> +		.nbytes = 2,					\
> +		.val = __val | __val << 8,			\
> +		.buswidth = __buswidth,				\
> +		.dtr = true,					\
> +	}
> +
>  #define SPI_MEM_OP_NO_ADDR	{ }
>  
>  #define SPI_MEM_OP_DUMMY(__nbytes, __buswidth)			\
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
