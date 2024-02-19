Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 554F2C48BC3
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Feb 2024 21:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eF6qlowDBDoNV59mPMDfIoo0Mipp64VoPGOKzjxsf8U=; b=N49jvtwRtJhlqO
	/BIjZEtmxwCu+18PRPV9rJk49X9J2ROO9lPmtVUDzLNX/uYd/GNUmOYsRlF8ote1CV7QVAAdoZR6Y
	lQtJW65+Vedho0LhYLVFSrdDnZvwPWBjgv7s8Xpm6fFLABZDkRBZb4u4ss7X0PlvGrw+u4SBXYRul
	JpOtYzbCWGn6J52BMVswQh0bLVexf0YnMdmEBznYbMi9AiVF9FZHqlMuTSli2+Z6E47XSvM0rphC7
	bVKXmDKYi4TkQ/cEBK32W5EV1exPimMqBYeR397eV8R2kEa7o2Epo22lL8GgyA8oivvUPLj9ZJKeR
	bVYp9fintEP/OCdBjW8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcBcq-0000000CJOk-2Apz;
	Mon, 19 Feb 2024 21:56:36 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcBcn-0000000CJO5-2abl
	for linux-mtd@lists.infradead.org;
	Mon, 19 Feb 2024 21:56:35 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-41263dbdfeaso13380975e9.2
        for <linux-mtd@lists.infradead.org>; Mon, 19 Feb 2024 13:56:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708379792; x=1708984592; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oJHcV/T82uWCoxsFHTEBn8FHgLuv3HM/m85Ck6a9z44=;
        b=jr5tdbB9OKX3qsjDBuyte25GIQOnWFd0ERp/FURUdFS/pB0Pheko877egHeCXgq4/I
         TgTpYu3S9gzmQJhev1gf1mSKMXWy0DFMm46BcWg6pxDIlSHEmublHjz4bIjeXoS5EmYb
         EDoWEYORcR9Eg1P5EPGAIMhUS/s8q1TDStbsNqjpNphV0NKupwT/HiFsb3QSuv10ptqs
         E0ayTps20+ciUD9oP/n6QGr4rbLVWlIgUP0fTYGS1aaTqGLbU8vVkRH75TyM9tRQbQuh
         TT8pNSYSWEK9Q/URM5IIB1moBKqGWT38yUhQefxVTu8bv8JWRXPCK+6FOmuKZD9Wwkm5
         9WuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708379792; x=1708984592;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oJHcV/T82uWCoxsFHTEBn8FHgLuv3HM/m85Ck6a9z44=;
        b=CMBa/uxMtRmOQkAJHh6fnW8YuISUKRVG9v6kTetbJcAoS4vnyVOi1S350O/ikpJbaO
         K6G/Rh0oIYT89CiylYqwR9xdpAZ75rGtRvvvzzcOoEiKrR32f0hht60Le7ojqT2Pe1YU
         91ssByMmNCl7CS5NzWONY+gLc4XqYkjksL5MvsMQSnT/xxMILXFO4YoRThD58OuW3WAu
         PjeAXjD6qWa4vjLNqoFcnax4DbTtaQ3tF/q910YKOfBPCkAWEh+rSGRbwoEhAZC+7t+Z
         wEfBP9nKTAikCXuj0Cl/jeSLW3ggfQLZabIeMpBzP/FK5+M5e+n+49Loc6++BZ04aljl
         2AvA==
X-Forwarded-Encrypted: i=1; AJvYcCXdD0EgBqWyNfrnje6VXF7U5NeemXlYp6S60QVBRE81JoUjCc/8i4Iyf9UNZts0NHMDEodX3k4zRYcDte8lA5WjOgAeDmT7GgKFoQCcXg==
X-Gm-Message-State: AOJu0YwaW+Sx11CNmHdkK0AX5/1nCIPTLUcbizNyzhgpDTr8yvRe1NpA
	boY6ld0jOqrnyLqNX85hM3+MZp1YR2758HL7c6FTL5oDQsk18FPG
X-Google-Smtp-Source: AGHT+IFJYWBDF4gET9omu3xc8KSaSs/8Eb4LET3mTi87Yb5PdCv4fspcYOYQ4rnbRp6gkgvbvHS4UA==
X-Received: by 2002:adf:fe0f:0:b0:33c:e35b:7a59 with SMTP id n15-20020adffe0f000000b0033ce35b7a59mr9025210wrr.48.1708379791537;
        Mon, 19 Feb 2024 13:56:31 -0800 (PST)
Received: from Ansuel-XPS. (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.gmail.com with ESMTPSA id bv9-20020a0560001f0900b0033b5b6a186dsm11690760wrb.69.2024.02.19.13.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 13:56:31 -0800 (PST)
Message-ID: <65d3ce8f.050a0220.e5faf.c252@mx.google.com>
X-Google-Original-Message-ID: <ZdPOjrr7AYoOth74@Ansuel-XPS.>
Date: Mon, 19 Feb 2024 22:56:30 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Walle <mwalle@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org, David Bauer <mail@david-bauer.net>
Subject: Re: [PATCH] mtd: spi-nor: Add support for BoHong bh25q128as
References: <20240217122029.3278-1-ansuelsmth@gmail.com>
 <CZ8X218EWPC9.25TO9O5C7VXQ9@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CZ8X218EWPC9.25TO9O5C7VXQ9@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_135633_681564_991D0BF8 
X-CRM114-Status: GOOD (  33.31  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Feb 19, 2024 at 09:35:27AM +0100, Michael Walle wrote:
> Hi,
> 
> On Sat Feb 17, 2024 at 1:20 PM CET, Christian Marangi wrote:
> > From: David Bauer <mail@david-bauer.net>
> >
> > Add MTD support for the BoHong bh25q128as SPI NOR chip.
> > The chip has 16MB of total capacity, divided into a total of 256
> > sectors, each 64KB sized. The chip also supports 4KB sectors.
> > Additionally, it supports dual and quad read modes.
> >
> > Datasheet is public and can be found here [1].
> 
> Last time it wasn't clear if this flash will support SFDP or not.
> Could you please try to dump the SFDP again, see [1].
>

Ok will include in v2.

> 
> > Functionality was verified on an Tenbay WR1800K / MTK MT7621 board.
> 
> Also per [1], you'd need to provide your test results.
> 
> > [1] https://www.e-interlink.com.tw/userUpload/files/BH25Q128AS_v1_0.pdf
> 
> Link: right above your SoB please.
> 
> > Signed-off-by: David Bauer <mail@david-bauer.net>
> > [ reworked to new flash_info format ]
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> >  drivers/mtd/spi-nor/Makefile |  1 +
> >  drivers/mtd/spi-nor/bohong.c | 24 ++++++++++++++++++++++++
> >  drivers/mtd/spi-nor/core.c   |  1 +
> >  drivers/mtd/spi-nor/core.h   |  1 +
> >  4 files changed, 27 insertions(+)
> >  create mode 100644 drivers/mtd/spi-nor/bohong.c
> >
> > diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
> > index 5e68468b72fc..c8849cf5124f 100644
> > --- a/drivers/mtd/spi-nor/Makefile
> > +++ b/drivers/mtd/spi-nor/Makefile
> > @@ -2,6 +2,7 @@
> >  
> >  spi-nor-objs			:= core.o sfdp.o swp.o otp.o sysfs.o
> >  spi-nor-objs			+= atmel.o
> > +spi-nor-objs			+= bohong.o
> >  spi-nor-objs			+= eon.o
> >  spi-nor-objs			+= esmt.o
> >  spi-nor-objs			+= everspin.o
> > diff --git a/drivers/mtd/spi-nor/bohong.c b/drivers/mtd/spi-nor/bohong.c
> > new file mode 100644
> > index 000000000000..26988c139262
> > --- /dev/null
> > +++ b/drivers/mtd/spi-nor/bohong.c
> > @@ -0,0 +1,24 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (C) 2005, Intec Automation Inc.
> > + * Copyright (C) 2014, Freescale Semiconductor, Inc.
> 
> Please remove, there is nothing from the old code left here.
> 
> > + */
> > +
> > +#include <linux/mtd/spi-nor.h>
> > +
> > +#include "core.h"
> > +
> > +static const struct flash_info bohong_parts[] = {
> > +	{
> > +		.id = SNOR_ID(0x68, 0x40, 0x18),
> > +		.name = "bh25q128as",
> No names anymore, please.
> 

Mhhh why this change? Doesn't this makes the thing problematic to
identify?

> > +		.size = SZ_16M,
> > +		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
> > +	},
> > +};
> > +
> > +const struct spi_nor_manufacturer spi_nor_bohong = {
> > +	.name = "bohong",
> 
> This should be dropped, too. Otherwise looks good, if SFDP is not
> supported.
>

Ok, thanks a lot for the review!

> 
> [1] https://docs.kernel.org/driver-api/mtd/spi-nor.html
> 
> > +	.parts = bohong_parts,
> > +	.nparts = ARRAY_SIZE(bohong_parts),
> > +};
> > diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> > index 4129764fad8c..29c28ee683a1 100644
> > --- a/drivers/mtd/spi-nor/core.c
> > +++ b/drivers/mtd/spi-nor/core.c
> > @@ -2037,6 +2037,7 @@ int spi_nor_sr2_bit7_quad_enable(struct spi_nor *nor)
> >  
> >  static const struct spi_nor_manufacturer *manufacturers[] = {
> >  	&spi_nor_atmel,
> > +	&spi_nor_bohong,
> >  	&spi_nor_eon,
> >  	&spi_nor_esmt,
> >  	&spi_nor_everspin,
> > diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> > index d36c0e072954..c293568ae827 100644
> > --- a/drivers/mtd/spi-nor/core.h
> > +++ b/drivers/mtd/spi-nor/core.h
> > @@ -601,6 +601,7 @@ struct sfdp {
> >  
> >  /* Manufacturer drivers. */
> >  extern const struct spi_nor_manufacturer spi_nor_atmel;
> > +extern const struct spi_nor_manufacturer spi_nor_bohong;
> >  extern const struct spi_nor_manufacturer spi_nor_eon;
> >  extern const struct spi_nor_manufacturer spi_nor_esmt;
> >  extern const struct spi_nor_manufacturer spi_nor_everspin;
> 



-- 
	Ansuel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
