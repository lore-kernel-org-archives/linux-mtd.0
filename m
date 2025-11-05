Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D288ACCFA0D
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Nov 2025 15:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WgGhSX6+w04qlOFAXPIpKcA8L+P5dDVNizB9DlK7k7Q=; b=tvJphl/MYkhDJD
	j2pBxLPLJSrq5Tn7mrhgtOjxODEPQrV9Y3ACqs8xU7myTyy4fIacUorr8CB81w4AfCoBg0uQi/rQc
	vEoNDTvq5jodaCXOOy4diIZddJUbQ8VIviHuig/vDfH93NDSKM/6oU4PFqX55zIreqjxUK55fe1Oo
	5cqbO57/kRHvl519E4ues/MNCmgAdOZCV4J5LT/77vl/hNrm0HjMgNGi3W9EjMzAtbJsJLy1+HKvD
	u274OmN/EAAZ8pqDDBiu1yTpVfvnoSB9ivL24xGyOPv5VxIpzLzIlmiMxlJI6TU4LRIDyAWNL1rMJ
	t1dYL7YWu2o1Agz7zafQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGfpY-0000000DznY-2TC4;
	Wed, 05 Nov 2025 15:53:52 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGfpU-0000000Dzmq-4505
	for linux-mtd@lists.infradead.org;
	Wed, 05 Nov 2025 15:53:50 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-b6d4e44c54aso915748666b.2
        for <linux-mtd@lists.infradead.org>; Wed, 05 Nov 2025 07:53:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762358027; x=1762962827; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gczMRuZ2fsGRpoCXUBhl7NeVLE82+ehtyW2OQrB7AVI=;
        b=NpUF+QDoA4u5eADp+OI7Qnn8/GBfbEM0sBgKMPH1TirTiqXJQ90DWzJIVT9mTc7GhP
         DXwLkZ02hqiJ8gxXHoWW45VDXKAjJ2b9hDzDBUsu9RMrugoqa99wlg0rCFX3iQ3c9Hp+
         gZrkEG68HMaaPktvM3845Fsi/Z7VeshQE1RMfACyX7UT+dS8WhJ/IOcdbwE8w1cqYSuE
         QAJ81l/jMb364wyMokXVP/BKCDYMEPJ1uogeo/pGMfTcBvI/SF/wSEV/PmEdpx7uT9zj
         vCtoVEomvzOvVT3BNkZxxF5PQkqJOAs6gG1OKJYMzQ0TD9/LRtkzCWa3lQg+QZFel7zQ
         AKtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762358027; x=1762962827;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gczMRuZ2fsGRpoCXUBhl7NeVLE82+ehtyW2OQrB7AVI=;
        b=i98b7LeAg7cOheGXFzhLEX/6vy6l+Yu4l490Zvm/5tP9ZLC9hMc62y145eR7/B4UbU
         UHvddXgQa0XAy9r9Lyz+2w5LyG8QbsJSKnkTePKJO6pmkU3s46pkHiTZAlLaTzLWZZ/p
         dBy5S6qn6htPvycVDaAttppyIMTdQ5D4HTZTHKD3jqvs//9Br2UurZ63LH0fX9urP2z8
         RjoUggBwhELjkNApm32EL5MUSPQ6JmoJDIRgB2usjOuBPw4YeWiOj8cZgUltmp9WP4kI
         uc8Iw8PDbw8yLdx5xvBIz9062tWqjd8x5MT7AiGF8P+JKZyC6gC/vwrmgmOClmUE16D3
         HKgg==
X-Forwarded-Encrypted: i=1; AJvYcCWrFCv6sh1qWmyB7aTAcRuBK/3D/lVDTgcHujeBrO2qWfCxhXgUx71SfDvFwd1y70FSO0BuBWk38Wc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz08sGFheXexaXKDKmBBuXrJtoiftWjaTKLDoIGevTxQ/Od8efR
	61OvbYVu70hlD0kOjCfGcqTpouY+FcOqYWu6V72pu9J/aTRdfL6dU1FjuSG6EfUho0M=
X-Gm-Gg: ASbGncvFv78rW8MSt7sMt+KuGhJJuFn2pTX36GFP77yBN4x7q4crS4PUYxi6WTrqEtN
	QfusOQkE2pPHD2sK25zEUcf6obxj9YX11hVi8l1N1lnvAbtltk5IHbqJC19bZ/5nrMLEr32jHxa
	cQrd7M7UfCyGZlAdUlNqU5s4fHQZbUBhunz+qhszy2c9kkJbvCjB41WFGTIpaPMmLUG6qqdKf68
	uz5N65bLtM22TiX3ms38TX2vcqQGJ48qMUTM5tpUns7l2YRKBOw3RqG4p0rErTe3IR/RNqoypeh
	nDIOPUPFnL5uicSEXBp5Jq0ZSLcqC0lyccvtDFWK1qgwtN9iO2G85irnR2q4WdDnuMEh2ZhPuG3
	MPGTUSAi0O0kucIke+v59MY7pirWBRA62mc4fL0pripXY4pDUxv5u93lkHzC6S96Bgk8Bj4vEBd
	eLbvZO6Fbe/lAZOZWREjTWWw0=
X-Google-Smtp-Source: AGHT+IEhBbB+aDttEEGQs9oOQQ+tXYqrRQe+D+B+YbWiBNmMQeVjILVA1dM7D5N6K2h4GWUGw/2OpA==
X-Received: by 2002:a17:907:1c2a:b0:b70:b98a:278b with SMTP id a640c23a62f3a-b72654f6507mr345447466b.38.1762358026889;
        Wed, 05 Nov 2025 07:53:46 -0800 (PST)
Received: from [172.20.148.132] ([87.213.113.147])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b723d91990asm513705366b.28.2025.11.05.07.53.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Nov 2025 07:53:46 -0800 (PST)
Message-ID: <b940a35f-2e7b-46d6-8af5-42c60263c528@linaro.org>
Date: Wed, 5 Nov 2025 16:53:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/28] spi: spi-mem: Limit octal DTR constraints to octal
 DTR situations
To: Miquel Raynal <miquel.raynal@bootlin.com>, Mark Brown
 <broonie@kernel.org>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steam Lin <STLin2@winbond.com>, Santhosh Kumar K <s-k6@ti.com>,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
References: <20251031-winbond-v6-17-rc1-oddr-v1-0-be42de23ebf1@bootlin.com>
 <20251031-winbond-v6-17-rc1-oddr-v1-3-be42de23ebf1@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20251031-winbond-v6-17-rc1-oddr-v1-3-be42de23ebf1@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_075349_151505_91C61A51 
X-CRM114-Status: UNSURE (   4.33  )
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

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
