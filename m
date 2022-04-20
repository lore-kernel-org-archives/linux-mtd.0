Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60A96C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Apr 2022 10:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ML8NHK7BJphwbn9wIW6cx5/oVeGll5FrvU65rAPQSaE=; b=CmODotQcmJb5Rg
	ujfQw8ZXmqh4oJ5QUJwK72VS9gys2tkDBb3sA6RxDxA6iVV2kqxtD3wVI4FiX2bXC6JiOfCaMk7em
	swvrivPaEzaDW9IJJyzF7V/wccXsdR6AR5r0Dq5HZAYkF0e7+JAtmHvePC2PdteTWlNlcvptCqHIZ
	LFHFekUodhjtluVSdhQ8dYfms7BTudeemIkUrfp3RLfXJq8nqIcqsbKuBbSAs91DnPbJ9TsRXy/GK
	zCx7blqCb/V/yAcTKgLLg+ELNiIMzsGLtgPrPCbJifAAkV+KV//pxEB/AhpPdzvI7fZio0us8pPSW
	jCTU09FUTQW9Ta2adZSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nh7g3-008cTe-ME; Wed, 20 Apr 2022 10:35:15 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nh7fa-008c8n-Sw
 for linux-mtd@lists.infradead.org; Wed, 20 Apr 2022 10:34:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1650450886; x=1681986886;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=maO/ht8L4lItA3cWu+BmhkTcmkuxR6CQ4As+MVnmM84=;
 b=nO+xkZvqk4ovPJUCKWMM4NED7Y4hY0+K1U6WmH5UZnE4jjQTPhwhA19p
 bcsQYfHkL2ifRHfICPhAj7jbA/V8Qc4L4oVg8tU/frfOhITLRAdNsan65
 7lC81MTPlx6D42qA9Uo4miAxX+QvzprN8DpW8TEDTPZztB9rYv+bzE2p0
 bkQHanC2prMlTkF8hituEzpe7sZvD0NpiqJnzt8uqcp+cidwfEFd7fGOb
 2GZpUCCWFdov3ECBOpHW/9Ihl40gA1HMyFE3uEegQJkefyfK2e3/eymfr
 +ck4cEL7fr4EUi0lVRhVj7LWKG5xkAI65kkyJ04OUsccmImSz3cwtg8kO w==;
X-IronPort-AV: E=Sophos;i="5.90,275,1643698800"; d="scan'208";a="161091308"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 20 Apr 2022 03:34:46 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 20 Apr 2022 03:34:46 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Wed, 20 Apr 2022 03:34:44 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <p.yadav@ti.com>, <michael@walle.cc>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Takahiro.Kuwano@infineon.com>, Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH v4 06/11] mtd: spi-nor: core: Add helpers to read/write any
 register
Date: Wed, 20 Apr 2022 13:34:22 +0300
Message-ID: <20220420103427.47867-7-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220420103427.47867-1-tudor.ambarus@microchip.com>
References: <20220420103427.47867-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_033446_977563_19117D1F 
X-CRM114-Status: UNSURE (   9.28  )
X-CRM114-Notice: Please train this message.
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

There are manufacturers that use registers indexed by address. Some of
them support "read/write any register" opcodes. Provide core methods that
can be used by all manufacturers. SPI NOR controller ops are intentionally
not supported as we intend to move all the SPI NOR controller drivers
under the SPI subsystem.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Tested-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
Reviewed-by: Michael Walle <michael@walle.cc>
---
 drivers/mtd/spi-nor/core.c | 46 ++++++++++++++++++++++++++++++++++++++
 drivers/mtd/spi-nor/core.h |  4 ++++
 2 files changed, 50 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 6165dc7bfd17..08bf58e5dbd1 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -307,6 +307,52 @@ ssize_t spi_nor_write_data(struct spi_nor *nor, loff_t to, size_t len,
 	return nor->controller_ops->write(nor, to, len, buf);
 }
 
+/**
+ * spi_nor_read_any_reg() - read any register from flash memory, nonvolatile or
+ * volatile.
+ * @nor:        pointer to 'struct spi_nor'.
+ * @op:		SPI memory operation. op->data.buf must be DMA-able.
+ * @proto:	SPI protocol to use for the register operation.
+ *
+ * Return: zero on success, -errno otherwise
+ */
+int spi_nor_read_any_reg(struct spi_nor *nor, struct spi_mem_op *op,
+			 enum spi_nor_protocol proto)
+{
+	if (!nor->spimem)
+		return -EOPNOTSUPP;
+
+	spi_nor_spimem_setup_op(nor, op, proto);
+	return spi_nor_spimem_exec_op(nor, op);
+}
+
+/**
+ * spi_nor_write_any_volatile_reg() - write any volatile register to flash
+ * memory.
+ * @nor:        pointer to 'struct spi_nor'
+ * @op:		SPI memory operation. op->data.buf must be DMA-able.
+ * @proto:	SPI protocol to use for the register operation.
+ *
+ * Writing volatile registers are instant according to some manufacturers
+ * (Cypress, Micron) and do not need any status polling.
+ *
+ * Return: zero on success, -errno otherwise
+ */
+int spi_nor_write_any_volatile_reg(struct spi_nor *nor, struct spi_mem_op *op,
+				   enum spi_nor_protocol proto)
+{
+	int ret;
+
+	if (!nor->spimem)
+		return -EOPNOTSUPP;
+
+	ret = spi_nor_write_enable(nor);
+	if (ret)
+		return ret;
+	spi_nor_spimem_setup_op(nor, op, proto);
+	return spi_nor_spimem_exec_op(nor, op);
+}
+
 /**
  * spi_nor_write_enable() - Set write enable latch with Write Enable command.
  * @nor:	pointer to 'struct spi_nor'.
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index f952061d5c24..62ddadba0c33 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -554,6 +554,10 @@ ssize_t spi_nor_read_data(struct spi_nor *nor, loff_t from, size_t len,
 			  u8 *buf);
 ssize_t spi_nor_write_data(struct spi_nor *nor, loff_t to, size_t len,
 			   const u8 *buf);
+int spi_nor_read_any_reg(struct spi_nor *nor, struct spi_mem_op *op,
+			 enum spi_nor_protocol proto);
+int spi_nor_write_any_volatile_reg(struct spi_nor *nor, struct spi_mem_op *op,
+				   enum spi_nor_protocol proto);
 int spi_nor_erase_sector(struct spi_nor *nor, u32 addr);
 
 int spi_nor_otp_read_secr(struct spi_nor *nor, loff_t addr, size_t len, u8 *buf);
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
