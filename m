Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8D00CCF9E3
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Nov 2025 06:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zQGijDa5z6pU0l01C8kgRsMEa1hBZRWY7qjh22pnxeg=; b=nVIOp+C/EPc0DT
	7ezrUDErUvlAqf8IzQ37YF2TRKJBcYXjpuAs6TdhMg6DRl9NVLDj3N4UqoDXJeLs49l2AbDOf17K9
	uqTG9tm9c44I0GKnbaHub79a1HEEQR4SqVVJPqf26Zcmli5NU3SRUjn12ss2rrMRdx0yWmm4k3z65
	v604YH/M93npWA8heA/DoNynBsrNsrH5U5YXAaQld5xU213KBVRQ8eFYF3POnXE7MmLlhNQtsS89d
	P97w6bKT1n0VP06iWqrg1G2jPksOuyHg6+zUx1O1tZIFZpDPxmiLEwbqdHJLrAyQ6N0nijZUpquvm
	b8fRhEVox8gOxcl7orlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vILY5-00000004q4d-1YMx;
	Mon, 10 Nov 2025 06:38:45 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vILY1-00000004q43-3THb
	for linux-mtd@lists.infradead.org;
	Mon, 10 Nov 2025 06:38:43 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-42b3c5defb2so208445f8f.2
        for <linux-mtd@lists.infradead.org>; Sun, 09 Nov 2025 22:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762756720; x=1763361520; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7kSQR2mHljVM9pPmspMiUraHJjkPCCeKTaNFeu9c9xc=;
        b=u3EUWYaiGth7GRA/YmlaZfE3w7ub0f1bGVTfHN32RkdbWPr8cGoh926ffiyt+bvw7D
         T+wF2TzJhT4sm6S7of1obQEulwXAlQBuSXiTiOv8K/haBTqwe8Mu8FEVYATsYowZBbap
         UR+2gip2PO0S2KRU0gGcljpPKJrPzDUPEtYkw5KGZg/POCrGj4aveRLsCIhJ5p/AyOxQ
         yC7jU21OIvBw5+eNty4dM3ajiH93u9xPEbBj7PWknVkpqvFvtzY8w6FCM0K9sIUoSQ9A
         8ap7YjwUgTn3MhdW1Ugq33yQhIXaiFKeW5eFcK1Xkcjtb75wyLqgFKjrf2vDhjG5dcSG
         oSDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762756720; x=1763361520;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7kSQR2mHljVM9pPmspMiUraHJjkPCCeKTaNFeu9c9xc=;
        b=Can04f1SZccnWqL2r/8pDUYf76mliEHofrDmxNqYxWLG74bHg0xspTX4szgLLa8Bc5
         vBT57BcxA+kokHHQ8DFnYtYLdMgjDgnCMWJJRNww5X1aCjf/YgmjJhd0H1zLpgt+HiaJ
         zgXNod26cNBiCxKZdPwG424mTy/p6Zx7/SVw5ved9CH61zjlfNgkyGBT9N9tNoL7nB/T
         OadMqOeEEZaHTheDkahPSA11dpynvPPo49JyXNmA3r13ZWAC6bRI7qBNYFjw2WvobGif
         cZSzAKkzV9D4VqbbmTWWb3861wIoJSnVyWIW75ND8MK7+7ypEgluJ7JJFEfEF2WuM5c9
         XilA==
X-Gm-Message-State: AOJu0YwxzVvXrnrtOfhRuXYtnOrx71LlDCPly3f97Pb+aeR5RptcJ5W9
	JjLGAGaansU190mtR1b397FGYjSXdFpXao3Z+KdzCEMZgnbmuCMenIJc1eb7oiQfvS4=
X-Gm-Gg: ASbGnctrPl4gXq5ke3phnVQkCfmzKiwEYW++4bPfdgj9TxbnQnXJYDOKgr99uJW/+4j
	x2tz2oABCPeJ8fY+1rATxQpp0ur018sp2kBhkQSy1jLRo03D7nxdelkQgw5nPWoA3zMhMKwCGbG
	MZJXzZEGwzm1rIWYyss+ELa4nSgxRYk9hKknJ4ttxNIeF14MB1hRqUHB+E9S/3YKI31C1YNGw/z
	yXLb1Fde2pzMLp+Z7pDZI0m7cuCNcJb76nlS7bczlZ3pG/wbaXHU9ObBwaWwW1IMDpRTwkDULcF
	l2lQz7JepMrm/03NpPvS99a1MoIFppFfK2NdwXMZPjFJ0WBiDTzKezgCb7elK1VLScTdcKjO2wy
	NplBrMVNdBMQm5GaytnHWmgWz78lDsNpKmoHlOHSiAQd4DcNtLQxmDxZhu5aLtokftwhheHtvBq
	m78bNsngRPwKHV5Zyt
X-Google-Smtp-Source: AGHT+IFMcnA9pYYlnbLP/XD39suwrsBDerGX9hKDXL4+G1Ps4KoXb3zZoLCORFMf9T8PgOyp+I/FKQ==
X-Received: by 2002:a05:6000:3107:b0:427:914:7468 with SMTP id ffacd0b85a97d-42b2dc1e528mr6060266f8f.15.1762756719387;
        Sun, 09 Nov 2025 22:38:39 -0800 (PST)
Received: from [10.11.12.107] ([5.12.85.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac67920fcsm20181653f8f.39.2025.11.09.22.38.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Nov 2025 22:38:38 -0800 (PST)
Message-ID: <4479a34b-58b3-45aa-9d2e-5e2a64f61e9d@linaro.org>
Date: Mon, 10 Nov 2025 08:38:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] mtd: spi-nor: micron-st: add die erase for
 mt35xu512aba
To: Haibo Chen <haibo.chen@nxp.com>, Pratyush Yadav <pratyush@kernel.org>,
 Michael Walle <mwalle@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev
References: <20251110-nor-v1-0-cde50c81db05@nxp.com>
 <20251110-nor-v1-2-cde50c81db05@nxp.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20251110-nor-v1-2-cde50c81db05@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_223841_891582_171CFA59 
X-CRM114-Status: GOOD (  19.41  )
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



On 11/10/25 6:02 AM, Haibo Chen wrote:
> mt35xu512aba do not support chip erase command, and it contains one
> die, and only support die erase.

does this need a fixes tag then? With that:
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>> 
> Unfortunately the die erase opcode does not have a 4-byte opcode,
> here forced to enter in the 4 byte address mode in order to benefit
> of the die erase.
> 
> Link: https://datasheet.octopart.com/MT35XU02GCBA1G12-0AAT-Micron-datasheet-138896808.pdf
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
> ---

Also, would you please help us with SFDP dumps, as you did in the next patches?
It helps ups keep a database and update flashes to get rid of the non SFDP data.

Thanks!

>  drivers/mtd/spi-nor/micron-st.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
> index 92eb14ca76c57f29ece1edb3fe652c56d1c2888f..89cd146095584ddebdd258a186f6398b420e5800 100644
> --- a/drivers/mtd/spi-nor/micron-st.c
> +++ b/drivers/mtd/spi-nor/micron-st.c
> @@ -159,6 +159,22 @@ static int micron_st_nor_two_die_late_init(struct spi_nor *nor)
>  	return spi_nor_set_4byte_addr_mode(nor, true);
>  }
>  
> +static int micron_st_nor_one_die_late_init(struct spi_nor *nor)
> +{
> +	struct spi_nor_flash_parameter *params = nor->params;
> +
> +	params->die_erase_opcode = SPINOR_OP_MT_DIE_ERASE;
> +	params->n_dice = 1;
> +
> +	/*
> +	 * Unfortunately the die erase opcode does not have a 4-byte opcode
> +	 * correspondent for these flashes. The SFDP 4BAIT table fails to
> +	 * consider the die erase too. We're forced to enter in the 4 byte
> +	 * address mode in order to benefit of the die erase.
> +	 */
> +	return spi_nor_set_4byte_addr_mode(nor, true);
> +}
> +
>  static void mt35xu512aba_default_init(struct spi_nor *nor)
>  {
>  	nor->params->set_octal_dtr = micron_st_nor_set_octal_dtr;
> @@ -189,6 +205,7 @@ static int mt35xu512aba_post_sfdp_fixup(struct spi_nor *nor)
>  static const struct spi_nor_fixups mt35xu512aba_fixups = {
>  	.default_init = mt35xu512aba_default_init,
>  	.post_sfdp = mt35xu512aba_post_sfdp_fixup,
> +	.late_init = micron_st_nor_one_die_late_init,
>  };
>  
>  static const struct flash_info micron_nor_parts[] = {
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
