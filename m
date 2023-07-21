Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A0C2EB64DD
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Jul 2023 16:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m88/9tiyJvzCMwbAPf2COgOYnmrioASi6vT+6oyKl2Y=; b=kI+I3vXvt4x1Sj
	3xo0jQpyMtGUh1fBepZJhrAeDYryvN7xt0R4mGb/7/QTnKZRNKQtBHzzi5WbXiEI+g8h75s/DdcK7
	xbh+AVjWm6Bv8+297yeb2+Dps6MvHKHYovR+t7d441m+YXl7+btUXFLuUBohesg77MWcq79ILQ7Ns
	Xp01XpOwC3QrzvNyxEMdlMov9Dgjl2oueK5ibqdWWrNofryrwMpY/0bi7SAccCCoZazwCrnyDYRvx
	x4BVpFa1f2KO+US9lXbd4ZY5Qb5bx7MSHhO21Whpg3rtU7XULb1Y5fFuZBTTacJK1MsycgnK+o2M9
	ebG0lw6CAC/YLed1sUNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMtDN-00EciM-1r;
	Fri, 21 Jul 2023 16:42:49 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMtDK-00Echl-24
	for linux-mtd@lists.infradead.org;
	Fri, 21 Jul 2023 16:42:48 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-992b27e1c55so332434766b.2
        for <linux-mtd@lists.infradead.org>; Fri, 21 Jul 2023 09:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689957764; x=1690562564;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nWdTxvyMzHC5w/+aiRmrHjYXGjM/dDHuYV4ZyD2dVNc=;
        b=FHwtgOB1JZcNSUAIyH+t/k1n1K/y5J5WIoiNWDyy5/rLMWbdFo6Gg/R3zW4P5HrrPC
         l32xgcKKTK5gEaWN1Qwuq/zbdIrznCTMZSgRad5KVlMD1Vk4x9Xn1UJ5uSJtVHGz+njz
         6xD8oNJ8yPa6uoa3Zb5XMSEdSra9Vlt5nqGeeqQ4Wy6uY04011UJSdaMNUYwLtUlXI64
         6Lak5CvMziHUlk5iDHgJL903tjLHDgFWxYTpPzP+9EghYzqjjCwrSVUMvtW5gCt40LzP
         BJRhdRqOHjml2nBfseZ9Kjw68esKHP+RPULgB7MtTBNpdGFUF59Otf1fLoTNXOOwaNV+
         ktjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689957764; x=1690562564;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nWdTxvyMzHC5w/+aiRmrHjYXGjM/dDHuYV4ZyD2dVNc=;
        b=S2IA+Pv2e0pzPvZbapbuwthhABJbS6bGmEoTuKzQ1Ds8hhrGQJ0SFvGSW2GhGdgko7
         bU1vD7QC95t5qY0bd1HiyrSGtI6TVqNq0EyvLWeqs9z/ccK0Y6K7BSYGVJkelOGCGE1N
         XU3P34zMohJL4hRXDm36mAeMj9bZmSFOkBGGchCkB6I21f/fEn5DksovEWJRnB+uwYBh
         mOEdxuxGBEzM/J9Yel/ciZiXWA88n1rLPnsM/O/eLQIMpXdBaPX6yMsuMNVuO9OfctAN
         cKVggJMGVIz1xwXX3mzPBfgSvjbnsve12bUrrrd6uVOX6Ov9HxNYRTM/HkpLqr8FckpV
         lETQ==
X-Gm-Message-State: ABy/qLbNRDWe3WC04O80M2rJti8MSmx8HRSaXZjdM+oa0/OxWyRbm8Vz
	xR6ksR7uE7cNxtgtuSR7sT0pcQ==
X-Google-Smtp-Source: APBJJlGVwJs7tbBmYvJ6GjY/y+sIY0kr/3oI2aCs3JcapNmjW/lXHT8BIcLG3lzc1xWmqEVYZRjKkg==
X-Received: by 2002:a17:907:7797:b0:99b:48a9:f56d with SMTP id ky23-20020a170907779700b0099b48a9f56dmr2120757ejc.22.1689957763435;
        Fri, 21 Jul 2023 09:42:43 -0700 (PDT)
Received: from [192.168.2.173] ([79.115.63.16])
        by smtp.gmail.com with ESMTPSA id t10-20020a1709064f0a00b009929d998abcsm2372996eju.209.2023.07.21.09.42.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jul 2023 09:42:42 -0700 (PDT)
Message-ID: <3bfbc316-2348-fb58-4026-4f38e8845264@linaro.org>
Date: Fri, 21 Jul 2023 19:42:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 4/8] mtd: spi-nor: spansion: switch set_octal_dtr
 method to use vreg_offset
Content-Language: en-US
To: tkuw584924@gmail.com, linux-mtd@lists.infradead.org
Cc: pratyush@kernel.org, michael@walle.cc, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, d-gole@ti.com, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <cover.1689836065.git.Takahiro.Kuwano@infineon.com>
 <5c2fbc72d94c4f88bb4599c00c45fbaaf714b909.1689836066.git.Takahiro.Kuwano@infineon.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <5c2fbc72d94c4f88bb4599c00c45fbaaf714b909.1689836066.git.Takahiro.Kuwano@infineon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_094246_690226_5447596A 
X-CRM114-Status: GOOD (  20.53  )
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



On 20.07.2023 10:09, tkuw584924@gmail.com wrote:
> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> 
> All the Infineon flashes that currently support octal DTR mode
> define the optional SCCR SFDP table, thus all retrieve vreg_offset.
> Switch all the available octal DTR Infineon flashes to use the
> volatile register offset to set the configuration registers. The goal
> is to have a single pair of methods for both single/multi-chip package
> devices.
> 
> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> ---
>  drivers/mtd/spi-nor/spansion.c | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
> index b99ed088b377..9150840e748a 100644
> --- a/drivers/mtd/spi-nor/spansion.c
> +++ b/drivers/mtd/spi-nor/spansion.c
> @@ -6,6 +6,7 @@
>  
>  #include <linux/bitfield.h>
>  #include <linux/device.h>
> +#include <linux/errno.h>
>  #include <linux/mtd/spi-nor.h>
>  
>  #include "core.h"
> @@ -202,14 +203,18 @@ static int cypress_nor_set_octal_dtr_bits(struct spi_nor *nor, u64 addr)
>  
>  static int cypress_nor_octal_dtr_en(struct spi_nor *nor)
>  {
> +	const struct spi_nor_flash_parameter *params = nor->params;
>  	u8 *buf = nor->bouncebuf;
> +	u64 addr;
>  	int ret;
>  
> -	ret = cypress_nor_set_memlat(nor, SPINOR_REG_CYPRESS_CFR2V);
> +	addr = params->vreg_offset[0] + SPINOR_REG_CYPRESS_CFR2;
> +	ret = cypress_nor_set_memlat(nor, addr);
>  	if (ret)
>  		return ret;
>  
> -	ret = cypress_nor_set_octal_dtr_bits(nor, SPINOR_REG_CYPRESS_CFR5V);
> +	addr = params->vreg_offset[0] + SPINOR_REG_CYPRESS_CFR5;
> +	ret = cypress_nor_set_octal_dtr_bits(nor, addr);
>  	if (ret)
>  		return ret;
>  
> @@ -247,9 +252,11 @@ static int cypress_nor_set_single_spi_bits(struct spi_nor *nor, u64 addr)
>  static int cypress_nor_octal_dtr_dis(struct spi_nor *nor)
>  {
>  	u8 *buf = nor->bouncebuf;
> +	u64 addr;
>  	int ret;
>  
> -	ret = cypress_nor_set_single_spi_bits(nor, SPINOR_REG_CYPRESS_CFR5V);
> +	addr = nor->params->vreg_offset[0] + SPINOR_REG_CYPRESS_CFR5;
> +	ret = cypress_nor_set_single_spi_bits(nor, addr);
>  	if (ret)
>  		return ret;
>  
> @@ -671,6 +678,11 @@ static struct spi_nor_fixups s25hx_t_fixups = {
>   */
>  static int cypress_nor_set_octal_dtr(struct spi_nor *nor, bool enable)
>  {
const struct spi_nor_flash_parameter *params = nor->params;

> +	if (!nor->params->vreg_offset) {

wouldn't hurt to check for params->n_dice as well, even though one
implies the other. In the next patch you have a loop with n-dice being
the max number of elements. If n-dice becomes zero sometime, the loop is
skipped. Thus:

	if (params->n_dice && !nor->params->vreg_offset)

> +		dev_err(nor->dev, "Can not set octal DTR. The volatile register offset could not be retrieved from SFDP\n");
> +		return -EOPNOTSUPP;
> +	}
> +
>  	return enable ? cypress_nor_octal_dtr_en(nor) :
>  			cypress_nor_octal_dtr_dis(nor);
>  }

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
