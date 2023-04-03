Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A4BDC76196
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Apr 2023 18:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zIbkz4WxW7nmAeaMisAAa8YHE2qxa+eQw9Ib5YdztnI=; b=UyphX9rKIZNldh
	fyygCBKVe5RqySuaedsE4Z0gtZrIzvmFW6JKKdXObcKv0DZVqkRMTiT3fCl/rP2GhccsIWYvCIi6X
	V5I1rackt7LLxxTI7bieJyv8fnvvGKM9rd3auo2WkKw9z9UXLUCIMl3nZwO9xSoUVS6yjJr4d+wIx
	q/M8Vk24ROPE3bgs28ck0jiY6aUBC9riw6oVW/t/m/xQ+jgpxjFZsJTkjPzeVLECxJt+WJGtsBqG5
	M7Mrjfimmn0KR+b8DU9+4VAjAB0LzdoCx3Eh9g/SErvgr/SoBx+NMRGUf8qBwlAWmmC1w/McH/HOD
	ieZE1sduLp/BUqiSx4lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjP4J-00GFp3-3A;
	Mon, 03 Apr 2023 18:38:15 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjP4H-00GFn6-2R
	for linux-mtd@lists.infradead.org;
	Mon, 03 Apr 2023 18:38:15 +0000
Received: by mail-ed1-x533.google.com with SMTP id w9so121128315edc.3
        for <linux-mtd@lists.infradead.org>; Mon, 03 Apr 2023 11:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680547092;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CySdEehWspubmXAcFc/gUkZ6ALWiIO8Dims2v4pC7cI=;
        b=XxNS02hVI+u4D2pE7UGlx7ntA7oWIlCwkuRm3Gyu0E+L6ULQyC+6ShlqR4ekLzDFlT
         pRslLrKcSR/9KsmwaW7cNkZ4sBLMBrrx13XQF615coXajYG/D2tRgvu66pGLfEkrm/C8
         2A12Wh9pO54frQbFLcjovLAct7UkfQ9S1TjuUtOPvPyfN9wP6JUhxmt2lMVWqNnXPliV
         rx/sm1EdhuYRfJXOSQ0ApUnyqwfYJXx+sqa2wWwvgay1iMPZZRXTCENV4sZ6NYwUwRpY
         /YoYeDYiuIdE9FWPQg9xmmoXwmNDiV7gsagK762uIJSgjXuFP8gohz0DLGqClEWw0WV8
         4NmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680547092;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CySdEehWspubmXAcFc/gUkZ6ALWiIO8Dims2v4pC7cI=;
        b=0m837KUioiXvXcNVGbEDHOzK87YXRP2cZuciFMcHKcJP6wjGqN9+Wd56dmhcg/CuS1
         Bj6wMspy9e6+NckQrc19bxHS9q4wRKGeQbrxYHnhqf1K/hCmT2Pz+P5ZxDoug4FlWom6
         YRsgwJD2MF8hzRZR0G3xwiL7SkzWTVXEo7vMAqbn63KAHLXQTm1KEPd7Vhz6zhynBxj1
         EEiPqV8rQ118uJgop1QLb0Ft4QDSUAIIokcm814UwAKbk8zzOHdkmfQtzWHBQx7QqW1Y
         qYMcfUzwd1Nd+R/z47po4V14Uzj2q5xvFyyY5vT5ExBGOIfXu8ZXnTEhz74o/+cKsVbG
         qiww==
X-Gm-Message-State: AAQBX9feI4eHKahNqDKjKMrM9l1VICA+sQjsTp9vQCl4YwxbBSt6XmvL
	UgPAQzRdejQCskxdDsM1XLiUGw==
X-Google-Smtp-Source: AKy350a21SUvVW8zkI0jUgi5Fki72Pdn7B89a65yFrUkCNuucXQuzP/aqKcsR7vvEISiRfXbpBAEfA==
X-Received: by 2002:a17:907:8c83:b0:939:a610:fc32 with SMTP id td3-20020a1709078c8300b00939a610fc32mr38202123ejc.53.1680547092335;
        Mon, 03 Apr 2023 11:38:12 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:ae90:d80:1069:4805? ([2a02:810d:15c0:828:ae90:d80:1069:4805])
        by smtp.gmail.com with ESMTPSA id t17-20020a1709060c5100b00927341bf69dsm4868907ejf.88.2023.04.03.11.38.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Apr 2023 11:38:11 -0700 (PDT)
Message-ID: <ac0a61cc-942e-191a-76f2-855b482247ff@linaro.org>
Date: Mon, 3 Apr 2023 20:38:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH RFC 14/20] dt-bindings: pinctrl: oxnas,pinctrl: remove
 obsolete bindings
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>, Arnd Bergmann
 <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Russell King <linux@armlinux.org.uk>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Sebastian Reichel <sre@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-mtd@lists.infradead.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-gpio@vger.kernel.org,
 linux-pm@vger.kernel.org
References: <20230331-topic-oxnas-upstream-remove-v1-0-5bd58fd1dd1f@linaro.org>
 <20230331-topic-oxnas-upstream-remove-v1-14-5bd58fd1dd1f@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230331-topic-oxnas-upstream-remove-v1-14-5bd58fd1dd1f@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_113813_821925_DAF3D74E 
X-CRM114-Status: GOOD (  10.76  )
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

On 31/03/2023 10:34, Neil Armstrong wrote:
> Due to lack of maintainance and stall of development for a few years now,
> and since no new features will ever be added upstream, remove the
> OX810 and OX820 pinctrl bindings.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../devicetree/bindings/pinctrl/oxnas,pinctrl.txt  | 56 -------------


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
