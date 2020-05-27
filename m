Return-Path: <SRS0=kTjQ=7J=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B27C5C433E0
	for <linux-mtd@archiver.kernel.org>; Wed, 27 May 2020 09:35:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8081C208B8
	for <linux-mtd@archiver.kernel.org>; Wed, 27 May 2020 09:35:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i86cNGoY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8081C208B8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I9AFbGckLzGUz1J6pZCCWeRdymlfBiKHJKnjNt6nOpw=; b=i86cNGoYpcpIM7
	jIvwJLePHqhTRbJJN6K99/mu9sCDF/qhp/xcuot5jgK8b2fqYRSLuMdJHx58TcHDwTXb1ULBoRj1g
	bNLbA2ujXCuoMzJpAPEhpgzI0R1FhGyHAzusfCdobH+K4tKF1/DamFwUP78P2K76LITGnCn3ZUFWR
	a+h3OZ0atsASpSFkjWhlvjVG3fZxPzVkkCtEBvQ2gjQW3glG41e9PWql2JbCPXxgl1bZyvP8Wcd2K
	+GzPFUlIdw8QB+XVgYmlmy98+aDrP/PMkLNxbbGaQz2DPBdUZCTPmO6YPOqtnYa/8BDPDAXjUiye7
	IC25OVBRIIbVEjdbm3iw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdsSi-0002uN-6U; Wed, 27 May 2020 09:35:00 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdsSf-0002u0-D8
 for linux-mtd@lists.infradead.org; Wed, 27 May 2020 09:34:58 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 18CB6C0009;
 Wed, 27 May 2020 09:34:52 +0000 (UTC)
Date: Wed, 27 May 2020 11:34:51 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v5 28/28] mtd: rawnand: Allocate the best data interface
 structure dynamically
Message-ID: <20200527113451.3555997d@xps13>
In-Reply-To: <20200527105749.05b24019@collabora.com>
References: <20200526191725.7591-1-miquel.raynal@bootlin.com>
 <20200526191725.7591-29-miquel.raynal@bootlin.com>
 <20200527002844.7e54aa22@collabora.com>
 <20200527095732.467db722@xps13>
 <20200527103519.0863732c@collabora.com>
 <20200527104911.77679eeb@xps13>
 <20200527105749.05b24019@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200527_023457_578977_DF260CD8 
X-CRM114-Status: GOOD (  18.34  )
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


Boris Brezillon <boris.brezillon@collabora.com> wrote on Wed, 27 May
2020 10:57:49 +0200:

> On Wed, 27 May 2020 10:49:11 +0200
> Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> 
> > Boris Brezillon <boris.brezillon@collabora.com> wrote on Wed, 27 May
> > 2020 10:35:19 +0200:
> >   
> > > On Wed, 27 May 2020 09:57:32 +0200
> > > Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> > >     
> > > > Maybe I misunderstood your request, you were saying that allocating a
> > > > "best data interface object" would be good, so I interpreted it as:
> > > > rename it, and allocated it dynamically. I'm fine keeping
> > > > data_interface and just declaring it as a pointer.      
> > > 
> > > Correct, renaming it into best_iface_cfg is probably good, but then,
> > > maybe we should have a current_iface_cfg, so the core/drivers always
> > > have a pointer to the currently applied config (which after a reset
> > > can be the reset config for a short period of time).    
> > 
> > That's why I created an indirection on chip->data_interface.
> > nand_get_interface_cfg() is here for that -> the drivers do not care
> > about which one is applied. I don't think we need more than I already
> > proposed:  
> > -> there is one default reset configuration object that can be used by    
> >    anyone  
> > -> there is a best configuration    
> > 
> > If the best configuration has been derived, then it will be used.
> > Otherwise, the helper will fallback to the default slower one, and this
> > covers all the cases :)  
> 
> My point is, during a reset, you want to use the reset config, but
> nand_get_interface_cfg() will always return the best config, which is
> not the one currently applied until you actually return back to the
> best interface config. That means that any driver using
> nand_get_interface_cfg() in the exec_op() path will get a wrong config.
> So I'd suggest either not exposing nand_get_interface_cfg() to
> controller drivers (which would be a valid approach) or making sure it
> always return the currently applied timings.

You are right.

STM32_FMC and Marvell controllers access these timings.

I can have a "interface_cfg" and a "best_interface_cfg". Both being
just pointers. nand_get_interface_cfg would return the interface_cfg
pointer which would always be set (either to the default basic
configuration or the quick one). 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
