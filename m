Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B479C4332F
	for <linux-mtd@archiver.kernel.org>; Sun, 27 Nov 2022 21:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CIdOUzBD1esIgkrDmgiXo7SZv2UT8GPfFg1zg1WMUO8=; b=tQ0xPDxVY5Cb9N
	XkpcDr2R6CMWhpB5GvS5fP5EEk9ZB8p3TwBV8IK4rGBwIQpbdPUljhbsbZ5cqeUOo3u7H2P1Wdiik
	eOSshbOTwwIByPS8fp5XZ7uVcj9bf4JF9aXxzo0HC6t5MkGbp9OvlX3uB8fiqVxeoLS5XuKlQ3OHk
	h0SU4/bLOXfdq4hVKychPXgBXfA+JxmBZutHRiLBKnQ0xp9HOFG6EfNMaNPOftCJYnfHOcj4H0N5z
	q7BGk0xDDFdqc+f/dNQ5q0vmkbFQNCa1vqSlV6TKGcHcfG8iXkSIgMD8pYPH+MqehIHW9jdGMFuPL
	mJCNRGMhra52VFdFNp5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozPF5-00Dl46-5e; Sun, 27 Nov 2022 21:31:15 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozPF2-00Dl3S-Qf
	for linux-mtd@lists.infradead.org; Sun, 27 Nov 2022 21:31:14 +0000
Received: by mail-lf1-x12f.google.com with SMTP id s8so14653713lfc.8
        for <linux-mtd@lists.infradead.org>; Sun, 27 Nov 2022 13:31:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ndDeJnwqwm6kB/SvuGOk72RxjCShlDfHw9rgdIIiqSk=;
        b=EuAuC8BbkcdgJ5SyNzJRzWwgYCO5UrN5YEqYhJEOVMuZr1vIQJP0q1RCT7V5YM+CQc
         Y6alRc8MMyz8cYcKzelO/z6ir8mqQJk3blNG6CivDOYDpBIAdm1/+NEmdgERutxdapoI
         V7ZvYC7laLh8rOtDencox4G3xjlH3JaQnvRM7Ec7cfQVX6W/KwGGkGzU5UVb3ndQLKrK
         yM6Gg1IQXpHDAP22mToVn3vRuRZ91sz4VnR71VlA33GpKIPtStBMyfvkLUuOS8qaKGBX
         YfJv5hSz7XCOC7i4WPWonMgH3XqA6Fy3BLisp1454vpdrBqkVozGjNGkHl+B0dLioKT2
         +4jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ndDeJnwqwm6kB/SvuGOk72RxjCShlDfHw9rgdIIiqSk=;
        b=GUBW6RV2xWj0lmuaZ0oDwUWI9RrCg49hQxO1kkIIF4R/7eAI2L/6030kfhc2wlmOH2
         ku8H2otEs5SqvSkkIx516xJSqD9f4AwSUFFeSCWAm9w+1Z0cQ4c+no2UEutIX7jWlhGL
         0eTP17qJHP5Jn68CmT5U+sJwZHpDdKMyr7SBXkxS+rsb8xtrTCi3ZjkMEWXA8wZOfSR8
         e2Lq0OHX1FcpcuUv7REw8BDiYa0hkyEw9oTvbkHxBhBo1CwuteTBx1GpJyz5mpNoGb/n
         oBPwhyPce4QXbw2QrgTJOpOpP8YR6AVjRvrk8z2EyrVXEJKhq1LHu5o6aT7AZ3/xhVLh
         S6mw==
X-Gm-Message-State: ANoB5plBGESHanqopUMXnIad6SS7kFXKULkeElYgLo/aYBj2XhFR/dfa
	G3vN8mpENCiqUApPpsO2m5Or3A==
X-Google-Smtp-Source: AA0mqf5E84tiZKaMJsIeWFfqdi2kx/96mWE5cGhi/qRQc/2OJSAzW83D9xwrn7zjEmIUpuQDSdbrGQ==
X-Received: by 2002:ac2:58d7:0:b0:4b4:fbce:606b with SMTP id u23-20020ac258d7000000b004b4fbce606bmr4682991lfo.27.1669584671052;
        Sun, 27 Nov 2022 13:31:11 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id r13-20020ac252ad000000b004b49025f96dsm1421692lfm.187.2022.11.27.13.31.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Nov 2022 13:31:10 -0800 (PST)
Message-ID: <b500e42c-f782-79c6-70ce-650e4ea32c54@linaro.org>
Date: Sun, 27 Nov 2022 22:31:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 0/6] memory: renesas-rpc-if: Rebind fixes and misc
 cleanups
Content-Language: en-US
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Mark Brown <broonie@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
 Sergey Shtylyov <s.shtylyov@omp.ru>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <cover.1669213027.git.geert+renesas@glider.be>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <cover.1669213027.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221127_133112_894031_39D9614B 
X-CRM114-Status: UNSURE (   9.96  )
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

On 23/11/2022 15:41, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> The Renesas RPC-IF provides either HyperFlash or SPI host access.
> To handle this, three drivers are used:
>   1. The RPC-IF core diver,
>   2. An HyperFlash child driver,
>   3. An SPI child driver.
> 

Thank you for the patch.
It is too late in the cycle for me to pick it up. I will take it after
the merge window.


Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
