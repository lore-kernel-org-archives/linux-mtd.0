Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11678C76196
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Apr 2023 18:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Z+tXBWIxhY8h+BKwkH4afFbnxpT4If13H//OkkgT+0=; b=iq3BiQa8pb8ER/
	yLwR04aog6bXzT+UeWioAeGZqdMVBililABXp/sR+gMtdP6b8ePqsxApQ2IaztkKyKpA77FmDILSY
	U4E78yaa/H3tTovlD7x+eH1JQGUvXa1MJnEhPP+JVIcRlizbRrjvNhmSEXXVUmgTGajlcxLoksA7F
	I/bxInQy5WBzpmOzFlc2LQHdUnHUPhChg2P4O+OZMIs8UYwEqmqyqYbJOfF3Gu5BAd06M57ggRANM
	/Xp0tsoMT8HAe858SaA+3AvohZ91Op5XLCXhq/3Kpd/Z4iRLz6JUoJu/shVFOWvf8lcWFyzgMyPAl
	8iXEJy2WdPoXXjTahTZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjP3v-00GFdz-2l;
	Mon, 03 Apr 2023 18:37:51 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjP3s-00GFb7-2N
	for linux-mtd@lists.infradead.org;
	Mon, 03 Apr 2023 18:37:50 +0000
Received: by mail-ed1-x529.google.com with SMTP id i5so121298463eda.0
        for <linux-mtd@lists.infradead.org>; Mon, 03 Apr 2023 11:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680547064;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=woHQBzslpxQn8sWqqC0TN46wIMWpqjyxk4syqknSbnU=;
        b=bFvBbagm8aL0eG1WpkUMpZ7aBLUx6PKp4lseK3TKYNSJLKFTvbdAL/UOpVLQNG7W80
         6+T9nAIO+CFbrpm+FWmXGLv3iRlsx77POHfwFU7a9hg24cauINgniJsEiBKhlm45+9Zt
         jdiSe4FQmK1ZDt9moJ7wCgte6na7VoYwXmxWvsdvyoUvAbqvjIPbDOZoIrfa+thb2oen
         pJKuwQuT1MPNg+BYN/L+ZUa0yIcZL3V7ad9X2JSCYn+GbtBET4ExYrhzv/dGLWNKMrX0
         aY8Wq8zP6tmnwHk2JvG3m5+v2BlZ5wTQPHX9GIHg7/lCDDWcpU5ePfRmEIyP882gWeQr
         nULA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680547064;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=woHQBzslpxQn8sWqqC0TN46wIMWpqjyxk4syqknSbnU=;
        b=OqAR8JD2c2w2Lm/HOKDpxbntvNkSnuBlvR94+n9z+UusqlASHECm081JX01ZCvHpiO
         +7e4d+iKj6U9UWO1zHKXXpOI5Rt8NBPh99VosYYV8eAauC4Vmf5vrcL9dCqgd5ZoboJu
         MVt1av8+0nMrgVHXcjKVWhHTTHi33zjEpyuQU529pCyAYdIe7r8IHjwYW/qwfRhDOrH9
         w6xz5jF/P47TrmE5XVA79j1E03OI92ZF2PhQ4YThyNbOZmJBKHbE6uBXx+NtfZsO/1Kb
         BtiZXB2uoT0yJa4lV+oc4gYJoFGMAUZRhZ+ZGf96EUvoLiEQjRCLymrISJ+H2jYkm9Bk
         xAlw==
X-Gm-Message-State: AAQBX9eWGCZsbSYJLl6JEPoqFkI9K7rWpw1EOMVaYhdWKTD3sJQoVxsV
	RIovPKrlSKfhRUUcHovAWwxwcw==
X-Google-Smtp-Source: AKy350aGwqQCodZpb/gzcGe1S8OGxNbhVHt1iC2+Dk0P5OGvd+2PK7IQlx/UQ3iZewsFT9iUWIorCA==
X-Received: by 2002:a17:906:1c19:b0:92b:f118:ef32 with SMTP id k25-20020a1709061c1900b0092bf118ef32mr36754487ejg.48.1680547064210;
        Mon, 03 Apr 2023 11:37:44 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:ae90:d80:1069:4805? ([2a02:810d:15c0:828:ae90:d80:1069:4805])
        by smtp.gmail.com with ESMTPSA id b17-20020a170906491100b008e57b5e0ce9sm4826642ejq.108.2023.04.03.11.37.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Apr 2023 11:37:43 -0700 (PDT)
Message-ID: <ba5cf9c5-50b2-b31b-eba4-d22eda2de0f3@linaro.org>
Date: Mon, 3 Apr 2023 20:37:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH RFC 19/20] dt-bindings: interrupt-controller:
 arm,versatile-fpga-irq: mark oxnas compatible as deprecated
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
 <20230331-topic-oxnas-upstream-remove-v1-19-5bd58fd1dd1f@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230331-topic-oxnas-upstream-remove-v1-19-5bd58fd1dd1f@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_113748_769685_47E935F7 
X-CRM114-Status: GOOD (  10.09  )
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
> and since no new features will ever be added upstream, mark the
> OX810 and OX820 IRQ compatible as deprecated.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
