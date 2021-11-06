Return-Path: <SRS0=A6BC=PZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4BE6C433F5
	for <linux-mtd@archiver.kernel.org>; Sat,  6 Nov 2021 17:30:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D1496103A
	for <linux-mtd@archiver.kernel.org>; Sat,  6 Nov 2021 17:30:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7D1496103A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dkdhqpojH68xprUG5c2daxUy7CTvwXT0FhPx/MBXTU8=; b=neMT1IKStKvwAT
	kmj+osrf52bhdu7jq2w7+GPEuMLy7GuND6nhAJ6/n1g8jx7IsBOh5vDBohmPOJQg4fODeIT6PtBfg
	Z9fMReRSSh3mlSRnJCOEIoicd5xtn1VoHB1E6cma1uKnv2sZG7B1FL/0Lg1SlvAAEmiFyElu9/GSO
	jov7PHwm7Ob0v9lCqrw/TF25CqsbiGLWcqZ4DDkch74B/ZOkWDmYOoHJSabztLaBgBP/0J8X7Rgck
	6ysBjdF5M/wbarKJnruIth8lmY4FECKunABIPdgufdLlKEuZZbW4tihgO9MRYyAqIKBdO1STwrR6A
	J7rEq2pVK56wiID0rcbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mjPVn-00DK1u-7w; Sat, 06 Nov 2021 17:29:51 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mjOr2-00D8fY-23; Sat, 06 Nov 2021 16:47:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1636217264; x=1667753264;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TCpZvFC40UmuK+6zw7eKEUnGsXsJuBxAp+OcQn/l8TI=;
 b=SPAPGbXwzQxWuGxpnBapVVC6UwNNHYnuTqhqVCJq9WDIwc2X96QC0C0H
 6vOjfH8LVuaB1VZ6bUFPrTuZ3AO3Q7nNogBMdhJGl62Iuw9v9qg4KrXG6
 crZaolKKGpau3Ayur5fYfF7tvMKfjPv+RVNiZVMQG1Q5L4VMZuXwlUmD+
 BpBMASnTKxZvhEJ8YZEkiWaE+oDMOBSJphF+rF3NumUH8BoRgdi24efrq
 j4ep3DHT+yVjB+L/DW9khvmFmUTPCiMXH3ocRNrf6YVaTb5OMuXe8yaU8
 NcGEEewjKVg4P2lz6fbnOIEE1B7h8aaDP+3F3Pb5a/jZTxpOjl+oIZ1ql g==;
IronPort-SDR: qRdRtzD906q7S1vRqJ4/yfNUemMEnplKvglbIKHLClejl7KaL5dbv7ZJ9MxRfRqw6JdFD/oSN2
 8TfXrhEn5ZmJ8+ixNxi13lERUZHWDbclmWg5p2U001eDM2mMZFiN4ps2M7AfniR7Im0VSBP10m
 eXmM9igKc/GbGXcMJAt/LAsLmklA6bpGrlpT7cja5mgHHq/AEQo54V2+HHL3WfRyl6UgUzslnT
 LwIYmZHwfo+prdQ0RcIUt5/ZYhsqn6ilcTBQW1q1vAF4G9ivUnndl9MjrgM1oMJLIgKwWoQXPo
 42HLcY+LgukWZon490jgLzPh
X-IronPort-AV: E=Sophos;i="5.87,214,1631602800"; d="scan'208";a="150948760"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 06 Nov 2021 04:37:19 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Sat, 6 Nov 2021 04:37:17 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Sat, 6 Nov 2021 04:37:13 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>
Subject: [PATCH v3 3/6] mtd: spi-nor: macronix: Handle ID collision b/w
 MX25L12805D and MX25L12835F
Date: Sat, 6 Nov 2021 13:36:54 +0200
Message-ID: <20211106113657.172690-4-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211106113657.172690-1-tudor.ambarus@microchip.com>
References: <20211106113657.172690-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211106_094744_197452_6304F9C2 
X-CRM114-Status: GOOD (  11.45  )
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
Cc: macromorgan@hotmail.com, jaimeliao@mxic.com.tw,
 Tudor Ambarus <tudor.ambarus@microchip.com>, richard@nod.at, esben@geanix.com,
 linux@rasmusvillemoes.dk, knaerzche@gmail.com, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, code@reto-schneider.ch,
 miquel.raynal@bootlin.com, heiko.thiery@gmail.com, sr@denx.de,
 mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

MX25L12835F define SFDP, while MX25L12805D does not.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Tested-by: Heiko Thiery <heiko.thiery@gmail.com>
Acked-by: Pratyush Yadav <p.yadav@ti.com>
---
# cat /sys/devices/platform/soc@0/30800000.bus/30bb0000.spi/spi_master/spi0/spi0
.0/spi-nor/sfdp | xxd -p
53464450000101ff00000109300000ffc2000104600000ffffffffffffff
ffffffffffffffffffffffffffffffffffffe520f1ffffffff0744eb086b
083b04bbfeffffffffff00ffffff44eb0c200f5210d800ffffffffffffff
ffffffffffff003600279df9c06485cbffffffffffff

 drivers/mtd/spi-nor/macronix.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index 58b6cd9b194c..ac3b6ddb5c8d 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -26,6 +26,24 @@ static const struct spi_nor_fixups mx25l3205d_fixups = {
 	.post_bfpt = mx25l3205d_post_bfpt_fixups,
 };
 
+static int mx25l12805d_post_bfpt_fixups(struct spi_nor *nor,
+				const struct sfdp_parameter_header *bfpt_header,
+				const struct sfdp_bfpt *bfpt)
+{
+	/*
+	 * Macronix has a bad habit of reusing flash IDs: MX25L12835F collides
+	 * with MX25L12805D. MX25L12835F defines SFDP tables, while the older
+	 * variant does not.
+	 */
+	nor->name = "mx25l12835f";
+
+	return 0;
+}
+
+static const struct spi_nor_fixups mx25l12805d_fixups = {
+	.post_bfpt = mx25l12805d_post_bfpt_fixups,
+};
+
 static int
 mx25l25635_post_bfpt_fixups(struct spi_nor *nor,
 			    const struct sfdp_parameter_header *bfpt_header,
@@ -70,8 +88,10 @@ static const struct flash_info macronix_parts[] = {
 	{ "mx25u4035",   INFO(0xc22533, 0, 64 * 1024,   8, SECT_4K) },
 	{ "mx25u8035",   INFO(0xc22534, 0, 64 * 1024,  16, SECT_4K) },
 	{ "mx25u6435f",  INFO(0xc22537, 0, 64 * 1024, 128, SECT_4K) },
-	{ "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256, SECT_4K |
-			      SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP) },
+	{ "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256, SPI_NOR_PARSE_SFDP |
+			      SECT_4K | SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP)
+		/* ID collision with mx25l12835f. */
+		.fixups = &mx25l12805d_fixups },
 	{ "mx25l12855e", INFO(0xc22618, 0, 64 * 1024, 256, 0) },
 	{ "mx25r1635f",  INFO(0xc22815, 0, 64 * 1024,  32,
 			      SECT_4K | SPI_NOR_DUAL_READ |
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
