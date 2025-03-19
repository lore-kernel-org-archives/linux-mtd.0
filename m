Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C623CC35FFC
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Mar 2025 15:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qVRUNAuepSQN6bu8HVeY4MpV+tQfC7D9V+KNBXEjIxE=; b=hUdyyFgEUo2nPo
	G19fSb6XRevHMFgjEuLuEiQVP8r6DfIwYiaZMsGHjnkH31uijvMk8dIaAjJtLzY1aF5mQVXekRtVt
	60iYhiE0F01o24Pa6I9Sy+hyYSjNwiiR7K9a9Y7pzWZl1ls4WbbnGofHS966ueQFo27EAolJohfph
	ID3aL5UprdOceWCKHmEpkTAthgR41nadv0QAWQeD1X8VArH9NE2j4XDTlPGjfAcQwp6FX8+wQ32vn
	qs4N7GsoMRquG7jO3GdwUUhPCfyz2JImP2cHPwJIalszbYeHmgzXSidFOnr0sqQ2B8WjWTbb4zECY
	yX2kHPkMG0kF3iBBKVOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuuwm-00000009IwJ-1Uvv;
	Wed, 19 Mar 2025 15:03:08 +0000
Received: from esa.hc1631-21.eu.iphmx.com ([23.90.122.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuuwj-00000009IuV-0f8n
	for linux-mtd@lists.infradead.org;
	Wed, 19 Mar 2025 15:03:07 +0000
X-CSE-ConnectionGUID: mBRjrAZASGKHyeRXLuPvbw==
X-CSE-MsgGUID: 7X7XiWSfTqO7SppIzEcr2Q==
Authentication-Results: ob1.hc1631-21.eu.iphmx.com; dkim=pass (signature verified) header.i=@thalesgroup.com
X-THALES-CLOUD-URL: Yes
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="27701222"
X-IronPort-AV: E=Sophos;i="6.13,221,1732575600"; 
   d="scan'208";a="27701222"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=thalesgroup.com; i=@thalesgroup.com; s=bbmfo20230504;
  t=1742396577;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=0LDoeesLvdZ523ovYsmSo5qSOKyf8LaBShPGp3uz9iM=;
  b=W4lnSjit9SxAiUv2XO6akrCkK1Q6HdISHUEohBN0YwEkGAmnrp1jk3kI
   uz1JS5ZSZCaca18e6hvif6ESFKs8HaSYHFW/GcWkjrlP7OHZQOYZKkaZ8
   R4/eBq13FMYYoz6LuIpWD8JcCcDyJ4T02lP4B2OLAvsgGqnkwPO+8uidb
   NeUGc4fuXfH7r9iL07HxugS+TiOHtC+GggAok75NIzOcSOkj3seFm6sPd
   QuHXkFHhyDbI/LGdm6dhGOXaVO7feB+qdumyWWGJ1aps/FyO78hTlUDj0
   a8w9MzEPkN+YTImutGlG32fkQhwPCqtdCjQftTet3nBEakyxjR+q0PvQd
   g==;
X-CSE-ConnectionGUID: szmL/iDXRJOi33A3USII9A==
X-CSE-MsgGUID: pHa0ivfpRc6/7lZCZK2V8A==
X-THALES-FO-URL: Yes
X-CSE-ConnectionGUID: ITMLTdOYRnyvk4T0eveMnQ==
X-CSE-MsgGUID: /pO87tomS3iowTU0/RoTfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="44072420"
X-IronPort-AV: E=Sophos;i="6.14,259,1736809200"; 
   d="scan'208";a="44072420"
From: LECOINTRE Philippe <philippe.lecointre@thalesgroup.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav
	<pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
CC: LEJEUNE Sebastien <sebastien.lejeune@thalesgroup.com>, LENAIN Simon
	<simon.lenain@thalesgroup.com>, RENAULT Xavier
	<xavier.renault@thalesgroup.com>
Subject: RE: [PATCH] mtd: spi-nor: spansion: Add support for CY15V104QSN
Thread-Topic: [PATCH] mtd: spi-nor: spansion: Add support for CY15V104QSN
Thread-Index: AQHbiejmrpjq/9QuH0uaX3lViTPuDrNl56+AgBTEOBA=
Date: Wed, 19 Mar 2025 15:02:56 +0000
Message-ID: <ba593d13fad2419c9dba03fc001d599a@thalesgroup.com>
References: <87dbbbdfb2d54da781e4f8c5fa75851c@thalesgroup.com>
 <9ae9eaf4-bd5d-4902-9ca8-d83b9f326245@linaro.org>
In-Reply-To: <9ae9eaf4-bd5d-4902-9ca8-d83b9f326245@linaro.org>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
thales-sensitivity: {TGOPEN}
dlpmanualfileclassification: {64c9cc36-7289-4c96-81d0-25ee8eefd11d}
x-endpointsecurity-0xde81-ev: v:7.9.20.519, d:out, a:y, w:t, t:22,
 sv:1742373770, ts:1742396577
x-ms-exchange-nodisclaimer: 0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_080305_989636_43237A78 
X-CRM114-Status: GOOD (  23.95  )
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

Classified as: {OPEN}

Hello,

Thank you for your feedback.

I encounter some issue attempting to use the at25 driver.
I am not able to read the flash ID with at25 driver because the chipselect appear to be deselected between the RDID command and the read data. The RDID command is not taken into account and the chip only reply with 0xff.
With at25 driver, it use a spi_message containing two spi_transfer, one spi_transfer for the command and one spi_transfer for the read data. For some reason, this end up in .transfer_one() in the spi_controller driver of my SoC.
With spi-nor driver, it use spi_mem_exec_op() which work well in my case.
It appear at25 driver can currently be used with Cypress FM25 chip and from some of the datasheet of this family it seems that the chipselect need to be driven low during the entire RDID sequence.
Am I missing something here ?

Currently, the at25 driver assume a lot of property from the ID data (manufacturer and size) which don't seems to be relevant with the CY15V104QSN model.
This chip is similar to cy15b104q and cy15v104q currently supported by spi-nor driver.
https://web.git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/drivers/mtd/spi-nor/spansion.c?id=8a2644d5f3608822925c9204a3d19a8e3025fd4a
Also, I don't have access to at25 spi eeprom to validate any deep modifications on this driver if we need to do so according to the thread you are pointing to.

How can we handle this ?

Regards,
Philippe


{OPEN}

> -----Original Message-----
> From: Tudor Ambarus <tudor.ambarus@linaro.org>
> Sent: Thursday, March 6, 2025 11:54 AM
> To: LECOINTRE Philippe <philippe.lecointre@thalesgroup.com>; Pratyush
> Yadav <pratyush@kernel.org>; Michael Walle <mwalle@kernel.org>; linux-
> mtd@lists.infradead.org
> Cc: LEJEUNE Sebastien <sebastien.lejeune@thalesgroup.com>; LENAIN
> Simon <simon.lenain@thalesgroup.com>; RENAULT Xavier
> <xavier.renault@thalesgroup.com>
> Subject: Re: [PATCH] mtd: spi-nor: spansion: Add support for CY15V104QSN
> 
> 
> 
> On 2/28/25 2:01 PM, LECOINTRE Philippe wrote:
> > Infineon CY15V104QSN is 4Mbit serial SPI F-RAM device.
> 
> Please consider moving this flash to the at25 EEPROM driver:
> https://lore.kernel.org/linux-mtd/20240604074231.1874972-1-
> mwalle@kernel.org/
> 
> Cheers,
> ta
> >
> > Signed-off-by: Philippe Lecointre <philippe.lecointre@thalesgroup.com>
> > Acked-by: Simon Lenain <simon.lenain@thalesgroup.com>
> > ---
> >  drivers/mtd/spi-nor/spansion.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/drivers/mtd/spi-nor/spansion.c
> > b/drivers/mtd/spi-nor/spansion.c index bf08dbf5e742..32f8892d7afe
> > 100644
> > --- a/drivers/mtd/spi-nor/spansion.c
> > +++ b/drivers/mtd/spi-nor/spansion.c
> > @@ -922,6 +922,12 @@ static const struct flash_info spansion_nor_parts[]
> = {
> >  		.size = SZ_512K,
> >  		.sector_size = SZ_512K,
> >  		.flags = SPI_NOR_NO_ERASE,
> > +	}, {
> > +		.id = SNOR_ID(0x50, 0x51, 0x80, 0x06, 0x00, 0x00),
> > +		.name = "cy15v104qsn",
> > +		.size = SZ_512K,
> > +		.sector_size = SZ_512K,
> > +		.flags = SPI_NOR_NO_ERASE,
> >  	}, {
> >  		.id = SNOR_ID(0x34, 0x2a, 0x1a, 0x0f, 0x03, 0x90),
> >  		.name = "s25hl512t",
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
