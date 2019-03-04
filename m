Return-Path: <SRS0=RlT6=RH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3D54C43381
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 18:26:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7426E20663
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 18:26:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gXhOJeNy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="QLrIUJGK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7426E20663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=crapouillou.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:To:
	Subject:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=71wO+ZCDxPM6CTbhCdjQ6L6X9KjgqeRJPWc9GN0333E=; b=gXhOJeNyPpJnAjCnkx/GNa/ne
	vbeEQ/iJ8mYoFWsDyGyMHNhZGjbxFW/0sq79dxeoR6+Zl7ai3V6yDDMBVkFs4D7qFUcw/A2PX7MqZ
	yY3GljEoVuzwzbV2agaD/yQFq7+RqyzP2Ucqk/jNxdY1+XGAMP61T+A3AhrZLycZq+7lx33rE2+Yy
	lyHckTl8jUYGB8r69f3Jk2Z8pl68i4cqLBX9SFoKFsQXtNSX+Qb3zd/ZEAKTZCyCD7xPcR6bHdfns
	x5y5tZa4mtSdVLAUteEUH5p/7QcJYxE+rC8Pfff1XwDdWT7Qh5KHOwn/IhHymeb48tSCGxpQb1G+j
	EOjsc3uMQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h0sIA-0003Fe-8p; Mon, 04 Mar 2019 18:26:22 +0000
Received: from outils.crapouillou.net ([89.234.176.41] helo=crapouillou.net)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0sI6-0003Ep-JI
 for linux-mtd@lists.infradead.org; Mon, 04 Mar 2019 18:26:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1551723975; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AKYMXddv8sOWyO8ziFgxyWSaKQEpPo4k2jXSN/BG3dI=;
 b=QLrIUJGKb06+ImxXzPaCvyfurdt1Z8g8RlCF//svkOvMC8Iotgil588hyyllTRftiIQ8dA
 0xcat6W6R+x4m/2S4wIdSyTf2W5ndlkJIZoO2kCN6ebUnVD7V2d8lkxuv7A5wAGKXZtISC
 d4h4r20n5fcS1cUxjwilckQqUtn48Gs=
Date: Mon, 04 Mar 2019 19:26:08 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v4 6/9] mtd: rawnand: ingenic: Separate top-level and SoC
 specific code
To: Miquel Raynal <miquel.raynal@bootlin.com>
Message-Id: <1551723968.4932.4@crapouillou.net>
In-Reply-To: <20190304112058.67cd5194@xps13>
References: <20190209192305.4434-1-paul@crapouillou.net>
 <20190209192305.4434-6-paul@crapouillou.net> <20190304112058.67cd5194@xps13>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190304_102619_094391_D7FA8D15 
X-CRM114-Status: GOOD (  23.07  )
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


On Mon, Mar 4, 2019 at 11:20 AM, Miquel Raynal =

<miquel.raynal@bootlin.com> wrote:
> Hi Paul,
> =

> Paul Cercueil <paul@crapouillou.net <mailto:paul@crapouillou.net>> =

> wrote on Sat,  9 Feb 2019 16:23:02
> -0300:
> =

>>  The ingenic-nand driver uses an API provided by the jz4780-bch =

>> driver.
>>  This makes it difficult to support other SoCs in the jz4780-bch =

>> driver.
>>  To work around this, we separate the API functions from the =

>> SoC-specific
>>  code, so that these API functions are SoC-agnostic.
>> =

> =

> I like the idea, actually I am working on this separation (see
> [1]) and I would really appreciate that you try to implement the
> interface when it will be available (v2 is coming this week, I think =

> v3
> will be the one to test when raw NAND devices will be properly
> supported). I will add you in Cc: if you want to follow/review.
> =

> [1] =

> <http://lists.infradead.org/pipermail/linux-mtd/2019-February/087815.html>

Do you think this will be ready for 5.2?

You can add me in Cc:.

>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net =

>> <mailto:paul@crapouillou.net>>
>>  ---
>> =

>>  v2: Add an optional .probe() callback. It is used for instance to =

>> set
>>      the clock rate in the JZ4780 backend.
>> =

>>  v3: The common code is now inside the ingenic-ecc module. Each
>>      SoC-specific ECC code is now in its own module, which leaves to =

>> the
>>      user the choice of which (if any) ECC code should be supported.
>> =

>>  v4: No change
>> =

>>   drivers/mtd/nand/raw/ingenic/Kconfig        |  17 +++
>>   drivers/mtd/nand/raw/ingenic/Makefile       |   5 +-
>>   drivers/mtd/nand/raw/ingenic/ingenic_ecc.c  | 157 =

>> +++++++++++++++++++++++++
>>   drivers/mtd/nand/raw/ingenic/ingenic_ecc.h  |  84 ++++++++++++++
>>   drivers/mtd/nand/raw/ingenic/ingenic_nand.c |  38 +++----
>>   drivers/mtd/nand/raw/ingenic/jz4780_bch.c   | 170 =

>> +++++-----------------------
>>   drivers/mtd/nand/raw/ingenic/jz4780_bch.h   |  40 -------
>>   7 files changed, 308 insertions(+), 203 deletions(-)
>>   create mode 100644 drivers/mtd/nand/raw/ingenic/ingenic_ecc.c
>>   create mode 100644 drivers/mtd/nand/raw/ingenic/ingenic_ecc.h
>>   delete mode 100644 drivers/mtd/nand/raw/ingenic/jz4780_bch.h
>> =

> =

> [...]
> =

>>  diff --git a/drivers/mtd/nand/raw/ingenic/ingenic_nand.c =

>> b/drivers/mtd/nand/raw/ingenic/ingenic_nand.c
>>  index 8c73f7c5be9a..0f51fd15fe79 100644
>>  --- a/drivers/mtd/nand/raw/ingenic/ingenic_nand.c
>>  +++ b/drivers/mtd/nand/raw/ingenic/ingenic_nand.c
>>  @@ -22,7 +22,7 @@
>> =

>>   #include <linux/jz4780-nemc.h>
>> =

>>  -#include "jz4780_bch.h"
>>  +#include "ingenic_ecc.h"
>> =

>>   #define DRV_NAME	"ingenic-nand"
>> =

>>  @@ -40,7 +40,7 @@ struct ingenic_nand_cs {
>> =

>>   struct ingenic_nfc {
>>   	struct device *dev;
>>  -	struct jz4780_bch *bch;
>>  +	struct ingenic_ecc *ecc;
>>   	struct nand_controller controller;
>>   	unsigned int num_banks;
>>   	struct list_head chips;
>>  @@ -124,10 +124,10 @@ static int ingenic_nand_ecc_calculate(struct =

>> nand_chip *chip, const u8 *dat,
>>   {
>>   	struct ingenic_nand *nand =3D to_ingenic_nand(nand_to_mtd(chip));
>>   	struct ingenic_nfc *nfc =3D to_ingenic_nfc(nand->chip.controller);
>>  -	struct jz4780_bch_params params;
>>  +	struct ingenic_ecc_params params;
>> =

>>   	/*
>>  -	 * Don't need to generate the ECC when reading, BCH does it for =

>> us as
>>  +	 * Don't need to generate the ECC when reading, ECC does it for =

>> us as
> =

> "the ECC engine does it for us" would be more meaningful.

OK.

>>   	 * part of decoding/correction.
>>   	 */
>>   	if (nand->reading)
>>  @@ -137,7 +137,7 @@ static int ingenic_nand_ecc_calculate(struct =

>> nand_chip *chip, const u8 *dat,
>>   	params.bytes =3D nand->chip.ecc.bytes;
>>   	params.strength =3D nand->chip.ecc.strength;
>> =

>>  -	return jz4780_bch_calculate(nfc->bch, &params, dat, ecc_code);
>>  +	return ingenic_ecc_calculate(nfc->ecc, &params, dat, ecc_code);
>>   }
>> =

> =

> Thanks,
> Miqu=E8l



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
