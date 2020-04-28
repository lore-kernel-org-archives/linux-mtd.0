Return-Path: <SRS0=F3bs=6M=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE1EFC83004
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Apr 2020 09:45:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0888206A1
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Apr 2020 09:45:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iG2e/q+g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0888206A1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=67WtPHtAWeOxE7SWqJSDIOImI0oTkao8UO/fDCH1Aq0=; b=iG2e/q+gYYKdjb
	GP3FAVDzhFSxkbHCxMRzH7fkkXdUUPlR0+Lt6ocr46/AM2OqfCqcQFn2oDBQ0bJKgDBUup6XiDaJY
	v0b2AvnYQw6vfDBPRGXrtRAuep8kozuwUUdxs+PSKMNpXlWFlzSVema7LvqmVOGaOsxqzzP3AHL1R
	0dy71Qf3R8zJgYULsvSt/o3brpttGATPyNa3xkWdSvXKP+OFDxxG9w6mCDcVB7mqS/3XWUlFw35XB
	0LGwT/glXizelcX2MTRCsadgvVkkYvXwJ0v8TB5N/qjwqO9rk24aHFg3iiox8AR1V3oja8qrilSTj
	Zm2vARCDKWPq6vQ/Ipvw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTMnp-0001hU-Kp; Tue, 28 Apr 2020 09:45:21 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTMln-00085A-DD
 for linux-mtd@lists.infradead.org; Tue, 28 Apr 2020 09:43:16 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id EB179C000C;
 Tue, 28 Apr 2020 09:43:12 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH v3 8/9] mtd: rawnand: jedec: Define the number of parameter
 pages
Date: Tue, 28 Apr 2020 11:43:01 +0200
Message-Id: <20200428094302.14624-9-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200428094302.14624-1-miquel.raynal@bootlin.com>
References: <20200428094302.14624-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200428_024315_592910_6F427640 
X-CRM114-Status: GOOD (  12.41  )
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

Use a macro to define the number of parameter page instead of
hardcoding it everywhere.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/mtd/nand/raw/nand_jedec.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_jedec.c b/drivers/mtd/nand/raw/nand_jedec.c
index 9b540e76f84f..0cd322a8be24 100644
--- a/drivers/mtd/nand/raw/nand_jedec.c
+++ b/drivers/mtd/nand/raw/nand_jedec.c
@@ -16,6 +16,8 @@
 
 #include "internals.h"
 
+#define JEDEC_PARAM_PAGES 3
+
 /*
  * Check if the NAND chip is JEDEC compliant, returns 1 if it is, 0 otherwise.
  */
@@ -47,7 +49,7 @@ int nand_jedec_detect(struct nand_chip *chip)
 		goto free_jedec_param_page;
 	}
 
-	for (i = 0; i < 3; i++) {
+	for (i = 0; i < JEDEC_PARAM_PAGES; i++) {
 		ret = nand_read_data_op(chip, p, sizeof(*p), true);
 		if (ret) {
 			ret = 0;
@@ -59,7 +61,7 @@ int nand_jedec_detect(struct nand_chip *chip)
 			break;
 	}
 
-	if (i == 3) {
+	if (i == JEDEC_PARAM_PAGES) {
 		pr_err("Could not find valid JEDEC parameter page; aborting\n");
 		goto free_jedec_param_page;
 	}
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
