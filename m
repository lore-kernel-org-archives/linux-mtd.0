Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AB69C28B20
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Apr 2025 15:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W9DDp6xZvLTu+JEay4DNvX3gdPUgNbdezUUdR4f0DZM=; b=wtcbVLlHnhLARJ
	u+ZagJZaeZE+1V06XLLBc8gMD7r0dGx+HMtI3JdGZkWiSqTeVJlslhCYc0KkD3sgP33Zpjv+SjKFo
	WQh8CqezDC9vgFxpgYrDU2je+m2ZAOg9TynGIxVrb012S5r87WOG9pWRisATdbYDTcSH8rETgabyg
	zoaUYfE5CTQqMNZLF2pkqjPSiyUDFh5vKUHO0LaA8cZnvYT0a/iLeLexQmOMcusa9DIsuZ2kBKfLw
	3bNZKXJOkzpLb0mGT8AQse36BM77fNUrBilh3Jvgo+MWopsndqN19ZSMMoUMCGDLh/z4YEkI0cXZp
	Q2dPPNIiB3loZOElcppw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzzgP-00000006SlG-0XLR;
	Wed, 02 Apr 2025 15:07:13 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzzg3-00000006Siu-040N
	for linux-mtd@lists.infradead.org;
	Wed, 02 Apr 2025 15:06:52 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43cf848528aso58693705e9.2
        for <linux-mtd@lists.infradead.org>; Wed, 02 Apr 2025 08:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743606409; x=1744211209; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AmsS7TeoR5lfEkPA/4hWMzBs7ZLo8pjbDxlnDnyGR5I=;
        b=e3/UgKyUYSaAEJx/lkPHyOOo6NS64fSu54EFBAaAonS3o3Ffdd2paI9HgYqNKERXmc
         DTIYHqop5y9cUKjhfZ8Mdm1oZxJzB2b4yuwo2PazcpSkA6LMLsGPZMnruPIT8aC1diQE
         BJlyuTirIxit3dTDgl2cvDVfMafaj1gtYGN4sQa13GY0NQv2mPOkFAo17QwMgp5oLFuG
         kA4DRPYW8K2EeaxMwQwrz/MU5uSQQ9c6RUjLf1+0TDBJtFfersqtIb74hsgIXaKljOag
         ahgV5oyrhjzd8Ozta+18a25fCT+DzumufwOqWzkMidAwVz1PotyVOH8pr251SV9ZXp2Z
         0TcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743606409; x=1744211209;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AmsS7TeoR5lfEkPA/4hWMzBs7ZLo8pjbDxlnDnyGR5I=;
        b=WEjg8UAEICeQZZVljtNBtqTu1fFUGT8saQygg1T8Ai1MDJ/bzqrDlSSTV22ndtFL7M
         NmOGE3BLJtOmaQSwDR2PDbg1HTR+K2qTFfFjqxkr6J0TdhFmHF4EHjIO8/2JBLiJMM9d
         OCq9rGUFHE4ojfC3keMtWIrhQandNY17/4Hpvd8MYEVeU7TibUCAfbIRFbUrRQTGuLL/
         iP6XczrDy1oIqBOUxjJjuVN3EZH3V9hkJzpwVelwMNNCk0feMYf9NnbWHy4qLx65XQGF
         3KOF8KUB3f5NeU8bZgwibxpR0+lFsDioN5ER9OF4Y9jO1ioOJ4DIergnMSizT+FOZERa
         l9EQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdGT4P8R4ZK7A23GJ9nwP2PgzB3HcqtNqkVWc9QukTXyx9NNXptRJKCIcJZc685i4t1OLF++Ub+mY=@lists.infradead.org
X-Gm-Message-State: AOJu0YwHZkTqmnbZzUUFYGmxjiwwen64Uioe5PK1KgW3Npis/xbbV2eR
	1z7qMW37a6eZbdH1bX64/uHC6Iwf/x0OWnLsUgco3XUTq3J9NyVGxNUwZn9dLUI=
X-Gm-Gg: ASbGnctDcW7FjVi7nwfvvlQQbcgHDkOpQ22qz154/oicxqfw1jkvV0LBpsaUdbInG4k
	KbbzFg388mJJjMROhlnySnAhsGBFnvnMsqRjbHihliMxVGjc80bR9y8YiEQE8+D7fdlhs7cq9Rk
	ESkhflu/VQXAdUpwJXTbMAHrPE+s5YyUC+68LHzCRs2vCu9QKp6rJ/AmF0wGoBixMYGgFkDMDUh
	zg1BXSjBdxvV64lYfnOVmRVfzDmeQM6AGYP/Pcf9N68yfRw0LH3Z5dYSzAZnBjnVUnmw8LjSbmH
	jX3+/JuaFYBRZKdQMEIySLAE3QWkfia6xQ4UH/bMt6wFSecKCG8WuQ==
X-Google-Smtp-Source: AGHT+IFiv6bk2hDtzexELIdofrPV3E/N0kdvSY+Jb0u4cWKjduAR8jqS9CG6dCBVHXuF4VqMk7757w==
X-Received: by 2002:a05:600c:4713:b0:43d:fa59:af97 with SMTP id 5b1f17b1804b1-43eb5cd313dmr22533595e9.32.1743606409159;
        Wed, 02 Apr 2025 08:06:49 -0700 (PDT)
Received: from [192.168.0.14] ([79.115.63.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb5fc57e9sm23884425e9.3.2025.04.02.08.06.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 08:06:48 -0700 (PDT)
Message-ID: <cdc38266-18a9-4eff-bdad-c88b316310b3@linaro.org>
Date: Wed, 2 Apr 2025 16:06:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/21] mtd: spinand: Use more specific naming for the
 (dual output) read from cache ops
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Santhosh Kumar K <s-k6@ti.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steam Lin <stlin2@winbond.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250307-winbond-6-14-rc1-octal-v1-0-45c1e074ad74@bootlin.com>
 <20250307-winbond-6-14-rc1-octal-v1-8-45c1e074ad74@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250307-winbond-6-14-rc1-octal-v1-8-45c1e074ad74@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_080651_045548_19FEA012 
X-CRM114-Status: UNSURE (   5.13  )
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

Acked-by: Tudor Ambarus <tudor.ambarus@linaro.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
