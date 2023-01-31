Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A9C7C636CC
	for <linux-mtd@archiver.kernel.org>; Tue, 31 Jan 2023 09:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HOf00Mt+mecg5fl77hFEGmnw6shwLcxFjax2LoZWbRU=; b=RumgeYT674i9qz
	yNHO1ZUecj1SMqbteWIzcl0nKxaGSSMRUTHNXM9McpK22XCanwhDu56GAxOA7pFMNMTjHqn9ZdkZN
	qBDFDFK5+kDn+zMXlxhrd5P83KXN14EnCCbSVOZWcnDZKuAH6j8QLwzEFhwQ3FIxUwe5FlqgktPwb
	lqQzl+NXcBRiiVpBclX5DPhR3vev3PyBBKpscXN2dJPlO1NWdCmkXNirQrDMV/BuqSzqH4YovAFRW
	kpCodwpNLvxwgnHD1UXMS48RDByJf2JMICHyWC64cOMuPq2Iz8fyld15/jSQnmoAirLdrJMAEbj3r
	rACXk586Q6gasImjcHQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMmV1-006si5-UB; Tue, 31 Jan 2023 09:00:19 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMmUy-006sgc-Sn
	for linux-mtd@lists.infradead.org; Tue, 31 Jan 2023 09:00:18 +0000
Received: by mail-ej1-x633.google.com with SMTP id bk15so39503692ejb.9
        for <linux-mtd@lists.infradead.org>; Tue, 31 Jan 2023 01:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YVhZ75/1BJntMwjdrWXFKhLK+whyj6nKMsfuAvUzboE=;
        b=QVwvwXTnU7c2WB1/81AcFN4NiLnQrf9SjNaNbW6HbX5JZjkJMXg+ORQKFmXSMcGVqL
         K79XySAjUSt9XroiSimmqEtQ4K1S5M0NijaM+AIR0M+Z7qP4SqZFZkkcDgrprfx1E/GN
         PUOkxkf2emS9jHkXCbngFdh+6tK2g/81/H5J6hsKU3BHrBLXZGkAFmO/2NaaTv7ZOelb
         Vq25C1De8UWo/dxbuzHk/WE4G/scq3jynYA8t0JOURy+dt4PClv53luID3brCjPbwMh6
         VCHmToi7mQZ4Fr2fnH5K5gQvrN4sRP0Z329tE7h3HLfbEse1KReUrT3oLpENuJ8E8V1M
         xoKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YVhZ75/1BJntMwjdrWXFKhLK+whyj6nKMsfuAvUzboE=;
        b=iU8LPSyYaP96NakuQlKpptB28atR4SnTF++Lj2TXFCHKy61u4CaNnw/ldotXln/0Ot
         GA5frQG6UJP32m9g4BHjNzSYJHrcXZvnsjP3Z0LSs1SkBxcdy23CNyNihz+1hbwoN3xZ
         YjkjPWFti6RPCvIqNeMCL0Fo0ek9Z3sb2NSE0Ex2CMOJsjwA15msjriJXtdntb0GXVcW
         vsrn8owJ6jID6kH5ARcX5oWLEcSPXvkiWNzeLfNw1wkweWkKL59QXDqc2AX1hAJ5mZyj
         5xoAtfra6sT9tgHc2BLzUA2a07bmMK0xo/rcoDGuoUufPd4rRS7qvYLInsZ/C3JAKyZB
         ++ig==
X-Gm-Message-State: AO0yUKXSi4pkm/BNiqIQ+apB1SAev1qcFSh+yr6yd87p01OnpRAKsLiT
	qpLEzgnCLtnXIGQzktR3ZktWSw==
X-Google-Smtp-Source: AK7set/BgNNTwTxtqlRMF5Dt4dYOU5e8i5JGgeI+wqXcMG90Q7nmUS1+2KDhWKptOR6NUy7N7ALRnQ==
X-Received: by 2002:a17:906:a2d0:b0:883:c829:fc5e with SMTP id by16-20020a170906a2d000b00883c829fc5emr11787487ejb.68.1675155613196;
        Tue, 31 Jan 2023 01:00:13 -0800 (PST)
Received: from [192.168.2.104] ([79.115.63.122])
        by smtp.gmail.com with ESMTPSA id 11-20020a170906318b00b0088a161c232esm1475453ejy.172.2023.01.31.01.00.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Jan 2023 01:00:12 -0800 (PST)
Message-ID: <9224dca4-561d-d492-0b09-3629c95acea7@linaro.org>
Date: Tue, 31 Jan 2023 11:00:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/2] mtd: spi-nor: spansion: Consider reserved bits in
 CFR5 register
Content-Language: en-US
To: Takahiro.Kuwano@infineon.com, tkuw584924@gmail.com
Cc: linux-mtd@lists.infradead.org, pratyush@kernel.org, michael@walle.cc,
 miquel.raynal@bootlin.com, richard@nod.at, Bacem.Daassi@infineon.com,
 stable@vger.kernel.org
References: <493d9a10-aaf3-70f6-36c3-9a2cf39f0759@linaro.org>
 <20230110164703.83413-1-tudor.ambarus@linaro.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230110164703.83413-1-tudor.ambarus@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_010016_963880_AC9D5690 
X-CRM114-Status: GOOD (  10.79  )
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



On 10.01.2023 18:47, Tudor Ambarus wrote:
> CFR5[6] is reserved bit and must be always 1. Set it to comply with flash
> requirements. While fixing SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_{EN, DS}
> definition, stop using magic numbers and describe the missing bit fields
> in CFR5 register. This is useful for both readability and future possible
> addition of Octal STR mode support.
> 
> Fixes: c3266af101f2 ("mtd: spi-nor: spansion: add support for Cypress Semper flash")
> Cc:stable@vger.kernel.org
> Reported-by: Takahiro Kuwano<Takahiro.Kuwano@infineon.com>
> Signed-off-by: Tudor Ambarus<tudor.ambarus@linaro.org>
> ---
>   drivers/mtd/spi-nor/spansion.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)


both applied, thanks!

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
