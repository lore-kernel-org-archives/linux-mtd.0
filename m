Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8696FECAAD8
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Sep 2022 09:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wyzrF6QttnRGi2Qf9OxQQDSuRlBSweetAJhEATqL5tw=; b=lVH1g95A0DK1S+
	6WP66gZPi4DVjFIfFpwvCE++chHKiF2v2KBv9BUrgMHOvjVpQLdndWv9rv9S+LXSknjGqckRhL2F3
	78D5jqELZdtr0LQCdn/u4QypSFfZRDHyUu8pUcE0UUkNoyWkBOPB6tEcF7zKeM2hOSXtTXonWd6QN
	NhGTuyRnxaJl3BOby1YCzbaGkospmbawPfasQRH59jX8Z5GX9VmtEAM1ymr6WqpfQ/B5z+ZLnW+dR
	nEV0y8+NxMdHrcvJq83J7d1MjwjIlYqeZKNg8hCzUi3dXFevEelCXQ3ZvnkEyPEDbv5C02fBYfEdv
	1LGmftEM/KXe6xC0eFIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obf4E-003Mrm-8a; Fri, 23 Sep 2022 09:33:54 +0000
Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obf44-003Mmp-Lg
	for linux-mtd@lists.infradead.org; Fri, 23 Sep 2022 09:33:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663925624; x=1695461624;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CCoBEdNkGNhPb/PvucbMPaUKNyZYPp0447nV4oywSLc=;
  b=jNDazI7cNN2vljJ3dbhvWSoAzST7Nm6x04q8c7EFMgRi+ZYWH9xgOO3h
   vH0Akg4oR24vQWQ5/tSV3H2Ek6exbH7fTxSLynp2q2ilOzBg93OhDXh/d
   VkmY9eQvZ2S11DkD31cehQkTVcGTm84cACekRWUhItXR401m2NS2xhJG7
   cg0/5S4i6TGJKLYjjRKSXjs+DvBtbZLPD6QZCPORfSToiTl0A6UvRVkrW
   YrTyoimuzVfMmuR3sPk/5+Iq/bhgYVkJm6DUPvpulXF6s7hmp2laLkaEb
   GhRVepGMLrtRMhem2M+79DqlSdXfBFd4ypHnLSh2i3lnRn9N2zvMYI1Lj
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="301436899"
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; 
   d="scan'208";a="301436899"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2022 02:33:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; 
   d="scan'208";a="615557557"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 23 Sep 2022 02:33:41 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id E1A38F7; Fri, 23 Sep 2022 12:33:58 +0300 (EEST)
Date: Fri, 23 Sep 2022 12:33:58 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Michael Walle <michael@walle.cc>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: spi-nor: gigadevice: Add support for gd25lr256e
Message-ID: <Yy19hofyadnz0JvO@black.fi.intel.com>
References: <20220922135646.49906-1-mika.westerberg@linux.intel.com>
 <88d096d0c5efe43bc50f3c547634eb8b@walle.cc>
 <YyxxlSscwnWSyfy3@black.fi.intel.com>
 <Yyx7FwIPM19UPK+H@black.fi.intel.com>
 <2971d64c8719811c27b653bc5293d975@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2971d64c8719811c27b653bc5293d975@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_023345_015728_60615792 
X-CRM114-Status: GOOD (  26.60  )
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

On Thu, Sep 22, 2022 at 05:38:17PM +0200, Michael Walle wrote:
> Hi,
> 
> Am 2022-09-22 17:11, schrieb Mika Westerberg:
> > On Thu, Sep 22, 2022 at 05:30:45PM +0300, Mika Westerberg wrote:
> > > On Thu, Sep 22, 2022 at 04:15:37PM +0200, Michael Walle wrote:
> > > > Am 2022-09-22 15:56, schrieb Mika Westerberg:
> > > > > Add support for this 32MB serial flash.
> > > > >
> > > > > Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> > > > > ---
> > > > >  drivers/mtd/spi-nor/gigadevice.c | 4 ++++
> > > > >  1 file changed, 4 insertions(+)
> > > > >
> > > > > diff --git a/drivers/mtd/spi-nor/gigadevice.c
> > > > > b/drivers/mtd/spi-nor/gigadevice.c
> > > > > index 119b38e6fc2a..7a7f5cb67a9e 100644
> > > > > --- a/drivers/mtd/spi-nor/gigadevice.c
> > > > > +++ b/drivers/mtd/spi-nor/gigadevice.c
> > > > > @@ -57,6 +57,10 @@ static const struct flash_info gigadevice_nor_parts[]
> > > > > = {
> > > > >  		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6)
> > > > >  		FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
> > > > >  		.fixups = &gd25q256_fixups },
> > > > > +	{ "gd25lr256e", INFO(0xc86719, 0, 64 * 1024, 512)
> > > >
> > > > There doesn't seem to be a public datasheet. Does this flash support SFDP?
> > > >
> > > > In that case, please just use
> > > > 	{ "gd25lr256e", INFO(0xc86719, 0, 0, 0),
> > > > 		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
> > > > 		PARSE_SFDP
> > > > 	}
> > > >
> > > 
> > > Sure, let me check this one works and update the patch accordinglly.
> > 
> > Tried this now (I did not find the datasheet either anymore) but I get:
> > 
> >   spi-nor spi0.0: BFPT parsing failed. Please consider using
> > SPI_NOR_SKIP_SFDP when declaring the flash
> > 
> > So I suspect SFDP is not supported by this chip?
> 
> According to https://www.gigadevice.com/flash-memory/gd25lr256e/
> it has SFDP. Could you debug what is going wrong here?

Sure, I'll see if I can figure out why it fails.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
