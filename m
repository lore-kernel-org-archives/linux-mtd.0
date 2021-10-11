Return-Path: <SRS0=sMU9=O7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 411A3C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Oct 2021 20:48:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 130B160462
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Oct 2021 20:48:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 130B160462
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wq2w59uvgw1loEljLM1nXZB0o9XJfysAzWJlt8VO4EI=; b=zHKYFSctc4kyed
	BjSJCHfIUh7nVcFiN1ZNLwRcjm6NXmZJGwcmz/ovKO8eL6FJcD2O8I2uh9CYL67MD9mx/882T+7w/
	W7pws+PYcPnm2eyxpy3ah8zZXnNnWX4/azcXnjTHSQAqh2gsShN212PaXdXI+P39RT3pwUHrQMBCu
	y1oY8b/v8bVUHPRQgicgI5WAGu9x8FLGgcmOoY85/tJwnKwN0FyfsprVUkKq/FpJxu+JfQcBzAinb
	p3vEcHHPbBSgaAks5ourpCtCuaQb/E0udBKYksLRGjJ/WsflIfIgV0Ao/WhdL4Cg1RICPlAfc/Q78
	rRzIAUpq0EHvLgrSg+gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ma2Db-00Adqv-1R; Mon, 11 Oct 2021 20:48:19 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ma2CN-00AdTB-Ok
 for linux-mtd@lists.infradead.org; Mon, 11 Oct 2021 20:47:05 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 19BKksYE036494;
 Mon, 11 Oct 2021 15:46:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1633985214;
 bh=on8W3HPPfhJxHFSTbC30TeTqZ/NdxJ0M2DbWqQ2CJCY=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=IKP5tfY0w35lyYOnrrR2LD22aZXC85Z+5DWM/5Pkt0B287UAaWGBDGjOi+IPfLX65
 KhpRhCgIsRl2HISVvq2pVDRbunGUBuBvu/+CN5OjZQMV8pLbCekWmbbnH6nDsnFxN/
 dSX3MTzGP99AWgNzTWSS/XMYzrBaBkcnz0CwYkoU=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 19BKksiO055277
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 11 Oct 2021 15:46:54 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 11
 Oct 2021 15:46:54 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 11 Oct 2021 15:46:54 -0500
Received: from LT5CD112GSQZ.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 19BKkKEj069811;
 Mon, 11 Oct 2021 15:46:49 -0500
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
Subject: [PATCH v2 05/14] mtd: spinand: Add adjust_op() in manufacturer_ops to
 modify the ops for manufacturer specific changes
Date: Tue, 12 Oct 2021 02:16:10 +0530
Message-ID: <20211011204619.81893-6-a-nandan@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211011204619.81893-1-a-nandan@ti.com>
References: <20211011204619.81893-1-a-nandan@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_134703_914260_F927A6D7 
X-CRM114-Status: GOOD (  11.74  )
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

Manufacturers might use a variation of standard SPI NAND flash
instructions, e.g. Winbond W35N01JW changes the dummy cycle length for
read register commands when in Octal DTR mode.

Add new function in manufacturer_ops: adjust_op(), which can be called
to correct the spi_mem op for any alteration in the instruction made by
the manufacturers. And hence, this function can also be used for
incorporating variations of SPI instructions in Octal DTR mode.

Datasheet: https://www.winbond.com/export/sites/winbond/datasheet/W35N01JW_Datasheet_Brief.pdf

Signed-off-by: Apurva Nandan <a-nandan@ti.com>
---
 drivers/mtd/nand/spi/core.c | 3 +++
 include/linux/mtd/spinand.h | 4 ++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 4da794ae728d..8e6cf7941a0f 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -61,6 +61,9 @@ static void spinand_patch_op(const struct spinand_device *spinand,
 		op->data.buswidth = op_buswidth;
 		op->data.dtr = op_is_dtr;
 	}
+
+	if (spinand->manufacturer->ops->adjust_op)
+		spinand->manufacturer->ops->adjust_op(op, spinand->reg_proto);
 }
 
 static void spinand_patch_reg_op(const struct spinand_device *spinand,
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index f6093cd98d7b..ebb19b2cec84 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -257,6 +257,8 @@ struct spinand_devid {
 /**
  * struct manufacurer_ops - SPI NAND manufacturer specific operations
  * @init: initialize a SPI NAND device
+ * @adjust_op: modify the ops for any variation in their cmd, address, dummy or
+ *	       data phase by the manufacturer
  * @cleanup: cleanup a SPI NAND device
  *
  * Each SPI NAND manufacturer driver should implement this interface so that
@@ -264,6 +266,8 @@ struct spinand_devid {
  */
 struct spinand_manufacturer_ops {
 	int (*init)(struct spinand_device *spinand);
+	void (*adjust_op)(struct spi_mem_op *op,
+			  const enum spinand_proto reg_proto);
 	void (*cleanup)(struct spinand_device *spinand);
 };
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
