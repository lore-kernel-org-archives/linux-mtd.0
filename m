Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18CC9C7EE23
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Jun 2023 12:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vRtcDrcBdzfMQi2FUPvuZ54/HS18ZhzIT1yJQjpAnI4=; b=wiVPRSDuEzttVQ
	nAatTITVn9RfcMimGi6suMMiZkej/ZrEccYmy2wXi6hvzDcdd9z66TLZo1nLTqciZhA8pswP3M3rX
	mbOSyhg9kDzQet/ObvuDNr9ZS9MKKND1XEkx+lhDOLslkzxLeBy9PWq0Eyqno2mDu5P+orjsbQa+Y
	f1Mx71blmWs6LsjMwhwCTUF5PaakUJmTwGP6Tce007TaQrduXz19TGVqUMIsH51To6EQviJKbWDan
	+7ZMvNxhEn1U2aM/B1j3Xbglug0B3khcUA9trdqgOFx35tfjCDZMW7zxLJkleH9SApJnmhEyvCjET
	VF6MS1wFtDBK5z3tFWKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8gIt-003vh7-0Q;
	Mon, 12 Jun 2023 12:05:47 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8gIp-003veJ-1G
	for linux-mtd@lists.infradead.org;
	Mon, 12 Jun 2023 12:05:45 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-30ae141785bso3970810f8f.3
        for <linux-mtd@lists.infradead.org>; Mon, 12 Jun 2023 05:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686571539; x=1689163539;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uZ+JPJZJ4R9J7LmZxdokcz8n4SAPNQ5qljzgeMJIhoA=;
        b=oYP9iUZE7L2PLFEoVwrj0nLjK3oCXtOo1lxjfFCdTEsDCDCKpfLFbZZb/gw7qJK0IT
         Hsxpm8bcF16/yB13jgC0p6YQY2J+1c0pqXariJk3Vx3DOImMRT+05XntAB8Yl4t6uymO
         YNYISu7+LYMNTRZkR9rxOcMwOYC6uveZwQZsZ6/sLQtcuJr5cSSyaIW8sOcxUu+/DrQT
         gnnriWIy2a+Dw5OMSsNyzAm4N/naQxKpQmWPB+LHL7mM0HzgfyL6XtzK5m6I0x6k/oyN
         v+tM8uDdcPBdR5Wb6/gh7lTx4Xv//qY425I9+fnlx8g83MwAgcMbDryQ9qMitrmbXg1J
         DA3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686571539; x=1689163539;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uZ+JPJZJ4R9J7LmZxdokcz8n4SAPNQ5qljzgeMJIhoA=;
        b=iVjJcONR7DhD+3r5b6LnwzT4CiE9kphoDkRO6ijsDQ98hJCnTGEGF5wWcsjcTmq45C
         b9druz5llCfvIITaNVBUYNF8VPk19+81YOGbs2KeL81X9dY5RTAxdZGIMKvCPdMjIst+
         n6YeLpZmNXGYSPbq5xiPHwkXjSFkn4Vz+O2wn4kcgTGFAfn1oPKJiq/+ptIQ2sCzURWl
         ONseLrhwvKdaIHUHwwZfoVRgp2BxJJp5Low1MNKNn2OX2c56FulA3U7srRdWlSzVtV7T
         0KmkRwev3usNyTcfM9aRwNEbL3Ok+KPgoZbqqd14J0d060S91TPw7KqYwcgCQp0xeNql
         TolA==
X-Gm-Message-State: AC+VfDz9zglnicR/zDTl46WyQpapkCoLBowE7C+3z28PZC/exm9qpuWY
	HlE0ln9IuyK69yldLPC7yKHO0A==
X-Google-Smtp-Source: ACHHUZ6Yz814wPwzdD8OpS3wjkMwSGqtfIlOqjmijWp/JzC9lQ/o1s78xRjL+DF0IdCusebGphtLgw==
X-Received: by 2002:a5d:6706:0:b0:30f:b953:f9fa with SMTP id o6-20020a5d6706000000b0030fb953f9famr3390449wru.16.1686571539322;
        Mon, 12 Jun 2023 05:05:39 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.153])
        by smtp.gmail.com with ESMTPSA id j29-20020a5d6e5d000000b0030fc280102bsm2538866wrz.90.2023.06.12.05.05.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 05:05:38 -0700 (PDT)
Message-ID: <72d8d465-c071-52bb-1f00-141d044ddeb5@linaro.org>
Date: Mon, 12 Jun 2023 13:05:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/5] mtd: spi-nor: spansion: Rework octal_dtr_enable()
Content-Language: en-US
To: tkuw584924@gmail.com, linux-mtd@lists.infradead.org
Cc: pratyush@kernel.org, michael@walle.cc, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, d-gole@ti.com, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <cover.1686557139.git.Takahiro.Kuwano@infineon.com>
 <381f7f66c68136a2de1d768b44fb6bcf9eebbebe.1686557139.git.Takahiro.Kuwano@infineon.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <381f7f66c68136a2de1d768b44fb6bcf9eebbebe.1686557139.git.Takahiro.Kuwano@infineon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230612_050543_486002_C45A8BE0 
X-CRM114-Status: GOOD (  31.51  )
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



On 6/12/23 11:04, tkuw584924@gmail.com wrote:
> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> 
> S28HS02GT is multi-chip package (MCP) device that requires Octal DTR
> configuraion for each die. As preparation for MCP support, this patch
> replaces cypress_nor_octal_dtr_en/dis() with cypress_nor_setup_memlat()
> and cypress_nor_setup_opiddr(). And the ID check part is moved to
> cypress_nor_octal_dtr_enable().
> 
> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> ---
>  drivers/mtd/spi-nor/spansion.c | 118 +++++++++++++++++----------------
>  1 file changed, 62 insertions(+), 56 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
> index 7804be3a9f2a..0daa3a357ae8 100644
> --- a/drivers/mtd/spi-nor/spansion.c
> +++ b/drivers/mtd/spi-nor/spansion.c
> @@ -156,7 +156,7 @@ static int cypress_nor_sr_ready_and_clear(struct spi_nor *nor)
>  	return 1;
>  }
>  
> -static int cypress_nor_octal_dtr_en(struct spi_nor *nor)
> +static int cypress_nor_setup_memlat(struct spi_nor *nor)

cypress_nor_set_memlat?

Be kind and introduce a description for the method so that we don't
cross check the datasheet each time. I see that for memlat we use a
hardcoded value, whereas it should have been dynamically determined
based on the flash freq. Something to improve in the future if you care.


>  {
>  	struct spi_mem_op op;
>  	u8 *buf = nor->bouncebuf;
> @@ -178,67 +178,37 @@ static int cypress_nor_octal_dtr_en(struct spi_nor *nor)
>  		CYPRESS_NOR_WR_ANY_REG_OP(addr_mode_nbytes,
>  					  SPINOR_REG_CYPRESS_CFR2V, 1, buf);
>  
> -	ret = spi_nor_write_any_volatile_reg(nor, &op, nor->reg_proto);
> -	if (ret)
> -		return ret;
> -
> -	nor->read_dummy = 24;
> -
> -	/* Set the octal and DTR enable bits. */
> -	buf[0] = SPINOR_REG_CYPRESS_CFR5_OCT_DTR_EN;
> -	op = (struct spi_mem_op)
> -		CYPRESS_NOR_WR_ANY_REG_OP(addr_mode_nbytes,
> -					  SPINOR_REG_CYPRESS_CFR5V, 1, buf);
> -
> -	ret = spi_nor_write_any_volatile_reg(nor, &op, nor->reg_proto);
> -	if (ret)
> -		return ret;
> -
> -	/* Read flash ID to make sure the switch was successful. */
> -	ret = spi_nor_read_id(nor, nor->addr_nbytes, 3, buf,
> -			      SNOR_PROTO_8_8_8_DTR);
> -	if (ret) {
> -		dev_dbg(nor->dev, "error %d reading JEDEC ID after enabling 8D-8D-8D mode\n", ret);
> -		return ret;
> -	}
> -
> -	if (memcmp(buf, nor->info->id, nor->info->id_len))
> -		return -EINVAL;
> -
> -	return 0;
> +	return spi_nor_write_any_volatile_reg(nor, &op, nor->reg_proto);
>  }
>  
> -static int cypress_nor_octal_dtr_dis(struct spi_nor *nor)
> +static int cypress_nor_setup_opiddr(struct spi_nor *nor, bool enable)

what does opiddr stand for? Let's rename it to something humans can
understand.

>  {
>  	struct spi_mem_op op;
>  	u8 *buf = nor->bouncebuf;
> -	int ret;
> -
> -	/*
> -	 * The register is 1-byte wide, but 1-byte transactions are not allowed
> -	 * in 8D-8D-8D mode. Since there is no register at the next location,
> -	 * just initialize the value to 0 and let the transaction go on.
> -	 */
> -	buf[0] = SPINOR_REG_CYPRESS_CFR5_OCT_DTR_DS;
> -	buf[1] = 0;
> -	op = (struct spi_mem_op)
> -		CYPRESS_NOR_WR_ANY_REG_OP(nor->addr_nbytes,
> -					  SPINOR_REG_CYPRESS_CFR5V, 2, buf);
> -	ret = spi_nor_write_any_volatile_reg(nor, &op, SNOR_PROTO_8_8_8_DTR);
> -	if (ret)
> -		return ret;
>  
> -	/* Read flash ID to make sure the switch was successful. */
> -	ret = spi_nor_read_id(nor, 0, 0, buf, SNOR_PROTO_1_1_1);
> -	if (ret) {
> -		dev_dbg(nor->dev, "error %d reading JEDEC ID after disabling 8D-8D-8D mode\n", ret);
> -		return ret;
> +	if (enable) {
> +		/* Set the octal and DTR enable bits. */
> +		buf[0] = SPINOR_REG_CYPRESS_CFR5_OCT_DTR_EN;
> +		op = (struct spi_mem_op)
> +			CYPRESS_NOR_WR_ANY_REG_OP(nor->params->addr_mode_nbytes,
> +						  SPINOR_REG_CYPRESS_CFR5V, 1,
> +						  buf);
> +	} else {
> +		/*
> +		 * The register is 1-byte wide, but 1-byte transactions are not
> +		 * allowed in 8D-8D-8D mode. Since there is no register at the
> +		 * next location, just initialize the value to 0 and let the
> +		 * transaction go on.
> +		 */
> +		buf[0] = SPINOR_REG_CYPRESS_CFR5_OCT_DTR_DS;
> +		buf[1] = 0;
> +		op = (struct spi_mem_op)
> +			CYPRESS_NOR_WR_ANY_REG_OP(nor->addr_nbytes,
> +						  SPINOR_REG_CYPRESS_CFR5V, 2,
> +						  buf);
>  	}
>  
> -	if (memcmp(buf, nor->info->id, nor->info->id_len))
> -		return -EINVAL;
> -
> -	return 0;
> +	return spi_nor_write_any_volatile_reg(nor, &op, nor->reg_proto);
>  }
>  
>  static int cypress_nor_quad_enable_volatile_reg(struct spi_nor *nor, u64 addr)
> @@ -642,8 +612,44 @@ static struct spi_nor_fixups s25hx_t_fixups = {
>   */
>  static int cypress_nor_octal_dtr_enable(struct spi_nor *nor, bool enable)

what a terrible name

>  {
> -	return enable ? cypress_nor_octal_dtr_en(nor) :
> -			cypress_nor_octal_dtr_dis(nor);
> +	int ret;
> +	u8 naddr, ndummy;
> +	enum spi_nor_protocol proto;
> +
> +	if (enable) {

so we have cypress_nor_octal_dtr_enable and now we check for enable,
yuck. I know it comes from the SPI NOR core, we shall update the core, I
wouldn't continue like this.

> +		ret = cypress_nor_setup_memlat(nor);
> +		if (ret)
> +			return ret;
> +
> +		nor->read_dummy = 24;

shouldn't this be set in cypress_nor_set_memlat?
> +	}
> +
> +	ret = cypress_nor_setup_opiddr(nor, enable);
> +	if (ret)
> +		return ret;
> +
> +	/* Read flash ID to make sure the switch was successful. */
> +	if (enable) {
> +		naddr = nor->addr_nbytes;
> +		ndummy = 3;
> +		proto = SNOR_PROTO_8_8_8_DTR;
> +	} else {
> +		naddr = 0;
> +		ndummy = 0;
> +		proto = SNOR_PROTO_1_1_1;
> +	}

I don't like all the if conditions in the octal_dtr_enable methods, I
find the method hard to read and I feel we are butchering the code just
to make it work.
> +
> +	ret = spi_nor_read_id(nor, naddr, ndummy, nor->bouncebuf, proto);
> +	if (ret) {
> +		dev_dbg(nor->dev, "error %d reading JEDEC ID after %s 8D-8D-8D mode\n",
> +			ret, enable ? "enabling" : "disabling");
> +		return ret;
> +	}
> +
> +	if (memcmp(nor->bouncebuf, nor->info->id, nor->info->id_len))
> +		return -EINVAL;
> +
> +	return 0;
>  }
>  
>  static int s28hx_t_post_sfdp_fixup(struct spi_nor *nor)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
