Return-Path: <SRS0=JUqn=BF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F0ADC433E0
	for <linux-mtd@archiver.kernel.org>; Sun, 26 Jul 2020 16:13:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBEEE206D8
	for <linux-mtd@archiver.kernel.org>; Sun, 26 Jul 2020 16:13:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T6fZFAZu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="VgHrj87M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DBEEE206D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=crapouillou.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:To:
	Subject:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3P4f03IE6DpMvyY0vZRViQ1Y9L7Zv8SPROh9BM83hEA=; b=T6fZFAZu3sadScUaSunghKxlG
	LU3Q7hsLkacrigM6qCvGxjQAyK5YSAKmVWOOO5UAWYg3sSgxZNVLtmcLGBUw3NLbB1e549E17/BMG
	OL9PPIk1iiwtF8kGQUhBsGla6z3Et8OMMq3BUNNpzjFEp1RutqlUc6Oe29HZn1JT1CSqOjBUNw3PJ
	kj6HgPwi2q9e2IE0pSfpMpEW12rD4ZTzfr9373xbDBKLpqQIZLzZxkSWELR9cTGOjWeeGDWmJU+LB
	9KaLvHuy0vtNtPWeq0eRMyCj5Az+vaawERnvZlMEKxOF0r61FUvgM+i95tE8wDEL2Mhpm5HO27/gu
	Q+milm2Qw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jzjGT-0005e1-Bi; Sun, 26 Jul 2020 16:12:41 +0000
Received: from crapouillou.net ([89.234.176.41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jzjGQ-0005dP-NQ
 for linux-mtd@lists.infradead.org; Sun, 26 Jul 2020 16:12:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1595779957; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1FFAOTmTlN9hjWJiCw3Kqkh+9m3EdO/XmQtlNexVKUk=;
 b=VgHrj87M4n7w13v3Yla8jb/IeH6VJn9SBxJnFV7HIX9qqehKWp1ggcfQlibif/zrFJYfmD
 WqdpYSHBhJn4QXbfOwMJcmVb9kDDAiWrvYWU7B90EK27fJHMb4BrT6hhTdd5hSaB57PwIf
 FF/uDBCSdYmh1Use/udSXAsJ0aIhmn0=
Date: Sun, 26 Jul 2020 18:12:27 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v3 2/2] mtd: rawnand: ingenic: Limit MTD_NAND_JZ4780 to
 architecture only
To: Krzysztof Kozlowski <krzk@kernel.org>
Message-Id: <RO33EQ.546WD84D5N7K2@crapouillou.net>
In-Reply-To: <20200726160616.GA2662@kozik-lap>
References: <20200724145401.2566-1-krzk@kernel.org>
 <20200724145401.2566-3-krzk@kernel.org>
 <PWBZDQ.D1XCW6N2YMRA@crapouillou.net>
 <CAJKOXPc2w0QHQDEwqoeg9Nm361MszM4LRaCoJD2En-fPgPp+4Q@mail.gmail.com>
 <IBDZDQ.K28R5FAI0BXI2@crapouillou.net> <20200724155436.GA7460@kozik-lap>
 <K5Y0EQ.WYAK00ADM46F3@crapouillou.net>
 <CAK8P3a0HDu15u5dREd6gk_e9D6mrZ9JqT0DJs9AeC9C2602nAw@mail.gmail.com>
 <20200726160616.GA2662@kozik-lap>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200726_121238_907565_D7C8780B 
X-CRM114-Status: GOOD (  17.62  )
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



Le dim. 26 juil. 2020 =E0 18:06, Krzysztof Kozlowski <krzk@kernel.org> a =

=E9crit :
> On Sat, Jul 25, 2020 at 08:30:56PM +0200, Arnd Bergmann wrote:
>>  On Sat, Jul 25, 2020 at 2:17 PM Paul Cercueil =

>> <paul@crapouillou.net> wrote:
>>  > Le ven. 24 juil. 2020 =E0 17:54, Krzysztof Kozlowski =

>> <krzk@kernel.org> a
>>  > =E9crit :
>>  > > On Fri, Jul 24, 2020 at 05:50:06PM +0200, Paul Cercueil wrote:
>>  > >>  Le ven. 24 juil. 2020 =E0 17:33, Krzysztof Kozlowski
>>  > >> <krzk@kernel.org> a =E9crit:
>>  > >>  > On Fri, 24 Jul 2020 at 17:19, Paul Cercueil =

>> <paul@crapouillou.net>
>>  > >>  > wrote:
>>  > >>
>>  > >>  On MIPS, the SoC selection is a Kconfig "choice", so you can =

>> only
>>  > >> support
>>  > >>  one SoC family, unfortunately.
>>  > >
>>  > > Let's say someone selected then some other architecture
>>  > > (MIPS_ALCHEMY).
>>  > > They could select this MTD driver.
>>  > >
>>  > > Does it mean they would be able to run it on Ingenic hardware?
>>  >
>>  > In *theory* yes, as long as the Kconfig options that MACH_INGENIC
>>  > selects are enabled, the kernel should boot and work on Ingenic =

>> SoCs.
>> =

>>  Right now, this won't work yet, because there are platform specific
>>  functions that are implemented by each of the platforms in =

>> arch/mips,
>>  e.g. arch/mips/generic/init.c and arch/mips/jz4740/setup.c.
> =

> I would say even more - no DTS would be provided for such =

> configuration.
> All Ingenic DTSes are included only with MACH_INGENIC.  You cannot =

> build
> a kernel working on Ingenic without MACH_INGENIC. Even in theory.

But the devicetree doesn't have to be built-in.

-Paul

>> =

>>  A lot of the newer platforms are part of arch/mips/generic
>>  (CONFIG_MIPS_GENERIC), which roughly corresponds to
>>  CONFIG_ARCH_MULTIPLATFORM on in arch/arm/.
>>  Similarly, there are header files in arch/mips/include/asm/mach-*/
>>  that conflict and you need to have the right one.
>> =

>>  To have more than one platform enabled, each one needs to
>>  have all of that platform code converted to fit into the
>>  MIPS_GENERIC framework. This can be a lot of work, but
>>  I suppose the ingenic platform would be a candidate for
>>  which this makes sense, as long as new SoCs of that family
>>  still come out.
> =

> I can therefore change the patch to:
> depends on MACH_INGENIC || MIPS_GENERIC || COMPILE_TEST
> =

> Other solution is to leave MTD driver as is and for the memory driver =

> go
> with my v2 approach:
> https://lore.kernel.org/lkml/20200724074038.5597-6-krzk@kernel.org/
> =

> Best regards,
> Krzysztof
> =




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
