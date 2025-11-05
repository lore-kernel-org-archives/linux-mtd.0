Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 190A9CCFA0D
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Nov 2025 16:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h+hnkZl3zLlAPsYdFozzpzNpPOihZHT02u+HXVRxS9Y=; b=jEj+78DdU1fa7q
	cH4noAZH5n0U57Z8Dlpr4tXaJ7PT3Ajd3zI9VX9ThPKRaez3EnPHQsHaOoGbdc4dF4vXVeeepRprG
	t6bHSrqlWLZDcerWlmBJpLQ6u6uweTZl7tVfbZ+R2SHnIj1JO0e0xgfKp+CH0HGhez9sbveXyWcal
	1+ywhxl466fmQQg1BAKh+yj4VAo7AuQTYCt/XUtWFymHO4+e0D3HKu1LewsIRIV3TjDgI8H0EJEWk
	y0IwzA5iCBx63ydlWn9i02qQTyX+tyHt/yVPYTaASUVB2/3FgAL3qi9vAhKUdRhK1rTUH+2y1GdVA
	ODpnKqB7tvCuYefV22tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGg3T-0000000E1fo-3Yn6;
	Wed, 05 Nov 2025 16:08:15 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGg3R-0000000E1fS-3JDj
	for linux-mtd@lists.infradead.org;
	Wed, 05 Nov 2025 16:08:14 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-b5a8184144dso946202466b.1
        for <linux-mtd@lists.infradead.org>; Wed, 05 Nov 2025 08:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762358892; x=1762963692; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gczMRuZ2fsGRpoCXUBhl7NeVLE82+ehtyW2OQrB7AVI=;
        b=b+xiRI3PoQXKILgfsy5dtXxlmbQuOFOQSHRJal5T3WMWmLy6LdNJXaeWPjnbW8QMGT
         hqf8ZEyLZS1EIMBLyFYpvIOKc7DOHPFAUvrEGc9O6zjudk14w+BWHtCQv+lmBYIO6UKp
         dvva8PGC9VnpjDTLRxSxXvdmyr2s8OSd43APcNfSTW8qLXJxh9+r9qK7XV0WA2rw61d1
         jvWLxyaaxM4EaU3fjLupzWRmJiWg0coEWUeBtRSGVL6AeLy2rVMSzKHhx50/IdiwHcb+
         aqKlU/Bj/LItfVc1ABf6XLJXfdOPfEQ2C4n1c/+dXowiyQBVli3FhGmMsFkAfeOTPDbQ
         j4nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762358892; x=1762963692;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gczMRuZ2fsGRpoCXUBhl7NeVLE82+ehtyW2OQrB7AVI=;
        b=KxV8jV/P/jq7thJRCw98PR4SioppGcj8LN0pcqwXU+XkjKG3L88olyyGoMy9C5B/Fj
         EIySF0VPy4zKqdbH29G3nH2u6iXyJ2JLxf4OBbv1HfT0+dNP6XsadHfYlixvK9xUvRxs
         MMotoZVRAzC55LmaZXXHGxRT1nTJ7+Pk2oh+W5j2eA1qZXZ/YyotKR5odkITp7pojNwz
         PyyW09rz/XBe7g2lnPQLrq3EzmAHkHafo4QsbLboqytw4EpwPhWtbtWiDSfiKTdOug8E
         BPvrrn9u7vmMmPMb4KPLRmcpdSIEX2PSjtI06jYsaoj1752l4L2RTCZExkMSCt95tdnc
         sA7g==
X-Forwarded-Encrypted: i=1; AJvYcCVH1FrIpRYfJyaVHSjlVz+rMYSpBgvQUapd5zZGVTKPqfGKRa982vWoJXVb5QXRE0+KyHNDWQty3PE=@lists.infradead.org
X-Gm-Message-State: AOJu0YyaU3Lrcu77l5V/7KfD0J3s2M7luBno574G2pRqh00Nz23CVbSA
	Tp6QETq2TmFE8ilYJWWfO7PshvO1Htal0g1BvteW/wtuz1tfrxNQlrDmasljeLrRHT0=
X-Gm-Gg: ASbGncv563IsE0IZgt5e0f/H4h5qKH9tgpjsi1EChlDTUyY05FTE7oD2xYhWfq+YMmu
	cxUC8ZLfDKzKgxT1ghEJUzGGFufljaALfW0I38fGh7AZNztXGgfghjemxVWSauzCcwTR588hlyn
	c9Df7dg/KhDsJY91DXISK5XRoJrOktbglGsKl+d3qP8nTrQqaXRjlEKhuTdAUAG4y7mZe1N6C8C
	EXc9M0LFZO0e/p/PaJMy5DDjvczJnexFlbiSpdmTBmD/hIZBjwXlKi5Z/kEAsJkAVdSRKjtHGs2
	vgJ198HFtVjKytv6mqVfhbEKULUo0X0RUzOZ6X/cJEi3Dbm9XOXJKhG/LcHOx5XmVuUtYZYK6Rf
	zNw25ET7ZCmmDV+X7J79z4HJ8Kfk7WCRSc9nrTiISXSHhyZvW2/T1x8d6q57l55zAIAEe2BnlU2
	R9p3ucplQT1LxpnG6YKUGxB6w=
X-Google-Smtp-Source: AGHT+IHe66dGPDCnJF7sA+RdxQD5iEthJ64gnOWmVuY/8/hMYmiDCG3IMe4DFjg+VhIBkBwfSorlzw==
X-Received: by 2002:a17:907:7f14:b0:b6d:67b0:ca0b with SMTP id a640c23a62f3a-b72655a6bf7mr368361366b.61.1762358891995;
        Wed, 05 Nov 2025 08:08:11 -0800 (PST)
Received: from [172.20.148.132] ([87.213.113.147])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b723d91990asm516374066b.28.2025.11.05.08.08.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Nov 2025 08:08:11 -0800 (PST)
Message-ID: <ae156508-c73a-49ba-b366-a35185a7ce5b@linaro.org>
Date: Wed, 5 Nov 2025 17:08:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/28] mtd: spinand: Decouple write enable and write
 disable operations
To: Miquel Raynal <miquel.raynal@bootlin.com>, Mark Brown
 <broonie@kernel.org>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steam Lin <STLin2@winbond.com>, Santhosh Kumar K <s-k6@ti.com>,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
References: <20251031-winbond-v6-17-rc1-oddr-v1-0-be42de23ebf1@bootlin.com>
 <20251031-winbond-v6-17-rc1-oddr-v1-8-be42de23ebf1@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20251031-winbond-v6-17-rc1-oddr-v1-8-be42de23ebf1@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_080813_851961_6039BE7F 
X-CRM114-Status: UNSURE (   4.73  )
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
