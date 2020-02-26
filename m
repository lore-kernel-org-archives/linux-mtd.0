Return-Path: <SRS0=a+Ch=4O=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1D19C4BA0B
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Feb 2020 09:38:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 914C720732
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Feb 2020 09:38:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fqb3P8Nv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="GC3+4ikY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 914C720732
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qz109/20RFHy4y+ooebtFpOJI+0ylE0FxBl2rA4cllw=; b=fqb3P8NvdgoHj2
	dMVZWmSHP3RS6QoVK9qyPA4drhJA0zKtqjkx7mKKKAmtkJzU7heBcFg+ZlSrtnp0RrtWrA+qZm7fS
	bp5LCjdsiSydlzxBcnjxAaYldwbWIxIr++cIvDXXlUY49JkwP8cH8DMok0FZIjhAnVtm+h44NpFZ+
	eCkwkZkiAgoHAlnqZIVdVoWQV2HY3E3PrNk1a61y2E17P3chBeh5PZ/+1g7v8kGRXkkxS30gnfa4T
	ViH/bqRNhy1EwZQipJWOiLgtRuwXKoNIPfozWwvkVicQK2G9WNNKK/0EDNU3YHMuoGHLpaEoYtYkQ
	6NI3tM6+6+hIG/lvqHIQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6t99-00022V-A0; Wed, 26 Feb 2020 09:38:27 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6t8G-00019w-Tk
 for linux-mtd@lists.infradead.org; Wed, 26 Feb 2020 09:37:34 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01Q9bQ06108032;
 Wed, 26 Feb 2020 03:37:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1582709846;
 bh=UK9ViJ8/KnZTmqsh0WaZJUAW35YfoP4ZW7jL8CyJPoQ=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=GC3+4ikYVuIib89/kVsUWrJZzTCfta5uFhsQ1rmOJebR3ekvGJGeZ/1/IltvlnZ3b
 1B7gis80R3HV0fd0WoUUl8MBUIm9j83v2hKHf1gn3oxlGbVRwx6L0/EUnWrtTHLrud
 uHENnCYDJ3D4byp3UnfSnxEEeMQh0Hbmkkz3SmfU=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01Q9bQqZ118902
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 26 Feb 2020 03:37:26 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 26
 Feb 2020 03:37:25 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 26 Feb 2020 03:37:25 -0600
Received: from pratyush-OptiPlex-790.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01Q9b4A9110613;
 Wed, 26 Feb 2020 03:37:22 -0600
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Mark Brown <broonie@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v2 04/11] spi: spi-mem: allow specifying a command's extension
Date: Wed, 26 Feb 2020 15:06:56 +0530
Message-ID: <20200226093703.19765-5-p.yadav@ti.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200226093703.19765-1-p.yadav@ti.com>
References: <20200226093703.19765-1-p.yadav@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200226_013733_074258_BA4E8838 
X-CRM114-Status: GOOD (  15.17  )
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
Cc: devicetree@vger.kernel.org, Sekhar Nori <nsekhar@ti.com>,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-mtd@lists.infradead.org, Pratyush Yadav <p.yadav@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

In xSPI mode, flashes expect 2-byte opcodes. The second byte is called
the "command extension". There can be 3 types of extensions in xSPI:
repeat, invert, and hex. When the extension type is "repeat", the same
opcode is sent twice. When it is "invert", the second byte is the
inverse of the opcode. When it is "hex" an additional opcode byte based
is sent with the command whose value can be anything.

Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
---
 drivers/spi/spi-mem.c       | 23 +++++++++++++++++++++++
 include/linux/spi/spi-mem.h | 24 ++++++++++++++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
index cb13e0878b95..3838ddc9aeec 100644
--- a/drivers/spi/spi-mem.c
+++ b/drivers/spi/spi-mem.c
@@ -462,6 +462,29 @@ int spi_mem_adjust_op_size(struct spi_mem *mem, struct spi_mem_op *op)
 }
 EXPORT_SYMBOL_GPL(spi_mem_adjust_op_size);
 
+int spi_mem_get_cmd_ext(const struct spi_mem_op *op, u8 *ext)
+{
+	switch (op->cmd.ext_type) {
+	case SPI_MEM_EXT_INVERT:
+		*ext = ~op->cmd.opcode;
+		break;
+
+	case SPI_MEM_EXT_REPEAT:
+		*ext = op->cmd.opcode;
+		break;
+
+	case SPI_MEM_EXT_HEX:
+		*ext = op->cmd.ext;
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(spi_mem_get_cmd_ext);
+
 static ssize_t spi_mem_no_dirmap_read(struct spi_mem_dirmap_desc *desc,
 				      u64 offs, size_t len, void *buf)
 {
diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
index 4669082b4e3b..06ccab17e4d0 100644
--- a/include/linux/spi/spi-mem.h
+++ b/include/linux/spi/spi-mem.h
@@ -67,11 +67,31 @@ enum spi_mem_data_dir {
 	SPI_MEM_DATA_OUT,
 };
 
+/**
+ * enum spi_mem_cmd_ext - describes the command opcode extension in DTR mode
+ * @SPI_MEM_EXT_NONE: no extension. This is the default, and is used in Legacy
+ *		      SPI mode
+ * @SPI_MEM_EXT_REPEAT: the extension is same as the opcode
+ * @SPI_MEM_EXT_INVERT: the extension is the bitwise inverse of the opcode
+ * @SPI_MEM_EXT_HEX: the extension is any hex value. The command and opcode
+ *		     combine to form a 16-bit opcode.
+ */
+enum spi_mem_cmd_ext {
+	SPI_MEM_EXT_NONE = 0,
+	SPI_MEM_EXT_REPEAT,
+	SPI_MEM_EXT_INVERT,
+	SPI_MEM_EXT_HEX,
+};
+
 /**
  * struct spi_mem_op - describes a SPI memory operation
  * @cmd.buswidth: number of IO lines used to transmit the command
  * @cmd.opcode: operation opcode
  * @cmd.is_dtr: whether the command opcode should be sent in DTR mode or not
+ * @cmd.ext_type: type of the command opcode extension in DTR mode
+ * @cmd.ext: value of the command opcode extension in DTR mode. It is
+ *	     only set when 'ext_type' is 'SPI_MEM_EXT_HEX'. In all other
+ *	     cases, the extension can be directly derived from the opcode.
  * @addr.nbytes: number of address bytes to send. Can be zero if the operation
  *		 does not need to send an address
  * @addr.buswidth: number of IO lines used to transmit the address cycles
@@ -97,6 +117,8 @@ struct spi_mem_op {
 		u8 buswidth;
 		u8 opcode;
 		bool is_dtr;
+		enum spi_mem_cmd_ext ext_type;
+		u8 ext;
 	} cmd;
 
 	struct {
@@ -361,6 +383,8 @@ int spi_mem_driver_register_with_owner(struct spi_mem_driver *drv,
 
 void spi_mem_driver_unregister(struct spi_mem_driver *drv);
 
+int spi_mem_get_cmd_ext(const struct spi_mem_op *op, u8 *ext);
+
 #define spi_mem_driver_register(__drv)                                  \
 	spi_mem_driver_register_with_owner(__drv, THIS_MODULE)
 
-- 
2.25.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
