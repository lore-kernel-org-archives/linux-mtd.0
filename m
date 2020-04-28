Return-Path: <SRS0=F3bs=6M=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E32BBC83007
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Apr 2020 09:12:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B562D20737
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Apr 2020 09:12:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UKnlXsah"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B562D20737
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q+RjGmeCxy7uwxE3M4H87I8PSS0bKHBZknkZ5+Cial8=; b=UKnlXsahQTzGkv
	1tPWpC2mejowT2VVwXT94XWDvZ2vp4gpa611jSagQQEvCq8sLK3UFqcDKMVC56ye397SjAAJWO6Ls
	eY/XYS9m6h1eX/ljHOTuAba++YROpcUJ9zokwidSfPX2dwc1tO4iATRSBc5SsBvnQdx/381Dq5ru6
	0D9P8Mco1rMY+rg5kWsxix7K+qi+f6rVodDrwNC/lgCLBgLLJGyR6/8Cxh491EpqTm36RoRudeaN7
	iJb5w40MzvVWHcI/ik3C9IjObZQ0nMjc/CGOcos5rjSq+RkGNaYfognnJgsAijB/5jEx2oznd6DYH
	1MYDu+Au8f3lShJ2YfOg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTMHa-0001l9-Ap; Tue, 28 Apr 2020 09:12:02 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTMHX-0001jn-Eg
 for linux-mtd@lists.infradead.org; Tue, 28 Apr 2020 09:12:00 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 207EA2A13F1;
 Tue, 28 Apr 2020 10:11:58 +0100 (BST)
Date: Tue, 28 Apr 2020 11:11:55 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 05/10] mtd: rawnand: Rename the use_bufpoi variables
Message-ID: <20200428111155.57b6c43d@collabora.com>
In-Reply-To: <20200428110501.2caafbd9@xps13>
References: <20200424173631.14311-1-miquel.raynal@bootlin.com>
 <20200424173631.14311-6-miquel.raynal@bootlin.com>
 <20200425104440.5a3144fe@collabora.com>
 <20200428110501.2caafbd9@xps13>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200428_021159_663723_E8876986 
X-CRM114-Status: GOOD (  18.52  )
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

On Tue, 28 Apr 2020 11:05:01 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Hi Boris,
> 
> Boris Brezillon <boris.brezillon@collabora.com> wrote on Sat, 25 Apr
> 2020 10:44:40 +0200:
> 
> > On Fri, 24 Apr 2020 19:36:26 +0200
> > Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> >   
> > > Both in nand_do_read_ops() and nand_do_write_ops() there is a boolean
> > > called use_bufpoi which is set to true in case of unaligned request or
> > > when there is a need for a DMA-able buffer. It basically means "use a
> > > bounce buffer".
> > > 
> > > Depending on the value of use_bufpoi, the bufpoi variable is always
> > > used and will either point to the original buffer or to the nand_chip
> > > structure "internal data buffer" (this buffer is allocated with
> > > kmalloc() on purpose so that it will be DMA-compliant).
> > > 
> > > In all cases bufpoi is used so the boolean name is misleading. Rename
> > > use_bufpoi to be use_bouce_buf to be more accurate.
> > > 
> > > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>    
> > 
> > Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> > 
> > I wonder if we shouldn't find a better name for bufpoi too. Not sure
> > what the poi means here (pointer?). So maybe just rename those into
> > read_buf, write_buf (since buf seems to be declared already).  
> 
> My first patch also renamed bufpoi.
> 
> Actually I read it like "buf pointer" and it makes sense and is used
> all across nand_base.c so I decided to let it as-is for now.

Fair enough.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
