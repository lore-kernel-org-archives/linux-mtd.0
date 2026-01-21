Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F8A9D46950
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Jan 2026 15:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Fck3cwjJWjI6H1t7NF68McscnKAydBIBuGwlt2qECuM=; b=j6BwOpcOzEIDpX
	+HnxFoEOrR7CLG4fF+c7vCJHAlQWAUFGkZuBTJciqSxBLFrzPA9kNTmG16IWZsNyPHYn4NjVvRO5v
	EKQWlGr9zASGIbhmLrg3V3LcHeAI3Hc258b0ctu8ND+1797niNYSyhkBNQ+kXeMVrywh/KDUxKC8w
	5CubtGMM9wioB4XaGJrhAbnHiK3STED4KGIyr54ODy2IzvP2GseneSVTgozU5esUpq23lJBAVZXlC
	ME008Nrs3puYrgmwTDYhKRHeecQofAnCtN0PAB5I+hB7UMJ+45AjETsPguUK7dduS0dQ5Nh86Di4f
	C+aiqDPVb1zKPH9GMQbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viaUQ-00000005kBC-0QyO;
	Wed, 21 Jan 2026 15:51:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viaUN-00000005kA6-0s51
	for linux-mtd@lists.infradead.org;
	Wed, 21 Jan 2026 15:51:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C843940332;
	Wed, 21 Jan 2026 15:51:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A6C74C4CEF1;
	Wed, 21 Jan 2026 15:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769010681;
	bh=khWQPZnCxP+KVyhqb4DgCCB+QpPliQS5oDegCApIqSw=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=jlnJmu/1ctZnIcdarDlVIFXpJcaJeeVKjS9jTvD2dLNSIxSP3W5I5XPmBOxnGZidA
	 ET3CE18TAEwMxorBMflH4ktp4IqDPutY+CA5CefHXOjty/mbnISKapPeJ8yGlSQUHE
	 SYhWDS6dRT7t+Gpp9DD9VYnJHTrGZE+qdNLajLJTgfgPhqy1x9n2ug3FtWGNcpewMu
	 UIRGJMX3RMxP4rfX+yAoofeQ0KjUkNHMmlJqUeaBGJuVCXlFWZgp6kJUZvLc1wqAQu
	 jk/bScpyHLatKOgMW9htZYkTlNc7H+7L+2L1T+Wrja4dpx3gpN6grabP/kyvO0XB80
	 7EpXxVWLLwCxA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97C6FC44536;
	Wed, 21 Jan 2026 15:51:21 +0000 (UTC)
From: Andrea Scian via B4 Relay <devnull+andrea.scian.dave.eu@kernel.org>
Subject: [PATCH 0/2] PL353 SW ECC fixes
Date: Wed, 21 Jan 2026 16:51:02 +0100
Message-Id: <20260121-pl353-soft-ecc-support-v1-0-00ad8e160d83@dave.eu>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAOb1cGkC/x3MQQqAIBBA0avErBtIraSuEi3EphqIFKciiO6et
 HyL/x8QSkwCffFAoouFw56hygL86vaFkKds0JVuK6UVxs00BiXMB5L3KGeMIR1ou5oU2cZY4yD
 HMdHM9z8exvf9AEreUH9oAAAA
X-Change-ID: 20260121-pl353-soft-ecc-support-794e1e75373a
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Michal Simek <michal.simek@amd.com>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Andrea Scian <andrea.scian@dave.eu>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769010680; l=972;
 i=andrea.scian@dave.eu; s=20260121; h=from:subject:message-id;
 bh=khWQPZnCxP+KVyhqb4DgCCB+QpPliQS5oDegCApIqSw=;
 b=dFhodP5oDA5NEuu5IVJKHO+GrKJfxfiL0zGvD5Bq9nDEjgJspuZpu/hM1pFM/lVcvXbU7IeMk
 yCuO/Rl8kMYBKQpLywWArg178bwnqLjvIgffiyJ12VDNlpu+DFOoGTy
X-Developer-Key: i=andrea.scian@dave.eu; a=ed25519;
 pk=PMQL72nEsyoiJCobnq0uEXwUFpVmkwoWIx317WvaQOU=
X-Endpoint-Received: by B4 Relay for andrea.scian@dave.eu/20260121 with
 auth_id=613
X-Original-From: Andrea Scian <andrea.scian@dave.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_075123_276511_D7915CD1 
X-CRM114-Status: UNSURE (   7.81  )
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
Reply-To: andrea.scian@dave.eu
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

PL353 has some known errata with its ECC implementation and it may be
useful to switch to software ECC, to avoid issue with this.

On-die ECC is already supported (while I didn't test it) but when
enabling SW ECC we get operation-not-supported error during page write
(page read already work correctly)

IMHO it's enough to have 1-bit Hamming ECC correction, because this is
the only one supported on PL353, but this might be a wrong assumption.

This has been tested with nandflipbits and mtd_nandbiterrs

Signed-off-by: Andrea Scian <andrea.scian@dave.eu>
---
Andrea Scian (2):
      mtd: rawnand: pl353: Fix software ECC support
      mtd: rawnand: pl353: Add message about ECC mode

 drivers/mtd/nand/raw/pl35x-nand-controller.c | 5 +++++
 1 file changed, 5 insertions(+)
---
base-commit: 24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
change-id: 20260121-pl353-soft-ecc-support-794e1e75373a

Best regards,
-- 
Andrea Scian <andrea.scian@dave.eu>



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
