Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07558C433F5
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Jan 2022 07:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ww/Mocjd8lmSMpFTMSrNVgOBQDP0Ca3J18ary6L5ljc=; b=Ev8tm2bmA9HJc+
	JiqFQi5iiHwefJaRV3qERrRqBHS8gK8IG1FL/MM/cKmcSKDNfw1uvU6EouoEKoXLfV9UscDoFOEw2
	qBEWNx8AKonFttUJNZ1lc7BglY7IpdQdlQWesddNT1shF/4k7eONwPFQpVrHd+itOVxtxYBLPSDrs
	Wp1tdn3y3P5fFEaCig7at3T1j2QFxatpM7z+JyhNWYzePgOgMElvL8G0JCBzy2HOt26zxOljvH6dn
	rprhQC028S8JKETwBfPUCFBQHHF2ySIz25d8gs9v018Ctl+5wYvUtpKW9wbu9d5xNhcdz3lpg8Yr7
	aHUf8r7T0PT3Zr7g1Hxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n3ZA4-006kCe-0c; Sat, 01 Jan 2022 07:50:44 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n3Z3h-006idl-KZ
 for linux-mtd@lists.infradead.org; Sat, 01 Jan 2022 07:44:11 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2017i1TH085856;
 Sat, 1 Jan 2022 01:44:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1641023041;
 bh=ykcOMVzVV4pWjiU97QyKgi+V44rx0HjWUk/Rnk4859M=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=SgoJEWOfRkSJm42EC0zCIY8Oq2OrYLCB0sxpPZjgZTBrsm+HLZucS3sbCKMnBKtTN
 JuUAoJv0Sd17F9XNc3/OHr7tvfec0xMgBvW9iurdxWSWQfaFPKBqCSwAoNMFVjzLR7
 S6/VPg9HgFcYIrAPaaRlTKzuARwhu/14hLMCF9nU=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2017i1N7081766
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Sat, 1 Jan 2022 01:44:01 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Sat, 1
 Jan 2022 01:44:00 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Sat, 1 Jan 2022 01:44:00 -0600
Received: from LT5CD112GSQZ.ent.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2017gpwg033162;
 Sat, 1 Jan 2022 01:43:55 -0600
From: Apurva Nandan <a-nandan@ti.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Mark Brown
 <broonie@kernel.org>, Apurva Nandan <a-nandan@ti.com>, Patrice Chotard
 <patrice.chotard@foss.st.com>, Christophe Kerello
 <christophe.kerello@foss.st.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, Daniel Palmer <daniel@0x0f.com>, Alexander
 Lobakin <alobakin@pm.me>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>
CC: <p.yadav@ti.com>
Subject: [PATCH v3 11/17] mtd: spinand: Allow enabling/disabling Octal DTR
 mode in the core
Date: Sat, 1 Jan 2022 13:12:44 +0530
Message-ID: <20220101074250.14443-12-a-nandan@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220101074250.14443-1-a-nandan@ti.com>
References: <20220101074250.14443-1-a-nandan@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211231_234409_786952_C9F6228C 
X-CRM114-Status: GOOD (  17.90  )
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

Enable Octal DTR SPI mode, i.e. 8D-8D-8D mode, if the SPI NAND flash
device supports it. Mixed OSPI (1S-1S-8S & 1S-8S-8S), mixed DTR modes
(1S-1D-8D), etc. aren't supported yet.

The method to switch to Octal DTR SPI mode may vary across
manufacturers. For example, for Winbond, it is enabled by writing
values to the volatile configuration register. So, let the
manufacturer's code have their own implementation for switching to
Octal DTR SPI mode.

Check for the SPI NAND device's support for Octal DTR mode using
spinand flags, and if the data_ops and ctrl_ops are 8D-8D-8D, call
change_mode() manufacturer op. If the SPI controller doesn't
supports these modes, the selected data_ops and ctrl_ops will
prevent switching to the Octal DTR mode. And finally update the
spinand protocol and ctrl_ops on success. Similarly, for disabling
Octal DTR mode, call change_mode(), and update protocol and ctrl_ops.

Signed-off-by: Apurva Nandan <a-nandan@ti.com>
---
 drivers/mtd/nand/spi/core.c | 79 +++++++++++++++++++++++++++++++++++++
 include/linux/mtd/spinand.h |  1 +
 2 files changed, 80 insertions(+)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 1a602e4dd6bd..2fd08085db6f 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -1067,6 +1067,81 @@ spinand_select_ctrl_ops_variant(struct spinand_device *spinand,
 	return NULL;
 }
 
+static bool spinand_op_is_octal_dtr(const struct spi_mem_op *op)
+{
+	return  op->cmd.buswidth == 8 && op->cmd.dtr &&
+		op->addr.buswidth == 8 && op->addr.dtr &&
+		op->data.buswidth == 8 && op->data.dtr;
+}
+
+static int spinand_init_octal_dtr_enable(struct spinand_device *spinand)
+{
+	struct device *dev = &spinand->spimem->spi->dev;
+	const struct spinand_ctrl_ops *octal_dtr_ctrl_ops;
+	int ret;
+
+	if (!(spinand->flags & SPINAND_HAS_OCTAL_DTR_BIT))
+		return 0;
+
+	if (!(spinand_op_is_octal_dtr(spinand->data_ops.read_cache) &&
+	      spinand_op_is_octal_dtr(spinand->data_ops.write_cache) &&
+	      spinand_op_is_octal_dtr(spinand->data_ops.update_cache)))
+		return 0;
+
+	octal_dtr_ctrl_ops = spinand_select_ctrl_ops_variant(spinand,
+					spinand->desc_entry->ctrl_ops_variants,
+					SPINAND_8D_8D_8D);
+
+	if (!octal_dtr_ctrl_ops)
+		return 0;
+
+	if (!spinand->manufacturer->ops->change_mode) {
+		dev_dbg(dev,
+			"Missing ->change_mode(), unable to switch mode\n");
+		return -EINVAL;
+	}
+
+	ret = spinand->manufacturer->ops->change_mode(spinand,
+						      SPINAND_8D_8D_8D);
+	if (ret) {
+		dev_err(dev,
+			"Failed to enable Octal DTR SPI mode (err = %d)\n",
+			ret);
+		return ret;
+	}
+
+	spinand->protocol = SPINAND_8D_8D_8D;
+	spinand->ctrl_ops = octal_dtr_ctrl_ops;
+
+	dev_dbg(dev,
+		"%s SPI NAND switched to Octal DTR SPI (8D-8D-8D) mode\n",
+		spinand->manufacturer->name);
+	return 0;
+}
+
+static int spinand_init_octal_dtr_disable(struct spinand_device *spinand)
+{
+	struct device *dev = &spinand->spimem->spi->dev;
+	int ret;
+
+	if (!spinand->manufacturer->ops->change_mode)
+		return -EINVAL;
+
+	ret = spinand->manufacturer->ops->change_mode(spinand,
+						      SPINAND_1S_1S_1S);
+
+	if (ret) {
+		dev_err(dev,
+			"Failed to disable Octal DTR SPI mode (err = %d)\n",
+			ret);
+		return ret;
+	}
+
+	spinand->protocol = SPINAND_1S_1S_1S;
+	spinand->ctrl_ops = &spinand_default_ctrl_ops;
+	return 0;
+}
+
 /**
  * spinand_match_and_init() - Try to find a match between a device ID and an
  *			      entry in a spinand_info table
@@ -1203,6 +1278,10 @@ static int spinand_init_flash(struct spinand_device *spinand)
 			break;
 	}
 
+	ret = spinand_init_octal_dtr_enable(spinand);
+	if (ret)
+		return ret;
+
 	if (ret)
 		spinand_manufacturer_cleanup(spinand);
 
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index a8c071983a27..f12aa4516fab 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -417,6 +417,7 @@ struct spinand_ecc_info {
 
 #define SPINAND_HAS_QE_BIT		BIT(0)
 #define SPINAND_HAS_CR_FEAT_BIT		BIT(1)
+#define SPINAND_HAS_OCTAL_DTR_BIT	BIT(2)
 
 /**
  * struct spinand_ondie_ecc_conf - private SPI-NAND on-die ECC engine structure
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
