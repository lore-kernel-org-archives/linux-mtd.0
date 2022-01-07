Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C89CDC433F5
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jan 2022 18:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s4j0OLxPDC5t/ofudhjpEZoAtq6MoGygQLLGUD29gNA=; b=kBy03fu6xZxCxj
	MBJG2eDs9mkLhERscasthNIlZxQG73WZApoQtY6FdSdZBgyhO7HULMem5zlShrShqyf7y+B9cEY/5
	/W9hM0u2P6/a3ZhoUJ1XGIXF70KG+UMGGsIKimYVVAnK3OdSpWUC41ZOYglSUCjVUCMmipOuYNSgy
	6Txh4bIeDbBK4W1kMcJKM3jP0jhnD9Zvs1u8T8cpHh4nUQE4TF4RsTnSByE8Q7//QA5L6ZQOGQvYU
	bTkF58ZmvFJxNhncmH6YrR2RgN0HFuD/67hCY4y3LYPcDo/98Z6ghBYOnA6xqctMisA2kEgttQHK7
	HZurBmG6Wvil99TCeePw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5uGS-004wJp-Mn; Fri, 07 Jan 2022 18:47:00 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5uFy-004vyj-T5
 for linux-mtd@lists.infradead.org; Fri, 07 Jan 2022 18:46:32 +0000
Received: by mail-pj1-x1035.google.com with SMTP id
 g11-20020a17090a7d0b00b001b2c12c7273so6661973pjl.0
 for <linux-mtd@lists.infradead.org>; Fri, 07 Jan 2022 10:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1JjIAIonewoZ/0PMLC1pEg2k6n3SOlIGBtsswSA31us=;
 b=L6AJlNVGCTrVP2UCzU5x1LV1QjP3HtfDodCRv+zh5wFLqPbyvuWktzEMYCzhf1OxiL
 zHYIK72iNIfLxqgfjP1mozDkhguuANLFWGxtMMnWTayccQwaFONg+WUKr2na37jY5Knz
 cmvNbAsftcJxyD/aqP6gMQmBDvB5+DXwJO/OpkPljmsa3MXk8W6FTxT63O8Kd3++2jee
 23gbVSkQV5YdOSLdxvtGF6FnGu+ZHvF9JIkMwrYL7addK+VLI+ofsT3310nA2vWv/BLD
 Tev4H5UZuKOdh6kEg93VdsLes/hSa1gD0XjspeQlKtOTEGC6g6dvTx5tbIMgVZo7SEqD
 Vbzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1JjIAIonewoZ/0PMLC1pEg2k6n3SOlIGBtsswSA31us=;
 b=6TvXGWDDV2kevtNblu11TJTqw1qQPUf7U2NnMc2qHE+kMOFsP8GnPGEbmHDlZxxbkR
 ZNR9u3vx7t7bbMt3Vj5fxfEYV2L3kZucp4WOakAtDMeaPjlEEqWZ7WHZgo0nHNo/ViPV
 qCOnHNzAO8qMv07lNN+ZwkpDgHgTZ8TVlVDe9eNZ/i0vpQH1Tj4vcher+G0hChWWeYAm
 KYb+Y9T2sV1l1vB4SQzC54CJDaJ9ZlY7zwGtYeToYGubbIDK4hrIeDpAKnPD6wqWGcrc
 rgY91A7x1XUCzbVoVS8RglqURsvEnd5uhN9U0LiuMaV0LLzsn3tI3vooc7IbIa3CECr/
 LCZA==
X-Gm-Message-State: AOAM5335WlT6wYv/uhUmwQvhbU9mFici7YBJrriBsbzY2AF/sV2JtipJ
 oNaq1CGU94FPj9ICxJfES3LkMFlwuf4=
X-Google-Smtp-Source: ABdhPJwUSDioNw9znty0X3Izp/sI1O0Z3z0PNuc7wLvG/vGI+YoKJjxJDDg1ZaWaRQkFmFnoHAF8lg==
X-Received: by 2002:a17:90b:17c2:: with SMTP id
 me2mr17097635pjb.162.1641581189428; 
 Fri, 07 Jan 2022 10:46:29 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id x33sm7219417pfh.212.2022.01.07.10.46.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 10:46:29 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Cai Huoqing <caihuoqing@baidu.com>, Colin Ian King <colin.king@intel.com>,
 linux-kernel@vger.kernel.org (open list),
 linux-wireless@vger.kernel.org (open list:BROADCOM SPECIFIC AMBA DRIVER
 (BCMA)), 
 bcm-kernel-feedback-list@broadcom.com (open list:BROADCOM STB NAND FLASH
 DRIVER)
Subject: [PATCH v3 2/9] mtd: rawnand: brcmnand: Allow SoC to provide I/O
 operations
Date: Fri,  7 Jan 2022 10:46:07 -0800
Message-Id: <20220107184614.2670254-3-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220107184614.2670254-1-f.fainelli@gmail.com>
References: <20220107184614.2670254-1-f.fainelli@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220107_104630_966749_989F624B 
X-CRM114-Status: GOOD (  19.70  )
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

Allow a brcmnand_soc instance to provide a custom set of I/O operations
which we will require when using this driver on a BCMA bus which is not
directly memory mapped I/O. Update the nand_{read,write}_reg accordingly
to use the SoC operations if provided.

To minimize the penalty on other SoCs which do support standard MMIO
accesses, we use a static key which is disabled by default and gets
enabled if a soc implementation does provide I/O operations.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 28 +++++++++++++++++++++--
 drivers/mtd/nand/raw/brcmnand/brcmnand.h | 29 ++++++++++++++++++++++++
 2 files changed, 55 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index 63080ae3aef1..48d57b19c293 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -25,6 +25,7 @@
 #include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/slab.h>
+#include <linux/static_key.h>
 #include <linux/list.h>
 #include <linux/log2.h>
 
@@ -207,6 +208,8 @@ enum {
 
 struct brcmnand_host;
 
+static DEFINE_STATIC_KEY_FALSE(brcmnand_soc_has_ops_key);
+
 struct brcmnand_controller {
 	struct device		*dev;
 	struct nand_controller	controller;
@@ -592,15 +595,25 @@ enum {
 	INTFC_CTLR_READY		= BIT(31),
 };
 
+static inline bool brcmnand_non_mmio_ops(struct brcmnand_controller *ctrl)
+{
+	return static_branch_unlikely(&brcmnand_soc_has_ops_key);
+}
+
 static inline u32 nand_readreg(struct brcmnand_controller *ctrl, u32 offs)
 {
+	if (brcmnand_non_mmio_ops(ctrl))
+		return brcmnand_soc_read(ctrl->soc, offs);
 	return brcmnand_readl(ctrl->nand_base + offs);
 }
 
 static inline void nand_writereg(struct brcmnand_controller *ctrl, u32 offs,
 				 u32 val)
 {
-	brcmnand_writel(val, ctrl->nand_base + offs);
+	if (brcmnand_non_mmio_ops(ctrl))
+		brcmnand_soc_write(ctrl->soc, val, offs);
+	else
+		brcmnand_writel(val, ctrl->nand_base + offs);
 }
 
 static int brcmnand_revision_init(struct brcmnand_controller *ctrl)
@@ -766,13 +779,18 @@ static inline void brcmnand_rmw_reg(struct brcmnand_controller *ctrl,
 
 static inline u32 brcmnand_read_fc(struct brcmnand_controller *ctrl, int word)
 {
+	if (brcmnand_non_mmio_ops(ctrl))
+		return brcmnand_soc_read(ctrl->soc, BRCMNAND_NON_MMIO_FC_ADDR);
 	return __raw_readl(ctrl->nand_fc + word * 4);
 }
 
 static inline void brcmnand_write_fc(struct brcmnand_controller *ctrl,
 				     int word, u32 val)
 {
-	__raw_writel(val, ctrl->nand_fc + word * 4);
+	if (brcmnand_non_mmio_ops(ctrl))
+		brcmnand_soc_write(ctrl->soc, val, BRCMNAND_NON_MMIO_FC_ADDR);
+	else
+		__raw_writel(val, ctrl->nand_fc + word * 4);
 }
 
 static inline void edu_writel(struct brcmnand_controller *ctrl,
@@ -3000,6 +3018,12 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 	ctrl->dev = dev;
 	ctrl->soc = soc;
 
+	/* Enable the static key if the soc provides I/O operations indicating
+	 * that a non-memory mapped IO access path must be used
+	 */
+	if (brcmnand_soc_has_ops(ctrl->soc))
+		static_branch_enable(&brcmnand_soc_has_ops_key);
+
 	init_completion(&ctrl->done);
 	init_completion(&ctrl->dma_done);
 	init_completion(&ctrl->edu_done);
diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.h b/drivers/mtd/nand/raw/brcmnand/brcmnand.h
index eb498fbe505e..f1f93d85f50d 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.h
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.h
@@ -11,12 +11,25 @@
 
 struct platform_device;
 struct dev_pm_ops;
+struct brcmnand_io_ops;
+
+/* Special register offset constant to intercept a non-MMIO access
+ * to the flash cache register space. This is intentionally large
+ * not to overlap with an existing offset.
+ */
+#define BRCMNAND_NON_MMIO_FC_ADDR	0xffffffff
 
 struct brcmnand_soc {
 	bool (*ctlrdy_ack)(struct brcmnand_soc *soc);
 	void (*ctlrdy_set_enabled)(struct brcmnand_soc *soc, bool en);
 	void (*prepare_data_bus)(struct brcmnand_soc *soc, bool prepare,
 				 bool is_param);
+	const struct brcmnand_io_ops *ops;
+};
+
+struct brcmnand_io_ops {
+	u32 (*read_reg)(struct brcmnand_soc *soc, u32 offset);
+	void (*write_reg)(struct brcmnand_soc *soc, u32 val, u32 offset);
 };
 
 static inline void brcmnand_soc_data_bus_prepare(struct brcmnand_soc *soc,
@@ -58,6 +71,22 @@ static inline void brcmnand_writel(u32 val, void __iomem *addr)
 		writel_relaxed(val, addr);
 }
 
+static inline bool brcmnand_soc_has_ops(struct brcmnand_soc *soc)
+{
+	return soc && soc->ops && soc->ops->read_reg && soc->ops->write_reg;
+}
+
+static inline u32 brcmnand_soc_read(struct brcmnand_soc *soc, u32 offset)
+{
+	return soc->ops->read_reg(soc, offset);
+}
+
+static inline void brcmnand_soc_write(struct brcmnand_soc *soc, u32 val,
+				      u32 offset)
+{
+	soc->ops->write_reg(soc, val, offset);
+}
+
 int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc);
 int brcmnand_remove(struct platform_device *pdev);
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
