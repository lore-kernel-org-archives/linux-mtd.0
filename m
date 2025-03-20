Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 154E2C36001
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Mar 2025 16:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4QhZh2OzuAIfxv2eF8UK6euoPJRH3VvIGLUa0QVj59c=; b=Dfr+ZnmZvR0VUl
	1s75W8g1RTQTKjA1xwRUu3mT1FD2A1crKNV/8u+MKCGA6NHNuH4wVd3AC825wVsANienPZmxfAQ6F
	eDwQt3xbAyH/tntcpfrVxbZwUudRyeY5vtOfM09v7EpdH2kMhAzZP8LGHSMw0TzXhLIPlOJp2eJuD
	eLTROvAWNjp2mSRjqtPFctUuOVi73neik13DS4Bhp0dkQ+wgk5qufcyg7PL3pr1xVMmqu9PiCWeLg
	dfdIwqwmwVXTChPD3nz6YCxtZUK/NQmZTvOgBkcgBRfLSpYMw39Zi7Vo2Eka5Z3BvwJi8FxOkLnKW
	pFCObgL/1JfkRwTvSIAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvJCd-0000000Cjxp-1VwQ;
	Thu, 20 Mar 2025 16:57:07 +0000
Received: from esa.hc1631-21.eu.iphmx.com ([23.90.123.40])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvJB9-0000000Cjll-3fn8
	for linux-mtd@lists.infradead.org;
	Thu, 20 Mar 2025 16:55:38 +0000
X-CSE-ConnectionGUID: JE3bPCY6SmqVUslZe8gtCg==
X-CSE-MsgGUID: QEV2qg6vQKqxd6VKRce0EQ==
Authentication-Results: ob1.hc1631-21.eu.iphmx.com; dkim=pass (signature verified) header.i=@thalesgroup.com
X-THALES-CLOUD-URL: Yes
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="29492617"
X-IronPort-AV: E=Sophos;i="6.14,262,1736809200"; 
   d="scan'208";a="29492617"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=thalesgroup.com; i=@thalesgroup.com; s=bbmfo20230504;
  t=1742489727;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=7rjCxz+Kk+43tB63YJ2QA5KlCkn32QP7jeusVOvIzdY=;
  b=Te3jFqMC5XA1ofiMzs5EqOpQ8cYMhH/9Hk8lM0nQWkH2W9Hy0FYQCcoP
   AppoUMp8RBb64gPiyCJLZuPbAUVyc+sHKM55/jiGjegPbY8nH4EPIfYEL
   6N92h0woafkM3hajZC/oAZleRetLwr8h0Azi3l9LVd8A5EUlZr+tlWJox
   96Pb5zztiG2/GDKrr/wdNB3Mg8Egq1TykjLws1AWqZ7IjpYyUTT4ANZta
   bFs7L7UpQ+5ucoB2rWBxOFZx//Aj38HxBPwUs4RmE8zwhsd3nYzcwx2KD
   po8z2ARnFJYrNQjLxRLBtsQ+Cpehfe5Ksf2Tz5lQUHfq8s6jAslJ2Wglf
   Q==;
X-CSE-ConnectionGUID: m1DlCfqqQJebgmuwLkHh7g==
X-CSE-MsgGUID: g3qSmY8tSLSI35zKtM7s5A==
X-THALES-FO-URL: Yes
X-CSE-ConnectionGUID: upabGaJ0TMSt+HCPaalsBg==
X-CSE-MsgGUID: eQ6nei4rS9+9+IM3b4EfTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="44135536"
X-IronPort-AV: E=Sophos;i="6.14,262,1736809200"; 
   d="scan'208";a="44135536"
From: LECOINTRE Philippe <philippe.lecointre@thalesgroup.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav
	<pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Takahiro
 Kuwano" <Takahiro.Kuwano@infineon.com>
CC: LEJEUNE Sebastien <sebastien.lejeune@thalesgroup.com>, LENAIN Simon
	<simon.lenain@thalesgroup.com>, RENAULT Xavier
	<xavier.renault@thalesgroup.com>
Subject: RE: [PATCH] mtd: spi-nor: spansion: Add support for CY15V104QSN
Thread-Topic: [PATCH] mtd: spi-nor: spansion: Add support for CY15V104QSN
Thread-Index: AQHbiejmrpjq/9QuH0uaX3lViTPuDrNl56+AgBTEOBCAARisAIAAXevQ
Date: Thu, 20 Mar 2025 16:55:26 +0000
Message-ID: <a76c17aeb7a645b9a5adbc79c2337b16@thalesgroup.com>
References: <87dbbbdfb2d54da781e4f8c5fa75851c@thalesgroup.com>
 <9ae9eaf4-bd5d-4902-9ca8-d83b9f326245@linaro.org>
 <ba593d13fad2419c9dba03fc001d599a@thalesgroup.com>
 <ceb81e52-3159-479b-9006-aae54a74fc3a@linaro.org>
In-Reply-To: <ceb81e52-3159-479b-9006-aae54a74fc3a@linaro.org>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
thales-sensitivity: {TGOPEN}
dlpmanualfileclassification: {64c9cc36-7289-4c96-81d0-25ee8eefd11d}
x-endpointsecurity-0xde81-ev: v:7.9.20.519, d:out, a:y, w:t, t:19,
 sv:1742465763, ts:1742489726
x-ms-exchange-nodisclaimer: 0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_095536_836294_8B374780 
X-CRM114-Status: GOOD (  46.31  )
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


{OPEN}

> -----Original Message-----
> From: Tudor Ambarus <tudor.ambarus@linaro.org>
> Sent: Thursday, March 20, 2025 9:47 AM
> To: LECOINTRE Philippe <philippe.lecointre@thalesgroup.com>; Pratyush
> Yadav <pratyush@kernel.org>; Michael Walle <mwalle@kernel.org>; linux-
> mtd@lists.infradead.org; Takahiro Kuwano
> <Takahiro.Kuwano@infineon.com>
> Cc: LEJEUNE Sebastien <sebastien.lejeune@thalesgroup.com>; LENAIN
> Simon <simon.lenain@thalesgroup.com>; RENAULT Xavier
> <xavier.renault@thalesgroup.com>
> Subject: Re: [PATCH] mtd: spi-nor: spansion: Add support for CY15V104QSN
> 
> 
> 
> On 3/19/25 3:02 PM, LECOINTRE Philippe wrote:
> > Classified as: {OPEN}
> >
> > Hello,
> 
> Hi,
> 
> Don't top post please, it's hard to follow the emails exchanged.
> >
> > Thank you for your feedback.
> 
> you're welcome!
> 
> >
> > I encounter some issue attempting to use the at25 driver.
> > I am not able to read the flash ID with at25 driver because the chipselect
> appear to be deselected between the RDID command and the read data. The
> RDID command is not taken into account and the chip only reply with 0xff.
> > With at25 driver, it use a spi_message containing two spi_transfer, one
> spi_transfer for the command and one spi_transfer for the read data. For
> some reason, this end up in .transfer_one() in the spi_controller driver of my
> SoC.
> 
> What spi controller driver, is it upstreamed?

The SoC use the upstream "snps,dw-apb-ssi" spi controller driver.

> 
> > With spi-nor driver, it use spi_mem_exec_op() which work well in my case.
> > It appear at25 driver can currently be used with Cypress FM25 chip and
> from some of the datasheet of this family it seems that the chipselect need
> to be driven low during the entire RDID sequence.
> > Am I missing something here ?
> 
> Splitting opcode, address, dummy and data per spi_transfers shall work,
> spi_mem_exec_op() does it too when the controller does not define
> mem_ops.
> 
> It probably just a bug somewhere, raising CS up between the transfers shall
> be fine.

Using an oscilloscope with spi protocol decode, it is the big difference I can see.

> >
> > Currently, the at25 driver assume a lot of property from the ID data
> (manufacturer and size) which don't seems to be relevant with the
> CY15V104QSN model.
> > This chip is similar to cy15b104q and cy15v104q currently supported by spi-
> nor driver.
> > https://web.git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/c
> > ommit/drivers/mtd/spi-
> nor/spansion.c?id=8a2644d5f3608822925c9204a3d19a
> > 8e3025fd4a
> 
> having those flashes in SPI NOR was a mistake. We can't just drop them as
> we'll break backward compatibility.
> 
> > Also, I don't have access to at25 spi eeprom to validate any deep
> modifications on this driver if we need to do so according to the thread you
> are pointing to.
> >
> > How can we handle this ?
> 
> You need to figure out why your flash doesn't work as expected and fix it. Is
> your controller spimem capable? If yes, try dropping the ctrl mem_ops and
> see if it behaves sane using SPI NOR and the controller using spi transfers. If
> it doesn't behave sane, then there's probably a problem into the controller
> driver.

Good advice !
I have commented out the dw_spi_init_mem_ops() function call in dw_spi_add_host() and I end up with the same result as at25 driver.
spi-nor spi3.0: unrecognized JEDEC id bytes: ff ff ff ff ff ff

I need to investigate further on this issue.
The drawback is that our project is currently based on Linux 6.1 CIP kernel and I need some efforts to rebase on the current master.
Until now, it wasn't an issue regarding the complexity of spi-nor modifications of the initial contribution.
From what I see, there is not much changes on the spi controller drivers, probably more in the spi core.
If you have any other advice, I will be glad to have them.

Regards,
Philippe

> 
> Cheers,
> ta
> >
> > Regards,
> > Philippe
> >
> >
> > {OPEN}
> >
> >> -----Original Message-----
> >> From: Tudor Ambarus <tudor.ambarus@linaro.org>
> >> Sent: Thursday, March 6, 2025 11:54 AM
> >> To: LECOINTRE Philippe <philippe.lecointre@thalesgroup.com>; Pratyush
> >> Yadav <pratyush@kernel.org>; Michael Walle <mwalle@kernel.org>;
> >> linux- mtd@lists.infradead.org
> >> Cc: LEJEUNE Sebastien <sebastien.lejeune@thalesgroup.com>; LENAIN
> >> Simon <simon.lenain@thalesgroup.com>; RENAULT Xavier
> >> <xavier.renault@thalesgroup.com>
> >> Subject: Re: [PATCH] mtd: spi-nor: spansion: Add support for
> >> CY15V104QSN
> >>
> >>
> >>
> >> On 2/28/25 2:01 PM, LECOINTRE Philippe wrote:
> >>> Infineon CY15V104QSN is 4Mbit serial SPI F-RAM device.
> >>
> >> Please consider moving this flash to the at25 EEPROM driver:
> >> https://lore.kernel.org/linux-mtd/20240604074231.1874972-1-
> >> mwalle@kernel.org/
> >>
> >> Cheers,
> >> ta
> >>>
> >>> Signed-off-by: Philippe Lecointre
> >>> <philippe.lecointre@thalesgroup.com>
> >>> Acked-by: Simon Lenain <simon.lenain@thalesgroup.com>
> >>> ---
> >>>  drivers/mtd/spi-nor/spansion.c | 6 ++++++
> >>>  1 file changed, 6 insertions(+)
> >>>
> >>> diff --git a/drivers/mtd/spi-nor/spansion.c
> >>> b/drivers/mtd/spi-nor/spansion.c index bf08dbf5e742..32f8892d7afe
> >>> 100644
> >>> --- a/drivers/mtd/spi-nor/spansion.c
> >>> +++ b/drivers/mtd/spi-nor/spansion.c
> >>> @@ -922,6 +922,12 @@ static const struct flash_info
> >>> spansion_nor_parts[]
> >> = {
> >>>  		.size = SZ_512K,
> >>>  		.sector_size = SZ_512K,
> >>>  		.flags = SPI_NOR_NO_ERASE,
> >>> +	}, {
> >>> +		.id = SNOR_ID(0x50, 0x51, 0x80, 0x06, 0x00, 0x00),
> >>> +		.name = "cy15v104qsn",
> >>> +		.size = SZ_512K,
> >>> +		.sector_size = SZ_512K,
> >>> +		.flags = SPI_NOR_NO_ERASE,
> >>>  	}, {
> >>>  		.id = SNOR_ID(0x34, 0x2a, 0x1a, 0x0f, 0x03, 0x90),
> >>>  		.name = "s25hl512t",
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
