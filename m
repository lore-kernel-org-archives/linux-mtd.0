Return-Path: <SRS0=O+nk=6A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76EE9C2BA2B
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Apr 2020 06:40:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46B06214D8
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Apr 2020 06:40:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lFpt/8OY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46B06214D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Akii1bCjsxIzqu3Mpz7eL9VVvy5AKM18r0Cs5gHLx1M=; b=lFpt/8OYBONeOv
	oByZGHqok6+7rMzAd4woRDRJXUcNOFtDvEcscBzG9KS37kvO84GV82rNSMnvJ4Kfpzl4iAMUZUzmj
	1XzMJ4iJM0BMCIV5p9iJv9BtdwG9Cjb1RVWMoYwBF2zCCCw6KXxph9nqO9futKeEWBtX0g9DIYwQ7
	X6C9l5SAiHwpKDBlft4fuagaJqvBViUBLovUX4yvwhZO4fYLsYGDjWqLjkXdoV6xsazxj/m5Mj/1y
	L9qVUlNA9Hm9tvSInZEtKgpioHXNwYteQN41DYhBafj8GmTKGRqyswrj6W0+A8QeZHPL6If+XmXTI
	ACleIWWMfeIdV5j7JKjQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jOyBs-0004X4-RJ; Thu, 16 Apr 2020 06:40:00 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOyBp-0004Vg-NP
 for linux-mtd@lists.infradead.org; Thu, 16 Apr 2020 06:39:59 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1jOyBo-0002Xa-7O; Thu, 16 Apr 2020 08:39:56 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1jOyBn-0002OL-0I; Thu, 16 Apr 2020 08:39:55 +0200
Date: Thu, 16 Apr 2020 08:39:54 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v2] mtd: spi-nor: Add support for cy15x104q
Message-ID: <20200416063954.GT1694@pengutronix.de>
References: <20200305120242.1391-1-s.hauer@pengutronix.de>
 <20200309084033.8752-1-s.hauer@pengutronix.de>
 <8661b73d-bc4b-fa41-b5bf-6f3483d4148d@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8661b73d-bc4b-fa41-b5bf-6f3483d4148d@ti.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 08:37:32 up 56 days, 14:08, 85 users,  load average: 0.23, 0.20, 0.19
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200415_233957_763431_7AB282AB 
X-CRM114-Status: GOOD (  22.41  )
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
Cc: Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org,
 Tudor Ambarus <tudor.ambarus@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

On Wed, Apr 15, 2020 at 10:58:36PM +0530, Vignesh Raghavendra wrote:
> 
> 
> On 09/03/20 2:10 pm, Sascha Hauer wrote:
> > The Cypress cy15b104q and cy15v104q are 4Mbit serial SPI F-RAM devices.
> > Add support for them to the spi-nor driver.
> > 
> > Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> > ---
> > 
> > Changes since v1:
> > - Instead of specifying 1024 sectors with a sector size of 512 specify
> >   512 * 1024 sectos with a sector size of 1. The device has no idea of
> >   sectors and is not erasable, so a sector size of 1 seems to better
> >   reflect reality.
> > 
> >  drivers/mtd/spi-nor/spi-nor.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> > index 4fc632ec18fe..a5c1d684364c 100644
> > --- a/drivers/mtd/spi-nor/spi-nor.c
> > +++ b/drivers/mtd/spi-nor/spi-nor.c
> > @@ -2335,6 +2335,9 @@ static const struct flash_info spi_nor_ids[] = {
> >  
> >  	{ "at45db081d", INFO(0x1f2500, 0, 64 * 1024, 16, SECT_4K) },
> >  
> > +	/* Cypress */
> > +	{ "cy15x104q",  INFO6(0x042cc2, 0x7f7f7f, 512 * 1024, 1, SPI_NOR_NO_ERASE) },
> 
> This seems wrong
> 
> As the datasheet for the device says:
> 
> "Device ID
> The CY15B104Q device can be interrogated for its manufacturer, product
> identification, and die revision. The RDID opcode 9Fh allows
> the user to read the manufacturer ID and product ID, both of which are
> read-only bytes. The JEDEC-assigned manufacturer ID places
> the Cypress (Ramtron) identifier in bank 7; therefore, there are six
> bytes of the continuation code 7Fh followed by the single byte C2h.
> There are two bytes of product ID, which includes a family code, a
> density code, a sub code, and the product revision code."
> 
> I am not sure how are you reading 0x4 as the first byte. It should have
> been 6 bytes of 0x7F followed by 0xc2 right?
> 
> Also 0x7F is continuation code and not actual device ID (See JEDEC
> standard JEP106). You will have to extend spi_nor_read_id() function to
> take care of continuation code and read more bytes in order to get the
> actual Manuf/device ID

The three times 0x7f looked fishy from the start. I'll dig a bit deeper
what is happening here. Thanks for the input.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
