Return-Path: <SRS0=0U+/=U6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C7FAC0650E
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jul 2019 12:34:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E99C20881
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jul 2019 12:34:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rTnzPHW+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="E0sGXP6R"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E99C20881
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=crapouillou.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:To:
	Subject:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KDCAqretK4SmSFyxDSbpl7+GxcAv29z9k3b8p+gFxZM=; b=rTnzPHW+kP77WpXTKf8JEbG2L
	UaBM4oUysIeRQEtQtTbB1dGR6u08EX0JA4f69Gvq/djrfgxMssKyjWmiSLPh+NpZeEugTblAUu7K1
	PftAgcA/c3AoQtgDsXZ1p4tr0fPCANVaEMAwo2Y56V7LrfKk5Dxt3tbmvPVKMO58xwEPYLIkN/YjO
	vJ0bhtnyJcwRgbkvWkpT1Wj6yvGQzPJXX99z3QFHbInBuTyRfxpIDayWk7O3Kr7kBNVHJonD4Cqxs
	Nh7uKv5vPPZrMjF1HGy+ztzBJXN+2jGtvMQ9GJ2svlFgDmgttr2bnmJ6LriDIbRRgc+cH7QJQxHrn
	3KJ4kX6bg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hhvVp-0007Kl-Rk; Mon, 01 Jul 2019 12:34:25 +0000
Received: from outils.crapouillou.net ([89.234.176.41] helo=crapouillou.net)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hhvVm-0007JW-Bt
 for linux-mtd@lists.infradead.org; Mon, 01 Jul 2019 12:34:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1561984453; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GKdiybgHwDA7Rf/+crtL91g2jVq40fX1lbPYqcmDUIc=;
 b=E0sGXP6Rjt92eLRONxsaEYEjWc2c1tVfvUHUUzoBY6FQC+6ALxc5rGcxzDCOIzAYXfZHCV
 SXDwEiwzZdHvgXsDo2To51nqShAQpG+v5883uoYa4J2G4owqKydPZrgz1ErG/7ns3P7rdB
 MlrykTmEQYkZjnjuIry0PZWm4VDkF1Y=
Date: Mon, 01 Jul 2019 14:34:07 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] mtd: rawnand: ingenic: Fix ingenic_ecc dependency
To: Miquel Raynal <miquel.raynal@bootlin.com>
Message-Id: <1561984447.1999.0@crapouillou.net>
In-Reply-To: <20190701142847.1c1ac4b1@xps13>
References: <20190629012248.12447-1-paul@crapouillou.net>
 <20190701142847.1c1ac4b1@xps13>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190701_053422_795639_37B6EB3D 
X-CRM114-Status: GOOD (  13.96  )
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
Cc: Arnd Bergmann <arnd@arndb.de>, Richard Weinberger <richard@nod.at>,
 YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Hulk Robot <hulkci@huawei.com>, od@zcrc.me,
 linux-mtd@lists.infradead.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



Le lun. 1 juil. 2019 =E0 14:28, Miquel Raynal =

<miquel.raynal@bootlin.com> a =E9crit :
> Hi Paul,
> =

> One question below.
> =

> Paul Cercueil <paul@crapouillou.net> wrote on Sat, 29 Jun 2019 =

> 03:22:48
> +0200:
> =

>>  If MTD_NAND_JZ4780 is y and MTD_NAND_JZ4780_BCH is m,
>>  which select CONFIG_MTD_NAND_INGENIC_ECC to m, building fails:
>> =

>>  drivers/mtd/nand/raw/ingenic/ingenic_nand.o: In function =

>> `ingenic_nand_remove':
>>  ingenic_nand.c:(.text+0x177): undefined reference to =

>> `ingenic_ecc_release'
>>  drivers/mtd/nand/raw/ingenic/ingenic_nand.o: In function =

>> `ingenic_nand_ecc_correct':
>>  ingenic_nand.c:(.text+0x2ee): undefined reference to =

>> `ingenic_ecc_correct'
>> =

>>  To fix that, the ingenic_nand and ingenic_ecc modules have been =

>> fused
>>  into one single module.
>>  - The ingenic_ecc.c code is now compiled in only if
>>    $(CONFIG_MTD_NAND_INGENIC_ECC) is set. This is now a boolean =

>> instead
>>    of tristate.
>>  - To avoid changing the module name, the ingenic_nand.c file is =

>> moved to
>>    ingenic_nand_drv.c. Then the module name is still ingenic_nand.
>>  - Since ingenic_ecc.c is no more a module, the module-specific =

>> macros
>>    have been dropped, and the functions are no more exported for use =

>> by
>>    the ingenic_nand driver.
> =

> I am fine with this approach.
> =

>> =

>>  Fixes: 15de8c6efd0e ("mtd: rawnand: ingenic: Separate top-level and =

>> SoC specific code")
>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>  Reported-by: Arnd Bergmann <arnd@arndb.de>
>>  Reported-by: Hulk Robot <hulkci@huawei.com>
>>  Cc: YueHaibing <yuehaibing@huawei.com>
>>  Cc: stable@vger.kernel.org
>>  ---
>>   drivers/mtd/nand/raw/ingenic/Kconfig                     | 2 +-
>>   drivers/mtd/nand/raw/ingenic/Makefile                    | 4 +++-
>>   drivers/mtd/nand/raw/ingenic/ingenic_ecc.c               | 9 =

>> ---------
>>   .../raw/ingenic/{ingenic_nand.c =3D> ingenic_nand_drv.c}   | 0
>>   4 files changed, 4 insertions(+), 11 deletions(-)
>>   rename drivers/mtd/nand/raw/ingenic/{ingenic_nand.c =3D> =

>> ingenic_nand_drv.c} (100%)
>> =

>>  diff --git a/drivers/mtd/nand/raw/ingenic/Kconfig =

>> b/drivers/mtd/nand/raw/ingenic/Kconfig
>>  index 19a96ce515c1..66b7cffdb0c2 100644
>>  --- a/drivers/mtd/nand/raw/ingenic/Kconfig
>>  +++ b/drivers/mtd/nand/raw/ingenic/Kconfig
>>  @@ -16,7 +16,7 @@ config MTD_NAND_JZ4780
>>   if MTD_NAND_JZ4780
>> =

>>   config MTD_NAND_INGENIC_ECC
>>  -	tristate
>>  +	bool
>> =

>>   config MTD_NAND_JZ4740_ECC
>>   	tristate "Hardware BCH support for JZ4740 SoC"
>>  diff --git a/drivers/mtd/nand/raw/ingenic/Makefile =

>> b/drivers/mtd/nand/raw/ingenic/Makefile
>>  index 1ac4f455baea..b63d36889263 100644
>>  --- a/drivers/mtd/nand/raw/ingenic/Makefile
>>  +++ b/drivers/mtd/nand/raw/ingenic/Makefile
>>  @@ -2,7 +2,9 @@
>>   obj-$(CONFIG_MTD_NAND_JZ4740) +=3D jz4740_nand.o
>>   obj-$(CONFIG_MTD_NAND_JZ4780) +=3D ingenic_nand.o
>> =

>>  -obj-$(CONFIG_MTD_NAND_INGENIC_ECC) +=3D ingenic_ecc.o
>>  +ingenic_nand-y +=3D ingenic_nand_drv.o
>>  +ingenic_nand-$(CONFIG_MTD_NAND_INGENIC_ECC) +=3D ingenic_ecc.o
>>  +
>>   obj-$(CONFIG_MTD_NAND_JZ4740_ECC) +=3D jz4740_ecc.o
>>   obj-$(CONFIG_MTD_NAND_JZ4725B_BCH) +=3D jz4725b_bch.o
>>   obj-$(CONFIG_MTD_NAND_JZ4780_BCH) +=3D jz4780_bch.o
>>  diff --git a/drivers/mtd/nand/raw/ingenic/ingenic_ecc.c =

>> b/drivers/mtd/nand/raw/ingenic/ingenic_ecc.c
>>  index d3e085c5685a..c954189606f6 100644
>>  --- a/drivers/mtd/nand/raw/ingenic/ingenic_ecc.c
>>  +++ b/drivers/mtd/nand/raw/ingenic/ingenic_ecc.c
>>  @@ -30,7 +30,6 @@ int ingenic_ecc_calculate(struct ingenic_ecc *ecc,
>>   {
>>   	return ecc->ops->calculate(ecc, params, buf, ecc_code);
>>   }
>>  -EXPORT_SYMBOL(ingenic_ecc_calculate);
>> =

>>   /**
>>    * ingenic_ecc_correct() - detect and correct bit errors
>>  @@ -51,7 +50,6 @@ int ingenic_ecc_correct(struct ingenic_ecc *ecc,
>>   {
>>   	return ecc->ops->correct(ecc, params, buf, ecc_code);
>>   }
>>  -EXPORT_SYMBOL(ingenic_ecc_correct);
>> =

>>   /**
>>    * ingenic_ecc_get() - get the ECC controller device
>>  @@ -111,7 +109,6 @@ struct ingenic_ecc *of_ingenic_ecc_get(struct =

>> device_node *of_node)
>>   	}
>>   	return ecc;
>>   }
>>  -EXPORT_SYMBOL(of_ingenic_ecc_get);
>> =

>>   /**
>>    * ingenic_ecc_release() - release the ECC controller device
>>  @@ -122,7 +119,6 @@ void ingenic_ecc_release(struct ingenic_ecc =

>> *ecc)
>>   	clk_disable_unprepare(ecc->clk);
>>   	put_device(ecc->dev);
>>   }
>>  -EXPORT_SYMBOL(ingenic_ecc_release);
>> =

>>   int ingenic_ecc_probe(struct platform_device *pdev)
>>   {
>>  @@ -159,8 +155,3 @@ int ingenic_ecc_probe(struct platform_device =

>> *pdev)
>>   	return 0;
>>   }
>>   EXPORT_SYMBOL(ingenic_ecc_probe);
> =

> Any reason to keep this one?

This one is called from the three ECC drivers, which can be modules,
so it still needs to be exported.

-Paul



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
