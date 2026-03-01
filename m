Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0B9AFD0049
	for <linux-mtd@archiver.kernel.org>; Sun,  1 Mar 2026 01:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GRfbpm0oOE0gGni8aGBHxfowD41jjtLbyfIOLeLNk9s=; b=P18cQeNBHsXO6y
	uxz3U7YbT3iM+6WGlKWVjrd/zQmN04txboZQLOTW5dwFhvCkZsql4V3BjmRtMkgH3Ode5GlMOjv4i
	tLJdX5M6iPZnTXbCS9kvbddmBGSc7jgocihXjfwOu5OVEMCas1qn+SGnO+nB1PYVA9/HAD7TKMEXa
	u2cyTfg2GwEv9CR3jeemDlPOR8k87FO/Famg7KO9FFbWeg68zCgR3Xml1Pi29bOjDSmiM+t1JlpXe
	4KoZ+QF70MXDCsVOu0et6FVwga141cnjBrkU+roTAPHPAoihI5QCJMaxw+djb1rgu+An+ocacTy3X
	4JgQhWziqn/4qJ4Et7nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVZL-0000000AWZa-3WRa;
	Sun, 01 Mar 2026 01:26:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVZJ-0000000AWYB-31fs
	for linux-mtd@lists.infradead.org;
	Sun, 01 Mar 2026 01:26:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 50030437F7;
	Sun,  1 Mar 2026 01:26:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98E1EC19421;
	Sun,  1 Mar 2026 01:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772328361;
	bh=HmeO96EzGOW33qi49IOXOtz5wmcVF770WRnYU5a+q0c=;
	h=From:To:Cc:Subject:Date:From;
	b=hvfrrMuSrvBU8nSVTluTF1IHUQwrN3IaqdBA9i6vPKt9MwsJ0IpD4M5oJasULkeqm
	 /UGBHBFJp5L/mbhUERf7FnIiCA1ikWdSVbfBChwJ8c8Wqg4UbAbj29PgyDxkqIH+fe
	 kS52twZjR7r6lj4A/z2+Rnt+q8GszKukauAndMXxxLIc0sgGBYOLAPb28eG8qgt1zn
	 plqTTPHeBDFPlXW6W7uJmcbf0vapdKfrB5pb+US+blv2kwPUhiI3JeXcTu67SgUqnc
	 KQpnCSP9DBKHNPRBPPgVIdk5Lg1kAA2qKheQENvHXpLkKjxaSeyQIzI262p+3aSMjp
	 cyr+6MgTtSFSw==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	andrea.scian@dave.eu
Cc: stable@kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-mtd@lists.infradead.org
Subject: FAILED: Patch "mtd: rawnand: pl353: Fix software ECC support" failed to apply to 6.12-stable tree
Date: Sat, 28 Feb 2026 20:25:59 -0500
Message-ID: <20260301012559.1683274-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_172601_800048_7185EB67 
X-CRM114-Status: GOOD (  10.59  )
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

The patch below does not apply to the 6.12-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 89b831ebdaca0df4ca3b226f7e7a1d1db1629060 Mon Sep 17 00:00:00 2001
From: Andrea Scian <andrea.scian@dave.eu>
Date: Wed, 4 Feb 2026 18:41:44 +0100
Subject: [PATCH] mtd: rawnand: pl353: Fix software ECC support

We need to set also write_page_raw in ecc structure to allow
choosing SW ECC instead of HW one, otherwise write operation fail.

Fixes: 08d8c62164a322 ("mtd: rawnand: pl353: Add support for the ARM PL353 SMC NAND controller")
Signed-off-by: Andrea Scian <andrea.scian@dave.eu>
Cc: stable@kernel.org
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/pl35x-nand-controller.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/raw/pl35x-nand-controller.c b/drivers/mtd/nand/raw/pl35x-nand-controller.c
index 11bd90e3f18cb..7f012b7c3eaec 100644
--- a/drivers/mtd/nand/raw/pl35x-nand-controller.c
+++ b/drivers/mtd/nand/raw/pl35x-nand-controller.c
@@ -976,6 +976,7 @@ static int pl35x_nand_attach_chip(struct nand_chip *chip)
 		fallthrough;
 	case NAND_ECC_ENGINE_TYPE_NONE:
 	case NAND_ECC_ENGINE_TYPE_SOFT:
+		chip->ecc.write_page_raw = nand_monolithic_write_page_raw;
 		break;
 	case NAND_ECC_ENGINE_TYPE_ON_HOST:
 		ret = pl35x_nand_init_hw_ecc_controller(nfc, chip);
-- 
2.51.0





______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
