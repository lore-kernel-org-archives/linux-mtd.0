Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4B15CCF9E3
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Nov 2025 06:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WWNi4IWnZot+jYyqgJwEjVztRNs8VjEcACuMmUwxdsU=; b=DKgEeJSTBmQoxs
	L3Bzg2JSwxsaB0ZW3T3TGYbgLfL3KrdAw7328lFtAsc3+CWkIQqq3RNjo5KYhL/WQiHIArsaUzii8
	b3ZBv6uD/yvYGiKu3LG6arEUkcdUwQf6T1sY0awM/eCHshVsymgYrkamNXuug49tAs/Fr5Oq8LJjk
	nOhOownrncub5puxY4XKZ7O5Q1zLaT7+V6UYEEhSysX9crHNmNtrd3J+dwxJvHHqwImdvoy2jEss5
	3IWlK5InA5j1T/zsX8Z/sGfz6p4BdxXQXpd/CS8clK09yrX7nIWO36p/oDQY+VqZShWHeMq97NXNk
	+/fBTNhi2xLu0AMtdrsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vILRf-00000004pfr-1AjH;
	Mon, 10 Nov 2025 06:32:07 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vILRd-00000004pfV-07qf
	for linux-mtd@lists.infradead.org;
	Mon, 10 Nov 2025 06:32:06 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4710a1f9e4cso20097765e9.0
        for <linux-mtd@lists.infradead.org>; Sun, 09 Nov 2025 22:32:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762756323; x=1763361123; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fD41ZL4TlCiwqwxi6QcBrdLjUd39djAdPK6JdkJ0Gzo=;
        b=PtMVWeckgUq9IuCdoUST6VRyTfQ/W8UQyy1oscdHcILAtAXML1qea4YjSoxjoOAZ+x
         xEyQ943ApUfmheTsJtu3UkBqHTv7k26O8VNycgTt22ct6xhlpFjCotXMfWTjA4EPN3Ga
         nPVly+36WB74HmH8BGEGjVvZ+W9XvAy084my26uIs50pLVErmMmxxa4c7SZPEv7XMS/F
         X+Q1fuotemExJZl/Zn4b6BK/RgFZnBPGrlSrUwtFxt7/GpHSvSLlwuNwKVq+tkjsrpKB
         Uo4x/pFZirz8uaf+5BzwjrzpHxHDE5UUGm1fRYc/UFr0F6meYr0JCBpQxEskMNHgung/
         oQkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762756323; x=1763361123;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fD41ZL4TlCiwqwxi6QcBrdLjUd39djAdPK6JdkJ0Gzo=;
        b=BholxhYFtq9Ifp5F4TQq5vcU8LA2fr0O9j9VYx3VhGEjcO7zUSTOrzWFIhPGnl1Ag2
         P2g++hIqTSRAZkfqKSZWtcOlWfwbFxz7t7WgiLvsbwMW61iLkGp2LRDd8e7CP8Upe+l5
         ckE/Rt5XYePIgtc4fUOQC07Lf9/dKzpgDiwzyI70OV225nGYCIVFQU9dW7uZlek8OQy9
         rkhSywLM8wDXWuO094egmZXbWJfj+sK2UVS7cIt3evu7kyXPJyCUlF12TqUzZ3VbwQpk
         3zat74Dft5yFc07pAMj5F5kpExpaAZYl2Qc8Q1gKyLpY54RGSjtWbPXQCcczhMVS6BXS
         LiFg==
X-Gm-Message-State: AOJu0Yyt/yOjHOtNoCMuTqePAodDfM4KJHuzNXaS2RK9YqscEWwuL5SZ
	tNveYO7Y79ItM1wWPaYvZn8idBlTnsEujr6wfzEjO+crK9lYj9utsfdG+eG0wwBEYg8=
X-Gm-Gg: ASbGncuzJH7quj+Ur7VtyU9+8dD+ou54+Ls+yZIEFv11Cv4JPFn7aQhmK9eYICpSpGW
	J3KBv3vwP0eVljDrJWcNFT/733pau6ZvqMgd+uj/A18llA8UZWhPTXX6TNUIT2M735IynJwi34L
	SMvr/p8rcPWfhZFlfuq5HQRAZvXcqggC3WRs4THpMNpeUyRLCy4UNWDTYp7SXBojmmL5zVHWpY7
	tKm0VZe4VoAd87JoXoqWxCFAO7Yvc0HsLNRmXRp97sMYP4Wp2arCJf+a471nSBSQC611OsZ3RKZ
	CrQoXhomoNb3o6CQRr/aAtQjQ34FV3eol6KuIYaMo8mu4GsjgYTlajt9pQeUzJ2FWkYM/T9cQN9
	HTXeUHbwsH6aY0tDYISCwGr/XK79jwtLPugiby3C4DTDDp70yS2fCwNyHTng63WqvXYruMQPgxj
	PZoc9fzu/ML2X1EH0C
X-Google-Smtp-Source: AGHT+IH7itPdnN3+CMIJFyI8o/5N3sDOzt/9g2GEzbgtOpPZGmoToNN4ZHSLHno+aeXqtWyjmYzHGA==
X-Received: by 2002:a05:600c:5247:b0:477:7cac:508d with SMTP id 5b1f17b1804b1-4777cac524cmr11045475e9.16.1762756322721;
        Sun, 09 Nov 2025 22:32:02 -0800 (PST)
Received: from [10.11.12.107] ([5.12.85.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac6794f6esm23183356f8f.41.2025.11.09.22.32.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Nov 2025 22:32:02 -0800 (PST)
Message-ID: <85b973b1-ec1a-4508-a9f5-fbf6917eab85@linaro.org>
Date: Mon, 10 Nov 2025 08:32:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] mtd: spi-nor: micron-st: rename the die_late_init
 functions
To: Haibo Chen <haibo.chen@nxp.com>, Pratyush Yadav <pratyush@kernel.org>,
 Michael Walle <mwalle@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev
References: <20251110-nor-v1-0-cde50c81db05@nxp.com>
 <20251110-nor-v1-1-cde50c81db05@nxp.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20251110-nor-v1-1-cde50c81db05@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_223205_161953_93312A6B 
X-CRM114-Status: GOOD (  19.52  )
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
> st_nor_two/four_die_late_init() also suit for micron chips, so
> rename to micron_st_nor_two/four_die_late_init().
> 
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
> ---
>  drivers/mtd/spi-nor/micron-st.c | 70 ++++++++++++++++++++---------------------
>  1 file changed, 35 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
> index 187239ccd549510c6e9a6eacf4ae41158287e077..92eb14ca76c57f29ece1edb3fe652c56d1c2888f 100644
> --- a/drivers/mtd/spi-nor/micron-st.c
> +++ b/drivers/mtd/spi-nor/micron-st.c
> @@ -127,6 +127,38 @@ static int micron_st_nor_set_octal_dtr(struct spi_nor *nor, bool enable)
>  			micron_st_nor_octal_dtr_dis(nor);
>  }
>  
> +static int micron_st_nor_four_die_late_init(struct spi_nor *nor)
> +{
> +	struct spi_nor_flash_parameter *params = nor->params;
> +
> +	params->die_erase_opcode = SPINOR_OP_MT_DIE_ERASE;
> +	params->n_dice = 4;
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
> +static int micron_st_nor_two_die_late_init(struct spi_nor *nor)
> +{
> +	struct spi_nor_flash_parameter *params = nor->params;
> +
> +	params->die_erase_opcode = SPINOR_OP_MT_DIE_ERASE;
> +	params->n_dice = 2;
> +
> +	/*
> +	 * Unfortunately the die erase opcode does not have a 4-byte opcode
> +	 * correspondent for these flashes. The SFDP 4BAIT table fails to
> +	 * consider the die erase too. We're forced to enter in the 4 byte
> +	 * address mode in order to benefit of the die erase.
> +	 */
> +	return spi_nor_set_4byte_addr_mode(nor, true);
> +}

I see you also moved the methods a bit up, maybe to have all micron_st methods
in one place. Specify this in the commit message to spare reviewers of checking
bit-to-bit exact move.

With that:
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

> +
>  static void mt35xu512aba_default_init(struct spi_nor *nor)
>  {
>  	nor->params->set_octal_dtr = micron_st_nor_set_octal_dtr;
> @@ -193,48 +225,16 @@ static const struct spi_nor_fixups mt25qu512a_fixups = {
>  	.post_bfpt = mt25qu512a_post_bfpt_fixup,
>  };
>  
> -static int st_nor_four_die_late_init(struct spi_nor *nor)
> -{
> -	struct spi_nor_flash_parameter *params = nor->params;
> -
> -	params->die_erase_opcode = SPINOR_OP_MT_DIE_ERASE;
> -	params->n_dice = 4;
> -
> -	/*
> -	 * Unfortunately the die erase opcode does not have a 4-byte opcode
> -	 * correspondent for these flashes. The SFDP 4BAIT table fails to
> -	 * consider the die erase too. We're forced to enter in the 4 byte
> -	 * address mode in order to benefit of the die erase.
> -	 */
> -	return spi_nor_set_4byte_addr_mode(nor, true);
> -}
> -
> -static int st_nor_two_die_late_init(struct spi_nor *nor)
> -{
> -	struct spi_nor_flash_parameter *params = nor->params;
> -
> -	params->die_erase_opcode = SPINOR_OP_MT_DIE_ERASE;
> -	params->n_dice = 2;
> -
> -	/*
> -	 * Unfortunately the die erase opcode does not have a 4-byte opcode
> -	 * correspondent for these flashes. The SFDP 4BAIT table fails to
> -	 * consider the die erase too. We're forced to enter in the 4 byte
> -	 * address mode in order to benefit of the die erase.
> -	 */
> -	return spi_nor_set_4byte_addr_mode(nor, true);
> -}
> -
>  static const struct spi_nor_fixups n25q00_fixups = {
> -	.late_init = st_nor_four_die_late_init,
> +	.late_init = micron_st_nor_four_die_late_init,
>  };
>  
>  static const struct spi_nor_fixups mt25q01_fixups = {
> -	.late_init = st_nor_two_die_late_init,
> +	.late_init = micron_st_nor_two_die_late_init,
>  };
>  
>  static const struct spi_nor_fixups mt25q02_fixups = {
> -	.late_init = st_nor_four_die_late_init,
> +	.late_init = micron_st_nor_four_die_late_init,
>  };
>  
>  static const struct flash_info st_nor_parts[] = {
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
