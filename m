Return-Path: <SRS0=TDhY=6N=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C56BC83000
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Apr 2020 16:32:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C48E2073E
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Apr 2020 16:32:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GQmRkuYg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C48E2073E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qHU5RS3GbgjMZ1CEJ/HsQmv4pL9EYgZ3UENE4uNJkVY=; b=GQmRkuYgOAsfWp
	Pq4u0R3lkcoNhmOd5WCuFe+23eQUBwVT4Q73e2y3pnLxTrX/UjTSi+xWjB1OsR57BU+rgHmbYEXY4
	m5FAq79/p2gFfZt7jBIPjzjSjmwhClfvizKfYYtRJCiemuA7r82pJ2Wc9KlRygLjdXGb9X8HQwlE7
	eYUA1aVOFBaEmdFiNCd8h4Sf20JRyZwHrRSa26xKeBtfgRPF+5D8WK/PeX/WUxV7woDAIrE8igfjg
	v0TcltDt1k9ad3gkLaIGTE8iJU5y58OCuKEKnuPk+CN3yJrFVdGApIYWY6CQByp3aoBUXIotMcYzm
	5t9EQjpERwmXGMm4Rngw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTpdX-0001j2-AK; Wed, 29 Apr 2020 16:32:39 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTpdV-0001he-10
 for linux-mtd@lists.infradead.org; Wed, 29 Apr 2020 16:32:38 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 1EC082A0AA3;
 Wed, 29 Apr 2020 17:32:35 +0100 (BST)
Date: Wed, 29 Apr 2020 18:32:31 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2 03/11] mtd: rawnand: Rename a NAND chip option
Message-ID: <20200429183231.1a3607c1@collabora.com>
In-Reply-To: <20200429182200.4240303d@xps13>
References: <20200429155540.22048-1-miquel.raynal@bootlin.com>
 <20200429155540.22048-4-miquel.raynal@bootlin.com>
 <20200429180816.14f16be0@collabora.com>
 <20200429182200.4240303d@xps13>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200429_093237_200879_8E1819AD 
X-CRM114-Status: GOOD (  18.13  )
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
Cc: Michal Simek <monstr@monstr.eu>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 29 Apr 2020 18:22:00 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Hi Boris,
> 
> Boris Brezillon <boris.brezillon@collabora.com> wrote on Wed, 29 Apr
> 2020 18:08:16 +0200:
> 
> > On Wed, 29 Apr 2020 17:55:32 +0200
> > Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> >   
> > > NAND controller drivers can set the NAND_USE_BOUNCE_BUFFER flag to a
> > > chip 'option' field. With this flag, the core is responsible of
> > > providing DMA-able buffers.
> > > 
> > > The current behavior is to not force the use of a bounce buffer when
> > > the core thinks this is not needed. So in the end the name is a bit
> > > misleading, because in theory we will always have a DMA buffer but in
> > > practice it will not always be a bounce buffer.
> > > 
> > > Rename this flag NAND_USE_DMA_BUFFER to be more accurate.    
> > 
> > I still think this one should be named NAND_CONTROLLER_USES_DMA.  
> 
> Actually I want to rework all the flags and prefix them with
> NAND_CONTROLLER, that's why I am keeping the NAND_ prefix. I can change
> the _USE_DMA_BUFFER into _USES_DMA though.

Ack on NAND_USES_DMA.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
