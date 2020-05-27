Return-Path: <SRS0=kTjQ=7J=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B9C0C433DF
	for <linux-mtd@archiver.kernel.org>; Wed, 27 May 2020 07:31:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E32062073B
	for <linux-mtd@archiver.kernel.org>; Wed, 27 May 2020 07:31:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bwFqqSuo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E32062073B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wW6PWSafMS3TrKGyrZLBErwDVDB223G45EKNhNEd2f0=; b=bwFqqSuojvF31U
	PmP4fA8vFT0QEP/CzrPtxBeUt+dZURuNi99dtRpiZMxB3GCPJKBFGm/ALE8pGpd49pIIoEij5ZfCJ
	VjOJ9i8EgoU8QoD1LcmeIryfNps2MvfKLz3o/UdmMWpf96gyiQi7F9C25cCq93XOSyKsVBo9gu8KI
	mFtRDeG3owkoYTdVlVMTWGgrKsRZZ4+OnGvndray6WvyBualWj/pwPPGE7Xajam5ZTZmLxRjBwmMP
	YmG+joDh1vKv5EUqiSxoDGIVxQIl2uHmu8vUEwBZ3Rw5EtET3HSCWpbrq+O7tZ9xsH94Y0y6s5zwq
	s13e4cIP4LpPXfDsLn8A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdqWm-00081P-Nx; Wed, 27 May 2020 07:31:04 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdqUo-0003q8-1u
 for linux-mtd@lists.infradead.org; Wed, 27 May 2020 07:29:03 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 213B82A3612;
 Wed, 27 May 2020 08:29:00 +0100 (BST)
Date: Wed, 27 May 2020 09:28:57 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v5 16/28] mtd: rawnand: timings: Use default values for
 tPROG_max and tBERS_max
Message-ID: <20200527092857.2a95d864@collabora.com>
In-Reply-To: <20200527092249.647dce05@xps13>
References: <20200526191725.7591-1-miquel.raynal@bootlin.com>
 <20200526191725.7591-17-miquel.raynal@bootlin.com>
 <20200526232530.5c9008f1@collabora.com>
 <20200527091758.1a70aabe@xps13> <20200527092249.647dce05@xps13>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200527_002902_263219_B1FA87F1 
X-CRM114-Status: GOOD (  18.74  )
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
Cc: Rickard Andersson <rickaran@axis.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 27 May 2020 09:22:49 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Hi Miquel,
> 
> Miquel Raynal <miquel.raynal@bootlin.com> wrote on Wed, 27 May 2020
> 09:17:58 +0200:
> 
> > Hi Boris,
> > 
> > Boris Brezillon <boris.brezillon@collabora.com> wrote on Tue, 26 May
> > 2020 23:25:30 +0200:
> >   
> > > On Tue, 26 May 2020 21:17:13 +0200
> > > Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> > >     
> > > > The ONFI parameter page of a chip might define more fine grained
> > > > tPROG_max and tBERS_max. When we do not have this information, we
> > > > default to the highest possible values (they are maxima anyway).
> > > > 
> > > > There is no point setting these fields at runtime, so explicitly move
> > > > these defaults to the main ONFI SDR timings structure.      
> > > 
> > > Okay, now I see why you're doing that: you want to return the mode 0
> > > entry directly, and it makes sense, but it should be explained in the
> > > commit message.    
> > 
> > Okay I will mention it in the other commit message, and perhaps move
> > the comment about them as well so that it does not get lost.
> > 
> > I can also assign these timings manually for mode 0 in the helper you
> > requested.  
> 
> Actually I don't like this idea which would mean changing the content
> of the timings structure itself...

Me neither, they should stay const.

> 
> I would prefer to move these 4 values to the structure (as I already
> do) plus moving the comment explaining the derivations.
> 

Agreed.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
