Return-Path: <SRS0=9wI6=I7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FORGED_HOTMAIL_RCVD2,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE6D3C433B4
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Apr 2021 20:17:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41B7B6112E
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Apr 2021 20:17:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41B7B6112E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=hotmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G+N6WU5D2dbniRbxLyl2REB9uSaw3ArqBU/Q5RJBVgo=; b=SgZj02LVQ59tlh0E8ei4NtLcwB
	ijPUtInQN6hJSvHfFXTxKEA1NkpTw59c0cxeS6oF0M1k8RQg9iLzFLeFKvQvMXrN6GU7HzsgNaF4r
	Z7r0/iB6euaAgbOSWn+T+kqdK7WJnHp4hP5U/Lfezbt99u9rNeJuMlaN49DIZgsNOKDNGv+YVa1OY
	Rk2JX42hSRDeIeZZItD93NteNYBzYDUd0M7bAUHDsLw6VPGWuAJkKZCJE1csc+PKmZ6MTFY1PnyX/
	iJhGj1Plrzt4Cp4C1Chm7qemFzxS+7efRpLepIrC3xKSXuBUQbsDHul5kXFgjnXikByWxSmYX1Us+
	lbeYIBxQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lSQDR-00Dmpb-BV; Fri, 02 Apr 2021 20:16:25 +0000
Received: from mail-oln040092003080.outbound.protection.outlook.com
 ([40.92.3.80] helo=NAM02-BL2-obe.outbound.protection.outlook.com)
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lSQDM-00DmoO-Uh
 for linux-mtd@lists.infradead.org; Fri, 02 Apr 2021 20:16:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GaYTda7BAqWFWOfRQE4K44ByLUVkoevAZ5OKPNCmqtO7DKIg4ODoV+J3l3TpeYF4/BqYpJO0AmHZwu+tGdzE+BuOsjcUszY3FIzMrx1u4CQN1QRqqw8CfciNL19G2Rlu1qLXPFyXjxTqgKWYdlDxooC7Xo6YSdnpyztrNX0pTWIx9BJv+i/8Lf9WYOGqywzik4V70e/H0kwDyVVZrOeqak3de71eMrqHz+zaoHDDZhWLSMbwDm4JIlkqeNN3zNmZKQg6cccNulrOklVP0S+r6eDZs0T+v9mUdZBo/JQSCaAzyetxG+GavYTwbgcpccyuw71acOSotXKDaR8hADepHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qif8IuaFfi/l/tAAdV2pqcyIJTjEDBoKHsQy+oKw260=;
 b=K76j3HawytU/IDoGCBDhdTz5/NRQaOpcCjjOb+C2uM7dp2GJWeBnPYzbwM1g55h8hjEPKnfwKZJlqCEjh7N1jV3qL7beYFsc95MwUoXtagKSo5CX7hV/SAKhbTsoY5HJFcmuY6YCKRbCu9n3EaQ+q32K6QV4Rb1bVLVBxI5hklFTgUahRabjeczc+bxE+JlQ2GxuxL9fioOey968bEKgNSLTHt4AwvkBiLrx63XITg80NqzIuHN7vqe2xy6W9GVsyHubSDoE+NGJ1vfdpz6r6ukSL0YD1If8TZ93GH+pmGJgODfUMFn3UqqoSLh/GUXoufyzdQDasYe2zZS0e3/idA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qif8IuaFfi/l/tAAdV2pqcyIJTjEDBoKHsQy+oKw260=;
 b=suV9Dz/dIZBpOZFbprQNuYHEBlZPWDLIl9cVqINDLMXwOvo1irw8KEDAZiEMGwXU5GMhJe7LOaqiXtn8i9BI4d2+vO37i5DfbkXjMLShHWDcT6g31iZ42/6l1eGdm5X47tw+SVeY3t4cPsRe3n3uOO95/jIhA6YmMwakzdGWos2usymwc+lqGCwufHSp1ZloK2OEKPhCPsccXDBAUQNyW9PY+TsaQHGNUg7AGgbh4omEsxshp/IBi+K4G+P3zkPBumyCU2FwzGx/Dg0pELI+X6/IJPtRSb+nYC7h8Oe4j7BsP0JeTssave3jk08kFvPCPSR88XjI8prSwq2kQJNAOg==
Received: from BL2NAM02FT049.eop-nam02.prod.protection.outlook.com
 (10.152.76.55) by BL2NAM02HT131.eop-nam02.prod.protection.outlook.com
 (10.152.76.160) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.28; Fri, 2 Apr
 2021 20:16:17 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 (2a01:111:e400:7e46::4c) by BL2NAM02FT049.mail.protection.outlook.com
 (2a01:111:e400:7e46::374) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25 via Frontend
 Transport; Fri, 2 Apr 2021 20:16:17 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:FC25B97752CA91F17D24ECA29BF707E8C4C38FB84D548D6DA335784C6F480EA1;
 UpperCasedChecksum:4C339816CB7C544171792A8F085A2AE1CD35C343C4A99DC0F6593EA9FAD111B7;
 SizeAsReceived:7395; Count:45
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::fc38:a692:c2c8:f63e]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::fc38:a692:c2c8:f63e%7]) with mapi id 15.20.3999.028; Fri, 2 Apr 2021
 20:16:17 +0000
From: Chris Morgan <macromorgan@hotmail.com>
To: linux-mtd@lists.infradead.org
Cc: Chris Morgan <macromorgan@hotmail.com>, vigneshr@ti.com, richard@nod.at,
 miquel.raynal@bootlin.com, tudor.ambarus@microchip.com
Subject: [PATCH] mtd: spi-nor: XTX: Add support for XTX XT25F128B
Date: Fri,  2 Apr 2021 15:15:56 -0500
Message-ID: <SN6PR06MB5342C82F372F37FB8E21B327A57A9@SN6PR06MB5342.namprd06.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
X-TMN: [Qs13UiebeN5updz/PCHPr8SNy1QQ8KZ/]
X-ClientProxiedBy: SA0PR12CA0028.namprd12.prod.outlook.com
 (2603:10b6:806:6f::33) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <20210402201556.7440-1-macromorgan@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wintermute.localdomain (76.183.134.35) by
 SA0PR12CA0028.namprd12.prod.outlook.com (2603:10b6:806:6f::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.28 via Frontend Transport; Fri, 2 Apr 2021 20:16:16 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 45
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 8f4316a8-1a78-4f14-b34d-08d8f6142bce
X-MS-Exchange-SLBlob-MailProps: =?us-ascii?Q?dwOyuT5lair9+a+WhVfFDuSGdhDFWVMdOqhs/YxoFZ79P5i9PJhxm5Be/XDp?=
 =?us-ascii?Q?NCIsMUqwNNYIocccT+ofOajapzry9Mkj0O16PuUCLhHpRsLUyQzVMubC0+I+?=
 =?us-ascii?Q?MErNl0B6Dv7IVKmWyXBT+swARjpEJMQ+GYmKCZ8aPaDOrYsPgPtg9ZAIVjcN?=
 =?us-ascii?Q?QrLDGlA2Eytvdd4OdHZaVK5qzTCkJlCCFd1jGoVwlXK0TJmdYcU/xOcc9QMc?=
 =?us-ascii?Q?cHIjMAeV0m8MzlJnnKOBOmQT9lpm5nb0RNjWYjrBdEnOpomG6QZPFsUbkFD9?=
 =?us-ascii?Q?9WeTiKRArtdAJgyS2RjoBMlpB+QWbs10XqDD3xKgSoeghKOglMdEmwZl24xE?=
 =?us-ascii?Q?0wWwEKkzk6RLyzIIu8QCjI+ha/Q+lRDkbIHYRRB3dPNYr6hHdc6bYXJq2xK8?=
 =?us-ascii?Q?XxMNU4L7Jj3fFwen2j8q5SpNEdnTCFeHV+KMFEY8p8Iw1ABaRx9Bk1M/Mj8d?=
 =?us-ascii?Q?tQSTZcI2YHlYTrMNRc4DKld6Jk3VJUvALPKe81UbinSxq5uAetPs2ZL85zBO?=
 =?us-ascii?Q?mNly5PoR3hYu2a0RSShOiy0+zHK2DhklFUKhkUAa8vqj7w6y2IoMWjVIvICj?=
 =?us-ascii?Q?gyLTdxE2elhn4hT0wP7SBF61lE2/rD/Kl/uHKALultLNT0kt334inoIdrdQw?=
 =?us-ascii?Q?eFaDZoLZ6PPkWLqQHgJfElhU/D7myOKqEYGP/iiRb/5vLPcaDk2gfar3vKVk?=
 =?us-ascii?Q?qZ1ePPff6KE0U6FmDViaKApN8CYbjP3nsV1gEizNFlz2xXf9QfzyfYFw3LUf?=
 =?us-ascii?Q?fxA66c1Yjq193KY2yfCbPQI0G/v0iG3nDtq3y6U60cZRSTEeBVlAK78gNzAd?=
 =?us-ascii?Q?HwecMmEHGyIeLfu/1lfVJ3Qo9Bi/X0I0I6obAsCUtr+BpUgDr4zeswPcWFhw?=
 =?us-ascii?Q?6GonOxN7rRaQ8AZPV41EJl92y1voxV6oCklHVEhRwqZ64uBqkp607Avz2iYV?=
 =?us-ascii?Q?e4tY60dPswqyBT3fuIYlGrE6D4MzPcdUTjc/JKKHel4f2tamSHFl1rhvhE2g?=
 =?us-ascii?Q?8Gn0?=
X-MS-TrafficTypeDiagnostic: BL2NAM02HT131:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cDaCwYILIzwpP8IrTEdxuhaouL+UszfqWLEv6vHLS95tve1H33L87jdTbvFgROBCqR0QWnTai1I8nZ7Bxj14QatBA8iAVQLTIRorcIQA7uFM+EoK19U5/oVoKg9DSURX0PbQ4CGj0ueu0wJnWOfmaMTWgeIfrHPh2/F7PxbdpJKTA8JHCWTwBadOOLrvNusccFt743ZMa8fJx2oLLlwLJAkvnJWoghdx45DYkKyE+ouwi0gK0CMFz/X7je0GaXg7lKtcPPpfsmj3ccehI1sUSlDuzyZgafovTiRqqI+LI55S/pVPw1QTcjiblLWRCtdlQ3DEXcMvMgZf3oSfP6WNy2j+lqHnNod1Id98WurCzCmmjKJ7sdWd27woMDWagITUJKUvxE0koyXh7J8VAkwQbFAPiJEY4Iud1bKuGIFl7Cs=
X-MS-Exchange-AntiSpam-MessageData: UmbdzHidlmBw8xXt0cMdQcZwekHlKqCUeAwoHzSN1Dtj4xQYY7W6rvTB4lXjB+KVo+0b3acUYKd79nFaZ5JyDLZaLeY48ara2JfzjGO0vhzJfvt8/IxVvokwQ6iwf8i6cPHdf82KcutwfrBLpsWslA==
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f4316a8-1a78-4f14-b34d-08d8f6142bce
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2021 20:16:17.1034 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT049.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL2NAM02HT131
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210402_211621_179768_172B7F00 
X-CRM114-Status: GOOD (  18.19  )
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

Add support for a new vendor (XTX) along with a new chip from the
vendor (XT25F128B). This chip is used in the Odroid Go Advance,
and has been tested extensively using the spi-gpio driver, as it
is connected to a serial flash controller that is not currently
supported (but the pins can be repurposed to GPIO). Read, write, and
erase all work as expected.

Datasheet can be found here:
https://datasheet.lcsc.com/szlcsc/2005251034_XTX-XT25F128BSSIGT_C558844.pdf

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/mtd/spi-nor/Makefile |  1 +
 drivers/mtd/spi-nor/core.c   |  1 +
 drivers/mtd/spi-nor/core.h   |  1 +
 drivers/mtd/spi-nor/xtx.c    | 24 ++++++++++++++++++++++++
 4 files changed, 27 insertions(+)
 create mode 100644 drivers/mtd/spi-nor/xtx.c

diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
index 653923896205..3f7a52d7fa0b 100644
--- a/drivers/mtd/spi-nor/Makefile
+++ b/drivers/mtd/spi-nor/Makefile
@@ -17,6 +17,7 @@ spi-nor-objs			+= sst.o
 spi-nor-objs			+= winbond.o
 spi-nor-objs			+= xilinx.o
 spi-nor-objs			+= xmc.o
+spi-nor-objs			+= xtx.o
 obj-$(CONFIG_MTD_SPI_NOR)	+= spi-nor.o
 
 obj-$(CONFIG_MTD_SPI_NOR)	+= controllers/
diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 0522304f52fa..9a89ec473e4b 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2215,6 +2215,7 @@ static const struct spi_nor_manufacturer *manufacturers[] = {
 	&spi_nor_winbond,
 	&spi_nor_xilinx,
 	&spi_nor_xmc,
+	&spi_nor_xtx,
 };
 
 static const struct flash_info *
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 4a3f7f150b5d..ee0e45eaffcd 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -425,6 +425,7 @@ extern const struct spi_nor_manufacturer spi_nor_sst;
 extern const struct spi_nor_manufacturer spi_nor_winbond;
 extern const struct spi_nor_manufacturer spi_nor_xilinx;
 extern const struct spi_nor_manufacturer spi_nor_xmc;
+extern const struct spi_nor_manufacturer spi_nor_xtx;
 
 void spi_nor_spimem_setup_op(const struct spi_nor *nor,
 			     struct spi_mem_op *op,
diff --git a/drivers/mtd/spi-nor/xtx.c b/drivers/mtd/spi-nor/xtx.c
new file mode 100644
index 000000000000..4eec737e94c7
--- /dev/null
+++ b/drivers/mtd/spi-nor/xtx.c
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2021, Chris Morgan <macromorgan@hotmail.com>
+ * Based on XMC SPI NOR module
+ * Copyright (C) 2005, Intec Automation Inc.
+ * Copyright (C) 2014, Freescale Semiconductor, Inc.
+ */
+
+#include <linux/mtd/spi-nor.h>
+
+#include "core.h"
+
+static const struct flash_info xtx_parts[] = {
+	/* XTX (XTX Technology Limited) */
+	{ "XT25F128B", INFO(0x0b4018, 0, 64 * 1024, 256,
+			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			     SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
+};
+
+const struct spi_nor_manufacturer spi_nor_xtx = {
+	.name = "xtx",
+	.parts = xtx_parts,
+	.nparts = ARRAY_SIZE(xtx_parts),
+};
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
