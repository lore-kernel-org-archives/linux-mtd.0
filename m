Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E6C2C3601E
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Apr 2025 10:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I+dOoh/cmtFAw7wxRQ6qUk7iikxlnin9e0nDiHg9teo=; b=HMdqQigC7UrNkZ
	Ycj58QG1vdXB+50yluHd2yMlADDg1EsgV6Bi4L5DJ0FWR8bFTh7WKi8SwkN+tIaMjAftYK4BrsOQe
	5FpUaxXJtxZkrGPL8pjWXtsQCTd+nxwc9D3KmCgG9eDgoNhy3HhlV2T8a3mNLTvr4XlGF2q2okFGs
	VWbG9GKBx4GuJosFjadOXaB1MgMBHC0F/YdezHKhv8mD92AmY2vEYqEVHTSfZ1zHI9PSYEXZ539xs
	GaCgHOcO6Xj4igxOte1pxtWybCIQ2P89AMu/06QVhlt5nYUV8uiH9jcyEHmMGLXxSC04oXrCK1gBR
	9XQ2ZMJYdunr3g1uXpLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0HgM-00000008Y9n-0Qvf;
	Thu, 03 Apr 2025 10:20:22 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0HGC-00000008SmD-47Yv
	for linux-mtd@lists.infradead.org;
	Thu, 03 Apr 2025 09:53:22 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-39129fc51f8so591934f8f.0
        for <linux-mtd@lists.infradead.org>; Thu, 03 Apr 2025 02:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743673999; x=1744278799; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zgc8O9PHN7ofrUX2Uaw/x+1FDBIuy7ZJz69b2VTDG1s=;
        b=SvHBOVheY5Wpgqsvfgm2UfoLP3ijB+7Tx7gDz+oszR/9jSb0HwQMTHShC8q+hHkwBl
         Y0hun41BKBUkL5mNTACEznRnkVCA6LSPZACjCP0JPPS5FSpQ61gLifsxdKAV4b1f6v8+
         ElrmXyQEHA5j41FroKazJb4+Qkt4QD6jTLtCA+LQLcgDNSJW5N3CpyuaUXTn7Ipsh15m
         diFOAOF3A1oI2Uj6ZgeowB5+Qgy5KdQb4sBQNxJnWjV25hNFMfUWD4GQNAvmmWmuq+ld
         i7SfGZWlukQ1AxZQg4KtV7zo6gjAhpJfHYaGb0vfefGpAZxAKL8EUuDig2YxVblzj5tk
         6DxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743673999; x=1744278799;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zgc8O9PHN7ofrUX2Uaw/x+1FDBIuy7ZJz69b2VTDG1s=;
        b=HeogdPKPtl23jlJFW4kUJstNT/Y9CKspUcfkHAed/GoP4J6qA1oZvqX0fhDKcm5usm
         Atc/+z0PZKjR9qlbje2wge7E2E4tXR42j5XkLQx109wH+4i6Qc3A0Sqhd4WpDJgRISGS
         LLu0pUsBS/MgFhwT0FCWpsljnLg+ibTkeKMUErzhI7VM80IzHJRTJnZevVofhoWGVZOr
         b/3p3Z+Ic5FYfpnllCNp/U6bcBYuLqmc8GDeSsXlPmm7HdCnXIjWNE2VgPikvR0ih+Py
         9gi/imdTC9IWkQmZpwdN57Dw6HrsXFm0tdHxhDRDZGpPtXWqtxwJaTgrhKCm9dUhWTc+
         MnvA==
X-Forwarded-Encrypted: i=1; AJvYcCWrEKiVrBaPrxuAntdOC1lI8s+SfUMf9YfUM+Duh6KETNwnqJGfBjF0kxRQy3mfPzkKL2lRJGDpnKk=@lists.infradead.org
X-Gm-Message-State: AOJu0YxJ62xw/G+ZBDP25tvHDHSFTDbiBywyOpDWIZy5wnVLE8XcDOba
	XPji1OSwGSj8gg7d/y2Dce1qbg5NeSFRWmvHVvbWKrQ/xoaJtxjeUwXJjv0yeAA=
X-Gm-Gg: ASbGncsCfjHmDVTObeFqTDNFa3HIG4czRhlxLKPikgP7qAi2udvKEKFtNP9X1CVa5Ih
	eknBiNMHfATsPlGV3PnrwcN/1EnyclvtktY6Wl/zcf8W+M6J116fBMH+ya3alaqRZC10y3QBlL6
	dE8I5Sdy4OhdQVPq9faJa+cyCXXmlaQwl2k3FYEXipyYjYSpJ6Dk/T7KGgAR3BQdVLPHG7bS8Dk
	szytXbMKRPZ2ymGwf/RpRJjHc7pMJalANDV3TsbMkZqFxv6khsEvz/qDjUeAwEU3fL5YgxdIACN
	QlVKtU0FTTX4rLZhXY3H3dEar8gS+CBAsu2hjna+lfFuOnPKI2HnNg==
X-Google-Smtp-Source: AGHT+IFe7XIclM8+dBjWbfETadNP5kS4PWS+lDpQHA4kCXg9GvgjwYtOIIk3fBz5Pb77tsw0QeE4Yw==
X-Received: by 2002:a05:6000:23c7:b0:39c:cd5:4bc0 with SMTP id ffacd0b85a97d-39c1211b77amr10484270f8f.52.1743673999216;
        Thu, 03 Apr 2025 02:53:19 -0700 (PDT)
Received: from [192.168.0.14] ([79.115.63.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d6c8sm1305623f8f.73.2025.04.03.02.53.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 02:53:18 -0700 (PDT)
Message-ID: <f0e1ea2a-e775-405c-8342-dea1b6d05879@linaro.org>
Date: Thu, 3 Apr 2025 10:53:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/19] mtd: spinand: Use more specific naming for the
 (dual output) read from cache ops
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Santhosh Kumar K <s-k6@ti.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steam Lin <stlin2@winbond.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250403-winbond-6-14-rc1-octal-v2-0-7846bd88fe83@bootlin.com>
 <20250403-winbond-6-14-rc1-octal-v2-8-7846bd88fe83@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250403-winbond-6-14-rc1-octal-v2-8-7846bd88fe83@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_025321_048406_B0C5DC24 
X-CRM114-Status: GOOD (  17.36  )
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



On 4/3/25 10:19 AM, Miquel Raynal wrote:
> SPI operations have been initially described through macros implicitly
> implying the use of a single SPI SDR bus. Macros for supporting dual and
> quad I/O transfers have been added on top, generally inspired by vendor
> naming, followed by DTR operations. Soon we might see octal
> and even octal DTR operations as well (including the opcode byte).
> 
> Let's clarify what the macro really mean by describing the expected bus
> topology in the (dual output) read from cache macro names.
> 
> Acked-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

ah, my bad, I forgot I already gave R-b. maybe drop the acked-by when
applying.

> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/nand/spi/alliancememory.c | 2 +-
>  drivers/mtd/nand/spi/esmt.c           | 2 +-
>  drivers/mtd/nand/spi/foresee.c        | 2 +-
>  drivers/mtd/nand/spi/gigadevice.c     | 8 ++++----
>  drivers/mtd/nand/spi/macronix.c       | 2 +-
>  drivers/mtd/nand/spi/micron.c         | 4 ++--
>  drivers/mtd/nand/spi/paragon.c        | 2 +-
>  drivers/mtd/nand/spi/skyhigh.c        | 2 +-
>  drivers/mtd/nand/spi/toshiba.c        | 2 +-
>  drivers/mtd/nand/spi/winbond.c        | 6 +++---
>  drivers/mtd/nand/spi/xtx.c            | 2 +-
>  include/linux/mtd/spinand.h           | 6 +++---
>  12 files changed, 20 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/mtd/nand/spi/alliancememory.c b/drivers/mtd/nand/spi/alliancememory.c
> index 723c740308d26e901fd3d9a402ddd48e8e69060f..9709774dcf30be370c999f7ab445c1e684ef2210 100644
> --- a/drivers/mtd/nand/spi/alliancememory.c
> +++ b/drivers/mtd/nand/spi/alliancememory.c
> @@ -20,7 +20,7 @@ static SPINAND_OP_VARIANTS(read_cache_variants,
>  		SPINAND_PAGE_READ_FROM_CACHE_QUADIO_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_DUALIO_OP(0, 1, NULL, 0),
> -		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
> +		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_2S_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(0, 1, NULL, 0));
>  
> diff --git a/drivers/mtd/nand/spi/esmt.c b/drivers/mtd/nand/spi/esmt.c
> index aad751f95269b3f501aff01753c4bf0ff9484fbe..41fb4173af34429265c8db60851747e147c5a36c 100644
> --- a/drivers/mtd/nand/spi/esmt.c
> +++ b/drivers/mtd/nand/spi/esmt.c
> @@ -14,7 +14,7 @@
>  
>  static SPINAND_OP_VARIANTS(read_cache_variants,
>  			   SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
> -			   SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
> +			   SPINAND_PAGE_READ_FROM_CACHE_1S_1S_2S_OP(0, 1, NULL, 0),
>  			   SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(0, 1, NULL, 0),
>  			   SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(0, 1, NULL, 0));
>  
> diff --git a/drivers/mtd/nand/spi/foresee.c b/drivers/mtd/nand/spi/foresee.c
> index 8a9725ea29bac5901d67304db95ed5573bd7fa40..729dfde4292108fe588b317dbe8731b4f6535246 100644
> --- a/drivers/mtd/nand/spi/foresee.c
> +++ b/drivers/mtd/nand/spi/foresee.c
> @@ -13,7 +13,7 @@
>  
>  static SPINAND_OP_VARIANTS(read_cache_variants,
>  		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
> -		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
> +		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_2S_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(0, 1, NULL, 0));
>  
> diff --git a/drivers/mtd/nand/spi/gigadevice.c b/drivers/mtd/nand/spi/gigadevice.c
> index 76856f1de8fefc6404345e363b2c873cc3c02e52..d357f914765b294ec4288276cd826555bb50f735 100644
> --- a/drivers/mtd/nand/spi/gigadevice.c
> +++ b/drivers/mtd/nand/spi/gigadevice.c
> @@ -27,7 +27,7 @@ static SPINAND_OP_VARIANTS(read_cache_variants,
>  		SPINAND_PAGE_READ_FROM_CACHE_QUADIO_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_DUALIO_OP(0, 1, NULL, 0),
> -		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
> +		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_2S_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(0, 1, NULL, 0));
>  
> @@ -35,7 +35,7 @@ static SPINAND_OP_VARIANTS(read_cache_variants_f,
>  		SPINAND_PAGE_READ_FROM_CACHE_QUADIO_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_X4_OP_3A(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_DUALIO_OP(0, 1, NULL, 0),
> -		SPINAND_PAGE_READ_FROM_CACHE_X2_OP_3A(0, 1, NULL, 0),
> +		SPINAND_PAGE_READ_FROM_CACHE_3A_1S_1S_2S_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_FAST_3A_1S_1S_1S_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_3A_1S_1S_1S_OP(0, 0, NULL, 0));
>  
> @@ -43,7 +43,7 @@ static SPINAND_OP_VARIANTS(read_cache_variants_1gq5,
>  		SPINAND_PAGE_READ_FROM_CACHE_QUADIO_OP(0, 2, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_DUALIO_OP(0, 1, NULL, 0),
> -		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
> +		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_2S_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(0, 1, NULL, 0));
>  
> @@ -51,7 +51,7 @@ static SPINAND_OP_VARIANTS(read_cache_variants_2gq5,
>  		SPINAND_PAGE_READ_FROM_CACHE_QUADIO_OP(0, 4, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_DUALIO_OP(0, 2, NULL, 0),
> -		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
> +		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_2S_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(0, 1, NULL, 0));
>  
> diff --git a/drivers/mtd/nand/spi/macronix.c b/drivers/mtd/nand/spi/macronix.c
> index 59bd476a29f03967a3f5a814872f9a6039b0a585..4d7820e8952871df2ccd9b17610fa403d347574f 100644
> --- a/drivers/mtd/nand/spi/macronix.c
> +++ b/drivers/mtd/nand/spi/macronix.c
> @@ -27,7 +27,7 @@ struct macronix_priv {
>  
>  static SPINAND_OP_VARIANTS(read_cache_variants,
>  		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
> -		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
> +		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_2S_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(0, 1, NULL, 0));
>  
> diff --git a/drivers/mtd/nand/spi/micron.c b/drivers/mtd/nand/spi/micron.c
> index d7dbd22db1a3f8457c8947f4044dd8442dc475cb..8d06091cef05365f58fa3f593f2c8de9413af099 100644
> --- a/drivers/mtd/nand/spi/micron.c
> +++ b/drivers/mtd/nand/spi/micron.c
> @@ -32,7 +32,7 @@ static SPINAND_OP_VARIANTS(quadio_read_cache_variants,
>  		SPINAND_PAGE_READ_FROM_CACHE_QUADIO_OP(0, 2, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_DUALIO_OP(0, 1, NULL, 0),
> -		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
> +		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_2S_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(0, 1, NULL, 0));
>  
> @@ -47,7 +47,7 @@ static SPINAND_OP_VARIANTS(x4_update_cache_variants,
>  /* Micron  MT29F2G01AAAED Device */
>  static SPINAND_OP_VARIANTS(x4_read_cache_variants,
>  			   SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
> -			   SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
> +			   SPINAND_PAGE_READ_FROM_CACHE_1S_1S_2S_OP(0, 1, NULL, 0),
>  			   SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(0, 1, NULL, 0),
>  			   SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(0, 1, NULL, 0));
>  
> diff --git a/drivers/mtd/nand/spi/paragon.c b/drivers/mtd/nand/spi/paragon.c
> index ae3527d6d5fa358be482eb8cf0ba4e1e2304e441..b4daee6c9b2f4782bbb2ed3400c71406e34f0fdd 100644
> --- a/drivers/mtd/nand/spi/paragon.c
> +++ b/drivers/mtd/nand/spi/paragon.c
> @@ -25,7 +25,7 @@ static SPINAND_OP_VARIANTS(read_cache_variants,
>  		SPINAND_PAGE_READ_FROM_CACHE_QUADIO_OP(0, 2, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_DUALIO_OP(0, 1, NULL, 0),
> -		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
> +		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_2S_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(0, 1, NULL, 0));
>  
> diff --git a/drivers/mtd/nand/spi/skyhigh.c b/drivers/mtd/nand/spi/skyhigh.c
> index ffbedb8d92f659967f6aa0c80d5b0aa7d088929c..e03343f0c404ad62d0567ef83045e4db7a675c46 100644
> --- a/drivers/mtd/nand/spi/skyhigh.c
> +++ b/drivers/mtd/nand/spi/skyhigh.c
> @@ -20,7 +20,7 @@ static SPINAND_OP_VARIANTS(read_cache_variants,
>  		SPINAND_PAGE_READ_FROM_CACHE_QUADIO_OP(0, 4, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_DUALIO_OP(0, 2, NULL, 0),
> -		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
> +		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_2S_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(0, 1, NULL, 0));
>  
> diff --git a/drivers/mtd/nand/spi/toshiba.c b/drivers/mtd/nand/spi/toshiba.c
> index bc5adadf6084f48ff482d6846be1c6d2e9157e85..a497de9241b65f9fa6e8ae43f629b4a35977d375 100644
> --- a/drivers/mtd/nand/spi/toshiba.c
> +++ b/drivers/mtd/nand/spi/toshiba.c
> @@ -16,7 +16,7 @@
>  
>  static SPINAND_OP_VARIANTS(read_cache_variants,
>  		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
> -		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
> +		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_2S_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(0, 1, NULL, 0));
>  
> diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
> index 8379a1d12dd563e573c6d37cf099759088176da4..66f272ed734a8f95d974153005a8fea637bef0d2 100644
> --- a/drivers/mtd/nand/spi/winbond.c
> +++ b/drivers/mtd/nand/spi/winbond.c
> @@ -29,9 +29,9 @@ static SPINAND_OP_VARIANTS(read_cache_dtr_variants,
>  		SPINAND_PAGE_READ_FROM_CACHE_QUADIO_OP(0, 2, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_DUALIO_DTR_OP(0, 4, NULL, 0, 80 * HZ_PER_MHZ),
> -		SPINAND_PAGE_READ_FROM_CACHE_X2_DTR_OP(0, 2, NULL, 0, 80 * HZ_PER_MHZ),
> +		SPINAND_PAGE_READ_FROM_CACHE_1S_1D_2D_OP(0, 2, NULL, 0, 80 * HZ_PER_MHZ),
>  		SPINAND_PAGE_READ_FROM_CACHE_DUALIO_OP(0, 1, NULL, 0),
> -		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
> +		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_2S_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_1S_1D_1D_OP(0, 2, NULL, 0, 80 * HZ_PER_MHZ),
>  		SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(0, 1, NULL, 0, 54 * HZ_PER_MHZ));
> @@ -40,7 +40,7 @@ static SPINAND_OP_VARIANTS(read_cache_variants,
>  		SPINAND_PAGE_READ_FROM_CACHE_QUADIO_OP(0, 2, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_DUALIO_OP(0, 1, NULL, 0),
> -		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
> +		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_2S_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(0, 1, NULL, 0));
>  
> diff --git a/drivers/mtd/nand/spi/xtx.c b/drivers/mtd/nand/spi/xtx.c
> index a0003f52ae8f52ab00374fedc457476136a78568..08dc4a3efbb0238b21eaedcd2b76d4ed7b4b0294 100644
> --- a/drivers/mtd/nand/spi/xtx.c
> +++ b/drivers/mtd/nand/spi/xtx.c
> @@ -26,7 +26,7 @@ static SPINAND_OP_VARIANTS(read_cache_variants,
>  		SPINAND_PAGE_READ_FROM_CACHE_QUADIO_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_DUALIO_OP(0, 1, NULL, 0),
> -		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
> +		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_2S_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(0, 1, NULL, 0));
>  
> diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
> index 868d983b4544d88965f9bd52830e39e8c8c34346..a3387beb51e958ef366310a462782137b6122931 100644
> --- a/include/linux/mtd/spinand.h
> +++ b/include/linux/mtd/spinand.h
> @@ -94,19 +94,19 @@
>  		   SPI_MEM_DTR_OP_DATA_IN(len, buf, 1),			\
>  		   SPI_MEM_OP_MAX_FREQ(freq))
>  
> -#define SPINAND_PAGE_READ_FROM_CACHE_X2_OP(addr, ndummy, buf, len)	\
> +#define SPINAND_PAGE_READ_FROM_CACHE_1S_1S_2S_OP(addr, ndummy, buf, len) \
>  	SPI_MEM_OP(SPI_MEM_OP_CMD(0x3b, 1),				\
>  		   SPI_MEM_OP_ADDR(2, addr, 1),				\
>  		   SPI_MEM_OP_DUMMY(ndummy, 1),				\
>  		   SPI_MEM_OP_DATA_IN(len, buf, 2))
>  
> -#define SPINAND_PAGE_READ_FROM_CACHE_X2_OP_3A(addr, ndummy, buf, len)	\
> +#define SPINAND_PAGE_READ_FROM_CACHE_3A_1S_1S_2S_OP(addr, ndummy, buf, len) \
>  	SPI_MEM_OP(SPI_MEM_OP_CMD(0x3b, 1),				\
>  		   SPI_MEM_OP_ADDR(3, addr, 1),				\
>  		   SPI_MEM_OP_DUMMY(ndummy, 1),				\
>  		   SPI_MEM_OP_DATA_IN(len, buf, 2))
>  
> -#define SPINAND_PAGE_READ_FROM_CACHE_X2_DTR_OP(addr, ndummy, buf, len, freq) \
> +#define SPINAND_PAGE_READ_FROM_CACHE_1S_1D_2D_OP(addr, ndummy, buf, len, freq) \
>  	SPI_MEM_OP(SPI_MEM_OP_CMD(0x3d, 1),				\
>  		   SPI_MEM_DTR_OP_ADDR(2, addr, 1),			\
>  		   SPI_MEM_DTR_OP_DUMMY(ndummy, 1),			\
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
