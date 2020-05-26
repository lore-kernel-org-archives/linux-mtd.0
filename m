Return-Path: <SRS0=PBLV=7I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61458C433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2020 19:21:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28A8820849
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2020 19:21:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="syUFFLB3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 28A8820849
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6Cj6skh44aPuPtDko63cUjMfgS3fqh0cGCwS8zzKJ/8=; b=syUFFLB36R7sRF
	cnYkDnZ2vuWTsCmzTmQVwWAwy7CXiZ7wGQbyQeL41evvhlF+VvQ8XtOSzlxVDUGw4M1loJNs6f9eM
	+MIFOM8AS1XH97132C/VFGOfKx75+JNOGI8/lWEBgL+n8+U+LuxBnskoCUV0VdQkb/zAeUpTciE2P
	ifLAUJT7XrXmzoQlW1yDfD1+9IJKZhufRw/EW9mHuTRVlL75NaVQz8DFmu63HTcuCipSKwwgEGhFH
	tQ0S1iurVt/iaQudHxjfPXffPKAvKIXUc1ytcMT1MfieN2wRSyMHZ6DWi9yazlzKmbBPDhZS4fHau
	VXvwoUO0KxZt/kktzdWA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdf8e-0006mL-A4; Tue, 26 May 2020 19:21:24 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdf59-0001Rj-VO
 for linux-mtd@lists.infradead.org; Tue, 26 May 2020 19:17:49 +0000
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 59C9124000D;
 Tue, 26 May 2020 19:17:45 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH v5 11/28] mtd: rawnand: Rename nand_init_data_interface()
Date: Tue, 26 May 2020 21:17:08 +0200
Message-Id: <20200526191725.7591-12-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200526191725.7591-1-miquel.raynal@bootlin.com>
References: <20200526191725.7591-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200526_121748_219824_C5AE5759 
X-CRM114-Status: GOOD (  10.17  )
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
Cc: Rickard Andersson <rickaran@axis.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This name is a bit misleading, what we do in this helper is trying to
find the best SDR timings supported by the controller and the chip.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/mtd/nand/raw/nand_base.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index d2313ea49768..9b94552fb177 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -1005,7 +1005,7 @@ static int nand_setup_data_interface(struct nand_chip *chip, int chipnr)
 }
 
 /**
- * nand_init_data_interface - find the best data interface and timings
+ * nand_choose_data_interface - find the best data interface and timings
  * @chip: The NAND chip
  *
  * Find the best data interface and NAND timings supported by the chip
@@ -1018,7 +1018,7 @@ static int nand_setup_data_interface(struct nand_chip *chip, int chipnr)
  *
  * Returns 0 for success or negative error code otherwise.
  */
-static int nand_init_data_interface(struct nand_chip *chip)
+static int nand_choose_data_interface(struct nand_chip *chip)
 {
 	int modes, mode, ret;
 
@@ -6047,8 +6047,8 @@ static int nand_scan_tail(struct nand_chip *chip)
 	if (!mtd->bitflip_threshold)
 		mtd->bitflip_threshold = DIV_ROUND_UP(mtd->ecc_strength * 3, 4);
 
-	/* Initialize the ->data_interface field. */
-	ret = nand_init_data_interface(chip);
+	/* Find the fastest data interface for this chip */
+	ret = nand_choose_data_interface(chip);
 	if (ret)
 		goto err_nanddev_cleanup;
 
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
