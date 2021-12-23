Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2D83C43219
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Dec 2021 00:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dRCc+At75jQwX4Z+qFNQ0aQeFYkWQ0zOOM8ovcUN5wk=; b=3Al6ZaBrLSpJAu
	YteeAkkDRtJqgZWNJlFg0F5HgcjKP7oFp2+Bgucrd2PyAsIzno2mAWoGSSJepbyvby4OpnYwt2Oxk
	zwOp5CCFWIppuYPZ8AMHYY0VNvXDFXzbFcX896JdbpG0aM9rR4HskQDoHwq3r6zpzT8EozSUkTROc
	C2eG+uHRed7hb4uuYyAJTz+0Wd+t0VBfWQRI3X4xnYKyZL3s50SV6Gbf3xH2b+NtaK68ewurmZcBP
	y4+TrSfEkm9k560Z3TiS2PKr34sLDa9VxWua+raMV1biJQfn6F1FWbkERixcktk5fkV5rj76expIW
	3PjtxExd7LTThNbgc40g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0Bsf-00BXjv-3m; Thu, 23 Dec 2021 00:22:49 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0BsQ-00BXem-DT
 for linux-mtd@lists.infradead.org; Thu, 23 Dec 2021 00:22:35 +0000
Received: by mail-pl1-x62a.google.com with SMTP id w24so3015857ply.12
 for <linux-mtd@lists.infradead.org>; Wed, 22 Dec 2021 16:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QmETOXOkNKQa2rKCeFKfspOjqOV7hD2bdN3ZZG5FHUI=;
 b=UC3LITshLiCeZPJfbMnFWKVzk+NdxgHQXUs2cuh5g0zkp5TWUKAhtNpar0sVngrS64
 IORiZyiJDJTK9/p6Xe/jHOAIWxXxok7ftwOY8v0n3D7cSHnWmi1Xm5cJ7S6TVY0wTo1K
 sQaN8CZ+WFyz6qC33tdUpAbi9QJy9PZ8ajCfveE0wC96V5UKhGFWICSEPZ35BCC0/vJS
 KhSi6hPabCtBKGD3YoZU7kQ/QkrKeT+Bpv/eP3HikmynvOThLJt8L8zRxv7o1plvy6eY
 cIvaeZywe3GqhIfdQmkRtIOhMCEqHDikDCpaVfslgxv3Q2eOTmSUr0sj2G4huJOEagm1
 c3Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QmETOXOkNKQa2rKCeFKfspOjqOV7hD2bdN3ZZG5FHUI=;
 b=uk22F/j3zxH+9KkLlHEhIJBfpRs8aB24htRUz2JshmeIHxv6lq/h0BuxLq3k1LRX8s
 GyREo3hr36jw3IynkESpxnHLXaxso6LAkAI5Moa+uL5KJpa86V4nv+H4ygCd3XKMrDmM
 ERowBpUb/zFqkoDiok2Wa0AVpwh92/+AHoz8jpRuJtSVJp8wjxxZbEcOcp/xwyHb6vST
 eZ5X5OHYZxPT8NSne5iiQ/UdGdPgK4HIGR5AnU42eE7mzuM/+L94lWC5L2AHP5on29Y+
 5BWCAeeMVSHiaS0vowan4Gt3npKh8ch7pQhtJllrdWX7s2jSEKnLrQ6fKtDrG/VEh15q
 u4hw==
X-Gm-Message-State: AOAM533ZM9QRZ243QM2jwtvc/SuQoTw765D0LFEoNyKc8Zv0yInADMyB
 qCsS5fzH54Bppolu+g/ALD+7aaH7pJc=
X-Google-Smtp-Source: ABdhPJwhz8YZlay9PUCTslrKMaxwhliG6OEIIBNm11WCw9aJY46qwiWx1rz70bxyRDenBBotVqJCVw==
X-Received: by 2002:a17:90a:cb0d:: with SMTP id z13mr42268pjt.89.1640218953323; 
 Wed, 22 Dec 2021 16:22:33 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id e24sm6720703pjt.45.2021.12.22.16.22.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 16:22:32 -0800 (PST)
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
Subject: [PATCH 1/9] mtd: rawnand: brcmnand: Allow SoC to provide I/O
 operations
Date: Wed, 22 Dec 2021 16:22:17 -0800
Message-Id: <20211223002225.3738385-2-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211223002225.3738385-1-f.fainelli@gmail.com>
References: <20211223002225.3738385-1-f.fainelli@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211222_162234_478938_99A4BEDC 
X-CRM114-Status: GOOD (  14.96  )
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

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 14 ++++++++++++--
 drivers/mtd/nand/raw/brcmnand/brcmnand.h | 23 +++++++++++++++++++++++
 2 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index f75929783b94..7a1673b1b1af 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -594,13 +594,18 @@ enum {
 
 static inline u32 nand_readreg(struct brcmnand_controller *ctrl, u32 offs)
 {
+	if (brcmnand_soc_has_ops(ctrl->soc))
+		return brcmnand_soc_read(ctrl->soc, offs);
 	return brcmnand_readl(ctrl->nand_base + offs);
 }
 
 static inline void nand_writereg(struct brcmnand_controller *ctrl, u32 offs,
 				 u32 val)
 {
-	brcmnand_writel(val, ctrl->nand_base + offs);
+	if (brcmnand_soc_has_ops(ctrl->soc))
+		brcmnand_soc_write(ctrl->soc, val, offs);
+	else
+		brcmnand_writel(val, ctrl->nand_base + offs);
 }
 
 static int brcmnand_revision_init(struct brcmnand_controller *ctrl)
@@ -766,13 +771,18 @@ static inline void brcmnand_rmw_reg(struct brcmnand_controller *ctrl,
 
 static inline u32 brcmnand_read_fc(struct brcmnand_controller *ctrl, int word)
 {
+	if (brcmnand_soc_has_ops(ctrl->soc))
+		return brcmnand_soc_read(ctrl->soc, ~0);
 	return __raw_readl(ctrl->nand_fc + word * 4);
 }
 
 static inline void brcmnand_write_fc(struct brcmnand_controller *ctrl,
 				     int word, u32 val)
 {
-	__raw_writel(val, ctrl->nand_fc + word * 4);
+	if (brcmnand_soc_has_ops(ctrl->soc))
+		brcmnand_soc_write(ctrl->soc, val, ~0);
+	else
+		__raw_writel(val, ctrl->nand_fc + word * 4);
 }
 
 static inline void edu_writel(struct brcmnand_controller *ctrl,
diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.h b/drivers/mtd/nand/raw/brcmnand/brcmnand.h
index eb498fbe505e..a3f2ad5f6572 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.h
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.h
@@ -11,12 +11,19 @@
 
 struct platform_device;
 struct dev_pm_ops;
+struct brcmnand_io_ops;
 
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
@@ -58,6 +65,22 @@ static inline void brcmnand_writel(u32 val, void __iomem *addr)
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
