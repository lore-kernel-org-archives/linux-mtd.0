Return-Path: <SRS0=qFGM=7B=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 763F8C433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 19 May 2020 13:09:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36322206C3
	for <linux-mtd@archiver.kernel.org>; Tue, 19 May 2020 13:09:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TwKkvooB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36322206C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MD3Dl3jNSal4R+AOO9lJDO077lZ5t56lC5wc/M6Px1g=; b=TwKkvooBImShkO
	af949T4AA6OPLWDnDFJsbrlnyWGO8vwj3SC9FV1XMAD7k5pt5C8mB9mQ450/D6KmB/GY1m4baf75e
	an3I/vVVuq+TQMFjIKr72Z9ppwAVJtvnI51k/FhJEU9+SHZV8u4UYQdeOL+YJjduC3jI2mrDeSqYm
	/ZjdP28qyo8zPWKKyuMlsjFxTMkDsoG82SThQMLxmrmqRQT3b4QzojKfqKdoJZGx5NmF4WkON8hGc
	3B5fWgkS1p3YgBQa1MMIXv1DltYNmZD2pviIqgdzZO52QNfr1T3i19Jz/RNHopNLGeqWV149dXZVt
	jdfFxvxTGLpNtZ/4AOsA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jb1zj-0003Ii-Do; Tue, 19 May 2020 13:09:19 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jb1re-0001yo-H5
 for linux-mtd@lists.infradead.org; Tue, 19 May 2020 13:01:03 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id C44CDFF81C;
 Tue, 19 May 2020 13:00:56 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v2 32/62] mtd: rawnand: omap2: Stop using nand_release()
Date: Tue, 19 May 2020 15:00:05 +0200
Message-Id: <20200519130035.1883-33-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200519130035.1883-1-miquel.raynal@bootlin.com>
References: <20200519130035.1883-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200519_060058_834453_AE43CEFE 
X-CRM114-Status: GOOD (  11.21  )
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
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This helper is not very useful and very often people get confused:
they use nand_release() instead of nand_cleanup().

Let's stop using nand_release() by calling mtd_device_unregister() and
nand_cleanup() directly.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/omap2.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/omap2.c b/drivers/mtd/nand/raw/omap2.c
index ad77c112a78a..eb7fcfd9276b 100644
--- a/drivers/mtd/nand/raw/omap2.c
+++ b/drivers/mtd/nand/raw/omap2.c
@@ -2283,14 +2283,18 @@ static int omap_nand_remove(struct platform_device *pdev)
 	struct mtd_info *mtd = platform_get_drvdata(pdev);
 	struct nand_chip *nand_chip = mtd_to_nand(mtd);
 	struct omap_nand_info *info = mtd_to_omap(mtd);
+	int ret;
+
 	if (nand_chip->ecc.priv) {
 		nand_bch_free(nand_chip->ecc.priv);
 		nand_chip->ecc.priv = NULL;
 	}
 	if (info->dma)
 		dma_release_channel(info->dma);
-	nand_release(nand_chip);
-	return 0;
+	ret = mtd_device_unregister(mtd);
+	WARN_ON(ret);
+	nand_cleanup(nand_chip);
+	return ret;
 }
 
 static const struct of_device_id omap_nand_ids[] = {
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
