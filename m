Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C904C54EE9
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Sep 2022 15:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tvoYSNFwF+Y9LtavdDNs4eCrGN+G+iy3N9f4pG7uYw8=; b=Gh/2qEIVv3ZG4F
	9UC08ee0jrptsvFwWTzkjdFfiDr828G2QOIoE3Ry6KJAbgL8Pat1jpxRRerDIHhGcKqgwtNCc7OmZ
	5G2QFyHFiknPLcfu5kS29blV3uRYFNmIhoJYyvvDLxuwip0BlosqGCjsHk+aIa6X6+Odq47xn+Udf
	VCPYY5xIvz/5ieTxIG38QOVAa7q2eRcBXqXUuuyQB4mtixk5Td+svxVgmRjxoD6NQ05qSr4ZT3v2P
	HmhhFXgkVSrkIKVEqsSArfCc8G7JiFFKiBncSTDNlOTodT/j61u0+2GU/0hgyKrOGwhETgUBwzAxw
	uvGeHCzlJYJ9dcNtrW4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obNyu-00GNlC-WC; Thu, 22 Sep 2022 15:19:17 +0000
Received: from mga14.intel.com ([192.55.52.115])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obNqz-00GJyG-5c
	for linux-mtd@lists.infradead.org; Thu, 22 Sep 2022 15:11:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663859465; x=1695395465;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fBNYYMs1hOUpBxGfRrlhErKyRSmDskzptAbJd0z4FYs=;
  b=UcmMQkjJ8AV5C/Y63mofVkgfHUrmRiU7ji52vhk6DXorAtCP0gFCJYfP
   o3nBcg9OO8dVDiiKZMVjz1H7TlPJKi9qFVF6ClY02uPGc5stbA7X/Fa7K
   uuS1WJx2dR78TKyFCXFvZEmvHysGc3kz3CBcZFMSK9NvBdW44L9bUq76r
   4NAffKC38t/4I+WCzMrepUQERHvvZ/UasiSSKAtAKUB3poMdvWjZoI7YO
   jUo+yaOgpFMMeS3iv7UQq7xH9MdgggoiPwczRHaRiIG/amNOOHMYTjmkn
   bfX+HxLXw0GIXfR1PML+6ggcUEo6AmNhtRxnSqk8oiXyERUiKNYnIvUbE
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="300307252"
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; 
   d="scan'208";a="300307252"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2022 08:11:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; 
   d="scan'208";a="688327840"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 22 Sep 2022 08:11:01 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 3D935238; Thu, 22 Sep 2022 18:11:19 +0300 (EEST)
Date: Thu, 22 Sep 2022 18:11:19 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Michael Walle <michael@walle.cc>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: spi-nor: gigadevice: Add support for gd25lr256e
Message-ID: <Yyx7FwIPM19UPK+H@black.fi.intel.com>
References: <20220922135646.49906-1-mika.westerberg@linux.intel.com>
 <88d096d0c5efe43bc50f3c547634eb8b@walle.cc>
 <YyxxlSscwnWSyfy3@black.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YyxxlSscwnWSyfy3@black.fi.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_081105_274407_85BB937D 
X-CRM114-Status: GOOD (  22.76  )
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

On Thu, Sep 22, 2022 at 05:30:45PM +0300, Mika Westerberg wrote:
> On Thu, Sep 22, 2022 at 04:15:37PM +0200, Michael Walle wrote:
> > Am 2022-09-22 15:56, schrieb Mika Westerberg:
> > > Add support for this 32MB serial flash.
> > > 
> > > Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> > > ---
> > >  drivers/mtd/spi-nor/gigadevice.c | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > > 
> > > diff --git a/drivers/mtd/spi-nor/gigadevice.c
> > > b/drivers/mtd/spi-nor/gigadevice.c
> > > index 119b38e6fc2a..7a7f5cb67a9e 100644
> > > --- a/drivers/mtd/spi-nor/gigadevice.c
> > > +++ b/drivers/mtd/spi-nor/gigadevice.c
> > > @@ -57,6 +57,10 @@ static const struct flash_info gigadevice_nor_parts[]
> > > = {
> > >  		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6)
> > >  		FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
> > >  		.fixups = &gd25q256_fixups },
> > > +	{ "gd25lr256e", INFO(0xc86719, 0, 64 * 1024, 512)
> > 
> > There doesn't seem to be a public datasheet. Does this flash support SFDP?
> > 
> > In that case, please just use
> > 	{ "gd25lr256e", INFO(0xc86719, 0, 0, 0),
> > 		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
> > 		PARSE_SFDP
> > 	}
> > 
> 
> Sure, let me check this one works and update the patch accordinglly.

Tried this now (I did not find the datasheet either anymore) but I get:

  spi-nor spi0.0: BFPT parsing failed. Please consider using SPI_NOR_SKIP_SFDP when declaring the flash

So I suspect SFDP is not supported by this chip?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
