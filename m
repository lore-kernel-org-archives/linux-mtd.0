Return-Path: <SRS0=ukLJ=SM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A37F3C10F11
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Apr 2019 15:39:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F38B2082E
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Apr 2019 15:39:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="juoH/bdl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F38B2082E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yTQe+rvhkg4hOSLDWIiqkCEeImqsiHfmrWY+iXJwv8Y=; b=juoH/bdl3k3gNK
	6iFWYH6t+wOkjpg9+tm4SWo+5X6HPsrTt2W+gm3Ykp/A0bGgwXCP7Nxj/ZbK6O9ssnjA4PxJPMgBS
	1UHgpd/NPgSgpc7eTwT32vkFMhM/+qLLVgZkZ1RRjq/z1lKoVwxzEiCJYva3NrT1QjJyzEtknyv8+
	LeW2uOQTwAf7klizKKv/6arLk416kxEbusI9og1MYGuHTCfGPzu2t6Grzp+MS6afm9TriXknryu6U
	BnazcVWK613vlfWPB0IILyyNZmr29E+9Oxmc7Bz2EhjeE3pbONi8gRQ+MekDz6gapxUsaReWCsOcJ
	SRovCnIATfWFE5Zgs+ww==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEFJZ-0001Yh-2z; Wed, 10 Apr 2019 15:39:05 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEFJW-0001W7-Kk
 for linux-mtd@lists.infradead.org; Wed, 10 Apr 2019 15:39:04 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 8B5AE1E1F9D71F31DD01;
 Wed, 10 Apr 2019 23:38:55 +0800 (CST)
Received: from localhost (10.177.31.96) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.408.0; Wed, 10 Apr 2019
 23:38:49 +0800
From: Yue Haibing <yuehaibing@huawei.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <computersforpeace@gmail.com>, <marek.vasut@gmail.com>,
 <paul.burton@mips.com>, <bbrezillon@kernel.org>
Subject: [PATCH v2] mtd: nand: Fix build error while
 CONFIG_MTD_NAND_ECC_SW_BCH is set to module
Date: Wed, 10 Apr 2019 23:37:07 +0800
Message-ID: <20190410153707.29492-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.177.31.96]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190410_083903_294481_FDAA5D0F 
X-CRM114-Status: GOOD (  10.17  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: YueHaibing <yuehaibing@huawei.com>

Fix gcc build error while CONFIG_MTD_NAND_ECC_SW_BCH
is set to module:

drivers/mtd/nand/raw/nand_base.o: In function `nand_cleanup':
(.text+0xef6): undefined reference to `nand_bch_free'
drivers/mtd/nand/raw/nand_base.o: In function `nand_scan_tail':
nand_base.c:(.text+0xa101): undefined reference to `nand_bch_calculate_ecc'
nand_base.c:(.text+0xa120): undefined reference to `nand_bch_correct_data'
nand_base.c:(.text+0xa269): undefined reference to `nand_bch_init'

CONFIG_MTD_NAND_ECC_SW_BCH should not be set to M,
while MTD_RAW_NAND is set to y.

Reported-by: Hulk Robot <hulkci@huawei.com>
Fixes: 193bd4002644 ("mtd: nand: add software BCH ECC support")
Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
v2: use imply as suggestion
---
 drivers/mtd/devices/Kconfig  |  2 +-
 drivers/mtd/nand/raw/Kconfig | 21 +++++++++++----------
 2 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/devices/Kconfig b/drivers/mtd/devices/Kconfig
index 7fcdaf6..f9258d6 100644
--- a/drivers/mtd/devices/Kconfig
+++ b/drivers/mtd/devices/Kconfig
@@ -207,7 +207,7 @@ comment "Disk-On-Chip Device Drivers"
 config MTD_DOCG3
 	tristate "M-Systems Disk-On-Chip G3"
 	select BCH
-	select BCH_CONST_PARAMS if !CONFIG_MTD_NAND_ECC_SW_BCH
+	select BCH_CONST_PARAMS if !MTD_NAND_ECC_SW_BCH
 	select BITREVERSE
 	help
 	  This provides an MTD device driver for the M-Systems DiskOnChip
diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
index 615d738..65c85fc 100644
--- a/drivers/mtd/nand/raw/Kconfig
+++ b/drivers/mtd/nand/raw/Kconfig
@@ -9,11 +9,22 @@ config MTD_NAND_ECC_SW_HAMMING_SMC
 	  Software ECC according to the Smart Media Specification.
 	  The original Linux implementation had byte 0 and 1 swapped.
 
+config MTD_NAND_ECC_SW_BCH
+	tristate "Support software BCH ECC"
+	select BCH
+	default n
+	help
+	  This enables support for software BCH error correction. Binary BCH
+	  codes are more powerful and cpu intensive than traditional Hamming
+	  ECC codes. They are used with NAND devices requiring more than 1 bit
+	  of error correction.
+
 menuconfig MTD_RAW_NAND
 	tristate "Raw/Parallel NAND Device Support"
 	depends on MTD
 	select MTD_NAND_CORE
 	select MTD_NAND_ECC_SW_HAMMING
+	imply MTD_NAND_ECC_SW_BCH
 	help
 	  This enables support for accessing all type of raw/parallel
 	  NAND flash devices. For further information see
@@ -21,16 +32,6 @@ menuconfig MTD_RAW_NAND
 
 if MTD_RAW_NAND
 
-config MTD_NAND_ECC_SW_BCH
-	tristate "Support software BCH ECC"
-	select BCH
-	default n
-	help
-	  This enables support for software BCH error correction. Binary BCH
-	  codes are more powerful and cpu intensive than traditional Hamming
-	  ECC codes. They are used with NAND devices requiring more than 1 bit
-	  of error correction.
-
 comment "Raw/parallel NAND flash controllers"
 
 config MTD_NAND_DENALI
-- 
2.7.4



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
