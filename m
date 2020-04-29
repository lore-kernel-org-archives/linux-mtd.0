Return-Path: <SRS0=TDhY=6N=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D44E1C83000
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Apr 2020 16:22:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A30AE206F0
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Apr 2020 16:22:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a3aaqhhw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A30AE206F0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BRHm+HNIioi8Yx52HuiltqgWkgh2F0Eqp9x52yxqqTo=; b=a3aaqhhwNxOEf2
	/8aZLulpUwe+UVtoeaiWVK6Q8Pb/aXkOobluZw0aZ0LhF1KuhdD8pQ7zKJpS4HMMPQc3OZc/RNTSh
	O1JkcBfnWYsb5+LimbnLEZrm5uI3ug53Q64s2RlaNxnoa4fqN6ZCzRGsH75+fK+uyLbPV/e8qVmAF
	77XVpTnDF4uIlrx44v853dBgYaeEG7/1R6YXx4Y0JTrmn5C1U8HxF9pR4qQZd4LD/KDm0P/eihbya
	FhN2M02RIZX8qXUWYgM1nw/tNH5ETsJZ9C54PB43NDDy9BHYwtFJmCH7w/7tr+MkcYpVYEOWf4UvF
	sYx4b+NTL5SxkkcyqwKw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTpTN-0001NH-WB; Wed, 29 Apr 2020 16:22:09 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTpTK-0001M9-Ou
 for linux-mtd@lists.infradead.org; Wed, 29 Apr 2020 16:22:08 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 0E0EE24000F;
 Wed, 29 Apr 2020 16:22:01 +0000 (UTC)
Date: Wed, 29 Apr 2020 18:22:00 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v2 03/11] mtd: rawnand: Rename a NAND chip option
Message-ID: <20200429182200.4240303d@xps13>
In-Reply-To: <20200429180816.14f16be0@collabora.com>
References: <20200429155540.22048-1-miquel.raynal@bootlin.com>
 <20200429155540.22048-4-miquel.raynal@bootlin.com>
 <20200429180816.14f16be0@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200429_092206_941566_9FD60EB5 
X-CRM114-Status: GOOD (  14.10  )
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

Hi Boris,

Boris Brezillon <boris.brezillon@collabora.com> wrote on Wed, 29 Apr
2020 18:08:16 +0200:

> On Wed, 29 Apr 2020 17:55:32 +0200
> Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> 
> > NAND controller drivers can set the NAND_USE_BOUNCE_BUFFER flag to a
> > chip 'option' field. With this flag, the core is responsible of
> > providing DMA-able buffers.
> > 
> > The current behavior is to not force the use of a bounce buffer when
> > the core thinks this is not needed. So in the end the name is a bit
> > misleading, because in theory we will always have a DMA buffer but in
> > practice it will not always be a bounce buffer.
> > 
> > Rename this flag NAND_USE_DMA_BUFFER to be more accurate.  
> 
> I still think this one should be named NAND_CONTROLLER_USES_DMA.

Actually I want to rework all the flags and prefix them with
NAND_CONTROLLER, that's why I am keeping the NAND_ prefix. I can change
the _USE_DMA_BUFFER into _USES_DMA though.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
