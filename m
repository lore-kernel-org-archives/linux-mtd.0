Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C6D7C433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Dec 2021 10:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9eQrc8ZnkxVNevlzjUWv7T5b76nAWSpjcqgSh6zq6j8=; b=IZVyT4GC7+clXD
	Y3FDsEI4mSv2a6kKArmXp4ooPoWcyT04xGgMfOk2ESoJ0nONcu83BgLghDvOeQj0QpylVEmuna5Hy
	dOoKTeDiOdp2lD0CTqAt3PCZY3i+AXvkTvSHzbvTIEDZvC1/Mbnvxjx7yrAGBsThDZjPxbf4hsq4c
	8woCyvIY+gd7r8V3Hyf4RFwwy08aMmMdBtzLeOVCsONz/2CPm3ABQ8Ldk+kMKA46N4aCTMdNZlCOz
	aE5rUI8S/rzP8x2hscuPf6x5b0khPgfZhjfJGkWZGVIBsfiRO3azHRJT7NMQyAdrOG//GA6Qxcc9V
	w6wKC04BUCcmsHR5C5Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvGLn-00FXQQ-OI; Thu, 09 Dec 2021 10:08:31 +0000
Received: from mail-vi1eur05on2097.outbound.protection.outlook.com
 ([40.107.21.97] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvGLi-00FXNt-61
 for linux-mtd@lists.infradead.org; Thu, 09 Dec 2021 10:08:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d/Se2dVX/BPPafKqbW5tvC3UvFyGB7791LYPXDQfafsiCHFJ2t3JO1C2fmGDH8tfpjRESqEuHiPlF5uhh9wwjqjVOyf33NZRErvgCLWSzaVy2gSQs0h7IrOtiZ53MLnhnZxLDmC8g+BPYKBlK2ZnLPtzAFd7JXU8tHwKSR8sRJaRq85bCnuws15WgMmxKcUr3AUSS3f+lCnPjnIj6jFebzKUSVTP22EiSiOmE/Ubj1BbqGZWPfopG7yH6DmRTf7ecGKKDKo6x9/Wo1AnrX6HW9yRCgjQspPhFrRDNhed5cT3v83w5lrqNlNbLH36e5HB4IWnsdPoONpMOEzbdc4Zmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q9/ad6WY8keWTZzt3EuyWxwhErr+3x6Zpt734Zu3ICk=;
 b=U9sqNf4rCREHUiqUlqSzA/Jqw+8YdGA27eoAkyVA+wPrEShzaD0H/8CWbcWPgCoW4hdtrQT3x2KFM4tvXotsOd77UeO0rfmgyZUZpCb09jcWYwLwcpGh9Nmb9t0FvoFUjGYyFHQM+2y0ymjeL/Ph4wjqOexkxgHigFN+5hcw9Lu2aXaed+0KUVVTmLKP6PZDikiLASxcg4uft/RSVvenyoV4WnbXOLr7RGgFO7NEssCwfoT3TmBJheSDZT64UuFurji+GepLZejJB4uF81go0S7Kf+pfj4MARlaJ+y3F9osp2m5jwKPDO/3B1YoSJWTAIEkO0U/9EIl5DywK5onHsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 131.228.2.8) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nokia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nokia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com; 
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q9/ad6WY8keWTZzt3EuyWxwhErr+3x6Zpt734Zu3ICk=;
 b=FsTNqdcY6N62bBV/sjrZ/a+rdAK+kMpp1ZpDjeF/n25pHQiGtgb8NjYdkhutV0o8utr4CaEpLVsbI3tGDUfi91d/HGKrGmHY87kikjbGdX1R8C1OiYw48y+MQWbwcQySJIRXqCbmLECpYlq2/pBnbhSmW2AefZTAdgNEiWbDfJg=
Received: from DB8PR03CA0021.eurprd03.prod.outlook.com (2603:10a6:10:be::34)
 by PR3PR07MB8210.eurprd07.prod.outlook.com (2603:10a6:102:175::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.5; Thu, 9 Dec
 2021 10:08:20 +0000
Received: from DB5EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:be:cafe::8b) by DB8PR03CA0021.outlook.office365.com
 (2603:10a6:10:be::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.19 via Frontend
 Transport; Thu, 9 Dec 2021 10:08:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 131.228.2.8)
 smtp.mailfrom=nokia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nokia.com;
Received-SPF: Pass (protection.outlook.com: domain of nokia.com designates
 131.228.2.8 as permitted sender) receiver=protection.outlook.com;
 client-ip=131.228.2.8; helo=fihe3nok0734.emea.nsn-net.net;
Received: from fihe3nok0734.emea.nsn-net.net (131.228.2.8) by
 DB5EUR03FT023.mail.protection.outlook.com (10.152.20.68) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4778.12 via Frontend Transport; Thu, 9 Dec 2021 10:08:20 +0000
Received: from ulegcparamis.emea.nsn-net.net (ulegcparamis.emea.nsn-net.net
 [10.151.74.146])
 by fihe3nok0734.emea.nsn-net.net (GMO) with ESMTP id 1B9A8HIY012620;
 Thu, 9 Dec 2021 10:08:17 GMT
From: Alexander A Sverdlin <alexander.sverdlin@nokia.com>
To: linux-mtd@lists.infradead.org
Cc: Alexander Sverdlin <alexander.sverdlin@nokia.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] mtd: spi-nor: Introduce erase_proto
Date: Thu,  9 Dec 2021 11:08:12 +0100
Message-Id: <20211209100813.61713-1-alexander.sverdlin@nokia.com>
X-Mailer: git-send-email 2.10.2
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 347b749c-9f70-4d0e-b966-08d9bafbd3fb
X-MS-TrafficTypeDiagnostic: PR3PR07MB8210:
X-Microsoft-Antispam-PRVS: <PR3PR07MB82105DC10C85A10E3FE7711588709@PR3PR07MB8210.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XEpVU80b7RNx8A+Te7emiq8w71GG6Mr1HevddWPtjC+MFmEDjmKTbE4F/vJ1uMgcuSnkZtJTaBO01Qr2P/jylX7BclxfCbZylcNj75GhFMiCT38M2G/ri487Y5mDzpyIF9CELw6mVyw6ZMFM8H4bUvqxOXo6Kdic6TSYuETPu1McSg0HIFDU25nGVllFPcBHfdX5yWUtn1xsWuevEOfq01yTAR+vJqswhUnh1saEhTNckIdnPcDRnoq+dQU2SaVLXl6dLQSQ1ZpkX67nwmbdoTdPbwIvra1e3/7Nm+2rSOMcXE2kw1oRwMRtDyJSBZRnQnM3eA0jzvDnVUrXFfgD5zZS7z5VKsfxs+M8MHLdAeY890jYliRn5f8tlv+WlT+vQcQcez0PHNHCyZzcJcxqCtit46pBhISJhdM/+O+TXfRL1llNy2jr26EN+yFl4ZR3+F9tL5XHri5vGqwPaF9/oI5iTj0YJgDWK+yl007yflFZE/aHZMFTe2FJChbAlOW7uQ4l0Q+oocE7mDtpo/ql0QGZXNBr6IvvH5EgzIUkAoZMzlTsl0Gd/XAMEBdazbMLzHuXolkIfCmFwouqLTcxqQNnFq18OjaevetSQGYZOSHkH7MT4ROcI2812ZXl74r3hq3IxD2mvI/RlIRcazloouMQwc7GXvmdJPcFTW714KXNUTTJAo44NzaEE8XWOeJ4JDuf9WRiU3iYAysPuIORuOB7bCzB/gKqDhzCZ054pib3pEYOnMAUbOhZIlWyz+ynFa6IOUfphPXkQs7lpEdc5DuWbYtPH6w0ucQWKbvCs7Q=
X-Forefront-Antispam-Report: CIP:131.228.2.8; CTRY:FI; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:fihe3nok0734.emea.nsn-net.net; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(40470700001)(186003)(336012)(5660300002)(54906003)(6916009)(2616005)(70586007)(316002)(6666004)(2906002)(1076003)(70206006)(47076005)(36860700001)(8676002)(82960400001)(4326008)(82310400004)(36756003)(40460700001)(86362001)(26005)(356005)(508600001)(81166007)(8936002)(83380400001)(36900700001);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2021 10:08:20.4589 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 347b749c-9f70-4d0e-b966-08d9bafbd3fb
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5d471751-9675-428d-917b-70f44f9630b0; Ip=[131.228.2.8];
 Helo=[fihe3nok0734.emea.nsn-net.net]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR07MB8210
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_020826_337224_5007EB78 
X-CRM114-Status: GOOD (  14.42  )
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

From: Alexander Sverdlin <alexander.sverdlin@nokia.com>

I've been looking into non-working erase on mt25qu256a and pinpointed it to
be write_proto 1-4-4 selected from SFDP while the chip only supports 1-1-0
erase.

For now just introduce the separate protocol without functional change and
leave the real fix for the following patch.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
---
 drivers/mtd/spi-nor/core.c  | 9 ++++++---
 include/linux/mtd/spi-nor.h | 4 +++-
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 2e21d5a..dcd02ea 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -177,7 +177,7 @@ static int spi_nor_controller_ops_write_reg(struct spi_nor *nor, u8 opcode,
 
 static int spi_nor_controller_ops_erase(struct spi_nor *nor, loff_t offs)
 {
-	if (spi_nor_protocol_is_dtr(nor->write_proto))
+	if (spi_nor_protocol_is_dtr(nor->erase_proto))
 		return -EOPNOTSUPP;
 
 	return nor->controller_ops->erase(nor, offs);
@@ -1186,7 +1186,7 @@ static int spi_nor_erase_chip(struct spi_nor *nor)
 				   SPI_MEM_OP_NO_DUMMY,
 				   SPI_MEM_OP_NO_DATA);
 
-		spi_nor_spimem_setup_op(nor, &op, nor->write_proto);
+		spi_nor_spimem_setup_op(nor, &op, nor->erase_proto);
 
 		ret = spi_mem_exec_op(nor->spimem, &op);
 	} else {
@@ -1331,7 +1331,7 @@ int spi_nor_erase_sector(struct spi_nor *nor, u32 addr)
 				   SPI_MEM_OP_NO_DUMMY,
 				   SPI_MEM_OP_NO_DATA);
 
-		spi_nor_spimem_setup_op(nor, &op, nor->write_proto);
+		spi_nor_spimem_setup_op(nor, &op, nor->erase_proto);
 
 		return spi_mem_exec_op(nor->spimem, &op);
 	} else if (nor->controller_ops->erase) {
@@ -2727,6 +2727,9 @@ static void spi_nor_late_init_params(struct spi_nor *nor)
 	 */
 	if (nor->flags & SNOR_F_HAS_LOCK && !nor->params->locking_ops)
 		spi_nor_init_default_locking_ops(nor);
+
+	if (!nor->erase_proto)
+		nor->erase_proto = nor->write_proto;
 }
 
 /**
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index fc90fce..23a901b 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -381,7 +381,8 @@ struct spi_nor_flash_parameter;
  * @cmd_ext_type:	the command opcode extension type for DTR mode.
  * @read_proto:		the SPI protocol for read operations
  * @write_proto:	the SPI protocol for write operations
- * @reg_proto:		the SPI protocol for read_reg/write_reg/erase operations
+ * @reg_proto:		the SPI protocol for read_reg/write_reg operations
+ * @erase_proto:	the SPI protocol for erase operations
  * @sfdp:		the SFDP data of the flash
  * @controller_ops:	SPI NOR controller driver specific operations.
  * @params:		[FLASH-SPECIFIC] SPI NOR flash parameters and settings.
@@ -408,6 +409,7 @@ struct spi_nor {
 	enum spi_nor_protocol	read_proto;
 	enum spi_nor_protocol	write_proto;
 	enum spi_nor_protocol	reg_proto;
+	enum spi_nor_protocol	erase_proto;
 	bool			sst_write_second;
 	u32			flags;
 	enum spi_nor_cmd_ext	cmd_ext_type;
-- 
2.10.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
