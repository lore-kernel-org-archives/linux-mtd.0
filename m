Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1F79C76196
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Mar 2023 14:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xw8b7u6iPQkU4Tx1o8KdG6adOqFUp1KGodztwb6yucY=; b=AIkJTWH8IC4KqS7GQ/CMU9aBF5
	bkkZFBRNYtt4/hM1xeovMkOBA1woBH0EaJ+8aK2k4JSgurIZBcjsFgguLtSZ7J6xayWknkY2p9uwT
	zan0SxSR2NSg7jDeMIroF2xAm7FUA7P63LdQSv2YTQ9wZ1UoCLeFZUJkeRYuAd4XFck7hVUGMhcOo
	zeorhY8KPCh3HI2YsP79ulQT3Q5FwUy24eZng9dRYx9JgePksVbfNckpMN4/7Exdrcvyz4uNK4YoI
	VbBYxGy3Ka/yky9MbVKkGm0GSjJq3AyHKg1oh2oa0qmbC7ifaTpAA/h63sDiws6iqCd8IEygI4G1c
	lBWGeO0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piGBt-007obm-1L;
	Fri, 31 Mar 2023 14:57:21 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piGBm-007oZU-3C
	for linux-mtd@lists.infradead.org;
	Fri, 31 Mar 2023 14:57:18 +0000
Received: by mail-wr1-x429.google.com with SMTP id l12so22695519wrm.10
        for <linux-mtd@lists.infradead.org>; Fri, 31 Mar 2023 07:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680274631;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=X2dQ+lYOZmXZreHzCA27SPymWQu74XpJ9AsKWsdeeL4=;
        b=LxMr8btqIWpZVBhNCuG3Pv8bToCfJWDTdR7+mR8mGHozcnAnNX8W0cDET2uL7CaGs9
         5e93/RuXqDOnGQEs4AERzNy/Qogvh1lNEl5m/Bf/swKpLDINZWZrVcg2ZaNJuQJxTI3k
         scrF3ioZ8uoXF7zeOPiJ/wP8xdLa/F/5qp3ahGdIGZuPJ7thH6JA/9PSgY4cV1Egc6BI
         O1Rz6S+5Em4dXlsXilZs5u99e4DEWL7+4xEEyTpHsjLqG+DWWc96/933gCmUjtvMCuis
         cNHHsNXvDWRcx4rsOJaAwffsHJR3LJLod1tAvHB9N9onT9OneeyP7ioLARMZpPHqlTA4
         cJqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680274631;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X2dQ+lYOZmXZreHzCA27SPymWQu74XpJ9AsKWsdeeL4=;
        b=lHCkhdfcQ+uIgqMui+ViA5oEyk0GAKaaoEGeYtVI9TSlYRu/RVogbpFnERzpq0FQ5m
         BkK9dlclTxEFgWPf2+lVq1jg7GUTYdcj9+GgA4gUkwlqUSIv5OJ0+8oaKD+xjzJK/q6F
         y0HTjIA5JAITQijvXMxhecMn0di1KKNyBjreK/LT7u61yCqDbOXS4+VzNB3iDvSj/rCs
         oQJI6/TtmtoptSieavA+XL8B/Cbl+VK3f7Tdl1PUIT4Nl1yolWtBnMMt1m7LKHtruUjf
         v8BH6xj3twTCyPOCP2I/3CkBD1cauSLFHQuSLxOLvxaCqcPAMWSuFdYi5Or4l7kawDWh
         i+Bw==
X-Gm-Message-State: AAQBX9eGX9Z90dWWteX16dvnIqCOJWBWkzHbPKhgW64JwsFh0h/+K6Xe
	X4ZW5lkj5kcjpPnjRjpQo3E9rw==
X-Google-Smtp-Source: AKy350ZhM7TlzzbkKQh+f2qjf5R7dBolMimYX1XKzO4RjCFaq7KCOpO3n90LcpUgFdpKCsl7ogNfUw==
X-Received: by 2002:a5d:4409:0:b0:2cf:e422:e28c with SMTP id z9-20020a5d4409000000b002cfe422e28cmr18329961wrq.42.1680274631125;
        Fri, 31 Mar 2023 07:57:11 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:74cb:1a96:c994:e7e0? ([2a01:e0a:982:cbb0:74cb:1a96:c994:e7e0])
        by smtp.gmail.com with ESMTPSA id b12-20020a5d4d8c000000b002e51195a3e2sm2392687wru.79.2023.03.31.07.57.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Mar 2023 07:57:10 -0700 (PDT)
Message-ID: <23e513ad-9fca-30cd-1f08-2ff559072314@linaro.org>
Date: Fri, 31 Mar 2023 16:57:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RFC 00/20] ARM: oxnas support removal
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Russell King <linux@armlinux.org.uk>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Sebastian Reichel <sre@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-mtd@lists.infradead.org, Netdev <netdev@vger.kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-pm@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>
References: <20230331-topic-oxnas-upstream-remove-v1-0-5bd58fd1dd1f@linaro.org>
 <df218abb-fa83-49d2-baf5-557b83b33670@app.fastmail.com>
Organization: Linaro Developer Services
In-Reply-To: <df218abb-fa83-49d2-baf5-557b83b33670@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_075715_040826_B96BB55A 
X-CRM114-Status: GOOD (  32.47  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 31/03/2023 15:42, Arnd Bergmann wrote:
> On Fri, Mar 31, 2023, at 10:34, Neil Armstrong wrote:
>> With [1] removing MPCore SMP support, this makes the OX820 barely usable,
>> associated with a clear lack of maintainance, development and migration to
>> dt-schema it's clear that Linux support for OX810 and OX820 should be removed.
>>
>> In addition, the OX810 hasn't been booted for years and isn't even present
>> in an ARM config file.
>>
>> For the OX820, lack of USB and SATA support makes the platform not usable
>> in the current Linux support and relies on off-tree drivers hacked from the
>> vendor (defunct for years) sources.
>>
>> The last users are in the OpenWRT distribution, and today's removal means
>> support will still be in stable 6.1 LTS kernel until end of 2026.
>>
>> If someone wants to take over the development even with lack of SMP, I'll
>> be happy to hand off maintainance.
>>
>> The plan is to apply the first 4 patches first, then the drivers
>> followed by bindings. Finally the MAINTAINANCE entry can be removed.
>>
>> I'm not sure about the process of bindings removal, but perhaps the bindings
>> should be marked as deprecated first then removed later on ?
>>
>> It has been a fun time adding support for this architecture, but it's time
>> to get over!
>>
>> Patch 2 obviously depends on [1].
>>
>> [1] https://lore.kernel.org/all/20230327121317.4081816-1-arnd@kernel.org/
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> 
> Thanks a lot for going through this and preparing the patches!
> 
> I've discussed this with Daniel Golle on the OpenWRT channel as well,
> and he indicated that the timing is probably fine here, as there are
> already close to zero downloads for oxnas builds, and the 6.1 kernel
> will only be part of a release in 2024.
> 
> For the dependency on my other patch, I'd suggest you instead
> remove the SMP files here as well, which means we can merge either
> part independently based on just 6.3-rc. I can do that change
> myself by picking up patches 1-4 of your RFC series, or maybe you
> can send resend them after rebase to 6.3-rc1.

Ack I'll send patches 1-4 rebased on v6.3-rc1 with the acks
and sent a PR next week.

> 
> For the driver removals, I think we can merge those at the same
> time as the platform removal since there are no shared header files
> that would cause build time regressions and there are no runtime
> regressions other than breaking the platform itself. Maybe
> just send the driver removal separately to the subsystem
> maintainers with my
> 
> Acked-by: Arnd Bergmann <arnd@arndb.de>

Thanks, I'll submit those individually once the first patches are merged.

Neil

> 
>       Arnd


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
