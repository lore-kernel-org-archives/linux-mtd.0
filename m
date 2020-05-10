Return-Path: <SRS0=JbbF=6Y=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70225C54E49
	for <linux-mtd@archiver.kernel.org>; Sun, 10 May 2020 08:33:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3ADA620820
	for <linux-mtd@archiver.kernel.org>; Sun, 10 May 2020 08:33:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tiyvaoHo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3ADA620820
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yRJNlL9YwjI8gZZk50peM9d0tgHtV47plDrj5fKH0l0=; b=tiyvaoHoXXrWHo
	Ge/P5agE9Rx6VcipUSOweWNEj6a956wV++SSScwqFQ/uyJhxrv+vEbqgunNV/zRqTyrFyjoCpW6n5
	AfGAqO9qfDM7jwR3qHmmlQOPr38ZZO2QonySSIh+iVfaFLfXH8BfWTHV3vLmz5izXyUWSlbXeVdH3
	K18rtojUgTD5vmHiZVMfKR3Yfv/0K4801tK7g2BgbhnqgchVjLDsBNSjjJQ+LZ4R6rLCAaaQisWWL
	5EanEblRj2Xs+rHrSPrEAGv3DFQPoj/9r9aIZkFtby367tj0vtnW1TM26vtCOVtx++PgpPfSBhq5s
	siiZk6PE/mIkigQzTRSg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jXhOi-00061c-H9; Sun, 10 May 2020 08:33:20 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jXhOe-000612-I8
 for linux-mtd@lists.infradead.org; Sun, 10 May 2020 08:33:18 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 27700200005;
 Sun, 10 May 2020 08:33:10 +0000 (UTC)
Date: Sun, 10 May 2020 10:33:09 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v4 7/8] mtd: rawnand: arasan: Add new Arasan NAND
 controller
Message-ID: <20200510103309.4ef5467a@xps13>
In-Reply-To: <20200510085219.2f726178@collabora.com>
References: <20200508171339.8052-1-miquel.raynal@bootlin.com>
 <20200508171339.8052-8-miquel.raynal@bootlin.com>
 <20200510085146.3f5274b2@collabora.com>
 <20200510085219.2f726178@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200510_013316_732028_A4C35285 
X-CRM114-Status: GOOD (  10.20  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Michal Simek <monstr@monstr.eu>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Boris,

Boris Brezillon <boris.brezillon@collabora.com> wrote on Sun, 10 May
2020 08:52:19 +0200:

> On Sun, 10 May 2020 08:51:46 +0200
> Boris Brezillon <boris.brezillon@collabora.com> wrote:
> 
> > On Fri,  8 May 2020 19:13:38 +0200
> > Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> >   
> > > +			pktsize = DIV_ROUND_UP(nfc_op->len, nfc_op->steps);
> > > +			nfc_op->pkt_reg |= PKT_SIZE(round_up(pktsize, 4)) |
> > > +					   PKT_STEPS(nfc_op->steps);    
> > 
> > I thought we agreed on reject any mismatch in the size. Any reason for  
> 
> 			 ^rejecting
> 
> > not being strict here?  
> 

I cannot, reading a two bytes ID fails if I don't round it up to 4 ->
no NAND device found!

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
