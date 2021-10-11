Return-Path: <SRS0=sMU9=O7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98CB8C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Oct 2021 20:50:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F0D260462
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Oct 2021 20:50:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5F0D260462
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x7z1VYWIQI63OwjBgefs7UZiGP5o9eavc61YUlrx1Ps=; b=eoVNAZZ3pZoKMG
	XilfrBh4Zu4v6qsULp8/9EzGKefd2avMB+KsvFhlZv6oQmeJjJfhYR7jpIM6PcT0KD1yob9fEifaK
	REOoUvpf6p0onj4Pcsm8kMbVpFt+kLBcAVa58Tqk9jivnR9hz4i7NYnPVGILRTfgi76EjaVQk0WzE
	iquRkzdNLTF3k6unUKA99EAqNTmOUoSQGCrMzSqr/kcb5m3+jznxW6QlaxsL0cKxunr73vnaFcg/2
	+S0rnhI2mMhB5BfVjyrmvq3htNnhim7GaJA/+xd8ComARsRj919i06MSfNmhmVHRqCoS9/Wdkn/Y8
	LRwxTaovZA3VzhKtNASg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ma2El-00AeEV-Te; Mon, 11 Oct 2021 20:49:32 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ma2CV-00AdUY-R1
 for linux-mtd@lists.infradead.org; Mon, 11 Oct 2021 20:47:13 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 19BKl5tQ071016;
 Mon, 11 Oct 2021 15:47:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1633985225;
 bh=DFZQnhqlxo23Wmwjp8fS/CEqoUGjmQJfz+RoEPGUJNY=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=kfL7inrw9Uy0mByZ9k/uXRYknUVv3fhl/s9YeXBtqys0S7OprKf9vkjBfqQSsXzmx
 xfrjSXaIFUbX4EXf3U4QCCxFoGm0uP3jk8+Dj9jlVoSMjCev7OsTvbsgslxRC2mE5c
 B8MxSOcUzPobiRs8HCBIPhIZbPVqaQK/PlKN33ZQ=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 19BKl5uM096784
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 11 Oct 2021 15:47:05 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 11
 Oct 2021 15:47:04 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 11 Oct 2021 15:47:04 -0500
Received: from LT5CD112GSQZ.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 19BKkKEl069811;
 Mon, 11 Oct 2021 15:47:00 -0500
From: Apurva Nandan <a-nandan@ti.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Mark Brown
 <broonie@kernel.org>, Apurva Nandan <a-nandan@ti.com>, Patrice Chotard
 <patrice.chotard@foss.st.com>, Christophe Kerello
 <christophe.kerello@foss.st.com>, Boris Brezillon
 <boris.brezillon@collabora.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>
CC: <p.yadav@ti.com>
Subject: [PATCH v2 07/14] mtd: spinand: Allow enabling Octal DTR mode in the
 core
Date: Tue, 12 Oct 2021 02:16:12 +0530
Message-ID: <20211011204619.81893-8-a-nandan@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211011204619.81893-1-a-nandan@ti.com>
References: <20211011204619.81893-1-a-nandan@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_134711_994526_604C55C7 
X-CRM114-Status: GOOD (  16.43  )
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
spinand flags, and if the op_templates allows 8D-8D-8D, call
octal_dtr_enable() manufacturer op. If the SPI controller doesn't
supports these modes, the selected op_templates will prevent switching
to the Octal DTR mode. And finally update the spinand reg_proto
on success.

Signed-off-by: Apurva Nandan <a-nandan@ti.com>
---
 drivers/mtd/nand/spi/core.c | 46 +++++++++++++++++++++++++++++++++++++
 include/linux/mtd/spinand.h |  3 +++
 2 files changed, 49 insertions(+)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 8e6cf7941a0f..1210946f8447 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -257,6 +257,48 @@ static int spinand_init_quad_enable(struct spinand_device *spinand)
 			       enable ? CFG_QUAD_ENABLE : 0);
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
+	int ret;
+
+	if (!(spinand->flags & SPINAND_HAS_OCTAL_DTR_BIT))
+		return 0;
+
+	if (!(spinand_op_is_octal_dtr(spinand->op_templates.read_cache) &&
+	      spinand_op_is_octal_dtr(spinand->op_templates.write_cache) &&
+	      spinand_op_is_octal_dtr(spinand->op_templates.update_cache)))
+		return 0;
+
+	if (!spinand->manufacturer->ops->octal_dtr_enable) {
+		dev_dbg(dev,
+			"Missing ->octal_dtr_enable(), unable to switch mode\n");
+		return -EINVAL;
+	}
+
+	ret = spinand->manufacturer->ops->octal_dtr_enable(spinand);
+	if (ret) {
+		dev_err(dev,
+			"Failed to enable Octal DTR SPI mode (err = %d)\n",
+			ret);
+		return ret;
+	}
+
+	spinand->reg_proto = SPINAND_OCTAL_DTR;
+
+	dev_dbg(dev,
+		"%s SPI NAND switched to Octal DTR SPI (8D-8D-8D) mode\n",
+		spinand->manufacturer->name);
+	return 0;
+}
+
 static int spinand_ecc_enable(struct spinand_device *spinand,
 			      bool enable)
 {
@@ -1192,6 +1234,10 @@ static int spinand_init_flash(struct spinand_device *spinand)
 	if (ret)
 		return ret;
 
+	ret = spinand_init_octal_dtr_enable(spinand);
+	if (ret)
+		return ret;
+
 	ret = spinand_upd_cfg(spinand, CFG_OTP_ENABLE, 0);
 	if (ret)
 		return ret;
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 35816b8cfe81..daa2ac5c3110 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -271,6 +271,7 @@ struct spinand_devid {
  * @init: initialize a SPI NAND device
  * @adjust_op: modify the ops for any variation in their cmd, address, dummy or
  *	       data phase by the manufacturer
+ * @octal_dtr_enable: switch the SPI NAND flash into Octal DTR SPI mode
  * @cleanup: cleanup a SPI NAND device
  *
  * Each SPI NAND manufacturer driver should implement this interface so that
@@ -280,6 +281,7 @@ struct spinand_manufacturer_ops {
 	int (*init)(struct spinand_device *spinand);
 	void (*adjust_op)(struct spi_mem_op *op,
 			  const enum spinand_proto reg_proto);
+	int (*octal_dtr_enable)(struct spinand_device *spinand);
 	void (*cleanup)(struct spinand_device *spinand);
 };
 
@@ -348,6 +350,7 @@ struct spinand_ecc_info {
 
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
