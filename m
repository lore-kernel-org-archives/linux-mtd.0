Return-Path: <SRS0=qFGM=7B=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D6D0C433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 19 May 2020 13:04:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABE5720709
	for <linux-mtd@archiver.kernel.org>; Tue, 19 May 2020 13:04:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jXIYLDpN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ABE5720709
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TuRRuXfo4uWudCNIaSyHOXBZm6DYI1fAKABbn/AEtpE=; b=jXIYLDpNvtVObw
	4Na29mRR0aofdf7w37JINQ7CnTMb3yNzI5wvtXasejFF6zmHN0kjqK6j7coUljUY2AiDyCoUcIJaB
	E1OP/uOS2omsuSGrY82g5VLKK4qMV9DvHLPz60ro6AxyezISYiv0x3SXzXJEGrdN2NH+eYbRw9KHO
	RkCAJwHLP71yZDUfk+wUtXD3OCqFzbeP4vpPGCA2KCNfxVgFwD0nbFY3R7hCMKSNSS9WYSCyPs/Ns
	1j+tpwWgSUHfSGsMgoS6PM/LLZzjnYQEUsqnRuV4gjSX7s084+y5gzY60hYA6ht2m/cFPUjyt14yb
	zGCWFDt79IU3fxvgpo0A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jb1ul-0004fd-OC; Tue, 19 May 2020 13:04:11 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jb1rW-0001p2-41
 for linux-mtd@lists.infradead.org; Tue, 19 May 2020 13:00:51 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 79D9AFF803;
 Tue, 19 May 2020 13:00:48 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v2 15/62] mtd: rawnand: fsl_ifc: Stop using nand_release()
Date: Tue, 19 May 2020 14:59:48 +0200
Message-Id: <20200519130035.1883-16-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200519130035.1883-1-miquel.raynal@bootlin.com>
References: <20200519130035.1883-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200519_060050_309299_7AEBDBE9 
X-CRM114-Status: UNSURE (   9.53  )
X-CRM114-Notice: Please train this message.
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
 drivers/mtd/nand/raw/fsl_ifc_nand.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/fsl_ifc_nand.c b/drivers/mtd/nand/raw/fsl_ifc_nand.c
index 2af09edf405b..00ae7a910b03 100644
--- a/drivers/mtd/nand/raw/fsl_ifc_nand.c
+++ b/drivers/mtd/nand/raw/fsl_ifc_nand.c
@@ -1093,8 +1093,13 @@ static int fsl_ifc_nand_probe(struct platform_device *dev)
 static int fsl_ifc_nand_remove(struct platform_device *dev)
 {
 	struct fsl_ifc_mtd *priv = dev_get_drvdata(&dev->dev);
+	struct nand_chip *chip = &priv->chip;
+	int ret;
+
+	ret = mtd_device_unregister(nand_to_mtd(chip));
+	WARN_ON(ret);
+	nand_cleanup(chip);
 
-	nand_release(&priv->chip);
 	fsl_ifc_chip_remove(priv);
 
 	mutex_lock(&fsl_ifc_nand_mutex);
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
