Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25234C001DE
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Jul 2023 09:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jm+H7Ozf3WJArPXOw8A4gSA0vXmMQwrGdaP1/8OA/OA=; b=npMSZNlNSm+XS9
	aJ0sGEAjpmUENcU/6h8mWblTFexMrL1C9gtTObuFOu65j4UbDAW0RyAIEVU5+dgzobvuOXS8ODrTw
	SKyuBqrhU3VRLgT1PyHLTG3+kOdOtqaQiJUc7unPNQoACTGQlFovYS6xZ13tzpvgFxoGBiX7wMTFR
	9G8KUl/NmEE1+tybp1EY0+cq4wVyge4iH9HpSdpGsAhm29V5rb/PwTwck/MJRJ1g7E7Lgx6IX76/S
	udTmg5xVH5aiVMSrv41ntFfVQYR07Tko+5QSHjfVhazfTuextWOmznCHR3pWtOG/SesEISRHaQ+la
	fcuDUvDWbyAAIqXWl9ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOaxV-009l78-0R;
	Wed, 26 Jul 2023 09:37:29 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOaxS-009l6U-0Z
	for linux-mtd@lists.infradead.org;
	Wed, 26 Jul 2023 09:37:27 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-668709767b1so4183418b3a.2
        for <linux-mtd@lists.infradead.org>; Wed, 26 Jul 2023 02:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690364245; x=1690969045;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pbMdrz248O7BLJa1aLDDOR2eghYsSzQm2AIXBS8r1OQ=;
        b=q0euknq/4bvrmZKnU0EX15hLdlUIMLI+/co6+9dYcn9y5ctA68nCG144eqw0Dk8teF
         KVjBdQDqhbVE9/cQ2rmB2cL42FBUqEVGtuTR32fW1PlEuy1BG+Scqb+JpAXMCTCjog2H
         3aD+GvuMabNFHF+TEafQF+R12auLdYlQCAG83/HPlfHJUIHji94mbNnDvIkn5Pq1SsQY
         OdCbl0W+R2Q7bhs8ZK/j0ijApy96BoCXsU/TM2/6xwJS3u9xvcVMSjlJ9q0UsQ3UcFqp
         wx9H+qc1knnKFA2owk5+tsuQpn3c043HcKSr8wdecfwrxXLUugMk3TBRdapZRKU7+cRB
         ZaFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690364245; x=1690969045;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pbMdrz248O7BLJa1aLDDOR2eghYsSzQm2AIXBS8r1OQ=;
        b=T8P7bl0TOPA7PJXv+q89Rxe/ztJNTK6IRV7Jft2kCtlNcL8FfLGuKJTQdHyFM5+sBu
         P210LX7Fpkf7SV2Bf04dY85Rn8HemGbQeZSf+iyHvIJJdaxUOLY808RZui6qjhjgEu21
         HWAOUkpo3X3JwlpcB7h8emiRiiM+FGWfcESRVsRWWDzW3/RRuJdSyRIqCeqA56xXY8QG
         T/899LoJLDtVdiIMH9NiTYsAUdYiDbHeFld2AAUymiDAfbHkOsiOtwPOCtWnkCZFvrCJ
         +9sF2op0zlvpLlxFgoFh5rAlZM9Be+tkMzQrS1LDA3O8K4xGAVwv8p8yo27qwaEitkj+
         eHzg==
X-Gm-Message-State: ABy/qLbxYAk2KQuw69f/3uAqQJUWjiazaKXFQCYQxGos3dBJQ1ecBGH3
	tFvPfudnCebhKDx/o14Ny/A=
X-Google-Smtp-Source: APBJJlHdtwcTal98+4CgceUf/WoACIQ/0R2Z2XI7/kx1iXSXyDj50UGS1XhalZqhTBFwhBJzG5UGJg==
X-Received: by 2002:a05:6a21:3383:b0:138:1c5b:2653 with SMTP id yy3-20020a056a21338300b001381c5b2653mr1359756pzb.41.1690364245264;
        Wed, 26 Jul 2023 02:37:25 -0700 (PDT)
Received: from [192.168.0.11] (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id g18-20020aa78752000000b00686c40ccaf2sm992250pfo.9.2023.07.26.02.37.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jul 2023 02:37:24 -0700 (PDT)
Message-ID: <3464becc-b2d1-02f1-4214-2bc69edddca4@gmail.com>
Date: Wed, 26 Jul 2023 18:37:22 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 09/11] mtd: spi-nor: spansion: let SFDP determine the
 flash and sector size
Content-Language: en-US
To: Tudor Ambarus <tudor.ambarus@linaro.org>, takahiro.kuwano@infineon.com,
 michael@walle.cc
Cc: pratyush@kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, bacem.daassi@infineon.com,
 miquel.raynal@bootlin.com, richard@nod.at
References: <20230726075257.12985-1-tudor.ambarus@linaro.org>
 <20230726075257.12985-10-tudor.ambarus@linaro.org>
From: Takahiro Kuwano <tkuw584924@gmail.com>
In-Reply-To: <20230726075257.12985-10-tudor.ambarus@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_023726_213438_B6D81661 
X-CRM114-Status: GOOD (  14.87  )
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

On 7/26/2023 4:52 PM, Tudor Ambarus wrote:
> sector_size is used to determine the flash size and the erase size in
> case of uniform erase. n_sectors is used to determine the flash_size.
> But the flash size and the erase sizes are determined when parsing SFDP,
> let SFDP determine them.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  drivers/mtd/spi-nor/spansion.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
> index 1c5671a3751a..30a3ffbfa381 100644
> --- a/drivers/mtd/spi-nor/spansion.c
> +++ b/drivers/mtd/spi-nor/spansion.c
> @@ -873,11 +873,11 @@ static const struct flash_info spansion_nor_parts[] = {
>  		PARSE_SFDP
>  		MFR_FLAGS(USE_CLPEF)
>  		.fixups = &s25fs256t_fixups },
> -	{ "s25hl512t",  INFO6(0x342a1a, 0x0f0390, 256 * 1024, 256)
> +	{ "s25hl512t",  INFO6(0x342a1a, 0x0f0390, 0, 0)
>  		PARSE_SFDP
>  		MFR_FLAGS(USE_CLPEF)
>  		.fixups = &s25hx_t_fixups },
> -	{ "s25hl01gt",  INFO6(0x342a1b, 0x0f0390, 256 * 1024, 512)
> +	{ "s25hl01gt",  INFO6(0x342a1b, 0x0f0390, 0, 0)
>  		PARSE_SFDP
>  		MFR_FLAGS(USE_CLPEF)
>  		.fixups = &s25hx_t_fixups },
> @@ -886,11 +886,11 @@ static const struct flash_info spansion_nor_parts[] = {
>  		MFR_FLAGS(USE_CLPEF)
>  		FLAGS(NO_CHIP_ERASE)
>  		.fixups = &s25hx_t_fixups },
> -	{ "s25hs512t",  INFO6(0x342b1a, 0x0f0390, 256 * 1024, 256)
> +	{ "s25hs512t",  INFO6(0x342b1a, 0x0f0390, 0, 0)
>  		PARSE_SFDP
>  		MFR_FLAGS(USE_CLPEF)
>  		.fixups = &s25hx_t_fixups },
> -	{ "s25hs01gt",  INFO6(0x342b1b, 0x0f0390, 256 * 1024, 512)
> +	{ "s25hs01gt",  INFO6(0x342b1b, 0x0f0390, 0, 0)
>  		PARSE_SFDP
>  		MFR_FLAGS(USE_CLPEF)
>  		.fixups = &s25hx_t_fixups },
> @@ -901,22 +901,22 @@ static const struct flash_info spansion_nor_parts[] = {
>  		.fixups = &s25hx_t_fixups },
>  	{ "cy15x104q",  INFO6(0x042cc2, 0x7f7f7f, 512 * 1024, 1)
>  		FLAGS(SPI_NOR_NO_ERASE) },
> -	{ "s28hl512t",   INFO(0x345a1a,      0, 256 * 1024, 256)
> +	{ "s28hl512t",   INFO(0x345a1a,      0, 0, 0)
>  		PARSE_SFDP
>  		MFR_FLAGS(USE_CLPEF)
>  		.fixups = &s28hx_t_fixups,
>  	},
> -	{ "s28hl01gt",   INFO(0x345a1b,      0, 256 * 1024, 512)
> +	{ "s28hl01gt",   INFO(0x345a1b,      0, 0, 0)
>  		PARSE_SFDP
>  		MFR_FLAGS(USE_CLPEF)
>  		.fixups = &s28hx_t_fixups,
>  	},
> -	{ "s28hs512t",   INFO(0x345b1a,      0, 256 * 1024, 256)
> +	{ "s28hs512t",   INFO(0x345b1a,      0, 0, 0)
>  		PARSE_SFDP
>  		MFR_FLAGS(USE_CLPEF)
>  		.fixups = &s28hx_t_fixups,
>  	},
> -	{ "s28hs01gt",   INFO(0x345b1b,      0, 256 * 1024, 512)
> +	{ "s28hs01gt",   INFO(0x345b1b,      0, 0, 0)
>  		PARSE_SFDP
>  		MFR_FLAGS(USE_CLPEF)
>  		.fixups = &s28hx_t_fixups,

Tested-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
