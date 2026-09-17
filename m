Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A748EC982D1
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2026 13:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MkBEfiefCXPlp314xnWgkswh8gSuh0mz71SaLTjOEb4=; b=32Rh0lzXpXrJfE
	tVYpnY1gkMR0l8CgTT61+rB5iPmYkWSOwddJBZQxs9UDulsaq2a+bRjK9hPQcPIHfhDbL2Ik7/+Sr
	L2PYGZPbTb6sc4CiqLhh0Dm/7MFVvOYj3vvMkKawqTid5i781HOAmOlif+4nTrsXkVTjNXXN4F87/
	SZrrnmLdDNjojFe4dWnR50G/25AjjXIn7cPjq/uMXrak/aVcUt6Cy7NsfoGG+1KVvmfLVwg8lGp3n
	93Hwypnyt4H+V16fwhSdqCTSFWYIIBqO5bp1TjMwonE6gNjDwIRLGE0apy2h1ew/0mWhfWFbKdf/g
	9gM/1egnQSVM3D/MDadQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7BjT-0000000BM9V-0LAU;
	Thu, 17 Sep 2026 13:00:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7BjQ-0000000BM8s-31Ic
	for linux-mtd@lists.infradead.org;
	Thu, 17 Sep 2026 13:00:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0BB0F60210;
	Thu, 17 Sep 2026 13:00:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AF65DC2BCB9;
	Thu, 17 Sep 2026 13:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789650051;
	bh=pjiTbsQAj7qUJIznMaUAJzvq4MaG8qs5lK7QzKpO7GY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=TO9CWEvrNagKXGm+BEQhNnGng7g+GUzXQr+po8gmVZNwx1zM5S/rJgLkgpzO4j9Ja
	 h06zn5L2DvHIegxoU2psy47+o0P0+oSOaMGwBdJS+FF5cNo2aRPB46ukCWsezAlMgD
	 n3IYPAlf/zmxA7GAgu+FYaPJQEb4KYrSP3vcTNDBJTxVxfoY5ThxzSRVdoIwLL4Rs0
	 Qeuuj30cqGKgjsN81yDdzvBL3UomrwV7yL/sP02Ha+b0JHFlAca/GbW4yeYjfKGg0v
	 24YedS3XF9Es96lYnK8QuBV0XZzA/epmmDuctZhukLewNzpPsiVWo3Ua+al35ogpDl
	 dKGxwN61H8kgw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 852E6C982CF;
	Thu, 17 Sep 2026 13:00:51 +0000 (UTC)
From: Peter-Simon Dieterich via B4 Relay <devnull+peter-simon.dieterich.vaillant-group.com@kernel.org>
Date: Thu, 17 Sep 2026 15:00:42 +0200
Subject: [PATCH 1/2] mtd: rawnand: esmt: Disable broken timings feature on
 GD9FU2G8F3A
MIME-Version: 1.0
Message-Id: <20260917-esmt-gd9fu2g8f3a-v1-1-577c0ab2d31a@vaillant-group.com>
References: <20260917-esmt-gd9fu2g8f3a-v1-0-577c0ab2d31a@vaillant-group.com>
In-Reply-To: <20260917-esmt-gd9fu2g8f3a-v1-0-577c0ab2d31a@vaillant-group.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peter-Simon Dieterich <peter-simon.dieterich@vaillant-group.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789650050; l=3248;
 i=peter-simon.dieterich@vaillant-group.com; s=20260820;
 h=from:subject:message-id;
 bh=esHOFY1eM2KTyPfgmm9H2jVn1K+fvG/bag37LIjCqgQ=;
 b=isj9z3JUtB1UaGvQPVYn7f3/aX5QesV6W6XZ0y+/N17rz7Uu1d9cigE/kqDvOxbXXxJaG/FqG
 PfQImO0hg98AO43A218pq6VEM/GxALWq6mdVWZiRMkyeXhtQ7xUms6Y
X-Developer-Key: i=peter-simon.dieterich@vaillant-group.com; a=ed25519;
 pk=YI8VL1pBCnAIu0GVWI3a6qn/SG0pMQhm9n/RZTI5KZg=
X-Endpoint-Received: by B4 Relay for
 peter-simon.dieterich@vaillant-group.com/20260820 with auth_id=965
X-Original-From: Peter-Simon Dieterich <peter-simon.dieterich@vaillant-group.com>
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
Reply-To: peter-simon.dieterich@vaillant-group.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Peter-Simon Dieterich <peter-simon.dieterich@vaillant-group.com>

GigaDevice and ESMT share JEDEC manufacturer ID 0xc8, so GigaDevice raw
NAND chips are handled by the ESMT manufacturer code.

The GD9FU2G8F3A advertises SET/GET_FEATURES support in its parameter
page, but its implementation of the timing mode feature is broken:
GET_FEATURES(TIMING_MODE) reads back a value that does not match the
mode previously written, which causes the following error during
boot:

  nand: timing mode 5 not acknowledged by the NAND chip

and falls back to timing mode 0.

GigaDevice confirmed that the chip is compatible with all timing modes
advertised in its parameter page, that SET_FEATURE(TIMING_MODE) is not
required to enter them, and that it may be ignored by the chip. The
timing mode is therefore a host-side concern only, and the readback
value carries no information.

Unflag the feature for this model so the core configures the
controller and skips both the SET and GET, mirroring what
nand_macronix.c does for the MX30LF AC series.

Tested on a custom board with an imx6ull using gpmi-nand, this
restores timing mode 5 operation and sequential reads improve from
7 MiB/s to 20 MiB/s.

Signed-off-by: Peter-Simon Dieterich <peter-simon.dieterich@vaillant-group.com>
---
 drivers/mtd/nand/raw/nand_esmt.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_esmt.c b/drivers/mtd/nand/raw/nand_esmt.c
index 4412c407aef3..117b110fc54a 100644
--- a/drivers/mtd/nand/raw/nand_esmt.c
+++ b/drivers/mtd/nand/raw/nand_esmt.c
@@ -3,6 +3,9 @@
  * Copyright (C) 2018 Toradex AG
  *
  * Author: Marcel Ziswiler <marcel.ziswiler@toradex.com>
+ *
+ * ESMT and GigaDevice share the same JEDEC manufacturer ID (0xc8), so this
+ * file handles chips from both vendors.
  */
 
 #include <linux/mtd/rawnand.h>
@@ -38,6 +41,35 @@ static void esmt_nand_decode_id(struct nand_chip *chip)
 	nanddev_set_ecc_requirements(base, &requirements);
 }
 
+/*
+ * GigaDevice GD9FU2G8F3A does not implement the timing mode feature:
+ * GET_FEATURES does not report the mode that was written, and
+ * SET_FEATURES is ignored, even though the parameter page advertises
+ * support. The vendor confirmed the chip works at every advertised
+ * timing mode without being told, so unflag the feature and configure
+ * the host side only.
+ */
+static void esmt_nand_fix_broken_get_timings(struct nand_chip *chip)
+{
+	int i;
+	static const char * const broken_get_timings[] = {
+		"GD9FU2G8F3A",
+	};
+
+	if (!chip->parameters.supports_set_get_features)
+		return;
+
+	i = match_string(broken_get_timings, ARRAY_SIZE(broken_get_timings),
+			 chip->parameters.model);
+	if (i < 0)
+		return;
+
+	bitmap_clear(chip->parameters.get_feature_list,
+		     ONFI_FEATURE_ADDR_TIMING_MODE, 1);
+	bitmap_clear(chip->parameters.set_feature_list,
+		     ONFI_FEATURE_ADDR_TIMING_MODE, 1);
+}
+
 static int esmt_nand_init(struct nand_chip *chip)
 {
 	if (nand_is_slc(chip))
@@ -50,6 +82,8 @@ static int esmt_nand_init(struct nand_chip *chip)
 		chip->options |= NAND_BBM_FIRSTPAGE | NAND_BBM_SECONDPAGE |
 				 NAND_BBM_LASTPAGE;
 
+	esmt_nand_fix_broken_get_timings(chip);
+
 	return 0;
 }
 

-- 
2.55.0



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
