Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B78DC05027
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Feb 2023 12:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QLyAudlewZB1ttiYcAZ0k1ThpO+FcoMKgG9iD7+8fhM=; b=ixEUkRNzSCeyCo
	b8ogFoIsXjR3Fw3qkX48bpNBbzP8iKrpbrDXX1OFEEQ7mdXdjSEyc3FJjTVKs7tuKE8QmFQb9Abov
	0W4rcDZFebq4wUv5FMcfYVQq5RHs1cMyCqC121XQ+8B25V4FuW39+TEzrGYzVLNPpWPZVEUpHZhOF
	HySAe20LcI4zhATB88sjF6oxyZ9XQcBY9bmvA6xsoPMtu7466GFE9WXf4xnmKqtEx81JuKDti7mm6
	s7JDaXhFTqwZI5rhWPo1EtABbmTbnuyunxbkyinD5krXPYSnzBVTv//ev28dLJlfL5j/0Kkfe48LU
	kTeSqwdJ87muSpNIqRLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNYZ7-00Fk7R-VY; Thu, 02 Feb 2023 12:19:46 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNYZ4-00Fk5j-OT; Thu, 02 Feb 2023 12:19:44 +0000
Received: by mail-wr1-x42a.google.com with SMTP id d14so1516613wrr.9;
        Thu, 02 Feb 2023 04:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0Obxz9fH35OWB4UXxiqSp3CJYqzK8VLJncs58vA/I1w=;
        b=hGavQITnzkxfZqIrRHR/2XSpzp2m8GPHONYsjIwWEbYgAi16e05vrSDeaHsKjKvl5i
         /93+b/uh8LPctsU7akwIsoOgqel3WzEGEvNTWJOnGj2ZEW2ZSpzNPkHI7XK0XLwxXEYF
         +aJH6kyveI5s8zMSR/Gu+KJjDcPP8Rlh+zmLg6sS6Gb6b7Lp+9eLL5s4imARqnwE25VI
         XLS+oxwfKS6P9KEQzINoe2iDh6DWCpKXOvVZyhSyLLpgdcdgomq6fXT6oVCbtMRLIYyK
         x5bUFz/HnCo2n3xfKPTYnb7JK4+uLCVSSEsyNyyLG2ERESsIxWbVGoZBkk/q5txRdxB+
         nkVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0Obxz9fH35OWB4UXxiqSp3CJYqzK8VLJncs58vA/I1w=;
        b=yawimwjLjVXiRkRm9JJhST8BKsJ96jRLrWVroKEvMl2PrRGgb6Aw88qRo67fRySDmv
         sXKbNXjgEBDpO+G0hKokFqLSj1JmCI7/P7YsJAhaN/K6rk5cfLu8EkdPlR2gH1k0uUkM
         Uct6ZS+J02MPhdDky0cxd9REbmDRjlcwBuAi3oJKmvG2m2FY0jz+J+65WAxhowf0nRLp
         6FFMBeevMvOtEQTpnat7IL35YaPJFqa8Hmt31783hot1/THrmNXOTUMIU6bPIZs3WtA3
         BP+VBdfJ2NgPGkjq6HPfvr6invbu0PTH+9ib5E2owKtk527BiPhUl6+mp/6aPbTtmg51
         Rqzw==
X-Gm-Message-State: AO0yUKUfpzG/IrW/gsfbdF/HdHNXSFXxucn6Y+vACyHHC6AGHhrtDOLN
	Z169Jqj5OcEjx6+urKR74as=
X-Google-Smtp-Source: AK7set/4lyENg811N/tf0ykVq/rm55qR04z2wrUgYTqv/PP7TDtGNwCZFpOJaeB9bXho9exywA3evQ==
X-Received: by 2002:adf:fa07:0:b0:2c0:6217:8459 with SMTP id m7-20020adffa07000000b002c062178459mr4765480wrr.16.1675340378510;
        Thu, 02 Feb 2023 04:19:38 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id h4-20020adfaa84000000b002bfbf4c3f9fsm19786807wrc.17.2023.02.02.04.19.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 04:19:38 -0800 (PST)
Message-ID: <27d1f8ae-4948-317d-b4a6-be7dc0dfe22a@gmail.com>
Date: Thu, 2 Feb 2023 13:19:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v6 5/5] mtd: nand: ecc-mtk: Add ECC support fot MT7986 IC
Content-Language: en-US
To: Xiangsheng Hou <xiangsheng.hou@mediatek.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, benliang.zhao@mediatek.com,
 bin.zhang@mediatek.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20230201021500.26769-1-xiangsheng.hou@mediatek.com>
 <20230201021500.26769-6-xiangsheng.hou@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230201021500.26769-6-xiangsheng.hou@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_041942_830041_4CD0DBB9 
X-CRM114-Status: GOOD (  17.24  )
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



On 01/02/2023 03:15, Xiangsheng Hou wrote:
> Add ECC support fot MT7986 IC, and change err_mask value with
> GENMASK macro.
> 
> Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/mtd/nand/ecc-mtk.c | 28 +++++++++++++++++++++++++---
>   1 file changed, 25 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/nand/ecc-mtk.c b/drivers/mtd/nand/ecc-mtk.c
> index 9f9b201fe706..c75bb8b80cc1 100644
> --- a/drivers/mtd/nand/ecc-mtk.c
> +++ b/drivers/mtd/nand/ecc-mtk.c
> @@ -40,6 +40,10 @@
>   #define ECC_IDLE_REG(op)	((op) == ECC_ENCODE ? ECC_ENCIDLE : ECC_DECIDLE)
>   #define ECC_CTL_REG(op)		((op) == ECC_ENCODE ? ECC_ENCCON : ECC_DECCON)
>   
> +#define ECC_ERRMASK_MT7622	GENMASK(4, 0)
> +#define ECC_ERRMASK_MT2701	GENMASK(5, 0)
> +#define ECC_ERRMASK_MT2712	GENMASK(6, 0)
> +
>   struct mtk_ecc_caps {
>   	u32 err_mask;
>   	u32 err_shift;
> @@ -79,6 +83,10 @@ static const u8 ecc_strength_mt7622[] = {
>   	4, 6, 8, 10, 12
>   };
>   
> +static const u8 ecc_strength_mt7986[] = {
> +	4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24
> +};
> +
>   enum mtk_ecc_regs {
>   	ECC_ENCPAR00,
>   	ECC_ENCIRQ_EN,
> @@ -451,7 +459,7 @@ unsigned int mtk_ecc_get_parity_bits(struct mtk_ecc *ecc)
>   EXPORT_SYMBOL(mtk_ecc_get_parity_bits);
>   
>   static const struct mtk_ecc_caps mtk_ecc_caps_mt2701 = {
> -	.err_mask = 0x3f,
> +	.err_mask = ECC_ERRMASK_MT2701,
>   	.err_shift = 8,
>   	.ecc_strength = ecc_strength_mt2701,
>   	.ecc_regs = mt2701_ecc_regs,
> @@ -462,7 +470,7 @@ static const struct mtk_ecc_caps mtk_ecc_caps_mt2701 = {
>   };
>   
>   static const struct mtk_ecc_caps mtk_ecc_caps_mt2712 = {
> -	.err_mask = 0x7f,
> +	.err_mask = ECC_ERRMASK_MT2712,
>   	.err_shift = 8,
>   	.ecc_strength = ecc_strength_mt2712,
>   	.ecc_regs = mt2712_ecc_regs,
> @@ -473,7 +481,7 @@ static const struct mtk_ecc_caps mtk_ecc_caps_mt2712 = {
>   };
>   
>   static const struct mtk_ecc_caps mtk_ecc_caps_mt7622 = {
> -	.err_mask = 0x1f,
> +	.err_mask = ECC_ERRMASK_MT7622,
>   	.err_shift = 5,
>   	.ecc_strength = ecc_strength_mt7622,
>   	.ecc_regs = mt7622_ecc_regs,
> @@ -483,6 +491,17 @@ static const struct mtk_ecc_caps mtk_ecc_caps_mt7622 = {
>   	.pg_irq_sel = 0,
>   };
>   
> +static const struct mtk_ecc_caps mtk_ecc_caps_mt7986 = {
> +	.err_mask = ECC_ERRMASK_MT7622,
> +	.err_shift = 8,
> +	.ecc_strength = ecc_strength_mt7986,
> +	.ecc_regs = mt2712_ecc_regs,
> +	.num_ecc_strength = 11,
> +	.ecc_mode_shift = 5,
> +	.parity_bits = 14,
> +	.pg_irq_sel = 1,
> +};
> +
>   static const struct of_device_id mtk_ecc_dt_match[] = {
>   	{
>   		.compatible = "mediatek,mt2701-ecc",
> @@ -493,6 +512,9 @@ static const struct of_device_id mtk_ecc_dt_match[] = {
>   	}, {
>   		.compatible = "mediatek,mt7622-ecc",
>   		.data = &mtk_ecc_caps_mt7622,
> +	}, {
> +		.compatible = "mediatek,mt7986-ecc",
> +		.data = &mtk_ecc_caps_mt7986,
>   	},
>   	{},
>   };

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
