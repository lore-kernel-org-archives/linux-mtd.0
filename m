Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76F89C3601E
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Apr 2025 10:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o1jeGtq+8Rk5c/bKHEV0snelq691Fkli8qst+ylUMKU=; b=ypZplHmaWLNLSO
	DOuW8iygfAcNfko3hyqUVkjj6Xw7d86nYezXu5ij5PWkj7jsp/+bd09ZsO/JSoSMV2TiJs3EhNEat
	nUcj64rI2Em/Cn1eKVzooyiyvLf/kuuYiMCWn4tl1vs8CqhG8+Wpk968YygHw3u8IPSgpKxp9rwB5
	mqfI3FwZiAfOVVMFkd+d8FNvZdtaJoL+ICM6JyAoEEw/mxJaMaD5UJVIkV/Pfz7X0ZFr0R6AAVBKP
	ZtBaenYEItCKd4Zgx8zaKNI1ngIpSliB/Fl4cDug2nmOlXjl9id5ngIVF6mAdrWUmrh0q4+4Uo1rj
	7wwJWd3mjKZURBQTghVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Hec-00000008Xqh-0X5V;
	Thu, 03 Apr 2025 10:18:34 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0HE5-00000008SR6-353p
	for linux-mtd@lists.infradead.org;
	Thu, 03 Apr 2025 09:51:11 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4394036c0efso4222095e9.2
        for <linux-mtd@lists.infradead.org>; Thu, 03 Apr 2025 02:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743673868; x=1744278668; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qz+wTex84HxR9hjDkpBqo0t+c4uTz2yvssMo9Eniq78=;
        b=jDgXC9rfRPMf/IvWb4+SGZfl7cFqpU6uQlp8y2WAToooL/R4+QlPE11Ub0WFTJ9YYr
         NiVU0aDzcZBZLSconfn5CtytbcSTvl1YRxzdKTiMm92T5v9kgNOKUeN5SwuO/Iax6aFM
         ujfQ001U6nKqpfi+YNHBdcRBtEA9/nEmEVcfSVnmvX3UyCnFquMt5n/E1w0gumpBQnl4
         ypW6TyULc/ZS7VLA0oP6+Psqfzf3IG1JHBkPMUxMS3N/XCEcxg/lCeY89yI7YD9L3Hic
         Gk/M2KTa8dKulKwNN5TWVteoCmlts2aHRO2OUS/KT+GwCezyGHtGdtfosxfT3TKpq5tf
         DPhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743673868; x=1744278668;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qz+wTex84HxR9hjDkpBqo0t+c4uTz2yvssMo9Eniq78=;
        b=edXN4r1RkmHidEY/5+N7zby9yPtS8MyXhK3RYzDH48wyf3Ru1OG6wMN0cOcXIf/+Qy
         5SUwAGnUZ9sN0ftbePEvvaY6J1C/3IUuZHhOitgDzoQ1Sfn1cVR4t3U+UYDvIues3PUl
         YnB8udf1QOTIHrkLZ3syYZOBkq2qSITue14TfBfIS92wsySoC37z/Zn8aLcXSLiO3JoS
         Ax+viOPiKmHROJd/tVazVjeT9/uvavuhgVWT2Jp/guteyZZngfNX9EKD/1mpRva11Gbt
         izCWqUI8ruLqjGGBgeslaFjX7eWSEJAjww8HZZrMuLTiuyAlAn0frLoXfvGx4c+Uzr2Q
         XSKQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/RPJ/hGI/jVcZabHso9wVtqCtGkZjaQxVGQhBQfyhnBEveQaz25i26HrlN1oq2Qvha2gcoLfSBb8=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywjsz01nOSF48S7TIY6tgFnVCWUVjfuzJyp0ViAne7Lh/z0CwH+
	BVKSRjiUgiFCCccyr37Luo2zurt6iz2TON5YEuqZxclaK0W84GPTq4IeULXdC00=
X-Gm-Gg: ASbGncsUbNCal+fw7MMZ9o890X+lBAuxBThc7wzFU5uCwZ+kySLYzTV+GMBfFCZMWBs
	W65VM0eEmPkE6GgTJYsybIJRAWFkKOwXFu9i4VZFeToCoXQKERmy68r06UuF2Arbczc+k0OhwKS
	NSa2sQ7g9QmUeF3lKyc5DZf91kVMbn4WTZtDVC3SdyxbCsd42jX6Kokb+F13LKaFAlEwmXd6lxh
	jxTR9JKj1g989kORz1j8iSPamR+X9NhxkEws+a9eSfPg2hFioyWSo5MzueVWZWsgMPbC0/FMBdt
	MXvAPqumLz9EvrsvjPhZWxS5UGwTssdJaa5q52eMmWWoxyRC6CFSvA==
X-Google-Smtp-Source: AGHT+IEIXqJmQGNM4WrsnpKhF9Sm8XZJvJ7OgSqwDtk2VARx0U0o19gRdCAZ+vFE3HaVEb0xqdwcAw==
X-Received: by 2002:a05:600c:468c:b0:43c:fa3f:8e5d with SMTP id 5b1f17b1804b1-43db61b52e5mr213840145e9.2.1743673867963;
        Thu, 03 Apr 2025 02:51:07 -0700 (PDT)
Received: from [192.168.0.14] ([79.115.63.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec366b571sm13288845e9.40.2025.04.03.02.51.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 02:51:07 -0700 (PDT)
Message-ID: <4df5c39b-5692-4d71-b381-aa8df1ce1fd7@linaro.org>
Date: Thu, 3 Apr 2025 10:51:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/19] mtd: spinand: Use more specific naming for the
 (single) read from cache ops
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Santhosh Kumar K <s-k6@ti.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steam Lin <stlin2@winbond.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250403-winbond-6-14-rc1-octal-v2-0-7846bd88fe83@bootlin.com>
 <20250403-winbond-6-14-rc1-octal-v2-7-7846bd88fe83@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250403-winbond-6-14-rc1-octal-v2-7-7846bd88fe83@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_025109_815546_E0CA8DCC 
X-CRM114-Status: GOOD (  16.42  )
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
> topology in the (single) read from cache macro names.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Acked-by: Tudor Ambarus <tudor.ambarus@linaro.org>

> ---
>  drivers/mtd/nand/spi/alliancememory.c |  4 ++--
>  drivers/mtd/nand/spi/ato.c            |  4 ++--
>  drivers/mtd/nand/spi/esmt.c           |  4 ++--
>  drivers/mtd/nand/spi/foresee.c        |  4 ++--
>  drivers/mtd/nand/spi/gigadevice.c     | 16 ++++++++--------
>  drivers/mtd/nand/spi/macronix.c       |  4 ++--
>  drivers/mtd/nand/spi/micron.c         |  8 ++++----
>  drivers/mtd/nand/spi/paragon.c        |  4 ++--
>  drivers/mtd/nand/spi/skyhigh.c        |  4 ++--
>  drivers/mtd/nand/spi/toshiba.c        |  4 ++--
>  drivers/mtd/nand/spi/winbond.c        | 10 +++++-----
>  drivers/mtd/nand/spi/xtx.c            |  4 ++--
>  include/linux/mtd/spinand.h           | 12 ++++++------
>  13 files changed, 41 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/mtd/nand/spi/alliancememory.c b/drivers/mtd/nand/spi/alliancememory.c
> index 6046c73f8424e9fb338ec3a1d35dc6fe30a2e1bc..723c740308d26e901fd3d9a402ddd48e8e69060f 100644
> --- a/drivers/mtd/nand/spi/alliancememory.c
> +++ b/drivers/mtd/nand/spi/alliancememory.c
> @@ -21,8 +21,8 @@ static SPINAND_OP_VARIANTS(read_cache_variants,
>  		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_DUALIO_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
> -		SPINAND_PAGE_READ_FROM_CACHE_FAST_OP(0, 1, NULL, 0),
> -		SPINAND_PAGE_READ_FROM_CACHE_OP(0, 1, NULL, 0));
> +		SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(0, 1, NULL, 0),
> +		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(0, 1, NULL, 0));
>  
>  static SPINAND_OP_VARIANTS(write_cache_variants,
>  			   SPINAND_PROG_LOAD_X4(true, 0, NULL, 0),
> diff --git a/drivers/mtd/nand/spi/ato.c b/drivers/mtd/nand/spi/ato.c
> index bb5298911137f08c1793d244b33dddf1971e2fed..9026a14aca07ce011af151eb6dfe56797e0e70c0 100644
> --- a/drivers/mtd/nand/spi/ato.c
> +++ b/drivers/mtd/nand/spi/ato.c
> @@ -15,8 +15,8 @@
>  
>  static SPINAND_OP_VARIANTS(read_cache_variants,
>  		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
> -		SPINAND_PAGE_READ_FROM_CACHE_FAST_OP(0, 1, NULL, 0),
> -		SPINAND_PAGE_READ_FROM_CACHE_OP(0, 1, NULL, 0));
> +		SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(0, 1, NULL, 0),
> +		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(0, 1, NULL, 0));
>  
>  static SPINAND_OP_VARIANTS(write_cache_variants,
>  		SPINAND_PROG_LOAD_X4(true, 0, NULL, 0),
> diff --git a/drivers/mtd/nand/spi/esmt.c b/drivers/mtd/nand/spi/esmt.c
> index 323a20901fc9fcc252b8317d9434aabf5e30a495..aad751f95269b3f501aff01753c4bf0ff9484fbe 100644
> --- a/drivers/mtd/nand/spi/esmt.c
> +++ b/drivers/mtd/nand/spi/esmt.c
> @@ -15,8 +15,8 @@
>  static SPINAND_OP_VARIANTS(read_cache_variants,
>  			   SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
>  			   SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
> -			   SPINAND_PAGE_READ_FROM_CACHE_FAST_OP(0, 1, NULL, 0),
> -			   SPINAND_PAGE_READ_FROM_CACHE_OP(0, 1, NULL, 0));
> +			   SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(0, 1, NULL, 0),
> +			   SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(0, 1, NULL, 0));
>  
>  static SPINAND_OP_VARIANTS(write_cache_variants,
>  			   SPINAND_PROG_LOAD_X4(true, 0, NULL, 0),
> diff --git a/drivers/mtd/nand/spi/foresee.c b/drivers/mtd/nand/spi/foresee.c
> index ecd5f6bffa33423abddf750b34b823a640fa2c23..8a9725ea29bac5901d67304db95ed5573bd7fa40 100644
> --- a/drivers/mtd/nand/spi/foresee.c
> +++ b/drivers/mtd/nand/spi/foresee.c
> @@ -14,8 +14,8 @@
>  static SPINAND_OP_VARIANTS(read_cache_variants,
>  		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
> -		SPINAND_PAGE_READ_FROM_CACHE_FAST_OP(0, 1, NULL, 0),
> -		SPINAND_PAGE_READ_FROM_CACHE_OP(0, 1, NULL, 0));
> +		SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(0, 1, NULL, 0),
> +		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(0, 1, NULL, 0));
>  
>  static SPINAND_OP_VARIANTS(write_cache_variants,
>  		SPINAND_PROG_LOAD_X4(true, 0, NULL, 0),
> diff --git a/drivers/mtd/nand/spi/gigadevice.c b/drivers/mtd/nand/spi/gigadevice.c
> index 73a483227831518a480dc34de17efdaa398b5627..76856f1de8fefc6404345e363b2c873cc3c02e52 100644
> --- a/drivers/mtd/nand/spi/gigadevice.c
> +++ b/drivers/mtd/nand/spi/gigadevice.c
> @@ -28,32 +28,32 @@ static SPINAND_OP_VARIANTS(read_cache_variants,
>  		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_DUALIO_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
> -		SPINAND_PAGE_READ_FROM_CACHE_FAST_OP(0, 1, NULL, 0),
> -		SPINAND_PAGE_READ_FROM_CACHE_OP(0, 1, NULL, 0));
> +		SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(0, 1, NULL, 0),
> +		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(0, 1, NULL, 0));
>  
>  static SPINAND_OP_VARIANTS(read_cache_variants_f,
>  		SPINAND_PAGE_READ_FROM_CACHE_QUADIO_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_X4_OP_3A(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_DUALIO_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_X2_OP_3A(0, 1, NULL, 0),
> -		SPINAND_PAGE_READ_FROM_CACHE_FAST_OP_3A(0, 1, NULL, 0),
> -		SPINAND_PAGE_READ_FROM_CACHE_OP_3A(0, 0, NULL, 0));
> +		SPINAND_PAGE_READ_FROM_CACHE_FAST_3A_1S_1S_1S_OP(0, 1, NULL, 0),
> +		SPINAND_PAGE_READ_FROM_CACHE_3A_1S_1S_1S_OP(0, 0, NULL, 0));
>  
>  static SPINAND_OP_VARIANTS(read_cache_variants_1gq5,
>  		SPINAND_PAGE_READ_FROM_CACHE_QUADIO_OP(0, 2, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_DUALIO_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
> -		SPINAND_PAGE_READ_FROM_CACHE_FAST_OP(0, 1, NULL, 0),
> -		SPINAND_PAGE_READ_FROM_CACHE_OP(0, 1, NULL, 0));
> +		SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(0, 1, NULL, 0),
> +		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(0, 1, NULL, 0));
>  
>  static SPINAND_OP_VARIANTS(read_cache_variants_2gq5,
>  		SPINAND_PAGE_READ_FROM_CACHE_QUADIO_OP(0, 4, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_DUALIO_OP(0, 2, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
> -		SPINAND_PAGE_READ_FROM_CACHE_FAST_OP(0, 1, NULL, 0),
> -		SPINAND_PAGE_READ_FROM_CACHE_OP(0, 1, NULL, 0));
> +		SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(0, 1, NULL, 0),
> +		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(0, 1, NULL, 0));
>  
>  static SPINAND_OP_VARIANTS(write_cache_variants,
>  		SPINAND_PROG_LOAD_X4(true, 0, NULL, 0),
> diff --git a/drivers/mtd/nand/spi/macronix.c b/drivers/mtd/nand/spi/macronix.c
> index 3dc4d63d6832d0213387f335fd233f1c4306bfff..59bd476a29f03967a3f5a814872f9a6039b0a585 100644
> --- a/drivers/mtd/nand/spi/macronix.c
> +++ b/drivers/mtd/nand/spi/macronix.c
> @@ -28,8 +28,8 @@ struct macronix_priv {
>  static SPINAND_OP_VARIANTS(read_cache_variants,
>  		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
> -		SPINAND_PAGE_READ_FROM_CACHE_FAST_OP(0, 1, NULL, 0),
> -		SPINAND_PAGE_READ_FROM_CACHE_OP(0, 1, NULL, 0));
> +		SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(0, 1, NULL, 0),
> +		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(0, 1, NULL, 0));
>  
>  static SPINAND_OP_VARIANTS(write_cache_variants,
>  		SPINAND_PROG_LOAD_X4(true, 0, NULL, 0),
> diff --git a/drivers/mtd/nand/spi/micron.c b/drivers/mtd/nand/spi/micron.c
> index 6ec20fad837bc534cfa0bc7cc629622a7dfab5da..d7dbd22db1a3f8457c8947f4044dd8442dc475cb 100644
> --- a/drivers/mtd/nand/spi/micron.c
> +++ b/drivers/mtd/nand/spi/micron.c
> @@ -33,8 +33,8 @@ static SPINAND_OP_VARIANTS(quadio_read_cache_variants,
>  		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_DUALIO_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
> -		SPINAND_PAGE_READ_FROM_CACHE_FAST_OP(0, 1, NULL, 0),
> -		SPINAND_PAGE_READ_FROM_CACHE_OP(0, 1, NULL, 0));
> +		SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(0, 1, NULL, 0),
> +		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(0, 1, NULL, 0));
>  
>  static SPINAND_OP_VARIANTS(x4_write_cache_variants,
>  		SPINAND_PROG_LOAD_X4(true, 0, NULL, 0),
> @@ -48,8 +48,8 @@ static SPINAND_OP_VARIANTS(x4_update_cache_variants,
>  static SPINAND_OP_VARIANTS(x4_read_cache_variants,
>  			   SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
>  			   SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
> -			   SPINAND_PAGE_READ_FROM_CACHE_FAST_OP(0, 1, NULL, 0),
> -			   SPINAND_PAGE_READ_FROM_CACHE_OP(0, 1, NULL, 0));
> +			   SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(0, 1, NULL, 0),
> +			   SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(0, 1, NULL, 0));
>  
>  static SPINAND_OP_VARIANTS(x1_write_cache_variants,
>  			   SPINAND_PROG_LOAD(true, 0, NULL, 0));
> diff --git a/drivers/mtd/nand/spi/paragon.c b/drivers/mtd/nand/spi/paragon.c
> index 6e7cc6995380c00ae40fe362f711a490ff463130..ae3527d6d5fa358be482eb8cf0ba4e1e2304e441 100644
> --- a/drivers/mtd/nand/spi/paragon.c
> +++ b/drivers/mtd/nand/spi/paragon.c
> @@ -26,8 +26,8 @@ static SPINAND_OP_VARIANTS(read_cache_variants,
>  		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_DUALIO_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
> -		SPINAND_PAGE_READ_FROM_CACHE_FAST_OP(0, 1, NULL, 0),
> -		SPINAND_PAGE_READ_FROM_CACHE_OP(0, 1, NULL, 0));
> +		SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(0, 1, NULL, 0),
> +		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(0, 1, NULL, 0));
>  
>  static SPINAND_OP_VARIANTS(write_cache_variants,
>  		SPINAND_PROG_LOAD_X4(true, 0, NULL, 0),
> diff --git a/drivers/mtd/nand/spi/skyhigh.c b/drivers/mtd/nand/spi/skyhigh.c
> index 961df0d74984a8dc8484ac5d7323d172012058e5..ffbedb8d92f659967f6aa0c80d5b0aa7d088929c 100644
> --- a/drivers/mtd/nand/spi/skyhigh.c
> +++ b/drivers/mtd/nand/spi/skyhigh.c
> @@ -21,8 +21,8 @@ static SPINAND_OP_VARIANTS(read_cache_variants,
>  		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_DUALIO_OP(0, 2, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
> -		SPINAND_PAGE_READ_FROM_CACHE_FAST_OP(0, 1, NULL, 0),
> -		SPINAND_PAGE_READ_FROM_CACHE_OP(0, 1, NULL, 0));
> +		SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(0, 1, NULL, 0),
> +		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(0, 1, NULL, 0));
>  
>  static SPINAND_OP_VARIANTS(write_cache_variants,
>  		SPINAND_PROG_LOAD_X4(true, 0, NULL, 0),
> diff --git a/drivers/mtd/nand/spi/toshiba.c b/drivers/mtd/nand/spi/toshiba.c
> index a600aa771519fa04a1caafb8c8e636eab10359c4..bc5adadf6084f48ff482d6846be1c6d2e9157e85 100644
> --- a/drivers/mtd/nand/spi/toshiba.c
> +++ b/drivers/mtd/nand/spi/toshiba.c
> @@ -17,8 +17,8 @@
>  static SPINAND_OP_VARIANTS(read_cache_variants,
>  		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
> -		SPINAND_PAGE_READ_FROM_CACHE_FAST_OP(0, 1, NULL, 0),
> -		SPINAND_PAGE_READ_FROM_CACHE_OP(0, 1, NULL, 0));
> +		SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(0, 1, NULL, 0),
> +		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(0, 1, NULL, 0));
>  
>  static SPINAND_OP_VARIANTS(write_cache_x4_variants,
>  		SPINAND_PROG_LOAD_X4(true, 0, NULL, 0),
> diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
> index 5816b489b57b0070ddeda745cf17c04efc5080cd..8379a1d12dd563e573c6d37cf099759088176da4 100644
> --- a/drivers/mtd/nand/spi/winbond.c
> +++ b/drivers/mtd/nand/spi/winbond.c
> @@ -32,17 +32,17 @@ static SPINAND_OP_VARIANTS(read_cache_dtr_variants,
>  		SPINAND_PAGE_READ_FROM_CACHE_X2_DTR_OP(0, 2, NULL, 0, 80 * HZ_PER_MHZ),
>  		SPINAND_PAGE_READ_FROM_CACHE_DUALIO_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
> -		SPINAND_PAGE_READ_FROM_CACHE_DTR_OP(0, 2, NULL, 0, 80 * HZ_PER_MHZ),
> -		SPINAND_PAGE_READ_FROM_CACHE_FAST_OP(0, 1, NULL, 0),
> -		SPINAND_PAGE_READ_FROM_CACHE_OP(0, 1, NULL, 0, 54 * HZ_PER_MHZ));
> +		SPINAND_PAGE_READ_FROM_CACHE_1S_1D_1D_OP(0, 2, NULL, 0, 80 * HZ_PER_MHZ),
> +		SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(0, 1, NULL, 0),
> +		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(0, 1, NULL, 0, 54 * HZ_PER_MHZ));
>  
>  static SPINAND_OP_VARIANTS(read_cache_variants,
>  		SPINAND_PAGE_READ_FROM_CACHE_QUADIO_OP(0, 2, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_DUALIO_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
> -		SPINAND_PAGE_READ_FROM_CACHE_FAST_OP(0, 1, NULL, 0),
> -		SPINAND_PAGE_READ_FROM_CACHE_OP(0, 1, NULL, 0));
> +		SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(0, 1, NULL, 0),
> +		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(0, 1, NULL, 0));
>  
>  static SPINAND_OP_VARIANTS(write_cache_variants,
>  		SPINAND_PROG_LOAD_X4(true, 0, NULL, 0),
> diff --git a/drivers/mtd/nand/spi/xtx.c b/drivers/mtd/nand/spi/xtx.c
> index 3f539ca0de861c082217701607f96c2a6b7c5378..a0003f52ae8f52ab00374fedc457476136a78568 100644
> --- a/drivers/mtd/nand/spi/xtx.c
> +++ b/drivers/mtd/nand/spi/xtx.c
> @@ -27,8 +27,8 @@ static SPINAND_OP_VARIANTS(read_cache_variants,
>  		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_DUALIO_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
> -		SPINAND_PAGE_READ_FROM_CACHE_FAST_OP(0, 1, NULL, 0),
> -		SPINAND_PAGE_READ_FROM_CACHE_OP(0, 1, NULL, 0));
> +		SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(0, 1, NULL, 0),
> +		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(0, 1, NULL, 0));
>  
>  static SPINAND_OP_VARIANTS(write_cache_variants,
>  		SPINAND_PROG_LOAD_X4(true, 0, NULL, 0),
> diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
> index 10b2c1279c0e2e0e3ddec3b4ce93e7fe25402c9f..868d983b4544d88965f9bd52830e39e8c8c34346 100644
> --- a/include/linux/mtd/spinand.h
> +++ b/include/linux/mtd/spinand.h
> @@ -62,32 +62,32 @@
>  		   SPI_MEM_OP_NO_DUMMY,					\
>  		   SPI_MEM_OP_NO_DATA)
>  
> -#define SPINAND_PAGE_READ_FROM_CACHE_OP(addr, ndummy, buf, len, ...) \
> +#define SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(addr, ndummy, buf, len, ...) \
>  	SPI_MEM_OP(SPI_MEM_OP_CMD(0x03, 1),				\
>  		   SPI_MEM_OP_ADDR(2, addr, 1),				\
>  		   SPI_MEM_OP_DUMMY(ndummy, 1),				\
>  		   SPI_MEM_OP_DATA_IN(len, buf, 1),			\
>  		   SPI_MEM_OP_MAX_FREQ(__VA_ARGS__ + 0))
>  
> -#define SPINAND_PAGE_READ_FROM_CACHE_FAST_OP(addr, ndummy, buf, len) \
> -	SPI_MEM_OP(SPI_MEM_OP_CMD(0x0b, 1),			\
> +#define SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(addr, ndummy, buf, len) \
> +	SPI_MEM_OP(SPI_MEM_OP_CMD(0x0b, 1),				\
>  			 SPI_MEM_OP_ADDR(2, addr, 1),			\
>  			 SPI_MEM_OP_DUMMY(ndummy, 1),			\
>  			 SPI_MEM_OP_DATA_IN(len, buf, 1))
>  
> -#define SPINAND_PAGE_READ_FROM_CACHE_OP_3A(addr, ndummy, buf, len) \
> +#define SPINAND_PAGE_READ_FROM_CACHE_3A_1S_1S_1S_OP(addr, ndummy, buf, len) \
>  	SPI_MEM_OP(SPI_MEM_OP_CMD(0x03, 1),				\
>  		   SPI_MEM_OP_ADDR(3, addr, 1),				\
>  		   SPI_MEM_OP_DUMMY(ndummy, 1),				\
>  		   SPI_MEM_OP_DATA_IN(len, buf, 1))
>  
> -#define SPINAND_PAGE_READ_FROM_CACHE_FAST_OP_3A(addr, ndummy, buf, len) \
> +#define SPINAND_PAGE_READ_FROM_CACHE_FAST_3A_1S_1S_1S_OP(addr, ndummy, buf, len) \
>  	SPI_MEM_OP(SPI_MEM_OP_CMD(0x0b, 1),				\
>  		   SPI_MEM_OP_ADDR(3, addr, 1),				\
>  		   SPI_MEM_OP_DUMMY(ndummy, 1),				\
>  		   SPI_MEM_OP_DATA_IN(len, buf, 1))
>  
> -#define SPINAND_PAGE_READ_FROM_CACHE_DTR_OP(addr, ndummy, buf, len, freq) \
> +#define SPINAND_PAGE_READ_FROM_CACHE_1S_1D_1D_OP(addr, ndummy, buf, len, freq) \
>  	SPI_MEM_OP(SPI_MEM_OP_CMD(0x0d, 1),				\
>  		   SPI_MEM_DTR_OP_ADDR(2, addr, 1),			\
>  		   SPI_MEM_DTR_OP_DUMMY(ndummy, 1),			\
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
