Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9924DCD4F54
	for <linux-mtd@archiver.kernel.org>; Wed, 27 May 2026 17:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XtMYKwKv5tOjvRpM2kGG67guIRxdiaefRgcZqi7n0DQ=; b=JH64l6TwsHCVB3
	vSMnhFNsqVszvBKY93KFiOhaHtiFr4ONDZqnLnHNFJbFeK4qa1LqOj/6lrxCyd7ghMFNcq8F8LX22
	+I4KfZyl1BIyV/FYAgX82bETjDeZ2pTqac6IEMtzE7kimwIUvErK/d5Sm2Xu8RMdS+mZUWR4nXy9e
	SD4PqTxPsSNxRO2UoEnXbpbdnf/gQ/wlQh38zva32Vf/7pJ0dXj4+AZL+G7jSg3CkSlMRFW0wuwVY
	gxjMZSEt980ZCz4qNLF7jab4GFODHQcYjE2Qm+JIOGeUqx5Ai7o+nErbalQRlNhb3HX3nCoboeLMi
	EJplP46khPuYBJjqZ5Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSIUe-00000004boA-35NM;
	Wed, 27 May 2026 17:56:36 +0000
Received: from mail-westus3azon11011019.outbound.protection.outlook.com ([40.107.208.19] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSIUZ-00000004blp-3uVW
	for linux-mtd@lists.infradead.org;
	Wed, 27 May 2026 17:56:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZXIXt2BGRCuwp75xT5f8UkSz3rphUSyoiVqhrKs/yQwzL39j5uTovC1qVMklE1AT+PZN4FaZx4K40gkz7AxNSSqFUyFtd2TbiAkY7jcSoJXUaBgGy3LdFPKTG1tzCkXiqHqcNU3DPRGP0O+aU9uX0H0b2jvSuqkmSyqRrLsHhP1uWlZhhjTd8sabGlsHT5lbQPq4xcd6paAJtiobb5XmzoStZBrokWTvxoTtCpiX/cEJM455jcq9Jv+mnXT7F9a2xqWaWS/ZSr98R2Opb3zTfgplabslVSsTrS+fiF8zt21ElFabm3+hB5bYrGeYsFULhe4xvyrXy8Dy6X3s7l6ohQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3X1IUId+Hzuz475qNDT2KlwVBrZDXf19P3NMP/gh8h8=;
 b=da26kyDSvnoNNHBMUGchoUyw98tzWT+4pduFxrFuut5dppHpOv5JVWcITvEjRVObOZ0d0Uy0x+jNZrdN+9gu9fXjgoOZkGw1SCX6yBXqvkBytawk+Jp4zwnZvL9VzlvSF019EDBzQs0ZMdPBK8YYdvaVD7UKiNGoaeRGkPM9gyyYqWIS1iVLRRbFr1XA8AY92dV5XS0NHKrd3mqC5IYaS3/BLESR/qmdHXg2lMoVJFxO/0l5G0WKU1yD4TsxtVmw5zTG+fFsosclmLR0ZxcPQxZ5ZHBIODPHufISxY1PHx/1lx25scA2DF3tvZK6e3j3nBwIeW9HmokB+TVskO+klw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3X1IUId+Hzuz475qNDT2KlwVBrZDXf19P3NMP/gh8h8=;
 b=nBc33p95w7TZ4ERUH/Juu6F2mHi6Dmp9TE9ZyddSyL2Iaa1EQxiij4TTkfiq3QBpOJEAZy/K0XuzfvTJa+fQZdCvqZaRYsttTjFrTYuAbvJnshBresIfRgGMmB00Pl0/IbAOorWW4bAd8ibwAHBgdSbudDemUl/+KBF6JHJf9Qk=
Received: from MW4PR03CA0206.namprd03.prod.outlook.com (2603:10b6:303:b8::31)
 by MW4PR10MB6371.namprd10.prod.outlook.com (2603:10b6:303:1ea::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 17:56:27 +0000
Received: from CO1PEPF00012E61.namprd05.prod.outlook.com
 (2603:10b6:303:b8:cafe::24) by MW4PR03CA0206.outlook.office365.com
 (2603:10b6:303:b8::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.13 via Frontend Transport; Wed, 27
 May 2026 17:56:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CO1PEPF00012E61.mail.protection.outlook.com (10.167.249.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Wed, 27 May 2026 17:56:26 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 27 May
 2026 12:56:25 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 27 May
 2026 12:56:25 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 27 May 2026 12:56:25 -0500
Received: from santhoshkumark.dhcp.ti.com (santhoshkumark.dhcp.ti.com [172.24.233.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64RHtYpl4052476;
	Wed, 27 May 2026 12:56:20 -0500
From: Santhosh Kumar K <s-k6@ti.com>
To: <broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
	<vigneshr@ti.com>, <pratyush@kernel.org>, <mwalle@kernel.org>,
	<takahiro.kuwano@infineon.com>
CC: <linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
	<praneeth@ti.com>, <u-kumar1@ti.com>, <a-dutta@ti.com>, <s-k6@ti.com>
Subject: [PATCH v3 09/13] spi: cadence-quadspi: reject 2-byte-address DDR ops on PHY-tunable hardware
Date: Wed, 27 May 2026 23:25:23 +0530
Message-ID: <20260527175527.2247679-10-s-k6@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260527175527.2247679-1-s-k6@ti.com>
References: <20260527175527.2247679-1-s-k6@ti.com>
MIME-Version: 1.0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E61:EE_|MW4PR10MB6371:EE_
X-MS-Office365-Filtering-Correlation-Id: bd878c98-bc76-4c3a-7a54-08debc1945d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|82310400026|36860700016|1800799024|921020|22082099003|18002099003|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info: G3ZBiQ92rAYHYfVE8574+IEUodg7zklgpY9xaaD+3zhMGURnjPCfSvrhx/BYpfFSEXukt/okoIXopGL9YaICSpd+L/i6hYtSx3i+ZjWXCVB8TmQZLHDdtFkfROJKKcATsZXPlzlAulDDUg/LvCJbnbddUl07WUylHozhl8UNGiymOI73airEn/VGQ7QY91sWT8ypITLZQuW8Uk/Lc5OfiECNgK4BA9/9imi5FycqvEtTHWrBYzhMZXJIRGN8vv9YVhPK+aPPORHp8adynraPaPbChlx7BYIPAw7fVGlCw7SIYKCayRDTYJjQje8xjoalDT/tqPIOZ37Bl/hH4QQYlzvDJxjFszjiL4iz+fC4tUB3OP5j4TWGO+zsjk/bX3LXXhwdPgIHDlfKmkXlMBtSFA43XFP6X49hJZumNqVJ0ZhZBZs+lvGSqWdCs/xXq1PrrQ7NBkZm0bX4Mkh5PUOeJp5IcFWwA0xP1QB3SPljDBF0dUz+r+kojY5OJInOtrmzJMt12TJ1AiqX70MSDlJMx7nVy9Y2k2wsr1K7vP/P8gQ26uVtbdOo4c/aHtD6JTc/bv4qA5ErmTgLZI4O5LR510QgvInAgYvGdt78bsUKvnNLjpBsKOncOQXrV5y/mVUcy8K58GyFs7nOfH0b/lAzLy8PzCYpWDA0W/7l8rIMe9jZZBEoEzYc14VbU3DAKyFjlNi9Ap/y3lup3DY3RNRjgkEoBa9T8IKEQaKW/U6I2fxYdVPsADA8MTje29UlUomdi/naIjR4rlFUPyWjvQshkvf9sNcuKzwNS5+5TWs5NCI=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700016)(1800799024)(921020)(22082099003)(18002099003)(6133799003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: LT6cVgNyh2eewOxdKtEKmvwp5rSpUfURG80/CKW+cRns/I71Sv1ifRH1tH4j9Y2Fkl9uSx3a9/MDeY81lsbTF109ogXw6fYHmDzP7NNgeHEMGqwcgr9DxpefIJHVp1JoK2UUqysZCuWe0UM/ZkBx6Co/PfvUBh566MUDhpf19ozbJS1nBbGuLrycr/Zrq0L+uLHg1cTUBratlwQElW6sXV3ehKA46YGsWHfAhBcmGF/Vxh9O6m0KT9WkEN6l5egR6CpE/jvRG4awgBEDVRxlnAwqq1loZcheo9udTS8ll+zQJusdarp/BUFR4WPKLzsY6IWgGLYI7X7gbQmToLpwu1OFJbc11XiykEiQ/207iwVKpipKc28sw2ZUOn7EsIs573NXTo6OkUf5zKDhMsG9swoy2B7SpKwEGB9DElv0u6tCLnjuVqrKG/CAATWEqUU3
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 17:56:26.3640
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd878c98-bc76-4c3a-7a54-08debc1945d3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF00012E61.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6371
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_105631_975747_45C75CED 
X-CRM114-Status: GOOD (  14.69  )
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

Erratum i2383 affects the AM654 OSPI controller: in PHY DDR mode,
operations with a 2-byte address cause an internal state machine to
mis-compare the transmitted address byte count against 1 instead of 2,
locking up the address phase. [0]

Add a CQSPI_NO_2BYTE_ADDR_PHY_DDR quirk flag and set it on the am654_ospi
platform data. In cqspi_supports_mem_op(), when a controller carries this
quirk and has PHY tuning support, reject DDR operations that use 2-byte
addressing.

[0] https://www.ti.com/lit/er/sprz544c/sprz544c.pdf

Signed-off-by: Santhosh Kumar K <s-k6@ti.com>
---
 drivers/spi/spi-cadence-quadspi.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-quadspi.c
index 508bc5bc4ab5..72208d376305 100644
--- a/drivers/spi/spi-cadence-quadspi.c
+++ b/drivers/spi/spi-cadence-quadspi.c
@@ -49,6 +49,7 @@ static_assert(CQSPI_MAX_CHIPSELECT <= SPI_DEVICE_CS_CNT_MAX);
 #define CQSPI_DISABLE_RUNTIME_PM	BIT(10)
 #define CQSPI_NO_INDIRECT_MODE		BIT(11)
 #define CQSPI_HAS_WR_PROTECT		BIT(12)
+#define CQSPI_NO_2BYTE_ADDR_PHY_DDR	BIT(13)
 
 /* Capabilities */
 #define CQSPI_SUPPORTS_OCTAL		BIT(0)
@@ -1627,6 +1628,18 @@ static bool cqspi_supports_mem_op(struct spi_mem *mem,
 		if (op->data.nbytes && op->data.buswidth != 8)
 			return false;
 
+		/*
+		 * Erratum i2383: In PHY DDR mode, 2-byte addressing causes an
+		 * internal state machine to mis-compare the transmitted
+		 * address byte count against 1 instead of 2, locking up the
+		 * address phase. Reject such ops on controllers that need it.
+		 */
+		if (cqspi->ddata &&
+		    (cqspi->ddata->quirks & CQSPI_NO_2BYTE_ADDR_PHY_DDR)) {
+			if (op->addr.nbytes == 2 && cqspi->ddata->execute_tuning)
+				return false;
+		}
+
 		if (cqspi->is_rzn1)
 			return false;
 	} else if (!all_false) {
@@ -3882,7 +3895,7 @@ static const struct cqspi_driver_platdata k2g_qspi = {
 
 static const struct cqspi_driver_platdata am654_ospi = {
 	.hwcaps_mask = CQSPI_SUPPORTS_OCTAL | CQSPI_SUPPORTS_QUAD,
-	.quirks = CQSPI_NEEDS_WR_DELAY,
+	.quirks = CQSPI_NEEDS_WR_DELAY | CQSPI_NO_2BYTE_ADDR_PHY_DDR,
 	.execute_tuning = cqspi_am654_ospi_execute_tuning,
 };
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
