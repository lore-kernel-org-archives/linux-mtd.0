Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11EEBC6FA82
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Sep 2022 15:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SFOrkhjebwVnjNg+cQt2DnyZEJXmXJthcqweug2xVWg=; b=VWUJQf/agwki2t
	PJ9YaeOzKw5vM0TnGlkJvzB/5VML2mX02+tCjmM8mXoee/U1BjJbsRcLurMsEuUGhsZ3WwnwPqw2i
	rXkp5UuptH6ZlKbyZFChWIumdn1uECPR9OXlqVGU4N/lPup+uFIJ8V13AgOL+2ackEYb4GJ2rcks9
	nuAbu6gkoPJvOKQ1k7XOtDXuAsCsgQFbCyonsZ9SD8nI3p/a8MW7Tn5mdwDPlZmGkNRIdJKdB6wDO
	E8zRilKH6+yaPE4gy2wnGsu4xSWB6HSi1lp8CcTq0d9y+JTy6/tBO0TRxyViL2oivI9TO8NvDw8AH
	oF+QhPC9OwrrWiQ58oxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obNjK-00GG7X-9T; Thu, 22 Sep 2022 15:03:10 +0000
Received: from mga02.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obNDj-00G2UF-DI
	for linux-mtd@lists.infradead.org; Thu, 22 Sep 2022 14:30:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663857031; x=1695393031;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=O+qqf6ThcQC32aia2IkljSi2NPHrfHvFROq1CEADF7U=;
  b=JbDtgnxKtgLGO4AJ7SB+rY/DV281LFzVsVGoPqTu/rYApSuWWG8/cu4n
   b/En3Tp6Dx9PL+MqWtZnQp6NRj7J+F0/X1DZbaIgeIWkIABbjhw6q5oPp
   kuhcagozVgu64M6WWOIsN+ttVq4f6wXJWksLNnhw52NAjcQnlEggdMh0A
   T8vh9/6QcURHA5DZ5BCkGEazSdcHFBm1cRmkS3Hk7Qig5Z8rG/HMZEIHi
   9j4n2yd9XyEAq3Y5eh7Dv2TC/JNUYn2yGNEf+RAVzonb3tGZCBCCuu8Xw
   L2jHAZB3AN7wmdrrcmi7O0+lriiphhbi6ht23o720ATO03e0wpNOGDYt9
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="287392569"
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; 
   d="scan'208";a="287392569"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2022 07:30:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; 
   d="scan'208";a="650539456"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 22 Sep 2022 07:30:27 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 8D8B6F7; Thu, 22 Sep 2022 17:30:45 +0300 (EEST)
Date: Thu, 22 Sep 2022 17:30:45 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Michael Walle <michael@walle.cc>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: spi-nor: gigadevice: Add support for gd25lr256e
Message-ID: <YyxxlSscwnWSyfy3@black.fi.intel.com>
References: <20220922135646.49906-1-mika.westerberg@linux.intel.com>
 <88d096d0c5efe43bc50f3c547634eb8b@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <88d096d0c5efe43bc50f3c547634eb8b@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_073031_528082_58811CF5 
X-CRM114-Status: GOOD (  19.49  )
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

On Thu, Sep 22, 2022 at 04:15:37PM +0200, Michael Walle wrote:
> Am 2022-09-22 15:56, schrieb Mika Westerberg:
> > Add support for this 32MB serial flash.
> > 
> > Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> > ---
> >  drivers/mtd/spi-nor/gigadevice.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/drivers/mtd/spi-nor/gigadevice.c
> > b/drivers/mtd/spi-nor/gigadevice.c
> > index 119b38e6fc2a..7a7f5cb67a9e 100644
> > --- a/drivers/mtd/spi-nor/gigadevice.c
> > +++ b/drivers/mtd/spi-nor/gigadevice.c
> > @@ -57,6 +57,10 @@ static const struct flash_info gigadevice_nor_parts[]
> > = {
> >  		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6)
> >  		FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
> >  		.fixups = &gd25q256_fixups },
> > +	{ "gd25lr256e", INFO(0xc86719, 0, 64 * 1024, 512)
> 
> There doesn't seem to be a public datasheet. Does this flash support SFDP?
> 
> In that case, please just use
> 	{ "gd25lr256e", INFO(0xc86719, 0, 0, 0),
> 		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
> 		PARSE_SFDP
> 	}
> 

Sure, let me check this one works and update the patch accordinglly.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
