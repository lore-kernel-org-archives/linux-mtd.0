Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E5B7C001E0
	for <linux-mtd@archiver.kernel.org>; Sat, 21 Oct 2023 15:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GyXLgz+0r10a3RNgkm6gxBDFiHJPsjkijGZG2q3g7Jw=; b=evektlChv9cShD
	cG7lmOUJzZlgv44qTogm9wZ7t16P/dlqENDEwXo6TXWbxVXZi1SDCWj4n/66wDZwdISu5sdufSUPh
	nlHZnsFO5Rm+K4GBjnFyW7bIY1qBnhSK4hy5GqMbvfe0UjiZLEigHB9xPEkz3wH0C0+N2n3feJl+w
	DGTo1U+tjFCf1TYkkZfc31YmRI8QcInGXNp1ZQAnJ5Mui9uwZFospv/YT5lUp66kSsFaqaKmKgKTk
	1mHSqxfz7l+FEvw4XcKi+lwjbGghsLdhdZXHWisIzTIZdAsS+Auxgjgnx7Tfz9KfoI8zkScVVCAGf
	R6fuKzRIy808tdA9wTbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quDV3-0049j3-0F;
	Sat, 21 Oct 2023 15:02:49 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quDUx-0049ho-32
	for linux-mtd@lists.infradead.org;
	Sat, 21 Oct 2023 15:02:46 +0000
Received: from Vostro-3710.lan (unknown [58.61.140.248])
	by mail-m121145.qiye.163.com (Hmail) with ESMTPA id 3D042800015;
	Sat, 21 Oct 2023 23:02:16 +0800 (CST)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH 1/1] mtd: rawnand: add support for TH58NYG3S0HBAI4 NAND flash
Date: Sat, 21 Oct 2023 23:02:12 +0800
Message-Id: <20231021150212.20509-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCGE5LVk8ZGExJHRgZGEIfHlUTARMWGhIXJBQOD1
	lXWRgSC1lBWU5DVU1KVUpPS1VJT0NZV1kWGg8SFR0UWUFZT0tIVUpKS0hKQ1VKS0tVS1kG
X-HM-Tid: 0a8b52c2226db03akuuu3d042800015
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PSo6KSo*IjwxGEM1HzNICzgU
	DiEwCQtVSlVKTUJMQktLTkhNQk9IVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWU5D
	VU1KVUpPS1VJT0NZV1kIAVlBSkJCSDcG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231021_080244_224067_BEF6314B 
X-CRM114-Status: UNSURE (   8.11  )
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

The Toshiba TH58NYG3S0HBAI4 is detected with 128 byte OOB while the flash
has 256 bytes OOB. This adds a static NAND ID entry to correct this.

Tested on Arcadyan AW1000 flashed with OpenWrt.

Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
 drivers/mtd/nand/raw/nand_ids.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_ids.c b/drivers/mtd/nand/raw/nand_ids.c
index 650351c62af6..2b871dfd1d09 100644
--- a/drivers/mtd/nand/raw/nand_ids.c
+++ b/drivers/mtd/nand/raw/nand_ids.c
@@ -58,6 +58,9 @@ struct nand_flash_dev nand_flash_ids[] = {
 		{ .id = {0xad, 0xde, 0x14, 0xa7, 0x42, 0x4a} },
 		  SZ_16K, SZ_8K, SZ_4M, NAND_NEED_SCRAMBLING, 6, 1664,
 		  NAND_ECC_INFO(40, SZ_1K) },
+	{"TH58NYG3S0HBAI4 8G 1.8V 8-bit",
+		{ .id = {0x98, 0xa3, 0x91, 0x26, 0x76} },
+		  SZ_4K, SZ_1K, SZ_256K, 0, 4, 256, NAND_ECC_INFO(8, SZ_512) },
 	{"TH58NVG2S3HBAI4 4G 3.3V 8-bit",
 		{ .id = {0x98, 0xdc, 0x91, 0x15, 0x76} },
 		  SZ_2K, SZ_512, SZ_128K, 0, 5, 128, NAND_ECC_INFO(8, SZ_512) },
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
