Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2EFFC4707C
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Jan 2024 08:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=81v19Bwhbnv+3iIWSxnpnMcEGEZvi63d1H9DV2c9etM=; b=aN4lOj9C2/Cqse
	V/dFJ3cUS4P5W4SzvzYoQQYcnvurL8SC/gvYbEvqk72VxcPHN1Mot2AhY6MJurmzOXaqCglO8IyAY
	I2e3rPr48QJsS6qS/VgFxahsz8B7yRbFT2emSzRzmGlI333IctrctqQsH4IUFy8aCwaLfvGDmMhft
	b2E1fRXN0fYK7IinuL04myaIS67VWFYfQD+1j1MSvVL+c6QcrdClEAyOhQ1lVO2y3M5HlAuwpEAgr
	ES+oFZiy586q1dUCDhfc4BjNzsYp5cH0I6meGrRlA3rGN5nrbSquSDqDZVZyy7cg5jKH0NQKP5H4n
	xtg8mhJvhV2MKIIgxi4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOD9h-002EKV-34;
	Fri, 12 Jan 2024 08:44:45 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOD9f-002EK5-39
	for linux-mtd@lists.infradead.org;
	Fri, 12 Jan 2024 08:44:45 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-40e636fd3d2so6451525e9.1
        for <linux-mtd@lists.infradead.org>; Fri, 12 Jan 2024 00:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705049080; x=1705653880; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6zkTkSo/Pt1+1N8FR3icLQHNcYZp2/Uicp0GPSLnuMU=;
        b=xOb4CoWIeKcKtyJexMvtV/QSvtZPaDMI35S1veXmy4oduv3B2pqd6JSfZ1m+zBNlRN
         xXnLVyKbaagols+KMbf/8y706QFajunA32q/P+Pd8Cnd2K7iKrhiJHXllzM1UcwjNKZA
         jK5RwkWZJKEclvv+Slda2jEbto9JzIsZulSSFFO/lQ1fLqx0QAoqCT3zMsLhQObcfnQ2
         iZImiIg96rXaKvm05D0QQZYuLF/EHbTpgIaBaUl1zx8Ij6EW30JiWcjlIZY6rc8OawIY
         WY1WCX9eNkxVqh2v9rt96QrFBrT+i5aXCja0WSXznyd3LUMn0J8Qo+8Hn3D22h9nZvoj
         /Tww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705049080; x=1705653880;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6zkTkSo/Pt1+1N8FR3icLQHNcYZp2/Uicp0GPSLnuMU=;
        b=DzY/f3jLDrSs2ZB+E1RAPy9g1Iz0egwcBa8ne+Jq/4D/XSpL9ofoYxtSLEZL0ksnBx
         KfCgEtEvrxQr/eK+1IUaN/Z5PlbDDvr1kZ1S6TVo7ft/I2QOBM1Tt3+oZPpQICC0ONDd
         GW8vEbmfffe+01IsYeldrR8Km3XeMmfKSUxarJe3qCHVEaspmrlpZJ98s1nIm4fnWWGD
         WwC+dleiBiXkok8VH9M88y1TT9DpYPBDvFj8ifvuDKA8hC4pGoogsb+og/yx47Ipmyhz
         VNP4EMlwiQNfiL5omjqiLQjJLGdoKkULtYePS/ndqJkLZ0ux02NXtBQSH1PFeVEZ3CyY
         2dSQ==
X-Gm-Message-State: AOJu0YwlYHWeUePeggBlX7X73fAIWCjJK9V2ZcfME4Tyist10jcSJOp7
	ENssnnRq5ESZuTuDXF1pYw2bUKJa3zffXg==
X-Google-Smtp-Source: AGHT+IG2P9jJez8mVo6QXMW8PjoJYec39N8+mZQUmPF95vvL6pEoaxTJIaeMCVuCBNsDz5l/seUrLw==
X-Received: by 2002:a05:600c:45ce:b0:40d:5e0e:8648 with SMTP id s14-20020a05600c45ce00b0040d5e0e8648mr539016wmo.159.1705049080097;
        Fri, 12 Jan 2024 00:44:40 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id fs14-20020a05600c3f8e00b0040e38b7cfdasm8705535wmb.4.2024.01.12.00.44.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jan 2024 00:44:39 -0800 (PST)
Message-ID: <b7abb1cb-07fa-4974-9054-e54f334e8a2d@linaro.org>
Date: Fri, 12 Jan 2024 08:44:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 7/7] mtd: spi-nor: add support for Macronix Octal flash
Content-Language: en-US
To: Jaime Liao <jaimeliao.tw@gmail.com>, linux-mtd@lists.infradead.org,
 pratyush@kernel.org, mwalle@kernel.org, miquel.raynal@bootlin.com
Cc: leoyu@mxic.com.tw, jaimeliao@mxic.com.tw
References: <20231221090702.103027-1-jaimeliao.tw@gmail.com>
 <20231221090702.103027-8-jaimeliao.tw@gmail.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20231221090702.103027-8-jaimeliao.tw@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_004444_022167_D344E121 
X-CRM114-Status: UNSURE (   4.06  )
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

same comments as in previous patch

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
