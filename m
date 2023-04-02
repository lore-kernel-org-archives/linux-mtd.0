Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FCBCC77B6D
	for <linux-mtd@archiver.kernel.org>; Sun,  2 Apr 2023 10:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2j5ueu1JJ2fD4n2//wmELAu7IvyZGjWm4yl7t/VsLU8=; b=5FCPHlXv3dXPe3
	x+zGpQZZ0DrqaLWaP0T8M1X+yKbursywgz9byZHe4y+6apq3eOmR7Xyl20908JaCEg2yTh0EEvSNQ
	+DSzoJxssC0tba9kTl3MTtEfQVeECAr3yQYp85kWgMXmAtvP58gYnDfVJ4RZBMhvmLjSuuhqMs8gm
	xFxBy60t+xM8OUxbYzw24xrkCIys1W7HM2YLOUEUqExDMDVg9urB7jkRzN6DFACcIec8zVY8EkPr0
	QROnCinin0cMjtr2sAVe+eSAVfPUl8VMOcgtKt7NFu72udn2BC/Vvk5HmIWLPxJbIweT6tNYnIjQQ
	Vp6nS3R+jeE8bXfpDF5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piunZ-00CFGi-0h;
	Sun, 02 Apr 2023 10:18:57 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piunJ-00CFBk-0o
	for linux-mtd@lists.infradead.org;
	Sun, 02 Apr 2023 10:18:54 +0000
Received: by mail-ed1-x532.google.com with SMTP id ek18so106462790edb.6
        for <linux-mtd@lists.infradead.org>; Sun, 02 Apr 2023 03:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680430718;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sN4W0uppG11n4amgZQQ3mpLKRvCRZOSROsn8m2Kimkg=;
        b=jb+VJPdBqQST71dfQdR2PxUbmb8b02IKUIK2Nl00BYhPfKddUdEroPOVgXh5zH8cjW
         hT3PIhI0fncDCliWCt7mzQiKdfPcLIS9NpPFlqPg1wjloSsgZglYv2g9tXo6sXxlVhpv
         F1ZxTeu+g4yT8WAUGbizJsWrfQrI9Ck6M6ajArriv3d6TMFBfAupw95heEeutndZ2eZM
         h7A5KKcasAdAz3+zklThNj3h5nGmdqSI0jnHZBDxGlLh4Vag+yZ6jWlRe3RHzdps3aMZ
         WiXHL8dsKu+q+NaWMu12ZNa5se19Hb8+i3pVJXYsDDqt35BrNpNdRiqQWoBscwibJq3L
         w5tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680430718;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sN4W0uppG11n4amgZQQ3mpLKRvCRZOSROsn8m2Kimkg=;
        b=CmL73DiRfjtlRB57gDZPnzoAc45RbQoLwEIcm0TambNpXhTFHrHSpRqcRyo7GaWBxA
         OcLTrXPndaJZd5XBFuWj/F04W94y13BN9VM3lMLVTSP3ZjDRdpquVzlJO0YFEPSY7pSx
         3cRNbfsFGgDK9oDqVz6xJqMLKdLQkujPfS074Xf5ipddlyG2LQSYIgLQkR+rDlQqkxuW
         8jGfFvJBiWbwbOdsXrU03So/0jqvLuH2vIiJUxpqIjljMAZnWMCykxVtuOiMmW1/qtr7
         a1ytFIviP5VGlHE2vngE73loPTkJXHg2vjXBQ0ciD/EYwrFZ8y1HfQW4+uwFyaFG8uig
         fMqA==
X-Gm-Message-State: AAQBX9cqlNWgo6KtpvH8Y/NlJmkSa1XzkjVNviIzhISBKquk1uJYcm0i
	7XCB4ZTvaA1bEmyFfJyDFktpMg==
X-Google-Smtp-Source: AKy350bl5AI/ffJhjWXPUZDpoMYhYVGYbPhasRbUNkSaaqKcK5VPx7QaTdan03JTQnaAu7+DbiZjzw==
X-Received: by 2002:a17:907:744:b0:946:fa68:1a91 with SMTP id xc4-20020a170907074400b00946fa681a91mr17736295ejb.75.1680430718427;
        Sun, 02 Apr 2023 03:18:38 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:7f7f:6a30:7a20:94d5? ([2a02:810d:15c0:828:7f7f:6a30:7a20:94d5])
        by smtp.gmail.com with ESMTPSA id h3-20020a1709067cc300b0094776b4ef04sm3145749ejp.10.2023.04.02.03.18.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Apr 2023 03:18:38 -0700 (PDT)
Message-ID: <2c7e2f62-9f0e-3be4-0da2-e0cb89a197dc@linaro.org>
Date: Sun, 2 Apr 2023 12:18:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH RFC 06/20] dt-bindings: clk: oxnas: remove obsolete
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
 <20230331-topic-oxnas-upstream-remove-v1-6-5bd58fd1dd1f@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230331-topic-oxnas-upstream-remove-v1-6-5bd58fd1dd1f@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230402_031845_320928_6A430C75 
X-CRM114-Status: UNSURE (   9.94  )
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

On 31/03/2023 10:34, Neil Armstrong wrote:
> Due to lack of maintainance and stall of development for a few years now,
> and since no new features will ever be added upstream, remove the
> OX810 and OX820 clock bindings.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
