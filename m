Return-Path: <SRS0=p2FF=DG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F3AFC4727C
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 23:03:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1FFE20897
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 23:03:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ia9a7ppv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1FFE20897
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DcB44U41hPDPHok65Jb6/cwsor4D7qAz6Gx4carAqvs=; b=Ia9a7ppvw52P5ZucXxM8A0uju
	yu/Ia1O5fDq25CdQeMPSYPGeu4zn2osk+Rw9jqGnLRJBGgiyjxgTYphH57ztWZUtzhcdEJd7pquFC
	vOM723iOdyiyq9Qru2juGr/IzrQId/Mcp7d5ysQr8seQlBB57wE88Q/I6fe5VrPEAL2Sq1P3f59Nf
	aNRjwhq0roW5joBocIP7U/CImRa3mLBqYAV3vscZKs7xui+IoQfUcKi/tZ4tTSeVsSIDxHgMp0349
	tGj3WYFpzuUzm0z4HAnioMVYMgObxo4YNfC18Zxd1p1VIdNR+R5BdtHyqpuw5bDpxZkMiqaWnJGI1
	o5yWgvGAg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNOdD-0001Jy-P6; Tue, 29 Sep 2020 23:01:59 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNOcp-0001C6-TK
 for linux-mtd@lists.infradead.org; Tue, 29 Sep 2020 23:01:37 +0000
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 3222620000C;
 Tue, 29 Sep 2020 23:01:34 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH 06/20] mtd: nand: ecc-bch: Drop mtd_nand_has_bch()
Date: Wed, 30 Sep 2020 01:01:10 +0200
Message-Id: <20200929230124.31491-7-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200929230124.31491-1-miquel.raynal@bootlin.com>
References: <20200929230124.31491-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_190136_106491_D1320EDE 
X-CRM114-Status: GOOD (  13.35  )
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
Cc: Julien Su <juliensu@mxic.com.tw>, ycllin@mxic.com.tw,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Like for any other compilation option, use the IS_ENABLED() macro
instead of hardcoding it.

By droping this helper we can get rid of the BCH header in nandsim.c.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/nand_base.c    | 2 +-
 drivers/mtd/nand/raw/nandsim.c      | 3 +--
 include/linux/mtd/nand-ecc-sw-bch.h | 4 ----
 3 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index c47441ddc5cf..a6b6ab26a22a 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -5236,7 +5236,7 @@ static int nand_set_ecc_soft_ops(struct nand_chip *chip)
 
 		return 0;
 	case NAND_ECC_ALGO_BCH:
-		if (!mtd_nand_has_bch()) {
+		if (!IS_ENABLED(CONFIG_MTD_NAND_ECC_SW_BCH)) {
 			WARN(1, "CONFIG_MTD_NAND_ECC_SW_BCH not enabled\n");
 			return -EINVAL;
 		}
diff --git a/drivers/mtd/nand/raw/nandsim.c b/drivers/mtd/nand/raw/nandsim.c
index 9c940ead66fd..f2b9250c0ea8 100644
--- a/drivers/mtd/nand/raw/nandsim.c
+++ b/drivers/mtd/nand/raw/nandsim.c
@@ -23,7 +23,6 @@
 #include <linux/string.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
-#include <linux/mtd/nand-ecc-sw-bch.h>
 #include <linux/mtd/partitions.h>
 #include <linux/delay.h>
 #include <linux/list.h>
@@ -2214,7 +2213,7 @@ static int ns_attach_chip(struct nand_chip *chip)
 	if (!bch)
 		return 0;
 
-	if (!mtd_nand_has_bch()) {
+	if (!IS_ENABLED(CONFIG_MTD_NAND_ECC_SW_BCH)) {
 		NS_ERR("BCH ECC support is disabled\n");
 		return -EINVAL;
 	}
diff --git a/include/linux/mtd/nand-ecc-sw-bch.h b/include/linux/mtd/nand-ecc-sw-bch.h
index d92d2abcfcef..7b62996d9e01 100644
--- a/include/linux/mtd/nand-ecc-sw-bch.h
+++ b/include/linux/mtd/nand-ecc-sw-bch.h
@@ -13,8 +13,6 @@ struct nand_chip;
 
 #if IS_ENABLED(CONFIG_MTD_NAND_ECC_SW_BCH)
 
-static inline int mtd_nand_has_bch(void) { return 1; }
-
 /*
  * Calculate BCH ecc code
  */
@@ -37,8 +35,6 @@ void nand_bch_free(struct nand_chip *chip);
 
 #else /* !CONFIG_MTD_NAND_ECC_SW_BCH */
 
-static inline int mtd_nand_has_bch(void) { return 0; }
-
 static inline int
 nand_bch_calculate_ecc(struct nand_chip *chip, const u_char *dat,
 		       u_char *ecc_code)
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
