Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 746C0C76196
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Apr 2023 10:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6Xr5FPZHMl6UAXCqqboHXofGWJminIKCsLcQge7e1Xo=; b=qhzleohjE45oMR
	MlLHbgYdEfStJEG3Wyd4kgLw2KEXgM1Y/KYF9A+vBezYFDccGteeNaUSFuLuHZycwSIyYv0OQQfqy
	kmeS8+E4PkZsI8cGXvP+0VOKUswswJeWlG4c2Ll+Ru3bDtHGkBd39wukoi5PRP8dCIRycUFL1dZtp
	Dbxl+AAO2fGr+CttfnnlXNguuvM/1vbNi2kNgUJqW6tsDivg9yWOIgo3/sXmvX3ii+3fN/Nsc7dAe
	FgFLpe66xRfht20NSX6lW6obj3ypY8ZTU6sZE3azQ4p991X1wa9b13DVeECPWqPAf+DVWT5ATooyE
	QZmoU/0nS+XaX/8DSzNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkN6p-0075cs-3D;
	Thu, 06 Apr 2023 10:44:52 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkN6n-0075cY-1y
	for linux-mtd@lists.infradead.org;
	Thu, 06 Apr 2023 10:44:51 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5047074939fso501739a12.1
        for <linux-mtd@lists.infradead.org>; Thu, 06 Apr 2023 03:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680777887;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7aUiM3lYhDJiWtiEdv+rzgumPlUye3+RKV3tDFGDAKw=;
        b=KQBEg4lhfx7OHDmdBaUrSMbBDjAd+SG9jal6g5dnyCSGTAspIll33rp/qUdCOwOMM2
         VT2wVchjaj2MhGMvjEJL0Z7Gykff3ec6wU3MU9oaXrxIoBTkSmiiEd56Bt7Qfc0NqZJ3
         uRv1nfcO9FUWb7+lKf2ROtwCjakyKn0gu/5E2DPlrJdr/uhNXr2aCWpU4bJnG+mQcEPS
         Nkot3gjVORZzvBpGQvw5Mo41fCX+4cg8DKQCvpSfYpS+s0ydCdmaFROEaxt6gTgmvDcS
         Gej39H/dUHh2y8RtZTLXjvntULgBGRJUWBpb5GkVcqUy6HqZfB+1eRQuu3QC619LVMeK
         ephQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680777887;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7aUiM3lYhDJiWtiEdv+rzgumPlUye3+RKV3tDFGDAKw=;
        b=eOCd5dQD3n2K2OyoOnIeLaxt7GZ7h+zFXgefgQC4jPq06HjezhFxM4tdBJM7C9HVUG
         KGEbMqCz7X68sqQcxLGzbMkJA3F0fr80ldcOftH5DqilfMV/+Cfhaz+V+bosbrIxYNGk
         GUidSw3uvTWwsFyhBg3vfZ+MQ9mlRCAl3ms1CAtE/0doRuV92iZ1yL6Vog59ezy1bJll
         giWjdPlU16thkZypFIVpt3Ah9bkpMfqG76MjW5jnYqYON44zcAMsEtAJpDKpo14x/QiL
         xXQ89B1+rMIz3bJM9d0ThRxA69AIN00JrJdy/n9NaurrazqWrNFkBY1DV7I6qPdMjsNF
         OpJw==
X-Gm-Message-State: AAQBX9coCHCfqOSlGj5mSQBgc3U4E8QsvsELlKGdLl3EKGX/oZdda1Vr
	/qQLxFnTOc6yMz76oyDbWZe35w==
X-Google-Smtp-Source: AKy350ab+tV41l14U4n4Yiz8sGq4yTSdd7dj650K9gvRXYDRCrODoBJEo50F5p5PVSoOdyEb/REijA==
X-Received: by 2002:a05:6402:3586:b0:504:7082:8abe with SMTP id y6-20020a056402358600b0050470828abemr438472edc.2.1680777886947;
        Thu, 06 Apr 2023 03:44:46 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.91])
        by smtp.gmail.com with ESMTPSA id 24-20020a508e18000000b005023a4b20dfsm595357edw.2.2023.04.06.03.44.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Apr 2023 03:44:46 -0700 (PDT)
Message-ID: <248c1367-b561-1caa-431c-fdf1ebd78d36@linaro.org>
Date: Thu, 6 Apr 2023 11:44:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 4/8] mtd: spi-nor: sfdp: Add support for SCCR map for
 multi-chip device
Content-Language: en-US
To: tkuw584924@gmail.com, linux-mtd@lists.infradead.org
Cc: pratyush@kernel.org, michael@walle.cc, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, d-gole@ti.com, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <cover.1680749577.git.Takahiro.Kuwano@infineon.com>
 <89b7eb9508b28a48c4d0a8b1ef46983202a0d360.1680749578.git.Takahiro.Kuwano@infineon.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <89b7eb9508b28a48c4d0a8b1ef46983202a0d360.1680749578.git.Takahiro.Kuwano@infineon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_034449_720218_E0F9147F 
X-CRM114-Status: GOOD (  24.83  )
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



On 4/6/23 07:18, tkuw584924@gmail.com wrote:
> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> 
> SCCR map for multi-chip devices contains the number of additional dice in
> the device and register offset values for each additional dice.
> 
> spi_nor_parse_sccr_mc() is added to determine the number of dice and
> volatile register offset for each die. The volatile register offset table
> may already be allocated and contains offset value for die-0 via SCCR map
> parse. So, we should use devm_krealloc() to expand the table with
> preserving die-0 offset.
> 
> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> ---
>  drivers/mtd/spi-nor/sfdp.c | 73 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 73 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> index 9d43e18d3770..00a40bd8aa1e 100644
> --- a/drivers/mtd/spi-nor/sfdp.c
> +++ b/drivers/mtd/spi-nor/sfdp.c
> @@ -26,6 +26,11 @@
>  					 * Status, Control and Configuration
>  					 * Register Map.
>  					 */
> +#define SFDP_SCCR_MAP_MC_ID	0xff88	/*
> +					 * Status, Control and Configuration
> +					 * Register Map Offsets for Multi-Chip
> +					 * SPI Memory Devices.
> +					 */
>  
>  #define SFDP_SIGNATURE		0x50444653U
>  
> @@ -1264,6 +1269,70 @@ static int spi_nor_parse_sccr(struct spi_nor *nor,
>  	return ret;
>  }
>  
> +#define SCCR_MC_MAX_DICE		255
> +
> +/**
> + * spi_nor_parse_sccr_mc() - Parse the Status, Control and Configuration
> + *                           Register Map Offsets for Multi-Chip SPI Memory
> + *                           Devices.
> + * @nor:		pointer to a 'struct spi_nor'
> + * @sccr_mc_header:	pointer to the 'struct sfdp_parameter_header' describing
> + *			the SCCR Map offsets table length and version.
> + *
> + * Return: 0 on success, -errno otherwise.
> + */
> +static int spi_nor_parse_sccr_mc(struct spi_nor *nor,
> +				 const struct sfdp_parameter_header *sccr_mc_header)
> +{
> +	struct spi_nor_flash_parameter *params = nor->params;
> +	u32 *dwords, addr;
> +	u8 i, n_dice;
> +	size_t len;
> +	int ret;
> +
> +	len = sccr_mc_header->length * sizeof(*dwords);
> +	dwords = kmalloc(len, GFP_KERNEL);
> +	if (!dwords)
> +		return -ENOMEM;
> +
> +	addr = SFDP_PARAM_HEADER_PTP(sccr_mc_header);
> +	ret = spi_nor_read_sfdp(nor, addr, len, dwords);
> +	if (ret)
> +		goto out;
> +
> +	le32_to_cpu_array(dwords, sccr_mc_header->length);
> +
> +	/*
> +	 * Pair of DOWRDs (volatile and non-volatile register offsets) per
> +	 * additional die. Hence, length = 2 * (number of additional dice).
> +	 */
> +	n_dice = 1 + sccr_mc_header->length / 2;
> +	if (params->n_dice > SCCR_MC_MAX_DICE) {

smatch warnings:
drivers/mtd/spi-nor/sfdp.c:1310 spi_nor_parse_sccr_mc() warn: impossible
condition '(params->n_dice > 255) => (0-255 > 255)'

declaring the local variable n_dice as unsigned int should solve the
problem.

> +		dev_dbg(nor->dev, "Improbable number of dice defined in SCCR MC table, use one die.\n");
> +		ret = -EINVAL;
> +		goto out;
> +	}
> +
> +	/* Address offset for volatile registers of additional dice */
> +	params->vreg_offset =
> +			devm_krealloc(nor->dev, params->vreg_offset,
> +				      n_dice * sizeof(*dwords),
> +				      GFP_KERNEL);
> +	if (!params->vreg_offset) {
> +		ret = -ENOMEM;
> +		goto out;
> +	}
> +
> +	for (i = 1; i < n_dice; i++)
> +		params->vreg_offset[i] = dwords[SFDP_DWORD(i) * 2];
> +
> +	params->n_dice = n_dice;

we then truncate it to u8, which is fine.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
