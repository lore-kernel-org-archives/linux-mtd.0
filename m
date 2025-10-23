Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08627CCF9E0
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Oct 2025 07:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AjfZMb4x1pmufoWhXTqKzGzVcxSGoapJSDXjmqzhhGg=; b=p6Zgiiuai/5NCF
	gO6uXq+Kvtt/8wScdEaweTtUfTgl4WdRJNIX+lSjtVuIqu76eh5iSIwk8uMpgX5qYjOUVwUe4LbRx
	Vz9fy9FJKSRHkR29AVIB5zDhiaekvJPAp39xEAk6Um+ySAWtEXeMrLKRP4u+qOE8YPXaUCjTck/ym
	z7jbiM5Ckp/YxeHOftKL+5rmXN/Qyfw9uN237nFzav9GsQHuufyc000DA3k7eRVx/tE2ncd0ZS3ir
	lejC2DswcQRF64dxOySN+w21QpmjPtyyByqcI28eiUA1mwQetdrLARuBzz48a+etDZiMpMoqDU4Pr
	+oD/Jmreb4PXK6CdtrvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBphk-00000005Lvu-32T7;
	Thu, 23 Oct 2025 07:25:48 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBphh-00000005Luh-3qQC
	for linux-mtd@lists.infradead.org;
	Thu, 23 Oct 2025 07:25:47 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-47117e75258so3177565e9.2
        for <linux-mtd@lists.infradead.org>; Thu, 23 Oct 2025 00:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761204344; x=1761809144; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vSw39SqLym77Kz0EfuXzuM8L9Cr8WdrcJwSU8kcy73A=;
        b=Su+Zlxqfkl6LEPCToMcN/rECR4+L/qlolkfyNgvLjNPRBYQUD7O1UmyFIRLS0/J5r9
         6XnRN0vI0Qn+MsdZEcUVmDlyam0XiyS93626b655Am5j/hRUaklfxg5xoiRpLBZ/KMUr
         TDZOsWBLKsdIc/Rlq5NY+aCT0mO8tYuMS+9nE3Wp8j5cDdKXq7J37F5wQKF1/hljoVxx
         lqKSL8tEispRYjpFYzKNSqX84e0JBPhCCEofhM+8yerLSrnyi+URLY26V0sy9QLntXWI
         w0oJfVrfC4OI82/tu5Zd7zi/iQ7lWf3ZDlU+PafRZ3me4HtMY7h8pqHVZlEgNzpVYc5e
         zqvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761204344; x=1761809144;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vSw39SqLym77Kz0EfuXzuM8L9Cr8WdrcJwSU8kcy73A=;
        b=ACUeyXiCzJPgdbyxeE3beaxR882mLEYCscSAsgHd+056smaZMD6Go6NuILOTvKkCsP
         6z0zyEPsaG4ZW2vyT39CPaHDp8FpzGuRthLKs1qqomYkOKiH/eQEqYosLxHwx5r9rmvu
         Hpmmia5ceL+EYfcIsZEpXjyhSLySftLf8duUw05bBvvDdTjQlZbC0oFqvqXrPfiQt5JT
         8fDn53EQfMOoiusHT8jARU4SRsyHwiKdytmxPwE9NTQqbLESI0wLzOStQs7HCDo3Eghf
         pJw560FANT/LlpF6WF1EWZx2hm2l5vNrEBBLgm53TIed5yQJoROeoDHEDWYZJp6wDryT
         1mng==
X-Gm-Message-State: AOJu0YzDDS/iBzrkqsbVRExSkdz0d1gZ+5MEiqtTxdGkVllPrV1K6qGT
	MlY08bmH9Sk72GzG5p1FFoUUp4sThueQgR4cd5e9vg675Bs7czPlDMzoPLN3ZckCOxM=
X-Gm-Gg: ASbGncuuPN0MW9Mlk5YosuliAqFgmYbPQj/Sz+NOmXwR1Pb6TMTy2dDNF+gkGXNF3Vq
	6xK6AH4EMdL9+FV1lT5T+6t+6JfvbitYsgO15rZef4d4gyAj9L7K1gzM8RqoPMgNL16Yss1XuaL
	GRyWlPf1IoN0is6O7Qauz697aANYXVLgteGnJ7uPwgzJbPORK7FNWZsEPZBGTLTBCLTkyDyHTnr
	gSy8eOz11ccTSIdQ7827Tx6axhkZa9o38h8DacczQQCtjNtamghvCEbX3weT+q+G99La4Ft1jk8
	9dd81Q3s4z7xFJlM4w9JpathqCRzDCLwXRdSZtmxRUXKb6J2OGHWsR9tykYSL4Kaegu864MhAhi
	lheUCcW9PRJTHmoCMk+63IXdekOM14rfunWVTMSjTO6yZZ2+0KVrTzBr4i2vm3692+RaETcYiW1
	Vibdfh8FZr
X-Google-Smtp-Source: AGHT+IF9nR8Ok+zwbm9/f5vQvS2ChRoQgsa3Zb3XVq4vKe0l+/WhD27/DmLD8deyWjml5hAHlzgCiw==
X-Received: by 2002:a05:600c:4686:b0:46f:b340:75e7 with SMTP id 5b1f17b1804b1-475caf92ae1mr9003785e9.8.1761204343558;
        Thu, 23 Oct 2025 00:25:43 -0700 (PDT)
Received: from [10.11.12.107] ([79.115.63.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c4369b5esm94386495e9.15.2025.10.23.00.25.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 00:25:42 -0700 (PDT)
Message-ID: <59c3d45b-13ff-4393-a87c-f0504f224acb@linaro.org>
Date: Thu, 23 Oct 2025 08:25:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] mtd: spi-nor: sfdp: introduce smpt_read_dummy fixup
 hook
To: Takahiro Kuwano <tkuw584924@gmail.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <20251022-s25fs-s-smpt-fixup-v1-0-ce26d4084b2d@infineon.com>
 <20251022-s25fs-s-smpt-fixup-v1-1-ce26d4084b2d@infineon.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20251022-s25fs-s-smpt-fixup-v1-1-ce26d4084b2d@infineon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_002545_995052_EE5BEA16 
X-CRM114-Status: GOOD (  27.27  )
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

Hi, Takahiro,

On 10/22/25 11:07 AM, Takahiro Kuwano wrote:
> SMPT contains config detection info that descibes opcode, address, and

typo: describes> dummy cycles to read sector map config. The dummy cycles parameter can
> be 'variable' and should be determined in device specific fixup hook.

This doesn't describe why we need the hook. I'd advise to describe what
value has nor->read_dummy before the fixup hook (zero you said), why the
zero value does always fit some flashes like the IFX one, which for that
particular read reg command it always needs 8 dummy cycles. This also
reveals that the SMPT table on that flash instead of defining
SMPT_CMD_READ_DUMMY_IS_VARIABLE is should have actually used the number of
needed dummy cycles: 8.

Please adapt and add something around these lines, otherwise in 5 years
from now we'll forget what was this about.

The patch looks okay to me.
Cheers,
ta

> 
> Inroduce smpt_read_dummy() in struct spi_nor_fixups. It is called when
> the dummy cycle field in SMPT config detection is 'varialble'.
> 
> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> ---
>  drivers/mtd/spi-nor/core.h |  3 +++
>  drivers/mtd/spi-nor/sfdp.c | 18 ++++++++++++++++--
>  2 files changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index ceff412f7d65ab7b856795ca5c092cddbf598cd6..5ad46d95d09cc9d527f71579a71eed210e726f68 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -409,6 +409,8 @@ struct spi_nor_flash_parameter {
>   *                flash parameters when information provided by the flash_info
>   *                table is incomplete or wrong.
>   * @post_bfpt: called after the BFPT table has been parsed
> + * @smpt_read_dummy: called during SMPT table is being parsed. Used to fix the
> + *                   number of dummy cycles in read register ops.
>   * @post_sfdp: called after SFDP has been parsed (is also called for SPI NORs
>   *             that do not support RDSFDP). Typically used to tweak various
>   *             parameters that could not be extracted by other means (i.e.
> @@ -426,6 +428,7 @@ struct spi_nor_fixups {
>  	int (*post_bfpt)(struct spi_nor *nor,
>  			 const struct sfdp_parameter_header *bfpt_header,
>  			 const struct sfdp_bfpt *bfpt);
> +	void (*smpt_read_dummy)(const struct spi_nor *nor, u8 *read_dummy);
>  	int (*post_sfdp)(struct spi_nor *nor);
>  	int (*late_init)(struct spi_nor *nor);
>  };
> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> index 21727f9a4ac6926080a116e30830c9533122fdad..9a47dcaca06ae2ad85ac8503658083b1d56d8b96 100644
> --- a/drivers/mtd/spi-nor/sfdp.c
> +++ b/drivers/mtd/spi-nor/sfdp.c
> @@ -699,6 +699,17 @@ static u8 spi_nor_smpt_addr_nbytes(const struct spi_nor *nor, const u32 settings
>  	}
>  }
>  
> +static void spi_nor_smpt_read_dummy_fixups(const struct spi_nor *nor,
> +					   u8 *read_dummy)
> +{
> +	if (nor->manufacturer && nor->manufacturer->fixups &&
> +	    nor->manufacturer->fixups->smpt_read_dummy)
> +		nor->manufacturer->fixups->smpt_read_dummy(nor, read_dummy);
> +
> +	if (nor->info->fixups && nor->info->fixups->smpt_read_dummy)
> +		nor->info->fixups->smpt_read_dummy(nor, read_dummy);
> +}
> +
>  /**
>   * spi_nor_smpt_read_dummy() - return the configuration detection command read
>   *			       latency, in clock cycles.
> @@ -711,8 +722,11 @@ static u8 spi_nor_smpt_read_dummy(const struct spi_nor *nor, const u32 settings)
>  {
>  	u8 read_dummy = SMPT_CMD_READ_DUMMY(settings);
>  
> -	if (read_dummy == SMPT_CMD_READ_DUMMY_IS_VARIABLE)
> -		return nor->read_dummy;
> +	if (read_dummy == SMPT_CMD_READ_DUMMY_IS_VARIABLE) {
> +		read_dummy = nor->read_dummy;
> +		spi_nor_smpt_read_dummy_fixups(nor, &read_dummy);
> +	}
> +
>  	return read_dummy;
>  }
>  
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
