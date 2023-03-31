Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58EFCC761AF
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Mar 2023 14:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qc9oUsYD1+rj6oIViUI9vmwK1mZgogYe8ju9IANpAC0=; b=mjp78u8jJI8HuQ8i3dzjwaeM8T
	y26sC7MKcAQIkJKZrXspY6UpXyXBRrN/iHXyK5Z8TXTuLJZ8le7+POnauwS0hHIC5LOAEMtkiGtjN
	wm56vMfdbg/DV8LrU6FW0Ou5BWS47NvIhCjzLOzig60oc/qxB31s+gThAdUkXgDugU3/JVsLO3yQP
	+WPNAsJdrh+6uVu8ojEM++m5n0QZlu0bWjB5sCD/ZHJkfPZzQLbtsq1+7AOJih5A0aQW6DvKALazp
	3kmB0bRgJbLFYhuz/PRcFsFCVIHR96RTPAHCa5vxp9U3tkbCOkp4sQSTNalJ6t4qRMKbRp3bvYUGA
	GNSAo0AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piGDi-007p1b-1k;
	Fri, 31 Mar 2023 14:59:14 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piGDZ-007oyS-10
	for linux-mtd@lists.infradead.org;
	Fri, 31 Mar 2023 14:59:07 +0000
Received: by mail-wm1-x333.google.com with SMTP id o32so13056115wms.1
        for <linux-mtd@lists.infradead.org>; Fri, 31 Mar 2023 07:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680274741;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vnlFqaagyiGC/yxykb+LPtjAztaRZkdyq0QplfwjoFU=;
        b=nF3sjGDQMAa+9jHsKfcp2XyDYlHpo2KuexE8K8B4AEt9/p0IObEDWv2CgD5R/nHOZs
         LKrnCyin/QS2zaGGOJyMPMc9pDYbfs+wygN0GlXYN79Pk627UpehAwFW+43cDdVYZ3h5
         EKqyUv3wk56Nyvg2r5e0GliVdi+B8N8eRMEu7xCrjLBQFnSstXL2oVvoMkrtv/dveeiO
         F37ewmOOr6JQO4KPhRRQmgyaI7I1mqSfqTqfRB3WByalYZ5HZ8FovnO1iw6OQz1VY4oN
         KGrF+QS+fO8qgq6jFJlJv0L9G9eYlEl0jj7QZM7zsAaCtqPH4+v4I5ncnoa+EWF86CHG
         DKmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680274741;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vnlFqaagyiGC/yxykb+LPtjAztaRZkdyq0QplfwjoFU=;
        b=agnUwJEc75MePQAGODikS2RcZxBBtJkiT/JeOYtuZhpsOT+oC8vSCTWje3RmcKvDdp
         LKbWqZf/jwSUimaZXU/ZQzEXvW6njydCbaM4S23crHHKcYddmOuYGVFjRLHLFNOsCwVw
         E4GfYjBont2LREFHSDjG6245EPL2/s9tPHx3tsLzzSCtMaQVInIlw5YqsIjSif2/tX6H
         TtVp8G4XvPZCGdOVXAsYOzoTq/LsXijC+P0e3twnKiDHwRIvl2fChY4m4R0KXtGcNmEn
         +RMeY3tSKslIqP1ke4ro6tti/xXRySV8krgSfZIuu5SJBZYppLAwilAmeQxF+aLb1VAs
         nqag==
X-Gm-Message-State: AO0yUKXTf/q0MfOHEDq+zG4vts+9t1vhPrawnLn+QVfii3P3nT4z42ED
	qihuQaK0Eb/D3MejHXNJkQql7g==
X-Google-Smtp-Source: AK7set/StNy++vH3rTk//CEKOWCplvO4ynmJaY373xQJNztEOfuyKCvvX4OAZ8I7XwRimDvrMK7WOA==
X-Received: by 2002:a7b:c8c3:0:b0:3ed:711c:e8fe with SMTP id f3-20020a7bc8c3000000b003ed711ce8femr23315255wml.2.1680274741435;
        Fri, 31 Mar 2023 07:59:01 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:74cb:1a96:c994:e7e0? ([2a01:e0a:982:cbb0:74cb:1a96:c994:e7e0])
        by smtp.gmail.com with ESMTPSA id iv19-20020a05600c549300b003ef69873cf1sm10363016wmb.40.2023.03.31.07.58.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Mar 2023 07:59:01 -0700 (PDT)
Message-ID: <22bac350-0a2f-48df-c8b3-6d915a830caa@linaro.org>
Date: Fri, 31 Mar 2023 16:58:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RFC 00/20] ARM: oxnas support removal
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Olof Johansson <olof@lixom.net>, soc@kernel.org,
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
 Jose Abreu <joabreu@synopsys.com>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Sebastian Reichel <sre@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Marc Zyngier <maz@kernel.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-mtd@lists.infradead.org, Netdev <netdev@vger.kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-pm@vger.kernel.org
References: <20230331-topic-oxnas-upstream-remove-v1-0-5bd58fd1dd1f@linaro.org>
 <df218abb-fa83-49d2-baf5-557b83b33670@app.fastmail.com>
 <ZCblCsKMHYDZI-H9@makrotopia.org>
Organization: Linaro Developer Services
In-Reply-To: <ZCblCsKMHYDZI-H9@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_075905_352879_596EB625 
X-CRM114-Status: GOOD (  25.79  )
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

Hi Daniel,

On 31/03/2023 15:50, Daniel Golle wrote:
> On Fri, Mar 31, 2023 at 03:42:15PM +0200, Arnd Bergmann wrote:
>> On Fri, Mar 31, 2023, at 10:34, Neil Armstrong wrote:
>>> With [1] removing MPCore SMP support, this makes the OX820 barely usable,
>>> associated with a clear lack of maintainance, development and migration to
>>> dt-schema it's clear that Linux support for OX810 and OX820 should be removed.
>>>
>>> In addition, the OX810 hasn't been booted for years and isn't even present
>>> in an ARM config file.
>>>
>>> For the OX820, lack of USB and SATA support makes the platform not usable
>>> in the current Linux support and relies on off-tree drivers hacked from the
>>> vendor (defunct for years) sources.
>>>
>>> The last users are in the OpenWRT distribution, and today's removal means
>>> support will still be in stable 6.1 LTS kernel until end of 2026.
>>>
>>> If someone wants to take over the development even with lack of SMP, I'll
>>> be happy to hand off maintainance.
>>>
>>> The plan is to apply the first 4 patches first, then the drivers
>>> followed by bindings. Finally the MAINTAINANCE entry can be removed.
>>>
>>> I'm not sure about the process of bindings removal, but perhaps the bindings
>>> should be marked as deprecated first then removed later on ?
>>>
>>> It has been a fun time adding support for this architecture, but it's time
>>> to get over!
>>>
>>> Patch 2 obviously depends on [1].
>>>
>>> [1] https://lore.kernel.org/all/20230327121317.4081816-1-arnd@kernel.org/
>>>
>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>
>> Thanks a lot for going through this and preparing the patches!
>>
>> I've discussed this with Daniel Golle on the OpenWRT channel as well,
>> and he indicated that the timing is probably fine here, as there are
>> already close to zero downloads for oxnas builds, and the 6.1 kernel
>> will only be part of a release in 2024.
>>
>> For the dependency on my other patch, I'd suggest you instead
>> remove the SMP files here as well, which means we can merge either
>> part independently based on just 6.3-rc. I can do that change
>> myself by picking up patches 1-4 of your RFC series, or maybe you
>> can send resend them after rebase to 6.3-rc1.
>>
>> For the driver removals, I think we can merge those at the same
>> time as the platform removal since there are no shared header files
>> that would cause build time regressions and there are no runtime
>> regressions other than breaking the platform itself. Maybe
>> just send the driver removal separately to the subsystem
>> maintainers with my
>>
>> Acked-by: Arnd Bergmann <arnd@arndb.de>
> 
> Sounds reasonable, so also
> 
> Acked-by: Daniel Golle <daniel@makrotopia.org>
> 
> (but I am a bit sad about it anyway. without SMP it doesn't make sense
> to keep ox820 though)

Same !

I would have loved to see the full support mainline, but the platform is
old and apart you nobody were interested in working on this.

Thanks a lot for you work keeping Oxnas support alive!
Neil



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
