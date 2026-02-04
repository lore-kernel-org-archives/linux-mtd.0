Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB777E9D40F
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Feb 2026 17:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9r8XouKWYbKwD6mlFG5FrzwF8G594jyrCn5vnFSNEks=; b=17DhYIdgkQRHC/
	oIF7QBe/f65w2DWKFCz4Dt1x/lSPKY7dhNA0AxNNzFrBk+ufDzCO9FfxKnpXil90+iWRLBKgFnLpe
	Y+qCCjcHuVkfkFCWS+rhqvwvrI5VZ1oBNuReVLgpzP/Usr57357/g+nmLQ2jgE4s1TDX14c9WU4S4
	5m9A4l96t7FVAv3Mp94gw5Fki3+JVKxftLiUn+VeHMiYUTPgx7vqpRPfSA7YcVOQXuROTix5GP/oC
	AXWFw7mGIqc1qIa0T3V7mlW6Z2dSsVT+vPbwW3lLPJX8Iqu4f0Og+Hsk+UFG8Lz6txiI0BKdztbtD
	jsJXe3VF8fZKbM7sjy6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vngtA-00000008roV-14Wy;
	Wed, 04 Feb 2026 17:42:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vngt7-00000008rni-2flS
	for linux-mtd@lists.infradead.org;
	Wed, 04 Feb 2026 17:42:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D6BE444142;
	Wed,  4 Feb 2026 17:42:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AF0DBC116C6;
	Wed,  4 Feb 2026 17:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770226920;
	bh=nHKWb0pnwlZFnThr4s5+AJC2oYIZkNw8A0Hk+0GiZII=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=VL11Nti/nbiiosESFWD9DrUlKDrthp12O26QYs4VQ6gFFuPr/zov18FwfNVeU0rxV
	 puPvqnGML5i++ie5Li+S1pjvcdsPDnJJSNjmtl21CfAJuE0LIsmK7NSeD0+yAyhnle
	 aUkIvOEh2NwmTUU97RISE2H51SezVq2nxno0InQF2HO6WgF5wawOoRLyselx6g3xF0
	 8dCFL+Wm+cd6ajqSf5i7EaauaQLrtKEFVdgK5f/hgIZau1fT2acsuJ1qje3/ek+dJu
	 Dw+4Zmo26McowFyj/sks8gvUBmw7Y4LkpUaO7+19PwOEfgSQ4gq+S3hyEvzw6fcpdX
	 wF7tIE+lijmfg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ECCEE83F05;
	Wed,  4 Feb 2026 17:42:00 +0000 (UTC)
From: Andrea Scian via B4 Relay <devnull+andrea.scian.dave.eu@kernel.org>
Date: Wed, 04 Feb 2026 18:41:45 +0100
Subject: [PATCH v3 2/2] mtd: rawnand: pl353: Add message about ECC mode
MIME-Version: 1.0
Message-Id: <20260204-pl353-soft-ecc-support-v3-2-fd8ee7595cc1@dave.eu>
References: <20260204-pl353-soft-ecc-support-v3-0-fd8ee7595cc1@dave.eu>
In-Reply-To: <20260204-pl353-soft-ecc-support-v3-0-fd8ee7595cc1@dave.eu>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Michal Simek <michal.simek@amd.com>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Andrea Scian <andrea.scian@dave.eu>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770226919; l=1229;
 i=andrea.scian@dave.eu; s=20260121; h=from:subject:message-id;
 bh=mFOVwp9FgeabNIemoScL8JgY/55GfGdOi+dmhdTS6v8=;
 b=ALtkDl7uC/+psoQZRq0MRd0+db0BPslbHhrRHdceughAs8Re8enbDMqxdnewH+RrYfa40zd3w
 KxNiSz9loJoDJ9mlRdzCSV5f+Vf/CvofgVLH0Sfe2RePFAlortGBkrU
X-Developer-Key: i=andrea.scian@dave.eu; a=ed25519;
 pk=PMQL72nEsyoiJCobnq0uEXwUFpVmkwoWIx317WvaQOU=
X-Endpoint-Received: by B4 Relay for andrea.scian@dave.eu/20260121 with
 auth_id=613
X-Original-From: Andrea Scian <andrea.scian@dave.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_094201_702409_3A156CEA 
X-CRM114-Status: UNSURE (   9.68  )
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

From: Andrea Scian <andrea.scian@dave.eu>

This just add some information on kernel log about the selected ECC

Signed-off-by: Andrea Scian <andrea.scian@dave.eu>
---
 drivers/mtd/nand/raw/pl35x-nand-controller.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/nand/raw/pl35x-nand-controller.c b/drivers/mtd/nand/raw/pl35x-nand-controller.c
index 7f012b7c3eaec..947fd86ac5fa2 100644
--- a/drivers/mtd/nand/raw/pl35x-nand-controller.c
+++ b/drivers/mtd/nand/raw/pl35x-nand-controller.c
@@ -970,15 +970,18 @@ static int pl35x_nand_attach_chip(struct nand_chip *chip)
 
 	switch (chip->ecc.engine_type) {
 	case NAND_ECC_ENGINE_TYPE_ON_DIE:
+		dev_dbg(nfc->dev, "Using on-die ECC\n");
 		/* Keep these legacy BBT descriptors for ON_DIE situations */
 		chip->bbt_td = &bbt_main_descr;
 		chip->bbt_md = &bbt_mirror_descr;
 		fallthrough;
 	case NAND_ECC_ENGINE_TYPE_NONE:
 	case NAND_ECC_ENGINE_TYPE_SOFT:
+		dev_dbg(nfc->dev, "Using software ECC (Hamming 1-bit/512B)\n");
 		chip->ecc.write_page_raw = nand_monolithic_write_page_raw;
 		break;
 	case NAND_ECC_ENGINE_TYPE_ON_HOST:
+		dev_dbg(nfc->dev, "Using hardware ECC\n");
 		ret = pl35x_nand_init_hw_ecc_controller(nfc, chip);
 		if (ret)
 			return ret;

-- 
2.43.0



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
