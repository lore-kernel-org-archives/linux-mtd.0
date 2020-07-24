Return-Path: <SRS0=mo6j=BD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4419EC433E8
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Jul 2020 15:51:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 093EA206D7
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Jul 2020 15:51:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2DaqvAHG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="ljCMd2Vy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 093EA206D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=crapouillou.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:To:
	Subject:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LfZtxOTvke5v3y9jqI6NCvJm+agUKydnEfNZy18FW1M=; b=2DaqvAHGEyFAiST5fY0pgFqA6
	jiqphL7H1EDhflRsTId6IsiF6y+ipyRBb3XSUWsv8q4kHkxK9osUpg1y2Jdda7i0JvqFFEgyMB81t
	6KLosWLjtWMlw7VluSq3lVT7y7yLzjaha/dc3EdNb+dNOQUzuL/cTv9cP0GMqGBaUf5hj5+IovF2x
	WG4uwoF292UgskYjIxqb+vPTqjC67rz1qMN5nL1krZmi1+HTxYMHz7LyHqYn2e4ZW/54a2U6SewzH
	0dqdB3xeYzj926fn3rbAWNQKS2jCTH0yFjk12xr0f0NuzmUoxnkzxrCLeNtMn5jhAhjuyIrhxSdEp
	tsqDbupUQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyzxj-0006Zy-3f; Fri, 24 Jul 2020 15:50:19 +0000
Received: from crapouillou.net ([89.234.176.41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyzxh-0006Zb-9E
 for linux-mtd@lists.infradead.org; Fri, 24 Jul 2020 15:50:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1595605815; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zmYxQg3f44Gfe54sWwR6EKuiFSXTitHQSi3iS2LUHMI=;
 b=ljCMd2Vyh931R/TRz1ZpNR7/h5hBRDE8SPkdu7K6wxZAieSUbmNLXHIlRNzVRfeB/hjPoK
 WC/7xa8njLPe8EOnWTMYromP+DMBap7kbCiEdgd7frSt54TkOTDtmeuqnT/NVtwdtZuWXB
 z7/IcqTQnVt5tPsr9sNXlciRxL46a8U=
Date: Fri, 24 Jul 2020 17:50:06 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v3 2/2] mtd: rawnand: ingenic: Limit MTD_NAND_JZ4780 to
 architecture only
To: Krzysztof Kozlowski <krzk@kernel.org>
Message-Id: <IBDZDQ.K28R5FAI0BXI2@crapouillou.net>
In-Reply-To: <CAJKOXPc2w0QHQDEwqoeg9Nm361MszM4LRaCoJD2En-fPgPp+4Q@mail.gmail.com>
References: <20200724145401.2566-1-krzk@kernel.org>
 <20200724145401.2566-3-krzk@kernel.org>
 <PWBZDQ.D1XCW6N2YMRA@crapouillou.net>
 <CAJKOXPc2w0QHQDEwqoeg9Nm361MszM4LRaCoJD2En-fPgPp+4Q@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200724_115017_476949_D50CBBAE 
X-CRM114-Status: GOOD (  10.03  )
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



Le ven. 24 juil. 2020 =E0 17:33, Krzysztof Kozlowski <krzk@kernel.org> a =

=E9crit :
> On Fri, 24 Jul 2020 at 17:19, Paul Cercueil <paul@crapouillou.net> =

> wrote:
>> =

>>  Hi Krzysztof,
>> =

>> =

>>  Le ven. 24 juil. 2020 =E0 16:54, Krzysztof Kozlowski =

>> <krzk@kernel.org> a
>>  =E9crit :
>>  > Enabling the MTD_NAND_JZ4780 driver makes sense only for specific
>>  > hardware - the Ingenic SoC architecture.  Set it's dependency to
>>  > MACH_INGENIC so it will not appear on unrelated architectures =

>> (easier
>>  > job for downstream/distro kernel engineers).
>> =

>>  Disagreed. It was done this way so that distro kernels can support
>>  multiple SoCs.
> =

> They will still be able to support multiple SoCs. Nothing changed
> here. The same we do for all ARM drivers (SoCs are multiplatform)...
> Unless you want to say that it is possible to support Ingenic SoC
> without MACH_INGENIC?

On MIPS, the SoC selection is a Kconfig "choice", so you can only =

support one SoC family, unfortunately. I'm the one to blame for using =

"depends on MIPS || COMPILE_TEST" on ingenic drivers, maybe it should =

depend on MACH_INGENIC indeed, but then it should be made possible to =

support more than one SoC family.

That's something that should be pointed out to the MIPS mailing list, I =

believe.

Btw: Does that mean you are the new maintainer for drivers/memory/?

Cheers,
-Paul

> Best regards,
> Krzysztof



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
