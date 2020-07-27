Return-Path: <SRS0=kfRK=BG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A41DAC433E1
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Jul 2020 17:13:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70F2F206E7
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Jul 2020 17:13:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3hhQE92+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="RUtGBy/i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 70F2F206E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=crapouillou.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:To:
	Subject:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5UOcH3DP0UAVwGZcyZeL4DnGekH5WI+thL7TxwBAij4=; b=3hhQE92+TTZnJxWsUDNtORJdG
	7a2xuiBpmpk0+Tlg/wNMEGx8VkdoZKAJWLaCen9qu/SfCwkzUwFPTuMDByxryQPN919Z1RB3FJWmb
	ZpZmWrp14L7ymmn2HuDDpNKuG6bWMeZWFNFH5U27M6fzWmFY+ilZG/jpvx4MoGcKDv64o/kL4yU//
	aSMn9zgAXsKLL69Dq1YB9rxkfCVUlZRg7pR6mrqPCQJ1C7kbbDGg7aCvYRXkZtbtMaOpmGscaw4aQ
	95GXgWuaYC6PLolA2eOI3krSVnnweKFDaUyO91J7yOj9x0AfRL8jRXsUkhCc9OXYa0h3OaNMzdcoR
	Ogv5hYjug==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k06gF-0005XE-Cx; Mon, 27 Jul 2020 17:12:51 +0000
Received: from crapouillou.net ([89.234.176.41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k06gC-0005Ug-37
 for linux-mtd@lists.infradead.org; Mon, 27 Jul 2020 17:12:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1595869961; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QQPLs8G7xnlp4G++Lxr0CaXPWeOA/xM0miRvxkULoFU=;
 b=RUtGBy/i4V/XNluTUdmDFr74yRTLWR7L1GRbbP9w7yddGXxuLrCUkfhlvzs4CPyU6AYG5P
 lSEix0m2n1AsiO3Ft1WNq/ulI22WuJxsx+PDi0yGmbG6tWTwJ7HQApZL8etJXeDW8n3Z51
 HR3qTj0qqZoxYAjpBwCmrB8+rbnG1h4=
Date: Mon, 27 Jul 2020 19:12:32 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v3 2/2] mtd: rawnand: ingenic: Limit MTD_NAND_JZ4780 to
 architecture only
To: Krzysztof Kozlowski <krzk@kernel.org>
Message-Id: <W415EQ.VPN8W77YD4D13@crapouillou.net>
In-Reply-To: <20200727170302.GA3507@kozik-lap>
References: <CAJKOXPc2w0QHQDEwqoeg9Nm361MszM4LRaCoJD2En-fPgPp+4Q@mail.gmail.com>
 <IBDZDQ.K28R5FAI0BXI2@crapouillou.net> <20200724155436.GA7460@kozik-lap>
 <K5Y0EQ.WYAK00ADM46F3@crapouillou.net>
 <CAK8P3a0HDu15u5dREd6gk_e9D6mrZ9JqT0DJs9AeC9C2602nAw@mail.gmail.com>
 <20200726160616.GA2662@kozik-lap> <RO33EQ.546WD84D5N7K2@crapouillou.net>
 <20200726161545.GA6058@kozik-lap> <B243EQ.VEXGA7ZL5JAE2@crapouillou.net>
 <CAK8P3a1r6AMz2wKBEosAqn7qkuJY4LGFYK7o85sO++d+TSVOgQ@mail.gmail.com>
 <20200727170302.GA3507@kozik-lap>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200727_131248_335853_B4BB0D84 
X-CRM114-Status: GOOD (  24.02  )
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



Le lun. 27 juil. 2020 =E0 19:03, Krzysztof Kozlowski <krzk@kernel.org> a =

=E9crit :
> On Mon, Jul 27, 2020 at 09:55:54AM +0200, Arnd Bergmann wrote:
>>  On Sun, Jul 26, 2020 at 6:20 PM Paul Cercueil =

>> <paul@crapouillou.net> wrote:
>>  > Le dim. 26 juil. 2020 =E0 18:15, Krzysztof Kozlowski =

>> <krzk@kernel.org> a =E9crit :
>>  > > On Sun, Jul 26, 2020 at 06:12:27PM +0200, Paul Cercueil wrote:
>>  > >>  Le dim. 26 juil. 2020 =E0 18:06, Krzysztof Kozlowski =

>> <krzk@kernel.org> a =E9crit
>>   >
>>  > > OK, that's true. Anyway, I don't have strong opinion on any of =

>> this. I
>>  > > just followed Arnd's hint.
>>  > >
>>  > > For the memory driver (and MTD NAND as well) which one you =

>> prefer:
>>  > > 1. =

>> https://lore.kernel.org/lkml/20200724074038.5597-6-krzk@kernel.org/
>>  > > 2. depends on MACH_INGENIC || MIPS_GENERIC || COMPILE_TEST
>>  > >
>>  > > ?
>>  >
>>  > I'd say a slightly modified #1. The driver shouldn't be "default =

>> y" in
>>  > the first place, so the patch could be to disable it by default.
>> =

>>  If it defaults to 'n' even for MACH_INGENIC, you may have to enable
>>  it in the four defconfig files for these machines to avoid =

>> surprises.
> =

> Exactly. Nothing else selects JZ4780_NEMC, so either we keep default y
> ("if MACH_INGENIC || MIPS_GENERIC"), or you select it directly from
> MACH_INGENIC/MIPS_GENERIC.
> =

> A related question is how essential are these drivers? At least for =

> ARM
> platforms, all essential SoC blocks/IPs are selected by default, if
> support for chosen SoC is enabled. Only non-essential stuff is left,
> e.g. DRM, cpufreq, devfreq, ADC, crypto, video, USB, eMMC (although =

> one
> could argue that it is essential), IOMMU.

They are only used for NAND access, which is not really essential (some
boards only use MMC storage), that's why I said they shouldn't have been
enabled by default in the first place.

-Paul

> =

>>  > And when the Ingenic code is merged into the MIPS generic =

>> framework, I'll
>>  > send a set of patches to change all driver dependencies on MIPS to
>>  > MIPS_GENERIC.
>> =

>>  The way we do it on Arm, the machine Kconfig identifiers stay around
>>  even for multiplatform targets (which now make up basically actively
>>  maintained machines).
>> =

>>  I don't think it makes any sense for a driver to depend on =

>> MIPS_GENERIC:
>>  either it is a generic driver that should always be visible or it =

>> is specific
>>  to a set of SoCs and should depend on some corresponding vendor
>>  specific identifiers.
> =

> If support for Ingenic is provided also by MIPS_GENERIC (without
> selecting MACH_INGENIC), then it makes sense. This would be just a
> different way than ARM of building multi-platform kernel.
> =

> Best regards,
> Krzysztof



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
