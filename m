Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9E6FCE79CE
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Sep 2023 12:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eiam5WCNYMX5GEUol7N25s/MwiN/tpsuOJwHFU6Zb+o=; b=y4aMn38qvc5nZ5
	8pxYzVbkKXvgEko6zoRJGvtHCZTkrVSM8EwMn9mvjv/2508f8WqPwfu9ac6Iz21dDbMVyt0xa6Epc
	LP/a907zDKlgKeqpWX0sub40x0Pu1mk+IJLoSC3rKmGr4Yzo5ZnupcGaVi78zUmx7Yhv4g7naRkx1
	5F0Q5ep/j9TsLZtC9dwmVZPhAe47i4InTqbdsoZE6KypTI0nKFsJ3g8WGiEqG1X+Z0PJVEOgyCzs/
	g2c1AeeA3qMQrnV2cYzHTyhT/pIoMFnvFtLevw1d+X/AxiSdHi3tQJ5b2AoBeVURrXZ8/9LTNU1Yg
	wMYT2vIUAgSHWKkfUg9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiwS9-00332K-0W;
	Wed, 20 Sep 2023 12:37:13 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiwS5-00330W-39
	for linux-mtd@lists.infradead.org;
	Wed, 20 Sep 2023 12:37:11 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-530e180ffcbso4555907a12.1
        for <linux-mtd@lists.infradead.org>; Wed, 20 Sep 2023 05:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695213427; x=1695818227; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p27LSJAQ5wgWtClpnRyI7MVYKnE2720I2B21+9Cm7wE=;
        b=vY/2nLLPzHSYhZwTIHX8adKkBVLbxRSs/i8PSigE2KoPZSm1mBmJgTacJM7iXhSPRf
         DZNP9kZrrb5/U18GEgAn/P9028//15S73hzhYlbX3Z8eOQfgw1kYOd4/3PdIQGBCesmn
         mZJsWAPI1BBGXsTeJRdn9fbDOJoaCakhDn3ZuUguPVkPNXOZ69mGJAjGvLbqUFUIGNz/
         lkiHegfQjo4WgH+Yk1fQnZ+znDjrOjxnBZIbUhH3wAiBZJE1q/av+MTfaXyhAS+EtbyH
         5MaEwyK6CxB4MOJCoAWuqsRY6qpNzZ25WNNd20HrONJjnbhY6cyUxeBHnqMRu2WFgdWr
         p1qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695213427; x=1695818227;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p27LSJAQ5wgWtClpnRyI7MVYKnE2720I2B21+9Cm7wE=;
        b=QeH88HHnwVVY+H3CZ6Z32uZJLZt+SQN/1H1oon/8KN79iEWRDyg5dKAqp9gG545FZj
         1QTB2S+cXglPWjmJQvoa1QtfY2zwivV++r5Bf33HvZldJ1iVMtorBdRIGwD9eJ72ziM1
         meS9Br8rdDdevK5Bp28XD0ma0O6KpF3C7em1+ZavavvHy58PwayyQc9NWhUW3TJ0+Z5w
         VMgj7atpd8NUMsA9E/uWuYJlHniwDFowRDT6ubnOWiGqkl4t8yuKgLbSk1qYwV744XyB
         Sivq6YtzTTZ88RIDg34h+/0ePumkHBwsWc1jiEjy7QEQ9+skBGFBtn1Y9adVD7un5CAB
         fn3w==
X-Gm-Message-State: AOJu0Yyro/3S3W49sbN82ZMMFks0CpW8coZqrZX+V3+xGcBwcR5Sc8dk
	oxxTFe+FUMPlgx9C2IFmR25I49Geawi78Mf4hKZErA==
X-Google-Smtp-Source: AGHT+IE4Sw1EMqZWlCGMEQON5wKpUeA80PjDQ9HXpK9CpaaOcNWbgwfVd+SZSvShOqPy2l1oBobriw==
X-Received: by 2002:aa7:c54f:0:b0:530:ccf7:37af with SMTP id s15-20020aa7c54f000000b00530ccf737afmr2043429edr.12.1695213427117;
        Wed, 20 Sep 2023 05:37:07 -0700 (PDT)
Received: from [172.20.101.114] (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id w7-20020aa7da47000000b0052e9b50dafdsm8831086eds.33.2023.09.20.05.37.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Sep 2023 05:37:06 -0700 (PDT)
Message-ID: <911a6f0e-73bd-aa24-1b03-dd38bef1deba@linaro.org>
Date: Wed, 20 Sep 2023 15:37:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v4 2/6] mtd: spi-nor: add Octal DTR support for Macronix
 flash
Content-Language: en-US
To: Jaime Liao <jaimeliao.tw@gmail.com>, linux-mtd@lists.infradead.org,
 pratyush@kernel.org, michael@walle.cc, miquel.raynal@bootlin.com
Cc: leoyu@mxic.com.tw, jaimeliao@mxic.com.tw
References: <20230908064304.27757-1-jaimeliao.tw@gmail.com>
 <20230908064304.27757-3-jaimeliao.tw@gmail.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230908064304.27757-3-jaimeliao.tw@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_053710_018008_7856CCD0 
X-CRM114-Status: GOOD (  13.40  )
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

Hi, Jaime,

On 08.09.2023 09:43, Jaime Liao wrote:
> From: JaimeLiao <jaimeliao@mxic.com.tw>
> 
> Create Macronix specify method for enable Octal DTR mode and
> set 20 dummy cycles to allow running at the maximum supported
> frequency for Macronix Octal flash.

You didn't answer my question. What happens when you specify 20 dummy
cycles, thus you configure the dummy cycles for the maximum flash speed,
but you program the flash to work on 1 MHz for example. Do you still
have reliable results?
> 
> Use number of dummy cycles which is parse by SFDP then convert
> it to bit pattern and set in CR2 register.

What we should do instead is to determine the flash speed at which the
flash is operated and then to set the correct number of dummy cycles
according to what the flash requires. There should be a table somewhere
in the datasheet that specify a required number of dummy cycles for a
particular frequency, isn't it? Yeah, see "9-3-1. Dummy Cycle and
Frequency Table (MHz)" of the mx66lm1g45g datasheet.

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
