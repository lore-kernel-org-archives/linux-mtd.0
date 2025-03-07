Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FDFDC28B25
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Mar 2025 15:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=htBnyurWDV/s5Of8KiZB5YsRvBtRhzH5qQRtR0vWZoY=; b=q1dFkMCQrsZ1Uj
	3g8Oy8+o9f/cjiw17+nTI4Hg7If5YhT0uecniqbdlbG/AnUiaZlCrMlNN0WyGikyvHXlk7Z6SsvTM
	4HYZkGJpg9zwlYWbQoI1ImVS6NgSnkGT9w3BoNC2hKAIzQNNrIRezg+55DIeIUQYp2iEZEUv73B7m
	LN10Lju+0Q+8z1W9N3OzELTjm2oMXMGBxW72yXbivTvG14RjevD6wrLqmSVyeU3Xz3g0XSuF4ejLh
	RIWQ2ffC7J3Isq/urU2Oc6x8zi8zy8Rz7WlAcPHFdKcjtceq6FMkpT1z9xkJNFpm5o653OI8nWwGm
	keN1qiYFCOyGylOEwuug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqZuD-0000000Eka7-3XkJ;
	Fri, 07 Mar 2025 15:46:33 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqZol-0000000Ej6s-1xsZ
	for linux-mtd@lists.infradead.org;
	Fri, 07 Mar 2025 15:40:56 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5e0b70fb1daso3668880a12.1
        for <linux-mtd@lists.infradead.org>; Fri, 07 Mar 2025 07:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741362054; x=1741966854; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eSl/dEjQciG1GeYbhromFxZ+Uhk0mE0cLN7r3JcDdtE=;
        b=SwWf5Q99NHrgg4XmZibaK9LWr0Z7U8UP7PPnKEWnImUCjSpc1eWKJI6aWJiGSotgB/
         dAKu2HDVPN/RDc48zOAwKWhMKrBJAdrEP9AzhzL14frjl4l5zniAkDHfuKAb9EPLz4EQ
         hOFUgVwCNAyAAx0nIuNFmnCasAMjAn4emz0ZuQXPB59bt34m02Yfu1sEKknHfJHN1I31
         Eekf0AhX2Fe7RguNB4cls813+hHiR9dy4BPQAOEb3sd3OwlDeI7FLVgdFI7jj0oKVKIO
         rtMDvn4uvRdcHdOqUXwKW+hGSsV4vNVqv8YrBdA1zlVru4BxF0Nkx3z+PvtS2TtNlFde
         bh+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741362054; x=1741966854;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eSl/dEjQciG1GeYbhromFxZ+Uhk0mE0cLN7r3JcDdtE=;
        b=r+102CgUxRE59cmsmrMAur8xP6HhmZO5ASdftsXNvGfbXj/Y+G/qw/bSBJMQhGgTG+
         g7h1WCrYW8s/q5AsEvhC9Eune0QWOrNrpq64SsMdkDCHpkR7u4RAVjHqa00Q2z4Pr6xH
         U5DmOq4T4hGKb3EiSZFxH+Pt/MTnQ4yyeQtCnZ8R81jZd7VGO9OKCfJm7IdcHILv1tW0
         tC3SMZnJzym1nINduPxtHyn420kUuq4NtVE7u14yFJZZaFABBnIarWlIcWUNve/PUWCZ
         VaXLHTk75lxidiyEuVbqM6if3sH2KXKdRhHOkA1hr9UU3urMEWww94eYv1pmKHBGo1/M
         oJjg==
X-Forwarded-Encrypted: i=1; AJvYcCUShbb1QMJo9f5kNDwo/jwsFSffcEjoDGF3OWmoTDJLSOBa8UVqyOiKfdg7842AatNsvSGTxex7Z7A=@lists.infradead.org
X-Gm-Message-State: AOJu0YwwyWLv5JNQFyd0/87gTCmyysWN2d13NUMOoQfvH9fXhhBVD/cm
	wvvDVJcUfn0D7HRoH2o0KzQVLwIlZbfCoXinhqYBTOT5xMhaCOjJnDWXjUMZ8hw=
X-Gm-Gg: ASbGncuRZwV3hEzzw5BmEGrqElPWn8w5b21K4uC/dYWpiTkdIiJhIXOeGevlDNV1yL/
	H5wI/F/6WEqTeqaApC840sI0VvLSBbHOXWD09lUyqvAtU3BvW8rRStRtgeENNW6a//znVc4dBpa
	cYQAO8icqaBMbvXSpPFuBU4TZLQt4EBvmwv0l85Nz4s7qm0TzxkTKHNpYnHaSXpQe+T1dK6zers
	4CnqMAddv+0Weh+ekKY1utbhINp27HFanWduFvny+OGu7Dw33aqaseyjpWZYM/56vdjyJoIheTk
	tEcx/ELd4iKoWN41p5b10o91PS5fYugeC81rrPU/uXY2U4/kdjV5mA==
X-Google-Smtp-Source: AGHT+IE3kPBlfRlwlVOOHzKMT+qO/vZkpa4nFjsoBxnsYH6U5Z69MZDHUDvslCagD52u87+mkZIFQg==
X-Received: by 2002:a17:907:94ce:b0:abf:69e6:4372 with SMTP id a640c23a62f3a-ac252749adcmr504056266b.4.1741362053829;
        Fri, 07 Mar 2025 07:40:53 -0800 (PST)
Received: from [192.168.0.14] ([79.115.63.206])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac23948432dsm289187666b.44.2025.03.07.07.40.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Mar 2025 07:40:53 -0800 (PST)
Message-ID: <087e97d0-c91f-41a4-ab17-3d98e7af84ff@linaro.org>
Date: Fri, 7 Mar 2025 15:40:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/21] mtd: spinand: Use more specific naming for the read
 ID op
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Santhosh Kumar K <s-k6@ti.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steam Lin <stlin2@winbond.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250307-winbond-6-14-rc1-octal-v1-0-45c1e074ad74@bootlin.com>
 <20250307-winbond-6-14-rc1-octal-v1-3-45c1e074ad74@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250307-winbond-6-14-rc1-octal-v1-3-45c1e074ad74@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_074055_510668_5029CE43 
X-CRM114-Status: UNSURE (   5.49  )
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



On 3/7/25 3:08 PM, Miquel Raynal wrote:
> -#define SPINAND_READID_OP(naddr, ndummy, buf, len)			\
> +#define SPINAND_READID_1S_1S_1S_OP(naddr, ndummy, buf, len)		\
>  	SPI_MEM_OP(SPI_MEM_OP_CMD(0x9f, 1),				\
>  		   SPI_MEM_OP_ADDR(naddr, 0, 1),			\
>  		   SPI_MEM_OP_DUMMY(ndummy, 1),				\

I think there are 8d-8d-8d read id ops, so:
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
