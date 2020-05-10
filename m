Return-Path: <SRS0=JbbF=6Y=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28011C38A2A
	for <linux-mtd@archiver.kernel.org>; Sun, 10 May 2020 12:27:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB8492082E
	for <linux-mtd@archiver.kernel.org>; Sun, 10 May 2020 12:27:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OxFMtk09"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB8492082E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HwOkt6ezCDf2dJU5V1n5yJkH7pwnSYObefCEK6/QvSs=; b=OxFMtk09m+fHAK
	NDfJnfROQaNCJ6oI+CdcHf8MMEGMPun8AgXd4MSoSNuNu3WODYx6FzenMKPgOncKjrD2KpaZEqjcH
	RBOeDFSt1Jo4OzZIbJEU5bnq+MQ3N/YaBfYBL1TcwggRfT370iZmUY4wOQbS0ddlo1i3CSA+FkAWv
	FX45gdYmdOEAuLhCR1X1UtYSZkvqz1Glnk5WU8JJqvultRnlRImRycbvQ634DOkmEyPyrsmeMz+tr
	pghoPfDbFi3wt3vjwQjBR8dtoln5sGpey82leNK4lTL8QYqxbuA0fhwb7zlXLK4PSoPi36ZLu9mzB
	OnNt6rQmzJsJhSRuypYA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jXl3I-0000HV-TF; Sun, 10 May 2020 12:27:28 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jXkpa-0005g3-08
 for linux-mtd@lists.infradead.org; Sun, 10 May 2020 12:13:20 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 94FFD2001A;
 Sun, 10 May 2020 12:13:15 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH 54/62] mtd: rawnand: sunxi: Stop using nand_release()
Date: Sun, 10 May 2020 14:12:12 +0200
Message-Id: <20200510121220.18042-55-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200510121220.18042-1-miquel.raynal@bootlin.com>
References: <20200510121220.18042-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200510_051318_216069_2B6B8EC0 
X-CRM114-Status: GOOD (  10.25  )
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
 Miquel Raynal <miquel.raynal@bootlin.com>
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
 drivers/mtd/nand/raw/sunxi_nand.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 9f51fd20a52e..ffbc1651fadc 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -2039,13 +2039,18 @@ static int sunxi_nand_chips_init(struct device *dev, struct sunxi_nfc *nfc)
 static void sunxi_nand_chips_cleanup(struct sunxi_nfc *nfc)
 {
 	struct sunxi_nand_chip *sunxi_nand;
+	struct nand_chip *chip;
+	int ret;
 
 	while (!list_empty(&nfc->chips)) {
 		sunxi_nand = list_first_entry(&nfc->chips,
 					      struct sunxi_nand_chip,
 					      node);
-		nand_release(&sunxi_nand->nand);
-		sunxi_nand_ecc_cleanup(&sunxi_nand->nand.ecc);
+		chip = &sunxi_nand->nand;
+		ret = mtd_device_unregister(nand_to_mtd(chip));
+		WARN_ON(ret);
+		nand_cleanup(chip);
+		sunxi_nand_ecc_cleanup(&chip->ecc);
 		list_del(&sunxi_nand->node);
 	}
 }
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
