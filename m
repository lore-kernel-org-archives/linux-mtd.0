Return-Path: <SRS0=HIhO=MF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45F0CC07E95
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Jul 2021 13:12:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 060AA61073
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Jul 2021 13:12:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 060AA61073
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z/qrSu1D54hvQdRW2JbLTe6dy+Sx5a91+Xs+keywAlg=; b=h3jmK+LSZlrQzB
	nZPUhWyRxFUxUKiwZ0GzJhThBYOlJCD6UpkjTko8HE9h+DKSKm2oIolkCFSo1MqSsMy07qmvTKMbg
	EbY0m+iT5aoeeXV1IrsxONObuUSj7RMUhrixbuIuMYie5tc8L+Q5iGlaqeQYcZiCUqu343TWFrslG
	1JoxaE26M6LWa0ik/N0K70BWL7VseNOz7txDHuEO1G1t7D9tcE+YKWV8sbgoHBEWbJGTOLC3DsBqa
	jpfxmXxmFU6ZmRJNak8G3DrjeMmn0Wn95lEj7mCBnz9RRVAnfGy5QW0EBTKUj2507krxHjmIZ6a0a
	52BIfFvj+SNQ7YKr8v1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3IC8-00ATmK-Pv; Tue, 13 Jul 2021 13:11:29 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3I7Q-00ASPH-51
 for linux-mtd@lists.infradead.org; Tue, 13 Jul 2021 13:06:40 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 16DD6Swa073741;
 Tue, 13 Jul 2021 08:06:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1626181588;
 bh=Lyim0eEMlMzpf2TTksokWoegGGpgV+YNxu+z186bpt8=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=mCRvDhbqLxeOPrP+wZVYT3eK9huUQCsarsAFUw5l9cTy6a4MXO9NaEYPemR109uD4
 8FyyoHK4TUgxPOH4Ttc56M64DPTH0KhZG5pTAl2lT+HY6wRiQNzxkz0Px53omuk5A0
 WNCQtXWGPWC4QaqUpr1x7tarpE7+mUnm088E9tNA=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 16DD6SLA101319
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 13 Jul 2021 08:06:28 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 13
 Jul 2021 08:06:28 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 13 Jul 2021 08:06:27 -0500
Received: from LT5CD112GSQZ.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 16DD5daJ109825;
 Tue, 13 Jul 2021 08:06:23 -0500
From: Apurva Nandan <a-nandan@ti.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Mark Brown
 <broonie@kernel.org>, Patrice Chotard <patrice.chotard@foss.st.com>, Boris
 Brezillon <boris.brezillon@collabora.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>
CC: Apurva Nandan <a-nandan@ti.com>, Pratyush Yadav <p.yadav@ti.com>
Subject: [PATCH 09/13] mtd: spinand: Add support for write volatile
 configuration register op
Date: Tue, 13 Jul 2021 13:05:34 +0000
Message-ID: <20210713130538.646-10-a-nandan@ti.com>
X-Mailer: git-send-email 2.31.1.windows.1
In-Reply-To: <20210713130538.646-1-a-nandan@ti.com>
References: <20210713130538.646-1-a-nandan@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210713_060636_328785_9A67D03E 
X-CRM114-Status: GOOD (  18.68  )
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

Volatile configuration register are a different set of configuration
registers, i.e. they differ from the status registers. A different
SPI instruction is required to write to these registers. Any changes
to the Volatile Configuration Register get transferred directly to
the Internal Configuration Register and instantly reflect on the
device operation.

In Winbond W35N01JW, these volatile configuration register must be
configured in order to switch to Octal DTR SPI mode.

Add support for writing to volatile configuration registers using a
new WRITE_VCR_OP template.

Datasheet: https://www.winbond.com/export/sites/winbond/datasheet/W35N01JW_Datasheet_Brief.pdf

Signed-off-by: Apurva Nandan <a-nandan@ti.com>
---
 drivers/mtd/nand/spi/core.c    |  2 +-
 drivers/mtd/nand/spi/winbond.c | 28 ++++++++++++++++++++++++++++
 include/linux/mtd/spinand.h    |  1 +
 3 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 8711e887b795..f577e72da2c4 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -442,7 +442,7 @@ static void spinand_ondie_ecc_save_status(struct nand_device *nand, u8 status)
 		engine_conf->status = status;
 }
 
-static int spinand_write_enable_op(struct spinand_device *spinand)
+int spinand_write_enable_op(struct spinand_device *spinand)
 {
 	struct spi_mem_op op = SPINAND_WR_EN_DIS_OP(true);
 
diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index 76684428354e..a7052a9ca171 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -7,6 +7,7 @@
  *	Boris Brezillon <boris.brezillon@bootlin.com>
  */
 
+#include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/kernel.h>
 #include <linux/mtd/spinand.h>
@@ -114,6 +115,33 @@ static int winbond_spinand_init(struct spinand_device *spinand)
 	return 0;
 }
 
+static int winbond_write_vcr_op(struct spinand_device *spinand, u8 reg, u8 val)
+{
+	int ret;
+	struct spi_mem_op op = SPI_MEM_OP(SPI_MEM_OP_CMD(0x81, 1),
+					  SPI_MEM_OP_ADDR(3, reg, 1),
+					  SPI_MEM_OP_NO_DUMMY,
+					  SPI_MEM_OP_DATA_OUT(1, spinand->scratchbuf, 1));
+
+	*spinand->scratchbuf = val;
+
+	ret = spinand_write_enable_op(spinand);
+	if (ret)
+		return ret;
+
+	ret = spi_mem_exec_op(spinand->spimem, &op);
+	if (ret)
+		return ret;
+
+	/*
+	 * Write VCR operation doesn't set the busy bit in SR, so can't perform
+	 * a status poll. Minimum time of 50ns is needed to complete the write.
+	 * So, give thrice the minimum required delay.
+	 */
+	ndelay(150);
+	return 0;
+}
+
 static const struct spinand_manufacturer_ops winbond_spinand_manuf_ops = {
 	.init = winbond_spinand_init,
 };
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index daa2ac5c3110..21a4e5adcd59 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -560,5 +560,6 @@ int spinand_match_and_init(struct spinand_device *spinand,
 
 int spinand_upd_cfg(struct spinand_device *spinand, u8 mask, u8 val);
 int spinand_select_target(struct spinand_device *spinand, unsigned int target);
+int spinand_write_enable_op(struct spinand_device *spinand);
 
 #endif /* __LINUX_MTD_SPINAND_H */
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
