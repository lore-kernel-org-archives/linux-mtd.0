Return-Path: <SRS0=mdPP=EZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0224C64E8A
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 21:06:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E9C922267
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 21:06:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N69NaPxJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E9C922267
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YohfEEYDyZ88Mid2EmxH0oZsuZc87Dx3KBljafnGasg=; b=N69NaPxJB3SWuV4kjDluUmA7B
	r+lB6AILWdKd3MkSmXmZUwFIoZr/YMOyuiFuezcRYU44bKOM/pqNfNdXQcZlW/ljovNUjfeZMNJzo
	G7SIvbVhns1qs2t/ZLiQ6BRYy/ip+5QAKdXHOMXN2CpUXdXkJ3e2AQALDcxgDKYSTX1SPbBU6Onyj
	VpniRYsIB6GGqZnf6qaAr/XRo5b445fTta+lPrT6Er4NMTSEL0OtNT3qb23Vv1sBj2q729i76oUIx
	XFTdW5O10z2AY0PsaRYCOXZurlgGJ5JwPMbWWsx8md0+8Jrpua7Gvcd9QYb9c1yjpH+3/YOEu4NqR
	IFO+M8Nqg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfr7j-00012Y-EJ; Thu, 19 Nov 2020 21:05:47 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfr7h-000127-PE
 for linux-mtd@lists.infradead.org; Thu, 19 Nov 2020 21:05:46 +0000
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 0B372200004;
 Thu, 19 Nov 2020 21:05:42 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd/nand: Use mtd->oops_panic_write as condition
Date: Thu, 19 Nov 2020 22:05:42 +0100
Message-Id: <20201119210542.23779-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201113141422.2214771-1-bigeasy@linutronix.de>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 3ab4e973a62c8f44e88a20de73dbc71e09b8d8ca
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_160545_955241_4E91BA5D 
X-CRM114-Status: GOOD (  13.89  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Kyungmin Park <kyungmin.park@samsung.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, 2020-11-13 at 14:14:22 UTC, Sebastian Andrzej Siewior wrote:
> From: Thomas Gleixner <tglx@linutronix.de>
> 
> struct mtd_info has a flag oops_panic_write which is set when the write
> operation is issued via the panic_write() callback. That allows controller
> drivers to distinguish the panic write from a regular write.
> 
> Replace the open coded 'in_interrupt() | oops_in_progress' checks with a
> check for that flag. in_interrupt() is an unrealiable indicator anyway as
> it covers all sorts of atomic contexts not only hard and soft interrupt
> service routines.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Cc: Tudor Ambarus <tudor.ambarus@microchip.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: linux-mtd@lists.infradead.org
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
