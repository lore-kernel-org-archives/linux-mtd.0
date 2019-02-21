Return-Path: <SRS0=HEdT=Q4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2DF9C43381
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Feb 2019 11:51:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A030220880
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Feb 2019 11:51:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YtmT9cNe";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="unrPc/TS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A030220880
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XwK5DiBqlhBnbxj9dXJqMIph3UT7s1N990cwrlaCdyA=; b=YtmT9cNeZQKHhZ
	E0DrjDd46gU/iNdv8CzVMWqTQM2qkg/pysM5TLS/Pj8Tj6jjR6VAXmegzBiVz5Ecvq6ezIZlni/4P
	1ZfNBBuvCwmh/SPUDVeNPJoBOZTVzfohmxcyKp5deiqsdW177CcT294P584Ohd4Kq6ps2miwTMBuI
	V5cUstkgSaBIGvAleH4v1MK1cFeyBl/654SHgaU8e0nlIt3nuEtzcEweD+8VuiJ0y7zx2yCdEGDsc
	5FvW3qBCucIi0+ciREIsbsbqzCiIAUtU0j1f0gzjuiJ8PRaAdyPSsXRPh0qahJDQlNVn8+sl5tZHG
	q1dpCcUW5MaUDkXDW9wA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gwmsi-0007SV-NY; Thu, 21 Feb 2019 11:51:12 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gwmsh-0007Ab-4P
 for linux-mtd@bombadil.infradead.org; Thu, 21 Feb 2019 11:51:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6+5t/ytICsqQa4+JvgABL1goOYl1TQTfelxrDGVeKQo=; b=unrPc/TSCIgsk+9dWEuoO1idcM
 CU3ORtEiIFET/YlXC7knnx1tEBpr+YnzfxmJ9AKJiupePeKJffDosbVivNRCLIR4LT3St6m+zKTF7
 9+vTwec0Oo1MVEATy+hu63EZq/OMt3xlqJt7jkNbeFtkaE1SL7IW8YPCxScT420QiFLj8BjYKvAGv
 O3QONczJpDqbNoKDBGW34jqf/2cD+xTZD1ZpKtFMk0YYb0lI86pL9nkPS1F/eu3EkPc/lTQ/PHYya
 tru3fMeFJV2SCYG66JUNbcI4CKv5ssf9eB0YP1MMD20mjGZsdB9ZyQfuECLj2WYwmqjYs1KLWhE8T
 hc3bLg6A==;
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gwmfD-0005ko-GC
 for linux-mtd@lists.infradead.org; Thu, 21 Feb 2019 11:37:17 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 1B1112809F7;
 Thu, 21 Feb 2019 11:37:14 +0000 (GMT)
Date: Thu, 21 Feb 2019 12:37:09 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: Prevent Nand page writes on Power failure
Message-ID: <20190221123709.000aa79d@collabora.com>
In-Reply-To: <20190221112138.i5cqclnlpsjnms7y@pengutronix.de>
References: <20190220135820.b2ku2unaxxdqflut@pengutronix.de>
 <20190221091055.266b9627@collabora.com>
 <20190221101747.zbznw2mdf7p7rcy4@pengutronix.de>
 <20190221113646.6d4eccf1@collabora.com>
 <20190221112138.i5cqclnlpsjnms7y@pengutronix.de>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190221_113715_605130_37F1D5DE 
X-CRM114-Status: GOOD (  38.07  )
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

On Thu, 21 Feb 2019 12:21:38 +0100
Sascha Hauer <s.hauer@pengutronix.de> wrote:

> On Thu, Feb 21, 2019 at 11:36:46AM +0100, Boris Brezillon wrote:
> > On Thu, 21 Feb 2019 11:17:47 +0100
> > Sascha Hauer <s.hauer@pengutronix.de> wrote:
> >   
> > > Hi Boris,
> > > 
> > > On Thu, Feb 21, 2019 at 09:10:55AM +0100, Boris Brezillon wrote:  
> > > > Hi Sascha,
> > > > 
> > > > On Wed, 20 Feb 2019 14:58:20 +0100
> > > > Sascha Hauer <s.hauer@pengutronix.de> wrote:
> > > >     
> > > > > Hi All,
> > > > > 
> > > > > I have hardware here for which the normal way to turn off is just to cut
> > > > > the power. When the powercut happens during a NAND page write then we
> > > > > get more or less completely written pages during next boot. Very rarely
> > > > > it seems to happen that such a half written page with only very few
> > > > > flipped bits is erroneously detected as empty and written again which
> > > > > then results in ECC errors when reading the data.    
> > > > 
> > > > This should definitely be fixed, maybe by lowering the bitflip
> > > > threshold when doing the empty check. Do you know the ECC strength and
> > > > the number of bitflips you have when that problem occurs?    
> > > 
> > > The problem is that these half written pages do not seem to be very
> > > stable. It happens that the number of bitflips change with each read.
> > > I have seen pages which can be read sometimes and sometimes not. It
> > > really seems that half written pages must be avoided entirely.  
> > 
> > But when they are correctly read, do you know how many bitflips they
> > have?  
> 
> Yes, I know this number,

Is it high? I mean, can we tweak the threshold to detect such cases?

> but as said, it varies when reading the same
> page again.

Yes, I can imagine, as cells were weakly programmed, their state might
change from one read to another. What I'm mainly interested in is the
state on the first read after the powercut.

> 
> > To be honest, I fear not all users will be able to be informed
> > that powercuts are about to happen, and we need a way to fix that for
> > everyone.  
> 
> If you want that I'm afraid we can't fix this on this level. You can't
> rely on the data when a powercut happens during write. It may look ok at
> first, but bitflips can develop later. I just found an interesting read
> here:
> https://www.datalight.com/blog/2017/03/08/enemy-of-nand-flash-memory/
> 
> If you want to fix it for all users you have to track somehow which
> pages you have written last and discard the data or copy it to another
> block.

Did you have the problem that pages written with valid data turn into
uncorrectable pages on the second read attempt or is it just
erased/empty pages that turn out to be not so empty/erased and next
time you write to them you end up with uncorrectable errors?

Other than that, yes, tracking which block was written last so that you
can move the data somewhere else in case of an unclean detach/unmount
is an option. Don't know if UBIFS has this information (UBI doesn't,
that's for sure).

> 
> Sascha
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
