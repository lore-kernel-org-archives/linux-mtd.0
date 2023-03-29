Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76EBCC6FD18
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Mar 2023 17:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aYDDfa9TmwFGjm0s4beg4lO5+aD6nwTC11tQBxqz2+g=; b=a63H0BCu9eAx66
	fRVG5LRsIfz7W0WQsU6y+6GWRUV5K1Qu7/DW1D+CBFYncEc/wEqoXemwdGpBhiccS1Wm3XlZ2Jrbr
	bkP7sbPC2JAnKHojPfyBKvmAAb6EIQIyaBSOjvRHi42rw+7BsNG+uP8lPkQX+MPjRlkCH8nIeSpcC
	JvE5jEB/OYuVExfU1JpMzM/QnW6MwY06299WjTHi7xCYawIDDejy5gAiK3hp0eR+Hs5/AWuUsUWRv
	+01xm+TwVdpsr2d8fzmf+FLr2gezgH6HSLbrzKY0tzO0YNmyF9SDJZcVQTevBMMpLEkD/XwVDipj7
	Uc4eTR967pLJEBvpM2zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phZXT-001IGr-0t;
	Wed, 29 Mar 2023 17:24:47 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phZXP-001IEM-33
	for linux-mtd@lists.infradead.org;
	Wed, 29 Mar 2023 17:24:45 +0000
Received: by mail-wr1-x435.google.com with SMTP id t4so11310523wra.7
        for <linux-mtd@lists.infradead.org>; Wed, 29 Mar 2023 10:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680110680;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XOVryfUc/Y7KjZjnjn4gxlGPo9P8/dCDEanWdQi+WXQ=;
        b=lD9lZ8hN2nlaomGDG9pEF1n2PYsGKTs6CSDeCLPRwGJYoWigpivPxMvyntuUyLpQjL
         Qr62gI6pSd+fGSUbAxbhX3/WdilT6y5wPTrtq2ZhswFZF/B8nZQfjDpeWBsp6aE9YDbh
         iXdlIiGE4ugianAH8hwKOLaV9FUJ7jseL5BTOL/S/P9P9+XP2fzJ4DJL+w79CFLVhQbp
         xBngcOZh2kKIsQKpmi8ru4FcYoNQYBRx9YDsR0MhGh3YAqse1CbFB3XCHu1CLlhl639X
         dI6pDbKUQWoo8Hxp7kzl5U3zgNAiR+qXhIj/AXwixriY28U1c2UFxDnx2/f9H3A2tUkA
         QyGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680110680;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XOVryfUc/Y7KjZjnjn4gxlGPo9P8/dCDEanWdQi+WXQ=;
        b=737QsygeyVrBmtt5cCRDDDfPxwttPfvVPKJEC8trfpMDJFK9pyYYcJG2awAKeznmUX
         zYilVrfb7gQ9scJm7iEnkRtc/eskjERsXUc9VdLryS3OypoJoV84XOirK3x8n53cOoXK
         wfgpkYjTKgXqZCKKFXQXHEunnaV6xuCVKuoZ2B1BockU+G9W+cAGRINEm0AglFF9UJR8
         B0lnlIPwhcdayiHqQfk8R41yBFDRuiZx7vVeaBxHDQ4+y1QdDlnuD0ACs6wRptWWDS6Y
         xBfXjhqpOqQ/dP8kAwoMxBi79Krv5u43HZXsKZ+Q6sQbluBJpD21H+4DkB3Mei2UCCAB
         q5OA==
X-Gm-Message-State: AAQBX9dawYkqcRCkK+oedrQl/OhAn0paj75t2KlWOiISbPsb5+ycnkEm
	H2/F+OVjPklvx255k0epKELkzyqqpunRLLrzjHRINw==
X-Google-Smtp-Source: AKy350bwBDiwIZb096/dwTQ/bpgovqDe5sR+tIN6djcFzDFEXPd5pcPZJBBDLKU74RRA/8X0pJxavA==
X-Received: by 2002:a5d:538e:0:b0:2d5:ac9e:cdde with SMTP id d14-20020a5d538e000000b002d5ac9ecddemr13961131wrv.51.1680110680249;
        Wed, 29 Mar 2023 10:24:40 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.91])
        by smtp.gmail.com with ESMTPSA id p5-20020adfce05000000b002d64fcb362dsm25454518wrn.111.2023.03.29.10.24.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Mar 2023 10:24:39 -0700 (PDT)
Message-ID: <14eb22ec-3609-0a61-85eb-d8d4ad771583@linaro.org>
Date: Wed, 29 Mar 2023 18:24:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 07/11] mtd: spi-nor: Favor the BFPT-parsed
 set_4byte_addr_mode method
Content-Language: en-US
To: michael@walle.cc, pratyush@kernel.org
Cc: miquel.raynal@bootlin.com, richard@nod.at, Takahiro.Kuwano@infineon.com,
 bacem.daassi@infineon.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Pratyush Yadav <p.yadav@ti.com>
References: <20230322064033.2370483-1-tudor.ambarus@linaro.org>
 <20230322064033.2370483-8-tudor.ambarus@linaro.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230322064033.2370483-8-tudor.ambarus@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_102443_983291_1BFCE5D6 
X-CRM114-Status: GOOD (  21.94  )
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



On 3/22/23 06:40, Tudor Ambarus wrote:
> JESD216 SFDP defines in the BFPT standard methods to enter and exit the
> 4-Byte Address Mode. The flash parameters and settings that are retrieved
> from SFDP have higher precedence than the static initialized ones, because
> they should be more accurate and less error prone than those initialized
> statically. Favor the BFPT-parsed set_4byte_addr_mode method and use the
> generic core methods where possible.
> This patch may introduce regressions in case BFPT contains wrong data. The
> fix is to introduce a post_bfpt() fixup hook and update the wrong BFPT
> data.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
> ---
>  drivers/mtd/spi-nor/core.c      | 7 ++++++-
>  drivers/mtd/spi-nor/macronix.c  | 8 +++++++-
>  drivers/mtd/spi-nor/micron-st.c | 6 ++++--
>  3 files changed, 17 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index e212cc3c630d..2a08f8de97fa 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2533,6 +2533,8 @@ static void spi_nor_init_fixup_flags(struct spi_nor *nor)
>   */
>  static void spi_nor_late_init_params(struct spi_nor *nor)
>  {
> +	struct spi_nor_flash_parameter *params = nor->params;
> +
>  	if (nor->manufacturer && nor->manufacturer->fixups &&
>  	    nor->manufacturer->fixups->late_init)
>  		nor->manufacturer->fixups->late_init(nor);
> @@ -2540,6 +2542,10 @@ static void spi_nor_late_init_params(struct spi_nor *nor)
>  	if (nor->info->fixups && nor->info->fixups->late_init)
>  		nor->info->fixups->late_init(nor);
>  
> +	/* Default method kept for backward compatibility. */
> +	if (!params->set_4byte_addr_mode)
> +		params->set_4byte_addr_mode = spi_nor_set_4byte_addr_mode_brwr;
> +
>  	spi_nor_init_flags(nor);
>  	spi_nor_init_fixup_flags(nor);
>  
> @@ -2606,7 +2612,6 @@ static void spi_nor_init_default_params(struct spi_nor *nor)
>  	struct device_node *np = spi_nor_get_flash_node(nor);
>  
>  	params->quad_enable = spi_nor_sr2_bit1_quad_enable;
> -	params->set_4byte_addr_mode = spi_nor_set_4byte_addr_mode_brwr;
>  	params->otp.org = &info->otp_org;
>  
>  	/* Default to 16-bit Write Status (01h) Command */
> diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
> index 91a8fa7d4512..075a26945f2d 100644
> --- a/drivers/mtd/spi-nor/macronix.c
> +++ b/drivers/mtd/spi-nor/macronix.c
> @@ -105,11 +105,17 @@ static const struct flash_info macronix_nor_parts[] = {
>  static void macronix_nor_default_init(struct spi_nor *nor)
>  {
>  	nor->params->quad_enable = spi_nor_sr1_bit6_quad_enable;
> -	nor->params->set_4byte_addr_mode = spi_nor_set_4byte_addr_mode_en4b_ex4b;
> +}
> +
> +static void macronix_nor_late_init(struct spi_nor *nor)
> +{
> +	if (!nor->params->set_4byte_addr_mode)
> +		nor->params->set_4byte_addr_mode = spi_nor_set_4byte_addr_mode_en4b_ex4b;
>  }
>  
>  static const struct spi_nor_fixups macronix_nor_fixups = {
>  	.default_init = macronix_nor_default_init,
> +	.late_init = macronix_nor_late_init,
>  };
>  
>  const struct spi_nor_manufacturer spi_nor_macronix = {
> diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
> index a75f0f4e1c38..4d5333b14807 100644
> --- a/drivers/mtd/spi-nor/micron-st.c
> +++ b/drivers/mtd/spi-nor/micron-st.c
> @@ -425,13 +425,15 @@ static void micron_st_nor_default_init(struct spi_nor *nor)
>  	nor->flags |= SNOR_F_HAS_LOCK;
>  	nor->flags &= ~SNOR_F_HAS_16BIT_SR;
>  	nor->params->quad_enable = NULL;
> -	nor->params->set_4byte_addr_mode = spi_nor_set_4byte_addr_mode_wren_en4b_ex4b;
>  }
>  
>  static void micron_st_nor_late_init(struct spi_nor *nor)
>  {
> +	struct spi_nor_flash_parameter *params = nor->params;
> +
>  	if (nor->info->mfr_flags & USE_FSR)
> -		nor->params->ready = micron_st_nor_ready;
> +		params->ready = micron_st_nor_ready;
> +	params->set_4byte_addr_mode = spi_nor_set_4byte_addr_mode_wren_en4b_ex4b;

should have been:
	if (!params->set_4byte_addr_mode)
		params->set_4byte_addr_mode = spi_nor_set_4byte_addr_mode_wren_en4b_ex4b;


>  }
>  
>  static const struct spi_nor_fixups micron_st_nor_fixups = {

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
