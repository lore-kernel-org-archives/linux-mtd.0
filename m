Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EFC2C6FA90
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Sep 2022 10:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g8MXhAsgosmkYz+M9fci/xl8vjPhWFvMOCP/eVWqpEk=; b=RK1xzR61qLeKUM
	yKbsDLRBthUHLBdJwViUlEx6Zi4EaYWDk/MdYPqGNXp6AFlxfxlf++3MaNgT5OgOa/sPUJH6AmDOY
	+bUnB4JDLPY9lWU1UBsQiCbUTDMVFtNOApqqKyGwi17NmoENgAh/pFwd4zZB5DZk3jgRt5a0/M0tz
	fCp/u7ABbXWuFr2RhMIpfJhEtVzOk+i44EudSPqxQBn1D6JxwU98DKBG3nKC2AeXnAdHBgL3RiQCA
	q7Zkx5+F2vJyJHrPoVK3FvAgMQr8HFH6vx0ErIHI1/vnw9Cih0czfPKxli4tcC6O+yWHECIevHqcA
	m5Ib3+Ty4ICiCPYT+GOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od7zb-009tct-J2; Tue, 27 Sep 2022 10:39:11 +0000
Received: from mga14.intel.com ([192.55.52.115])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od7zX-009tbO-Of
	for linux-mtd@lists.infradead.org; Tue, 27 Sep 2022 10:39:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664275147; x=1695811147;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qUMfSXR7CeWpfzqN47RGvayGLFsBw/HUUnnKPSqWcUU=;
  b=C7NCKMtkxAlLiC/5SL5uF7PowQmhj8fMY0lv5z5aO15CaUUh5Aqux3qc
   ecw8Fuh15nfUyBUavI8X+4e9X5eOT9rdT7C3GkOmsz1YfXDPxT+KTmsN4
   hd96bsSPakp7RIVYedLyIy4Lo8mXAkNb5L3nXtbA4o0TSuPnxwRJSgn5v
   H9QvaIV9/Lr8cTfcBlxvxdsxkJ5vWVtA9dtroQEyg++5J/zQ7gkY3WoGI
   Ty32a4lvyWSP0xEB5Ii5JxCdn01LKZUwS/EDktenB9HCuv8MFu0G/1lQV
   UV167io9BJS7t60Bb2VsyFm0C6HCB6QD9JkjBrIWB8nj03CUENdbqtKyR
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="301259678"
X-IronPort-AV: E=Sophos;i="5.93,349,1654585200"; 
   d="scan'208";a="301259678"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2022 03:39:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="710514135"
X-IronPort-AV: E=Sophos;i="5.93,349,1654585200"; 
   d="scan'208";a="710514135"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 27 Sep 2022 03:39:03 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 45B5815E; Tue, 27 Sep 2022 13:39:22 +0300 (EEST)
Date: Tue, 27 Sep 2022 13:39:21 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Michael Walle <michael@walle.cc>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: spi-nor: gigadevice: Add support for gd25lr256e
Message-ID: <YzLS2YouhkRDloZp@black.fi.intel.com>
References: <20220922135646.49906-1-mika.westerberg@linux.intel.com>
 <88d096d0c5efe43bc50f3c547634eb8b@walle.cc>
 <YyxxlSscwnWSyfy3@black.fi.intel.com>
 <Yyx7FwIPM19UPK+H@black.fi.intel.com>
 <2971d64c8719811c27b653bc5293d975@walle.cc>
 <Yy19hofyadnz0JvO@black.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Yy19hofyadnz0JvO@black.fi.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220927_033907_841548_AB6C93DD 
X-CRM114-Status: GOOD (  31.73  )
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

On Fri, Sep 23, 2022 at 12:33:58PM +0300, Mika Westerberg wrote:
> On Thu, Sep 22, 2022 at 05:38:17PM +0200, Michael Walle wrote:
> > Hi,
> > 
> > Am 2022-09-22 17:11, schrieb Mika Westerberg:
> > > On Thu, Sep 22, 2022 at 05:30:45PM +0300, Mika Westerberg wrote:
> > > > On Thu, Sep 22, 2022 at 04:15:37PM +0200, Michael Walle wrote:
> > > > > Am 2022-09-22 15:56, schrieb Mika Westerberg:
> > > > > > Add support for this 32MB serial flash.
> > > > > >
> > > > > > Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> > > > > > ---
> > > > > >  drivers/mtd/spi-nor/gigadevice.c | 4 ++++
> > > > > >  1 file changed, 4 insertions(+)
> > > > > >
> > > > > > diff --git a/drivers/mtd/spi-nor/gigadevice.c
> > > > > > b/drivers/mtd/spi-nor/gigadevice.c
> > > > > > index 119b38e6fc2a..7a7f5cb67a9e 100644
> > > > > > --- a/drivers/mtd/spi-nor/gigadevice.c
> > > > > > +++ b/drivers/mtd/spi-nor/gigadevice.c
> > > > > > @@ -57,6 +57,10 @@ static const struct flash_info gigadevice_nor_parts[]
> > > > > > = {
> > > > > >  		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6)
> > > > > >  		FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
> > > > > >  		.fixups = &gd25q256_fixups },
> > > > > > +	{ "gd25lr256e", INFO(0xc86719, 0, 64 * 1024, 512)
> > > > >
> > > > > There doesn't seem to be a public datasheet. Does this flash support SFDP?
> > > > >
> > > > > In that case, please just use
> > > > > 	{ "gd25lr256e", INFO(0xc86719, 0, 0, 0),
> > > > > 		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
> > > > > 		PARSE_SFDP
> > > > > 	}
> > > > >
> > > > 
> > > > Sure, let me check this one works and update the patch accordinglly.
> > > 
> > > Tried this now (I did not find the datasheet either anymore) but I get:
> > > 
> > >   spi-nor spi0.0: BFPT parsing failed. Please consider using
> > > SPI_NOR_SKIP_SFDP when declaring the flash
> > > 
> > > So I suspect SFDP is not supported by this chip?
> > 
> > According to https://www.gigadevice.com/flash-memory/gd25lr256e/
> > it has SFDP. Could you debug what is going wrong here?
> 
> Sure, I'll see if I can figure out why it fails.

Okay debugged now. It turns out that yes this chip supports SFDP just
fine. It is the Intel SPI driver that did not so that's the reason for
the failure here.

I will submit v2 of this patch after v6.1-rc1 is released and also send
out the patch series adding SFDP support to the Intel SPI driver.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
