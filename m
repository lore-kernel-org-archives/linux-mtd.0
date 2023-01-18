Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0554CC32793
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Jan 2023 07:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4O+g0Uwq9B2BJR9xdXD1GiZ8i5+uCdcUZAGFYKr+VF8=; b=3lYCDvFbBPgPOY
	HjUdkel7tIRGT8zU1r3aI0tLoZRyz1XZX3j+9ciD7KJD6oaaDRaDmdYSSh4h9vhhDadm1lFU84l0K
	4Q/scWppJKtDSBS2U8UBtVqGY3qYVyDL+KYkjJWT/3v4xm7+gbTyTH9RFu8cWqRe63k4d635ASzY/
	RJACqVpsMgiAKYXg5LC/3+z7C2MYjCIgIfEkj9VOgunJkmgpR0NDny6/D/hW80lkKanfy1vkOnt7/
	s0gmFab5ZntN5FV40R1f8tqq8VPnGHqV+P2p85UGPTrPE3foBgeWL0kvmImJIkz5U+Tw6CtbD1SoW
	nDJncVCdXI5UFDh6B3Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI2ns-00HBbV-Rb; Wed, 18 Jan 2023 07:24:12 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI2np-00HBaQ-84
	for linux-mtd@lists.infradead.org; Wed, 18 Jan 2023 07:24:10 +0000
Received: by mail-pf1-x42d.google.com with SMTP id s3so22945769pfd.12
        for <linux-mtd@lists.infradead.org>; Tue, 17 Jan 2023 23:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DRsy6Tf59JjulV0+WgTGaZgtmTcvnG3t7VjVeyu3WvU=;
        b=nI0J1XGlcyq4AlJ5HMTkA9IXKzeiFARXEio1SQtyLXlZ07ao7x+SsV51HBq2V9Udaf
         QBrR0ELUPCwzg8wo1aJ5cT/l7GRfp3bIkP42X1BDZPRe/EP+voUTjfQxFg0UO71p9VHr
         /AuU2GEs1sSjAHAbNtV5arOFNhB06JkvmPfy+sQgpWTmWvvKDKM9Lv8R/GfN4YAnIVnN
         IWRFGA5xoF7zVpXIkLBs8XXP+3iSZ/ktspHMDEipxxHeDqY96rYKVkPnqQrccy/jbdvo
         f/4T9aUXdIVYnOtbdf1b7cEFg7FRPhYq4m6qdDnCEQeeiITRy9SwqrFMG3yczUOPlDAA
         517g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DRsy6Tf59JjulV0+WgTGaZgtmTcvnG3t7VjVeyu3WvU=;
        b=JLqynFwAYvnHBAG/Bes1Lelvgouv61YlyOpdK74V3klI1nXmDwXF+8c0+EO5/hw2dz
         vLOuQEnvBJXOUQ6aiEuOEu38AozbesFaJIh2tbw3zIUD4TmMFJZQJtPfAu/yJctkkeQb
         oARYPDOx4gBNCclvhlJNAs1mq3tnkAC7Lp4eOPTeWJ9Qezg9wixHviUD5vFbzDSS4qEv
         F4u7YtL+ocaKDc7mkvQ0aPlzrXeJUMqqvuxIopz9XD9ACYC2XYN4i8RSO8+UXSo4BitF
         vmnX5nk3cEzWiT/6G8Q0vHXUuDQX+8KcOsaFDIXALG687QnAdAmexrHd2pI6zweujNoO
         UJZQ==
X-Gm-Message-State: AFqh2kpcPpFJTC9TSThCmaXt5dx8HFu4T7KIJGBlFaf/XXiES8cPCcdq
	IkQIIRxOATGwJz0PbGnSxiU=
X-Google-Smtp-Source: AMrXdXsCPhNZOKoMUe6Wpke98EokRYNIP4v6CJMcawPFa3bTRifkfzsQdx3C0Ilv2AjItrpx81breQ==
X-Received: by 2002:a05:6a00:190e:b0:58b:c1a1:4006 with SMTP id y14-20020a056a00190e00b0058bc1a14006mr7078216pfi.18.1674026645194;
        Tue, 17 Jan 2023 23:24:05 -0800 (PST)
Received: from [192.168.0.10] (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id b28-20020aa7951c000000b0056bcb102e7bsm7100561pfp.68.2023.01.17.23.24.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jan 2023 23:24:04 -0800 (PST)
Message-ID: <7f6875d1-41cd-5d2c-303e-507193ef4b06@gmail.com>
Date: Wed, 18 Jan 2023 16:24:01 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 2/2] mtd: spi-nor: spansion: Make CFRx reg fields generic
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Takahiro.Kuwano@infineon.com
Cc: linux-mtd@lists.infradead.org, pratyush@kernel.org, michael@walle.cc,
 miquel.raynal@bootlin.com, richard@nod.at, Bacem.Daassi@infineon.com
References: <493d9a10-aaf3-70f6-36c3-9a2cf39f0759@linaro.org>
 <20230110164703.83413-1-tudor.ambarus@linaro.org>
 <20230110164703.83413-2-tudor.ambarus@linaro.org>
Content-Language: en-US
From: Takahiro Kuwano <tkuw584924@gmail.com>
In-Reply-To: <20230110164703.83413-2-tudor.ambarus@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_232409_335734_93D98473 
X-CRM114-Status: GOOD (  17.47  )
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

On 1/11/2023 1:47 AM, Tudor Ambarus wrote:
> Cypress defines two flavors of configuration registers, volatile and
> non volatile, and both use the same bit fields. Rename the bitfields in
> the configuration registers so that they can be used for both flavors.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  drivers/mtd/spi-nor/spansion.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
> index 07fe0f6fdfe3..12a256c0ef4c 100644
> --- a/drivers/mtd/spi-nor/spansion.c
> +++ b/drivers/mtd/spi-nor/spansion.c
> @@ -15,19 +15,19 @@
>  #define SPINOR_OP_RD_ANY_REG			0x65	/* Read any register */
>  #define SPINOR_OP_WR_ANY_REG			0x71	/* Write any register */
>  #define SPINOR_REG_CYPRESS_CFR1V		0x00800002
> -#define SPINOR_REG_CYPRESS_CFR1V_QUAD_EN	BIT(1)	/* Quad Enable */
> +#define SPINOR_REG_CYPRESS_CFR1_QUAD_EN		BIT(1)	/* Quad Enable */
>  #define SPINOR_REG_CYPRESS_CFR2V		0x00800003
> -#define SPINOR_REG_CYPRESS_CFR2V_MEMLAT_11_24	0xb
> +#define SPINOR_REG_CYPRESS_CFR2_MEMLAT_11_24	0xb
>  #define SPINOR_REG_CYPRESS_CFR3V		0x00800004
> -#define SPINOR_REG_CYPRESS_CFR3V_PGSZ		BIT(4) /* Page size. */
> +#define SPINOR_REG_CYPRESS_CFR3_PGSZ		BIT(4) /* Page size. */
>  #define SPINOR_REG_CYPRESS_CFR5V		0x00800006
>  #define SPINOR_REG_CYPRESS_CFR5_BIT6		BIT(6)
>  #define SPINOR_REG_CYPRESS_CFR5_DDR		BIT(1)
>  #define SPINOR_REG_CYPRESS_CFR5_OPI		BIT(0)
> -#define SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_EN				\
> +#define SPINOR_REG_CYPRESS_CFR5_OCT_DTR_EN				\
>  	(SPINOR_REG_CYPRESS_CFR5_BIT6 |	SPINOR_REG_CYPRESS_CFR5_DDR |	\
>  	 SPINOR_REG_CYPRESS_CFR5_OPI)
> -#define SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_DS	SPINOR_REG_CYPRESS_CFR5_BIT6
> +#define SPINOR_REG_CYPRESS_CFR5_OCT_DTR_DS	SPINOR_REG_CYPRESS_CFR5_BIT6
>  #define SPINOR_OP_CYPRESS_RD_FAST		0xee
>  
>  /* Cypress SPI NOR flash operations. */
> @@ -57,7 +57,7 @@ static int cypress_nor_octal_dtr_en(struct spi_nor *nor)
>  	u8 addr_mode_nbytes = nor->params->addr_mode_nbytes;
>  
>  	/* Use 24 dummy cycles for memory array reads. */
> -	*buf = SPINOR_REG_CYPRESS_CFR2V_MEMLAT_11_24;
> +	*buf = SPINOR_REG_CYPRESS_CFR2_MEMLAT_11_24;
>  	op = (struct spi_mem_op)
>  		CYPRESS_NOR_WR_ANY_REG_OP(addr_mode_nbytes,
>  					  SPINOR_REG_CYPRESS_CFR2V, 1, buf);
> @@ -69,7 +69,7 @@ static int cypress_nor_octal_dtr_en(struct spi_nor *nor)
>  	nor->read_dummy = 24;
>  
>  	/* Set the octal and DTR enable bits. */
> -	buf[0] = SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_EN;
> +	buf[0] = SPINOR_REG_CYPRESS_CFR5_OCT_DTR_EN;
>  	op = (struct spi_mem_op)
>  		CYPRESS_NOR_WR_ANY_REG_OP(addr_mode_nbytes,
>  					  SPINOR_REG_CYPRESS_CFR5V, 1, buf);
> @@ -103,7 +103,7 @@ static int cypress_nor_octal_dtr_dis(struct spi_nor *nor)
>  	 * in 8D-8D-8D mode. Since there is no register at the next location,
>  	 * just initialize the value to 0 and let the transaction go on.
>  	 */
> -	buf[0] = SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_DS;
> +	buf[0] = SPINOR_REG_CYPRESS_CFR5_OCT_DTR_DS;
>  	buf[1] = 0;
>  	op = (struct spi_mem_op)
>  		CYPRESS_NOR_WR_ANY_REG_OP(nor->addr_nbytes,
> @@ -155,11 +155,11 @@ static int cypress_nor_quad_enable_volatile(struct spi_nor *nor)
>  	if (ret)
>  		return ret;
>  
> -	if (nor->bouncebuf[0] & SPINOR_REG_CYPRESS_CFR1V_QUAD_EN)
> +	if (nor->bouncebuf[0] & SPINOR_REG_CYPRESS_CFR1_QUAD_EN)
>  		return 0;
>  
>  	/* Update the Quad Enable bit. */
> -	nor->bouncebuf[0] |= SPINOR_REG_CYPRESS_CFR1V_QUAD_EN;
> +	nor->bouncebuf[0] |= SPINOR_REG_CYPRESS_CFR1_QUAD_EN;
>  	op = (struct spi_mem_op)
>  		CYPRESS_NOR_WR_ANY_REG_OP(addr_mode_nbytes,
>  					  SPINOR_REG_CYPRESS_CFR1V, 1,
> @@ -210,7 +210,7 @@ static int cypress_nor_set_page_size(struct spi_nor *nor)
>  	if (ret)
>  		return ret;
>  
> -	if (nor->bouncebuf[0] & SPINOR_REG_CYPRESS_CFR3V_PGSZ)
> +	if (nor->bouncebuf[0] & SPINOR_REG_CYPRESS_CFR3_PGSZ)
>  		nor->params->page_size = 512;
>  	else
>  		nor->params->page_size = 256;

Reviewed-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
