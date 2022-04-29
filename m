Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD20C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Apr 2022 08:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zhbu0TIOA9lb5OPzLj+uRLLfF+nTvdMPTF64n2qStGA=; b=yt1icBTpFYk0QC
	FcFGXHKVOmrS13U5oK12RjeqZ5D9pbx6434h4GujvaZQA6X68j2ay2Mp0b/6rL9bU4XcauBKlra/d
	xDkfJAVre12D7EJnrMnG1O92fbm1hHcqcy7iv9bRqbvwJu2eOJPJZFGbFe2ZjUEArCBG014aQTroR
	E4tKNQwe26w0I6O3oElrjfJw4IB5KHQrYJuTgXnPuj8BvWdcPsvgpL47co9jAqdm5q60yYYn0zC42
	DCYCiCruCJqnRMecv/bkNYWKkRJmtw3qNCoKqFMzMQdxu83gWp57unDNaeN94CK4T3wAwDcUInVkA
	4Dmsebfh1ujKrpw21q0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkLdo-00A4AO-3L; Fri, 29 Apr 2022 08:06:16 +0000
Received: from smtp1.axis.com ([195.60.68.17])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkLdk-00A47l-FX
 for linux-mtd@lists.infradead.org; Fri, 29 Apr 2022 08:06:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1651219572;
 x=1682755572;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IJrwqcxhRxiJb00G97DLL+BjIscuo7iLEiybCPMtAmM=;
 b=h/pcHnIdFNL/kz19klEzIh5Rr4KJmOFceRXqbzMGlLekmzx3ig7Cbqmq
 ZS1MT0PC2dhzc5ptg74ebCIEUUsOe8KNLidtTI4XJ+QgB4eY9XjB6F8sN
 Jk8H682DexsOCmaUlfIze7a73DMwloaCeFBCShkQg0V6mraN8MTBCa/j9
 X8JwnpdbP+Y1ODeVVF2jPRjgSjRL2IgM71FYsu3yOz8o2+am0naEtQ0Hg
 zm1zLtzH9XATE2FwZ826W8Q8wlpcCmog5Y18aztC+crQBPKhz7TXvcrw2
 pp3rrlunvuj4aOtHU1UQzqjJGm3qIPcYn48OcFdCt+k8eEPgJDWiom7ym A==;
From: Rickard Andersson <rickaran@axis.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>
CC: <rickaran@axis.com>, <rickard314.andersson@gmail.com>
Subject: [PATCH] MTD: NAND: Select timings for Kioxia TH58NVG3S0HBAI4
Date: Fri, 29 Apr 2022 10:05:49 +0200
Message-ID: <20220429080549.29236-1-rickaran@axis.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: se-mail01w.axis.com (10.20.40.7) To se-mail03w.axis.com
 (10.20.40.9)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_010612_880829_2BAC664F 
X-CRM114-Status: UNSURE (   9.04  )
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

From: Rickard x Andersson <rickaran@axis.com>

Add timings for Kioxia/Toshiba TH58NVG3S0HBAI4. Timings
for this memory matches the timings selected for
TH58NVG2S3HBAI4.

This patch increases eraseblock write speed from 5248 KiB/s
to 6864 KiB/s and erase block read speed from 8542 KiB/s
to 18360 KiB/s

Tested on i.MX6SX.

Signed-off-by: Rickard x Andersson <rickaran@axis.com>
---
 drivers/mtd/nand/raw/nand_ids.c     | 3 +++
 drivers/mtd/nand/raw/nand_toshiba.c | 6 ++++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_ids.c b/drivers/mtd/nand/raw/nand_ids.c
index d64adbd1ce6b..88c2440b47d8 100644
--- a/drivers/mtd/nand/raw/nand_ids.c
+++ b/drivers/mtd/nand/raw/nand_ids.c
@@ -61,6 +61,9 @@ struct nand_flash_dev nand_flash_ids[] = {
 	{"TH58NVG2S3HBAI4 4G 3.3V 8-bit",
 		{ .id = {0x98, 0xdc, 0x91, 0x15, 0x76} },
 		  SZ_2K, SZ_512, SZ_128K, 0, 5, 128, NAND_ECC_INFO(8, SZ_512) },
+	{"TH58NVG3S0HBAI4 8G 3.3V 8-bit",
+		{ .id = {0x98, 0xd3, 0x91, 0x26, 0x76} },
+		  SZ_4K, SZ_1K, SZ_256K, 0, 5, 256, NAND_ECC_INFO(8, SZ_512)},
 
 	LEGACY_ID_NAND("NAND 4MiB 5V 8-bit",   0x6B, 4, SZ_8K, SP_OPTIONS),
 	LEGACY_ID_NAND("NAND 4MiB 3,3V 8-bit", 0xE3, 4, SZ_8K, SP_OPTIONS),
diff --git a/drivers/mtd/nand/raw/nand_toshiba.c b/drivers/mtd/nand/raw/nand_toshiba.c
index cf4f37959421..d3d34d71921f 100644
--- a/drivers/mtd/nand/raw/nand_toshiba.c
+++ b/drivers/mtd/nand/raw/nand_toshiba.c
@@ -287,8 +287,10 @@ static int toshiba_nand_init(struct nand_chip *chip)
 	if (!strncmp("TC58NVG0S3E", chip->parameters.model,
 		     sizeof("TC58NVG0S3E") - 1))
 		tc58nvg0s3e_init(chip);
-	if (!strncmp("TH58NVG2S3HBAI4", chip->parameters.model,
-		     sizeof("TH58NVG2S3HBAI4") - 1))
+	if ((!strncmp("TH58NVG2S3HBAI4", chip->parameters.model,
+		     sizeof("TH58NVG2S3HBAI4") - 1)) ||
+	    (!strncmp("TH58NVG3S0HBAI4", chip->parameters.model,
+		     sizeof("TH58NVG3S0HBAI4") - 1)))
 		th58nvg2s3hbai4_init(chip);
 
 	return 0;
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
