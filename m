Return-Path: <SRS0=AumS=GX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE0CFC433DB
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Jan 2021 13:21:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D41723359
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Jan 2021 13:21:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D41723359
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JzXtaswdF4uJnSnHynY3VgBvdCTskHIsx7CO8tb3yEM=; b=R5oAScFQ7gJqUO+kPkqQfo+Ll
	31fkuPzkfqaDvZ0MB3QtKQk/wJbnMumA3b/X3PlQ2+4dUbPeu3EZHsqqag4vL+auj9F3LuXzg+XA2
	BnDCw4xrUCEwJQmUwTLyENEC0Tn4gZ5YqqWPzTPeRslvHqDW/Y/67yOM0DvxVpyoXhbGV3XYDee5L
	4CoH1VXH22Is9A3/E0LhUYEojuAXzwNjOLzSbZ8Dc6E6+FBgGfTSwR4NLy6IETYGcn+HhgOt/y+Ev
	9lW6dpF9PQjTDd5d9OICgNH7xEVqeJXOcjuPAQts07TgK+0H/oDNl8erhUmv3GSSajmK0cGh05Bmk
	IFf7YyvMg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2DPD-0001RZ-PB; Wed, 20 Jan 2021 13:20:15 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2DOX-00016E-19
 for linux-mtd@lists.infradead.org; Wed, 20 Jan 2021 13:19:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1611148773; x=1642684773;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Nu0DWecPAvplEFUztuBszcCe7KUNT4UBQzzQs4ZKFo0=;
 b=crAzldpc2C5orPCZzVcztdrFFytEjzw79GLGwE7lkEPW8f5OWVN9jDB5
 XBz3a1MlkiUaFyOZ2JKQtsamn8UFgOidBRwYWJ62j4e2B/EveO3N5yxXS
 4TpPx8oL47Q0d2uRwCFBxJDYtkMW1S4S1Yz0hLvc3DZE2HpG/l3MI3jol
 df7sKLMfR2mptW6hsLeCkwAtqOchm9+fiXrDLQ5R5X7DmNMmSJkJmbdo2
 m0xY0KSz+s9A/ZYw1x3D1llbNu5d2qV/qV8jBGan5YtvzHXRSffzZ+yRO
 XqGbJs6GrWQeKg17XtwdOaj2f44OzRTYBDB8GR4264G/UDg1yL/OnRleU g==;
IronPort-SDR: RMswkpPqUOQAYorY/yLoY5ZCKWZHqUaXFqjyw0qI2mjtYZrhZ0mhPPfKtzCeAmVZScD+8Kn0J9
 HOFXxCvz1i57rGbCHpMH7OjHa7EcHdHX5ozMBXtCfobV5eTM7mkw+r4vXIIG7vhpa1cWj3JWW6
 XBHZz/FPdSSCcajgcy9EdGee0Med7SelV15D25cVVrU7dqKjmguuvLTDTAdFRVgFX0JuXxbCRG
 qPS8ot51TmUmyzEb7r+ThB3I6mhhtR5wSu9F5UfCieU4/2tOhZEceSNzxUC1CncvkJwnX8bXqT
 Khw=
X-IronPort-AV: E=Sophos;i="5.79,361,1602572400"; d="scan'208";a="106102990"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 20 Jan 2021 06:19:32 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 20 Jan 2021 06:19:21 -0700
Received: from atudor-ThinkPad-T470p.amer.actel.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Wed, 20 Jan 2021 06:19:19 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>
Subject: [PATCH v2 2/2] mtd: spi-nor: sst: Add support for Global Unlock on
 sst26vf
Date: Wed, 20 Jan 2021 15:19:14 +0200
Message-ID: <20210120131914.277363-2-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210120131914.277363-1-tudor.ambarus@microchip.com>
References: <20210120131914.277363-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210120_081933_249104_C05B52D4 
X-CRM114-Status: GOOD (  15.05  )
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

Even if sst26vf shares the SPINOR_OP_GBULK opcode with
Macronix (ex. MX25U12835F) and Winbound (ex. W25Q128FV),
it has its own Individual Block Protection scheme, which
is also capable to read-lock individual parameter blocks.
Thus the sst26vf's Individual Block Protection scheme will
reside in the sst.c manufacturer driver.

Add support to unlock the entire flash memory. The device
is write-protected by default after a power-on reset cycle
(volatile software protection), in order to avoid inadvertent
writes during power-up. Could do an erase, write, read back,
and compare when MTD_SPI_NOR_SWP_DISABLE_ON_VOLATILE=y.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
v2: s/!ofs/ofs == 0/

 drivers/mtd/spi-nor/sst.c | 38 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 36 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/sst.c b/drivers/mtd/spi-nor/sst.c
index 00e48da0744a..d6e1396abb96 100644
--- a/drivers/mtd/spi-nor/sst.c
+++ b/drivers/mtd/spi-nor/sst.c
@@ -8,6 +8,39 @@
 
 #include "core.h"
 
+static int sst26vf_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
+{
+	return -EOPNOTSUPP;
+}
+
+static int sst26vf_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
+{
+	if (ofs == 0 && len == nor->params->size)
+		return spi_nor_global_block_unlock(nor);
+
+	return -EOPNOTSUPP;
+}
+
+static int sst26vf_is_locked(struct spi_nor *nor, loff_t ofs, uint64_t len)
+{
+	return -EOPNOTSUPP;
+}
+
+static const struct spi_nor_locking_ops sst26vf_locking_ops = {
+	.lock = sst26vf_lock,
+	.unlock = sst26vf_unlock,
+	.is_locked = sst26vf_is_locked,
+};
+
+static void sst26vf_default_init(struct spi_nor *nor)
+{
+	nor->params->locking_ops = &sst26vf_locking_ops;
+}
+
+static const struct spi_nor_fixups sst26vf_fixups = {
+	.default_init = sst26vf_default_init,
+};
+
 static const struct flash_info sst_parts[] = {
 	/* SST -- large erase sizes are "overlays", "sectors" are 4K */
 	{ "sst25vf040b", INFO(0xbf258d, 0, 64 * 1024,  8,
@@ -39,8 +72,9 @@ static const struct flash_info sst_parts[] = {
 	{ "sst26vf016b", INFO(0xbf2641, 0, 64 * 1024, 32,
 			      SECT_4K | SPI_NOR_DUAL_READ) },
 	{ "sst26vf064b", INFO(0xbf2643, 0, 64 * 1024, 128,
-			      SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
+			      SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			      SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
+		.fixups = &sst26vf_fixups },
 };
 
 static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
