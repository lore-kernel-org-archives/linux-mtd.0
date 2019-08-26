Return-Path: <SRS0=O+vu=WW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FD80C3A5A6
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Aug 2019 14:03:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 378E220673
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Aug 2019 14:03:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O7EmKsC/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 378E220673
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=360VMy4PfjXl2R64Bth3rRGytsbHYwSau42KGBsiXiM=; b=O7EmKsC//92PU3
	kOKCZ8fcfpL3w8OI2wfJFjnLbCQVKJHyMychGJrogoKijUlK3LahamxuNFaIOd8oBWbYFUKzTjTDF
	ve7W/zJPysn6LqQqrUWtQ0/X8JrEJwipnVG4FEqJtXhl18pVLfXi6dYpuSJutjaOFxYFgjx5AIdRb
	OfN/b1wM1pVvm3wyMTfF3qiwqD0PAAfoyGhGQxl0xhvcF0RfJTXNOSXuP848Uj282w+SvoLlrl8wo
	Wo+48FuNT0om+vm+734w1iqL/Y3AtcpMZkq6nGOh4VMi3aJIvxwpjjGPbWRM+T90J2f3fRVRtTqzz
	0+m1n8XVpB1tGhsItHvQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i2FaN-0007Ll-2G; Mon, 26 Aug 2019 14:03:07 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2FaJ-0007Ki-HM
 for linux-mtd@lists.infradead.org; Mon, 26 Aug 2019 14:03:05 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 7233528A9BB;
 Mon, 26 Aug 2019 15:03:00 +0100 (BST)
Date: Mon, 26 Aug 2019 16:02:57 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Schrempf Frieder <frieder.schrempf@kontron.de>
Subject: Re: [RESEND PATCH v3 14/20] mtd: spi_nor: Add a ->setup() method
Message-ID: <20190826160257.17b46962@collabora.com>
In-Reply-To: <d44218eb-458a-dd59-b79d-7803de2bdc09@kontron.de>
References: <20190826120821.16351-1-tudor.ambarus@microchip.com>
 <20190826120821.16351-15-tudor.ambarus@microchip.com>
 <20190826144002.479494be@collabora.com>
 <d44218eb-458a-dd59-b79d-7803de2bdc09@kontron.de>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190826_070303_709007_95327FA4 
X-CRM114-Status: GOOD (  15.21  )
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
Cc: "vigneshr@ti.com" <vigneshr@ti.com>,
 "Tudor.Ambarus@microchip.com" <Tudor.Ambarus@microchip.com>,
 "richard@nod.at" <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 26 Aug 2019 13:38:48 +0000
Schrempf Frieder <frieder.schrempf@kontron.de> wrote:

> On 26.08.19 14:40, Boris Brezillon wrote:
> > On Mon, 26 Aug 2019 12:08:58 +0000
> > <Tudor.Ambarus@microchip.com> wrote:
> >   
> >> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> >>
> >> nor->params.setup() configures the SPI NOR memory. Useful for SPI NOR
> >> flashes that have peculiarities to the SPI NOR standard, e.g.
> >> different opcodes, specific address calculation, page size, etc.
> >> Right now the only user will be the S3AN chips, but other
> >> manufacturers can implement it if needed.
> >>
> >> Move spi_nor_setup() related code in order to avoid a forward
> >> declaration to spi_nor_default_setup().
> >>
> >> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>  
> > 
> > Nitpick: R-bs should normally be placed after your SoB.  
> 
> Just a question unrelated to the patch content:
> 
> I learned to add R-b tags after my SoB when submitting MTD patches, but 
> recently I submitted a patch to the serial subsystem and was told to put 
> my SoB last. Is there an "official" rule for this? And if so where to 
> find it?

Should match the order of addition: if you picked an existing patch that
had already received R-b/A-b tags and applied it to your tree you
should add your SoB at the end. But if you are the author, your SoB
should come first. At least that's the rule I follow :-).

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
