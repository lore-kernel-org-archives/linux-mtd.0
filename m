Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75A3BC433FE
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Nov 2021 10:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aD2yP2r7n0tSnYuh9szsKlNXqbY3v3QKMgn+2jmlBJo=; b=SPgMzou1dY+ni3
	ijbtnAen/enAdCJpncuhKcQwTkel6DmGNq/8LiQbx10xyq3mpFXCsxFhc8MJrZ2ynnpCVjsnmMJIU
	SYPsO+ULX31myE4Ty1sZOO8caba65U++wNeao/IhuRmn47u5Qx6HwpHK58U2m5MXyJjdVHm/vGUmH
	kowadaM54tp7KYJ1WYNjtUN3mArmad6OGLULDuT9xvMP9KsJjAG7Nqg7E6UbFPjpiv84cOVZ1x9Fr
	9SoSbWLEMCbUmoisfaTju5zlSgDuDjfB59Z4GSOLD8zHCuBKPYYkpUSWkbS0vN54Kk22PP5rLVlvR
	q5R8RbE7fHzX6LSghM4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpTAu-001j2Q-Va; Tue, 23 Nov 2021 10:37:21 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpTA3-001imT-6y
 for linux-mtd@lists.infradead.org; Tue, 23 Nov 2021 10:36:28 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C8ADA6102A;
 Tue, 23 Nov 2021 10:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637663786;
 bh=fnjpunfMi60kKKSNTEppWkAAlhE50VuTfRoSTjIV8A4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PzThC1Yj3KZQ//cDgphhpcZnWHywlxb+MtgecLuvWXjIGSVQCN0ndEhKkxQNwagLl
 wkqeQEfKmjQEJ7Ci5eXpk4GJaaGpqAT+uTZqvuitMIKEkYI6n40am9zgWj2Glb4I5P
 bmPiAKVq9ru3nZJSe1XCPh4a/hN9tkW0Vnr8UZTfyxqblPbJrSG9xqc0c6Wu0A9hOq
 MC9kum9jl4bbUSbjJUDnI+CAj/+vFV5qTPkPcNTOGCTxJzGq1cWN0o9O9KlFPWx/o4
 NMVKpw2bWLnNO/cQ2ZDKK9ypHQ10KpRoOr5Xpf9gImck8/SGIvFySRcKTHa/GqvB5v
 ie0HiS7Xj4AvQ==
From: Roger Quadros <rogerq@kernel.org>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: kishon@ti.com, nm@ti.com, tony@atomide.com, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Roger Quadros <rogerq@kernel.org>
Subject: [PATCH 4/4] mtd: nand: omap2: Add support for NAND Controller on AM64
 SoC
Date: Tue, 23 Nov 2021 12:36:09 +0200
Message-Id: <20211123103609.14063-5-rogerq@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211123103609.14063-1-rogerq@kernel.org>
References: <20211123103609.14063-1-rogerq@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211123_023627_321599_A98A7662 
X-CRM114-Status: GOOD (  15.89  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

AM64 SoC has an issue which prevents proper 8-bit and 16-bit
reads from GPMC. We are limited to do 32-bit reads only.

Force 32-bit only reads on affected platforms.

Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
 drivers/mtd/nand/raw/omap2.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/mtd/nand/raw/omap2.c b/drivers/mtd/nand/raw/omap2.c
index f1fc146e09b9..d952de771b35 100644
--- a/drivers/mtd/nand/raw/omap2.c
+++ b/drivers/mtd/nand/raw/omap2.c
@@ -28,6 +28,7 @@
 
 #include <linux/omap-gpmc.h>
 #include <linux/platform_data/mtd-nand-omap2.h>
+#include <linux/sys_soc.h>
 
 #define	DRIVER_NAME	"omap2-nand"
 #define	OMAP_NAND_TIMEOUT_MS	5000
@@ -181,6 +182,7 @@ struct omap_nand_info {
 	void (*data_out)(struct nand_chip *chip,
 			 const void *buf, unsigned int len,
 			 bool force_8bit);
+	bool force_32bit;
 };
 
 static inline struct omap_nand_info *mtd_to_omap(struct mtd_info *mtd)
@@ -2070,6 +2072,25 @@ static void omap_nand_data_in(struct nand_chip *chip, void *buf,
 	struct omap_nand_info *info = mtd_to_omap(nand_to_mtd(chip));
 	u32 alignment = ((uintptr_t)buf | len) & 3;
 
+	if (info->force_32bit) {
+		u32 val;
+		int left;
+		u8 *ptr;
+
+		ioread32_rep(info->fifo, buf, len >> 2);
+		left = len & 0x3;
+		if (left) {
+			val = ioread32(info->fifo);
+			ptr = (u8 *)(buf + (len - left));
+			while (left--) {
+				*ptr++ = val & 0xff;
+				val >>= 8;
+			}
+		}
+
+		return;
+	}
+
 	if (force_8bit || (alignment & 1))
 		ioread8_rep(info->fifo, buf, len);
 	else if (alignment & 3)
@@ -2169,8 +2190,15 @@ static const struct nand_controller_ops omap_nand_controller_ops = {
 static struct nand_controller omap_gpmc_controller;
 static bool omap_gpmc_controller_initialized;
 
+static const struct of_device_id omap_nand_ids[];
+
 static int omap_nand_probe(struct platform_device *pdev)
 {
+	const struct soc_device_attribute k3_soc_devices[] = {
+		{ .family = "AM64X", .revision = "SR1.0" },
+		{ /* sentinel */ }
+	};
+
 	struct omap_nand_info		*info;
 	struct mtd_info			*mtd;
 	struct nand_chip		*nand_chip;
@@ -2186,6 +2214,12 @@ static int omap_nand_probe(struct platform_device *pdev)
 
 	info->pdev = pdev;
 
+	/* Some SoC's have 32-bit at least, read limitation */
+	if (soc_device_match(k3_soc_devices)) {
+		dev_info(&pdev->dev, "force 32-bit\n");
+		info->force_32bit = true;
+	}
+
 	err = omap_get_dt_info(dev, info);
 	if (err)
 		return err;
@@ -2286,6 +2320,7 @@ static int omap_nand_remove(struct platform_device *pdev)
 
 static const struct of_device_id omap_nand_ids[] = {
 	{ .compatible = "ti,omap2-nand", },
+	{ .compatible = "ti,am64-nand", },
 	{},
 };
 MODULE_DEVICE_TABLE(of, omap_nand_ids);
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
