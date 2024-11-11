Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11FE8D2E9F1
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 13:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=noUNlYoHqg1SkMCPhWLE/MdW7Ad6LrlL2rdSLsPwbgc=; b=Xy3NaPvG9wRHAf
	+upijA6zPMrTCdum0842t2M28TaA6U6yej5mSN5FyAL+qX96WFb4i5jetbnYzU8yHjpV/UDh58d6n
	Ii9Xdlm7stz1fjJDzFA94V1sjbXsjCN9ITGHiH6l60Q3Ea/+iMMyES2V+Y50mCiUHwHuzkSYil04C
	j6tcIcgvQMijIaNM9JaG4z/vMjlUnF1iaTcJP3FdlUb3X3+/it7m9I/CoQE0cYMDHUeqbbDS7YcJw
	ZTvb4AhcV8pRaLLj5BrskjVwOnYhZZgzktWnzskyFa19c2GiPglmRCYLAj+pkJm/EeKnFv0mwU+bN
	rPFS5tkBUT+oRoQZ0qgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAUh2-00000000Cp0-3bae;
	Mon, 11 Nov 2024 13:43:00 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAUge-00000000Chn-0Xqg
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 13:42:38 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43167ff0f91so39747355e9.1
        for <linux-mtd@lists.infradead.org>; Mon, 11 Nov 2024 05:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731332554; x=1731937354; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zFFB4p9gtjjqP0ylPmDfODC3qKl0n8dAQXHFfxJE1Lk=;
        b=wwYf29hu2w8fDB3CknCOAoHEmML2t3xPH3kqk1e67BIz6Xw23w7b6YkCVgnEsFawbz
         vMTNzVRlFnyPfE7o/wlKLUJB/L1wKhgzf8zV3h/eMSbXV5SBPbtM2A56T55aiGWNEU/A
         aXGlX4lEj59SIN1IFwdOf+i/th9JwHc4gWJy0sPfHa0Qk/RT5L1NYL8AkBGDiuzccdNi
         /8wFbIOGi2NnqB7Rsuw9nDSY8pJLYb1LyFhFKPjsAwsqiId5kS9znAVg6UD3ZL0zMtlt
         hdvAQoUpDN1GwZbEkqOgPn8xrl3K4TyIlWgZytOI+mkS/8NXTY1KsZbj055YdFpEkh7S
         Xe9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731332554; x=1731937354;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zFFB4p9gtjjqP0ylPmDfODC3qKl0n8dAQXHFfxJE1Lk=;
        b=WTIquGB2PNWwK6Fb63wJi8D4FsBGfLEsJCe2ZwXH3UjONvIksGpy7sLeqkz0H9m5ct
         7NjX87hCKEON5dOmXOEunKYbXN9Gi5Br6hb30rC4hZNOlguTNY2NgADdmuOO9+hiXy49
         /gU7dM394d/FC7GR2PKUD/qu0wxtkK00fccAkZCCsqd5bwQlOFwLW2bABj6oo98CQyMW
         5KbHDGjg+i+tXZASPhq2pRntZvUVrBMBejWxrtGvL76Bha3yvf50yQS6PFtu+FyDEufT
         i0FpGMZ0wzn87QTSWvfbATUP5tOkMRDMar6ZAGA8BP/Ho29b0SeqYTzyxYn1FV2ING8+
         aFkw==
X-Forwarded-Encrypted: i=1; AJvYcCUowoVrnKQxPSMItRgFCg0E4xYavurhYYFSi91ydXXhB7pFpHVIfXc4uofu++/sz2OVitNK/21aX5A=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxx3INL/suLXyXc/Czo3yMi6Oos8LOc251QeLd7C2t0Rkc6Z7N5
	nRH9leWdqy16n7i7H2AfGFxM6ENOVxtI00GY+Q1cDfZIrrcdXxppy5SVc6cJwos=
X-Google-Smtp-Source: AGHT+IHFp5IW76ae0+ug0Yg3riirx+YgM0J4mYik8o2ZcaxazUwINUADaWThHKkUZHiOHvo7i0nQ4Q==
X-Received: by 2002:a05:600c:3b82:b0:42c:de34:34c1 with SMTP id 5b1f17b1804b1-432b74fdaa1mr101737845e9.2.1731332554429;
        Mon, 11 Nov 2024 05:42:34 -0800 (PST)
Received: from [192.168.0.157] ([79.115.63.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432b05c1a13sm175792135e9.29.2024.11.11.05.42.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Nov 2024 05:42:33 -0800 (PST)
Message-ID: <9e942bdd-6ade-40a7-ae4a-104ed288a09f@linaro.org>
Date: Mon, 11 Nov 2024 13:42:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/24] spi: amlogic-spifc-a1: Support per spi-mem
 operation frequency switches
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org
Cc: Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
 Steam Lin <stlin2@winbond.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Sanjay R Mehta <sanju.mehta@amd.com>, Han Xu <han.xu@nxp.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Haibo Chen <haibo.chen@nxp.com>, Yogesh Gaur <yogeshgaur.83@gmail.com>,
 Heiko Stuebner <heiko@sntech.de>, Michal Simek <michal.simek@amd.com>
References: <20241025161501.485684-1-miquel.raynal@bootlin.com>
 <20241025161501.485684-5-miquel.raynal@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20241025161501.485684-5-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_054236_246871_B1B4E5B7 
X-CRM114-Status: GOOD (  19.00  )
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



On 10/25/24 5:14 PM, Miquel Raynal wrote:
> Every ->exec_op() call correctly configures the spi bus speed to the
> maximum allowed frequency for the memory using the constant spi default
> parameter. Since we can now have per-operation constraints, let's use
> the value that comes from the spi-mem operation structure instead. In
> case there is no specific limitation for this operation, the default spi
> device value will be given anyway.
> 
> The per-operation frequency capability is thus advertised to the spi-mem
> core.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/spi/spi-amlogic-spifc-a1.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/spi/spi-amlogic-spifc-a1.c b/drivers/spi/spi-amlogic-spifc-a1.c
> index fadf6667cd51..18c9aa2cbc29 100644
> --- a/drivers/spi/spi-amlogic-spifc-a1.c
> +++ b/drivers/spi/spi-amlogic-spifc-a1.c
> @@ -259,7 +259,7 @@ static int amlogic_spifc_a1_exec_op(struct spi_mem *mem,
>  	size_t data_size = op->data.nbytes;
>  	int ret;
>  
> -	ret = amlogic_spifc_a1_set_freq(spifc, mem->spi->max_speed_hz);
> +	ret = amlogic_spifc_a1_set_freq(spifc, op->max_freq);
>  	if (ret)
>  		return ret;
>  
> @@ -320,6 +320,10 @@ static const struct spi_controller_mem_ops amlogic_spifc_a1_mem_ops = {
>  	.adjust_op_size = amlogic_spifc_a1_adjust_op_size,
>  };

I see the driver sets ctrl->min_speed_hz = SPIFC_A1_MIN_HZ;

Do you want to introduce a struct spi_controller_mem_ops.supports_op and
check that the spimem op freq is not below the controller's minimum freq?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
