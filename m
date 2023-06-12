Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AAF0C7EE23
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Jun 2023 11:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3u6zpduD6w7cLmuWDh3ALl0lxo9YAtBZoVbhR9lIWV4=; b=awPc1bi/X4PhmR
	/qOcpZoOLZIK3qjFDpBiaZ/sIaTsqG/89aYNhPxZOdcUB5WooviDUExaZpRn3KtBZsbciO+/VoTh3
	+KjpgYj3xjYFAN9aatAU0T7zgss6gHLxJgqO7iTa8lknMshi5rQu8iCBKrk94lBkBL9hniweK4OU0
	tSu3w3AiEl1HJjedjklt+aq2OdtqQ8NJBwZV2adx896pZ+QagbEJS6TVg7j43M0G7Oq5M3PNvE91A
	NvVrWQHzncfXfJvt+SMa9Tgak07kRqxdC4pBhMGZlpgV1HyDBCwtz5MKITtKNqeMTRA45/sm0OLK+
	9kDUe+tVjmAbkLHCFztg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8fYP-003k2v-38;
	Mon, 12 Jun 2023 11:17:45 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8fYM-003k27-2z
	for linux-mtd@lists.infradead.org;
	Mon, 12 Jun 2023 11:17:44 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5151934a4e3so6275874a12.1
        for <linux-mtd@lists.infradead.org>; Mon, 12 Jun 2023 04:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686568659; x=1689160659;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5BcPrLPlIMQPHwSNq4zrypAjg+me/RI6+6gosaz7ywM=;
        b=CawF3645TOIhdX7FpDo3bLIZv4+8BASXCpkWui61xkaRB8VHShTJVWN/4RpPiSC+VB
         okEatXEeubGr9LVH62Qiyy2jxmHO40fjLYRnxoS/oyWe4WwH5nLD9gRMBrwz3hiZ2wZn
         CCdb7nU/TEJlpR6mil2zb0sTkYWTRvWQLnwsmQUFtp3nMdF7rvwXtrMZptJdZgkzGdXZ
         sSpBG+JJYMJQxnqmImMeFp3jfD+AoZv7nMhkbevfDyrKdpwNNwy75f0r4z7SUAjrwKk0
         GQ6PbyfHfaXXwTOWndJiTKmbdvcS4y9wU2QTNdoYpquzjgBsS8l4OKPr9goyCrSaRMop
         JkNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686568659; x=1689160659;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5BcPrLPlIMQPHwSNq4zrypAjg+me/RI6+6gosaz7ywM=;
        b=V+dqWcuYsNhfQcs9FY/myJJlNlHifh+qywHjFhaDnXMMfLDOCFbMbOXU+YFzhXAEcW
         Up7a4gYidvO+XU/rUNIcLNEFS1eO9nLeZG6h17vEbhELC3jKQladft+pQ43pNCEnszmb
         a99/1n6b7GlgTqpyN8h5RS50TU4dns3dB/FwvXifzas/0LacQ95nj8NM2UoaECJB8Da0
         BUjbuxbBuRBLc80hiVv8zOa+Xqph7v6flusvd0Evt/YAVr2LYu6DGIzGMnQ97i4ziUmj
         K+fM2r9qzSqR7EpbIa6bGjZK8T1ajye1kKmLO7jXD7yoUplyHVDErQqfpJ/RwiZ5WYt6
         qL7A==
X-Gm-Message-State: AC+VfDxJaaiHHPkVbt5h4+5GdS1Mi6fu75FeUPGh2XAN4brrIGnMm5mT
	kSlY96PiOvF+dqGKj23BBO42Yg==
X-Google-Smtp-Source: ACHHUZ6F1JN8d4U4yYEbS1UhGDPOjllC00sCR0jns7ExUjKkFfSo3z5Zjzt1TrcihRw4vQjR9iMLhQ==
X-Received: by 2002:a17:906:58ce:b0:965:8edf:8028 with SMTP id e14-20020a17090658ce00b009658edf8028mr9224589ejs.42.1686568659063;
        Mon, 12 Jun 2023 04:17:39 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.153])
        by smtp.gmail.com with ESMTPSA id sa1-20020a170906eda100b009745a6d1b37sm5005448ejb.202.2023.06.12.04.17.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 04:17:38 -0700 (PDT)
Message-ID: <890b58bb-8a74-c68e-2396-1d8990ce922c@linaro.org>
Date: Mon, 12 Jun 2023 12:17:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] mtd: spi-nor: spansion: CLPEF as an alternative to CLSR
Content-Language: en-US
To: tkuw584924@gmail.com, linux-mtd@lists.infradead.org
Cc: pratyush@kernel.org, michael@walle.cc, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, d-gole@ti.com, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <20230609081459.885-1-Takahiro.Kuwano@infineon.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230609081459.885-1-Takahiro.Kuwano@infineon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230612_041742_975035_18D167EF 
X-CRM114-Status: GOOD (  25.96  )
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



On 6/9/23 09:14, tkuw584924@gmail.com wrote:
> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> 
> Infineon S28Hx (SEMPER Octal) and S25FS256T (SEMPER Nano) support Clear
> Program and Erase Failure Flags (CLPEF, 82h) instead of CLSR(30h).
> Introduce a new mfr_flag and rework spansion_nor_clear_sr() to add a way
> to clear status in these devices. S25Hx (SEMPER QSPI) supports CLSR but
> it may be disabled by CFR3x[2] while CLPEF is always available.
> Therefore, the mfr_flag is also applied to S25Hx for safety.
> 
> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> ---
>  drivers/mtd/spi-nor/spansion.c | 37 ++++++++++++++++++++++++++--------
>  1 file changed, 29 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
> index 15f9a80c10b9..f2f4bc060f5e 100644
> --- a/drivers/mtd/spi-nor/spansion.c
> +++ b/drivers/mtd/spi-nor/spansion.c
> @@ -10,8 +10,10 @@
>  
>  /* flash_info mfr_flag. Used to clear sticky prorietary SR bits. */
>  #define USE_CLSR	BIT(0)
> +#define USE_CLPEF	BIT(1)
>  
>  #define SPINOR_OP_CLSR		0x30	/* Clear status register 1 */
> +#define SPINOR_OP_CLPEF		0x82	/* Clear program/erase failure flags */
>  #define SPINOR_OP_RD_ANY_REG			0x65	/* Read any register */
>  #define SPINOR_OP_WR_ANY_REG			0x71	/* Write any register */
>  #define SPINOR_REG_CYPRESS_VREG			0x00800000
> @@ -63,23 +65,35 @@
>  		   SPI_MEM_OP_NO_DUMMY,					\
>  		   SPI_MEM_OP_NO_DATA)
>  
> +#define SPANSION_CLPEF_OP						\
> +	SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_CLPEF, 0),			\
> +		   SPI_MEM_OP_NO_ADDR,					\
> +		   SPI_MEM_OP_NO_DUMMY,					\
> +		   SPI_MEM_OP_NO_DATA)
> +
>  /**
>   * spansion_nor_clear_sr() - Clear the Status Register.
>   * @nor:	pointer to 'struct spi_nor'.
>   */
>  static void spansion_nor_clear_sr(struct spi_nor *nor)
>  {
> +	u8 use_clpef = nor->info->mfr_flags & USE_CLPEF;
>  	int ret;
>  
>  	if (nor->spimem) {
> -		struct spi_mem_op op = SPANSION_CLSR_OP;
> +		struct spi_mem_op op;
> +
> +		if (use_clpef)
> +			op = (struct spi_mem_op)SPANSION_CLPEF_OP;
> +		else
> +			op = (struct spi_mem_op)SPANSION_CLSR_OP;

we can get rid of the if else if we introduce a MFR OP struct and use
the opcode directly.

>  
>  		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
>  
>  		ret = spi_mem_exec_op(nor->spimem, &op);
>  	} else {
> -		ret = spi_nor_controller_ops_write_reg(nor, SPINOR_OP_CLSR,
> -						       NULL, 0);
> +		ret = spi_nor_controller_ops_write_reg(nor,
> +			use_clpef ? SPINOR_OP_CLPEF : SPINOR_OP_CLSR, NULL, 0);

no new support for the controllers under spi-nor/, let the else case as
it was.

>  	}
>  
>  	if (ret)
> @@ -792,47 +806,54 @@ static const struct flash_info spansion_nor_parts[] = {
>  		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
>  	{ "s25fs256t",  INFO6(0x342b19, 0x0f0890, 0, 0)
>  		PARSE_SFDP
> +		MFR_FLAGS(USE_CLPEF)
>  		.fixups = &s25fs256t_fixups },
>  	{ "s25hl512t",  INFO6(0x342a1a, 0x0f0390, 256 * 1024, 256)
>  		PARSE_SFDP
> -		MFR_FLAGS(USE_CLSR)
> +		MFR_FLAGS(USE_CLPEF)
>  		.fixups = &s25hx_t_fixups },
>  	{ "s25hl01gt",  INFO6(0x342a1b, 0x0f0390, 256 * 1024, 512)
>  		PARSE_SFDP
> -		MFR_FLAGS(USE_CLSR)
> +		MFR_FLAGS(USE_CLPEF)
>  		.fixups = &s25hx_t_fixups },
>  	{ "s25hl02gt",  INFO6(0x342a1c, 0x0f0090, 0, 0)
>  		PARSE_SFDP
> +		MFR_FLAGS(USE_CLPEF)
>  		FLAGS(NO_CHIP_ERASE)
>  		.fixups = &s25hx_t_fixups },
>  	{ "s25hs512t",  INFO6(0x342b1a, 0x0f0390, 256 * 1024, 256)
>  		PARSE_SFDP
> -		MFR_FLAGS(USE_CLSR)
> +		MFR_FLAGS(USE_CLPEF)
>  		.fixups = &s25hx_t_fixups },
>  	{ "s25hs01gt",  INFO6(0x342b1b, 0x0f0390, 256 * 1024, 512)
>  		PARSE_SFDP
> -		MFR_FLAGS(USE_CLSR)
> +		MFR_FLAGS(USE_CLPEF)
>  		.fixups = &s25hx_t_fixups },
>  	{ "s25hs02gt",  INFO6(0x342b1c, 0x0f0090, 0, 0)
>  		PARSE_SFDP
> +		MFR_FLAGS(USE_CLPEF)
>  		FLAGS(NO_CHIP_ERASE)
>  		.fixups = &s25hx_t_fixups },
>  	{ "cy15x104q",  INFO6(0x042cc2, 0x7f7f7f, 512 * 1024, 1)
>  		FLAGS(SPI_NOR_NO_ERASE) },
>  	{ "s28hl512t",   INFO(0x345a1a,      0, 256 * 1024, 256)
>  		PARSE_SFDP
> +		MFR_FLAGS(USE_CLPEF)
>  		.fixups = &s28hx_t_fixups,
>  	},
>  	{ "s28hl01gt",   INFO(0x345a1b,      0, 256 * 1024, 512)
>  		PARSE_SFDP
> +		MFR_FLAGS(USE_CLPEF)
>  		.fixups = &s28hx_t_fixups,
>  	},
>  	{ "s28hs512t",   INFO(0x345b1a,      0, 256 * 1024, 256)
>  		PARSE_SFDP
> +		MFR_FLAGS(USE_CLPEF)
>  		.fixups = &s28hx_t_fixups,
>  	},
>  	{ "s28hs01gt",   INFO(0x345b1b,      0, 256 * 1024, 512)
>  		PARSE_SFDP
> +		MFR_FLAGS(USE_CLPEF)
>  		.fixups = &s28hx_t_fixups,
>  	},
>  };
> @@ -885,7 +906,7 @@ static void spansion_nor_late_init(struct spi_nor *nor)
>  		nor->mtd.erasesize = nor->info->sector_size;
>  	}
>  
> -	if (nor->info->mfr_flags & USE_CLSR)
> +	if (nor->info->mfr_flags & (USE_CLSR|USE_CLPEF))

have you run ./scripts/checkpatch --strict and it did not complain on this?

>  		nor->params->ready = spansion_nor_sr_ready_and_clear;
>  }
>  

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
