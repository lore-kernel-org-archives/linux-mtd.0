Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9357C25B74
	for <linux-mtd@archiver.kernel.org>; Thu, 16 May 2024 11:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+YX9KCSvDtfJaNczG0FJcbrA/Kgu6QZyq80p3EWPrCQ=; b=TQUCkJIimmx6vX
	AzZLvYKa23w4jlGOsEg2ajmcLGVDXB9sNgavdKK9p84R4VTDEILu1IChnZaew7QuS9vWGxBsGcRnu
	SPsj6tURdvb3IkrONcrTGdIxHzjMuqlrQrshuZu+bkJziPIuee9bu2ZEE/nQWoE2rMqLFva+I9kmq
	11D7trqwsB5mBsVfGrdG9+GkQyzPGoFSwx+l6MTEU7Ok5alc6cInBXaE4prvzT9TMb0+LuXaoJnk5
	G9qTvRD+x+wHhA46cofq7mE44mfuZC2M+xg86YTno9HqIODR53j5t5Q2LkbzmagMI/UP4hVFJDkwR
	BDCX/G9xViJ4o3iw1mAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7ZbG-00000004fgX-3tnJ;
	Thu, 16 May 2024 11:48:42 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7ZbC-00000004ffl-3Mi5
	for linux-mtd@lists.infradead.org;
	Thu, 16 May 2024 11:48:40 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <sha@pengutronix.de>)
	id 1s7ZbB-0002rM-GM; Thu, 16 May 2024 13:48:37 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <sha@pengutronix.de>)
	id 1s7ZbB-001hhR-0h; Thu, 16 May 2024 13:48:37 +0200
Received: from sha by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <sha@pengutronix.de>)
	id 1s7ZbA-00EqdY-31;
	Thu, 16 May 2024 13:48:36 +0200
Date: Thu, 16 May 2024 13:48:36 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH] mtd: rawnand: onfi: read parameter pages in one go
Message-ID: <ZkXylC2xrlqGW_xV@pengutronix.de>
References: <20240514134140.1050141-1-s.hauer@pengutronix.de>
 <20240516101350.78e5ee29@xps-13>
 <20240516115812.02908822@xps-13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240516115812.02908822@xps-13>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240516_044838_867213_B93DBC61 
X-CRM114-Status: GOOD (  24.69  )
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

On Thu, May 16, 2024 at 11:58:12AM +0200, Miquel Raynal wrote:
> 
> miquel.raynal@bootlin.com wrote on Thu, 16 May 2024 10:13:50 +0200:
> 
> > Hi Sascha,
> > 
> > s.hauer@pengutronix.de wrote on Tue, 14 May 2024 15:41:40 +0200:
> > 
> > > nand_read_data_op() is not supported by all NAND controllers.
> > > nand_change_read_column_op() is not supported or at least is hard to
> > > support by NAND controllers that use a different page layout than
> > > expected by the NAND core.  
> > 
> > I'm sorry but RNDOUT is not so hard to support, and I know no NAND
> > controller without this feature (I think even the first mxc controller
> > supports it?). However, the command does not exist on small page NANDs
> > (512 bytes).
> 
> Nevermind, the ONFI spec (in all versions) states that RNDOUT are
> allowed during parameter page reads, regardless of the size of the chip
> (at least, that is not mentioned).

I could imagine that there are no ONFI compliant chips with small pages,
I don't know how to verify this though.

Anyway, this was a try to make reading the parameter pages a bit more
straight forward. It seems the MXC NAND controller can't support reading
three parameter pages in one go either. It works in software ECC mode
because I reverse the syndome type layout the controller introduces, but
it can't work with hardware ECC. So disregard this patch.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
