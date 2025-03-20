Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A06CC36005
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Mar 2025 12:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2dM5EmguTKwQFGRlB3I1OTQO86UVNbZnTBrZ9LBGnj4=; b=GclymuRNGo3yZ2
	j+ANro1LoR+ePzAwJHy21ASRo7UVGigx59+JAIBAMxv43nIRQt4ijc/6mVJYlwvbyvigfh65VX2ua
	PYg0QSMv5s3zpk1pKdNoA5u32teMyuREfbGW1sShzzekA7bmsUkuLh/LiUcB1RBZR+HXpO6SbwmjP
	evrDUaDRQC9WLml4Ctdm2P3da10t0OODA++Sot9pFQ7TUTF1qiedGJNzbRPi3YBGnrJYkW9aDOmAq
	7SJX+M74RBWtAFMgpabNRV/RnVJo2UFISu2UMocMAk+HUKgBNbkYRb84CJyMfrBGF9Zgk7nQ8iFkw
	shi3E8pjB7yIyN6o6L2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvEx6-0000000C6eV-2hpu;
	Thu, 20 Mar 2025 12:24:48 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvEuk-0000000C64t-2ymI
	for linux-mtd@lists.infradead.org;
	Thu, 20 Mar 2025 12:22:23 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso5055865e9.3
        for <linux-mtd@lists.infradead.org>; Thu, 20 Mar 2025 05:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742473341; x=1743078141; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VB7C72uv0q6FGUYx5k/EdSd4Dq+r1W0sd0YC2URqROM=;
        b=SP7gDZjpWwyj46i7S0bxJyo9/oFUe7jhq672mz3LLR9yA1GwddLA0xECRGwqoIXSwp
         6ZQG8srfxdlutOnMgUBJgIaG1L51DDdYAf/pkK8vGJP8x+Ff8XnfmJvmEhv3Z2vRoiMW
         4tecwPsICHHwjqMxZYEnSqtVCecriYRK0QgxVKkwLL06HGwAobMbzW+/eoAl5IILYxHY
         xdiWfxQ4W7eQ+usqV3fRQDnbeuSXL56Mj830ywUpnq7QNPVjTlXr+d1gdOT7vmk/uxcq
         a/h939e7yE3Ksxuon0jxkvFVv9hIkMryS7nLEzLyBjMK6yKOpzrne/2Gn5/ge+sdCgU1
         C6jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742473341; x=1743078141;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VB7C72uv0q6FGUYx5k/EdSd4Dq+r1W0sd0YC2URqROM=;
        b=HfrE99CG1LpkoUOTiZECsUM2YNY96apqSXsfDCu+DP+CDECI8suYpJw1HFUrG8Gv1W
         XfKSanMR9ciNVZW+kbisFflk+HgsvgQOjmxaFjo9kXA8zqCrRnlLfnGfe8FCBHIjqsFj
         HPkhyHhOCH7TJa31YRG1bbytK2iOJN3PGs+8drruDulgKFLG/l0lsQlbxmRTDyS2Myfq
         FT7WIq5854zYnNTEPLEsnm1gtM0tNxPq2NJdiHRzLE3ZUAAfdoYIAxAKRruH1BEor5I0
         wn4fFPZs418OWX2nJrK+KdRBB4x4lAMl4/D0J3W88FuQU6TaVwSnVanrulKSXY/a7niX
         aE3g==
X-Forwarded-Encrypted: i=1; AJvYcCXLf2YbduXFRb0lEN+DK1dvQS6IuSLsVpoz5RntvM4zgUYdZ5vXcubroCr5v5pUKTZb41vQOnbeBFo=@lists.infradead.org
X-Gm-Message-State: AOJu0YwFYDigNm9He0//tQrGtefjeqQJPLsYo96SZm28KEkVjc5uzpIX
	TIqPfyGL+7Wx64l9FqwpuCgD3kcv9zmN7QRr25oC+adExNS9M9j2GgKf/mAHNtechrQMtmd95s+
	w
X-Gm-Gg: ASbGncs6HXEKyJZ/pXPHmg/q7eYcbmDMtqPipZep69qzX+t6IQDL6dfLA+VWUGBc8lC
	S8xRbJTwg9L9V9n/DOf4RGAEhYvLxpXamzBij9BpOr2trGH8AtDMgsE1XUIMsTXOmFMNFeuDG52
	MWv53RR17wr5VgRBJMD6S+vD+SuNLVJPnFu5uyLVCVWSJGiLEhWvP9hH3pMpeyNuAwckMp9/gH4
	viBjzjGIA96HuFFrN9QtulaaeoSCtw78MydE/YGR0aEcYcQLo6GnQDBcbSmKJlJGI4rKOq0hrrF
	Psqo0cM6czFpqF2rAWZdjy9RPiSjrOBDyU4uSsvsZ8hb/DC+IL7/zg==
X-Google-Smtp-Source: AGHT+IEa4hSKgvDPWYGTY2ffk0ESLbrdnjJCFHK4rbjgFMQ6JpK5xa9Ql2PLLczNDIAmHxopLYeHzg==
X-Received: by 2002:a05:600c:3b92:b0:43d:abd:ad0e with SMTP id 5b1f17b1804b1-43d43875949mr64957505e9.18.1742473340892;
        Thu, 20 Mar 2025 05:22:20 -0700 (PDT)
Received: from [192.168.0.14] ([79.115.63.206])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c8975ae2sm24085743f8f.51.2025.03.20.05.22.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 05:22:20 -0700 (PDT)
Message-ID: <c4153f4a-667b-4b5f-8e2b-82c512df9515@linaro.org>
Date: Thu, 20 Mar 2025 12:22:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/21] mtd: spinand: Use more specific naming for the
 write enable/disable op
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Santhosh Kumar K <s-k6@ti.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steam Lin <stlin2@winbond.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250307-winbond-6-14-rc1-octal-v1-0-45c1e074ad74@bootlin.com>
 <20250307-winbond-6-14-rc1-octal-v1-2-45c1e074ad74@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250307-winbond-6-14-rc1-octal-v1-2-45c1e074ad74@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_052222_777726_7002873D 
X-CRM114-Status: GOOD (  16.75  )
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



On 3/7/25 3:08 PM, Miquel Raynal wrote:
> SPI operations have been initially described through macros implicitly
> implying the use of a single SPI SDR bus. Macros for supporting dual and
> quad I/O transfers have been added on top, generally inspired by vendor
> naming, followed by DTR operations. Soon we might see octal
> and even octal DTR operations as well (including the opcode byte).
> 
> Let's clarify what the macro really means by describing the expected bus
> topology in the write enable/disable macro names.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

> ---
>  drivers/mtd/nand/spi/core.c | 2 +-
>  include/linux/mtd/spinand.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
> index ea6b48242ad4a4e51c713907ce5cc55022cdb569..bbf0048104aac86e90b0706793db8503c8fc2a3b 100644
> --- a/drivers/mtd/nand/spi/core.c
> +++ b/drivers/mtd/nand/spi/core.c
> @@ -362,7 +362,7 @@ static void spinand_ondie_ecc_save_status(struct nand_device *nand, u8 status)
>  
>  static int spinand_write_enable_op(struct spinand_device *spinand)
>  {
> -	struct spi_mem_op op = SPINAND_WR_EN_DIS_OP(true);
> +	struct spi_mem_op op = SPINAND_WR_EN_DIS_1S_0_0_OP(true);
>  
>  	return spi_mem_exec_op(spinand->spimem, &op);
>  }
> diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
> index 4f47adbe4566d7813ffd8fbfaddd1a85d88d0208..0d2f92d0746e8079e46bac9402ddd22d3d2a86bf 100644
> --- a/include/linux/mtd/spinand.h
> +++ b/include/linux/mtd/spinand.h
> @@ -26,7 +26,7 @@
>  		   SPI_MEM_OP_NO_DUMMY,					\
>  		   SPI_MEM_OP_NO_DATA)
>  
> -#define SPINAND_WR_EN_DIS_OP(enable)					\
> +#define SPINAND_WR_EN_DIS_1S_0_0_OP(enable)				\
>  	SPI_MEM_OP(SPI_MEM_OP_CMD((enable) ? 0x06 : 0x04, 1),		\
>  		   SPI_MEM_OP_NO_ADDR,					\
>  		   SPI_MEM_OP_NO_DUMMY,					\
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
