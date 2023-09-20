Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D709C05024
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Sep 2023 21:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kW7uCS0uLAaeuttRw+x1gse2BMIPYPyByMph8BpKU+Y=; b=jdeF0GBaOsrTcu
	lkEwHXQx3BZeKRTuBZsUv72EHf4Ix8fbjfrRJf+D2GryOpM4+TebzTftbIprkOP99jQhCS0WCp2ji
	8ZhYw8BgDMlIP93KBAkhOL3FMCHpqV04/noX52Y6Yw2dbPyjjAk5p/i1U1DHWADLupjHPfmg9exee
	9LjJ1OpOHfjuLLoik26iiigm1fZAftRpqLcGQ5AI9ao9vSCa70Mkvb66GX+v5K6aHVMR3uOEFjkFz
	oONlLBTTkmzU5IQlLPK+Q9ZIovkJXsgPxRwtVTD/h/7RtVhAi7fIk8luVBZlmWGci2JY45LG1K7sq
	YuGVlVG8JVPIxX9rHs+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qj4i0-004GEr-2j;
	Wed, 20 Sep 2023 21:26:08 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qj4hy-004GEN-0o;
	Wed, 20 Sep 2023 21:26:07 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1c09673b006so1960985ad.1;
        Wed, 20 Sep 2023 14:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695245165; x=1695849965; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wDky5cMjhAdH0XJ0lHaGj/gCp8pUga3o69CncHMTrXA=;
        b=WFGu3ygxuPv4tjb4fsYmPq0SMhZCS/5/xWqrdHkh5gEjYgWLgkyjeg/yzARNT9CBnz
         eUVrqJB9B1UlnixiIGlOCHOEMs7BxOCskOVtQkulbdrNiiIWIzgertvUaz3U0fM/Hve5
         BMz9tY8Z2ajp5vr6j0QLD+uRx0m257njhJCFBtcGSs98MCLFoqo9lHrfWH/q5df/t05y
         Mj0pfzsMsWrxwuTx8m1cRqqK8cUPw1rMeccGpQy/v84bCwnoddT3Job9EY3tUREABB9r
         lG6+feZTtQppWB426MjqpeCRcM5UbmGxzbL4vrP0IO00yhFzfnrnVyvn/UvoYJYCMW+K
         I/PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695245165; x=1695849965;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wDky5cMjhAdH0XJ0lHaGj/gCp8pUga3o69CncHMTrXA=;
        b=MdEADMerYBiHnqew5+KqsP80r8PMHhKMfIF1DuA0NPxOfut6xUPimVrijuyh2fSNSj
         s54dA4xlAJuhLb22hIhWw4oupr8vfzsIZNSzkw9S/a3SsXdDlkjJQyoxQt8/L9jFdC8F
         hd7wggkUkwDnoHwcwkwkxCbSfrLGeHDKOCQkL2U8Gi/fl5Op5Nq5dwyoSwiIGd9tHmu0
         /4JsYMu7C/60/txR8VSKZvm0pljgtQqSVLpWLQBMmwPIX9ZMKYW35FENNIYXgmYtrYf9
         kCF/NhpS13FVi3G8dBygKc8xK29fmIkEFH7omnlYTB3Vr7GIDVkH6HG7uIZ4ArrdzvwF
         qylw==
X-Gm-Message-State: AOJu0YyP+JBUzXWqTvrxzjjYTGbEuQc9DqDLVoYkYpVkh7RhX4j7ftKh
	zqyuk1+8cssMpTlZUFk8WOs=
X-Google-Smtp-Source: AGHT+IHcAvgXhDYx2lkefhWfeaa8+dmAicl4g02UBEsy+n2QB988lCu6OOvdMJZ3YymOi4uZKs00Kg==
X-Received: by 2002:a17:902:d2cb:b0:1c2:218c:3762 with SMTP id n11-20020a170902d2cb00b001c2218c3762mr4003650plc.42.1695245164701;
        Wed, 20 Sep 2023 14:26:04 -0700 (PDT)
Received: from [10.67.49.139] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id e6-20020a170902cf4600b001bf5e24b2a8sm1466185plg.174.2023.09.20.14.26.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Sep 2023 14:26:03 -0700 (PDT)
Message-ID: <78ca6618-27ac-811e-a37c-d83cc5426e0c@gmail.com>
Date: Wed, 20 Sep 2023 14:26:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 2/6] mtd: parsers: ar7: remove support
Content-Language: en-US
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-mips@vger.kernel.org
Cc: Jonas Gorski <jonas.gorski@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
References: <20230920201035.3445-1-wsa+renesas@sang-engineering.com>
 <20230920201035.3445-3-wsa+renesas@sang-engineering.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20230920201035.3445-3-wsa+renesas@sang-engineering.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_142606_289111_C603E2C5 
X-CRM114-Status: UNSURE (   9.17  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 9/20/23 13:10, Wolfram Sang wrote:
> AR7 is going to be removed from the Kernel, so remove its support for
> MTD.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
