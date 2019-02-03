Return-Path: <SRS0=velq=QK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 668E9C169C4
	for <linux-mtd@archiver.kernel.org>; Sun,  3 Feb 2019 15:41:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27F3D2177E
	for <linux-mtd@archiver.kernel.org>; Sun,  3 Feb 2019 15:41:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eEApU/Nu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="TIbNGkcP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27F3D2177E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=crapouillou.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:To:
	Subject:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=K0X+gBETY3RDpFsPW0qn6RZSUzuqxT7g6eh2hg5jwMM=; b=eEApU/NuxuQYmg1Z2ZQvz43pn
	0Hq74Xk5UCxMQENVz5rjXSp+Sx85dJi7DCCqYWPsRZAshrzce48HeAg9EyWEEbI+oVX60vHGT3ULh
	mCVSELU/26cKyT33IiOljgb5VGGtkD6B+VbDCmNb5q1lghY1LQP+YIs5vigctRdMdYgEOBl3Bq4aE
	HoSt2EuBON6gIhl1JFb7Ueo3zjwyHnR3zf8DECxShgxyGczfu5l/wIAJJYrRzns1RnNO/HHvtIrFe
	ZGAFvsaMHOehPHHWK5u/uftSvzSQjNAGkcz2Gp0EJLdt3DJEdyMqDTcRdfJTJMwBMjugm40HaDhqK
	1PFCjDZtQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gqJu5-0004wc-H7; Sun, 03 Feb 2019 15:41:53 +0000
Received: from outils.crapouillou.net ([89.234.176.41] helo=crapouillou.net)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqJu1-0004w3-58
 for linux-mtd@lists.infradead.org; Sun, 03 Feb 2019 15:41:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1549208504; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cxGqXpC15cN9qReCJvF1w7F/vVYzPLdTdA/x6plKpns=;
 b=TIbNGkcPzEkP24OAg1Han7HkdFyf1txRGmgtSPipsh2BGcqcyPGk6G3qJ1k/VOL7RU6wXY
 mijlurskzDNaQLSK6FgTP2myYH9onS1q+TBINXOO6NZuMpixDoBCA1Arz+atRWLgANIO1c
 IWFsOAamV3Xl0KU5RqyGdWX5Cx92fA4=
Date: Sun, 03 Feb 2019 12:41:30 -0300
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 9/9] mtd: rawnand: jz4780-bch: Add support for the
 JZ4740
To: Boris Brezillon <bbrezillon@kernel.org>
Message-Id: <1549208490.1588.1@crapouillou.net>
In-Reply-To: <20190203160709.29d7d721@bbrezillon>
References: <20190202231926.2444-1-paul@crapouillou.net>
 <20190202231926.2444-10-paul@crapouillou.net>
 <20190203083505.4dc52278@bbrezillon> <1549202293.1950.2@crapouillou.net>
 <20190203151604.23061e2a@bbrezillon> <1549205792.1588.0@crapouillou.net>
 <20190203160709.29d7d721@bbrezillon>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190203_074149_747935_8D6B1420 
X-CRM114-Status: GOOD (  20.82  )
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



Le dim. 3 f=E9vr. 2019 =E0 12:07, Boris Brezillon <bbrezillon@kernel.org> =

a =E9crit :
> On Sun, 03 Feb 2019 11:56:32 -0300
> Paul Cercueil <paul@crapouillou.net> wrote:
> =

>>  Le dim. 3 f=E9vr. 2019 =E0 11:16, Boris Brezillon =

>> <bbrezillon@kernel.org>
>>  a =E9crit :
>>  > On Sun, 03 Feb 2019 10:58:13 -0300
>>  > Paul Cercueil <paul@crapouillou.net> wrote:
>>  >
>>  >>  Le dim. 3 f=E9vr. 2019 =E0 4:35, Boris Brezillon
>>  >> <bbrezillon@kernel.org>
>>  >>  a =E9crit :
>>  >>  > On Sat,  2 Feb 2019 20:19:26 -0300
>>  >>  > Paul Cercueil <paul@crapouillou.net> wrote:
>>  >>  >
>>  >>  >>  Add the backend code for the jz4780-bch driver to support =

>> the
>>  >> JZ4740
>>  >>  >>  SoC from Ingenic.
>>  >>  >>
>>  >>  >>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>  >>  >>  ---
>>  >>  >>
>>  >>  >>  Changes:
>>  >>  >>
>>  >>  >>  v2: New patch
>>  >>  >>
>>  >>  >>   drivers/mtd/nand/raw/ingenic/Makefile         |   2 +-
>>  >>  >>   drivers/mtd/nand/raw/ingenic/jz4740_bch.c     | 173
>>  >>  >> ++++++++++++++++++
>>  >>  >>   .../mtd/nand/raw/ingenic/jz4780_bch_common.c  |   1 +
>>  >>  >>   .../nand/raw/ingenic/jz4780_bch_internal.h    |   1 +
>>  >>  >>   4 files changed, 176 insertions(+), 1 deletion(-)
>>  >>  >>   create mode 100644 =

>> drivers/mtd/nand/raw/ingenic/jz4740_bch.c
>>  >>  >>
>>  >>  >>  diff --git a/drivers/mtd/nand/raw/ingenic/Makefile
>>  >>  >> b/drivers/mtd/nand/raw/ingenic/Makefile
>>  >>  >>  index f38b467490cf..d16c96113a93 100644
>>  >>  >>  --- a/drivers/mtd/nand/raw/ingenic/Makefile
>>  >>  >>  +++ b/drivers/mtd/nand/raw/ingenic/Makefile
>>  >>  >>  @@ -1,3 +1,3 @@
>>  >>  >>   obj-$(CONFIG_MTD_NAND_JZ4740) +=3D jz4740_nand.o
>>  >>  >>   obj-$(CONFIG_MTD_NAND_JZ4780) +=3D jz4780_nand.o
>>  >> jz4780_bch_common.o
>>  >>  >> \
>>  >>  >>  -				 jz4780_bch.o jz4725b_bch.o
>>  >>  >>  +				 jz4780_bch.o jz4725b_bch.o jz4740_bch.o
>>  >>  >
>>  >>  > I still don't see the point of the =

>> jz4780_bch_common/jz47xxx_bch
>>  >>  > separation. You seem to always embed all objects anyway, so =

>> you
>>  >> can
>>  >>  > just put the code for both engines in the same source file and
>>  >> decide
>>  >>  > which one to use based on the compat (which you already do
>>  >> anyway).
>>  >>
>>  >>  Each SoC has a different set of registers for the BCH hardware. =

>> I
>>  >> can
>>  >>  try to
>>  >>  cram everything into one file, but it won't be that much =

>> cleaner.
>>  >
>>  > Then maybe they deserve separate drivers/modules.
>>  >
>>  > BTW, didn't you say that one IP uses Reed-Salomon instead of BCH. =

>> I'd
>>  > suggest prefixing structs and functions with jz47xx_ecc instead of
>>  > jz47xx_bch and naming the common part jz47xx_ecc.c to reflect =

>> that.
>> =

>>  Would it be a good idea to make a generic ECC API that the =

>> jz47xx_nand
>>  driver could use? Then the three jz47xx BCH codepaths could be =

>> separate
>>  drivers that register with the generic ECC core.
> =

> Definitely. Actually, Miquel is already working on that, but I don't
> think it's a good idea to wait for this new framework to be finished =

> to
> get your changes merged. So I'd recommend having a jz specific ECC API
> (pretty much the one you have in the common file expect it would be
> prefixed with _ecc instead of _bch) and convert it to the generic
> approach afterwards. Given the size of the common.c file, you can even
> put everything in jz47xx_ecc.h as inline funcs to avoid having yet
> another module.

Ok, perfect, I'll do that.
Thank you for your input!


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
