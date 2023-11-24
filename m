Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 391AAC61DF4
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Nov 2023 17:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ChCDCJ/BLbROyeDJU3IHZAKqidsYA9PBLdtSU7NCKmA=; b=QH+2VcHXnipDMC
	z2mMCHhlj42SXn9RgSg6PjnH47qI1zg5xVZEaprcujHor0SnMpPLoQ85doIjWvjMDUe8F2I6rvWsI
	tOnVrP2d44c/PcvyegyPa5/jmD3LbU/U6vn73WBJRbmjIjqZU4LegBAwVId4yRA113Eo6aXBNPGT2
	ZRkxmgZ9qNKRE3kf0UOxk0uAjbaP/4yfARfLyuT/EFhM+YgR/Wb6Grf+BLVjHMRi3ENd1BX4Hhn7s
	X9fhj+z1zFv0q6lna6SqmrXEwmCz0TUpuq0EUTIG2MLxfmX+S9PwIssuL0lXCsfoGuW67TfEsbfRy
	SGisSrdqPyr/xwsv5CDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6ZZI-007l1m-2r;
	Fri, 24 Nov 2023 17:02:16 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6ZZF-007kyp-2g
	for linux-mtd@lists.infradead.org;
	Fri, 24 Nov 2023 17:02:15 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a02ba1f500fso316906366b.0
        for <linux-mtd@lists.infradead.org>; Fri, 24 Nov 2023 09:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700845320; x=1701450120; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=43E23uAnd+k2rGiCz48QeTcuuPvbRuPzS8smKDyaGvc=;
        b=T10W7QLAQJCeyE/k2aBfcS6FmU/KO4pImZTrnYd5VjaTZvyYf99Rosuo3bUS07M8GQ
         IpAC0gUxBO82cAcblnSu4sGvU6+gvA/oiAskEf5giarPg/+Gd3Utx8fY5KGL88mjaVRf
         44T/pbC6gNLQpV5kcxaiAHMwX4wagKSBaWJhEFe/Cdi1vYVzrSmOw24wUu31trr0f60k
         0uOdJQRk1WXBWMaXJauac+/hDeobkJTEeTWyEngqUM8T58BcbYXhY56URRMEBkrVbFgZ
         GRtOkpd6tJiegFOVhZ9Ybi1Nb7ByEvq3MFDiinamfSCxOp6XxNffMUdtM+aYsBfrDrwE
         +2fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700845320; x=1701450120;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=43E23uAnd+k2rGiCz48QeTcuuPvbRuPzS8smKDyaGvc=;
        b=ZFIkJ49/SccXhfEnGDFv7c3lLoUL9c+RGPWqI/lDqojGTDi8GIICGI/Dt7Me4p+XCb
         hUnorp4FLWlVO903cUoa5WIFVGrkqXn0w27DsJwcLtocPqAqFB0lgxGW3eqoOs6WioHH
         WBMdK1jFJC7bzcQkIrsrIUNLilotKwKf20hc8WspPv4dnZWSwTjhz39irTPZ4JHY5+jl
         c4KjC7iTfah23qkyIyn9KDIcZH4WWHQJvRglXbj90cOynEhmax1VdcJNdRrdCvapGkxq
         m0GJgBgNMCXsKLIsspPI/pCgFgzh+9aVl9aehJ+B3XfLUolma0g67/J4CwOKKiLJOaZc
         X9Lg==
X-Gm-Message-State: AOJu0YwszhndzYKBeHuc8+AEcJPxkH9cbkIMbpHPVeFCNZp/zgLlLmEF
	oDbuawRgc6CINGZFJCR4NlWAMw==
X-Google-Smtp-Source: AGHT+IElUO+l51/8AnXdUmo/6bFieTHSrdY6icuz5IXr0X61Q6SkPXMM+wDGNFKRt6RKrJ9IHvi+Ig==
X-Received: by 2002:a17:906:856:b0:a00:2de3:73cc with SMTP id f22-20020a170906085600b00a002de373ccmr2137734ejd.69.1700845319366;
        Fri, 24 Nov 2023 09:01:59 -0800 (PST)
Received: from [192.168.0.174] ([79.115.63.75])
        by smtp.gmail.com with ESMTPSA id r17-20020a170906a21100b009ae57888718sm2260761ejy.207.2023.11.24.09.01.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Nov 2023 09:01:58 -0800 (PST)
Message-ID: <9b0cf286-b938-4a89-bd5e-c2c00cea020a@linaro.org>
Date: Fri, 24 Nov 2023 19:01:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] docs: mtd: spi-nor: add sections about flash
 additions and testing
To: Bagas Sanjaya <bagasdotme@gmail.com>, pratyush@kernel.org,
 michael@walle.cc
Cc: Linux MTD <linux-mtd@lists.infradead.org>,
 Linux Documentation <linux-doc@vger.kernel.org>, corbet@lwn.net,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20231123160721.64561-1-tudor.ambarus@linaro.org>
 <20231123160721.64561-2-tudor.ambarus@linaro.org>
 <ZWBMyPIPwq9L-5pG@archie.me>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Content-Language: en-US
In-Reply-To: <ZWBMyPIPwq9L-5pG@archie.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_090213_865544_398F2594 
X-CRM114-Status: UNSURE (   5.56  )
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



On 24.11.2023 09:12, Bagas Sanjaya wrote:
> The numbered lists don't properly rendered, so I have to fix it up:

Thanks, Bagas! It looks better, indeed. I'll include the diff in the
next version.

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
