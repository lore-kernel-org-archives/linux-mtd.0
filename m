Return-Path: <SRS0=a0wE=6H=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5795C55186
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Apr 2020 12:30:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BEAC2077D
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Apr 2020 12:30:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WOM/hAsN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8BEAC2077D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x5/3KY9Bbyrmq4q/Uj8whOipj8Odz1rLUoTb/AtUAvA=; b=WOM/hAsNCSGWDN
	EC+FsHpfiu/3UNWWvxe+52HNsZjJzfr/L687Jh2KW4owRr7xXL46XHaMOT6g4B4zBqaGMLfm1wRt2
	s9ScK+yYw2y/Ntc+AQVC5IPYoKMDL/jiod6m5uQBKhzjePWxbROG1Uq2l3jsNdvtpqFkZ1zKGczmb
	yoz5Lmjat4V+WpgCrxMYXqMtx1notSTWkfmKjC8vp5IR/dKlGfJOXNw3HbGzFLWPJZ/kG0TH6+qoZ
	YVJeduQG1iAy3JW4+JRNTyRUiGEwCMpCM9quLYFXknJ0fR+/ebsJDEM5HFjwKwXKQKZi/6kC4U1Fh
	7pvrl545ogVeksVlbMiA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jRazq-0006s3-6c; Thu, 23 Apr 2020 12:30:26 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jRazn-0006qj-2h
 for linux-mtd@lists.infradead.org; Thu, 23 Apr 2020 12:30:24 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1jRazk-0000To-PN; Thu, 23 Apr 2020 14:30:20 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1jRazj-0000EB-A3; Thu, 23 Apr 2020 14:30:19 +0200
Date: Thu, 23 Apr 2020 14:30:19 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Tudor.Ambarus@microchip.com
Subject: Re: [PATCH v2] mtd: spi-nor: Add support for cy15x104q
Message-ID: <20200423123019.GD5877@pengutronix.de>
References: <20200305120242.1391-1-s.hauer@pengutronix.de>
 <20200309084033.8752-1-s.hauer@pengutronix.de>
 <5556114.QzrDNrOLmZ@192.168.0.120>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5556114.QzrDNrOLmZ@192.168.0.120>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 14:22:56 up 63 days, 19:53, 106 users,  load average: 0.07, 0.11,
 0.15
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200423_053023_119700_49FE1D75 
X-CRM114-Status: GOOD (  20.21  )
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
Cc: richard@nod.at, linux-mtd@lists.infradead.org, vigneshr@ti.com,
 miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Apr 15, 2020 at 03:24:33PM +0000, Tudor.Ambarus@microchip.com wrote:
> On Monday, March 9, 2020 10:40:33 AM EEST Sascha Hauer wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the
> > content is safe
> > 
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
> >         { "at45db081d", INFO(0x1f2500, 0, 64 * 1024, 16, SECT_4K) },
> > 
> > +       /* Cypress */
> > +       { "cy15x104q",  INFO6(0x042cc2, 0x7f7f7f, 512 * 1024, 1,
> > SPI_NOR_NO_ERASE) }, +
> 
> Shouldn't the id start with 0x03 instead of 0x04? Check [1].

The datasheet you are referencing describes only one of a whole family
of chips. They all seem software compatible, here is a list of ids I
found in various datasheets:

CY15B104Q-PZXI     7F7F7F7F7F7FC22C03 51-85075 8-pin PDIP Industrial
CY15B104QN-50SXA   7F7F7F7F7F7FC22C40 001-85261 8-pin SOIC (EIAJ) Automotive
CY15V104QN-50SXI   7F7F7F7F7F7FC22C04 002-18131 8-pin GQFN Industrial
CY15B104QN-20LPXC  7F7F7F7F7F7FC22CA1 002-18131 8-pin GQFN Commercial
CY15B104QN-20LPXI  7F7F7F7F7F7FC22C01 002-18131 8-pin GQFN Industrial
CY15V104QN-20LPXC  7F7F7F7F7F7FC22CA5 002-18131 8-pin GQFN Commercial
CY15V104QN-20LPXI  7F7F7F7F7F7FC22C05 002-18131 8-pin GQFN Industrial
CY15B104QN-50LPXI  7F7F7F7F7F7FC22C00 002-18131 8-pin GQFN Industrial

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
