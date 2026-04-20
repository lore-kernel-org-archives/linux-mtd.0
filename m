Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6537F55804
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Apr 2026 09:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vof+HduS+t2qFmshachiav786FNOKeVoWxNP6Fp4Kmw=; b=KD9k1EvIpl9lFg
	PG5VvQUnedFYSyJ0JBBv5ZMJ7IOOv1Vvrg8k/JmMeR4VCBJpvY0TLiGdBL9JTbMNhBusGGhTekVCQ
	uXlzjlfOuU3RSxWF6pcskbk4wYLH9Ro0rsDEYigtAhR0YyOacnXJr3YN0RJlsqhE8vCKve8Sj+CxU
	k9UyINX6W7sMdk61QV8hUyxVGL+XD+8VGmjffiKVXQakFN0DzjQaNZkcgHrbyxehcJ4HMeR4QXfJe
	bAcQRH7XWgrMxeyeMGWaJTZ2E2cBOt+ECQn9NK52ahuGhNM1pSrSRXIMT+03+dgXX5eZFZ6+tSH9T
	qe2fAj9sMlEmcxRh9buQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wElJj-00000006hZS-3apN;
	Mon, 20 Apr 2026 09:53:23 +0000
Received: from smtp2.infineon.com ([2a00:18f0:1e00:4::4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wElJg-00000006hOb-0FlB
	for linux-mtd@lists.infradead.org;
	Mon, 20 Apr 2026 09:53:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1776678800; x=1808214800;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=X5UfUdR9jGooYFjEEzS/6kJ5YJf4NT7at4t7F/oqPZ8=;
  b=BoRVDsWECVEsZYwT84uNlG19aSEl7aRPu1XumzsCQ9bI6kNU0KYKoU+j
   fTj8W9KKdqW6mcKXu+FmUNdlquvJPVNxxnCs4qSwIKlDb0OJfum+MM9jn
   ROnm3PDTuHrmQtxfARKfGnLIzOqnIlxHfe6NeMLYpJpiCGnC72kQWrTyV
   k=;
X-CSE-ConnectionGUID: 9BfHqPaoSfagm3o89GmVRA==
X-CSE-MsgGUID: GVlrDzK1SD2hPGDTe+vbwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="153965079"
X-IronPort-AV: E=Sophos;i="6.23,189,1770591600"; 
   d="scan'208";a="153965079"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO MUCSE814.infineon.com) ([172.23.29.40])
  by smtp2.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2026 11:51:15 +0200
Received: from MUCSE818.infineon.com (172.23.29.44) by MUCSE814.infineon.com
 (172.23.29.40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 20 Apr
 2026 11:51:14 +0200
Received: from MUCSE815.infineon.com (172.23.29.41) by MUCSE818.infineon.com
 (172.23.29.44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 20 Apr
 2026 11:51:13 +0200
Received: from MUCSE815.infineon.com ([fe80::b54c:c0bd:546c:c9be]) by
 MUCSE815.infineon.com ([fe80::b54c:c0bd:546c:c9be%12]) with mapi id
 15.02.2562.037; Mon, 20 Apr 2026 11:51:13 +0200
From: <Takahiro.Kuwano@infineon.com>
To: <mwalle@kernel.org>, <wuweimin@huaqin.corp-partner.google.com>
CC: <tudor.ambarus@linaro.org>, <pratyush@kernel.org>,
	<linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] [v3] mtd: spi-nor: gigadevice: Add support for GD25LQ255E
Thread-Topic: [PATCH] [v3] mtd: spi-nor: gigadevice: Add support for
 GD25LQ255E
Thread-Index: AQHczw+FlAbYwg9LE0q1dMBwwlMtI7XndwmAgAA6tvA=
Date: Mon, 20 Apr 2026 09:51:13 +0000
Message-ID: <792c09f5ae754bf899693f110ef1dbe0@infineon.com>
References: <20260418084253.792395-1-wuweimin@huaqin.corp-partner.google.com>
 <DHXTLXWEPUDM.2LSB322E4R3ZZ@kernel.org>
In-Reply-To: <DHXTLXWEPUDM.2LSB322E4R3ZZ@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.161.6.196]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_025320_419378_AD576E6E 
X-CRM114-Status: GOOD (  18.04  )
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

Hi,

> 
> On Sat Apr 18, 2026 at 10:42 AM CEST, Weimin Wu wrote:
> > Add support for the GigaDevice GD25LQ255E (JEDEC ID c8 60 19),
> > a 256Mbit (32MB) SPI NOR flash chip which supports SFDP.
> >
> > The chip supports 4K sector erase, dual read, and quad read modes.
> >
> > Link: https://download.gigadevice.com/Datasheet/DS-00562-GD25LQ255E-Rev1.2.pdf
> 
> Please move the Link: tag above your SoB line.
> 
> ..
> 
> > diff --git a/drivers/mtd/spi-nor/gigadevice.c b/drivers/mtd/spi-nor/gigadevice.c
> > index ef1edd0ad..22a430798 100644
> > --- a/drivers/mtd/spi-nor/gigadevice.c
> > +++ b/drivers/mtd/spi-nor/gigadevice.c
> > @@ -82,6 +82,10 @@ static const struct flash_info gigadevice_nor_parts[] = {
> >  		.size = SZ_16M,
> >  		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
> >  		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
> > +	}, {
> > +		/* gd25lb256 */
> > +		.id = SNOR_ID(0xc8, 0x60, 0x19),
> > +		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6,
> 
> Reviewed-by: Michael Walle <mwalle@kernel.org>
> 
The datasheet explains (in Table 5) that BP2-BP0 control the length
of protection area (all, 1/2 ... 1/64, 0) and BP3 controls upper/lower.
It looks 3 BP and 1 TB so SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB should work.
BP4 protects top or bottom 4KB to 32KB and current SWP doesn't support
that protection mechanism, right? Sorry if I missed something...

> It looks like the gd25q256 is also missing the 4BIT_BP flag. Could
> you add second patch fixing that one, please?
> 
The GD25Q256 looks 4 BP + 1 TB, according to the datasheet.

> FWIW, the GigaDevice datasheets are super confusing, sometimes there
> are 5 BP bits, where the last one is the TB, sometimes there are 4
> BP and 1 TB but only 3 BP bits are used..
> 
> -michael

Thanks,
Takahiro
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
