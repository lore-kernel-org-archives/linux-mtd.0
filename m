Return-Path: <SRS0=4OT8=KA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2B65C433B4
	for <linux-mtd@archiver.kernel.org>; Wed,  5 May 2021 22:06:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75A8F610FB
	for <linux-mtd@archiver.kernel.org>; Wed,  5 May 2021 22:06:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 75A8F610FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nfZJW0viaiUZab9ak5gbh9rART43mE2karIdHPpwAkY=; b=VzkDrrQ6yydI2cCKTqzqH/F4d
	wKy4ypBMKVUhn91lBUUeQzJ5vSWdaQkflecD+RukdCLexlyN7k5DvcZrw/TQ8/f5fnJMKwTHwkoeD
	8xpYn/YQeHkVN1rWOiOqOqOxoXiDXWHOayALySD1IZgs6VFjmCS+DyGkZ2zchj5HpndsoNGxFBvYc
	flbQBJbozqxkl9rrtTCQ8mlGAYztAxlo7+21+r5iHTnrs5g0cwHLU53uw8ZZZ9D0VA1uSX+albu+7
	25uLlRVQMyPSfDTIDlPpK166a9z/dz8HAJ0usnBaQIUvftZBAXhvheJIvQ5KAhNyID4QtavE6uyfn
	7qRNMCDjw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lePdy-002STf-4Y; Wed, 05 May 2021 22:05:22 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lePDh-002Oop-4O
 for linux-mtd@desiato.infradead.org; Wed, 05 May 2021 21:38:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=25AEa/RDLM+iT3Yja4A3ptPLL6KZmnHu383tg7ANGI4=; b=G3zTavCcrP94uOs3kf0a35eJY1
 zdVu5MvPN5XDMWKpO7F8/IoXZG1uJncBXU3ELiU3pdQwng0O4Ll2h8zkwR/jrSpekeWC/6vjICM85
 Bt848hWEWk8lovhdHvmXTnZ5Ov5ZOzLidpWNCkUCsC/O7HUvjsBJc7N32tvaklcxFHkSuTwCkZ2TA
 RssDaOzZkDwiDo5DTIaxyFXw0WDCXpC9oTNU6tO6UpRisaUVXPiXzgiygPfvPLamOvF+M3sbju/eA
 iDooeYFONARoC8uZz7OyA+UACcwFGOgNmrvE18q1pvqyig//0RCWuYb9jOyEYnMItYUB0feoS6h6b
 4JMhpVFw==;
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lePDe-005Igk-C2
 for linux-mtd@lists.infradead.org; Wed, 05 May 2021 21:38:11 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13.stephanxp.local (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id E18031BF206;
 Wed,  5 May 2021 21:38:07 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michal Simek <monstr@monstr.eu>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Amit Kumar Mahapatra <akumarma@xilinx.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 16/22] mtd: rawnand: Support enabling NV-DDR through
 SET_FEATURES
Date: Wed,  5 May 2021 23:37:44 +0200
Message-Id: <20210505213750.257417-17-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210505213750.257417-1-miquel.raynal@bootlin.com>
References: <20210505213750.257417-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_143810_706088_31D3CF9B 
X-CRM114-Status: GOOD (  16.31  )
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

Until now the parameter of the ADDR_TIMING_MODE feature was just the
ONFI timing mode (from 0 to 5) because we were only supporting the SDR
data interface. In the same byte, bits 4 and 5 indicate which data
interface is being configured so use them to set the right mode and also
read them back to ensure the right timing has been setup on the chip's
side.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/nand_base.c | 17 +++++++++++++----
 include/linux/mtd/onfi.h         |  4 ++++
 2 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 9bde1a7c312c..cfe8257bf175 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -832,7 +832,7 @@ static int nand_reset_interface(struct nand_chip *chip, int chipnr)
 static int nand_setup_interface(struct nand_chip *chip, int chipnr)
 {
 	const struct nand_controller_ops *ops = chip->controller->ops;
-	u8 tmode_param[ONFI_SUBFEATURE_PARAM_LEN] = { };
+	u8 tmode_param[ONFI_SUBFEATURE_PARAM_LEN] = { }, request;
 	int ret;
 
 	if (!nand_controller_can_setup_interface(chip))
@@ -848,7 +848,12 @@ static int nand_setup_interface(struct nand_chip *chip, int chipnr)
 	if (!chip->best_interface_config)
 		return 0;
 
-	tmode_param[0] = chip->best_interface_config->timings.mode;
+	request = chip->best_interface_config->timings.mode;
+	if (nand_interface_is_sdr(chip->best_interface_config))
+		request |= ONFI_DATA_INTERFACE_SDR;
+	else
+		request |= ONFI_DATA_INTERFACE_NVDDR;
+	tmode_param[0] = request;
 
 	/* Change the mode on the chip side (if supported by the NAND chip) */
 	if (nand_supports_set_features(chip, ONFI_FEATURE_ADDR_TIMING_MODE)) {
@@ -877,9 +882,13 @@ static int nand_setup_interface(struct nand_chip *chip, int chipnr)
 	if (ret)
 		goto err_reset_chip;
 
-	if (tmode_param[0] != chip->best_interface_config->timings.mode) {
-		pr_warn("timing mode %d not acknowledged by the NAND chip\n",
+	if (request != tmode_param[0]) {
+		pr_warn("%s timing mode %d not acknowledged by the NAND chip\n",
+			nand_interface_is_nvddr(chip->best_interface_config) ? "NV-DDR" : "SDR",
 			chip->best_interface_config->timings.mode);
+		pr_debug("NAND chip would work in %s timing mode %d\n",
+			 tmode_param[0] & ONFI_DATA_INTERFACE_NVDDR ? "NV-DDR" : "SDR",
+			 (unsigned int)ONFI_TIMING_MODE_PARAM(tmode_param[0]));
 		goto err_reset_chip;
 	}
 
diff --git a/include/linux/mtd/onfi.h b/include/linux/mtd/onfi.h
index a9677bf1e47e..99bb5f8954b8 100644
--- a/include/linux/mtd/onfi.h
+++ b/include/linux/mtd/onfi.h
@@ -29,6 +29,9 @@
 #define ONFI_FEATURE_EXT_PARAM_PAGE	BIT(7)
 
 /* ONFI timing mode, used in both asynchronous and synchronous mode */
+#define ONFI_DATA_INTERFACE_SDR		0
+#define ONFI_DATA_INTERFACE_NVDDR	BIT(4)
+#define ONFI_DATA_INTERFACE_NVDDR2	BIT(5)
 #define ONFI_TIMING_MODE_0		BIT(0)
 #define ONFI_TIMING_MODE_1		BIT(1)
 #define ONFI_TIMING_MODE_2		BIT(2)
@@ -36,6 +39,7 @@
 #define ONFI_TIMING_MODE_4		BIT(4)
 #define ONFI_TIMING_MODE_5		BIT(5)
 #define ONFI_TIMING_MODE_UNKNOWN	BIT(6)
+#define ONFI_TIMING_MODE_PARAM(x)	FIELD_GET(GENMASK(3, 0), (x))
 
 /* ONFI feature number/address */
 #define ONFI_FEATURE_NUMBER		256
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
