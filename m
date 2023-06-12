Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C35C0C7EE25
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Jun 2023 12:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N71zWDbrvYqSnHqJCIKjw2idBddiDCBuWCWViz213f4=; b=zJ2gE0uGEgLol+
	D8qfNoel8fKOpQdoJy4Q6MolYdvyNDVLqh7vTMoSX6lc/sZpmUWtlva0Qpw9Tr1xXWyfYW2Da/ntv
	ay1J2xNCJZIf0udEwlTe+ZbsCJI37bJS6NZ47rbDRD4UPcipJR/ceD0OmGKpD+cOpPKaRcSeXdo/d
	nvsMT9UAgPGZsTLE0hk5VkJGLRSrZiVidODq8RgOgY9ufM0l4Pg88xyWYuzU1xJsSbBHvLiGA6A6A
	JgfYMUFaa8k9Y/P+ikf+BBsbDmvJ9x2VH5I+Egwt59wKqZgoaLjtHZMfLUKR1RnYV8a1Z+1vI4EtB
	ZpWWAi4SxLWK0RYNtfLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8ga2-003zl5-12;
	Mon, 12 Jun 2023 12:23:30 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8gZz-003zk2-18
	for linux-mtd@lists.infradead.org;
	Mon, 12 Jun 2023 12:23:28 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3f6d38a140bso31370855e9.1
        for <linux-mtd@lists.infradead.org>; Mon, 12 Jun 2023 05:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686572605; x=1689164605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JaF2/AQy+Pd7sT7HS1TKosnw/Cc6RAHbHoYMSt6Evqo=;
        b=oXeyMOngcuPIfHgdQqVLYpf27qOgHHeJvpIPblB8DUeraHO5XjVNgz+5qfqacMd/eF
         FrUWaze19iILBCKuSFedXj1HfIsJRaEu6byVabcrqqa1VwzsT4YzKF1wXu9MnjyfWBad
         6GxAu89/U6j03alH1awMqrYQdU61gGA+dIaKB1oFD79XjqpicBqEnpizNUW+QdwhuT4z
         bTckjWk5C5NsH0rYtaAIMbOOTB8wAnURUXT+ShM76hghOvqSz0rVRXAmdH41rh8cjw2x
         go1QEhpKNVN3XgJgtDW8wcS5MYmve/wxcpsGeFXFFPRT9wYNcNpngKR/vhC55onQRLNj
         QGOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686572605; x=1689164605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JaF2/AQy+Pd7sT7HS1TKosnw/Cc6RAHbHoYMSt6Evqo=;
        b=EZLBI+l6MkEKijs5L2TSEa3qdywvSepeFrQdyIN1YFXU8l/pqstefJWlXmfcQWWe/1
         BLwkvXs/Hrjz/BtKwWLbrWDZwH+Uavnhp/u5fqfGpc3yHOtov2qfOBuPI2bHXDOrelWy
         HjFZpM0W/j+q9OPzLla1vGnCP3pL57PgiPHv0FtKSCXddXxZfEiduQ9emQySM8NNbIvQ
         mzPy/W3KNZ0uQPC9x1GEXfNw+er+le1eo7zSQDXFVaunrSa/N2CR+GXWfgknRZiOalEZ
         9Czzw2efO9DsH6Bxa0rpFjNNr64M5wC6cnAnwdG6BYmYvUzAlka1XRepnZoyQXf/jrPa
         TJiA==
X-Gm-Message-State: AC+VfDxG4cKciOsBaCJiwS2UYYeRlPqpg08pjsM8b05Xkk2gA0Nwf8FG
	/XtmsCkJzZtWtLUZ9ElubjBkRA==
X-Google-Smtp-Source: ACHHUZ5TJ5mSWjlG49yKdzdpm0sui4kVxa9mzVgXHZm85I+XK912psUAP5Drg1J7jI431xz7372J7w==
X-Received: by 2002:a05:600c:254:b0:3f7:16dd:1c3b with SMTP id 20-20020a05600c025400b003f716dd1c3bmr9541906wmj.10.1686572604810;
        Mon, 12 Jun 2023 05:23:24 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.153])
        by smtp.gmail.com with ESMTPSA id m19-20020a7bcb93000000b003f7f4b7f286sm11326818wmi.12.2023.06.12.05.23.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 05:23:24 -0700 (PDT)
Message-ID: <ee8c08c7-e22a-eb58-647f-f6a29ab48ee3@linaro.org>
Date: Mon, 12 Jun 2023 13:23:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 5/5] mtd: spi-nor: spansion: Add S28HS02GT ID and fixups
Content-Language: en-US
To: tkuw584924@gmail.com, linux-mtd@lists.infradead.org
Cc: pratyush@kernel.org, michael@walle.cc, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, d-gole@ti.com, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <cover.1686557139.git.Takahiro.Kuwano@infineon.com>
 <78847f3e368651b13d00e0b37864b74d8736cc57.1686557139.git.Takahiro.Kuwano@infineon.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <78847f3e368651b13d00e0b37864b74d8736cc57.1686557139.git.Takahiro.Kuwano@infineon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230612_052327_414793_06CE9937 
X-CRM114-Status: GOOD (  19.69  )
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
> Infineon S28HS02GT is 2Gb, multi-chip package, Octal SPI Flash. This patch
> adds ID table, fix params->n_dice value, and replace params->ready() with
> MCP version.
> 
> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> ---
>  drivers/mtd/spi-nor/spansion.c | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
> index 8b8512402639..88dc849a63b3 100644
> --- a/drivers/mtd/spi-nor/spansion.c
> +++ b/drivers/mtd/spi-nor/spansion.c
> @@ -720,6 +720,10 @@ static int s28hx_t_post_sfdp_fixup(struct spi_nor *nor)

you are modifying all the s28hx_t flashes, yet I don't see anything
mentioned about them in the commit message, why they are still working
and what tests have been done.

>  	 */
>  	nor->params->rdsr_addr_nbytes = 4;
>  
> +	/* The 2 Gb parts duplicate info and advertise 4 dice instead of 2. */
> +	if (nor->params->size == SZ_256M)
> +		nor->params->n_dice = 2;
> +
>  	return cypress_nor_get_page_size(nor);
>  }
>  
> @@ -738,8 +742,15 @@ static int s28hx_t_post_bfpt_fixup(struct spi_nor *nor,
>  
>  static void s28hx_t_late_init(struct spi_nor *nor)
>  {
> -	nor->params->octal_dtr_enable = cypress_nor_octal_dtr_enable;
> +	struct spi_nor_flash_parameter *params = nor->params;
> +
> +	params->octal_dtr_enable = cypress_nor_octal_dtr_enable;
> +
>  	cypress_nor_ecc_init(nor);
> +
> +	/* Replace ready() with multi die version */
> +	if (params->n_dice)
> +		params->ready = cypress_nor_sr_ready_and_clear;
>  }
>  
>  static const struct spi_nor_fixups s28hx_t_fixups = {
> @@ -913,6 +924,11 @@ static const struct flash_info spansion_nor_parts[] = {
>  		MFR_FLAGS(USE_CLPEF)
>  		.fixups = &s28hx_t_fixups,
>  	},
> +	{ "s28hs02gt",   INFO(0x345b1c,      0, 256 * 1024, 1024)
> +		PARSE_SFDP
> +		MFR_FLAGS(USE_CLPEF)
> +		.fixups = &s28hx_t_fixups,
> +	},
>  };
>  
>  /**

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
