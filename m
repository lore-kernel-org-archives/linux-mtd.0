Return-Path: <SRS0=RlT6=RH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 057E9C43381
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 20:18:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6E41206B6
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 20:18:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="umhseYTZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6E41206B6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wHu6xCp9PFaTCVKBzrfrm4/7fM9F/JG6+WHn2/yKIIA=; b=umhseYTZtE2jMm
	SUeKWExNvc88SE4jVzbYe2GoA3F904+jTydPpXjsMm5NLHf82/FGFM/O0HB8sOPMcT8wDTiqlDu6p
	B3LgMHClIeiNinFlDTyLOV/+Eq0brAhJd6t7eA8mefPnATg1SZqIZlZsyjSsUU2AqZmQBOAcoih3I
	u/7LcQj7k+Yd/gVxwjkKsx8M9HgfCry0wLzEM22dYDnir4MkroamIWnO/Wc8esSdj1qesaThef0VD
	QYiaKQgMpt4hrnvu3Z6owQdOPttcq9/bjmtVfsjdqzBHv2WtuRHyIWchAlIsBDNqjLXfjaHf6Yy/6
	qhcZoZAGg5AfoFeBuXDg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h0u2S-0001ej-Jd; Mon, 04 Mar 2019 20:18:16 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0u0W-0007Y7-Tk; Mon, 04 Mar 2019 20:16:37 +0000
Received: from localhost.localdomain (26.43.136.77.rev.sfr.net [77.136.43.26])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id F0AC4240004;
 Mon,  4 Mar 2019 20:16:07 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Subject: [PATCH v2 06/15] mtd: rawnand: Prepare things to reuse the generic
 NAND layer
Date: Mon,  4 Mar 2019 21:15:13 +0100
Message-Id: <20190304201522.11323-7-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190304201522.11323-1-miquel.raynal@bootlin.com>
References: <20190304201522.11323-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190304_121617_588329_F0C50105 
X-CRM114-Status: GOOD (  13.52  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh R <vigneshr@ti.com>, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Julien Su <juliensu@mxic.com.tw>,
 Schrempf Frieder <frieder.schrempf@kontron.de>,
 Masahiro Yamada <yamada.masahiro@socionext.com>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Mason Yang <masonccyang@mxic.com.tw>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Boris Brezillon <bbrezillon@kernel.org>

The generic NAND layer provides abstraction of NAND devices no matter
the bus that is used to communicate with the chip. Basing the raw NAND
core on this generic layer should avoid duplication of common
operations, like iterating over all pages/blocks for MTD IO/erase
operations.

In order to re-use this layer, we must first inherit from nand_device
and then initialize the nand_device struct appropriately. This patch
is taking care of the former.

Signed-off-by: Boris Brezillon <bbrezillon@kernel.org>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 include/linux/mtd/rawnand.h | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index c20ea012aab6..dfeedfe2f3e0 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -22,6 +22,7 @@
 #include <linux/mtd/flashchip.h>
 #include <linux/mtd/bbm.h>
 #include <linux/mtd/jedec.h>
+#include <linux/mtd/nand.h>
 #include <linux/mtd/onfi.h>
 #include <linux/of.h>
 #include <linux/types.h>
@@ -861,6 +862,7 @@ struct nand_operation {
 int nand_op_parser_exec_op(struct nand_chip *chip,
 			   const struct nand_op_parser *parser,
 			   const struct nand_operation *op, bool check_only);
+
 /**
  * struct nand_controller_ops - Controller operations
  *
@@ -973,7 +975,7 @@ struct nand_legacy {
 
 /**
  * struct nand_chip - NAND Private Flash Chip Data
- * @mtd:		MTD device registered to the MTD framework
+ * @base:		Inherit from the generic NAND device
  * @legacy:		All legacy fields/hooks. If you develop a new driver,
  *			don't even try to use any of these fields/hooks, and if
  *			you're modifying an existing driver that is using those
@@ -1050,7 +1052,7 @@ struct nand_legacy {
  */
 
 struct nand_chip {
-	struct mtd_info mtd;
+	struct nand_device base;
 
 	struct nand_legacy legacy;
 
@@ -1115,12 +1117,12 @@ extern const struct mtd_ooblayout_ops nand_ooblayout_lp_ops;
 
 static inline struct nand_chip *mtd_to_nand(struct mtd_info *mtd)
 {
-	return container_of(mtd, struct nand_chip, mtd);
+	return container_of(mtd, struct nand_chip, base.mtd);
 }
 
 static inline struct mtd_info *nand_to_mtd(struct nand_chip *chip)
 {
-	return &chip->mtd;
+	return &chip->base.mtd;
 }
 
 static inline void *nand_get_controller_data(struct nand_chip *chip)
-- 
2.19.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
