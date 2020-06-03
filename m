Return-Path: <SRS0=zMTj=7Q=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C313BC433DF
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Jun 2020 15:13:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A94420738
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Jun 2020 15:13:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t6AD4mZ4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A94420738
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8N0EaEc6c2g0NuLvda1FhYuQzBfQSjg4xx41k4K0HIw=; b=t6AD4mZ4x6YktY
	c5f4mQ1uRgfH2gli7jjYKRDaNaUImM4u7jIjpnZcrzck11dUEadi/1FxfRjIONvgA7yG7uIwiZMHV
	n1/Mll+MHA6yIOmRh+ni3ifqQ3trYllPUsVegKZgloPjefRo5m2/MG+2YmXx2/pFRp00XiCxB5gIr
	c2UfDEOHuPlxBkOAfPQBokXIrTADw/bkRE/sd2ngDT6OE2FNaqTydDf5GzUZElI3oglhmsn2B4zVk
	x1DhndCfpP9dLRIGd6vFe/FqyewYp0xdDB+V81oxEftefbtQ5m/IjBX8G1BokU9A2YnTzy1Gmh8N9
	cLA4SAkkYWyTSamZTOHw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jgV5H-0002pq-HL; Wed, 03 Jun 2020 15:13:39 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgV5F-0002pT-H7
 for linux-mtd@lists.infradead.org; Wed, 03 Jun 2020 15:13:39 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 6629EFF827;
 Wed,  3 Jun 2020 15:13:31 +0000 (UTC)
Date: Wed, 3 Jun 2020 17:13:29 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH 0/3] mtd: rawnand: gpio: Convert to exec_op()
Message-ID: <20200603171329.25d62424@xps13>
In-Reply-To: <20200603150746.1423257-1-boris.brezillon@collabora.com>
References: <20200603150746.1423257-1-boris.brezillon@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200603_081337_699856_2140ACE9 
X-CRM114-Status: GOOD (  14.92  )
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
Cc: linux-mips@linux-mips.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Ralf Baechle <ralf@linux-mips.org>,
 linux-mtd@lists.infradead.org, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Ben Dooks <ben-linux@fluff.org>, Jamie Iles <jamie@jamieiles.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Daniel Mack <daniel@zonque.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


Boris Brezillon <boris.brezillon@collabora.com> wrote on Wed,  3 Jun
2020 17:07:43 +0200:

> Hello,
> 
> A bit of context to explain the motivation behind those conversions
> I've been sending for the last few weeks. The raw NAND subsystem
> carries a lot of history which makes any rework not only painful, but
> also subject to regressions which we only detect when someone dares to
> update its kernel on one of those ancient HW. While carrying drivers
> for old HW is not a problem per se, carrying ancient and unmaintained
> drivers that are not converted to new APIs is a maintenance burden,
> hence this massive conversion attempt I'm conducting here.
> 
> So here is a series converting the GPIO NAND controller driver to
> exec_op(). I hope I'll find someone to test those changes, but if
> there's no one still having access to this HW or no interest in keeping
> it supported in recent kernel versions, we should definitely consider
> removing the driver instead.
> 
> Regards,
> 
> Boris
> 
> Boris Brezillon (3):
>   mtd: rawnand: gpio: Inherit from nand_controller
>   mtd: rawnand: gpio: Implement exec_op()
>   mtd: rawnand: gpio: Get rid of the legacy interface implementation
> 
>  drivers/mtd/nand/raw/gpio.c | 116 ++++++++++++++++++++++++++++--------
>  1 file changed, 91 insertions(+), 25 deletions(-)
> 

Looks fine too!

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
