Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0415CC4345F
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Apr 2024 11:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+8CzigANenB5Cb0T9ad8mqq/Izqmt1P0fRJI3tYwQkM=; b=qRd3ST7Pew2zrd
	lJrkqPWbC6oNt9e5gAdztA8DIqCw43HIeI9a86AsqQlkKDopxEYhOIVIwGyDKXPx8OEpiRwTrVxjU
	BMggaxXrDc+n1ZtXtG60s5+vXjmgo6Pp9Vo+tstVt/COI2XkN5lzd9jYajrxRxDQpFQ3XryaM4f60
	sT14ux8nhIznOPPdm/VHE08y5rPPxlbNPIn21h/gNVevdDcmGwHl+CRXgXwIubc4xa6vNxSgAzwBd
	g299sWic0GWVy93CB0X6Qt1R5qVkU70+TRkWcJzuyVtgM/dB356GhvKACmIsGPcmCEAWah3SFcYUo
	d5gP5QQFxXXrJUsyrmrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxQAo-000000022PJ-2MZN;
	Thu, 18 Apr 2024 11:43:26 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxQAk-000000022Of-3sGl
	for linux-mtd@lists.infradead.org;
	Thu, 18 Apr 2024 11:43:24 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <sha@pengutronix.de>)
	id 1rxQAe-0005H2-QC; Thu, 18 Apr 2024 13:43:16 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <sha@pengutronix.de>)
	id 1rxQAd-00Cxsn-Kq; Thu, 18 Apr 2024 13:43:15 +0200
Received: from sha by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <sha@pengutronix.de>)
	id 1rxQAd-001Wn2-1o;
	Thu, 18 Apr 2024 13:43:15 +0200
Date: Thu, 18 Apr 2024 13:43:15 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] mtd: nand: mxc_nand: disable subpage reads
Message-ID: <ZiEHUz3wicDJscGP@pengutronix.de>
References: <20240417-mtd-nand-mxc-nand-exec-op-v1-0-d12564fe54e9@pengutronix.de>
 <20240417-mtd-nand-mxc-nand-exec-op-v1-4-d12564fe54e9@pengutronix.de>
 <ZiDCKGlG4MZ23Tqo@pengutronix.de>
 <20240418113244.6e535d3f@xps-13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240418113244.6e535d3f@xps-13>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_044322_992072_5DCDF0B6 
X-CRM114-Status: GOOD (  45.86  )
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

On Thu, Apr 18, 2024 at 11:32:44AM +0200, Miquel Raynal wrote:
> Hi Sascha,
> 
> s.hauer@pengutronix.de wrote on Thu, 18 Apr 2024 08:48:08 +0200:
> 
> > On Wed, Apr 17, 2024 at 09:13:31AM +0200, Sascha Hauer wrote:
> > > The NAND core enabled subpage reads when a largepage NAND is used with
> > > SOFT_ECC. The i.MX NAND controller doesn't support subpage reads, so
> > > clear the flag again.
> > > 
> > > Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> > > ---
> > >  drivers/mtd/nand/raw/mxc_nand.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > > 
> > > diff --git a/drivers/mtd/nand/raw/mxc_nand.c b/drivers/mtd/nand/raw/mxc_nand.c
> > > index f44c130dca18d..19b46210bd194 100644
> > > --- a/drivers/mtd/nand/raw/mxc_nand.c
> > > +++ b/drivers/mtd/nand/raw/mxc_nand.c
> > > @@ -1667,6 +1667,8 @@ static int mxcnd_probe(struct platform_device *pdev)
> > >  	if (err)
> > >  		goto escan;
> > >  
> > > +	this->options &= ~NAND_SUBPAGE_READ;
> > > +  
> > 
> > Nah, it doesn't work like this. It turns out the BBT is read using
> > subpage reads before we can disable them here.
> >
> > This is the code in nand_scan_tail() we stumble upon:
> > 
> > 	/* Large page NAND with SOFT_ECC should support subpage reads */
> > 	switch (ecc->engine_type) {
> > 	case NAND_ECC_ENGINE_TYPE_SOFT:
> > 		if (chip->page_shift > 9)
> > 			chip->options |= NAND_SUBPAGE_READ;
> > 		break;
> > 
> > 	default:
> > 		break;
> > 	}
> > 
> > So the code assumes subpage reads are ok when SOFT_ECC is in use, which
> > in my case is not true. I guess some drivers depend on the
> > NAND_SUBPAGE_READ bit magically be set, so simply removing this code is
> > likely not an option.  Any ideas what to do?
> 
> Can you elaborate why subpage reads are not an option in your
> situation? While subpage writes depend on chip capabilities, reads
> however should always work: it's just the controller selecting the
> column where to start and then reading less data than it could from the
> NAND cache. It's a very basic NAND controller feature, and I remember
> this was working on eg. an i.MX27.

On the i.MX27 reading a full 2k page means triggering one read operation
per 512 bytes in the NAND controller, so it would be possible to read
subpages by triggering only one read operation instead of four in a row.

The newer SoCs like i.MX25 always read a full page with a single read
operation. We could likely read subpages by temporarily configuring the
controller for a 512b page size NAND.

I just realized the real problem comes with reading the OOB data. With
software BCH the NAND layer hardcodes the read_subpage hook to
nand_read_subpage() which uses nand_change_read_column_op() to read the
OOB data. This uses NAND_CMD_RNDOUT and I have now idea if/how this can
be implemented in the i.MX NAND driver. Right now the controller indeed
reads some data and then the SRAM buffer really contains part of the
desired OOB data, but also part of the user data.

We might overcome these problems, but I am not sure if it's worth it.
It's ancient hardware that I don't want to put too much effort into and
I doubt that the end result would have a better performance when we need
one operation to read the subpage and another one to read OOB as opposed
to always read full pages (which is only one operation, say one
interrupt latency, for each page read).

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
