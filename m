Return-Path: <SRS0=ZvR1=RQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C71CFC43381
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Mar 2019 12:47:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95E732171F
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Mar 2019 12:47:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="b2zXgVt6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="AsAMNnYg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95E732171F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=crapouillou.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:To:
	Subject:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WvfG63Xnj71OsUoivPsKsx0LXmlvgCi2bR9ebJG+pRA=; b=b2zXgVt6ef/7KmD2FyMhaDSDH
	FPJz8vCDPVd9ISjCnM0TaKyG/QhLnF8ZwJsHMgB6TBqIILCvUM4Jy73fwpVAhg6Nn9yGnjfuSLBA0
	GO8Ir2Zc+OgrWNbCBW9cgoV6z2IHHGWxLwKo0AHP70hUyz8vVbQln40f/S1lV/dM+8YH8cscZL9PJ
	L4FGBkF57TmqcgZxQUeWwWMiLcvOxnduxNloqLjHSMXO6ixYGL5Q9OWAgCJ1VMOGSjx4Fu4qvxtfh
	s4ZvX9zamPZCvC16dEU5Z2dRWUwqJ79raOwS7AoMu+5OEV28n9b1zIQsG176HV4WuMLSjDNXd6GPK
	UKn2gTG1A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h43Hd-0002Wc-SI; Wed, 13 Mar 2019 12:46:57 +0000
Received: from outils.crapouillou.net ([89.234.176.41] helo=crapouillou.net)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h43Ha-0002VT-6n
 for linux-mtd@lists.infradead.org; Wed, 13 Mar 2019 12:46:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1552481204; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lpLx8TDEbAzhN6basKpnA1clLFtf8oKedyNixevNEl4=;
 b=AsAMNnYg9hFu6/ZWA2ftTABrJ7yE3lPPuKrWyNoZUT3qyDtVbGw37FHk459sfGKeQ8Ezfk
 r8SZYRuwJ0S+EiIPp/cPPzK0QWstHWf5L3W4T3XAVbqDntq5hnkioqPVFQmVgvjlUnafBb
 9nTWBVnSSVGvjLIAZh3BB5AWEEx7iBM=
Date: Wed, 13 Mar 2019 09:46:40 -0300
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v4 8/9] mtd: rawnand: ingenic: Add support for the JZ4725B
To: Miquel Raynal <miquel.raynal@bootlin.com>
Message-Id: <1552481200.2412.0@crapouillou.net>
In-Reply-To: <20190304200947.69237b05@xps13>
References: <20190209192305.4434-1-paul@crapouillou.net>
 <20190209192305.4434-8-paul@crapouillou.net> <20190304113519.2e102b25@xps13>
 <1551724204.4932.6@crapouillou.net> <20190304200947.69237b05@xps13>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190313_054654_621454_0E2FE2A6 
X-CRM114-Status: GOOD (  23.11  )
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
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 Harvey Hunt <harveyhuntnexus@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Miquel,

Le lun. 4 mars 2019 =E0 16:09, Miquel Raynal <miquel.raynal@bootlin.com> =

a =E9crit :
> Hi Paul,
> =

> Paul Cercueil <paul@crapouillou.net> wrote on Mon, 04 Mar 2019 =

> 19:30:04
> +0100:
> =

>>  On Mon, Mar 4, 2019 at 11:35 AM, Miquel Raynal =

>> <miquel.raynal@bootlin.com> wrote:
>>  > Hi Paul,
>>  >
>>  > Paul Cercueil <paul@crapouillou.net =

>> <mailto:paul@crapouillou.net>> > wrote on Sat,  9 Feb 2019 16:23:04
>>  > -0300:
>>  >
>>  >>  The boot ROM of the JZ4725B SoC expects a specific OOB layout =

>> on the
>>  >>  NAND, so we use it unconditionally in the ingenic-nand driver.
>>  >> >>  Also add the jz4725b-bch driver to support the =

>> JZ4725B-specific BCH
>>  >>  hardware.
>>  >> >>  Signed-off-by: Paul Cercueil <paul@crapouillou.net >> =

>> <mailto:paul@crapouillou.net>>
>>  >>  ---
>>  >> >>  Changes:
>>  >> >>  v2: Instead of forcing the OOB layout, leave it to the board =

>> code or
>>  >>      devicetree to decide if the jz4725b-specific layout should =

>> be >> used
>>  >>      or not.
>>  >> >>  v3: - Revert the change in v2, as the previous behaviour was =

>> >> correct.
>>  >>      - Also add support for the hardware BCH of the JZ4725B in =

>> this
>>  >>        patch.
>>  >> >>  v4: - Add MODULE_* macros
>>  >>      - Add tweaks suggested by upstream feedback
>>  >> >>   drivers/mtd/nand/raw/ingenic/Kconfig        |  10 +
>>  >>   drivers/mtd/nand/raw/ingenic/Makefile       |   1 +
>>  >>   drivers/mtd/nand/raw/ingenic/ingenic_nand.c |  48 ++++-
>>  >>   drivers/mtd/nand/raw/ingenic/jz4725b_bch.c  | 292 >> =

>> ++++++++++++++++++++++++++++
>>  >>   4 files changed, 350 insertions(+), 1 deletion(-)
>>  >>   create mode 100644 drivers/mtd/nand/raw/ingenic/jz4725b_bch.c
>>  >> >
>>  > [...]
>>  >
>>  >>  +static int jz4725b_calculate(struct ingenic_ecc *bch,
>>  >>  +			     struct ingenic_ecc_params *params,
>>  >>  +			     const u8 *buf, u8 *ecc_code)
>>  >>  +{
>>  >>  +	int ret;
>>  >>  +
>>  >>  +	mutex_lock(&bch->lock);
>>  >>  +	ret =3D jz4725b_bch_init(bch, params, true);
>>  >
>>  > I really don't like this bch_init name. A BCH initialization is =

>> what > is
>>  > supposed to be done only once (probably at boot time), can you =

>> find a
>>  > better name or a better organization of the correct/calculate =

>> path?
>> =

>>  jz4725b_bch_setup() maybe?
> =

> Unless I am not understanding what this does, I don't get why you =

> would
> need to do this setup everytime you want to use the ECC engine. Are =

> you
> sure this is needed?

It configures the hardware for a new ECC encoding or decoding sequence, =

so
yes, it has to be done everytime.

-Paul


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
