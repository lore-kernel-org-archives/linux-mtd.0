Return-Path: <SRS0=EQmy=7K=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72430C433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2020 23:21:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D87220721
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2020 23:21:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MoDv+Kn9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D87220721
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vLAFTPhfMa7hGUiDI91w7+Y6k/uD+WJCatG9AUv70NA=; b=MoDv+Kn9Utqw97
	zy6wBCJ85vG1XNRmnDeMQ2TJ7qR8rp3rA8FeEEWpe0fJNk3u2KbrOmxrJ1JqWLiEoe4TE/8sHoms6
	rN8L1XK4z7SQACKk+i9WvPGoZEYYZnlc6n+vX2mFH2asGZb9teS+bRzZhRkvq2N2LquqAKkwZK+Rd
	U5OQqhnNFSZCSOxbpA8QSmu2EsAU6TM4hTGiX5U7QMmF2iQfWXG2yf7LO64XQzVW6zcy/wdUiVSGt
	TOSRqYeSSNXbkFnNoqLr0BHWA7FS+ttUgpIouvk6g5kJGBwRTOr3Ihvxd5d6OCWd+GDkCN73zbsTr
	EM25b7lRmywCAFvbYn9A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeRqI-0004jL-FO; Thu, 28 May 2020 23:21:42 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeRlS-0006MM-A9
 for linux-mtd@lists.infradead.org; Thu, 28 May 2020 23:16:45 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id B662A240004;
 Thu, 28 May 2020 23:16:38 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH v6 20/30] mtd: rawnand: marvell: Use a helper to access the
 timings
Date: Fri, 29 May 2020 01:16:02 +0200
Message-Id: <20200528231612.8958-21-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200528231612.8958-1-miquel.raynal@bootlin.com>
References: <20200528231612.8958-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200528_161642_492319_502B0B49 
X-CRM114-Status: GOOD (  10.45  )
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
Cc: Rickard Andersson <rickaran@axis.com>, Michal Simek <monstr@monstr.eu>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Do not access the SDR timings directly but use nand_get_sdr_timings()
instead. This way, future patching over this helper will be easier.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/mtd/nand/raw/marvell_nand.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
index 37d451f5e898..59609f680cbf 100644
--- a/drivers/mtd/nand/raw/marvell_nand.c
+++ b/drivers/mtd/nand/raw/marvell_nand.c
@@ -1096,6 +1096,7 @@ static int marvell_nfc_hw_ecc_hmg_do_write_page(struct nand_chip *chip,
 						const u8 *oob_buf, bool raw,
 						int page)
 {
+	const struct nand_sdr_timings *sdr = nand_get_sdr_timings(&chip->interface_config);
 	struct marvell_nand_chip *marvell_nand = to_marvell_nand(chip);
 	struct marvell_nfc *nfc = to_marvell_nfc(chip->controller);
 	const struct marvell_hw_ecc_layout *lt = to_marvell_nand(chip)->layout;
@@ -1140,8 +1141,8 @@ static int marvell_nfc_hw_ecc_hmg_do_write_page(struct nand_chip *chip,
 	if (ret)
 		return ret;
 
-	ret = marvell_nfc_wait_op(chip,
-				  PSEC_TO_MSEC(chip->interface_config.timings.sdr.tPROG_max));
+	ret = marvell_nfc_wait_op(chip, PSEC_TO_MSEC(sdr->tPROG_max));
+
 	return ret;
 }
 
@@ -1562,6 +1563,7 @@ static int marvell_nfc_hw_ecc_bch_write_page(struct nand_chip *chip,
 					     const u8 *buf,
 					     int oob_required, int page)
 {
+	const struct nand_sdr_timings *sdr = nand_get_sdr_timings(&chip->interface_config);
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	const struct marvell_hw_ecc_layout *lt = to_marvell_nand(chip)->layout;
 	const u8 *data = buf;
@@ -1598,8 +1600,7 @@ static int marvell_nfc_hw_ecc_bch_write_page(struct nand_chip *chip,
 		marvell_nfc_wait_ndrun(chip);
 	}
 
-	ret = marvell_nfc_wait_op(chip,
-				  PSEC_TO_MSEC(chip->interface_config.timings.sdr.tPROG_max));
+	ret = marvell_nfc_wait_op(chip, PSEC_TO_MSEC(sdr->tPROG_max));
 
 	marvell_nfc_disable_hw_ecc(chip);
 
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
