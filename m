Return-Path: <SRS0=TNsO=N4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD85CC433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Sep 2021 13:30:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7680C60E76
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Sep 2021 13:30:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7680C60E76
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=crbaaGEbvAb1gIyXj5DKfhmCYBGkdArHKpIypTAnEZo=; b=EZVoc4tyH34Gy7
	9ORl9ffuh53DbBA9QV4Kcj7NKmhHB8JZA+bQfJBJ8ronpKHsvf3cvA7Y2P2G4UIuIrCxDSjL86C+F
	CjEIVW9P964FamvqEZ/INTRUkh4H6FHGasg6ccKXIoPXGikTgMXLK7JDos5q3jI1FGQg09vBCAVkR
	7q5olyUCWfQ1LLLqsh4cfCKYZ7w9LP9YAu1vNblmrzYOydujnYPvb7j7ZjFzLggLuzTOEDWK3u5Rj
	lxDTfKdk7ugAEdzI+3zMDi/YQrJtHC8/YNgEB4ICahshfEqPL50RvhOvtGObH6Q/AAgzHJIeMVRZQ
	5PKoasU/TS72eTmuEfBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNEhX-000unL-Kv; Mon, 06 Sep 2021 13:30:19 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNEh5-000ukY-KQ
 for linux-mtd@lists.infradead.org; Mon, 06 Sep 2021 13:29:54 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 72B43240012;
 Mon,  6 Sep 2021 13:29:45 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Michal Simek <monstr@monstr.eu>,
 Amit Kumar Mahapatra <akumarma@xilinx.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 2/3] mtd: rawnand: Check the CHANGE_READ_COLUMN from
 nand_read_subpage() is supported
Date: Mon,  6 Sep 2021 15:29:41 +0200
Message-Id: <20210906132942.36972-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210906132942.36972-1-miquel.raynal@bootlin.com>
References: <20210906132942.36972-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210906_062951_851149_AF58CAFF 
X-CRM114-Status: UNSURE (   9.65  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

There are constraint controllers which do not support
CHANGE_READ_COLUMNs at any offset. In particular, the offset alignment
might be an issue. Ensure that the operation is supported before trying
it.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/nand_base.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 7f29f27bb6fd..8175635b9802 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -3065,10 +3065,19 @@ static int nand_read_subpage(struct nand_chip *chip, uint32_t data_offs,
 		    (busw - 1))
 			aligned_len++;
 
-		ret = nand_change_read_column_op(chip,
-						 mtd->writesize + aligned_pos,
-						 &chip->oob_poi[aligned_pos],
-						 aligned_len, false);
+		ret = nand_check_change_read_column_op(chip,
+						       mtd->writesize + aligned_pos,
+						       &chip->oob_poi[aligned_pos],
+						       aligned_len, false, true);
+		if (!ret)
+			ret = nand_change_read_column_op(chip,
+							 mtd->writesize + aligned_pos,
+							 &chip->oob_poi[aligned_pos],
+							 aligned_len, false);
+		else
+			ret = nand_change_read_column_op(chip, mtd->writesize,
+							 chip->oob_poi,
+							 mtd->oobsize, false);
 		if (ret)
 			return ret;
 	}
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
