Return-Path: <SRS0=joji=TV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68305C04AAF
	for <linux-mtd@archiver.kernel.org>; Tue, 21 May 2019 07:58:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A6C92173C
	for <linux-mtd@archiver.kernel.org>; Tue, 21 May 2019 07:58:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iFNZNzOh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A6C92173C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PUnvUWwTKiBNP9R5f1LxQWfGVzIN9ysQQUPoPHNG84U=; b=iFNZNzOhiYNAY0
	A7d78S6YWG6g9aPJi6Xotnn30xYs8WoDO/u8k+FsmHnJeVjjGA6nYxr2p9c208qD3vfWREOdlHZWX
	Az16oJOwUKqeEg25bZ0RhMNCpXWoQ4OHVY3rQoKd8yTuJOH32Q7im8E3kyx0LugMvudJok/C75/E7
	cRQM3jPDIYNLLmQIyFEeOUZzugBZa8BqAQ/Q2qHEetcZLNCVNqctDziYNgT9sE4ivGaS6oVxCZOoQ
	toewn8O2gvDzRR7JRUh3hj7y9ThejF8aAAUzZgaTEaR1TK2zalQKlQHrHx1U0Vh8qepBH1hB8jB0T
	Y1TTKhYRtIYSR/HCOkMQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSzfX-0003FQ-Ly; Tue, 21 May 2019 07:58:43 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSzfU-0003El-LG
 for linux-mtd@lists.infradead.org; Tue, 21 May 2019 07:58:42 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <sha@pengutronix.de>)
 id 1hSzfJ-0004dW-Sy; Tue, 21 May 2019 09:58:29 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <sha@pengutronix.de>)
 id 1hSzfG-0007g7-0T; Tue, 21 May 2019 09:58:26 +0200
Date: Tue, 21 May 2019 09:58:25 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v2 14/15] mtd: rawnand: Get rid of chip->numchips
Message-ID: <20190521075825.yaxdgxsqhzm7y2id@pengutronix.de>
References: <20190304201522.11323-1-miquel.raynal@bootlin.com>
 <20190304201522.11323-15-miquel.raynal@bootlin.com>
 <20190521065948.GA16530@pengutronix.de>
 <20190521093302.079f5470@collabora.com>
 <20190521095130.58573d20@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190521095130.58573d20@collabora.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 09:57:50 up 3 days, 14:16, 44 users, load average: 0.12, 0.12, 0.15
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190521_005840_856125_9403ADBC 
X-CRM114-Status: GOOD (  22.26  )
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
Cc: Mason Yang <masonccyang@mxic.com.tw>, Vignesh R <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Julien Su <juliensu@mxic.com.tw>,
 Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Schrempf Frieder <frieder.schrempf@kontron.de>,
 Marek Vasut <marek.vasut@gmail.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, May 21, 2019 at 09:51:30AM +0200, Boris Brezillon wrote:
> On Tue, 21 May 2019 09:33:02 +0200
> Boris Brezillon <boris.brezillon@collabora.com> wrote:
> 
> > On Tue, 21 May 2019 08:59:48 +0200
> > Sascha Hauer <s.hauer@pengutronix.de> wrote:
> > 
> > > Hi,
> > > 
> > > On Mon, Mar 04, 2019 at 09:15:21PM +0100, Miquel Raynal wrote:  
> > > > diff --git a/drivers/mtd/nand/raw/internals.h b/drivers/mtd/nand/raw/internals.h
> > > > index fbf6ca015cd7..a204f9d7e123 100644
> > > > --- a/drivers/mtd/nand/raw/internals.h
> > > > +++ b/drivers/mtd/nand/raw/internals.h
> > > > @@ -110,7 +110,7 @@ static inline int nand_exec_op(struct nand_chip *chip,
> > > >  	if (!nand_has_exec_op(chip))
> > > >  		return -ENOTSUPP;
> > > >  
> > > > -	if (WARN_ON(op->cs >= chip->numchips))
> > > > +	if (WARN_ON(op->cs >= nanddev_ntargets(&chip->base)))
> > > >  		return -EINVAL;    
> > > 
> > > This warning triggers when I apply my gpmi nand exec_op series.
> > > 
> > > The gpmi driver calls:
> > > 
> > > 	ret = nand_scan(chip, GPMI_IS_MX6(this) ? 2 : 1);
> > > 
> > > This ends up in nand_scan_ident() with maxchips = 2. Here nand_detect()
> > > is called which sets memorg->ntargets = 1; Later in nand_scan_ident() we
> > > have:
> > > 
> > > 	for (i = 1; i < maxchips; i++) {  
> > 
> > This loop should be fixed to test against nanddev_ntargets() instead of
> > maxchips.
> 
> Nevermind, I see what you mean. I guess we should set ->ntargets to
> maxchips before entering this loop.

Okay, you got the same conclusion in the meantime ;)

Sascha


-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
