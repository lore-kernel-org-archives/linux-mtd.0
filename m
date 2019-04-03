Return-Path: <SRS0=c1Ix=SF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9092EC4360F
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Apr 2019 02:03:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BA15206B7
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Apr 2019 02:03:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dViIwnBe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BA15206B7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J2XjfIBbAukJM2zaZTvwjYF/+Q+KKXHG/Y9mN4g1lrQ=; b=dViIwnBeCi2wmM
	u1mcqGCYeTzdy2RdE+owyg97e4nzCoBiq2k71tSLHUHVrSs3RkqQvpvPvVQFO59ChPwevYW0lBNOn
	s/ox3/ADI7Q4eWm3yqfo6TAHf3KV2KRtsXRGGIJ1TwGjETg+WP0PcrmsFDzuitps3zGmmz1hooiyB
	/00FNANHGKhaKCOqkCbGFdeq1ezQ+2fv8lsBMMI6g/iiATAgsiyVCvX9j1RjQ8yFjZsdMqtkUQsUA
	JBCBBz/oReu5LDDEzH8DIgZCloTG5Ri5Qi4TQg7+bhd19bD1eTaxXnkNoQMAvtH4EOOFXW8D/rQra
	ynt+0G99SKRiJ/iG/ucQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hBVFD-0000YC-7I; Wed, 03 Apr 2019 02:03:15 +0000
Received: from mga04.intel.com ([192.55.52.120])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBVF9-0000Tq-2P
 for linux-mtd@lists.infradead.org; Wed, 03 Apr 2019 02:03:12 +0000
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Apr 2019 19:03:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,302,1549958400"; d="scan'208";a="139510269"
Received: from kmsmsx156.gar.corp.intel.com ([172.21.138.133])
 by orsmga003.jf.intel.com with ESMTP; 02 Apr 2019 19:03:08 -0700
Received: from pgsmsx109.gar.corp.intel.com ([169.254.14.173]) by
 KMSMSX156.gar.corp.intel.com ([169.254.1.198]) with mapi id 14.03.0415.000;
 Wed, 3 Apr 2019 10:03:07 +0800
From: "Wan Mohamad, Wan Ahmad Zainie" <wan.ahmad.zainie.wan.mohamad@intel.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "marek.vasut@gmail.com"
 <marek.vasut@gmail.com>, "tudor.ambarus@microchip.com"
 <tudor.ambarus@microchip.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>, "richard@nod.at"
 <richard@nod.at>
Subject: RE: [PATCH] mtd: spi-nor: Add Micron MT25QU128 support
Thread-Topic: [PATCH] mtd: spi-nor: Add Micron MT25QU128 support
Thread-Index: AQHU6SGCAJXWdhJm8EyhqFoJINpPqKYn/WoAgAGwOmA=
Date: Wed, 3 Apr 2019 02:03:06 +0000
Message-ID: <5DFE9D34FA27A24D8F51B3E64FBE48FA412941B9@PGSMSX109.gar.corp.intel.com>
References: <1554217172-30466-1-git-send-email-wan.ahmad.zainie.wan.mohamad@intel.com>
 <c8202878-e33a-3d47-a8dc-43fd0df26417@ti.com>
In-Reply-To: <c8202878-e33a-3d47-a8dc-43fd0df26417@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNzk1NDYxNjctMWExMC00NWQ2LTgyNjgtOTY5MmE2ZTA1ODFhIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiVWpGdW9SNzJJOW5oeWMzZHBtbDFDSnRTSTEzRkFveU5OQWozRVFKS1A2ZlJ4V0M4QVl5ekhUaFJtV3hkY25FUiJ9
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [172.30.20.206]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190402_190311_128481_C7FB8287 
X-CRM114-Status: GOOD (  17.37  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



> -----Original Message-----
> From: Vignesh Raghavendra [mailto:vigneshr@ti.com]
> Sent: Tuesday, April 2, 2019 4:06 PM
> To: Wan Mohamad, Wan Ahmad Zainie
> <wan.ahmad.zainie.wan.mohamad@intel.com>; linux-
> mtd@lists.infradead.org; marek.vasut@gmail.com;
> tudor.ambarus@microchip.com; dwmw2@infradead.org;
> computersforpeace@gmail.com; bbrezillon@kernel.org; richard@nod.at
> Subject: Re: [PATCH] mtd: spi-nor: Add Micron MT25QU128 support
> 
> 
> 
> On 02/04/19 8:29 PM, wan.ahmad.zainie.wan.mohamad@intel.com wrote:
> > From: Wan Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>
> >
> > Add support for Micron 128Mb Serial NOR Flash Memory.
> > Datasheet is available: MT25Q_QLHS_U_128_ABA_0.pdf
> >
> 
> Could you add what board was this tested on and what modes were tested?
> 

Noted. I will add this information in the next submission.
The test is done with FPGA environment.

> > Signed-off-by: Wan Ahmad Zainie
> > <wan.ahmad.zainie.wan.mohamad@intel.com>
> > ---
> >  drivers/mtd/spi-nor/spi-nor.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/mtd/spi-nor/spi-nor.c
> > b/drivers/mtd/spi-nor/spi-nor.c index fae147452aff..626ac9e02241
> > 100644
> > --- a/drivers/mtd/spi-nor/spi-nor.c
> > +++ b/drivers/mtd/spi-nor/spi-nor.c
> > @@ -1881,6 +1881,7 @@ static int sr2_bit7_quad_enable(struct spi_nor
> *nor)
> >  	{ "n25q00",      INFO(0x20ba21, 0, 64 * 1024, 2048, SECT_4K | USE_FSR
> | SPI_NOR_QUAD_READ | NO_CHIP_ERASE) },
> >  	{ "n25q00a",     INFO(0x20bb21, 0, 64 * 1024, 2048, SECT_4K | USE_FSR
> | SPI_NOR_QUAD_READ | NO_CHIP_ERASE) },
> >  	{ "mt25qu02g",   INFO(0x20bb22, 0, 64 * 1024, 4096, SECT_4K |
> USE_FSR | SPI_NOR_QUAD_READ | NO_CHIP_ERASE) },
> > +	{ "mt25qu128",   INFO(0x20bb18, 0, 64 * 1024, 1024, SECT_4K |
> USE_FSR | SPI_NOR_QUAD_READ | NO_CHIP_ERASE) },
> >
> 
> Per datasheet here[1] mt25qu128 does seem to support CHIP erase. So
> please drop NO_CHIP_ERASE.
> Micron flash ID table is sorted by device ID. Could you insert the entry
> accordingly?
> Also, please limit the line to 80 char like:
> 
>         { "mt25qu128",   INFO(0x20bb18, 0, 64 * 1024, 1024, SECT_4K |
>                          USE_FSR | SPI_NOR_QUAD_READ) },
> 

Noted. I will change accordingly.

> 
> [1]
> https://www.mouser.com/datasheet/2/671/MT25Q_QLHS_U_128_ABA_0-
> 1387216.pdf
> 
> >  	/* Micron */
> >  	{
> >
> 
> --
> Regards
> Vignesh

Thank you.

Best regards,
Zainie
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
