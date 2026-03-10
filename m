Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA972FD4F23
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Mar 2026 19:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Ya41nTRvIjRLOMPARA9XY3e6aT45Y0H4BYFHJMVHyE=; b=e9R07H0V1HS7pz
	y5VhUNBxV3lGReyJ29D6mDhB2AMnjPCKkCL9SMMym26VTFXsb3NMHhtMDojsGOx899pG7oOgu6NnM
	iUmY7pWBibxO0A178DC8ylKWS8UmU3pUO7gl1y5wj2xTGKBinn4mBVeREBjvC4NpJqR0QjnvaNI8D
	wyxmQBb6nU2pTUcUdzga1W+zNdZpVoP/xK54ZIwFgCF7Cr1rzYRHkThItZ0qySgkVXaqZ9iKrEnXU
	i3TE4DbIDkUMhv9EF/WnyosMPkvXfWLMwl92EoLRlG4TN1ci6KR6YcZuSpz4uvdP/735nAsTENGxL
	kov39EAAd40stnfqIZpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w02Ql-0000000A91e-1v8E;
	Tue, 10 Mar 2026 19:07:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w02Qf-0000000A8yP-24Wn;
	Tue, 10 Mar 2026 19:07:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 71D87443C2;
	Tue, 10 Mar 2026 19:07:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5444BC2BC87;
	Tue, 10 Mar 2026 19:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773169660;
	bh=n7rqnTqHcTU+Z9n7OFWpBoqNm3TxgqssESQFtWSZ8q4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=PwU48YKOp3Pg1VKaSlojDgFVscW/acfj1UOugHunURkvBTNeTZGlAQavnfEZ3BxGL
	 ab+af7bJ57R0/f0C8Zo3MsMrueSPjXHwcLlCJVNST8Cf6wyd1Cg9KC5GkegILl4jtp
	 LbW3k2Qdwa20tL3rXO6UAWUClgdSPM1plr6UIALfB3X1du1ztEEg3YX28UWXbXHhrQ
	 Wzj48s1GxYFuF5H7CXibdegRDXKSw4uGa1ds2PmsNQxbIZM0JDcxwVhN5rwWd4Ymv4
	 J5v6XUk/ahWm7dBwEKouWj2gu+rjOZzxD0ZIVz6VcqwmlxsOudPPbkuxzYQjl7IzzI
	 X9s+UamEU3ERw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AADEFD4F2A;
	Tue, 10 Mar 2026 19:07:40 +0000 (UTC)
From: Frank Li via B4 Relay <devnull+Frank.Li.nxp.com@kernel.org>
Date: Tue, 10 Mar 2026 15:07:39 -0400
Subject: [PATCH 3/3] mtd: rawnand: ifc: set chip->of_node to nand@0 child
 node if present
MIME-Version: 1.0
Message-Id: <20260310-gpmi_nand-v1-3-6a665151aa75@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773169659; l=1853;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=FIv1RVBcoqzfpJswOf6h6v3Eh4uNH7jSmUjj7+1dAxc=;
 b=SgBvQQvJLJMzDfPgP5eRXTcA1aGwmtKBs8AGRLQPnTELvBnzgmMNZBvBP0vi5EUThIcaVGZek
 n1VMQPg0srWBQv/1McFma4ch70Qryj0Ns5QOXu+kXWD3c7ZCtFX7TnT
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-Endpoint-Received: by B4 Relay for Frank.Li@nxp.com/20240130 with
 auth_id=121
X-Original-From: Frank Li <Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_120741_573563_728FBB8D 
X-CRM114-Status: GOOD (  13.59  )
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
build test only because can't find hardware to test it. but basic logic is
the same as gpmi.
---
 drivers/mtd/nand/raw/fsl_ifc_nand.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/fsl_ifc_nand.c b/drivers/mtd/nand/raw/fsl_ifc_nand.c
index dd88b22a91bd13f1619c3061866dec22eceb55f5..fad0334f759dd5f81113e10ec04e8bbaf490bc83 100644
--- a/drivers/mtd/nand/raw/fsl_ifc_nand.c
+++ b/drivers/mtd/nand/raw/fsl_ifc_nand.c
@@ -7,6 +7,7 @@
  * Author: Dipen Dudhat <Dipen.Dudhat@freescale.com>
  */
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/types.h>
@@ -863,7 +864,14 @@ static int fsl_ifc_chip_init(struct fsl_ifc_mtd *priv)
 
 	/* Fill in fsl_ifc_mtd structure */
 	mtd->dev.parent = priv->dev;
-	nand_set_flash_node(chip, priv->dev->of_node);
+
+	struct device_node *np __free(device_node) =
+		of_get_next_child_with_prefix(priv->dev->of_node, NULL, "nand");
+
+	if (np)
+		nand_set_flash_node(chip, np);
+	else
+		nand_set_flash_node(chip, priv->dev->of_node);
 
 	/* fill in nand_chip structure */
 	/* set up function call table */

-- 
2.43.0



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
