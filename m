Return-Path: <SRS0=kZCR=PB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A464C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Oct 2021 14:24:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FE6560E96
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Oct 2021 14:24:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5FE6560E96
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5SFB76YRNWYLEC1dEdWGdNfxxCMWtRp06qQoYnTZfNQ=; b=uwyvK5bMESwmeIBr+xQhI4LJy4
	BrPI03Dpw/PYfHIYVuQvvdzyS+aaK7fMIIw4eJ3jXy/EASTOzLlWHaHmbh+BrmsJJK51j5osiVeP6
	jQiU8XDyYz8oSQmBurNa0kLvWp7YZvbaRonIbQUfusGwXg4cWMMnwDjmx2c+lYCFpR/OyvKW0IEmr
	BYNAJ89MCSl0Vp2NIa1mQOH5zTmO/DqiY7KHZl+kcAqj67hUENfL7n8XUho3kYbrhmmeuxJkenT2p
	MXytHgq/6Jm/vDXlF7B0njJdqSvloD86XKZ+B6F0jx3UpVffO1izD4vTBqrtborqfRDfyzayc95ZG
	TwdoNRDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mafAt-00H8Mm-Sm; Wed, 13 Oct 2021 14:24:08 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mafAp-00H8Hp-OY
 for linux-mtd@lists.infradead.org; Wed, 13 Oct 2021 14:24:05 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id B0BA522247;
 Wed, 13 Oct 2021 16:23:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1634135030;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ew25jgYD/j/6YfYm/jAJS8kiMsBSWL7LMk0vNn14EGo=;
 b=YYipjHGXQSe4vSaJdTse5KQDnvajaZyHPfvjjpsy+/rBuJzBxYH8Z8WWQEPrAlJlDcKe5e
 2IOcOAHuNnvvEekr8T0DUXeqGW5Uq4plQX2ZkrXTqsjPHcSVh2RKUjvQ+rOeSRH0yyyfnb
 7qoez8zyM/pXTGsgtVj3XUrJP7NvjRo=
MIME-Version: 1.0
Date: Wed, 13 Oct 2021 16:23:49 +0200
From: Michael Walle <michael@walle.cc>
To: Alexander Stein <Alexander.Stein@ew.tq-group.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring
 <robh@kernel.org>, Pratyush Yadav <p.yadav@ti.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: AW: (EXT) Re: [PATCH v2 1/2] dt-bindings: mtd: spi-nor: Add
 output-driver-strength property
In-Reply-To: <kcEE.9geNR42QRKGTSoedF1sEfQ.ALRP5Q7A1wE@vtuxmail01.tq-net.de>
References: <kcEE.9geNR42QRKGTSoedF1sEfQ.ALRP5Q7A1wE@vtuxmail01.tq-net.de>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <da3f810389e3bd42392424a0ddc80cac@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211013_072404_066242_1AE72AB5 
X-CRM114-Status: GOOD (  30.44  )
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

Hi,

Am 2021-10-13 10:47, schrieb Alexander Stein:
> Am 2021-10-12 09:48, schrieb Michael Walle:
>> Am 2021-10-12 08:17, schrieb Alexander Stein:
>> > This property is for optimizing output voltage impedance and is
>> > specific to each board. It overwrites the default set by the flash
>> > device. Various flash devices support different impedances.
>> >
>> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
>> > ---
>> > Changes in v2:
>> > * Updated the property description and the commit message accordingly
>> >
>> >  Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml | 8 ++++++++
>> >  1 file changed, 8 insertions(+)
>> >
>> > diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
>> > b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
>> > index ed590d7c6e37..4c3c506a8853 100644
>> > --- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
>> > +++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
>> > @@ -72,6 +72,14 @@ properties:
>> >        be used on such systems, to denote the absence of a reliable
>> > reset
>> >        mechanism.
>> >
>> > +  output-driver-strength:
>> > +    $ref: /schemas/types.yaml#/definitions/uint32
>> > +    description:
>> > +      Output driver strength in ohms which optimizes the impedance at
>> > Vcc/2
>> > +      output voltage. This property overwrites the default set by the
>> > flash
>> > +      device. This is board specific and should be determined by the
>> > +      manufacturer. Various flash devices support different
>> > impedances.
>> 
>> Mh, this seems to be very tailored to this flash chip. Eg. the 
>> "Vcc/2",
>> is
>> this something specific to this flash or is this some kind of common
>> usage?
> 
> "Vcc/2" is taken from the datasheet description.

But this property should be as generic as possible. So at least I'd
drop the "optimizes the imdance at Vcc/2". And as Rob mentioned,
"strength" implies (milli)amps. Shouldn't it be output-driver-impedance
in this case?

>> For example, Winbond flashes specifies the output driver strength in
>> percent.
>> Settings are 25%, 50%, 75%, 100% there.
>> 
>> I'd have to ask a hardware guy, if one could convert between these two
>> representations of the driver strength.
> 
> Well, 100% must map to some actual value. Which then can be used to 
> create
> a discrete value table, which are then supported by the flash driver.

Which unfortunatly isn't possible because there is no refence for this
obscure value. That is, the datasheet doesn't mention what 100% actually
is.

> E.g. for Micron not every flash supports the same set of settings for
> driver strength.
> Macronix uses similar settings (values and bitmask), but in a different
> register. But if some vendors have pretty much incompatible settings, 
> it
> might be feasible to provide vendor specific settings, e.g.
> "micron,drive-strength = <45>" (for 45 Ohm) or "winbond,drive-strength 
> = <100>"
> (for 100%).

Different registers/values aren't the problem here. The problem is that
different units are used to express the same thing. But lets wait for
Rob's answer to my previous question.

To summarize there are flashes where you can select different impedances
for the output driver and flashes where you can select different 
percentages
for the output driver strength and there might also be flashes where you
can specify the output driver strength in (milli)amps. And it might not
always be possible to convert between these values. Therefore, will 
these
be three different DT properties?

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
