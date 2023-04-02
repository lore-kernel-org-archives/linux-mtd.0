Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD430C77B6E
	for <linux-mtd@archiver.kernel.org>; Sun,  2 Apr 2023 10:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qBoiE4aazrDbJ7wU3vXPJLzHpPJT7yxo05ESNSoQW94=; b=EhZvxd3DAFGVu6
	viM4/3xlmEQi10lH0iTHNVjSC6cAEE6g3+m1CzYxp+mgtPMAEpdLmuUJAmOKz50abD6oI4fgkSIPK
	JpnOBBOQ9UvvUD2O4aPi5mEaR+lwHPadSS5B9KNbPOk95csG4xuLtm3AIRn9Vi1rclcDlWvMclEi9
	eyQu61/49dJOjx8gM4pGeRCbZOyahTmZ+own0aTK4a9xk/0jpB6h17ETfYJ++XU5Iu6tl6iYcqYol
	M/rk9f861zbZUN485XyCJtl+GT6IQOi5fmC/kYJHtXebKhfrmh/8C/lIcH9gJZV9SsvmvhIW1Mc8R
	wGx6EmcaAHzcWRouVs2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piunE-00CFBL-1u;
	Sun, 02 Apr 2023 10:18:36 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piunB-00CFAB-0p
	for linux-mtd@lists.infradead.org;
	Sun, 02 Apr 2023 10:18:34 +0000
Received: by mail-ed1-x52b.google.com with SMTP id ew6so106347651edb.7
        for <linux-mtd@lists.infradead.org>; Sun, 02 Apr 2023 03:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680430710;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5vbY+hH9xlDJ5JkvEylzYvLfmOyGSfk8lVRHgqhEHvY=;
        b=jt9PRfw5VQJUcClBuDD0yW3taPLHmIYTZT+hRzcnTsZeLzqTwOu592kOF52dyvMgmN
         jWia1f1dvudUnIMCqV/J9ddLPR4fuDVkJM/43X+6sdC0vLh4pkc4zEOBUy0H2h0enKHJ
         /IbIgWIWbuMI5DZwbCxvTn8TD3CPiLHME9Qjd/Pu15AtH27jrmtxex4QLF0fjsnN+1CZ
         TKvYD5ccYK1rb3AWi6KkV+vQnvdUd5CI87AS8JYq/dA76yknzmqbx5ErPLNiJgBKps2i
         0336/3xyzwLIt2xofO6kU6atVVguHVcQwncUdT2PkiUg+34YkOH58yJpOdEaK4T/dIl0
         pByw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680430710;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5vbY+hH9xlDJ5JkvEylzYvLfmOyGSfk8lVRHgqhEHvY=;
        b=G4/YPbVr5Nxpv9pk6nWOo7JcpYJywlPVj796hpM8EWtSUqSjG0d5lfVbnzm6FIM4+L
         JBWis9hcvBKD0miz1UazIodqUmaeSkCeq3/4f1ODDvD8JK200x2Q1+I1UudRtbItXQpC
         Jh/G+M9IxoIbqA2kisRO5eUKmplgo2G97KoixVcjVZqVDcqwtw6ZLXi2iy0z57o7NrQc
         etT/mJ2biIKrKIjDJdac8OMnKqYwepRXJNE6tZm7KTT1h15aoZLAxKSbSU4ZpdU/0OK2
         z0KKql7O2HccvS/1/CmAExoxmXZN54cMgtfDroMBsmWRyjWYtkaES9r8zvPefOvuDGdM
         UW0A==
X-Gm-Message-State: AAQBX9fa3VPjg9aTEizPqzaotOLEAUp1sx+Yhg7YKl+0sgaB3FdHDy6s
	yB5XRj8/sUvSTbQ1JFl43KSJYA==
X-Google-Smtp-Source: AKy350Z6IQ1DInGgJ1tkTuG1NeZ3Izk22lBovEOzygEIjFvMr1KmPSan8ScnFcJMV6jOJPTmKXwNWw==
X-Received: by 2002:aa7:c859:0:b0:4fb:78a0:eabe with SMTP id g25-20020aa7c859000000b004fb78a0eabemr32523704edt.14.1680430709888;
        Sun, 02 Apr 2023 03:18:29 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:7f7f:6a30:7a20:94d5? ([2a02:810d:15c0:828:7f7f:6a30:7a20:94d5])
        by smtp.gmail.com with ESMTPSA id 9-20020a508e09000000b00501dac14d7asm3129576edw.3.2023.04.02.03.18.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Apr 2023 03:18:29 -0700 (PDT)
Message-ID: <d79d35af-792d-4f42-03f0-37ff0abce461@linaro.org>
Date: Sun, 2 Apr 2023 12:18:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH RFC 04/20] dt-bindings: arm: oxnas: remove obsolete
 bindings
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
 <20230331-topic-oxnas-upstream-remove-v1-4-5bd58fd1dd1f@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230331-topic-oxnas-upstream-remove-v1-4-5bd58fd1dd1f@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230402_031833_356506_9842DFBA 
X-CRM114-Status: GOOD (  10.05  )
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
> OX810 and OX820 SoC and boards bindings.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
