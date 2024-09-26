Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13063CDE01B
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Sep 2024 15:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VmJH72MzipHQ9uBJpbSduyINwFmZFv4yQxYl619hJMA=; b=D2Jgr0TgXS8d9k
	CSXZjWptImhYm9PEPptDeaIjsnCX4x0Z7yUKnmz4Du7dBuceTspp0j1pjW2X9emcb6LkoDTmzZxP4
	+KL2o7K7Nav+fjrcSIX1JLCMQ/4nIAkY3Bta4NIdCmz5v17FAZ2+9zw+xrH6e1tQukWZuheab9E/y
	pFr38WSNFmqDiufhc9C0Vvz7SHfvEMpwy9nhlRxaCNoGWoBvFyuCTgtiZzaG169VqmmmKok7fKqKz
	nlzDZhVr8+OkzkB2ZHqy8i5cYE3ydimaxaAU8Oo6ZpT+7eVmT8Fi6ikfcMv+l3UErqkp1EOFlVjrL
	UwulppZoby9eGfMRE/9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stqmd-00000008nLZ-2wga;
	Thu, 26 Sep 2024 15:51:59 +0000
Received: from chessie.fmt1.pfcs.com ([66.220.13.234] helo=chessie.everett.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stqma-00000008nJn-0JMv
	for linux-mtd@lists.infradead.org;
	Thu, 26 Sep 2024 15:51:57 +0000
Received: from localhost.localdomain (ip-77-25-16-238.web.vodafone.de [77.25.16.238])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by chessie.everett.org (Postfix) with ESMTPSA id 4XDylB1SflzMRBN;
	Thu, 26 Sep 2024 15:51:50 +0000 (UTC)
From: Erez Geva <erezgeva@nwtime.org>
To: linux-mtd@lists.infradead.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Esben Haabendal <esben@geanix.com>,
	Erez Geva <ErezGeva2@gmail.com>
Subject: [PATCH v6 1/3] mtd: spi-nor: core: make OTP configuration dynamic
Date: Thu, 26 Sep 2024 17:51:25 +0200
Message-Id: <20240926155127.2450246-2-erezgeva@nwtime.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240926155127.2450246-1-erezgeva@nwtime.org>
References: <20240926155127.2450246-1-erezgeva@nwtime.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_085156_138410_8209AA4E 
X-CRM114-Status: GOOD (  15.88  )
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

From: Erez Geva <ErezGeva2@gmail.com>

Currently the OTP configuration are constant in compile time.
However in some situation we need to update or change
 the device OTP configuration dynamically on runtime.

Signed-off-by: Erez Geva <ErezGeva2@gmail.com>
---
 drivers/mtd/spi-nor/core.c    | 4 +++-
 drivers/mtd/spi-nor/core.h    | 2 +-
 drivers/mtd/spi-nor/otp.c     | 6 +++---
 drivers/mtd/spi-nor/winbond.c | 2 +-
 4 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 9d6e85bf227b..1e7a64fd4b1a 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2911,7 +2911,9 @@ static void spi_nor_init_default_params(struct spi_nor *nor)
 	struct device_node *np = spi_nor_get_flash_node(nor);
 
 	params->quad_enable = spi_nor_sr2_bit1_quad_enable;
-	params->otp.org = info->otp;
+	memset(&params->otp.org, 0, sizeof(struct spi_nor_otp_organization));
+	if (info->otp)
+		memcpy(&params->otp.org, info->otp, sizeof(struct spi_nor_otp_organization));
 
 	/* Default to 16-bit Write Status (01h) Command */
 	nor->flags |= SNOR_F_HAS_16BIT_SR;
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 1516b6d0dc37..b678cb8ae5a1 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -326,7 +326,7 @@ struct spi_nor_otp_ops {
  * @ops:	OTP access ops
  */
 struct spi_nor_otp {
-	const struct spi_nor_otp_organization *org;
+	struct spi_nor_otp_organization org;
 	const struct spi_nor_otp_ops *ops;
 };
 
diff --git a/drivers/mtd/spi-nor/otp.c b/drivers/mtd/spi-nor/otp.c
index 9a729aa3452d..ffb7ffeb9030 100644
--- a/drivers/mtd/spi-nor/otp.c
+++ b/drivers/mtd/spi-nor/otp.c
@@ -11,8 +11,8 @@
 
 #include "core.h"
 
-#define spi_nor_otp_region_len(nor) ((nor)->params->otp.org->len)
-#define spi_nor_otp_n_regions(nor) ((nor)->params->otp.org->n_regions)
+#define spi_nor_otp_region_len(nor) ((nor)->params->otp.org.len)
+#define spi_nor_otp_n_regions(nor) ((nor)->params->otp.org.n_regions)
 
 /**
  * spi_nor_otp_read_secr() - read security register
@@ -222,7 +222,7 @@ int spi_nor_otp_is_locked_sr2(struct spi_nor *nor, unsigned int region)
 
 static loff_t spi_nor_otp_region_start(const struct spi_nor *nor, unsigned int region)
 {
-	const struct spi_nor_otp_organization *org = nor->params->otp.org;
+	const struct spi_nor_otp_organization *org = &nor->params->otp.org;
 
 	return org->base + region * org->offset;
 }
diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 9f7ce5763e71..b60df00e43b9 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -333,7 +333,7 @@ static int winbond_nor_late_init(struct spi_nor *nor)
 {
 	struct spi_nor_flash_parameter *params = nor->params;
 
-	if (params->otp.org)
+	if (params->otp.org.n_regions)
 		params->otp.ops = &winbond_nor_otp_ops;
 
 	/*
-- 
2.39.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
