Return-Path: <SRS0=rRTz=6F=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57788C54FCC
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Apr 2020 16:50:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BF08206A1
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Apr 2020 16:50:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="emAHBIh/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BF08206A1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r2Gw4TF/osYUSgH1M6suSpsbQbqdfcSwnlqBpKTIL4Q=; b=emAHBIh/3g7tVz
	jx+kGPxd59YEB8eg8CBxQTnG6HpsG6NSYJXn01B1XagXNRoueRvuTk90LmOH97hWkrP/bpJ+KVQzN
	cQd+0ZNB0TY0ZapgnIRya9nGNEM71TckbAMe2BU3PdagHmEqbh3MyId1gebESkCtT8J4UUXZrVSwv
	uuOnRP+mzz6KeFFx4jsiEUcKGZJXARQfA1RImBX8UwtW93I9QOBtO8mF6V0Oik/iPunkxAJLraZlL
	dlZfO3OIh+0W2QLDNbg8YYllg1yrfCI7SMmCJshce3XZiKt56XnkwudvCr5QQy7nI6hj0X721uaOI
	Wc2NoyaTewnvlnPNbVUw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQw6R-0001PF-9J; Tue, 21 Apr 2020 16:50:31 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQw52-0006Fk-TU
 for linux-mtd@lists.infradead.org; Tue, 21 Apr 2020 16:49:08 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id AD467C000A;
 Tue, 21 Apr 2020 16:49:02 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH 3/6] mtd: rawnand: marvell: Use nand_cleanup() when the device
 is not yet registered
Date: Tue, 21 Apr 2020 18:48:54 +0200
Message-Id: <20200421164857.8255-4-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200421164857.8255-1-miquel.raynal@bootlin.com>
References: <20200421164857.8255-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200421_094905_297041_29A1DFC5 
X-CRM114-Status: GOOD (  12.94  )
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Do not call nand_release() while the MTD device has not been
registered, use nand_cleanup() instead.

Fixes: 02f26ecf8c77 ("mtd: nand: add reworked Marvell NAND controller driver")
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/marvell_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
index 7906bd3fc8cb..350949b34eee 100644
--- a/drivers/mtd/nand/raw/marvell_nand.c
+++ b/drivers/mtd/nand/raw/marvell_nand.c
@@ -2664,7 +2664,7 @@ static int marvell_nand_chip_init(struct device *dev, struct marvell_nfc *nfc,
 		ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(dev, "failed to register mtd device: %d\n", ret);
-		nand_release(chip);
+		nand_cleanup(chip);
 		return ret;
 	}
 
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
