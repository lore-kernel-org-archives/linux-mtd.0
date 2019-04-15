Return-Path: <SRS0=BkV4=SR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0137C282CE
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Apr 2019 07:14:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFDB320825
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Apr 2019 07:14:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fEWCzqe9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BFDB320825
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IcoxSeiYI5+R++Zr1B+7tAwDGkcurgAwaw/F9iiW8CI=; b=fEWCzqe9HFuDmH
	iuD647+crwDrd1RSkov2gym8dz1i4QAlgxWJjkkGXEQAPAh6gRdAhOSeAVitRPwTLEuOgKuWKatvV
	lBn+UL/wt7kPwTCX/d+O7kcH78wL6x7/c6r2JAjzNRDSWRD7oKPP3/tNAKylvYhmXUd75plnynf+v
	jz9H75iz2abNGrxZmz14ltA/6I7ylfPydXePTOdeVZnQ3eTK4fh+ks2TKsGObxUwPF6LeT9ykd/0S
	wgbBsYR5x8C4ZT5BqSmRAOPDLLCXFqp7g+jt2Y5uJ7P40+9A4zU070Trso23yygXhGhRT+Zz35jDU
	XUpVR6ThCSQ8NsjWBWRw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hFvp5-0007MX-6U; Mon, 15 Apr 2019 07:14:35 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hFvoy-0007GU-17; Mon, 15 Apr 2019 07:14:29 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id D947528159D;
 Mon, 15 Apr 2019 08:14:23 +0100 (BST)
Date: Mon, 15 Apr 2019 09:14:20 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 2/3] mtd: rawnand: sunxi: Add DMA support for sun8i
Message-ID: <20190415091420.3fb86ef7@collabora.com>
In-Reply-To: <20190415085859.21f69396@xps13>
References: <20190404162111.22618-1-miquel.raynal@bootlin.com>
 <20190404162111.22618-3-miquel.raynal@bootlin.com>
 <20190414110549.5c91829d@collabora.com>
 <20190415085859.21f69396@xps13>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190415_001428_197993_532C64F9 
X-CRM114-Status: GOOD (  24.13  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Marek Vasut <marek.vasut@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 15 Apr 2019 08:58:59 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Hi Boris,
> 
> Boris Brezillon <boris.brezillon@collabora.com> wrote on Sun, 14 Apr
> 2019 11:05:49 +0200:
> 
> > On Thu,  4 Apr 2019 18:21:10 +0200
> > Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> >   
> > > Allwinner NAND controllers can make use of DMA to enhance the I/O
> > > throughput thanks to ECC pipelining. DMA handling with sun8i NAND IP
> > > is a bit different than with the older SoCs, hence the introduction of
> > > a new compatible to handle:
> > > * the differences between register offsets,
> > > * the burst length change from 4 to minimum 8,
> > > * drive SRAM accesses through the AHB bus instead of the MBUS.    
> > 
> > Hm, now that you know MBUS accesses are working fine (IIRC, that's what
> > you used for the SPL DMA-based implementation), why not directly use
> > MBUS accesses on A33? I mean, it's likely faster than going through
> > the DMA engine (which is shared by several IPs), and AFAIR, the MBUS
> > setup is pretty simple.  
> 
> Because all the driver is already in shape to use the external DMA
> engine and it was very easy and quick (have a look at the diff of the
> v3) to use it again.

Yes, I see that. I might be wrong but I'd expect the MDMA version to be
just as simple as this one.

> 
> However, the choice I am describing here is not DMA vs. MBUS (or MDMA),
> it is MBUS vs. AHB, it is just about the bus that will access the SRAM
> (this is what we have understood with Maxime from the datasheets and
> the tests we have done).

Yes, sorry, I meant MDMA vs shared DMA engine, but I guess MBUS is only
used through MDMA accesses anyway, right?

> For this choice, we tested with both buses: no
> throughput change so we think that it is not a bottleneck anyway.

Well, you'd need to test with a lot of traffic going through the DMA
engine to check if that makes a difference.

Anyway, it was just a suggestion, keep it like that if you think using
MDMA is not worthwhile.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
