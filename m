Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CE6CC00A94
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Apr 2024 13:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kKhBOSKPCf7I4AX5C2P53De/ruWS//4ova1OCRBP5Bo=; b=AhG1zFz1ns8LS8
	KEkUwMfzEpJBd56PGblXnCKmwsz3FuPNzY70Bvsdi3NfLlJWhUnQdd0mhRujlvEXVBZlYFMMDkGW5
	1WC7QlbJj7i8rawtzrEs5ZD4EuySTwEPbxtX3shfpNoLy2v7WOthRPJL5tQo+ezBepLA4UMoxjdjS
	5JTtyHGKhnk7f6jQjhhg7Rsq/9cOIbaDjsEMOY8Ft5H2Q2UhOMmwuaERXoUy1/Q5rhkC3gI1WLf6l
	vMc2fqHcji2drR9DPriuQj7TY5TTLXEPbfkTXKKqvVR/O+OcFdk5N1pMf1L9jmI6ITGR6iO9DhKuA
	ZMJ1dz74IvyPRPe0ALcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvHCj-0000000HOOr-2SiX;
	Fri, 12 Apr 2024 13:44:33 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvHCb-0000000HOIO-0RoN
	for linux-mtd@lists.infradead.org;
	Fri, 12 Apr 2024 13:44:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 171AACE394E;
	Fri, 12 Apr 2024 13:44:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02F8AC2BD10;
	Fri, 12 Apr 2024 13:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712929462;
	bh=A6BCPGJ14ENBTg9zhAGY9Mu4ckKO6EuAyGkOaKXiHHc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OFU3Lzy8z+yqS3ejO+Tcv7VXdremci/vj/siJdZYf2xB1NQB2tC6yhrDX6BmYb/vG
	 gj9m4waCMEED7nkXBaFWXY0jw81LE1NUtmZqdp5dOCcU7lEVvXpd62xtEygRfM+JPj
	 Ssqy/+9duN9wzsIz2K/PXiDoPy7ab6vxcuICJ+itpIdKDz8s7zIRNJGAhMPV+3Ylcj
	 X1erVsCLV/qeHr4iWxzon2l1smWICW6MaHR1og5iZWg9H1osBPf8OeT0BxksQ9XINi
	 Y9SdTJmkF2gSR4aLOb6HxZbpfbNq4MezBkqNo3Pr1rBKx2vVnk3QxyIWGCdcaO6gye
	 T/4IGBmBS297g==
From: Michael Walle <mwalle@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	Michael Walle <mwalle@kernel.org>
Subject: [PATCH v1 4/6] mtd: spi-nor: remove .setup() callback
Date: Fri, 12 Apr 2024 15:44:03 +0200
Message-Id: <20240412134405.381832-5-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240412134405.381832-1-mwalle@kernel.org>
References: <20240412134405.381832-1-mwalle@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_064425_879778_AEA9BA58 
X-CRM114-Status: GOOD (  21.73  )
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

There is no flash driver using that hook. The original intention was to
let the driver configure special requirements like page size an opcodes.
This is already possible by other means and it is unlikely a flash will
overwrite the (more or less complex) setup function.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/mtd/spi-nor/core.c | 105 ++++++++++++++++---------------------
 drivers/mtd/spi-nor/core.h |   5 --
 2 files changed, 45 insertions(+), 65 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 65e6531ada0a..bbfef7b3997f 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2568,8 +2568,51 @@ static int spi_nor_select_erase(struct spi_nor *nor)
 	return 0;
 }
 
-static int spi_nor_default_setup(struct spi_nor *nor,
-				 const struct spi_nor_hwcaps *hwcaps)
+static int spi_nor_set_addr_nbytes(struct spi_nor *nor)
+{
+	if (nor->params->addr_nbytes) {
+		nor->addr_nbytes = nor->params->addr_nbytes;
+	} else if (nor->read_proto == SNOR_PROTO_8_8_8_DTR) {
+		/*
+		 * In 8D-8D-8D mode, one byte takes half a cycle to transfer. So
+		 * in this protocol an odd addr_nbytes cannot be used because
+		 * then the address phase would only span a cycle and a half.
+		 * Half a cycle would be left over. We would then have to start
+		 * the dummy phase in the middle of a cycle and so too the data
+		 * phase, and we will end the transaction with half a cycle left
+		 * over.
+		 *
+		 * Force all 8D-8D-8D flashes to use an addr_nbytes of 4 to
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
+		dev_dbg(nor->dev, "The number of address bytes is too large: %u\n",
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
+static int spi_nor_setup(struct spi_nor *nor,
+			 const struct spi_nor_hwcaps *hwcaps)
 {
 	struct spi_nor_flash_parameter *params = nor->params;
 	u32 ignored_mask, shared_mask;
@@ -2626,64 +2669,6 @@ static int spi_nor_default_setup(struct spi_nor *nor,
 		return err;
 	}
 
-	return 0;
-}
-
-static int spi_nor_set_addr_nbytes(struct spi_nor *nor)
-{
-	if (nor->params->addr_nbytes) {
-		nor->addr_nbytes = nor->params->addr_nbytes;
-	} else if (nor->read_proto == SNOR_PROTO_8_8_8_DTR) {
-		/*
-		 * In 8D-8D-8D mode, one byte takes half a cycle to transfer. So
-		 * in this protocol an odd addr_nbytes cannot be used because
-		 * then the address phase would only span a cycle and a half.
-		 * Half a cycle would be left over. We would then have to start
-		 * the dummy phase in the middle of a cycle and so too the data
-		 * phase, and we will end the transaction with half a cycle left
-		 * over.
-		 *
-		 * Force all 8D-8D-8D flashes to use an addr_nbytes of 4 to
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
-		dev_dbg(nor->dev, "The number of address bytes is too large: %u\n",
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
-static int spi_nor_setup(struct spi_nor *nor,
-			 const struct spi_nor_hwcaps *hwcaps)
-{
-	int ret;
-
-	if (nor->params->setup)
-		ret = nor->params->setup(nor, hwcaps);
-	else
-		ret = spi_nor_default_setup(nor, hwcaps);
-	if (ret)
-		return ret;
-
 	return spi_nor_set_addr_nbytes(nor);
 }
 
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 9aa7d6399c8a..8552e31b1b07 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -369,10 +369,6 @@ struct spi_nor_otp {
  * @convert_addr:	converts an absolute address into something the flash
  *                      will understand. Particularly useful when pagesize is
  *                      not a power-of-2.
- * @setup:		(optional) configures the SPI NOR memory. Useful for
- *			SPI NOR flashes that have peculiarities to the SPI NOR
- *			standard e.g. different opcodes, specific address
- *			calculation, page size, etc.
  * @ready:		(optional) flashes might use a different mechanism
  *			than reading the status register to indicate they
  *			are ready for a new command
@@ -404,7 +400,6 @@ struct spi_nor_flash_parameter {
 	int (*quad_enable)(struct spi_nor *nor);
 	int (*set_4byte_addr_mode)(struct spi_nor *nor, bool enable);
 	u32 (*convert_addr)(struct spi_nor *nor, u32 addr);
-	int (*setup)(struct spi_nor *nor, const struct spi_nor_hwcaps *hwcaps);
 	int (*ready)(struct spi_nor *nor);
 
 	const struct spi_nor_locking_ops *locking_ops;
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
