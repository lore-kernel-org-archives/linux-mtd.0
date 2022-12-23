Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3EBBC4332F
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Dec 2022 07:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nK3Ckcky5Ey3FIgF08+EnzYb0cD4N66Mv9xhCylmCAQ=; b=S6MyPWiSGzkokL
	b/OU7yP2N+bY7QvGkW2afrJxhz0l+A3ldllYGupRvIT/ajzVcOixVdkqtMnQux7Ajh4BLcdNr8FOY
	xcnOUg7jW6CJNYU3oXfqlfsteWLojCGUBQ1KvZXk/Yl2uLx5qJ/4s8Ek3h8MwNYB6u7aj513i5JyF
	XQ34Ywyec5EoI8IQMH1YhiRWu6NLFWM4vfMBqz/trVU5HPq+fxZzveUPjF0GFiyuO+xFpwHrjer0U
	HeOa5X3QeKOe8lp4/eO201UEFuNGKhQK+Ouw/QXXeBbukP2Z7zYovIIOYJZJxg4NLTXlGnUZXCppD
	qF5iMjvjI+TWYqCqTwFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8cXK-004nnM-77; Fri, 23 Dec 2022 07:32:10 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8cXH-004nho-2X
	for linux-mtd@lists.infradead.org; Fri, 23 Dec 2022 07:32:08 +0000
Received: by mail-ed1-x533.google.com with SMTP id u18so4607936eda.9
        for <linux-mtd@lists.infradead.org>; Thu, 22 Dec 2022 23:32:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h3qOBXyJTUTiAZb5s9hGUCLjFaAjopb+baPEh/10qpk=;
        b=k4LKmEbGHiCkp8Fo8tFXTaBKbU6kI2Llw1khKKhUHn/4P6pxTE9k7zfYS+GNaDTtLO
         dCN+u3Bd+Y7ZZXirWNlFSqxr3IgjeqXNvQkv6zyEwPr6kvKV3shhtfINr/CRq3RVjkuf
         rKfzenq9y9ds4pXcReuBzftlx80qGm3/FlFqi6FTNoftCQWMaE9u+EvkXw7yEPiz+d8r
         T+E2Wbx2bOtKnQLgVjtOi6i0ARLBQU4YwPKjHk81/z94xP2iMBwF+kywMCTt7t6FGVBf
         WLNYcBVnfhW4ThJrE4p5pgAVTbkmoDJqNrcfHsLhuHT7PelE3t6+HNifSTb+FOiLMWMV
         ZPMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h3qOBXyJTUTiAZb5s9hGUCLjFaAjopb+baPEh/10qpk=;
        b=kVwm6V6mzRzuei9TvYG5fsZcig16j37uuxCSofkHGaOyg4ylV+wML6bZ2MKeWoZp7l
         WTVL7U6P3zSJw+CGbhKW8LjjZTqSF6J5FcwMH5cIVfmIXGn4leyLKBMCOllnc+WPgNRt
         ooPQVoDbgBCm1UZRb63TIWyMcJSs4Dls/8rVAAsSDU5yHn6vtfKIA1ZXkmjvp5zxMew6
         oXqnwsBht2fSmxR1VM0+0lDLsZrF8utIdEmrOmP3tOjiJadrgRMUe5tTvmdKaohH9vML
         gqAEg3Wi8SIfl0aZ1ZAukdXnqbHM/iYXahHpodx6oQQWihiuAr47JW0LtyaFyU0sZNOm
         /AZQ==
X-Gm-Message-State: AFqh2kqarZ/4Aw0yvCTCXUZYVUQrtAylkPnsqRP+wwiI66roCY6TsKnQ
	zENablmm5b/a/CEtbOpnwGTAYg==
X-Google-Smtp-Source: AMrXdXtVtHgJn0v5PKuNZoi6czSciWd70fXMJ1yolaTcEKm90IW2h6cNWaZiQvGnrt36JM7KT3L/Jw==
X-Received: by 2002:a05:6402:12d4:b0:45d:66e5:9818 with SMTP id k20-20020a05640212d400b0045d66e59818mr7412058edx.1.1671780719823;
        Thu, 22 Dec 2022 23:31:59 -0800 (PST)
Received: from [192.168.0.173] ([82.77.81.131])
        by smtp.gmail.com with ESMTPSA id h26-20020aa7cdda000000b0045726e8a22bsm1186124edw.46.2022.12.22.23.31.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Dec 2022 23:31:59 -0800 (PST)
Message-ID: <1d1ca36d-069f-9382-be30-45eafe32d7a2@linaro.org>
Date: Fri, 23 Dec 2022 09:31:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 0/3] mtd: spi-nor: sfdp: Introduce SFDP_DWORD() macro
Content-Language: en-US
To: tkuw584924@gmail.com, linux-mtd@lists.infradead.org
Cc: pratyush@kernel.org, michael@walle.cc, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <cover.1671684805.git.Takahiro.Kuwano@infineon.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <cover.1671684805.git.Takahiro.Kuwano@infineon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_233207_234214_FE905997 
X-CRM114-Status: GOOD (  11.41  )
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

Thanks for working on this, Takahiro!

On 23.12.2022 09:21, tkuw584924@gmail.com wrote:
> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> 
> Existing BFPT_DWORD() converts 1-based indexing to 0-based indexing for
> C arrays, and is used in BFPT parse. This is applicable to other parameter
> tables than BFPT.
> 
> Based on a suggestion in:
> https://patchwork.ozlabs.org/project/linux-mtd/patch/20220912051317.2369-1-Takahiro.Kuwano@infineon.com/

Feel free to add the Suggestion-by tag, it will split responsibility and
also give some credit.

> 
> Confirmed all parameter tables described in JESD216F.02 use the same
> (1-based) indexing.
> 
> Tested with S25HS01GT and S28HS01GT.
> 

Cool!

> Takahiro Kuwano (3):
>    mtd: spi-nor: sfdp: Fix index value for SCCR dwords
>    mtd: spi-nor: sfdp: Rename BFPT_DWORD() macro to SFDP_DWORD()
>    mtd: spi-nor: sfdp: Use SFDP_DWORD() macro for optional parameter
>      tables
> 
>   drivers/mtd/spi-nor/issi.c     |  2 +-
>   drivers/mtd/spi-nor/macronix.c |  2 +-
>   drivers/mtd/spi-nor/sfdp.c     | 72 ++++++++++++++++++----------------
>   drivers/mtd/spi-nor/sfdp.h     |  9 ++---
>   4 files changed, 44 insertions(+), 41 deletions(-)
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
