Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D298CCFA1A
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Nov 2025 09:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gJXkLSXfeVevLICdBOOSfshYdCqqmz5jxY9cvGji++c=; b=faB1gpcv244G5X
	geoPduWqVckzV0QzUFQIyyrvtQAOP9eBcOLFDyzHz+3UFxWwca6fOK5uXZVejy/47P8H6i0tUVFv9
	O+IiP8vnh5Xu/1X6qhy/bChfvrdBciaYur9Io31DF8UrqL7li3rbk7fyNpq4xRjiVlhrdUFEUaw/z
	70GYHOJ/TF2IyiE26VBNYZzBHnW41gBl5leRVPmWiLpzzwZbshtU0S5cLqexYJs+Y131wu+39hQVX
	D20MEJJPVTcmHJ4zFdF2zqT+idOr5+mYDhsyLuDk3ensUgQQQjpNH7WSWIOdE7b0ckjJ3pIIj2uBV
	8wlFmAh29h10bvVZgCcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ72Z-00000008S9k-0zMv;
	Wed, 12 Nov 2025 09:21:23 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ72U-00000008S4y-2tkH
	for linux-mtd@lists.infradead.org;
	Wed, 12 Nov 2025 09:21:22 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-42b3377aaf2so310845f8f.2
        for <linux-mtd@lists.infradead.org>; Wed, 12 Nov 2025 01:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762939277; x=1763544077; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5vExX5lYwjZciNY84xOIPIx1RLXQKLj0IP41hX0dBbo=;
        b=AZwBPKV0unFY5v7Ei2OCxQz5ixlInVnw5ryiU/ZIzKnaeJCOsKBxhoS2etpusPciXM
         sJFlWZKAnUXFBNPYVJgeQmToleaEcs3i/C810MEBUAsnX4bhAnLqDA4180cPwJWXlDvz
         lK2ZXjaGtG+nyDQK/0i/7RHeKTXR7SRv841Mw3gLgOTRl85hQsy9jgHvB7wq8xMtNIHF
         WnqLsW17r6bL7BHRGYRH+OVrZ1ST8AE214KhWq8SXE957sOM3VbBTMglAY4CaCQ7woiQ
         lca2vB3WLafZ2a3jcAKRPxitoQp5wt2+9UVV+ZbmrvkLy9svaMdKhs6zL6s1yIaYOIgh
         JpfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762939277; x=1763544077;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5vExX5lYwjZciNY84xOIPIx1RLXQKLj0IP41hX0dBbo=;
        b=INt0aPg73LvU8bvjAORQWOoQMwbNaW6yTcLMkc2rGHx8aPISePKSx/K6mb0O/vsZWm
         GE0LyDu2CbgdTdV/m1mpslfcL+iYsWNAMsjYYr6VKNxViUNE1r24WChGddO2wlH6m/kp
         8Ch6HzfBYjhYyco/Qmn3GWPeviqUeZgOaCrpbbT88MjbjBZ9Xi6xAzMQCgmGr9OyJ9pT
         Mq3+Js9bCW8WPar3s7PwFGPbFhVp99QAfZZjYpH2rMZxhhV1lLHNwhXXlHgybuGYyihs
         mJd4RreAbUFuYGCwc9J0o3DX+W8BDbBmfiwC8QBDM1pKBaH5TdR4ttVLlNqe0EIqaw8X
         ySBw==
X-Gm-Message-State: AOJu0YzrYngIgT8kLqRGrs7VCpFEAe71AoXu6F0sqcJG6AefLlxCnu0Q
	3ljhajq7dnhSC+M5c/5FOLFqY2Kgx6NqJuFfMX5Slk3JHhLWqbHtyO/8DFDyYNnmT5k=
X-Gm-Gg: ASbGncvO5w6BdkhkROaMMXw8xqcrIZhn5MYaY1vIhNclu8QlQcuUTl8rhd+TYzH8RKY
	DHn4dXMwmLnxyKGStW+U5HqFAtawGdk/fJU/nZw/gQImQmVlxk9u14qK214kAtUrVEc2xETUeVT
	5jStmjBH5kEEndtO7yk+iqU9om1ueQlug7s2nS8pjamcdyUC7AJ70CQZaoXrRi6Uq7wHR+FEM7s
	mR01YuWoz3Vw7utmi0XSoZt93GjmAKR69CNQQC2Av55FYNCxoucHJZTxqI+bM40AxOxPlWhxzKW
	69KovbZCxp5gU3hIr798PzASq+l8uHjufa4aaAf73ApbhsjzZeGF/GBKvIsChCEPCmu5Z8fSJtH
	5fnJeAEiQSVRm8u5FTUWN84HNy/Odrik23CdrSmc9PjPOGc85Hv7hSgSBvkpl6GeKA4Hqx2NUUp
	DG2JxTiHlRHAuW3sIE
X-Google-Smtp-Source: AGHT+IHoGl5ziEi7Ua+rMKa465Ycd1bn5Q+l1lO6xafRsuDtW0ahp1R+CiWWX89YTNLNjpqEi0+GKA==
X-Received: by 2002:a05:6000:3107:b0:42b:3366:634b with SMTP id ffacd0b85a97d-42b4bdafecfmr1846042f8f.31.1762939276840;
        Wed, 12 Nov 2025 01:21:16 -0800 (PST)
Received: from [10.11.12.107] ([5.12.85.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42abe63dfecsm33332368f8f.12.2025.11.12.01.21.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 01:21:16 -0800 (PST)
Message-ID: <013215bb-3562-484f-868d-485d0da095d8@linaro.org>
Date: Wed, 12 Nov 2025 11:21:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] mtd: spi-nor: micron-st: add comment for
 mt35xu02gcba
To: Haibo Chen <haibo.chen@nxp.com>, Pratyush Yadav <pratyush@kernel.org>,
 Michael Walle <mwalle@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev
References: <20251112-nor-v3-0-20aaff727c7d@nxp.com>
 <20251112-nor-v3-5-20aaff727c7d@nxp.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20251112-nor-v3-5-20aaff727c7d@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_012119_678680_10CC7A8C 
X-CRM114-Status: GOOD (  20.91  )
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



On 11/12/25 8:48 AM, Haibo Chen wrote:
> mt35xu02gcba is similar with mt35xu01gbba, but with four
> dies inside. According to datasheet, it contain SFDP and
> support 8D-8D-8D mode. Add comments here, remider to change
> the code in future if has a chance to test on this chip.

you'll need to rephrase a bit the above> 
> Link: https://datasheet.octopart.com/MT35XU02GCBA1G12-0AAT-Micron-datasheet-138896808.pdf
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
> ---
>  drivers/mtd/spi-nor/micron-st.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
> index 6d081ec176c37249e5ddb724b61bd70f68088163..cc053b4d615ade3f12068618f8355779561dce55 100644
> --- a/drivers/mtd/spi-nor/micron-st.c
> +++ b/drivers/mtd/spi-nor/micron-st.c
> @@ -206,6 +206,12 @@ static const struct flash_info micron_nor_parts[] = {
>  		.fixup_flags = SPI_NOR_IO_MODE_EN_VOLATILE,
>  		.fixups = &mt35xu01gbba_fixups,
>  	}, {
> +		/*
> +		 * MT35XU02GCBA contain SFDP, so no need the size
> +		 * and no_sfdp_flags here, should similar with

this is expected for all the flashes that have SFDP, so no need to
specify this again here.

> +		 * MT35XU01GBBA, but with 4 dies. If someone can
> +		 * test on this chip, can change accordingly.
> +		 */

How about we rephrase this to:
The MT35XU02GCBA flash device does not support chip erase, according to
its datasheet. It only supports die erase, which means the current driver
implementation will likely need to be converted to use die erase.
Furthermore, similar to the MT35XU01GBBA, the SPI_NOR_IO_MODE_EN_VOLATILE
flag probably needs to be enabled.

With something along the above lines you can add:
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

>  		.id = SNOR_ID(0x2c, 0x5b, 0x1c),
>  		.name = "mt35xu02g",
>  		.sector_size = SZ_128K,
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
