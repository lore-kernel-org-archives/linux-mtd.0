Return-Path: <SRS0=HEdT=Q4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DCC3C43381
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Feb 2019 11:21:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 505672084F
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Feb 2019 11:21:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fgO358fN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 505672084F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dfZHr9ZMslBs3/JYRZP1VH9mRSxOmo26bQHrSJYaQQI=; b=fgO358fN+l1Ney
	04RJlCs+4oHc1ZNRo6K3FvDFXYY78xMopUnc2BrY5UE2L/5nIiHTSLdGJxAFQLNCf72tQxotm65JH
	p0JPf5U2dKji5qtPSu3xBL7lg07Q89T+OEOMmKem5vqXwMjuyBbCUZ4wQUiP+rXL2eIfZSeS+s5Ey
	DPAEnHNHeYjg0dVssoBqB3uVzrPuEIbUt2Mh2HhBvpDXO5wzSbY+SJnMgod7NAX67myB30yAWPIdn
	B6342EacXWVP7hdRnzsitiXycvdQBZLnpM+i4BPtFMh2pE+OdgoTsRR1xDlkQbXxSnBxDnMXSEQVJ
	7bhvKG9ym+GtAY5bEBQg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gwmQC-0007Bg-JH; Thu, 21 Feb 2019 11:21:44 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gwmQ9-0007BC-0d
 for linux-mtd@lists.infradead.org; Thu, 21 Feb 2019 11:21:42 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <sha@pengutronix.de>)
 id 1gwmQ6-0004b4-Vi; Thu, 21 Feb 2019 12:21:38 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <sha@pengutronix.de>)
 id 1gwmQ6-00056N-C7; Thu, 21 Feb 2019 12:21:38 +0100
Date: Thu, 21 Feb 2019 12:21:38 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: Prevent Nand page writes on Power failure
Message-ID: <20190221112138.i5cqclnlpsjnms7y@pengutronix.de>
References: <20190220135820.b2ku2unaxxdqflut@pengutronix.de>
 <20190221091055.266b9627@collabora.com>
 <20190221101747.zbznw2mdf7p7rcy4@pengutronix.de>
 <20190221113646.6d4eccf1@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190221113646.6d4eccf1@collabora.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 11:42:06 up 9 days, 19:07, 70 users, load average: 0.24, 0.19, 0.21
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190221_032141_240309_BA04DA72 
X-CRM114-Status: GOOD (  23.42  )
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
Cc: linux-mtd@lists.infradead.org, kernel@pengutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Feb 21, 2019 at 11:36:46AM +0100, Boris Brezillon wrote:
> On Thu, 21 Feb 2019 11:17:47 +0100
> Sascha Hauer <s.hauer@pengutronix.de> wrote:
> 
> > Hi Boris,
> > 
> > On Thu, Feb 21, 2019 at 09:10:55AM +0100, Boris Brezillon wrote:
> > > Hi Sascha,
> > > 
> > > On Wed, 20 Feb 2019 14:58:20 +0100
> > > Sascha Hauer <s.hauer@pengutronix.de> wrote:
> > >   
> > > > Hi All,
> > > > 
> > > > I have hardware here for which the normal way to turn off is just to cut
> > > > the power. When the powercut happens during a NAND page write then we
> > > > get more or less completely written pages during next boot. Very rarely
> > > > it seems to happen that such a half written page with only very few
> > > > flipped bits is erroneously detected as empty and written again which
> > > > then results in ECC errors when reading the data.  
> > > 
> > > This should definitely be fixed, maybe by lowering the bitflip
> > > threshold when doing the empty check. Do you know the ECC strength and
> > > the number of bitflips you have when that problem occurs?  
> > 
> > The problem is that these half written pages do not seem to be very
> > stable. It happens that the number of bitflips change with each read.
> > I have seen pages which can be read sometimes and sometimes not. It
> > really seems that half written pages must be avoided entirely.
> 
> But when they are correctly read, do you know how many bitflips they
> have?

Yes, I know this number, but as said, it varies when reading the same
page again.

> To be honest, I fear not all users will be able to be informed
> that powercuts are about to happen, and we need a way to fix that for
> everyone.

If you want that I'm afraid we can't fix this on this level. You can't
rely on the data when a powercut happens during write. It may look ok at
first, but bitflips can develop later. I just found an interesting read
here:
https://www.datalight.com/blog/2017/03/08/enemy-of-nand-flash-memory/

If you want to fix it for all users you have to track somehow which
pages you have written last and discard the data or copy it to another
block.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
