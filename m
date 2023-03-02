Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A33F5C678D4
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Mar 2023 06:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TcCmAApei5rjZ9GRnV8cBKe9otNjlp1i1JE/0rT4PoQ=; b=EZoejRBTu47UHW
	CAspM+yxOA5CqBS/CuFU6JVj8JeZD0cLXB/l5lgIOMx49/lbkeZmSvGA1aW1Y9eTwZM2NvvQ8x868
	yWZrsQsusGvMlnuIz/FK0Yd0CRZcTp4hfg3RA6y/CE/i0PS2xOLdGig38tlWk7CyZLu2MCG787Ovz
	0NrsMaQSywwvQI96YlyOfNkEVvX7r3ZQxMIVPcZr0rPboSPGU+m/Gr1dnJpbDEhG5IXsDCjQGZE2/
	Qiavz1QiXJDmLAbNT8hpCH+5NPJfFEztEYLiFaBMKs9V4SwsTZuJ3cQ4Y1t42uM5nshOblra/VoEz
	Ek3uvLioIWpFjJs3gmcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXcA6-000zVR-KK; Thu, 02 Mar 2023 06:11:30 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXcA3-000zUO-N3
	for linux-mtd@lists.infradead.org; Thu, 02 Mar 2023 06:11:29 +0000
Received: by mail-ed1-x532.google.com with SMTP id x3so339896edb.10
        for <linux-mtd@lists.infradead.org>; Wed, 01 Mar 2023 22:11:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677737484;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3uSfM4EJjyGkDtm5wZnFEdkDw0kQ3sF3p4evwPEqTTg=;
        b=p1Fsd1Di0hRHg/dYe338y30p+DwvSTAICpK9hPbz7b9W2fGbCYm+Nlf5un1CZcyEbz
         61sjRmvPEYwiLoeVtpIKlHti8LUNsIpol4J84R2+YQlA6o4k91ntCGDr2kyMTtNMXBdc
         kco+dfxIfxlY91k9rU71onCgBIINrYU02yDyCcbo470r8/9VY7uuuGU0sKqoRn6DxcOa
         kCgf4+5PaCfmEYT9fBxZFOCyplfBi6ynxVkb6IZ2uXNF3L79rwaFy9v98BMhBL/L3mlB
         FABM07F1qKaG2KevXUmP0jretU7wgVlJmKxyP/adwJUO0a4kTOoDly6AAoBxbPLdSVxu
         SNIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677737484;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3uSfM4EJjyGkDtm5wZnFEdkDw0kQ3sF3p4evwPEqTTg=;
        b=XIvPEwe7YI7KSJP4ATn9n96M1msxgmUbW8nnN9Ed/iPVK2t9OJn+VrDE8knLi3vypb
         tyCfDjsKXSx58tNTGvDZVDcI4Jh+TXEIY+p2SCYiojgR/YZkEsrOtC2eYm83NQi8hCG1
         0Xt9naecAxW3XKyAbWfNOsw/WBtpnc9Qty/FPiLQGT4HDu4foC+NgD2ceGbiJ2TL7O+S
         4NVnJ5onjBUYtvQz4UaUYnlefMlhZ1KGVJtANlfG4d+1xz8U5OURzqyWdlwN/jnTJgEK
         86o9mE2ZlzkSRFlAsYJ142kXKbMFWSu0Xia7hPwlDKauhxO9Cza6VcFBN5gyAJzu5Dt7
         PRRA==
X-Gm-Message-State: AO0yUKWUrAaWvxrEAvy1KnJMNh55rdB0yxZb0IDLq6rFlV4Ls5pr/sTC
	YuwFzRir6eOQfoBdlkyjRsMjhA==
X-Google-Smtp-Source: AK7set9XqP+gstjM+NPDrl2U7mUuii63Pe3qMGlZNVBti9oAdmgMnOAtXIUKkzHjwhWV1N+z/nNLmQ==
X-Received: by 2002:a17:906:c2c3:b0:878:42af:aa76 with SMTP id ch3-20020a170906c2c300b0087842afaa76mr11038625ejb.54.1677737483745;
        Wed, 01 Mar 2023 22:11:23 -0800 (PST)
Received: from [192.168.0.173] ([79.115.63.78])
        by smtp.gmail.com with ESMTPSA id q15-20020a170906b28f00b008dceec0fd4csm6692640ejz.73.2023.03.01.22.11.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Mar 2023 22:11:23 -0800 (PST)
Message-ID: <d922cecd-3b31-a637-7110-0fe2ea7ff336@linaro.org>
Date: Thu, 2 Mar 2023 08:11:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 5/8] mtd: spi-nor: spansion: Rework
 cypress_nor_quad_enable_volatile() for multi-chip device support
Content-Language: en-US
To: tkuw584924@gmail.com, linux-mtd@lists.infradead.org
Cc: pratyush@kernel.org, michael@walle.cc, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <cover.1675835253.git.Takahiro.Kuwano@infineon.com>
 <07bd9e12e5c990e39d168fb528380fbc4d6be228.1675835253.git.Takahiro.Kuwano@infineon.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <07bd9e12e5c990e39d168fb528380fbc4d6be228.1675835253.git.Takahiro.Kuwano@infineon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_221127_843632_1BB815AA 
X-CRM114-Status: GOOD (  19.03  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 08.02.2023 07:53, tkuw584924@gmail.com wrote:
> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> 
> For multi-chip devices, we need to enable QUAD by updating CFR1V in all
> dice in the device. That is done by for-loop with params->num_of_dice.
> The volatile register address is calculated inside the loop by using die
> number and volatile register offset.
> 
> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> ---
>   drivers/mtd/spi-nor/spansion.c | 65 +++++++++++++++++-----------------
>   1 file changed, 33 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
> index 7c533737d7c3..33c8a5afcb76 100644
> --- a/drivers/mtd/spi-nor/spansion.c
> +++ b/drivers/mtd/spi-nor/spansion.c
> @@ -14,7 +14,7 @@
>   #define SPINOR_OP_CLSR		0x30	/* Clear status register 1 */
>   #define SPINOR_OP_RD_ANY_REG			0x65	/* Read any register */
>   #define SPINOR_OP_WR_ANY_REG			0x71	/* Write any register */
> -#define SPINOR_REG_CYPRESS_CFR1V		0x00800002
> +#define SPINOR_REG_CYPRESS_CFR1			0x2
>   #define SPINOR_REG_CYPRESS_CFR1_QUAD_EN		BIT(1)	/* Quad Enable */
>   #define SPINOR_REG_CYPRESS_CFR2V		0x00800003
>   #define SPINOR_REG_CYPRESS_CFR2_MEMLAT_11_24	0xb
> @@ -142,46 +142,47 @@ static int cypress_nor_octal_dtr_dis(struct spi_nor *nor)
>   static int cypress_nor_quad_enable_volatile(struct spi_nor *nor)
>   {
>   	struct spi_mem_op op;
> +	u32 addr;
> +	u8 i;
>   	u8 addr_mode_nbytes = nor->params->addr_mode_nbytes;
>   	u8 cfr1v_written;
>   	int ret;
>   
> -	op = (struct spi_mem_op)
> -		CYPRESS_NOR_RD_ANY_REG_OP(addr_mode_nbytes,
> -					  SPINOR_REG_CYPRESS_CFR1V,
> -					  nor->bouncebuf);
> -
> -	ret = spi_nor_read_any_reg(nor, &op, nor->reg_proto);
> -	if (ret)
> -		return ret;
> +	for (i = 0; i < nor->params->num_of_dice; i++) {
> +		addr = nor->params->vreg_offset[i] + SPINOR_REG_CYPRESS_CFR1;

the same note, you should consider what happens when all the optional
tables fail.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
