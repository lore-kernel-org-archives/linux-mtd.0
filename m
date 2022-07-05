Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C939C433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Jul 2022 14:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=diJ9d9HhjLMH1Q62X5w1p1MF4+x+1Co4IsGTCD6isXI=; b=wF2iCFQHBPMqphVrrKQvApMpO+
	9Ad0tcWGsSY5gy++/Npfu09qKfqxTtsa1zaWdqBmAzLeVqRpCBkY+CIni1elCNpZtC78DEQvdFuoU
	VnW46YBQX9eGOJBcvJyGUT8d0nC5MkLpocP7weLB4LJ6pee1C7zWk7rKhopUjI7sUT67E4tH1FzOF
	oe+A2rA7expAl6uNOwua06kzA0IEk0fxL6LabMkZ82Bm8/zF67+LRWo6eETYD1mI5wwgixoLg/qYA
	wAip/kED5eNp1t7BQh7aTW9W9EVQx/C9wdQdY8nlo+Qu92vT64nwMCmPzpc+DbbPWEMGVVdkfYpr0
	5l+JtiSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8k0w-000zSi-OI; Tue, 05 Jul 2022 14:58:58 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8k0k-000zKm-IO; Tue, 05 Jul 2022 14:58:48 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id D9C182223E;
	Tue,  5 Jul 2022 16:58:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
	t=1657033123;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4ddRelHkEFY1UZnYXTarTjVbvcAsB1IiSoDi4d3IfZk=;
	b=Js7E3vrRQYVEs8/aFpT1YMRoL0KulR/3GCYAka7mRLV9bczZHYFcN7ujJ4uHNFeQg2uZXj
	JqkSTsEBOi4Nil/w+72U0dJ1kHGR0m8hCvcRLTvQQ3EJryKjGgPimr/YJOkuFXhI297rQp
	YzeYtIoh3YYf0g7XUnb/VNx4Rtb/+0g=
MIME-Version: 1.0
Date: Tue, 05 Jul 2022 16:58:40 +0200
From: Michael Walle <michael@walle.cc>
To: Han Xu <han.xu@nxp.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Bough Chen
 <haibo.chen@nxp.com>, ashish.kumar@nxp.com, yogeshgaur.83@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 singh.kuldeep87k@gmail.com, tudor.ambarus@microchip.com, p.yadav@ti.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 festevam@gmail.com, dl-linux-imx <linux-imx@nxp.com>,
 linux-arm-kernel@lists.infradead.org, zhengxunli@mxic.com.tw
Subject: Re: [PATCH 07/11] dt-bindings: spi: spi-nxp-fspi: add a new property
 nxp,fspi-dll-slvdly
In-Reply-To: <20220705145226.tarpvub6bh67tj63@umbrella>
References: <1657012303-6464-1-git-send-email-haibo.chen@nxp.com>
 <1657012303-6464-7-git-send-email-haibo.chen@nxp.com>
 <ef676df1-77e0-b8ee-3950-97eade8ddd5b@linaro.org>
 <VI1PR04MB40167A70FBE772DF91047A4190819@VI1PR04MB4016.eurprd04.prod.outlook.com>
 <59d360ef-5374-c7a7-2995-854ab3715b25@linaro.org>
 <DU2PR04MB87747C9A8F18D8300461D6B197819@DU2PR04MB8774.eurprd04.prod.outlook.com>
 <f33ad190-f5c7-d9fa-088b-5538ab1f4d59@linaro.org>
 <DU2PR04MB877492F346BAA10B2AA7428497819@DU2PR04MB8774.eurprd04.prod.outlook.com>
 <62f113a0cdb0d58bf04ab0b274912eb7@walle.cc>
 <be521f90-97ce-c61d-d7d6-8f2bde24d824@linaro.org>
 <20220705145226.tarpvub6bh67tj63@umbrella>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <d4a69511eea5195b2ee7726bda5a8a33@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_075846_816544_5A7EA04A 
X-CRM114-Status: GOOD (  17.12  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am 2022-07-05 16:52, schrieb Han Xu:
> On 22/07/05 04:12PM, Krzysztof Kozlowski wrote:
>> On 05/07/2022 16:06, Michael Walle wrote:
>> >
>> >>>
>> >>> I think you could use here clock cycles or clock phase, but then it
>> >>> has to be obvious
>> >>> it is that unit.
>> >>
>> >> Hi Krzysztof,
>> >>
>> >> Let me clarify it, in the document a term "delay cell" was used to
>> >> descript this register bit. Each delay cell equals "1/32 clock phase",
>> >> so the unit of delay cell is clock phase. The value user need set in
>> >> DT just number to define how many delay cells needed.
>> >
>> > Then should the unit be "-degrees" and the possible range 0-180?
>> 
>> Thanks. We don't have it documented currently, but the unit seems
>> reasonable.
> 
> IMO, use the unit "-degrees" makes it more complicate. Personaly I 
> would
> calculate how many clock cycle delay needed, such as 1/4 clock cycle or 
> half
> clock cycle. Using degree brings extra calculation.

What is the extra calculation here? For hardware engineer who has to
specify this, it is easier to give the delay in clock phase (in degrees)
rather than reading the documentation and transform that into a value
given in 1/32 part of a clock, that should be part of the driver.

> The granularity of the clock phase change is 1/32 of 180 degree, but 
> the range
> 0-180 make people feel it can be set in any degree in range.

I'm not sure if the DT bindings have a granularity feature but you
could just round to the next possible value. I guess that is
the case for any value which isn't given as the raw value.

-michael

> If I describe all details of the relation between "nxp,fspi-dll-slvdly" 
> and
> "delay cell" in patch v2, do you think it's clear for users?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
