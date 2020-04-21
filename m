Return-Path: <SRS0=rRTz=6F=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2B91C54FCC
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Apr 2020 16:50:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C3A82070B
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Apr 2020 16:50:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oCwdyUyl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C3A82070B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i4ZdCK4UrPsn4VN8Ofy5RrmrmH7EPIBQuvw7GG8CEkY=; b=oCwdyUyl071pi2
	fc3ChO7bsV/BEhg/3u9xnc6KdqLnpPLcE0d5eWSYT70onuOU6WD2fiKD7zDA198g+t5dfWt/33LCU
	flhHGVt8I8YoUzvlMVJhDjg1NYwKDLmQYrEDC2yPmkXf5cqjiNNZILJeAESqee8/3oxo9gwbxK/eA
	TYj+5C+SE0RXKW+1W+e/wZYEN8UncqeWnTw3/HM8slrfY3VD79QhRO37iYXw01O3s6x3ZawuqVNT5
	VgmKVfuZa88srURnkSG2k+gLdWj+HryO5XU67cJJMgUku3qjaGUp6HK9clYdTnpza1A8BKY8REJYz
	cbPl7BLdlAkKocyO4Ocw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQw6H-0001ED-O1; Tue, 21 Apr 2020 16:50:21 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQw54-0006Hw-Pc
 for linux-mtd@lists.infradead.org; Tue, 21 Apr 2020 16:49:08 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 7EBF8C0009;
 Tue, 21 Apr 2020 16:49:04 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH 5/6] mtd: rawnand: marvell: Rename a function to clarify
Date: Tue, 21 Apr 2020 18:48:56 +0200
Message-Id: <20200421164857.8255-6-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200421164857.8255-1-miquel.raynal@bootlin.com>
References: <20200421164857.8255-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200421_094906_986911_F8A9322C 
X-CRM114-Status: GOOD (  11.25  )
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

Cosmetic change to clarify the purpose of the function.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/marvell_nand.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
index cb1e1a295002..2db143a97626 100644
--- a/drivers/mtd/nand/raw/marvell_nand.c
+++ b/drivers/mtd/nand/raw/marvell_nand.c
@@ -2166,8 +2166,8 @@ static const struct mtd_ooblayout_ops marvell_nand_ooblayout_ops = {
 	.free = marvell_nand_ooblayout_free,
 };
 
-static int marvell_nand_hw_ecc_ctrl_init(struct mtd_info *mtd,
-					 struct nand_ecc_ctrl *ecc)
+static int marvell_nand_hw_ecc_controller_init(struct mtd_info *mtd,
+					       struct nand_ecc_ctrl *ecc)
 {
 	struct nand_chip *chip = mtd_to_nand(mtd);
 	struct marvell_nfc *nfc = to_marvell_nfc(chip->controller);
@@ -2261,7 +2261,7 @@ static int marvell_nand_ecc_init(struct mtd_info *mtd,
 
 	switch (ecc->mode) {
 	case NAND_ECC_HW:
-		ret = marvell_nand_hw_ecc_ctrl_init(mtd, ecc);
+		ret = marvell_nand_hw_ecc_controller_init(mtd, ecc);
 		if (ret)
 			return ret;
 		break;
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
