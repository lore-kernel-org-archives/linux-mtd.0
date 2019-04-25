Return-Path: <SRS0=0ANE=S3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A3CEC43218
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Apr 2019 18:42:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACBFE20578
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Apr 2019 18:42:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JJwtBBU+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gxfSHhbu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ACBFE20578
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FFDyviyhnFgKx9130iG0vfHwdKCjlfX3VSqcfjnUa7U=; b=JJwtBBU+Mea+k5
	DqaKk+FAl4ktwPbLKe49ZEDGsr/HSUJkZrRP/eLOkt7WXgXNU3x1sI7FNZWhTrzJXwDSZ/DHSHbpT
	0OOMS5WQWXjWuEJPvG9CIyqgrNcvWQpQTTm7HPphs8eFyVcStalWXi4yzd5oeVisFnNQrCMO3a2sh
	q0JjMsX+I+04Rnvbtd1dA71gxqsUxPRFrswooG+id4UON0AxYR/1R7ozVw56bBw/DbH1hmTNsPjAV
	29xBzwfbTssm1ezhujo8d9vaHJEmnGDLyGUz57xXiPq5OtcsVmCAfkKKKXRutnxaeBNIUP4WmlQ0P
	7OhHNIwQvYwyOZrOt41A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJjKO-0007ry-Gh; Thu, 25 Apr 2019 18:42:36 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJjKG-0007kF-7D; Thu, 25 Apr 2019 18:42:29 +0000
Received: by mail-lj1-x242.google.com with SMTP id k2so540292lje.10;
 Thu, 25 Apr 2019 11:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jHtDQCF3J4/Fd0goxVfyw29gMvOXtnHF/+TB1AFi+PA=;
 b=gxfSHhbue02amZCW/HKumTMHfDazFLnbGs4+CcAK3JWOGiIBQ77Y3wxh/Hi/phQrQk
 46AvTfX6gKgERWH8j1aJxRqwB2SEP18dGad256k0ohUphcGshP/qihtVWUYfQvkvQdzo
 G+2fDf5nz/8rQbaoFQH/2wtVuutk61jLcNUWI4ztZ4tQSUOuORMnWA0VSb0OXCsAj5DL
 clyymphCRZNpU5Wl5Axd/u7vhC10b7V+ZLfUc51hLtJ6+sIyudtXFloUziv4xd/jYMyb
 A4MlJoEBv28GbaU75wtPSX3J6E/vjWtesRphPvn7Ks02SOjTP7O61VjrDY3Eq14HwB1c
 n/NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jHtDQCF3J4/Fd0goxVfyw29gMvOXtnHF/+TB1AFi+PA=;
 b=crwGnxgv83eCTGZ46GACgOV7SW883zkfauAwsZmXe7A6DWqYDYLhhSGyMvDzStkqWw
 2zTsSS8+oNMNSqd/lylKdW+JcC7V4NxO4vRU8qnBVfWWALQGfvuqogNzgi9/8nIkoJz3
 FDsR8LIm40k0tLbdLbgXwarAfN8nKOtbSyTy7M+X7BS4YtAr2GDgCv16CG0XpZATmGkd
 wVHnb02tCiojj+OzWQYsj9cyII2NBYS6bFmcVbxIOAFn0Lwc0UFTC1ODi7tNoUlGcVyq
 cMbDy1X7A3SuFEmirTTuECwJwfQyHWqtEesg67FAo+DVmDpRyudiLbSvU2iy6MWqU64m
 NkRA==
X-Gm-Message-State: APjAAAU/0aWGYPwU7rd3xeespk3Y5Nuyh7IW0DXR6b1j0kPgiYXwU1sO
 GtS3juIgsDGYn9rbeYHyMmk=
X-Google-Smtp-Source: APXvYqw7pc6j+FGos+HfZeuasTlDnwSgAGwgJuK9NFgch75dBE/0/spDG8KMWm7FjYhH12pnO2oykw==
X-Received: by 2002:a2e:3c0a:: with SMTP id j10mr10465394lja.164.1556217745997; 
 Thu, 25 Apr 2019 11:42:25 -0700 (PDT)
Received: from z50.localnet (109241207190.gdansk.vectranet.pl.
 [109.241.207.190])
 by smtp.gmail.com with ESMTPSA id k4sm1374991lja.18.2019.04.25.11.42.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Apr 2019 11:42:24 -0700 (PDT)
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
To: Ladislav Michl <ladis@linux-mips.org>
Subject: Re: [PATCH v3] mtd: rawnand: ams-delta: Drop board specific partition
 info
Date: Thu, 25 Apr 2019 20:42:22 +0200
Message-ID: <3173726.PU223hZCOI@z50>
In-Reply-To: <20190424221428.GA4172@lenoch>
References: <20190324223344.24590-1-jmkrzyszt@gmail.com>
 <20190424180212.10830-1-jmkrzyszt@gmail.com> <20190424221428.GA4172@lenoch>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190425_114228_258826_44E56799 
X-CRM114-Status: GOOD (  34.74  )
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
Cc: linux-omap@vger.kernel.org, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Tony Lindgren <tony@atomide.com>, Richard Weinberger <richard@nod.at>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, linux-kernel@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Ladislav,

On Thursday, April 25, 2019 12:14:28 AM CEST Ladislav Michl wrote:
> Hi Janusz,
> 
> On Wed, Apr 24, 2019 at 08:02:12PM +0200, Janusz Krzysztofik wrote:
> > After recent modifications, only a hardcoded partition info makes
> > the driver device specific.  Other than that, the driver uses GPIO
> > exclusively and can be used on any hardware.
> > 
> > Drop the partition info and use MTD partition parser with default list
> > of parser names instead.  For the OF parser to work correctly, pass
> > device of_node to mtd.
> > 
> > Amstrad Delta users should append the following partition info to their
> > kernel command line, possibly embedding it in CONFIG_CMDLINE:
> > 
> > mtdparts=ams-delta-nand:3584k(Kernel),256k(u-boot),256k(u-boot_params),\
> > 256k(Amstrad_LDR),27m(File_system),768k(PBL_reserved)
> 
> now, when driver is no longer Amstrad Delta specific, why would you want
> to have ams-delta-nand hardcoded on kernel cmdline? I'm assuming at some
> point this driver will become gpio-nand [*] or something like that and
> asking users to change their kernel cmdline twice is just unwise :)

Hmm, I have no idea of a good name for the driver if not "gpio-nand". Can you 
suggest one?
As a workaround, I can add a platform device id table to the driver with "ams-
delta-nand" as a supported device name in hope that survives possible future 
driver renaming.

> [*] btw, it is really shame gpio-nand name is already taken by driver
> living in drivers/mtd/nand/raw/gpio.c which is more likely gpio-mem-nand
> used by at least CompuLab CM-X255 and Picochip picoXcell.

I think the best approach would be to expose NAND data ports of those machines 
as GPIO ports, possibly reusing the "gpio-nand" driver code while creating a 
new GPIO driver for them if "basic-mmio-gpio" occurs inappropriate, and use 
the pure GPIO NAND driver on top.

> Otherwise your work on this driver is so amazing that I just spent
> couple of hours finding that phone and compiling some decent userspace
> for it :) Thank you!

I'm glad you like it :-)
Janusz

> 
> > For their convenience, that information is added to the board Kconfig
> > entry help text, as well as CONFIG_MTD_CMDLINE_PARTS symbol is selected
> > automatically from the board Kconfig entry if the NAND driver is also
> > selected.
> > 
> > Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
> > Cc: Tony Lindgren <tony@atomide.com>
> > Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
> > ---
> > Changelog:
> > v2->v3:
> > - add information on the requirement for passing partition info via
> >   kernel command line to the board Kconfig entry help text
> > v1->v2:
> > - fix a typo poitned out by Aaro - thanks!
> > - fix device_node not passed to OF parser via mtd_info
> > - commit message reworded and reformatted a bit for better readability
> > 
> >  arch/arm/mach-omap1/Kconfig      |  7 ++++++-
> >  drivers/mtd/nand/raw/ams-delta.c | 29 ++---------------------------
> >  2 files changed, 8 insertions(+), 28 deletions(-)
> > 
> > diff --git a/arch/arm/mach-omap1/Kconfig b/arch/arm/mach-omap1/Kconfig
> > index c4694f26b5c4..41a47d251cac 100644
> > --- a/arch/arm/mach-omap1/Kconfig
> > +++ b/arch/arm/mach-omap1/Kconfig
> > @@ -164,17 +164,22 @@ config MACH_NOKIA770
> >  	  have such a device.
> >  
> >  config MACH_AMS_DELTA
> > -	bool "Amstrad E3 (Delta)"
> > +	bool "Amstrad E3 (Delta) - see help for important information"
> >  	depends on ARCH_OMAP1 && ARCH_OMAP15XX
> >  	select FIQ
> >  	select GPIO_GENERIC_PLATFORM
> >  	select LEDS_GPIO_REGISTER
> >  	select REGULATOR
> >  	select REGULATOR_FIXED_VOLTAGE
> > +	select MTD_CMDLINE_PARTS if MTD_NAND_AMS_DELTA
> >  	help
> >  	  Support for the Amstrad E3 (codename Delta) videophone. Say Y 
here
> >  	  if you have such a device.
> >  
> > +	  If you are using built-in NAND, append the following partition
> > +	  info to kernel command line:
> > +	  mtdparts=ams-delta-nand:3584k(Kernel),256k(u-boot),256k(u-
boot_params),256k(Amstrad_LDR),27m(File_system),768k(PBL_reserved)
> > +
> >  config MACH_OMAP_GENERIC
> >  	bool "Generic OMAP board"
> >  	depends on ARCH_OMAP1 && (ARCH_OMAP15XX || ARCH_OMAP16XX)
> > diff --git a/drivers/mtd/nand/raw/ams-delta.c b/drivers/mtd/nand/raw/ams-
delta.c
> > index 8312182088c1..e0f09179bbda 100644
> > --- a/drivers/mtd/nand/raw/ams-delta.c
> > +++ b/drivers/mtd/nand/raw/ams-delta.c
> > @@ -41,31 +41,6 @@ struct ams_delta_nand {
> >  	bool			data_in;
> >  };
> >  
> > -/*
> > - * Define partitions for flash devices
> > - */
> > -
> > -static const struct mtd_partition partition_info[] = {
> > -	{ .name		= "Kernel",
> > -	  .offset	= 0,
> > -	  .size		= 3 * SZ_1M + SZ_512K },
> > -	{ .name		= "u-boot",
> > -	  .offset	= 3 * SZ_1M + SZ_512K,
> > -	  .size		= SZ_256K },
> > -	{ .name		= "u-boot params",
> > -	  .offset	= 3 * SZ_1M + SZ_512K + SZ_256K,
> > -	  .size		= SZ_256K },
> > -	{ .name		= "Amstrad LDR",
> > -	  .offset	= 4 * SZ_1M,
> > -	  .size		= SZ_256K },
> > -	{ .name		= "File system",
> > -	  .offset	= 4 * SZ_1M + 1 * SZ_256K,
> > -	  .size		= 27 * SZ_1M },
> > -	{ .name		= "PBL reserved",
> > -	  .offset	= 32 * SZ_1M - 3 * SZ_256K,
> > -	  .size		=  3 * SZ_256K },
> > -};
> > -
> >  static void ams_delta_write_commit(struct ams_delta_nand *priv)
> >  {
> >  	gpiod_set_value(priv->gpiod_nwe, 0);
> > @@ -238,6 +213,7 @@ static int ams_delta_init(struct platform_device 
*pdev)
> >  	mtd->dev.parent = &pdev->dev;
> >  
> >  	nand_set_controller_data(this, priv);
> > +	nand_set_flash_node(this, pdev->dev.of_node);
> >  
> >  	priv->gpiod_rdy = devm_gpiod_get_optional(&pdev->dev, "rdy", 
GPIOD_IN);
> >  	if (IS_ERR(priv->gpiod_rdy)) {
> > @@ -315,8 +291,7 @@ static int ams_delta_init(struct platform_device 
*pdev)
> >  		return err;
> >  
> >  	/* Register the partitions */
> > -	err = mtd_device_register(mtd, partition_info,
> > -				  ARRAY_SIZE(partition_info));
> > +	err = mtd_device_parse_register(mtd, NULL, NULL, NULL, 0);
> >  	if (err)
> >  		goto err_nand_cleanup;
> >  
> 





______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
