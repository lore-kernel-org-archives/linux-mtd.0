Return-Path: <SRS0=DDtA=BE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78CE8C433DF
	for <linux-mtd@archiver.kernel.org>; Sat, 25 Jul 2020 12:18:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4513B20674
	for <linux-mtd@archiver.kernel.org>; Sat, 25 Jul 2020 12:18:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="H3dKPsXu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="SV4m4sV1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4513B20674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=crapouillou.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:To:
	Subject:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=y9uPfNeMbcjy9m2LGq8+NdB+Q+OGIYTabiqwj2PRp9I=; b=H3dKPsXuFTaCG/jrAsnCVO3/j
	22UzMDGREe5omajq7p6yI8hkgK1hS0QTLl9+VLthJNM99OIzQ8s0HSQEVF4038oznzbC1c6nZZuJm
	Am7tHLJBxxDy3O2QFlTdHw/2Y2wptl0uLrpRNHyHQfkhEqF1pOTy1FfXw40Y4kdQeHdkSgq+mXLC/
	apnFgyWHgGGOIA5ixUR8JJwTAlfuraVCelgXygYI2uwPoi+t0QBQzRW0jfY9Xo6KmsIQaJ5I/K2En
	n5hdk6LMAl2cYFt3xGOTRh8fClCmVL3ZB5E58N2He0B2jpy2rn6f62vcDNKavVM9lkCq8c9E0CUfC
	9akJdyrig==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jzJ7t-00054g-HT; Sat, 25 Jul 2020 12:18:05 +0000
Received: from crapouillou.net ([89.234.176.41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jzJ7l-000546-0v
 for linux-mtd@lists.infradead.org; Sat, 25 Jul 2020 12:18:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1595679474; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wtjs9oz1J8j+LAftrjDeBoK7mRdXj3uB7dc2tv4J+8s=;
 b=SV4m4sV10yvBP+o7Wh0Oh1KVAdbLXfM9h4DPNfVo5RUy32+HNMFiS2U6G1Xk9v64icxXxa
 vIaaH7lffvJ85wzbEIirinP72c8nVaDFBBlmB2ojIFEmFU7J+gPR2jrYoWr820RM3uVRIX
 sv4ybxk1MVhWVYVgF4ekUcCaCcAl3O4=
Date: Sat, 25 Jul 2020 14:17:44 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v3 2/2] mtd: rawnand: ingenic: Limit MTD_NAND_JZ4780 to
 architecture only
To: Krzysztof Kozlowski <krzk@kernel.org>
Message-Id: <K5Y0EQ.WYAK00ADM46F3@crapouillou.net>
In-Reply-To: <20200724155436.GA7460@kozik-lap>
References: <20200724145401.2566-1-krzk@kernel.org>
 <20200724145401.2566-3-krzk@kernel.org>
 <PWBZDQ.D1XCW6N2YMRA@crapouillou.net>
 <CAJKOXPc2w0QHQDEwqoeg9Nm361MszM4LRaCoJD2En-fPgPp+4Q@mail.gmail.com>
 <IBDZDQ.K28R5FAI0BXI2@crapouillou.net> <20200724155436.GA7460@kozik-lap>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200725_081757_367983_B3EC6D41 
X-CRM114-Status: GOOD (  16.46  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Arnd Bergmann <arnd@arndb.de>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Harvey Hunt <harveyhuntnexus@gmail.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



Le ven. 24 juil. 2020 =E0 17:54, Krzysztof Kozlowski <krzk@kernel.org> a =

=E9crit :
> On Fri, Jul 24, 2020 at 05:50:06PM +0200, Paul Cercueil wrote:
>> =

>> =

>>  Le ven. 24 juil. 2020 =E0 17:33, Krzysztof Kozlowski =

>> <krzk@kernel.org> a =E9crit
>>  :
>>  > On Fri, 24 Jul 2020 at 17:19, Paul Cercueil <paul@crapouillou.net>
>>  > wrote:
>>  > >
>>  > >  Hi Krzysztof,
>>  > >
>>  > >
>>  > >  Le ven. 24 juil. 2020 =E0 16:54, Krzysztof Kozlowski
>>  > > <krzk@kernel.org> a
>>  > >  =E9crit :
>>  > >  > Enabling the MTD_NAND_JZ4780 driver makes sense only for =

>> specific
>>  > >  > hardware - the Ingenic SoC architecture.  Set it's =

>> dependency to
>>  > >  > MACH_INGENIC so it will not appear on unrelated architectures
>>  > > (easier
>>  > >  > job for downstream/distro kernel engineers).
>>  > >
>>  > >  Disagreed. It was done this way so that distro kernels can =

>> support
>>  > >  multiple SoCs.
>>  >
>>  > They will still be able to support multiple SoCs. Nothing changed
>>  > here. The same we do for all ARM drivers (SoCs are =

>> multiplatform)...
>>  > Unless you want to say that it is possible to support Ingenic SoC
>>  > without MACH_INGENIC?
>> =

>>  On MIPS, the SoC selection is a Kconfig "choice", so you can only =

>> support
>>  one SoC family, unfortunately.
> =

> Let's say someone selected then some other architecture =

> (MIPS_ALCHEMY).
> They could select this MTD driver.
> =

> Does it mean they would be able to run it on Ingenic hardware?

In *theory* yes, as long as the Kconfig options that MACH_INGENIC =

selects are enabled, the kernel should boot and work on Ingenic SoCs.

-Paul

>>  I'm the one to blame for using "depends on
>>  MIPS || COMPILE_TEST" on ingenic drivers, maybe it should depend on
>>  MACH_INGENIC indeed, but then it should be made possible to support =

>> more
>>  than one SoC family.
>> =

>>  That's something that should be pointed out to the MIPS mailing =

>> list, I
>>  believe.
> =

> Somehow JZ4780 entries in Maintainers do not mention MIPS list...
> =

>> =

>>  Btw: Does that mean you are the new maintainer for drivers/memory/?
> =

> Yes, that's the coming change.
> =

> https://lore.kernel.org/lkml/20200724140345.GB13472@kozik-lap/T/#m91ca209=
20a7ec5f228a595f1816c15b6c85b6a09
> =

> Best regards,
> Krzysztof
> =




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
