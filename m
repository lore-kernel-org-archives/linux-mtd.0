Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88748CD6E49
	for <linux-mtd@archiver.kernel.org>; Fri, 29 May 2026 16:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ctSn5fb3r/6A20HifKdd7Gn4dAuGlwPE5OVbauQ0GlI=; b=lH6mqLtOQEInv0
	N1VoPM1OeuXKBiuGicbeL5xYxCbq1aPy8O/X9q/aEfsr9wL09ZmxhQtwS+sxfmmNWC0uwhcR2G5Am
	s0CfVjkQcx9WM9NTZ147rzCN1u2g6uaEBrjSiatc47ScCO519DsNH2PIf8JvgDNPN8z7aotO6UBvH
	B7890nBwLThY1C/pFG7nfqdEH00aUlDpQUcpy1zKqEXF+FoiuDZEmDYA2IXvRjPqWuY0PViBGOHKu
	XrBCF/hjblfqg9atn3/Qr8jW4VWdTtz0zRUni0FdgSyaKDbQIml803a+r4U3wPDwFfh6GawGO5KiJ
	/ORHoKnlO0XXy1uxaqdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT06H-00000007t2C-0K3r;
	Fri, 29 May 2026 16:30:21 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT06D-00000007t0L-3z5l
	for linux-mtd@lists.infradead.org;
	Fri, 29 May 2026 16:30:19 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 0D436C6245E;
	Fri, 29 May 2026 16:30:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4CC5C601FA;
	Fri, 29 May 2026 16:30:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 039FF10888CBC;
	Fri, 29 May 2026 18:30:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780072214; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=A921mLH0JqRfFm/ItjWBfzjKFogCJh8RaPYNqPJ3KdE=;
	b=Q1oBqM7Rhkv91vloUok38+YF8d02P+qKEvQ2hobw5b5GnwD1QpJ3q5rGieDD67WECxSJxJ
	PqjLMHDAaNAgkPkJkUReajlQxgaG0phVN/jwiz+x2p2XndkfSpKQg5vtt9q1Db+htqGDzp
	DVbUH6aHU3BzzURNMPx2MrU1SCIbCpnKKEVuf0kRh2JBMEt35RzjwoyF0sLD3YbNomTI33
	D9VlPIswse515pcVdTDLoWdTclBmIfztiDCOequEe+d2xqhScbkzZR2znotB3hf1NDw8dN
	GhHNkpsDrEbCpN3D9Ng4W5X7ElgccmWFsZtYOE4jfEMNPwB2L4BgS57udK/VdQ==
From: "Miquel Raynal (DAVE)" <miquel.raynal@bootlin.com>
Subject: [PATCH 0/3] mtd: rawnand: pl353: Fixes and software ECC support
Date: Fri, 29 May 2026 18:29:55 +0200
Message-Id: <20260529-dave-upstream-nand-fixes-v1-0-8c72aa23aee2@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3LQQqDMBBG4avIrDsQI0bwKuJiMH/bWTRKxkoh5
 O4NLj8er5AhK4zmrlDGpaZ7augfHW1vSS+wxmbyzgc3es9RLvD3sDNDPpwkRX7qD8ajSIi9C5i
 2gdp+ZNyh3cta6x/s1qhIagAAAA==
X-Change-ID: 20260522-dave-upstream-nand-fixes-5aa6d106e7c3
To: Michal Simek <michal.simek@amd.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Andrea Scian <andrea.scian@dave.eu>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Olivier Sobrie <olivier@sobrie.be>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_093018_151197_0FCAC8D5 
X-CRM114-Status: UNSURE (   5.60  )
X-CRM114-Notice: Please train this message.
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

Following the previous reports from Andrea, here are a couple of fixes,
making sure the software ECC support works flawlessly and is compatible
with U-Boot.

Link: https://lore.kernel.org/linux-mtd/MI2P293MB02644DC5515E56A2539C65739765A@MI2P293MB0264.ITAP293.PROD.OUTLOOK.COM/

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
Miquel Raynal (DAVE) (3):
      mtd: rawnand: pl353: Update timings at the right moment
      mtd: rawnand: pl353: Make sure we use the monolithic helpers for raw accesses
      mtd: rawnand: pl353: Fix debug prints

 drivers/mtd/nand/raw/pl35x-nand-controller.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)
---
base-commit: 4691d2a70b587e94717820d96a5b55f2b10942b9
change-id: 20260522-dave-upstream-nand-fixes-5aa6d106e7c3

Best regards,
-- 
Miquel Raynal <miquel.raynal@bootlin.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
