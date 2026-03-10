Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15ABCFD4F2A
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Mar 2026 19:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aK+mc3zFuy1expzZbNvALbhCG0ttJWRu0BKXXbGOSpY=; b=dj9dyBPc3/XFMS
	+6hy1zWjyxBwYeHtWEcFnfDdlW6Mcd+y5ZClCOaK1rV8Rqg1C7CQGi8ExY8VqkvXx3z8xQfn0VB3t
	JF/UZer6I6Wl2IwLIZsS2NvfZXw7Bjm1ywY+NMTTlerYLjKR2+o74IZs6ylaRjVVxmSz1hhwQ8eZ3
	cfhOmizXl1YDJirmzTdFtyXSd12WfI4efpHBEKFEyrnPz+SuYRCkg8fiWmI5RuYGTeUM8uJZcLM7j
	U7dsw2BtebiFspIf8XA8KaeayNATxTSbumF9qziNxpVgpCbqVkcNo6zkkl5zcGue0eS2ThMGX04ue
	r+oe482qlDV3EHI6rwJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w02Qn-0000000A93x-3NK5;
	Tue, 10 Mar 2026 19:07:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w02Qg-0000000A8yM-0EYh;
	Tue, 10 Mar 2026 19:07:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6902F443B2;
	Tue, 10 Mar 2026 19:07:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 413B7C2BCB0;
	Tue, 10 Mar 2026 19:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773169660;
	bh=swVryWkevogj/HEKHBlOlgACQaUp6HCFWqxYjXi6JDs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=jcU1Uy//ddwtFoGfkSqMKM3rSMm0VfAqCsOqSAw5CXoPST5dHvOE5b/KtRcGIIG3Q
	 u25vR6jmZ9CaTXhhFhHmhhlhu/SF7L2r1AAVaQ1/35HgY/84VIXiRd6n7dpL8taaY3
	 iaUTflDT0XXh/8fhOdITOK+sp6UHOEuhMKPWzkVJacrpejC4F3ek9YW9bZRFBlvyQx
	 Jbgm+xoKmotyhwHVxg6YqrLYtLzcQkUDAkP9fImguw8KebJ9BoIXs6Fphq59otv8Ei
	 euAfiNtRpfdTF1bVw0BfMC7DyWhTgEhXLnSAnuyUqbKE5fTm/TN5/JOygnPtS5fsph
	 bbqJOgYEVwaDg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 370B0FD4F23;
	Tue, 10 Mar 2026 19:07:40 +0000 (UTC)
From: Frank Li via B4 Relay <devnull+Frank.Li.nxp.com@kernel.org>
Date: Tue, 10 Mar 2026 15:07:38 -0400
Subject: [PATCH 2/3] mtd: rawnand: mxc: set chip->of_node to nand@0 child
 node if present
MIME-Version: 1.0
Message-Id: <20260310-gpmi_nand-v1-2-6a665151aa75@nxp.com>
References: <20260310-gpmi_nand-v1-0-6a665151aa75@nxp.com>
In-Reply-To: <20260310-gpmi_nand-v1-0-6a665151aa75@nxp.com>
To: Han Xu <han.xu@nxp.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: imx@lists.linux.dev, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Max Krummenacher <max.oss.09@gmail.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773169659; l=1828;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=bOj/g+UY+4s889neQOAMnpSX/wgGz20f6Io/aYMX6LU=;
 b=sh93q7HWhsnaCKLZJ2Qq9mCg1igrjdWIT0UcPJC1loYjHO6n/x55Zvvbg0+k8sraeMaRzgx+c
 K502GrP2CkaCs5pORsfOhPhKkCdy+uzAcki6HaIUqBErDcRCWwAzRZ7
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-Endpoint-Received: by B4 Relay for Frank.Li@nxp.com/20240130 with
 auth_id=121
X-Original-From: Frank Li <Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_120742_139072_FD777EDC 
X-CRM114-Status: GOOD (  13.75  )
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
Reply-To: Frank.Li@nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Frank Li <Frank.Li@nxp.com>

The nand-controller.yaml binding requires a child node (e.g. nand@0) under
the NAND controller. However, the driver currently assigns the controller's
of_node directly to the NAND chip.

Search for the first child node with the "nand" prefix and assign it to
chip->of_node. This filters out properties such as "partition" that may be
placed under the controller node in some older DTS files.

Fall back to using the controller's of_node if no suitable child node is
found to maintain backward compatibility.

This issue went unnoticed because the default behavior works for most NAND
chips.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Build test only because can't find such old boards, logic is the same as
gpmi nand flash controller.
---
 drivers/mtd/nand/raw/mxc_nand.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/mxc_nand.c b/drivers/mtd/nand/raw/mxc_nand.c
index 8c56b685bf91a462a707ff868c601358375aafce..4d8b92e7e67257535142b3a0deb5b179e1a17bad 100644
--- a/drivers/mtd/nand/raw/mxc_nand.c
+++ b/drivers/mtd/nand/raw/mxc_nand.c
@@ -4,6 +4,7 @@
  * Copyright 2008 Sascha Hauer, kernel@pengutronix.de
  */
 
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/slab.h>
 #include <linux/init.h>
@@ -1714,7 +1715,14 @@ static int mxcnd_probe(struct platform_device *pdev)
 	this->legacy.chip_delay = 5;
 
 	nand_set_controller_data(this, host);
-	nand_set_flash_node(this, pdev->dev.of_node);
+
+	struct device_node *np __free(device_node) =
+		of_get_next_child_with_prefix(pdev->dev.of_node, NULL, "nand");
+
+	if (np)
+		nand_set_flash_node(this, np);
+	else
+		nand_set_flash_node(this, pdev->dev.of_node);
 
 	host->clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(host->clk))

-- 
2.43.0



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
