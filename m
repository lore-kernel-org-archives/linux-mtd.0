Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C9A0C001B0
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Aug 2023 11:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6d2GtYANdgw2kP1nTNxVzd9ixjKiMgfJc+ButuQh3RM=; b=mEDHPLYw3gcXjkBuSmY9r/sats
	npmIl1wRhLwvSCedRJWQFfyeCG/MsV+CsGS5UDYnNE3CqyROiopsfTg5cpuRYk5NVSHLocE6aai+b
	g9sxGUOCYFh2BTLOyTWipTPr1MCRuVpTyeRlIOrmV5HZTETicNzaUrtG4FyTWy/lbvTHm6CAtlkd4
	LYXBX6jkafTBKy8vpOCp3mG4By+irehRMozgCjbBVKBpHu6CNBqm722oHmLshugJtkitPeAn9xOaB
	Kpn2Dej27buhCdTLZtZIbJdu1PEiYMKxGppUgsttxAuR3Y+P6F8dr63VxDySHzE+mt1ptCmNnmUKx
	wNrnXZsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWF4E-0042AH-0i;
	Wed, 16 Aug 2023 11:52:02 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWF4A-00428G-0F;
	Wed, 16 Aug 2023 11:51:59 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 8DD34FF;
	Wed, 16 Aug 2023 13:51:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1692186711;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=voA621rn/w6ng91/WNUkg3Fq3sBx04GR1UpiWeO6YOE=;
	b=xdW4qarkIR6s8uneKejcpImybQnhai0Hxo78vhi8SpoX2C0XsJhS+0XWwTuGfDtk1LKH7c
	RYlfWnw9pR3NBb5kTgKFaLgYdtZC3BHEDD9ktCRhte1jyLSdXpL0bCl3cvggFaeMLspymG
	doLPJE+UrqA7k8BzAWspVOvM4y7+/Nb6W58kXRXThMZlI4aNxIsr4qshQD9ssDBjLPOCra
	j7zWBk1g6uKrI6iioG6eemY6Ho1bnk5vg3otGQz90K5P6STNrAIjS3ktDFymG8jEEn78fc
	vksmZAiTpSKTBaY4meGr7ZRBZux5Ox9Ru4xCmLyZvQ59XVE3bt25L4Zif0VvHw==
MIME-Version: 1.0
Date: Wed, 16 Aug 2023 13:51:51 +0200
From: Michael Walle <michael@walle.cc>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Bjorn Andersson
 <andersson@kernel.org>, Pratyush Yadav <pratyush@kernel.org>, "Miquel Raynal
 )" <miquel.raynal@bootlin.com>, "Richard Weinberger )" <richard@nod.at>,
 "Vignesh Raghavendra )" <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 cros-qcom-dts-watchers@chromium.org, Andy Gross <agross@kernel.org>, Konrad
 Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v2,1/2] mtd: spi-nor: giga: gd25lq64c: Disable quad mode
 according to bus width
In-Reply-To: <20230816104245.2676965-1-hsinyi@chromium.org>
References: <20230816104245.2676965-1-hsinyi@chromium.org>
Message-ID: <6702bac712daab13698b9bb9ad81d49e@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230816_045158_261132_CB0DA724 
X-CRM114-Status: GOOD (  24.87  )
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

Am 2023-08-16 12:38, schrieb Hsin-Yi Wang:
> gd25lq64c has Quad Enable Requirement flag parsed as
> BFPT_DWORD15_QER_SR2_BIT1_BUGGY in BFPT, even if spi-{rx/tx}-bus-width
> set as non QUAD, eg. 0, 1, 2... Thus quad_enable will not be NULL and
> quad enable (QE) bit will be set to 1 by default. According to
> datasheet[1], if QE bit is enabled, WP pin will become IO pin and the
> system can't use write protection feature, and it's also not 
> recommended
> to set QE bit to 1[1].
> 
> Add a post_bfpt fixup that reads spi-rx-bus-width to remove quad_enable
> if the width is set to below QUAD mode.
> 
> [1]
> https://www.gigadevice.com.cn/Public/Uploads/uploadfile/files/20220714/DS-00012-GD25LQ64C-Rev3.4.pdf
> page 13
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  drivers/mtd/spi-nor/gigadevice.c | 28 +++++++++++++++++++++++++++-
>  1 file changed, 27 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/gigadevice.c 
> b/drivers/mtd/spi-nor/gigadevice.c
> index d57ddaf1525b3..8ea89e1858f9b 100644
> --- a/drivers/mtd/spi-nor/gigadevice.c
> +++ b/drivers/mtd/spi-nor/gigadevice.c
> @@ -33,6 +33,31 @@ static const struct spi_nor_fixups gd25q256_fixups = 
> {
>  	.post_bfpt = gd25q256_post_bfpt,
>  };
> 
> +static int
> +gd25lq64c_post_bfpt(struct spi_nor *nor,
> +		    const struct sfdp_parameter_header *bfpt_header,
> +		    const struct sfdp_bfpt *bfpt)
> +{
> +	struct device_node *np = spi_nor_get_flash_node(nor);
> +	u32 value;
> +
> +	/*
> +	 * Even if spi-{tx,rx}-bus-width is set to DUAL mode, due to the QER
> +	 * flag parsed from BFPT is BFPT_DWORD15_QER_SR2_BIT1_BUGGY, so the
> +	 * quad_enable will be set and QE bit set to 1.
> +	 */
> +	if (!of_property_read_u32(np, "spi-rx-bus-width", &value)) {
> +		if (value <= 2)
> +			nor->params->quad_enable = NULL;
> +	}
> +
> +	return 0;
> +}
> +
> +static struct spi_nor_fixups gd25lq64c_fixups = {
> +	.post_bfpt = gd25lq64c_post_bfpt,

No. Please fix it in the core and not just for this part. To me it seems
like a fundamental problem and that commit 39d1e3340c73 ("mtd: spi-nor:
Fix clearing of QE bit on lock()/unlock()") is broken in that regard.
Tudor?

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
