Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24847C5B549
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Jun 2025 05:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kibbSIsSgPObItdlpy8jqXmZtVVFwm7rw1BTDuSRFVI=; b=3d/1s6x56r8TYXCR1887bW/r0+
	bMIhTRephkDUs9cSeWS9h8AWGTZ2jGMKNNeadYovVV/bMXoInDNILA+XWrhC+vSB1nae+Jg0dzIfv
	K5WljkRpi6kSVGLuV+oChWr2QvmOf+VIuRyyFpBeN3p0U25Q+6Z9IwsHenap1vGD/8IzVwrFSWo2d
	fE0O7/2X2nFaksBpsfZyowiTW9mJCFsRlnXuc7UHQPwJSLduZjg+ybLipgVhAxkaQlKq+yKJhz3+5
	+/RHOBf5feE1GNLOaVhHg8MhmbqBjT3MN09a4AzrEn9B/xNatEQ+fIiZVMHwhrpYY8dEPUq2z2lPw
	8qXKVamA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLxwR-00000006lzD-2plw;
	Mon, 02 Jun 2025 05:42:35 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLxqL-00000006lDs-2Jwg
	for linux-mtd@lists.infradead.org;
	Mon, 02 Jun 2025 05:36:19 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3a4fd1ba177so1020294f8f.0
        for <linux-mtd@lists.infradead.org>; Sun, 01 Jun 2025 22:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1748842576; x=1749447376; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MqSNiwa/UAtmNvnHHz2pJKBZRyVaTikg4qj3JO/V5O0=;
        b=Ki6DFtjpX1nCBD9L0VBkrhRCBQhsfcP+MiMWgGKPT3481uIIZTFDsR6BVpbBI1qXJR
         xH1ZfAQ6DdFVhM2inp0YLvDwVLEr4HVPFs2Gg9QiesjJ1e0aFBMoJV22HE9Kahu+m/AJ
         AxN8fO9PixoV8q0oO1Q9nTweSwJyy10JUMvHOLYiV63PrA1dUHawQUzhbE46VAh6NhDB
         vN2R5iw9cstTZZCnxhkcej81Row6MIM6yPLiblvXlwzcdmLse0GQfPrzQblrTWk3Mnfa
         l9xIwFlYjo67ArRPVsJvLbwuS+GKSWeHcRC8HEKmU3FncNur1s7pYUg10Yd/C1xD2UjF
         tgNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748842576; x=1749447376;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MqSNiwa/UAtmNvnHHz2pJKBZRyVaTikg4qj3JO/V5O0=;
        b=cwBVq9dO5J5YRBM7f17VKcEvmZ5awY8D29rqCYt1eizQqoZjMNpZ/MaWmz3vQ+Qqgc
         FlTWLgAJ0vZ7ZNyPdOqUtGMWEbhy4bKvx+jTjuYnZYVoFyecnisNmx+cGvIWYVGUPQVt
         udyF/6kUgHQ1zqcn9mKcdf7SgGgWGKojAYpMX33qZLWqnOnpXeSqDFWbeHlov4rlxCJK
         bC7bPd8BHXU6f6tIndBnP1O6Tl9W+ZWtV5/TPUl1o+hURzaSK/YhtA+sAx8wYqG5ttl3
         wZy+e001uImM+DGR+qqB1b3JKP8uZOI0gJFqZvFw0xcqXGPJ9+9j4KuJbFTCghCJ7Y1y
         lMDA==
X-Forwarded-Encrypted: i=1; AJvYcCXVv4rBZwY93BV989yEB8DRH/mHEqCOSoMq+KudSrSqF9Y4MoD8rN8dQcN0w+YR+3yuviltFwiQ9nU=@lists.infradead.org
X-Gm-Message-State: AOJu0YysVMl6gfmIDtNNVPoqOaPUNr0w3u1q4VbO7EVRatjOjsh8neh5
	g6CncQHP6jWWJOaouRG9tVCDTFntokm6VrxTmsTG5Q3GypHwvmeDyMpguwfv23i7uOc=
X-Gm-Gg: ASbGncuQyknpyua5rTW0Ucr/UxBrTkm7Aopdgl9EvpZt8+XXyEodHgDRY7X/RMIiyOl
	GZee5Vwxix2GgENvBZg6G7aWQTqMvgjbo0KhnYeLox6aM/29r0fYdK2GLS2SLqtoc7komMqmBZb
	paiuewoHgmfjpvs62kHWpCpxRobNAPy5p7cx4vNT4w/FaN4t80zt3q74aNZOEidbVQpGwvtIO1D
	SfUix3a2AF9I1tBEq02UADMfvq2oeVfletC1Ko8vwKWal9OnqjpUl8MGCPRQ8GsgdM6Gb1xDII3
	5Dp8Vg0RzfN+cdg5OpsXALPM+pf9w+nNGoGKXXSfGPWnLixo6l0gYl/PeTsla4//MOc4sPAdgRD
	9Eq4pk5aL
X-Google-Smtp-Source: AGHT+IFrlSJBT8trfonfqIQW0+IoQ/KLEeT/wRHBa0v5nZ5ZyGgVKr89ofvjSudpswjrAtax/+CZcg==
X-Received: by 2002:a05:6000:3112:b0:3a0:b565:a2cb with SMTP id ffacd0b85a97d-3a4f797086cmr10246804f8f.1.1748842576026;
        Sun, 01 Jun 2025 22:36:16 -0700 (PDT)
Received: from [10.115.255.165] ([82.150.214.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe758besm13646472f8f.51.2025.06.01.22.36.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Jun 2025 22:36:15 -0700 (PDT)
Message-ID: <4a95a54c-e23d-4a82-b764-f454df0cc183@sigma-star.at>
Date: Mon, 2 Jun 2025 07:36:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH mtd-utils] ubifs-utils: link libmissing.a in case
 execinfo.h isn't present
To: Zhihao Cheng <chengzhihao1@huawei.com>, Ross Burton
 <ross.burton@arm.com>, linux-mtd@lists.infradead.org
References: <20250226182400.1723418-1-ross.burton@arm.com>
 <e87fbc32-b301-1500-c3da-642e21e97306@huawei.com>
Content-Language: en-US
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
In-Reply-To: <e87fbc32-b301-1500-c3da-642e21e97306@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250601_223617_588222_BEEF0AEB 
X-CRM114-Status: UNSURE (   3.42  )
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

Applied to mtd-utils.git master.

Thanks,

David

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
