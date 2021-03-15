Return-Path: <SRS0=HQmt=IN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9D8EC433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Mar 2021 10:53:09 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6692B64E77
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Mar 2021 10:53:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6692B64E77
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EOKMfbFxDZrJ1pF3HdiE0ro7ZkpzWH+ol+qUaGpEvuE=; b=c6Wdi1OpKNtxQIfVKa06EetmH
	w2NEf4y++d5A/gq0pDsuYS4qXeIjcwcsC5cktZzGJQ/vCp6C77AjBNMiNY/Vus1OZSCXWjJj+Wn+h
	7xgR7aQvvkgesQCKIm64jOGXhr2AsFe/eFVEpG3zq74uoh7cACs3P4otQ0ujYDZiNlf/bmvhwlpvq
	vwRLQXYmqAysH5pFkZBvNfxFo1pXQ/Lb0IfUwB7b6LCW7r4u8/JxVmXOYAfpj+Sjz4u3vDZZsNyt7
	Lf5CvBMSviaAkLM05OVv5b8iNn1M5v7h5IyEv4saqLdcJwDh7BSfAFA/rRZR8wZhvlJdB8b18mzFP
	J6cXx4UWw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lLkpY-00FZQ3-MQ; Mon, 15 Mar 2021 10:52:12 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLklc-00FYXw-DV
 for linux-mtd@lists.infradead.org; Mon, 15 Mar 2021 10:48:13 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12FAm0K3078943;
 Mon, 15 Mar 2021 05:48:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1615805280;
 bh=8C7fAE9D18cWzT+Gh6BAlTWypNSW80ujwJc+tSD/kTs=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=Cl1TETZli2fOtzFT3PONVzOEU3XJoloGP1KkuTc+bmlQGBmNlX3CFw9oBjQfsOlxV
 kCxEmA4WimX3iUSuV0UllI7+Awan4EwNpgmN6yOp/cP+ZShRDzNU0U9mzMgI0L6Pxy
 xLLrbPB2VF847ygn3w755uUBA13WK6dldwMaTdMM=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12FAm0t5117240
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 15 Mar 2021 05:48:00 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 15
 Mar 2021 05:48:00 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 15 Mar 2021 05:48:00 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12FAlxH2091102;
 Mon, 15 Mar 2021 05:48:00 -0500
Date: Mon, 15 Mar 2021 16:17:59 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: <tkuw584924@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <tudor.ambarus@microchip.com>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <Yaliang.Wang@windriver.com>, <Bacem.Daassi@infineon.com>, Takahiro Kuwano
 <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v3 1/6] mtd: spi-nor: core: Add the ->ready() hook
Message-ID: <20210315104757.xcc57rjmuunk5zlj@ti.com>
References: <cover.1615523176.git.Takahiro.Kuwano@infineon.com>
 <b6227e01b33da93908066ce14f950d7a0ad8f116.1615523176.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b6227e01b33da93908066ce14f950d7a0ad8f116.1615523176.git.Takahiro.Kuwano@infineon.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210315_104810_191479_9F1750E7 
X-CRM114-Status: GOOD (  21.25  )
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

Hi,

On 12/03/21 06:41PM, tkuw584924@gmail.com wrote:
> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> 
> This hook can be used for SPI NOR flashes that do not support legacy
> status read method.

Nitpick: I wouldn't call it "legacy". There is no newer standard status 
read method. Something like "default" or "standard" would be better.

> 
> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> ---
> Changes in v3:
>   - New in v3
>     The purpose is same as the patch introduced by Yaliang Wang.
>     https://patchwork.ozlabs.org/project/linux-mtd/patch/20210301142844.1089385-1-yaliang.wang@windriver.com/  
> 
>  drivers/mtd/spi-nor/core.c | 3 ++-
>  drivers/mtd/spi-nor/core.h | 2 ++
>  2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 0522304f52fa..c8a7f246ab7d 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -826,7 +826,7 @@ static int spi_nor_wait_till_ready_with_timeout(struct spi_nor *nor,
>  		if (time_after_eq(jiffies, deadline))
>  			timeout = 1;
>  
> -		ret = spi_nor_ready(nor);
> +		ret = nor->params->ready(nor);
>  		if (ret < 0)
>  			return ret;
>  		if (ret)
> @@ -2920,6 +2920,7 @@ static void spi_nor_info_init_params(struct spi_nor *nor)
>  	params->quad_enable = spi_nor_sr2_bit1_quad_enable;
>  	params->set_4byte_addr_mode = spansion_set_4byte_addr_mode;
>  	params->setup = spi_nor_default_setup;
> +	params->ready = spi_nor_ready;

Nitpick: Rename it to spi_nor_default_ready or something similar.

>  	/* Default to 16-bit Write Status (01h) Command */
>  	nor->flags |= SNOR_F_HAS_16BIT_SR;
>  
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index 4a3f7f150b5d..4d06c27630fe 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -218,6 +218,7 @@ struct spi_nor_locking_ops {
>   *                      flashes that have peculiarities to the SPI NOR standard
>   *                      e.g. different opcodes, specific address calculation,
>   *                      page size, etc.
> + * @ready:		checks if the SPI NOR flash is ready.
>   * @locking_ops:	SPI NOR locking methods.
>   */
>  struct spi_nor_flash_parameter {
> @@ -238,6 +239,7 @@ struct spi_nor_flash_parameter {
>  	int (*set_4byte_addr_mode)(struct spi_nor *nor, bool enable);
>  	u32 (*convert_addr)(struct spi_nor *nor, u32 addr);
>  	int (*setup)(struct spi_nor *nor, const struct spi_nor_hwcaps *hwcaps);
> +	int (*ready)(struct spi_nor *nor);
>  
>  	const struct spi_nor_locking_ops *locking_ops;
>  };

Other than the above comments,

Reviewed-by: Pratyush Yadav <p.yadav@ti.com>

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
