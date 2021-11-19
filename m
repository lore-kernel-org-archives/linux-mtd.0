Return-Path: <SRS0=xpyr=QG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B35EC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Nov 2021 18:41:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE34A615E2
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Nov 2021 18:41:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DE34A615E2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7R9JASHf8PO1uCY70+oH6Jt5ub09+YrS16iSmXUiSyo=; b=R0eaGmdeYI8ANb
	9SCQbTozl0yu+GS+9omgYpRvP9ntrsx8mq5386kAtAB29fwZs5qKjjqlM+OZ37gLtXMTgL0i608oG
	I8S/WHQmy7tsP4t2xlERl1rio5gETW+mnAAPYfD+G/fAj580fVWG38b0imaWuPJ0WVj+KvtYd6LNO
	g+DOm1EMkN0VnH+hABTF9awAUbNWCJ/DUdVUrLjrlVaxyL2+9MwD7s68ZSpi2N0K6IY0PSBIcMEOP
	NevxrtGCMHZBFM/3u1QVbgeFGXPnfUsfgtY6TmZOzb5GrB5ehiBkZ8WVDXOknKYDvj1B/PUvtj+KH
	hx9G5ILpzG+FfMG6qVfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mo8p9-00BJx7-N0; Fri, 19 Nov 2021 18:41:23 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mo8jl-00BINt-6n
 for linux-mtd@lists.infradead.org; Fri, 19 Nov 2021 18:35:50 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 176A940006;
 Fri, 19 Nov 2021 18:35:47 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sean Nyekjaer <sean@geanix.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/4] mtd: mtdconcat: don't use mtd_{suspend,resume}()
Date: Fri, 19 Nov 2021 19:35:46 +0100
Message-Id: <20211119183546.1330250-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211102110204.3334609-3-sean@geanix.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'46c8159560c994248fbb3c866bc27ad87c304419'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_103549_432534_72B3951B 
X-CRM114-Status: GOOD (  10.19  )
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

On Tue, 2021-11-02 at 11:02:02 UTC, Sean Nyekjaer wrote:
> From: Boris Brezillon <boris.brezillon@collabora.com>
> 
> The MTD suspend logic will soon be adjusted to automatically wait for
> device wake-up before issuing IOs. In order to do that a new read-write
> lock will be added and taken in write-mode in the
> mtd_{suspend,resume}() path. Since mtdconcat.c itself is an MTD device,
> calling mtd_suspend/resume() on subdevices from the mtdconcat
> ->_{suspend,resume}() hook will lead to a nested lock, which lockdep
> will complain about if we don't add a proper annotation. Let's keep
> things simple and replace those mtd_{suspend,resume}(subdev) calls by
> subdev->_{suspend,resume}() ones to avoid this situation.
> 
> Tested-by: Sean Nyekjaer <sean@geanix.com>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Sean Nyekjaer <sean@geanix.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
