Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFBABC433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Apr 2022 08:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zhbu0TIOA9lb5OPzLj+uRLLfF+nTvdMPTF64n2qStGA=; b=tFMF8usRqT7gkT
	Ge4UWcVeJ8l/ktbuUZ9aP/sMp7q0zJ73XdJvejDYsUn9No90ds4xHlpK6yjuD/ffJHqMls2o8RXBT
	6k4WeiQ/QyQvBT52n0BqbbrYe0kCADh0GfX5z7qRAYDI9Hqgw9MLGN3e8CLhTXe5YB3U1i/p9sxNW
	wcxullEVDzKdxal03SmKwox3p08amV/BfUvZMyWBSHPTl50TobrhKu4IAsWQ41TzAXk21qD/hiI0n
	TIIHODyJRBS/2BrTFOnch9upXZ9zksKQPza/juwPYoKNxUdleUY7OFRZYWtCecku4PRAyf730yCsO
	u6z8UBYPf0qlikzC1JrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkMAl-00AEc0-Em; Fri, 29 Apr 2022 08:40:19 +0000
Received: from smtp2.axis.com ([195.60.68.18])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkMAW-00AEWc-1O
 for linux-mtd@lists.infradead.org; Fri, 29 Apr 2022 08:40:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1651221604;
 x=1682757604;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IJrwqcxhRxiJb00G97DLL+BjIscuo7iLEiybCPMtAmM=;
 b=DByxrnD2awBjaVcD0Un2hFgBwp8+M7torBhjnLto8eMBF47lYgTyVz2a
 jL9th6Zn8eiARU8mRiXHBCa+hrkE8yKOarv2v5XyC4y+7C7haNIJP8GKZ
 Ff8P0EancyIdvgnwUl7akHrWRRJUYtE3Ks2Ur8yFwR6uCCE8V3xXiFVJS
 VSmW9zZMqD5YfZGBw904QkbHF563iAEbeIQlzIrkgFiTs3OCZ/fDLMekj
 IvYASxFZ5SZl18e1a3RTnWDncVC4/1RJWMGIB8wECB8d1xLnoOtyepJeG
 /GOWaZXFE0QYXWgFSZwo8fyV40uyYuoEv+3i3Qat58dAsH+nYUS/vPIQB Q==;
From: Rickard Andersson <rickaran@axis.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>
CC: <rickaran@axis.com>, <rickard314.andersson@gmail.com>
Subject: [PATCH] mtd: rawnand: kioxia: Add support for TH58NVG3S0HBAI4
Date: Fri, 29 Apr 2022 10:39:31 +0200
Message-ID: <20220429083931.26795-1-rickaran@axis.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: se-mail01w.axis.com (10.20.40.7) To se-mail03w.axis.com
 (10.20.40.9)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_014004_458456_DE3A5B79 
X-CRM114-Status: UNSURE (   9.56  )
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
