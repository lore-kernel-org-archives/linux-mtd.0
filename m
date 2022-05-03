Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA631C433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  3 May 2022 08:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LscXIEz+dxfEkIQM+AvwsQfOBw7HaVr4UMksxgqhw2M=; b=kz2r26Wg4U88mC
	VCBBJ1WCeiqN8joRMZBQsNtiti6pj04qHDsLpKsUqRT090vfvuOoBEP/yLHyaEbrvC8p133h0Jy+C
	KRA0Jfep4nLUbLamHv5E9vy1LTd2U/NQPOtmK5yoJNjtMsNMnWkjEzRxB1IkSMDG4LAyJzfIVpnCH
	61AnqTcQNXHIj6+dGX/VneJBfkMIv4Pbf+ZHP8FQ4hiFUW/OnipSlCaxhQHPzdFa3v9j8GWq4nt1A
	DUwEbTBRJD/PIn0Z6PdkehLUPgaPvn5bPqEnSxLwVJ7bEQDoN3Ve0RHMgC7LjOXwP5c0cXi3M34hD
	Sumf8n1b+CxMAKsKVAFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlniG-004ZK9-Bd; Tue, 03 May 2022 08:16:52 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlni8-004ZGe-QG
 for linux-mtd@lists.infradead.org; Tue, 03 May 2022 08:16:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1651565804; x=1683101804;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NVh00FSVeR/E6zr8GX6HB17imXTTrRF99WG2Pb6I5vc=;
 b=uZiVpKhBPs8vwiwdqJMh2DlTNzWM3P9ZQpMl5u+kNYlbWTP4M3F6BRfN
 xPZ2UC4JRowk8878U9JyYWmSlyI8+sb8HbQvnOQl1vIdb7lie04Mwptk3
 P0EqXXX/HTthSA8bWpFm5DnLn6enb8DM6u/QpdXxkZzuYkiRJDjYApuvo
 JN53Q0n+h7Neh2A1OPaM8d/RloTcmlD2YVPx6Shz9eCoMgVzM3WvgaQ9J
 Q+9ymGBDRx2AtzPEYJv52eORdKtxbm7Ay7uVAXe7I55We7ZOrwaWP+OgH
 qCz65zm5l0LZst7ARNTuWcYjRKeQ3szi5B3ASXzGv1sW+roMV7q0ntpiM A==;
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="171740317"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 03 May 2022 01:16:44 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 3 May 2022 01:16:43 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Tue, 3 May 2022 01:16:41 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <tkuw584924@gmail.com>, <p.yadav@ti.com>, <michael@walle.cc>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <Bacem.Daassi@infineon.com>, <Takahiro.Kuwano@infineon.com>,
 <linux-mtd@lists.infradead.org>, Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH v14 5/8] mtd: spi-nor: core: Couple the number of address
 bytes with the address mode
Date: Tue, 3 May 2022 11:16:24 +0300
Message-ID: <20220503081627.341870-6-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220503081627.341870-1-tudor.ambarus@microchip.com>
References: <20220503081627.341870-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_011645_005920_89AF6CEF 
X-CRM114-Status: GOOD (  24.96  )
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

Some of Infineon chips support volatile version of configuration registers
and it is recommended to update volatile registers in the field application
due to a risk of the non-volatile registers corruption by power interrupt.
Such a volatile configuration register is used to enable the Quad mode.
The register write sequence requires the number of bytes of address in
order to be programmed. As it was before, the nor->addr_nbytes was set to 4
before calling the volatile Quad enable method. This was incorrect because
the Write Any Register command does not have a 4B opcode equivalent and the
address mode was still at default (3-byte mode) and not changed to 4 by
entering in the 4 Byte Address Mode, so the operation failed.

Move the setting of the number of bytes of address after the Quad Enable
method to allow reads or writes to registers that require the number of
address bytes to work with the default address mode. The number of address
bytes and the address mode are tightly coupled, this is a natural change.

Other (standard) Quad Enable methods are not affected, as they don't
require the number of address bytes, so no functionality changes expected.

Reported-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/core.c | 134 +++++++++++++++++++------------------
 1 file changed, 70 insertions(+), 64 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 3709b57572ae..e7c7ab5a18da 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2279,49 +2279,6 @@ static int spi_nor_default_setup(struct spi_nor *nor,
 	return 0;
 }
 
-static int spi_nor_set_addr_nbytes(struct spi_nor *nor)
-{
-	if (nor->params->addr_nbytes) {
-		nor->addr_nbytes = nor->params->addr_nbytes;
-	} else if (nor->read_proto == SNOR_PROTO_8_8_8_DTR) {
-		/*
-		 * In 8D-8D-8D mode, one byte takes half a cycle to transfer. So
-		 * in this protocol an odd address width cannot be used because
-		 * then the address phase would only span a cycle and a half.
-		 * Half a cycle would be left over. We would then have to start
-		 * the dummy phase in the middle of a cycle and so too the data
-		 * phase, and we will end the transaction with half a cycle left
-		 * over.
-		 *
-		 * Force all 8D-8D-8D flashes to use an address width of 4 to
-		 * avoid this situation.
-		 */
-		nor->addr_nbytes = 4;
-	} else if (nor->info->addr_nbytes) {
-		nor->addr_nbytes = nor->info->addr_nbytes;
-	} else {
-		nor->addr_nbytes = 3;
-	}
-
-	if (nor->addr_nbytes == 3 && nor->params->size > 0x1000000) {
-		/* enable 4-byte addressing if the device exceeds 16MiB */
-		nor->addr_nbytes = 4;
-	}
-
-	if (nor->addr_nbytes > SPI_NOR_MAX_ADDR_NBYTES) {
-		dev_dbg(nor->dev, "address width is too large: %u\n",
-			nor->addr_nbytes);
-		return -EINVAL;
-	}
-
-	/* Set 4byte opcodes when possible. */
-	if (nor->addr_nbytes == 4 && nor->flags & SNOR_F_4B_OPCODES &&
-	    !(nor->flags & SNOR_F_HAS_4BAIT))
-		spi_nor_set_4byte_opcodes(nor);
-
-	return 0;
-}
-
 static int spi_nor_setup(struct spi_nor *nor,
 			 const struct spi_nor_hwcaps *hwcaps)
 {
@@ -2331,10 +2288,7 @@ static int spi_nor_setup(struct spi_nor *nor,
 		ret = nor->params->setup(nor, hwcaps);
 	else
 		ret = spi_nor_default_setup(nor, hwcaps);
-	if (ret)
-		return ret;
-
-	return spi_nor_set_addr_nbytes(nor);
+	return ret;
 }
 
 /**
@@ -2716,6 +2670,74 @@ static int spi_nor_quad_enable(struct spi_nor *nor)
 	return nor->params->quad_enable(nor);
 }
 
+static int spi_nor_set_addr_nbytes(struct spi_nor *nor)
+{
+	if (nor->params->addr_nbytes) {
+		nor->addr_nbytes = nor->params->addr_nbytes;
+	} else if (nor->read_proto == SNOR_PROTO_8_8_8_DTR) {
+		/*
+		 * In 8D-8D-8D mode, one byte takes half a cycle to transfer. So
+		 * in this protocol an odd address width cannot be used because
+		 * then the address phase would only span a cycle and a half.
+		 * Half a cycle would be left over. We would then have to start
+		 * the dummy phase in the middle of a cycle and so too the data
+		 * phase, and we will end the transaction with half a cycle left
+		 * over.
+		 *
+		 * Force all 8D-8D-8D flashes to use an address width of 4 to
+		 * avoid this situation.
+		 */
+		nor->addr_nbytes = 4;
+	} else if (nor->info->addr_nbytes) {
+		nor->addr_nbytes = nor->info->addr_nbytes;
+	} else {
+		nor->addr_nbytes = 3;
+	}
+
+	if (nor->addr_nbytes == 3 && nor->params->size > 0x1000000) {
+		/* enable 4-byte addressing if the device exceeds 16MiB */
+		nor->addr_nbytes = 4;
+	}
+
+	if (nor->addr_nbytes > SPI_NOR_MAX_ADDR_NBYTES) {
+		dev_dbg(nor->dev, "address width is too large: %u\n",
+			nor->addr_nbytes);
+		return -EINVAL;
+	}
+
+	/* Set 4byte opcodes when possible. */
+	if (nor->addr_nbytes == 4 && nor->flags & SNOR_F_4B_OPCODES &&
+	    !(nor->flags & SNOR_F_HAS_4BAIT))
+		spi_nor_set_4byte_opcodes(nor);
+
+	return 0;
+}
+
+static int spi_nor_set_addr_mode(struct spi_nor *nor)
+{
+	int ret;
+
+	ret = spi_nor_set_addr_nbytes(nor);
+	if (ret)
+		return ret;
+
+	if (nor->addr_nbytes == 4 && nor->read_proto != SNOR_PROTO_8_8_8_DTR &&
+	    !(nor->flags & SNOR_F_4B_OPCODES)) {
+		/*
+		 * If the RESET# pin isn't hooked up properly, or the system
+		 * otherwise doesn't perform a reset command in the boot
+		 * sequence, it's impossible to 100% protect against unexpected
+		 * reboots (e.g., crashes). Warn the user (or hopefully, system
+		 * designer) that this is bad.
+		 */
+		WARN_ONCE(nor->flags & SNOR_F_BROKEN_RESET,
+			  "enabling reset hack; may not recover from unexpected reboots\n");
+		nor->params->set_4byte_addr_mode(nor, true);
+	}
+
+	return 0;
+}
+
 static int spi_nor_init(struct spi_nor *nor)
 {
 	int err;
@@ -2747,22 +2769,7 @@ static int spi_nor_init(struct spi_nor *nor)
 	     nor->flags & SNOR_F_SWP_IS_VOLATILE))
 		spi_nor_try_unlock_all(nor);
 
-	if (nor->addr_nbytes == 4 &&
-	    nor->read_proto != SNOR_PROTO_8_8_8_DTR &&
-	    !(nor->flags & SNOR_F_4B_OPCODES)) {
-		/*
-		 * If the RESET# pin isn't hooked up properly, or the system
-		 * otherwise doesn't perform a reset command in the boot
-		 * sequence, it's impossible to 100% protect against unexpected
-		 * reboots (e.g., crashes). Warn the user (or hopefully, system
-		 * designer) that this is bad.
-		 */
-		WARN_ONCE(nor->flags & SNOR_F_BROKEN_RESET,
-			  "enabling reset hack; may not recover from unexpected reboots\n");
-		nor->params->set_4byte_addr_mode(nor, true);
-	}
-
-	return 0;
+	return spi_nor_set_addr_mode(nor);
 }
 
 /**
@@ -3018,7 +3025,6 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	 * - select op codes for (Fast) Read, Page Program and Sector Erase.
 	 * - set the number of dummy cycles (mode cycles + wait states).
 	 * - set the SPI protocols for register and memory accesses.
-	 * - set the address width.
 	 */
 	ret = spi_nor_setup(nor, hwcaps);
 	if (ret)
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
