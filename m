Return-Path: <SRS0=JUqn=BF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64BCEC433DF
	for <linux-mtd@archiver.kernel.org>; Sun, 26 Jul 2020 16:21:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31B21206D7
	for <linux-mtd@archiver.kernel.org>; Sun, 26 Jul 2020 16:21:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="owtjGZSM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="QUIbvw8D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31B21206D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=crapouillou.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:To:
	Subject:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vWI4Q27n6Teu4kmco8AAD7BOncJGP3FTZ8GA3O9uMTg=; b=owtjGZSMYR40WoF/cQZH2ZJ57
	KgbBx/TsLAMjzK0VgY9jXoUOy7uCFvhIqAILG6XvGUrLX93zpIcT45dR3yuMei2Uf+y2P/g043xSb
	egSUwwcGffBZVcALC2vOeUq2ms4q+sIbxR+31KZap90rH73/V3tfFsjaISV1MCmw+hmfREqkMnj3T
	uTlQQpM7aUtQLgx4QVuX4HDobC7tfsCNcQf8+AwfPeAZJpWzzdSXx9WNPwpYfbA8Dua/1IPGuyeWi
	yBAkj0swAre5GR0uMzf6GeNbt/ZosdefvNLg3MtjAWuJapXAKEsIBsrZOaS3Uxre0TiJc+JZsSBIs
	FejVjE0lg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jzjOK-0006Zq-8g; Sun, 26 Jul 2020 16:20:48 +0000
Received: from crapouillou.net ([89.234.176.41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jzjOH-0006ZR-QZ
 for linux-mtd@lists.infradead.org; Sun, 26 Jul 2020 16:20:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1595780444; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k9fIRGUZsDc5QSYHsqk9mi+m1nvILWliO5qoklHXvpo=;
 b=QUIbvw8DxF/MhBtGGWBxJkLggcDdT5GyntWyl+JIGJ3rv7nrS4uwKT5NPL0Pj90fI85ha5
 jB1eYCFSuWJ6hxsvf85VSnKHSqLYB9o5I/q2B1nnCAur4NHizz7Hu5Z3Qxn+lXkUpHWk4+
 cWPBsoTzBwhlJufg56uPrvQPEIPCg1Y=
Date: Sun, 26 Jul 2020 18:20:35 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v3 2/2] mtd: rawnand: ingenic: Limit MTD_NAND_JZ4780 to
 architecture only
To: Krzysztof Kozlowski <krzk@kernel.org>
Message-Id: <B243EQ.VEXGA7ZL5JAE2@crapouillou.net>
In-Reply-To: <20200726161545.GA6058@kozik-lap>
References: <20200724145401.2566-1-krzk@kernel.org>
 <20200724145401.2566-3-krzk@kernel.org>
 <PWBZDQ.D1XCW6N2YMRA@crapouillou.net>
 <CAJKOXPc2w0QHQDEwqoeg9Nm361MszM4LRaCoJD2En-fPgPp+4Q@mail.gmail.com>
 <IBDZDQ.K28R5FAI0BXI2@crapouillou.net> <20200724155436.GA7460@kozik-lap>
 <K5Y0EQ.WYAK00ADM46F3@crapouillou.net>
 <CAK8P3a0HDu15u5dREd6gk_e9D6mrZ9JqT0DJs9AeC9C2602nAw@mail.gmail.com>
 <20200726160616.GA2662@kozik-lap> <RO33EQ.546WD84D5N7K2@crapouillou.net>
 <20200726161545.GA6058@kozik-lap>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200726_122046_029277_C35EDE9F 
X-CRM114-Status: GOOD (  17.97  )
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
 Harvey Hunt <harveyhuntnexus@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



Le dim. 26 juil. 2020 =E0 18:15, Krzysztof Kozlowski <krzk@kernel.org> a =

=E9crit :
> On Sun, Jul 26, 2020 at 06:12:27PM +0200, Paul Cercueil wrote:
>> =

>> =

>>  Le dim. 26 juil. 2020 =E0 18:06, Krzysztof Kozlowski =

>> <krzk@kernel.org> a =E9crit
>>  :
>>  > On Sat, Jul 25, 2020 at 08:30:56PM +0200, Arnd Bergmann wrote:
>>  > >  On Sat, Jul 25, 2020 at 2:17 PM Paul Cercueil
>>  > > <paul@crapouillou.net> wrote:
>>  > >  > Le ven. 24 juil. 2020 =E0 17:54, Krzysztof Kozlowski
>>  > > <krzk@kernel.org> a
>>  > >  > =E9crit :
>>  > >  > > On Fri, Jul 24, 2020 at 05:50:06PM +0200, Paul Cercueil =

>> wrote:
>>  > >  > >>  Le ven. 24 juil. 2020 =E0 17:33, Krzysztof Kozlowski
>>  > >  > >> <krzk@kernel.org> a =E9crit:
>>  > >  > >>  > On Fri, 24 Jul 2020 at 17:19, Paul Cercueil
>>  > > <paul@crapouillou.net>
>>  > >  > >>  > wrote:
>>  > >  > >>
>>  > >  > >>  On MIPS, the SoC selection is a Kconfig "choice", so you =

>> can
>>  > > only
>>  > >  > >> support
>>  > >  > >>  one SoC family, unfortunately.
>>  > >  > >
>>  > >  > > Let's say someone selected then some other architecture
>>  > >  > > (MIPS_ALCHEMY).
>>  > >  > > They could select this MTD driver.
>>  > >  > >
>>  > >  > > Does it mean they would be able to run it on Ingenic =

>> hardware?
>>  > >  >
>>  > >  > In *theory* yes, as long as the Kconfig options that =

>> MACH_INGENIC
>>  > >  > selects are enabled, the kernel should boot and work on =

>> Ingenic
>>  > > SoCs.
>>  > >
>>  > >  Right now, this won't work yet, because there are platform =

>> specific
>>  > >  functions that are implemented by each of the platforms in
>>  > > arch/mips,
>>  > >  e.g. arch/mips/generic/init.c and arch/mips/jz4740/setup.c.
>>  >
>>  > I would say even more - no DTS would be provided for such =

>> configuration.
>>  > All Ingenic DTSes are included only with MACH_INGENIC.  You =

>> cannot build
>>  > a kernel working on Ingenic without MACH_INGENIC. Even in theory.
>> =

>>  But the devicetree doesn't have to be built-in.
>> =

> =

> OK, that's true. Anyway, I don't have strong opinion on any of this. I
> just followed Arnd's hint.
> =

> For the memory driver (and MTD NAND as well) which one you prefer:
> 1. https://lore.kernel.org/lkml/20200724074038.5597-6-krzk@kernel.org/
> 2. depends on MACH_INGENIC || MIPS_GENERIC || COMPILE_TEST
> =

> ?

I'd say a slightly modified #1. The driver shouldn't be "default y" in =

the first place, so the patch could be to disable it by default. And =

when the Ingenic code is merged into the MIPS generic framework, I'll =

send a set of patches to change all driver dependencies on MIPS to =

MIPS_GENERIC.

-Paul



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
