Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A701C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Feb 2022 02:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b+QQY9V2chqCzTdQVR7GUFH4ZJr2OB5NFMsp21MxYX0=; b=xM/JziCzun8Y5h
	nWC+gu/F8Vx+JVAc54bX+nxjATUBh+KY+MFF1NZr66e4jtg54bBTOeo5X4dlxOeCAv0cNXeqwR2A3
	DJD9P8leVkghjmK6Z3jr3ATCIvuY9vl2p51MoK6q4FndAYLlKimrTNftDal9TA7rOc5XwlUl8BfCU
	yeB4iAzkAIWiaTR21InAJ22A1l8yGVzwUK0cwhEoi1uLIpY449WR1JngaFxeKnQMMyk+pB9XH3HjS
	LYmL1WKlhbKIq3B1vAEHrg6R+hITd5ayZX6LPSh917G1Man5bFLiemYJSdgVhbaViu90+r/0Ag40J
	W+7d4jac9WZ0TEtghCvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHzHV-002I0i-8s; Thu, 10 Feb 2022 02:34:01 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHzHI-002Hy5-Tm
 for linux-mtd@lists.infradead.org; Thu, 10 Feb 2022 02:33:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1644460429; x=1675996429;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OWnYMkE7rv7BP25MrUGzKPIKcqXSEAtS5doI11hP+Y0=;
 b=cEu7lWnjVc+6zt9E15Zqd+401qUuQpP+v383M1prJDZR7tZXjEvfrHIU
 V86yYCzSJFR7f54oroe5RgbeWUHDAiRfnNAZKr/4L65IWW393bahmsd4o
 yXjynhBwrBBzWv19DJmVAg6e7gjCGEkGEnclngYc3G/ikaYNZ/u/qR6yb
 jUwqE+g/5FFqoEzUfnX+Hs/BfkJNb0AKnhXF1bJnviFvdmjJoH5cAUQoK
 9UY4P/cGqIzURS4OFYDESkc134AMddnU8xiYD0ffsw676TXQqf+cQmLJc
 YLXPuhSlPQLWn0UnrwR/EZJ4RnmuQpybRyjJYX/UgWXLkzl7a9uoH7FLe w==;
IronPort-SDR: eYLmNNkfGEeTrLV0GHhqboKWtUmQqQltTsdFidEkzGqh62JoZiYJgr/qR+/l8AimU4PgsTB+j9
 CRI+EY6n7r5sZdLJyBYxoHzxHHjMedd0v0WMvxmqB4ZTwK2oSUgzWw1zmNQbC0rBDnz8oUVKX0
 /SSdoapEL5u24R+Ri1Y+5tYYRMY+tV4BMTZMZ2ldX4eBVqBh7kLxDhGTWGQ2Zo6NKCuIvQfTWv
 UuqzTRr5sLzQEmPcAqSTPTiFzxkcOf7EDGqjNtT+f8ubNGUBArfHWUFuODlpmU6lpDwJgLeiDk
 i0rJYlHvVG8g+D3Zo3SEU32u
X-IronPort-AV: E=Sophos;i="5.88,357,1635231600"; d="scan'208";a="148216716"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 09 Feb 2022 19:33:47 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 9 Feb 2022 19:33:45 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Wed, 9 Feb 2022 19:33:41 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <p.yadav@ti.com>, <michael@walle.cc>, <Takahiro.Kuwano@infineon.com>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <nicolas.ferre@microchip.com>, <zhengxunli@mxic.com.tw>,
 <jaimeliao@mxic.com.tw>, <Bacem.Daassi@infineon.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>
Subject: [PATCH 1/3] mtd: spi-nor: core: Add helpers to read/write any register
Date: Thu, 10 Feb 2022 04:33:32 +0200
Message-ID: <20220210023334.408926-2-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220210023334.408926-1-tudor.ambarus@microchip.com>
References: <20220210023334.408926-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_183349_048427_0581E19C 
X-CRM114-Status: UNSURE (   9.37  )
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
---
 drivers/mtd/spi-nor/core.c | 41 ++++++++++++++++++++++++++++++++++++++
 drivers/mtd/spi-nor/core.h |  4 ++++
 2 files changed, 45 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 7d5e3acb0ae7..d394179689e6 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -307,6 +307,47 @@ ssize_t spi_nor_write_data(struct spi_nor *nor, loff_t to, size_t len,
 	return nor->controller_ops->write(nor, to, len, buf);
 }
 
+/**
+ * spi_nor_read_reg() - read register to flash memory
+ * @nor:        pointer to 'struct spi_nor'.
+ * @op:		SPI memory operation. op->data.buf must be DMA-able.
+ * @proto:	SPI protocol to use for the register operation.
+ *
+ * Return: zero on success, -errno otherwise
+ */
+int spi_nor_read_reg(struct spi_nor *nor, struct spi_mem_op *op,
+		     enum spi_nor_protocol proto)
+{
+	if (!nor->spimem)
+		return -EOPNOTSUPP;
+
+	spi_nor_spimem_setup_op(nor, op, proto);
+	return spi_nor_spimem_exec_op(nor, op);
+}
+
+/**
+ * spi_nor_write_reg() - write register to flash memory
+ * @nor:        pointer to 'struct spi_nor'
+ * @op:		SPI memory operation. op->data.buf must be DMA-able.
+ * @proto:	SPI protocol to use for the register operation.
+ *
+ * Return: zero on success, -errno otherwise
+ */
+int spi_nor_write_reg(struct spi_nor *nor, struct spi_mem_op *op,
+		      enum spi_nor_protocol proto)
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
index cbfb4fa7647f..c728454b5424 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -578,6 +578,10 @@ ssize_t spi_nor_read_data(struct spi_nor *nor, loff_t from, size_t len,
 			  u8 *buf);
 ssize_t spi_nor_write_data(struct spi_nor *nor, loff_t to, size_t len,
 			   const u8 *buf);
+int spi_nor_read_reg(struct spi_nor *nor, struct spi_mem_op *op,
+		     enum spi_nor_protocol proto);
+int spi_nor_write_reg(struct spi_nor *nor, struct spi_mem_op *op,
+		      enum spi_nor_protocol proto);
 int spi_nor_erase_sector(struct spi_nor *nor, u32 addr);
 
 int spi_nor_otp_read_secr(struct spi_nor *nor, loff_t addr, size_t len, u8 *buf);
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
