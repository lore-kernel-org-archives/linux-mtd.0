Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 851CDC48BF6
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Feb 2024 10:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TipUpJhnXlp3sYH/TT2JZe8HQTgEWMLkuTEevWLOo2c=; b=QHD6Sc61X05PDs
	G38uhyincQsE1P9OBwXnErpt0R2oQVBWAAkRdrhBY5RW4Xi7UlmoHmTWMaWfCqJVCoNgwg7Psrrcw
	/0rx1cp84TtVjQEXd47jHt+hh2cLdvwBGT3PwgXCfBK7QwHMyRrmsrkqY9mHKSIATujlMB06yvndD
	UBlezxb2hnBkKWm8ixwgp/v9E8mN+NDzl5fJH3kwDLGnThCVpP2JC0JSeXV0HUNWB384D++EbqKpG
	Oq+15NtwaqBErf+qiijw/jJIpWZNPH4Xcri9yw4ZGy8Tpl6hNIExZ57U5wzrvkeZQ0eZyRngQCYSg
	DIBFKqxcZymyQDFzN3MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reYTv-000000009UD-3L29;
	Mon, 26 Feb 2024 10:45:11 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reYSo-000000008rs-42uA
	for linux-mtd@lists.infradead.org;
	Mon, 26 Feb 2024 10:44:14 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-564647bcdbfso2797257a12.2
        for <linux-mtd@lists.infradead.org>; Mon, 26 Feb 2024 02:44:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708944241; x=1709549041; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/1u96TCZGh+uaR4bi6Ag7KK+CWFlrG+NLarSYTmkM2k=;
        b=WrV8BcPqhZmLUEK/lKVu/HbHdwuMVi5XM9z/D7A3t1l8vUhYUYJPTZl6tI3BvOFMvU
         NSYj3SKk328PHZj54Lw7pJ3LY7umCZdzXNyc+7G2gw/6WS8M4P1hCAvyUT3XtKCTp15D
         TqTrPzyCd+Zorg7NnORihYXJKucH+BeqFT50+zu5g3YUOECEQZOQiXW9vKF/cC75uRaN
         MpJHTQPBeyTAJtI300qZJCGi2ZMmw6Io6ki/tabQymoFGrUGDHpj03BerCZukfc+8yGF
         YojNdWtiKwQ/uwTYXuh+4xycsQBjDeTV7gBUD4DmvsJ48p07kov1UJzve+jMzgjTwkFf
         BPuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708944241; x=1709549041;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/1u96TCZGh+uaR4bi6Ag7KK+CWFlrG+NLarSYTmkM2k=;
        b=v0xgYUUoTiK11XcKh5GodTmSm2uj2zPd4xlNa2fV/EazSZG03rdECinpvp5XL1ZttS
         EMganVFmzfMYDMNq9x06iPQiYEdaFPKr3ZUhpigkRMFbAyX3Z6SYiXx23nNi5nWEorqb
         V0eVojMEWCoUl5085nrE7FAVF8640CDJj8eodcg2QKpaxFw06tr6CvrkgY4AXuZaXlly
         lSiaFB1BVIqX2YyDfzmYgV5atc6Y3RBScflrDpI/HHaFRYeUGM1pFUF69dor4mX4m7nD
         EoWcsPs+wPCtUrq9cMPNpLx5hvaLbCa8glMYynYoBQvfA8o/JadctT5VXJuiKt+suCHy
         2LUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIrEDCa1uEJoHd6w7n4XhYk/+5Xl0PJ6RN3OXokb2p1ISikqBrEFU1pf8HkzxHyl0Asv8yAbXzeAeYstdZSGlK7dTXCahzJu4Us446lw==
X-Gm-Message-State: AOJu0Yx89xddHjj/PGZTI6JdzyFpTdSgRCteZe+zwmqp4/bzWd6g3d5y
	b+9aOFOQOAsQyeeWpC7gz9S95X8Y7AeVXPPAHkqutIh9n9/m0WjctqZ6visnejY=
X-Google-Smtp-Source: AGHT+IFXQa+vLT3VSAjwilZdTzIVK0TdFefSAdZBFz9SZ+bVKQh5rMYDuB0XwPGEMcDzdkmxULENgA==
X-Received: by 2002:a05:6402:35ca:b0:565:ba2f:85d7 with SMTP id z10-20020a05640235ca00b00565ba2f85d7mr3967435edc.37.1708944240891;
        Mon, 26 Feb 2024 02:44:00 -0800 (PST)
Received: from [192.168.0.173] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id z18-20020aa7c652000000b005657eefa8e9sm2192416edr.4.2024.02.26.02.43.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Feb 2024 02:44:00 -0800 (PST)
Message-ID: <33c0c516-1f5f-4cf5-bd3b-70b61372a53c@linaro.org>
Date: Mon, 26 Feb 2024 12:43:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mtd: spi-nor: Add Puya Semiconductor chips driver
Content-Language: en-US
To: Dmitry Dunaev <dunaev@tecon.ru>
Cc: dunaich@mail.ru, Pratyush Yadav <pratyush@kernel.org>,
 Michael Walle <mwalle@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
References: <9ebf9cdf-eeba-417a-8410-3f87a0973136@linaro.org>
 <20240226104101.1848855-1-dunaev@tecon.ru>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20240226104101.1848855-1-dunaev@tecon.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_024403_411812_520B3208 
X-CRM114-Status: UNSURE (   9.28  )
X-CRM114-Notice: Please train this message.
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



On 26.02.2024 12:40, Dmitry Dunaev wrote:
> Add a SPI NOR manufacturer driver for Puya Semiconductor chips
> 
> Signed-off-by: Dmitry Dunaev <dunaev@tecon.ru>
> ---
>  drivers/mtd/spi-nor/Makefile |  1 +
>  drivers/mtd/spi-nor/core.c   |  1 +
>  drivers/mtd/spi-nor/core.h   |  1 +
>  drivers/mtd/spi-nor/puya.c   | 64 ++++++++++++++++++++++++++++++++++++
>  4 files changed, 67 insertions(+)
>  create mode 100644 drivers/mtd/spi-nor/puya.c

what changed in v2? why do you need these entries? Can you rely instead
on SFDP to initialize these flashes?

Please read: https://docs.kernel.org/driver-api/mtd/spi-nor.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
