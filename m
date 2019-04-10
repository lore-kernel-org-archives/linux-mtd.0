Return-Path: <SRS0=ukLJ=SM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 173E2C10F14
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Apr 2019 13:11:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBBD52083E
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Apr 2019 13:11:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rgRNsczm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DBBD52083E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xEelTmqdqcM7dHJ2y1DankzXghePnizaMx6tuKqhaSA=; b=rgRNsczmE6Xrf/
	2k6l+bi6SdLotd0nUGujl8l5Tc56hE00PzTfMuR0gsTjC8hg/9FNzXpjwgHLvazlRZCvTY6exAlBD
	47ewMBKiS4/VoXbUD3eCS3Imhr0f7I7gSPNURfs8UAkK016CDDtRaWonj2X7dGR0po6pQWmnrFGa/
	SKDjvomkEr9v/OmerKGZxY1ZcXn7ThFiHE1XCeEMhnnxWAws1GB3+xKvNlmd9VKLlqi9j2hcJFkfu
	hd7lZKyXkIBEPabxsLgDCNizOgIQyaQLj2YtlSsN9LIbxch6LHZJlfzBDfeeTnUY6m+jEKxQ9hW83
	Y9F0zsBGUAvv/pX8oMYQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hED0Y-0005m5-Ao; Wed, 10 Apr 2019 13:11:18 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hED0V-0005lk-3m
 for linux-mtd@lists.infradead.org; Wed, 10 Apr 2019 13:11:16 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 2EB64FAA5A17F98C34F8;
 Wed, 10 Apr 2019 21:11:10 +0800 (CST)
Received: from localhost (10.177.31.96) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.408.0; Wed, 10 Apr 2019
 21:11:01 +0800
From: Yue Haibing <yuehaibing@huawei.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <computersforpeace@gmail.com>, <marek.vasut@gmail.com>,
 <paul.burton@mips.com>, <bbrezillon@kernel.org>
Subject: [PATCH] mtd: nand: Fix build error while CONFIG_MTD_NAND_ECC_SW_BCH
 is set to module
Date: Wed, 10 Apr 2019 21:07:47 +0800
Message-ID: <20190410130747.35692-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.177.31.96]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190410_061115_765152_DB436E99 
X-CRM114-Status: UNSURE (   8.77  )
X-CRM114-Notice: Please train this message.
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
because MTD_RAW_NAND need it while linked.

Reported-by: Hulk Robot <hulkci@huawei.com>
Fixes: 193bd4002644 ("mtd: nand: add software BCH ECC support"
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/mtd/nand/raw/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
index 615d738..0500c42 100644
--- a/drivers/mtd/nand/raw/Kconfig
+++ b/drivers/mtd/nand/raw/Kconfig
@@ -22,7 +22,7 @@ menuconfig MTD_RAW_NAND
 if MTD_RAW_NAND
 
 config MTD_NAND_ECC_SW_BCH
-	tristate "Support software BCH ECC"
+	bool "Support software BCH ECC"
 	select BCH
 	default n
 	help
-- 
2.7.4



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
