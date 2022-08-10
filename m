Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFAEAC00140
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Aug 2022 14:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=km44fPxCd9lW+t9HDJjV9LqPcWMqPWdXLcD3u7/Dgtw=; b=qyU9iiG21e/R1b
	XcZEv198CdEMLhoUXqzHvSXE2tldJ7WuPUhv5h4xIEyj6esoQmfx9J5nK5kcbqo366fEkR9It51z2
	xK4KOdPo0bUZEzT571Jcd1CVq4w5HGQ0R1N/pkYhdCTudjWZyxGNi7sUDK/RVyQxBwsknNwYhfK6w
	bef7xKt+Anc+y1oT8KilaLO/Kz5cTcl9SuZAqlxUDH2U286aALQXdgZ5kqQsmFs0meym5CX9OSQF8
	Jx0UrXD9p2U/noGSiWlE3CVrMTxvXtrsDkkim1DtGVMWWflhQ7pdNTm+Xsfix0u+lFpMNhFPfiL1E
	11KkdtOErGa98KLEoTHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLmso-00CMt3-DI; Wed, 10 Aug 2022 14:40:30 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLmsi-00CMph-N5
	for linux-mtd@lists.infradead.org; Wed, 10 Aug 2022 14:40:26 +0000
Received: by mail-pl1-x62b.google.com with SMTP id y1so8804632plb.2
        for <linux-mtd@lists.infradead.org>; Wed, 10 Aug 2022 07:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=JhoYjOvCRDOQQp780akHvnmLCpGzEkANfdEnUkkfGE4=;
        b=JcBnZsoa85JFu1ok2aPMJjqSERDLp6EQiz1qy+clddoOJuvMfz/iHTcx8rrzinauI0
         PQe3f+NCutdhk6K0vx436UTnfmEZA5im7iltKhPIi5cTk4wNXDzwA8Ef8BLB3DtqEQHb
         YtlzrlJMvbH7DD1oHm6AVgMrG+wdMSCb+VjyB3E8glcaWMuiZSp1lw1kfSBuYro6NHy7
         hUv+LMCIf8fK3wF4How0jvUxhWSReuwHRjsgRlky8+riBRO/crTATlFE7a3Mhhv0kCpw
         d4KA10Keeu9dbPTAWzPNTPkH8nEiSdV33cYxNuhGH4RNvKiUKVey35asoeoLUYtudgkF
         IHCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=JhoYjOvCRDOQQp780akHvnmLCpGzEkANfdEnUkkfGE4=;
        b=1CuYqwNo6/HziJbeYcnECIBEcHOl16S/FF8L3HuEN5vOKcaLLx7W4zeLY8hjE4zmdB
         H/aVOzQks3RInQodmwptriJJ8F26YM21xXHMlhD+iSggoOrdwABIoLXBkP0DsCTYWDjP
         D3681HOe+GtUhp2XCOgNEUqaUQEgpxbYkJcQohvAakmCHrKPhziI1CKMamy2drdAUbvU
         hbgZXVlHwO00EptNVZwsdMG4dq9qSEOhIwXTc9XdpFQv8CDiU8wi7vUkRNY7DS+tOKat
         P3Aeb0B68mXUfGZpzPKEApe/1FW0PDaoukfhbtnA3OrUtPKoxBwIWgasANQfZJoJaEny
         89/g==
X-Gm-Message-State: ACgBeo1gxrwOInUs51tKKU3y5QaNYNPf/5AHko+qEHI8TCmyIMTR5lPv
	wXWjQpZEsRoQedCXbSSItmvKKBMuoE4=
X-Google-Smtp-Source: AA6agR4ZyjaK+HM2BmQW9u0YJ6oGeqT6lFqruMenqGoC3TbwSECANf65HeEtGCqf3QFNebhOjnZh1A==
X-Received: by 2002:a17:90a:1787:b0:1f5:32d2:94d with SMTP id q7-20020a17090a178700b001f532d2094dmr4120249pja.31.1660142422643;
        Wed, 10 Aug 2022 07:40:22 -0700 (PDT)
Received: from [192.168.0.10] (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id t15-20020a170902e84f00b0016dbce87aecsm13112470plg.182.2022.08.10.07.40.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Aug 2022 07:40:22 -0700 (PDT)
Message-ID: <d6cae202-c9b8-13ab-09f9-1f63bd1cfccc@gmail.com>
Date: Wed, 10 Aug 2022 23:40:18 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 5/8] mtd: spi-nor: spansion: Rework
 cypress_nor_quad_enable_volatile() for multi-chip device support
Content-Language: en-US
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com, pratyush@kernel.org, michael@walle.cc,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 Bacem.Daassi@infineon.com, Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <cover.1659764848.git.Takahiro.Kuwano@infineon.com>
 <313749b6a30665e981296783a6978f17a0381097.1659764848.git.Takahiro.Kuwano@infineon.com>
From: Takahiro Kuwano <tkuw584924@gmail.com>
In-Reply-To: <313749b6a30665e981296783a6978f17a0381097.1659764848.git.Takahiro.Kuwano@infineon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220810_074024_811976_85653CFA 
X-CRM114-Status: GOOD (  20.41  )
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

On 8/6/2022 3:34 PM, tkuw584924@gmail.com wrote:
> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> 
> For multi-chip devices, we need to enable QUAD by updating CFR1V in all
> dice in the device. That is done by for-loop with params->num_of_dice.
> The volatile register address is calculated inside the loop by using die
> number and volatile register offset.
> 
> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> ---
>  drivers/mtd/spi-nor/spansion.c | 65 +++++++++++++++++-----------------
>  1 file changed, 33 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
> index d82dd750da9a..d7a61ea63139 100644
> --- a/drivers/mtd/spi-nor/spansion.c
> +++ b/drivers/mtd/spi-nor/spansion.c
> @@ -14,7 +14,7 @@
>  #define SPINOR_OP_CLSR		0x30	/* Clear status register 1 */
>  #define SPINOR_OP_RD_ANY_REG			0x65	/* Read any register */
>  #define SPINOR_OP_WR_ANY_REG			0x71	/* Write any register */
> -#define SPINOR_REG_CYPRESS_CFR1V		0x00800002
> +#define SPINOR_REG_CYPRESS_CFR1			0x2
>  #define SPINOR_REG_CYPRESS_CFR1V_QUAD_EN	BIT(1)	/* Quad Enable */
>  #define SPINOR_REG_CYPRESS_CFR2V		0x00800003
>  #define SPINOR_REG_CYPRESS_CFR2V_MEMLAT_11_24	0xb
> @@ -137,46 +137,47 @@ static int cypress_nor_octal_dtr_dis(struct spi_nor *nor)
>  static int cypress_nor_quad_enable_volatile(struct spi_nor *nor)
>  {
>  	struct spi_mem_op op;
> +	u32 addr;
> +	u8 i;
>  	u8 addr_mode_nbytes = nor->params->addr_mode_nbytes;
>  	u8 cfr1v_written;
>  	int ret;
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
> +		op = (struct spi_mem_op)
> +			CYPRESS_NOR_RD_ANY_REG_OP(addr_mode_nbytes, addr,
> +						  nor->bouncebuf);
> +		ret = spi_nor_read_any_reg(nor, &op, nor->reg_proto);
> +		if (ret)
> +			return ret;
>  
> -	if (nor->bouncebuf[0] & SPINOR_REG_CYPRESS_CFR1V_QUAD_EN)
> -		return 0;
> +		if (nor->bouncebuf[0] & SPINOR_REG_CYPRESS_CFR1V_QUAD_EN)
> +			return 0;
Should be 'continue;'.

>  
> -	/* Update the Quad Enable bit. */
> -	nor->bouncebuf[0] |= SPINOR_REG_CYPRESS_CFR1V_QUAD_EN;
> -	op = (struct spi_mem_op)
> -		CYPRESS_NOR_WR_ANY_REG_OP(addr_mode_nbytes,
> -					  SPINOR_REG_CYPRESS_CFR1V, 1,
> -					  nor->bouncebuf);
> -	ret = spi_nor_write_any_volatile_reg(nor, &op, nor->reg_proto);
> -	if (ret)
> -		return ret;
> +		/* Update the Quad Enable bit. */
> +		nor->bouncebuf[0] |= SPINOR_REG_CYPRESS_CFR1V_QUAD_EN;
> +		op = (struct spi_mem_op)
> +			CYPRESS_NOR_WR_ANY_REG_OP(addr_mode_nbytes, addr, 1,
> +						  nor->bouncebuf);
> +		ret = spi_nor_write_any_volatile_reg(nor, &op, nor->reg_proto);
> +		if (ret)
> +			return ret;
>  
> -	cfr1v_written = nor->bouncebuf[0];
> +		cfr1v_written = nor->bouncebuf[0];
>  
> -	/* Read back and check it. */
> -	op = (struct spi_mem_op)
> -		CYPRESS_NOR_RD_ANY_REG_OP(addr_mode_nbytes,
> -					  SPINOR_REG_CYPRESS_CFR1V,
> -					  nor->bouncebuf);
> -	ret = spi_nor_read_any_reg(nor, &op, nor->reg_proto);
> -	if (ret)
> -		return ret;
> +		/* Read back and check it. */
> +		op = (struct spi_mem_op)
> +			CYPRESS_NOR_RD_ANY_REG_OP(addr_mode_nbytes, addr,
> +						  nor->bouncebuf);
> +		ret = spi_nor_read_any_reg(nor, &op, nor->reg_proto);
> +		if (ret)
> +			return ret;
>  
> -	if (nor->bouncebuf[0] != cfr1v_written) {
> -		dev_err(nor->dev, "CFR1: Read back test failed\n");
> -		return -EIO;
> +		if (nor->bouncebuf[0] != cfr1v_written) {
> +			dev_err(nor->dev, "CFR1: Read back test failed\n");
> +			return -EIO;
> +		}
>  	}
>  
>  	return 0;

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
