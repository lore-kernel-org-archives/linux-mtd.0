Return-Path: <SRS0=+zBv=GR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B431C433DB
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Jan 2021 15:48:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EED823A9F
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Jan 2021 15:48:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2EED823A9F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4kIsTKSGc9gXBqM/y97mldh2IqHydvQObUz/I0xnXSc=; b=XTpLBWNoaNSmoW4r0FlmyqRgz
	ma9GoJ+7STv0jfb1duxLe3qkar4WqmJK014fqIcYa9EUHvj+PV+cBcbL4duXEOb/w3IXbkJpg7Nng
	pSBeG5jrLD++IYZyKQQ4RAUD+/PwYzVeI+dbJtXrO8bZVzufg7lwVhlAYr8B1RQyeI/UJCgaRLbYH
	ZfLU/a1jsuX6dzEIX/I7byz0ZSI1AIczYzXoaa59Iy39CWfem0GjP2av2jlfiB/BNLNSAF4OPbXD7
	DDig0c3Lz7PwMSx/Zbh8pXVXHDRzSBE9VH9FEUpD1nDkJB3nHUwgxxQ6+cVghj1QmBpj12BT6DO8r
	saMhyhDoA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l04qu-0004EJ-Bf; Thu, 14 Jan 2021 15:48:00 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l04qr-0004DU-GD
 for linux-mtd@lists.infradead.org; Thu, 14 Jan 2021 15:47:58 +0000
X-Originating-IP: 86.201.233.230
Received: from localhost.localdomain
 (lfbn-tou-1-151-230.w86-201.abo.wanadoo.fr [86.201.233.230])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id EC9EEFF811;
 Thu, 14 Jan 2021 15:47:52 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: spinand: Fix MTD_OPS_AUTO_OOB requests
Date: Thu, 14 Jan 2021 16:47:51 +0100
Message-Id: <20210114154751.31968-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210107083813.24283-1-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: e708789c4a87989faff1131ccfdc465a1c1eddbc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210114_104757_659890_7EB69660 
X-CRM114-Status: UNSURE (   8.87  )
X-CRM114-Notice: Please train this message.
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
Cc: Felix Fietkau <nbd@nbd.name>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 2021-01-07 at 08:38:13 UTC, Miquel Raynal wrote:
> The initial change breaking the logic is
> commit 3d1f08b032dc ("mtd: spinand: Use the external ECC engine logic")
> It inadvertently dropped proper OOB support while doing something
> else.
> 
> Shortly later, half of it got re-integrated by
> commit 868cbe2a6dce ("mtd: spinand: Fix OOB read")
> (pointing by the way to a  more early change which had nothing to do
> with the issue). Problem is, this commit failed to revert the faulty
> change entirely and missed the logic handling MTD_OPS_AUTO_OOB
> requests.
> 
> Let's fix this mess by re-inserting the missing part now.
> 
> Fixes: 868cbe2a6dce ("mtd: spinand: Fix OOB read")
> Reported-by: Felix Fietkau <nbd@nbd.name>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
