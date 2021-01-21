Return-Path: <SRS0=p/ok=GY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D23AFC433E6
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Jan 2021 11:08:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F57C23602
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Jan 2021 11:08:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F57C23602
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=38BVNBTDJj3XtMD6KTlyov5x5XLZGHyctl3qixCJ3ps=; b=uLdMTq3NlwqWNSXvgfDzr1wY+o
	6722rzgqoLRmF2MVIRbMYy1kDnJiLgw2dHPF8U0Dme23wAgCmByIhXC8FhrJ5odS20CsXAbwCFkmA
	gROvB0I03llLdgTJoaJugDiTmBMYeDgW5VbAzM948Fh6Gzq4TXcEGDE7hC53v2jSh+/rVdwg3Z3UV
	q5gxn0vhSZKBWpHccBhchpMMAsvQutwAd/RxbfkEG9fsVKQQuHJjUHgOGiOXQVOUv9JEmxeqbjwS+
	9kXO3S53Y1hddO9SNwkdWSNNILJvlmlBAToZNTuPRJpfF5yLnkJBIP20Lmotn8/QI36Ng/46JufgL
	gMNMG29w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2Xmp-0003Pn-8f; Thu, 21 Jan 2021 11:05:59 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2Xmk-0003OI-Bn
 for linux-mtd@lists.infradead.org; Thu, 21 Jan 2021 11:05:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1611227154; x=1642763154;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FUPJkA6UQ+VJzJ9X4wX7xHYQ0eub7h5Unnnw3J+RJ+k=;
 b=1QMbfKR/kIUBirszM5uvjZrGz4Z2tAwFIeTDV1gQgttbxASLJfzmmDEv
 uSZgelNsuu7SmGIJZq+0UUMTda8BLdtM0/RjHg6Lak5hv5lzS0CQE8mE/
 Nene89K0bs3KKLc4iw3yL+4FKllDk2Vq4RzimrfBWq7+or83GspCmcxDX
 5/vlt424nbhMxrGzrQnbWagTzkLSCez1Y9L1f53GbRrMrY1qVei36PH8v
 pZ5HSmAQQ358QfcDbdzOj0ZzYmljHbzD5hhyCKJL34Dmt/qwxk/AiZ+Fi
 psVfVHlwUhf7ssKytl2EPDvjjEhfcfhAOhl6epRtfW1jmUfX9Iydz1wDC Q==;
IronPort-SDR: scwBJjnYZqOO6VGzs9/H4d/+v4FJDXADCPzD/0xGEhKt1lwVC9VaF5tJBkAuR9msGR3Yb51HwF
 Rdzzsqnopr3whgDnHtSxDezsL2hQIhCpDj2eT3yP4klfYa2UDCOJVuykYboyAJLAG/wuYjM1js
 Ctw4cFgF2aCEaKLqw2qqseysOTaiiYko7M/7tco0W8OLtdZpZvEYXQOqOpFgSaYch3Pdn8mehu
 DWqQ/6+b8Z+7k1BbeffYzvlIqod2aoMn9FXTrMmhtyB6AeOnQwA7LmQf+pOvtH9qjMbQ+Umuv5
 eGY=
X-IronPort-AV: E=Sophos;i="5.79,363,1602572400"; d="scan'208";a="111915343"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 21 Jan 2021 04:05:50 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 21 Jan 2021 04:05:50 -0700
Received: from atudor-ThinkPad-T470p.amer.actel.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Thu, 21 Jan 2021 04:05:48 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>
Subject: [PATCH v3 1/2] mtd: spi-nor: Add Global Block Unlock command
Date: Thu, 21 Jan 2021 13:05:45 +0200
Message-ID: <20210121110546.382633-1-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210121_060554_614775_A434720D 
X-CRM114-Status: GOOD (  13.94  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>, richard@nod.at,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Kavyasree.Kotagiri@microchip.com, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The Global Block Unlock command has different names depending
on the manufacturer, but always the same command value: 0x98.
Macronix's MX25U12835F names it Gang Block Unlock, Winbond's
W25Q128FV names it Global Block Unlock and Microchip's
SST26VF064B names it Global Block Protection Unlock.

Used in the Individual Block Protection mode, which is mutually
exclusive with the Block Protection mode (BP0-3).

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
Reviewed-by: Michael Walle <michael@walle.cc>
---
v3:
- s/Winbound/Winbond
- Add Michael's R-b tag
v2:
- s/mutual/mutually/
- set the GBULK cmd buswidth to 0 and call spi_nor_spimem_setup_op()
to update it, because the op can can be issued in QPI mode as well.
- add Pratyush's R-b tag

 drivers/mtd/spi-nor/core.c  | 37 +++++++++++++++++++++++++++++++++++++
 drivers/mtd/spi-nor/core.h  |  1 +
 include/linux/mtd/spi-nor.h |  1 +
 3 files changed, 39 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 20df44b753da..e82732dd31e1 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -853,6 +853,43 @@ int spi_nor_wait_till_ready(struct spi_nor *nor)
 						    DEFAULT_READY_WAIT_JIFFIES);
 }
 
+/**
+ * spi_nor_global_block_unlock() - Unlock Global Block Protection.
+ * @nor:	pointer to 'struct spi_nor'.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+int spi_nor_global_block_unlock(struct spi_nor *nor)
+{
+	int ret;
+
+	ret = spi_nor_write_enable(nor);
+	if (ret)
+		return ret;
+
+	if (nor->spimem) {
+		struct spi_mem_op op =
+			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_GBULK, 0),
+				   SPI_MEM_OP_NO_ADDR,
+				   SPI_MEM_OP_NO_DUMMY,
+				   SPI_MEM_OP_NO_DATA);
+
+		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
+
+		ret = spi_mem_exec_op(nor->spimem, &op);
+	} else {
+		ret = spi_nor_controller_ops_write_reg(nor, SPINOR_OP_GBULK,
+						       NULL, 0);
+	}
+
+	if (ret) {
+		dev_dbg(nor->dev, "error %d on Global Block Unlock\n", ret);
+		return ret;
+	}
+
+	return spi_nor_wait_till_ready(nor);
+}
+
 /**
  * spi_nor_write_sr() - Write the Status Register.
  * @nor:	pointer to 'struct spi_nor'.
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index d631ee299de3..eb26796db026 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -434,6 +434,7 @@ int spi_nor_write_disable(struct spi_nor *nor);
 int spi_nor_set_4byte_addr_mode(struct spi_nor *nor, bool enable);
 int spi_nor_write_ear(struct spi_nor *nor, u8 ear);
 int spi_nor_wait_till_ready(struct spi_nor *nor);
+int spi_nor_global_block_unlock(struct spi_nor *nor);
 int spi_nor_lock_and_prep(struct spi_nor *nor);
 void spi_nor_unlock_and_unprep(struct spi_nor *nor);
 int spi_nor_sr1_bit6_quad_enable(struct spi_nor *nor);
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index d13958de6d8a..a0d572855444 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -53,6 +53,7 @@
 #define SPINOR_OP_WREAR		0xc5	/* Write Extended Address Register */
 #define SPINOR_OP_SRSTEN	0x66	/* Software Reset Enable */
 #define SPINOR_OP_SRST		0x99	/* Software Reset */
+#define SPINOR_OP_GBULK		0x98    /* Global Block Unlock */
 
 /* 4-byte address opcodes - used on Spansion and some Macronix flashes. */
 #define SPINOR_OP_READ_4B	0x13	/* Read data bytes (low frequency) */
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
