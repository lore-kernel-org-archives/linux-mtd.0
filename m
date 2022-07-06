Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B3DDC43334
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Jul 2022 21:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b9ALevgeUiwH3RTRJn/PPDMfRLQjrXdgpYq7pyM4YQg=; b=wZH5ADvjPBtqwfBNktPgmtMZTS
	QRSm+s5r/stm114ApeDcHV1f/IuuC+ah3xwULR1kY0PMm1ZMb21RRzn0wmTjcxHwHawQvPFSNHR18
	yTTDEvPe2gAwNKRWMmOErRZ0nfQyM3Ag6jssZNU07XsMnNa+5RamU9blAdTWw2nLe9PEpFyxwurcp
	NtvJNAMOXnES4PufwJ9MeYZcUMkJK0v/kdr1ZHvJqK/nHT1u40gFap8cxj4CZLGL4ELNwCPIfdOdt
	SnFUOfWHIBt//OYIgqhPeSZ461ZHLXZWRgPlYLexwDi42wNH/wHzbPj88PmepIO39K+8sWXG7+RcL
	WH4IHJoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9C8E-00COEw-7K; Wed, 06 Jul 2022 21:00:22 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9C82-00COAm-Kt; Wed, 06 Jul 2022 21:00:12 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id EE5AA2223A;
	Wed,  6 Jul 2022 22:59:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
	t=1657141200;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zkQ/2LCI9KeCTIUmXYEWItYqPgAG9I6lXHScBEtzG+U=;
	b=Rjk9wO3ARsLTN7G14ofW05WjtQKKKTNWU2BOjPIYP/1zH9Ts/bI4meCOERCYEtmca5D5JZ
	VhV5S8OT+N1m3xX7v72ntJHbl02fhZvWxZzcdsg6DopF5hDAwNjkmVMfF5bCugOiN4nkth
	UoIciSSClSkEDRKgd1mMOyL2Mnm+lss=
MIME-Version: 1.0
Date: Wed, 06 Jul 2022 22:59:56 +0200
From: Michael Walle <michael@walle.cc>
To: Rob Herring <robh@kernel.org>
Cc: Han Xu <han.xu@nxp.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Bough Chen <haibo.chen@nxp.com>,
 ashish.kumar@nxp.com, yogeshgaur.83@gmail.com, broonie@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, singh.kuldeep87k@gmail.com,
 tudor.ambarus@microchip.com, p.yadav@ti.com, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, festevam@gmail.com, dl-linux-imx
 <linux-imx@nxp.com>, linux-arm-kernel@lists.infradead.org,
 zhengxunli@mxic.com.tw
Subject: Re: [PATCH 07/11] dt-bindings: spi: spi-nxp-fspi: add a new property
 nxp,fspi-dll-slvdly
In-Reply-To: <20220706161110.GA123915-robh@kernel.org>
References: <VI1PR04MB40167A70FBE772DF91047A4190819@VI1PR04MB4016.eurprd04.prod.outlook.com>
 <59d360ef-5374-c7a7-2995-854ab3715b25@linaro.org>
 <DU2PR04MB87747C9A8F18D8300461D6B197819@DU2PR04MB8774.eurprd04.prod.outlook.com>
 <f33ad190-f5c7-d9fa-088b-5538ab1f4d59@linaro.org>
 <DU2PR04MB877492F346BAA10B2AA7428497819@DU2PR04MB8774.eurprd04.prod.outlook.com>
 <62f113a0cdb0d58bf04ab0b274912eb7@walle.cc>
 <be521f90-97ce-c61d-d7d6-8f2bde24d824@linaro.org>
 <20220705145226.tarpvub6bh67tj63@umbrella>
 <0bd271e9-8d9b-7388-2d9b-65cc39a54f8c@linaro.org>
 <20220705155031.zk36jsq4q2ac2ow4@umbrella>
 <20220706161110.GA123915-robh@kernel.org>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <7fc2d4ba636a4995eda502ea4c66856d@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_140011_051158_8AD26838 
X-CRM114-Status: GOOD (  39.90  )
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

Am 2022-07-06 18:11, schrieb Rob Herring:
> On Tue, Jul 05, 2022 at 10:50:31AM -0500, Han Xu wrote:
>> On 22/07/05 05:38PM, Krzysztof Kozlowski wrote:
>> > On 05/07/2022 16:52, Han Xu wrote:
>> > > On 22/07/05 04:12PM, Krzysztof Kozlowski wrote:
>> > >> On 05/07/2022 16:06, Michael Walle wrote:
>> > >>>
>> > >>>>>
>> > >>>>> I think you could use here clock cycles or clock phase, but then it
>> > >>>>> has to be obvious
>> > >>>>> it is that unit.
>> > >>>>
>> > >>>> Hi Krzysztof,
>> > >>>>
>> > >>>> Let me clarify it, in the document a term "delay cell" was used to
>> > >>>> descript this register bit. Each delay cell equals "1/32 clock phase",
>> > >>>> so the unit of delay cell is clock phase. The value user need set in
>> > >>>> DT just number to define how many delay cells needed.
>> > >>>
>> > >>> Then should the unit be "-degrees" and the possible range 0-180?
>> > >>
>> > >> Thanks. We don't have it documented currently, but the unit seems
>> > >> reasonable.
>> > >
>> > > IMO, use the unit "-degrees" makes it more complicate. Personaly I would
>> > > calculate how many clock cycle delay needed, such as 1/4 clock cycle or half
>> > > clock cycle. Using degree brings extra calculation.
>> >
>> > And what if the next device uses a bit different divider? Like 1/16?
>> > This is why we have standard units so people won't push register values
>> > into the bindings.
>> >
>> > >
>> > > The granularity of the clock phase change is 1/32 of 180 degree, but the range
>> > > 0-180 make people feel it can be set in any degree in range.
>> >
>> > Yes, because that's how the bindings are being written - allowing any
>> > reasonable value, not register-specific value, to be used because it is
>> > the most flexible, hardware-independent and allows further customization
>> > of bindings (e.g. new devices). Embedding device programming model into
>> > the bindings contradicts it.
>> >
>> > Second, nothing stops you from narrowing the acceptable values with an
>> > enum. This still allows extension. Your 1/32 does not.
>> >
>> > >
>> > > If I describe all details of the relation between "nxp,fspi-dll-slvdly" and
>> > > "delay cell" in patch v2, do you think it's clear for users?
> 
> What's a cell?

A delay cell I presume. Which if I read the datasheet correctly is
somewhere between 75ps and 225ps per cell *in an unlocked state*.

I don't understand what the intention of this setting in the device
tree is. I does *not* specify the delay of the DLL, rather it specifies
the target value to be achieved by the DLL. And the RM tells the
recommended value is 0xf. Which makes sense, because it's half a clock
cycle and you'd want to sample in the middle of the clock (note this is
double data rate and you are sampling on falling and rising edge). But
and this is the catch I think, the DLL will only lock if the frequency
is >100MHz. Now if the frequency is lower than 100MHz you can actually
set the value manually (see above), but this is not what the driver
does. You'd need to write the manual value into OVRDVAL, not into
SLVDLYTARGET.

So I'm confused. Why can't you just set SLVDLYTARGET to 0xf if the
frequency is larger than 100MHz? How is this supposed to be used?
Do I need to set the value to 0xf if the frequency is higher than
100MHz? I see you used 4 in your device tree, why don't you use
the recommended value?

>> > 1/32 could be a nice unit, but degrees is better. Just like uV is better
>> > than 1/32 of V. Like 1 us is better than 1/32 of ms.
>> >
>> > Do you see  in the bindings many other values like time, potential,
>> > current or power described in 1/32 units?
>> 
>> That make sense. I will use degree as the unit and round to register 
>> proper
>> value in driver as Michael suggested. Thanks for all comments.
> 
> I'm still wondering what this is delaying? From what to what? We 
> already
> have numerous common delay properties for SPI. If one of those doesn't
> work, then should this be a new common property? And if common, I think
> time units is better to use than degrees.

It's delaying the internal sampling clock with respect to the
internal clock (which also drivers SCK then). With that clock
the data written by the flash device is then sampled. Now there
is also the read strobe; I'm unsure if that can also be delayed.

Time units depend on the frequency (or changes with the frequency),
whereas the phase angle doesn't.

> If this is vendor specific, then I'd just use the register value.
> There's not much point in using common units unless it is a common
> property.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
