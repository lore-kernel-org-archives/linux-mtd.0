Return-Path: <SRS0=jKlu=O4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE80FC433F5
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Oct 2021 16:09:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A61D161027
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Oct 2021 16:09:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A61D161027
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qDIpehaicZ401FIxa9q0g7MFXCH+NK3mrA8QRb9PF5s=; b=ozmXQYqKhEQdq9
	mXxxZohzdyM9vXSCSJMMu1qdtfij3dzduDNMHkAkt+nzkmeZDnQ/3xCE8320K8f/GFK9ZWQyymL3J
	68eztXMi36HmHw5UAKJcumtVWJ0rx3mapYJH6Om9F+pYylAzjfZxP8lSHy230YKP85TpjfJOBi2tk
	ohHGPQhDMLambnvyD0dsnOlD1u7/vs/xbmiaLgLvhPnDjPDCsguEwBzGNP2XMnLgHBBqoE5FzUbxx
	4W0uCIwrZRUVnzzMQn/sUVmQhWndDm7BhRTc9kGGqPKT/KOacYmSK8rcSraarf02uOJf19/N3Cx1v
	9/1fA1t57idbZynVcNVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYsQZ-003Qre-25; Fri, 08 Oct 2021 16:08:55 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYsPw-003Qd3-PQ
 for linux-mtd@lists.infradead.org; Fri, 08 Oct 2021 16:08:18 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 6B6821F45B9B;
 Fri,  8 Oct 2021 17:08:14 +0100 (BST)
Date: Fri, 8 Oct 2021 18:08:11 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Sean Nyekjaer <sean@geanix.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Boris Brezillon
 <bbrezillon@kernel.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 1/2] mtd: core: protect access to mtd devices while
 in suspend
Message-ID: <20211008180811.36c371f5@collabora.com>
In-Reply-To: <20211008173526.19745a10@xps13>
References: <20211008141524.20ca8219@collabora.com>
 <20211008143825.3717116-1-sean@geanix.com>
 <20211008173526.19745a10@xps13>
Organization: Collabora
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_090817_021225_58072105 
X-CRM114-Status: GOOD (  14.54  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, 8 Oct 2021 17:35:26 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> > into suspend. But it's actually "mtd: rawnand: Simplify the locking" that
> > allows it to return errors rather than locking, before that commit it would
> > have waited for the rawnand device to resume.  
> 
> I don't think so, I believe it was broken in the same way but was just
> not returning errors.

Actually I was wrong, 013e6292aaf5 ("mtd: rawnand: Simplify the
locking") removed the blocking wait (returning -EBUSY when the device
is suspended instead of putting the thread on a waitqueue). At that
time, I assumed all threads would be paused when the device is
suspended, which appeared to be incorrect. So I guess the Fixes tag
should remain, and we might want to consider backporting a less
invasive patch to stable releases (one touching only the raw NAND
layer).

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
