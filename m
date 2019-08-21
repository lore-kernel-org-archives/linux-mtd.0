Return-Path: <SRS0=1vkS=WR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C701C3A59E
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Aug 2019 07:34:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E3EE23427
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Aug 2019 07:34:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PtEQax1F"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E3EE23427
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ytZAKmXsJHk+JAjHo/kMA6qfBwOCl4wfCry4hlRYtts=; b=PtEQax1Fc31fnt
	GsvzNmEn932JAEOxdvEy4c4q+zWXZYQGe3SuQtYfdwgCngKm+VGXZTjYV4TFTr+VGAFdUm3rJgOs4
	nAtXTli+v9qidHHWd9TzR+ogq4a0Db43OJG2JpYQpQy74WQxvxzJ3Gc7dooTD73avxh3mc5jhgHnp
	vhImCstPIIS/VL6kEKbyjlECrrliVBaf4wJ5X74LTddPcjBER8b+jlfWlxdXd6v+cMObNKhsRLaXK
	BmUTpU21xQjnPl1hJJs33M5p8/0h75wPirtljWIeUcgmfGV+4e9A/IF3DRmbWnga9GHIhap/B7DHG
	1LSXtocmDzwMFMq1eMrg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0L8d-00067z-3H; Wed, 21 Aug 2019 07:34:35 +0000
Received: from mga04.intel.com ([192.55.52.120])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0L8Z-00067L-O8
 for linux-mtd@lists.infradead.org; Wed, 21 Aug 2019 07:34:33 +0000
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Aug 2019 00:34:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,411,1559545200"; d="scan'208";a="195943589"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.157])
 by fmsmga001.fm.intel.com with SMTP; 21 Aug 2019 00:34:26 -0700
Received: by lahna (sSMTP sendmail emulation); Wed, 21 Aug 2019 10:34:26 +0300
Date: Wed, 21 Aug 2019 10:34:25 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Tudor.Ambarus@microchip.com
Subject: Re: [PATCH] spi-nor: intel-spi: Whitelist 4B read commands
Message-ID: <20190821073425.GN19908@lahna.fi.intel.com>
References: <20190712121401.28578-1-alexander.sverdlin@nokia.com>
 <409a9e10-e391-2403-5aff-c2e5a361fdef@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <409a9e10-e391-2403-5aff-c2e5a361fdef@microchip.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.12.1 (2019-06-15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190821_003431_800334_D57C6735 
X-CRM114-Status: GOOD (  18.09  )
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
Cc: vigneshr@ti.com, richard@nod.at, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 alexander.sverdlin@nokia.com, computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Aug 20, 2019 at 03:24:37PM +0000, Tudor.Ambarus@microchip.com wrote:
> Mika,
> 
> Would you please review the patch from below?

Sure.

> 
> Thanks,
> ta
> 
> On 07/12/2019 03:14 PM, Sverdlin, Alexander (Nokia - DE/Ulm) wrote:
> > External E-Mail
> > 
> > 
> > From: Alexander Sverdlin <alexander.sverdlin@nokia.com>
> > 
> > spi-nor.c issues 4B commands for some Flash chips bigger than 16Mbytes.
> > Xeon(R) D-1500 documentation mentions its Integrated PCH Logic supports
> > Flash chips up to 64Mbytes.
> > D-1500 Integrated PCH documenation however has inconsistencies regarding
> > FADDR register width and says nothing about particular commands issued
> > to support 64Mbytes of Flash.

Unfortunately I don't have any additional documentation that could help.

> > Nevetheless the tests on Xeon(R) CPU D-1548 with 512Mbit Flash chips
> > Macronix MX25L51245G and Micron MT25QL512A showed that erase, write and
> > read operations work just fine after SPINOR_OP_READ_4B and
> > SPINOR_OP_READ_FAST_4B are white-listed (currently only
> > SPINOR_OP_READ_FAST_4B is used and only for Macronix).

If it works in your testing I don't see why we would not support them
especially since these are just reads.

> > Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>

The patch itself is trivial enough and looks fine to me.

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>

> > ---
> >  drivers/mtd/spi-nor/intel-spi.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/mtd/spi-nor/intel-spi.c b/drivers/mtd/spi-nor/intel-spi.c
> > index 1ccf23f..43e55a2e 100644
> > --- a/drivers/mtd/spi-nor/intel-spi.c
> > +++ b/drivers/mtd/spi-nor/intel-spi.c
> > @@ -621,6 +621,8 @@ static ssize_t intel_spi_read(struct spi_nor *nor, loff_t from, size_t len,
> >  	switch (nor->read_opcode) {
> >  	case SPINOR_OP_READ:
> >  	case SPINOR_OP_READ_FAST:
> > +	case SPINOR_OP_READ_4B:
> > +	case SPINOR_OP_READ_FAST_4B:
> >  		break;
> >  	default:
> >  		return -EINVAL;
> > 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
