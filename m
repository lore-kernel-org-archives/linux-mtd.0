Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AFC0C7619A
	for <linux-mtd@archiver.kernel.org>; Sun,  2 Apr 2023 10:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0NOCx0jQKhWREGHYC1yUZscqW52Y6vgBMrFGYgj1Jpk=; b=1odNblvn2kB7iW
	DI1Mr1COAUoyVrnY3jOnW1+KvrqLHEHTrjRnnF73zeKfAvaKbi1hQU+mkitqRu5wXAv3c9eq9MLui
	54K/rHfxBc+vXPjUnsS96SSidDHRr1XD7qRx8yKr1/tHyWtVN4fWMuJqAi36Lfz4J8vHwkfpHwRn3
	zvSty6w0QYrivuWpbuKvSyzY+NbxGrNcYnLvYfj12NpCKF6d1hyvAr/XMQpo0LJKsc3YBPMDDRRcu
	P0Q6+HgiDgfp0mj/336eA1slZwk40kTM2HnlsDnRlskte/2g3Sn0XdSNcZhOkoB/cBCUrRd4Xfoni
	P/0D4+sAvOet/N/hiUOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piuq3-00CGBi-0W;
	Sun, 02 Apr 2023 10:21:31 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piupz-00CGAF-24
	for linux-mtd@lists.infradead.org;
	Sun, 02 Apr 2023 10:21:28 +0000
Received: by mail-ed1-x52c.google.com with SMTP id x3so106342583edb.10
        for <linux-mtd@lists.infradead.org>; Sun, 02 Apr 2023 03:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680430886;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0dHtm6rEwdmIURaK6uwg13/SivrIWW9+hRVkQN5p4kM=;
        b=hWRZFnUzy/AO/MrrHGptqieSYv8r5ivl++6jYZxkWvmMxEye8miSsugXiCJBi5sqvL
         s719hTzx6xAsRH6O+8+R9ZEN4ZJOlMD6r2NdJ32bzEnaZmYynk5Oc2nlmJmRHXdUSkfQ
         qsbxUVvKFP7ACEIsS4RBi2a3SONFntKaxPE5/QMz4WxQD3+uAHQJO6pFs4XTeMC3pSGT
         onjtT+bDjrtAZx9GKQ5NBHQZEDwIaZRLJaOvD/2SIFP+Dhx0u02i4Uvx3y4spp4V8PRL
         g2AylIyMAALt7BOVeMXKB/5gE8oSD9J36tN636+e0ps1uHv2/DxBdfi/DCpIQ6LBfhEC
         B+Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680430886;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0dHtm6rEwdmIURaK6uwg13/SivrIWW9+hRVkQN5p4kM=;
        b=AYQECw5AoPct0tg0+2QR/K4UK8va9gnk9xbGFy3SThVbx3uw8gEBpdtRHuuqZoZC7A
         M7vi5eJdqHVzOpL1CxwqOyvefjCaRlLmSycC0V4SrQfKC5VL8McDDyDdfQnyJ7s26Ryw
         N1DdKzuM+kISB0y8p4wWMsiNKAm4NgIIHwkH5FZg067saBFfEzFZZOSbRkBXTsXv9yKb
         spmWG1lkinh7C+nIAZiR8eADcm/O/G/29Dz2Za5X7SNT30gfxXwb+hPfm+on6hxKjgyp
         GcMZSynhnM18rFSC/NL0uMzbFphaC+Pj7fMwWKNvQz/GZ+p+fzdRbkuyDiHIe0kuFgPj
         HNTg==
X-Gm-Message-State: AAQBX9cNf7U81n9/JmfUeM9PjAXjR2q6lnbiSwJjgvUOS4WM8IJFaE4X
	G2rYEBlPXyI7h/Ur7Q265oVbjg==
X-Google-Smtp-Source: AKy350b7C1SmwO8vWgBCIzK+/qLm6HfLt8cxKJ4Flko7Ti/4JiMy1EgB0vrkdSSZLLB43zm7wiLJkQ==
X-Received: by 2002:a17:906:3da:b0:931:95a1:a05a with SMTP id c26-20020a17090603da00b0093195a1a05amr33727013eja.62.1680430885727;
        Sun, 02 Apr 2023 03:21:25 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:7f7f:6a30:7a20:94d5? ([2a02:810d:15c0:828:7f7f:6a30:7a20:94d5])
        by smtp.gmail.com with ESMTPSA id cw1-20020a170906c78100b0093de5b42856sm3055582ejb.119.2023.04.02.03.21.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Apr 2023 03:21:25 -0700 (PDT)
Message-ID: <b207a77f-18ac-0da5-e95f-bd38fc1f0d11@linaro.org>
Date: Sun, 2 Apr 2023 12:21:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH RFC 01/20] ARM: dts: oxnas: remove obsolete device tree
 files
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
 <20230331-topic-oxnas-upstream-remove-v1-1-5bd58fd1dd1f@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230331-topic-oxnas-upstream-remove-v1-1-5bd58fd1dd1f@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230402_032127_679649_80B03FA5 
X-CRM114-Status: GOOD (  11.70  )
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
> and since no new features will ever be added upstream, remove support
> for OX810 and OX820 devices.

Lack of development and new features are not really a reasons for
platform removal. Platform can stay in decent shape for many years,
without new features.

Lack of maintenance could be a reason, but first we usually make
platform orphaned to give community a chance. The best reason is lack of
users and any relevance, but your commit msg does not focus on that.

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
