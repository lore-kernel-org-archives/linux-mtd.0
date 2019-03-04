Return-Path: <SRS0=RlT6=RH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3095AC43381
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 18:30:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 027D32070B
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 18:30:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QGjUwrVo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="OUggZ/k/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 027D32070B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=crapouillou.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:To:
	Subject:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2h6ySNcDq9BQq6/Zw0WrqS+ODIP89hN1JkAiMGoCuio=; b=QGjUwrVoBPTuBAjBW761A0gxO
	QiRuCkG3dmgqGaJ1zSjUz4f/6WZJv63WcpUgjNEtIjyxsOolNy4GhNxK9eUw9ylm/CNmoIwPUluZA
	Zruxgnb6/RvYRrV+LiqSrt8TMMTeTjN5RHpLQ8HRiJQnTW6RTILUCgqx5YBtuc39iKw9mKfDOGkhy
	N+ttt0h73P9spqJZK1vvhfvqiGIx40pzamJRSLwneq4fxQ3OM2URu5wxsFoDtcUtSYLy9rm55fCzd
	PdcCdwohxHAKOzOmHbyFL6jVQwtX82xemsZy6hCQFH8jcOdRL8Iy5Eg6EVKB6Y3PwrqPRuGRu9vn/
	z/F+Iv8TA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h0sLy-0005Qq-7i; Mon, 04 Mar 2019 18:30:18 +0000
Received: from outils.crapouillou.net ([89.234.176.41] helo=crapouillou.net)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0sLv-0005QN-4K
 for linux-mtd@lists.infradead.org; Mon, 04 Mar 2019 18:30:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1551724211; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EsmaaCq8B4rgZWIMIgx7ZDtvqLzoJjOiO2PVEtrXTX8=;
 b=OUggZ/k/Wm5Ryfu5a4ItgJaiGppEE4L2XSvVdilrCJIC/jAzPdaVZVizFd2lGpGDo9VoUf
 ZcGfO/wcf/BC9sjXV4KxJ/qxcHwznGhMYiFDnAL6FUM+3sA+EdPKzwU5LxWoNGbl99i9GM
 DK5ysQUg/ZMgzACaZQky12O4d8SwPrY=
Date: Mon, 04 Mar 2019 19:30:04 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v4 8/9] mtd: rawnand: ingenic: Add support for the JZ4725B
To: Miquel Raynal <miquel.raynal@bootlin.com>
Message-Id: <1551724204.4932.6@crapouillou.net>
In-Reply-To: <20190304113519.2e102b25@xps13>
References: <20190209192305.4434-1-paul@crapouillou.net>
 <20190209192305.4434-8-paul@crapouillou.net> <20190304113519.2e102b25@xps13>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190304_103015_542142_19A25951 
X-CRM114-Status: GOOD (  21.60  )
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


On Mon, Mar 4, 2019 at 11:35 AM, Miquel Raynal =

<miquel.raynal@bootlin.com> wrote:
> Hi Paul,
> =

> Paul Cercueil <paul@crapouillou.net <mailto:paul@crapouillou.net>> =

> wrote on Sat,  9 Feb 2019 16:23:04
> -0300:
> =

>>  The boot ROM of the JZ4725B SoC expects a specific OOB layout on the
>>  NAND, so we use it unconditionally in the ingenic-nand driver.
>> =

>>  Also add the jz4725b-bch driver to support the JZ4725B-specific BCH
>>  hardware.
>> =

>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net =

>> <mailto:paul@crapouillou.net>>
>>  ---
>> =

>>  Changes:
>> =

>>  v2: Instead of forcing the OOB layout, leave it to the board code or
>>      devicetree to decide if the jz4725b-specific layout should be =

>> used
>>      or not.
>> =

>>  v3: - Revert the change in v2, as the previous behaviour was =

>> correct.
>>      - Also add support for the hardware BCH of the JZ4725B in this
>>        patch.
>> =

>>  v4: - Add MODULE_* macros
>>      - Add tweaks suggested by upstream feedback
>> =

>>   drivers/mtd/nand/raw/ingenic/Kconfig        |  10 +
>>   drivers/mtd/nand/raw/ingenic/Makefile       |   1 +
>>   drivers/mtd/nand/raw/ingenic/ingenic_nand.c |  48 ++++-
>>   drivers/mtd/nand/raw/ingenic/jz4725b_bch.c  | 292 =

>> ++++++++++++++++++++++++++++
>>   4 files changed, 350 insertions(+), 1 deletion(-)
>>   create mode 100644 drivers/mtd/nand/raw/ingenic/jz4725b_bch.c
>> =

> =

> [...]
> =

>>  +static int jz4725b_calculate(struct ingenic_ecc *bch,
>>  +			     struct ingenic_ecc_params *params,
>>  +			     const u8 *buf, u8 *ecc_code)
>>  +{
>>  +	int ret;
>>  +
>>  +	mutex_lock(&bch->lock);
>>  +	ret =3D jz4725b_bch_init(bch, params, true);
> =

> I really don't like this bch_init name. A BCH initialization is what =

> is
> supposed to be done only once (probably at boot time), can you find a
> better name or a better organization of the correct/calculate path?

jz4725b_bch_setup() maybe?

>>  +	if (ret) {
>>  +		dev_err(bch->dev, "Unable to init BCH with given parameters\n");
>>  +		goto out_disable;
>>  +	}
>>  +
>>  +	jz4725b_bch_write_data(bch, buf, params->size);
>>  +
>>  +	ret =3D jz4725b_bch_wait_complete(bch, BCH_BHINT_ENCF, NULL);
>>  +	if (ret) {
>>  +		dev_err(bch->dev, "timed out while calculating ECC\n");
>>  +		goto out_disable;
>>  +	}
>>  +
>>  +	jz4725b_bch_read_parity(bch, ecc_code, params->bytes);
>>  +
>>  +out_disable:
>>  +	jz4725b_bch_disable(bch);
>>  +	mutex_unlock(&bch->lock);
>>  +
>>  +	return ret;
>>  +}
>>  +
> =

> [...]
> =

> Thanks,
> Miqu=E8l



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
