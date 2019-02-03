Return-Path: <SRS0=velq=QK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 167BFC169C4
	for <linux-mtd@archiver.kernel.org>; Sun,  3 Feb 2019 07:20:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC3D221773
	for <linux-mtd@archiver.kernel.org>; Sun,  3 Feb 2019 07:20:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="W+Q72eSF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Agl1cztn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC3D221773
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+O7ZwjwhtEnfP0Af7QBatkSVCy+qXMwkkbI76pYFoWk=; b=W+Q72eSFwzpYfH
	hUlByadcPE7GYh8Nmg1I3glkK0aVOSGd7//DBm7GqdWmGFMywJAipJQTssyGERX2ILTwmFVilr1B7
	Rv1DLGUaq8Fcv5da7aIT1Hpp96Guc/NfvFFcVq2US4N7ug+34bbT19hnivTTchGCw57m1Yo0NRdI3
	vAANTMYHOlJIljSSAAXdzqupbqEpv+yP5w5m1B2/z5L8DJ/MZ4Hfg4KNm51S5r9Xxbi1ntL/aUyH7
	wR9jLDIeWUaVoxyNYrUI12sK6vLnEwiHWTwBoN5MxDE38fmnxeKWbnUuUKijnwNm2NfliB4JMpFTR
	a1n1BLuN1IiXNuKIBVQw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gqC5D-0008P0-5I; Sun, 03 Feb 2019 07:20:51 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqC59-0008O6-C1
 for linux-mtd@lists.infradead.org; Sun, 03 Feb 2019 07:20:49 +0000
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 20C862084A;
 Sun,  3 Feb 2019 07:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1549178444;
 bh=NYk2/w8NFc9KntzXwgaJ6rZ+QHz1zwAqsPOMK/U+nh4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Agl1cztn/tmrzq3sqtj2ubBhY3kV/makjWyJbx+wTSOVi5dlghpA+2UVDVekb1Izj
 b4hmz6s7d74o4voLbQPspManJWBDXZ9nCIINusLqW+fCFsg0LyHuMo+yrRMf/VbVu+
 h1gb+d5nRyl4v72pE9zsfucvXkhrvNNawkFqeAgc=
Date: Sun, 3 Feb 2019 08:20:32 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 0/9] Ingenic JZ4780 NAND patchset v2
Message-ID: <20190203082032.6e37c523@bbrezillon>
In-Reply-To: <20190202231926.2444-1-paul@crapouillou.net>
References: <20190202231926.2444-1-paul@crapouillou.net>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190202_232047_931378_C1D2BE3C 
X-CRM114-Status: GOOD (  16.33  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Mathieu Malaterre <malat@debian.org>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 Harvey Hunt <harveyhuntnexus@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sat,  2 Feb 2019 20:19:17 -0300
Paul Cercueil <paul@crapouillou.net> wrote:

> Hi,
> 
> As requested by Boris, I added a patch to move all the Ingenic NAND
> drivers to their own directory.
> 
> In this V2 I added support for the JZ4740 SoC. The combo of the
> jz4780-nemc, jz4780-nand and jz4740-bch now obsolete the old and dusty
> jz4740-nand driver.

Any plan to get the old driver removed? I guess you want to migrate the
boards to DT first.

> 
> To support the only upstream JZ4740-based board we have, the Ben
> Nanonote, I added an option to specify the OOB layout of that device
> from a device property string.
> 
> Finally, I dropped the last two patches that moved the platform NAND
> code to devicetree; I will upstream them as part of a different
> patchset.
> 
> Cheers,
> -Paul
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
