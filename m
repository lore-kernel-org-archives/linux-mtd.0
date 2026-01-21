Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E73AD4694F
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Jan 2026 15:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NMSET7SwukSPLpmlnJxqqZCO2OVW+fX4dzP8tMLvaHk=; b=vq3tDI6r8UOhRt
	8d0uqT8eWcYxhKppVK5tn89DeDn390RDheTsX8wCRf30S7vbDrq2df/lIxwgkYyu4X0Z0Zn61ItDA
	AbSbJhBADhdDE7ch55T5/51YR7RQYslUA+H72WDdnRnWfdGpIGMQyBpyxK2zAfQR/Mrwk+7mO9QkD
	IjpLnzZv8R627L0AimhVQK+rNskC40E4mcBEtgkTqECASVNs/F5fuN3IsjNmUWsMD/2njA6B2M+HE
	O3Z8r4o2f5oII64s/eS7943Vy/AFsO0hAXYcFH52AM1t2y/Q8N3s5YrR1oMXMVwiR1iBW3WQAs33R
	z1pvMNifcteHy7uh+eAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viaUO-00000005kAv-2H30;
	Wed, 21 Jan 2026 15:51:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viaUN-00000005kA8-07s7
	for linux-mtd@lists.infradead.org;
	Wed, 21 Jan 2026 15:51:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 158A76012A;
	Wed, 21 Jan 2026 15:51:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C1A81C116D0;
	Wed, 21 Jan 2026 15:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769010681;
	bh=R/vNw5kb01VZ9yh8YhT4drwzWiS3+BnRToSbIvTD/E0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=CNbDYGS01Jo7nL3kOAvFXipOSMOx2HBYtNUfVcRFC2ioj1wFcMQsPGTx7AV/ICN/M
	 jw07hUTIjoPRUFUh7d6Ov102vMmi517hW4zq0F9FKr1Fq9Ehqf+Mq024a709lcaJ/w
	 p2PQ7T0ruO9v3MZN0x0ynDmuuU5oPxa07deIpV7KZnJIuKDFsOXKKOqvqc1zu+JMUk
	 Rqv8SFFwcCTf1AvQbz3T/yK66iIfmSHhNHlUSJe1VoCDlKKXKlgPjSozKoz1ly4Q34
	 40v7W3wEVgrHGiBED/xX5OFUxlr1bid0E67qR/B0NchW8PWfRRQFggc9i5NcLn5YPW
	 59kTwPitRVSWQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7E4FD4694F;
	Wed, 21 Jan 2026 15:51:21 +0000 (UTC)
From: Andrea Scian via B4 Relay <devnull+andrea.scian.dave.eu@kernel.org>
Date: Wed, 21 Jan 2026 16:51:04 +0100
Subject: [PATCH 2/2] mtd: rawnand: pl353: Add message about ECC mode
MIME-Version: 1.0
Message-Id: <20260121-pl353-soft-ecc-support-v1-2-00ad8e160d83@dave.eu>
References: <20260121-pl353-soft-ecc-support-v1-0-00ad8e160d83@dave.eu>
In-Reply-To: <20260121-pl353-soft-ecc-support-v1-0-00ad8e160d83@dave.eu>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Michal Simek <michal.simek@amd.com>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Andrea Scian <andrea.scian@dave.eu>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769010680; l=1276;
 i=andrea.scian@dave.eu; s=20260121; h=from:subject:message-id;
 bh=z/f8ENeXWTXwmxoaenLS81E+i7n9GAGaHSJK6q7dSKQ=;
 b=cg54ZpaogNFDpXRGOnMDOdNx5iTXN4a1vEajXtKcCRkZVsbPdztye8DOZOhngStVT4r5YBoQp
 fJIlNPeM73EBcbynH723hUzgiF0uWGr/geyi1IXbsBP8gPkQke0C8q2
X-Developer-Key: i=andrea.scian@dave.eu; a=ed25519;
 pk=PMQL72nEsyoiJCobnq0uEXwUFpVmkwoWIx317WvaQOU=
X-Endpoint-Received: by B4 Relay for andrea.scian@dave.eu/20260121 with
 auth_id=613
X-Original-From: Andrea Scian <andrea.scian@dave.eu>
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
index fcb62b9ec947b..4ce4c6f59b827 100644
--- a/drivers/mtd/nand/raw/pl35x-nand-controller.c
+++ b/drivers/mtd/nand/raw/pl35x-nand-controller.c
@@ -970,16 +970,19 @@ static int pl35x_nand_attach_chip(struct nand_chip *chip)
 
 	switch (chip->ecc.engine_type) {
 	case NAND_ECC_ENGINE_TYPE_ON_DIE:
+		dev_info(nfc->dev, "Using on-die ECC\n");
 		/* Keep these legacy BBT descriptors for ON_DIE situations */
 		chip->bbt_td = &bbt_main_descr;
 		chip->bbt_md = &bbt_mirror_descr;
 		fallthrough;
 	case NAND_ECC_ENGINE_TYPE_NONE:
 	case NAND_ECC_ENGINE_TYPE_SOFT:
+		dev_info(nfc->dev, "Using software ECC (Hamming 1-bit/512B)\n");
 		chip->ecc.algo = NAND_ECC_ALGO_HAMMING;
 		chip->ecc.write_page_raw = nand_monolithic_write_page_raw;
 		break;
 	case NAND_ECC_ENGINE_TYPE_ON_HOST:
+		dev_info(nfc->dev, "Using hardware ECC\n");
 		ret = pl35x_nand_init_hw_ecc_controller(nfc, chip);
 		if (ret)
 			return ret;

-- 
2.43.0



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
