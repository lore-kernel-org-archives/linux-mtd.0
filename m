Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2C6EC38142
	for <linux-mtd@archiver.kernel.org>; Tue, 31 Jan 2023 05:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IPFHBVeB8Pb6Tnh4I0npUa3VAE5fjpC8bIwu5eAlJA4=; b=flN1rQZ8pslXmPrT623VPE6HPU
	4XJ8UTbr84mdpYdNjarwqsLseJIAp03uEXEoVJmazEfq01RJ+9pTSP7IL4V3QSvTlr+H/LG0BJ3+Z
	Hu29AyHxTdOxEYxMtQMHt1nWjZIRDILrQ20yYLaHYYl4LC6lilqU6Tb5VxOX9MYxTnrB0gHTgM7pP
	iL1JnG3S7mt6bAfaRcrI0xMNMtqAgJNgnz2WLEZ3SdCvHo4fODghp2XH4BEHsS4AxhBjaTqSwQ+Pw
	OTTRuQzFGmB/um7BB0zGwcNDcXTeou2WZ2DctjJM687r4w08A7MFSVta66+YJo27neytoWl3DrIAl
	ubJoGsWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMjDF-006KuQ-Vs; Tue, 31 Jan 2023 05:29:46 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMjDC-006KtT-Pv
	for linux-mtd@lists.infradead.org; Tue, 31 Jan 2023 05:29:44 +0000
Received: by mail-ej1-x62a.google.com with SMTP id mf7so19630613ejc.6
        for <linux-mtd@lists.infradead.org>; Mon, 30 Jan 2023 21:29:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FUV+QxS4mN4RZmQS8NBOQ0xBYLUXPue9jJ/7nYktyeA=;
        b=Mu7tHMaug6A6sBVyJ8jmTp5S1W62R9mZ9/pqt/IjDAciXp84IBOH+mTtFqv+2F7f8S
         YNuP/cN0hApMMLvitgB6/fo7mHopHsQpgLoVoaKUzjefP5I/MSNlHSd5fsLS3HuF7uHe
         0Qx9GASp1I7WDuO6wy5Vg7RmECU9p16gjWsMi1dmeQdc7km2mclqQDzPu4aC9KjSm4+X
         x+MOmFxUDade7k+Ykwv1yiyrdOahOZWy2rUN5rz6rrsTbYLYM4OIsSlOeUo2UJ+hT5Yb
         UZ0PnGdClpl2JiGKOf6SeFYQYpUvQsdCwfanfBxmWRrCzvCvP/ZggYMT9KzBpuF8JBTg
         /W5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FUV+QxS4mN4RZmQS8NBOQ0xBYLUXPue9jJ/7nYktyeA=;
        b=637LmOvcPJiscjgLvEf3E648HTrXlib1+SqLxME0EU+cFwI/tUj5H7I8SU2rqk6VEe
         xH+/RhizrFQyiBqF2YUDL6onaDmgwrl7iCirJOrT0+bfKyH5JBDqrwcQ4vQ94LmRtIb7
         z1KVcs/g/8/ZLUYg1dT/ejm23I45IHrWRfdht/h9j6iWKZS3h963GRQNxq1ZqfBqM67h
         x0oKShGK2eehcYZjFXznKQ6njvmEfHe8PLiyzIOKnTVS+TYAh8d2RF0JDTeIozi5o2zj
         jdp/71A3h8XdYhynDFMbMGHeMBe9oAvqPDSBz4RppyZXRctUXitX7wBjn9VAniR5g9SJ
         qeqg==
X-Gm-Message-State: AO0yUKVkbxirdzxUCmvwtjGk4HVOi3/FWhrO4TqE9bw0P8CU7KQmXBOs
	MGnOTw5TLig8Zw+WfQ0DjjpSWYiNDsX4P1X4tSI=
X-Google-Smtp-Source: AK7set+pZl+A/hivKsLfYGfpW9oNrZQBGbk7InV/oPlsHCA3g2FWtPxa8cOBV7UHhte3HNKp9/8yOQ==
X-Received: by 2002:a17:906:244f:b0:888:787d:2064 with SMTP id a15-20020a170906244f00b00888787d2064mr6815672ejb.75.1675142977953;
        Mon, 30 Jan 2023 21:29:37 -0800 (PST)
Received: from [192.168.2.104] ([79.115.63.122])
        by smtp.gmail.com with ESMTPSA id t26-20020a17090616da00b007aee7ca1199sm7959090ejd.10.2023.01.30.21.29.37
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jan 2023 21:29:37 -0800 (PST)
Message-ID: <2c94d073-4b63-bad0-3b76-fdf5856926c8@linaro.org>
Date: Tue, 31 Jan 2023 05:29:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 6/9] mtd: spi-nor: Prepare the introduction of a new
 locking mechanism
Content-Language: en-US
To: linux-mtd@lists.infradead.org
References: <20221215081241.407098-1-miquel.raynal@bootlin.com>
 <20221215081241.407098-7-miquel.raynal@bootlin.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20221215081241.407098-7-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_212942_870765_4393EC3D 
X-CRM114-Status: GOOD (  10.89  )
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



On 12/15/22 08:12, Miquel Raynal wrote:
> This commit alone just introduces two new "lock and prepare" pairs of
> helpers which do the exact same thing as before. They will soon be
> improved in a followup commit which actually brings the logic, but I
> figured out it was more readable to do it this way.
> 

I'd like to not introduce new support for SPI NOR controller drivers
(those under drivers/mtd/spi-nor/controllers/) so that we motivate the
owners to move their drivers to SPI. So we may have to rewrite the
helpers a bit, but I won't stumble on this right now, let me get the
general idea of read while write support first.

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
