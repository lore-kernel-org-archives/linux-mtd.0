Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05443ECAAD3
	for <linux-mtd@archiver.kernel.org>; Wed, 31 Aug 2022 07:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ze+XnSz3EoZeORyWfOPj7lH51GqU17FIWKu02gbYRsg=; b=j1j01fONGyPOpOhs3G3RUiz5hb
	oOTm+BFsQp2ffbE7cAjJnvIx4kBRRa4O7xlRsw4wR7Ev5VBycA9Fl3zvQmmZdz4Vc7CxZl1PHlrlx
	qdFezx8321q5KwxtOrr2Sis7QMFswEYkWCdyPWhxpLo94H5vJaS8kdBxFdzEGekMVZYuk7PROJZzy
	zCeCq1vfPgRoSff6OvAluAlnbklZY0Z7WBAIcDg2R+/ZWdgBm+KIxb7rI/b7S64N4LfL9337mFz32
	VuVvy/GtxLZddeoesGDTkx/0yLYZ83WL7FtRelQJSwwQnlzTuFPqAiiaY9Yh1Th0JJIRDZwUBpUl4
	8/+zFhig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTIUA-004hK2-BV; Wed, 31 Aug 2022 07:50:06 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTISG-004gZF-OL; Wed, 31 Aug 2022 07:48:11 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 39D16380;
	Wed, 31 Aug 2022 09:48:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1661932080;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LFoMvcld848Bt86qzpVohSCUMCt08caHdx/NoqLmM1U=;
	b=C53N8311mpQvKcwwMc/oaAQ2T43ilFDeGn3pJEAf5Dj1bhxVoN5yyvFt1xuaN8eGbZmxqr
	ykM+SerEUn4fw8PhkS2yrD5M7+z7IKD9rrSZeLuFqV+EPWct1an/C3TZQsi63bMEXcsWhA
	80x3PsXna5lV2x6r797byOSWvqHkpotQ/4W5h2BimaCzpXkyx86BqHPRyYgZeCV+hF8Fvm
	qp2dwrQyw5fABeoxZrcuY2rxzcG49s8Q23w+iEcEI0/ToFqNbso9lqeqcQTVNI5e+EYan4
	NctumU/JUcggWiu7GIEHoHc2O67thifBQBmYcjner16A4JPfAKyRUX8gf0/rCg==
MIME-Version: 1.0
Date: Wed, 31 Aug 2022 09:48:00 +0200
From: Michael Walle <michael@walle.cc>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>, Shawn Guo <shawnguo@kernel.org>, Li Yang
 <leoyang.li@nxp.com>, =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?=
 <rafal@milecki.pl>, "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Frank Rowand <frowand.list@gmail.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: Re: [PATCH v1 08/14] dt-bindings: mtd: relax the nvmem compatible
 string
In-Reply-To: <e0afa0fc-4718-2aa1-2555-4ebb2274850b@linaro.org>
References: <20220825214423.903672-1-michael@walle.cc>
 <20220825214423.903672-9-michael@walle.cc>
 <e0afa0fc-4718-2aa1-2555-4ebb2274850b@linaro.org>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <c8aea3ecb0fcf08c42852f99a4f265b6@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220831_004809_056279_E412F1DE 
X-CRM114-Status: GOOD (  17.02  )
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

Am 2022-08-31 09:37, schrieb Krzysztof Kozlowski:
> On 26/08/2022 00:44, Michael Walle wrote:
>> The "user-otp" and "factory-otp" compatible string just depicts a
>> generic NVMEM device. But an actual device tree node might as well
>> contain a more specific compatible string. Make it possible to add
>> more specific binding elsewere and just match part of the compatibles
> 
> typo: elsewhere
> 
>> here.
>> 
>> Signed-off-by: Michael Walle <michael@walle.cc>
>> ---
>>  Documentation/devicetree/bindings/mtd/mtd.yaml | 7 ++++---
>>  1 file changed, 4 insertions(+), 3 deletions(-)
>> 
>> diff --git a/Documentation/devicetree/bindings/mtd/mtd.yaml 
>> b/Documentation/devicetree/bindings/mtd/mtd.yaml
>> index 376b679cfc70..0291e439b6a6 100644
>> --- a/Documentation/devicetree/bindings/mtd/mtd.yaml
>> +++ b/Documentation/devicetree/bindings/mtd/mtd.yaml
>> @@ -33,9 +33,10 @@ patternProperties:
>> 
>>      properties:
>>        compatible:
>> -        enum:
>> -          - user-otp
>> -          - factory-otp
>> +        contains:
>> +          enum:
>> +            - user-otp
>> +            - factory-otp
> 
> This does not work in the "elsewhere" place. You need to use similar
> approach as we do for syscon or primecell.

I'm a bit confused. Looking at
   Documentation/devicetree/bindings/arm/primecell.yaml
it is done in the same way as this binding.

Whereas, the syscon use a "select:" on top of it. I'm
pretty sure, I've tested it without the select and the
validator picked up the constraints.

Could you elaborate on what is wrong here? Select missing?

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
