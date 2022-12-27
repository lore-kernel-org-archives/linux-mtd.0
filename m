Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7035AC10F1B
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Dec 2022 09:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WYNyMzTqJA8vDiwALlRWGhj87AF/z3cO44JV+vCQvZc=; b=v998r8q0ZnAkqp
	cRZs26a18t+jEK3ZQPiIuu87vjN4YsyvMS09ZcuhIWxWiuGlbpZ4W8qdWeJZSuk11Wm41rrELeNYg
	R50g5TXCEdtshDpuEpYsH756nEHTDDqbJFi9ucf1pC73ns3ImbFyf0gfNWF24pfiCRFf30sY1KJyz
	wPUpHr7iltZfRBPT0Mq5Pu1dA5vsZYuSQ8zvB23tI39PGm2Gn8QJJQjrsdYIBlWqH911VUCiw/TeZ
	7zh8XzvVsa9oDasGm/0UTRQGYNmpu7wQDjSsA3Y44FzxSYkKSZeijLSjqdp2m5ihMU0ROC8qbq9eE
	GYzF7EiyTn6tQHdz4LAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pA5vG-00Bdlk-3K; Tue, 27 Dec 2022 09:06:58 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pA5v9-00BdiY-Pc
	for linux-mtd@lists.infradead.org; Tue, 27 Dec 2022 09:06:56 +0000
Received: by mail-lf1-x12b.google.com with SMTP id g13so18792513lfv.7
        for <linux-mtd@lists.infradead.org>; Tue, 27 Dec 2022 01:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wgi2g1n+nHbhC11kGT7UTTZnfTwUqhX8cOYNVdVe7V4=;
        b=ClgKJTw7Bl1MJuZRI2HiZuLxT12iHsCqWSjsVVeX3rxiZs1D/Gn9scVdPi+/1yPL1R
         1WrifslyTd0mTUXpqEgdVpAlvre9OhKExBdsih4pp36ofbQplLhQ/+sC09j+WY/dsLo8
         ziglLCPyVN+HzBm0v+CyXJJcH6WIN8eQLO+W+3hJtz6oWkWvyLsuq/CQtBZSnMfApMJg
         l3zofTkWFudPF7ee8VCQHnlzFjVRVWkWN7OvQx/kw0fTCTMieS1jCgboKO7gtWWSaXLs
         LXQ1wAOxVdrVAg9p64mlvxixNn5dPOf+9b4b+Okmb9jTjy8pdc/pbVpq03bun23rFKmy
         ZgCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wgi2g1n+nHbhC11kGT7UTTZnfTwUqhX8cOYNVdVe7V4=;
        b=yuena283rI5BoMDGS7iIK3tdRzuLygpm3xBj5/6EfrpYWzAJoReM+0dTIFm1kZzLPp
         mcNXXzeNkaITAwfPdi/laLdhBMWMciwvpk9QmqnwVtjrHrYPoxL+Jj843q1WDd27mU+W
         c4zzgfJvMyIvq6gXMDWIclM96EbU6UJfaTRM3nXsnghgpzApZ+1BfY7pkr0u6HbpLY3V
         1We6VTwmK4YDzwYrD8BwvNhBYK0NvAa0t+ioCAQ1JMYp4h25P8H5Og928hDBaXC/ag+L
         yVZFDwzUHXSSsOkScd+NNWiqUEOfXabJ1bhO1X0o08SrcrKiPR+WQOzDuyURxFxJdMZg
         7nbw==
X-Gm-Message-State: AFqh2ko+O1DIgPsvCcmUP5jtFIAhPEPxEI0c7MEVp5yJXhu3Kq19FjPw
	YL86vCQmRQ87q+clbI0SVNeyJQ==
X-Google-Smtp-Source: AMrXdXu1DnHOT4QXJVWjYcj4KtoF8psUezFfIbrl97/RFTeb/sMUQipRBAEYDiflVCFEvtZSvjhcVw==
X-Received: by 2002:a05:6512:169e:b0:4ca:fa2d:2686 with SMTP id bu30-20020a056512169e00b004cafa2d2686mr3993709lfb.35.1672132008806;
        Tue, 27 Dec 2022 01:06:48 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id z5-20020ac24f85000000b004b5480edf67sm2162766lfs.36.2022.12.27.01.06.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Dec 2022 01:06:48 -0800 (PST)
Message-ID: <2d62f33e-69d4-064c-f226-2d38396f0e9e@linaro.org>
Date: Tue, 27 Dec 2022 10:06:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 0/6] memory: renesas-rpc-if: Rebind fixes and misc
 cleanups
Content-Language: en-US
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Mark Brown <broonie@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-spi@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>, Sergey Shtylyov <s.shtylyov@omp.ru>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
References: <cover.1669213027.git.geert+renesas@glider.be>
 <167213158107.15520.15699943919910529014.b4-ty@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <167213158107.15520.15699943919910529014.b4-ty@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221227_010651_901886_75BC5DDC 
X-CRM114-Status: GOOD (  10.11  )
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

On 27/12/2022 09:59, Krzysztof Kozlowski wrote:
> On Wed, 23 Nov 2022 15:41:16 +0100, Geert Uytterhoeven wrote:
>> 	Hi all,
>>
>> The Renesas RPC-IF provides either HyperFlash or SPI host access.
>> To handle this, three drivers are used:
>>   1. The RPC-IF core diver,
>>   2. An HyperFlash child driver,
>>   3. An SPI child driver.
>>
>> [...]
> 
> Applied, thanks!
> 
> [1/6] memory: renesas-rpc-if: Split-off private data from struct rpcif
>       https://git.kernel.org/krzk/linux-mem-ctrl/c/f8fa9cb3fb16e06514fec0bac58996015dedc453

Missing checkpatch. I corrected now:
WARNING: Please use correct Fixes: style 'Fixes: <12 chars of sha1>
("<title line>")' - ie: 'Fixes: ca7d8b980b67 ("memory: add Renesas
RPC-IF driver")'


Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
