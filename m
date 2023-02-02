Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4878C61DA4
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Feb 2023 19:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IN5R1pwHmUySpyxW8FW4WBN+I48uk3+wbCb38NrIjxo=; b=Tn7ioE1hHof1u2
	d27wNmcxL0RpXOiKdpR0DoXdwgrRKf0xTJFlLnwFzOjhv6lJgHq/LMShHISU/m/7gLIUQzsNzD/pJ
	uHeTAFyg1f570xCrRLuEcnMIe8rjkzRb8KTCNaqQEfFMYJS/D83m/g4ybf86Pmnvan+45Thr5BjiK
	s1+gC84g/bs67Tdulw3YkWZJFx7A78q/qbbFZxgjjD81Km++e72gSv4nihBII2AuKUmCXKihX2hkf
	kmyiUr9UhfvsDbgx4+wD19nURUcD6tuX5h8Zg783E9q9uhVnNl/4v+W/JXST24pouIK16J8Dz53/K
	kOD70+l/xIMkvabN+4qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNfPj-00H4lY-Ej; Thu, 02 Feb 2023 19:38:31 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNfPf-00H4kl-FD
	for linux-mtd@lists.infradead.org; Thu, 02 Feb 2023 19:38:28 +0000
Received: by mail-wr1-x430.google.com with SMTP id a2so2418176wrd.6
        for <linux-mtd@lists.infradead.org>; Thu, 02 Feb 2023 11:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C2XOALXv/Lj/lmT5IZS4EM/O7xBhsu0gzTnxmxxQFEQ=;
        b=ai9z93zWh1nxHEkpgAWM67OPWJvM+Vu/PU636V4sK11yJK5hofcc+GRwN7jHMsJ6XR
         /zKW7doxAUt0kd1mATR0eqPJYI1nVtsEESa/7dRgW8TyvKurmbXBqgc87VH1O/vQeqm5
         01bc8AfORXvBuBtt8FB2MuskPcYUCZxiK2rfLdapeFSp5wW0wj8tKWC1IQmJYTPRLN1R
         wtezcpROIwmk/hmhr9qPtQ2FEEGxKCzsBR4MMyqbrxPBgnL5nXDJdT0pd1ApYpBMZiNw
         OKw6dQicHrecpnrLh6aHnBp9VHL1Cpulnoht+DAufVcxvY3IWsmfO7ieHqcK6AdEo7qh
         7heA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C2XOALXv/Lj/lmT5IZS4EM/O7xBhsu0gzTnxmxxQFEQ=;
        b=nVxcCsH8K8+mdz91N/fEH3/IXuCHEfOva8AGhPfdRjPysCzJz0EeHPLBBCIUt89uYZ
         656mc8YpAgDG/KT2rZD49FLJRuiYA7+77h40sYpuy9ayVTuTybyX/uyyP3tm5Pm77zeB
         +CHSxz4OqGG6tikm5+qzYtn8nKkg7/TL2q2dtAMu7DObhdhF2SMxj4reka55NPHfUf1V
         2dt4LtLILq9HRB0h94ughZXBzihWQWW9lXd2tvV+3uuVFXVHfzI1Gw254usejbDWpGlZ
         xS4eXwri0J6dA2ShDlXn7AvDruj/IljYEWEO3oGe/bIaASiaMVnxB3LVnB9NwNJis8qI
         Or8Q==
X-Gm-Message-State: AO0yUKU9GTVmN7TIX3xvRDEOWf7sR3vnrzki5ZKf+AvPjncq6MB4Z0D7
	EN90fkNo1rgjTMsjUT2xfNemjw==
X-Google-Smtp-Source: AK7set8s31+8dJyviAqvWfgopAsB11o+t1DPesoqoYzMeakMwcxI34bHHjVpqWOgbQ1STdhN0+87TA==
X-Received: by 2002:adf:fe86:0:b0:2bf:f6b7:7a63 with SMTP id l6-20020adffe86000000b002bff6b77a63mr8081615wrr.0.1675366700524;
        Thu, 02 Feb 2023 11:38:20 -0800 (PST)
Received: from [192.168.2.104] ([79.115.63.122])
        by smtp.gmail.com with ESMTPSA id q6-20020adfab06000000b002bfcc940014sm265280wrc.82.2023.02.02.11.38.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 11:38:20 -0800 (PST)
Message-ID: <8757b9bc-c771-a612-1d6a-1a704e7a7688@linaro.org>
Date: Thu, 2 Feb 2023 21:38:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2] mtd: spi-nor: Fix shift-out-of-bounds in
 spi_nor_set_erase_type
Content-Language: en-US
To: pratyush@kernel.org, michael@walle.cc, Alexander.Stein@tq-group.com,
 lrannou@baylibre.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20230202191451.35142-1-tudor.ambarus@linaro.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230202191451.35142-1-tudor.ambarus@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_113827_582842_E5C51EAD 
X-CRM114-Status: GOOD (  16.98  )
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

> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 247d1014879a..9b90d941d87a 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2019,10 +2019,22 @@ void spi_nor_set_erase_type(struct spi_nor_erase_type *erase, u32 size,
>   			    u8 opcode)
>   {
>   	erase->size = size;
> -	erase->opcode = opcode;
> -	/* JEDEC JESD216B Standard imposes erase sizes to be power of 2. */
> -	erase->size_shift = ffs(erase->size) - 1;
> -	erase->size_mask = (1 << erase->size_shift) - 1;
> +
> +	if (size) {

actually this is not needed now that spi_nor_mask_erase_type() is 
introduced. All the callers of spi_nor_set_erase_type() guarantee that
erase_size is not zero.

> +		erase->opcode = opcode;
> +		/* JEDEC JESD216B imposes erase sizes to be power of 2. */
> +		erase->size_shift = ffs(size) - 1;
> +		erase->size_mask = (1 << erase->size_shift) - 1;
> +	}
> +}
> +

So the fix should just contain the introduction of 
spi_nor_mask_erase_type(). Louis, do you want to authorship v3?

> +/**
> + * spi_nor_mask_erase_type() - mask out an SPI NOR erase type
> + * @erase:	pointer to a structure that describes a SPI NOR erase type

an SPI

> + */
> +void spi_nor_mask_erase_type(struct spi_nor_erase_type *erase)
> +{
> +	erase->size = 0;
>   }
>   
>   /**
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index f6d012e1f681..25423225c29d 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -681,6 +681,7 @@ void spi_nor_set_pp_settings(struct spi_nor_pp_command *pp, u8 opcode,
>   
>   void spi_nor_set_erase_type(struct spi_nor_erase_type *erase, u32 size,
>   			    u8 opcode);
> +void spi_nor_mask_erase_type(struct spi_nor_erase_type *erase);
>   struct spi_nor_erase_region *
>   spi_nor_region_next(struct spi_nor_erase_region *region);
>   void spi_nor_init_uniform_erase_map(struct spi_nor_erase_map *map,
> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> index fd4daf8fa5df..298ab5e53a8c 100644
> --- a/drivers/mtd/spi-nor/sfdp.c
> +++ b/drivers/mtd/spi-nor/sfdp.c
> @@ -875,7 +875,7 @@ static int spi_nor_init_non_uniform_erase_map(struct spi_nor *nor,
>   	 */
>   	for (i = 0; i < SNOR_ERASE_TYPE_MAX; i++)
>   		if (!(regions_erase_type & BIT(erase[i].idx)))
> -			spi_nor_set_erase_type(&erase[i], 0, 0xFF);
> +			spi_nor_mask_erase_type(&erase[i]);
>   
>   	return 0;
>   }
> @@ -1089,7 +1089,7 @@ static int spi_nor_parse_4bait(struct spi_nor *nor,
>   			erase_type[i].opcode = (dwords[SFDP_DWORD(2)] >>
>   						erase_type[i].idx * 8) & 0xFF;
>   		else
> -			spi_nor_set_erase_type(&erase_type[i], 0u, 0xFF);
> +			spi_nor_mask_erase_type(&erase_type[i]);
>   	}
>   
>   	/*

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
