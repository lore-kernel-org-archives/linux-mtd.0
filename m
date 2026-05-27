Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC433CD4F54
	for <linux-mtd@archiver.kernel.org>; Wed, 27 May 2026 17:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3WDVslxrSXRML/RylRobaraNpeaF+8gxkaPSWsQWaiw=; b=smYLouhQHIfXTH
	7kIWaSqe+0GbNLq5udc1/woI5J53/ff6o43d6nbrni7o669uR+hhAPR+N3njHn8pkoOAb7X9fQdZq
	e6EopacKFy5zS53ZCUXLzLrvOrxgLUVzV4Qi20mfbOM1mOrFpxe9LgN5Yf353yfBzYITgzDJGE2UQ
	mGRywrILbCUGtnq63rqUxLGkaS0nOQ4sk7jwiT2GawJPgGp7G2eBWTXkgl4MHkGxvbGzrfPd9tzWa
	tSbW4SDhxJrXnFBRElb3GnHprsGb5LSWubeF044/1cUGfE9rEOSiuD1SREU4ZqQ3BVWvJjIrj863I
	LShAvBanr6pb4I6URzvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSIUS-00000004bhM-2doH;
	Wed, 27 May 2026 17:56:24 +0000
Received: from mail-eastus2azon11011052.outbound.protection.outlook.com ([52.101.57.52] helo=BN8PR05CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSIUQ-00000004bes-12JL
	for linux-mtd@lists.infradead.org;
	Wed, 27 May 2026 17:56:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aGPYa4urTMhKgSE+UDo5IkB2Zj2mgA8yITBhO54K5BLWbN7rOiaHJEV4bnJXkjVkU5tdbzK9MSYX1FiIieytGbYv+/T7owFtY36NM2ZLUwEUunM5JmZentWc+9QR6+AhCBCoJL2leyren39Kj2pj3sUVayKm8nss2VwAePUaFiW6Y6cjl76GNYOEUW2aXbkbjOjDh+jGF7o6MMYbyysn3nsv4V3qHW6sd7eVy0bLbP4zb8oUjLR8cL4EvLcEvc7xnmAJKwBpn94OMjTXEbiACOpSOB1DGzNPEMHLOse3M+S5eP0js3RI5jNiPx2/IBgAuAYWIYmWmrNTEp5ki4Jn0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wCZc0wIVBtDCh1p0IprYueCIB6QFm2p/C8s4JQKghv4=;
 b=mFWk0xx6s+8jxWNtzcHG/xfAAT0KHY7zd5xu7+1KfkLm5Bv+qpVlkKdAKicbyJ7wK3kclMMzLrTTyKSYgI6JNu7y10xcPdoDB0eWzZq7+4fpeL4Ov3gjWJWt+GhpKoMSfSovLuyE7QJTS2XyUfM77P19COB/anQQJzS7cIC4ox4x77EstoVL7igp8k6MM4JViEI2oeBEkICzfx+6zvb04UZGJNmvWlYAryes+u1WGJqO8fsCVnOtydrqSzqAvFFlOBk0pPzg281t+QKeHKzNSbzOFyaCgRNH0+ZJLo881RDSDod+1WwP4/imN+0Bcc0VcrOdMFug2geVckMIt/88+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wCZc0wIVBtDCh1p0IprYueCIB6QFm2p/C8s4JQKghv4=;
 b=Vf/wyarMeeKLkeES1MpjBffWjlbAVLAl/0pB0k/3pv5gJEUnGNAPp085C8MORyVqRIjYWl3WQx+U4AyEagTmCfUNolegdQZ7fkkEwLb9UMaAu6G+NiiM1yWCBLXYn11r4xkqs1J4zAUB5TxzOEIIyFXpxpa1uAf2CV3lwqNBb2M=
Received: from BL1PR13CA0399.namprd13.prod.outlook.com (2603:10b6:208:2c2::14)
 by CH0PR10MB7499.namprd10.prod.outlook.com (2603:10b6:610:182::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 17:56:16 +0000
Received: from BL02EPF0001A104.namprd05.prod.outlook.com
 (2603:10b6:208:2c2:cafe::45) by BL1PR13CA0399.outlook.office365.com
 (2603:10b6:208:2c2::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.4 via Frontend Transport; Wed, 27
 May 2026 17:56:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL02EPF0001A104.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Wed, 27 May 2026 17:56:15 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 27 May
 2026 12:56:15 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 27 May
 2026 12:56:15 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 27 May 2026 12:56:15 -0500
Received: from santhoshkumark.dhcp.ti.com (santhoshkumark.dhcp.ti.com [172.24.233.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64RHtYpj4052476;
	Wed, 27 May 2026 12:56:10 -0500
From: Santhosh Kumar K <s-k6@ti.com>
To: <broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
	<vigneshr@ti.com>, <pratyush@kernel.org>, <mwalle@kernel.org>,
	<takahiro.kuwano@infineon.com>
CC: <linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
	<praneeth@ti.com>, <u-kumar1@ti.com>, <a-dutta@ti.com>, <s-k6@ti.com>
Subject: [PATCH v3 07/13] spi: cadence-quadspi: add DQS support to read data capture
Date: Wed, 27 May 2026 23:25:21 +0530
Message-ID: <20260527175527.2247679-8-s-k6@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260527175527.2247679-1-s-k6@ti.com>
References: <20260527175527.2247679-1-s-k6@ti.com>
MIME-Version: 1.0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A104:EE_|CH0PR10MB7499:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bfa5813-ee36-49c0-7eb6-08debc193f97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|36860700016|82310400026|1800799024|921020|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: ktZxFcILR5khN7Tkxq20pUSwZiBAz6SmmqnMmOS0+9jQWJWaRLtcYqfO+/fsT7e+h3QjFiHCRPcv6S05ivxtMvKexweUeTCYBWFf3wdC3aSe08WeDI4gUvgWYxhhjTtG5pyL7vcrPF13Q2RLbWEsU+vuTccHT26gRQadeS3PwBO5GX5Sf8n8SqJ1KbONJCBt4cAwaTQirBQVW3QcDxtJr+IW7Ka3Y8zvAe2SNWFhhzNNhOO0lBXwHInsjkqQM6YWk49w4EY7psiUTwtP287iqe3p3aDPGYQ5hpfQbTfb7L/r/tQLVpAxEEqUDJVQFcOfmm4oD4MbIA/tzGenpGU86P1FEb1KBXvtYl26mZv7fe/M2GjYF8PR+2X9Ftk2FE/XPze2e8gALKroYMhlDEuagIFPK2SmmimApQ4EVRo7hXxvrA8XCqWNluHHk1itO4BVN2tVk2H5EQ5KN+C42s7H06CCJQpj/1SVb0qllTexEFadFY45ERyHbiQYnPBAvchOtVRMmYbajKWrErzLXPGMcgEykky54Xf53/HbYSwYTRCXXLLXRtFij/aSpqonzs5tmu9GJOlLZIMgMaqv+NdCSyv+XrFop009DcFFHw1CUEwvozgCCKALAqm9UfT/jxrTfQeaF0FlNUgLvQq7bik/4stDhaQnmpMae0T3HEZcA+NCfuuJmOrjx38xD3hmDTvtmxCDxs4qcdaXMz0b/WBYYUrZUcDxdlNWcx84DxV/ZAsAqw/HdmpMIIZM4ayYsMRsMDUBAPwuuWXPRnDudRXhNg==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700016)(82310400026)(1800799024)(921020)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: iaE+IPvLxk/qYPVo7vizfqsg1hUlIA795a4pavZyGLWegiNGNPWKjTtYJmsrih1U6DZpZBsbTeaET/E7tEGi/ORqOTTfOW4PiCLlCy99MhkafnPaqyIpuAfbkfZU3D5r5ZfXAhWwwQOrQEjJFgdGYyFywZADYBGvpcsvYdfeuw21kdBHooZ0dxkGPVxlLUpY3SYb7l9wcjQl8beHp+QSeaJxBAsa2Ew3lIVBZKgGjomU7FExLbeF8BpR53TK/mXYM7yvOsa+qWnKEHcPiiDeTgEFpvBP0r9YQUdaulbpH6EG+/j2Vf+d3ohpOhAVQxUrwws3LmORncoOdR9rY3hGYHRcKL/WrvZYUgBZDbEKvzAKyFrgqZ6StprJMAv8fvjFC2WFF5zArH78itswInklV4vOLVhZwbXCSPKFrvkOOyd1X3iyPJ0UK/ks3BQsfe9T
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 17:56:15.8952
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bfa5813-ee36-49c0-7eb6-08debc193f97
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A104.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB7499
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_105622_770542_B657A29C 
X-CRM114-Status: GOOD (  11.79  )
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

Add DQS (Data Strobe) parameter to cqspi_readdata_capture() to control
data capture timing. DQS mode uses a dedicated strobe signal for
improved timing margins in high-speed SPI modes.

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Santhosh Kumar K <s-k6@ti.com>
---
 drivers/spi/spi-cadence-quadspi.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-quadspi.c
index 54fd7b591e06..201d69c64c49 100644
--- a/drivers/spi/spi-cadence-quadspi.c
+++ b/drivers/spi/spi-cadence-quadspi.c
@@ -192,6 +192,7 @@ struct cqspi_driver_platdata {
 #define CQSPI_REG_READCAPTURE_BYPASS_LSB	0
 #define CQSPI_REG_READCAPTURE_DELAY_LSB		1
 #define CQSPI_REG_READCAPTURE_DELAY_MASK	0xF
+#define CQSPI_REG_READCAPTURE_DQS_LSB		8
 
 #define CQSPI_REG_SIZE				0x14
 #define CQSPI_REG_SIZE_ADDRESS_LSB		0
@@ -454,7 +455,7 @@ static int cqspi_wait_idle(struct cqspi_st *cqspi)
 }
 
 static void cqspi_readdata_capture(struct cqspi_st *cqspi, const bool bypass,
-				   const unsigned int delay)
+				   const bool dqs, const unsigned int delay)
 {
 	void __iomem *reg_base = cqspi->iobase;
 	unsigned int reg;
@@ -472,6 +473,11 @@ static void cqspi_readdata_capture(struct cqspi_st *cqspi, const bool bypass,
 	reg |= (delay & CQSPI_REG_READCAPTURE_DELAY_MASK)
 	       << CQSPI_REG_READCAPTURE_DELAY_LSB;
 
+	if (dqs)
+		reg |= BIT(CQSPI_REG_READCAPTURE_DQS_LSB);
+	else
+		reg &= ~BIT(CQSPI_REG_READCAPTURE_DQS_LSB);
+
 	writel(reg, reg_base + CQSPI_REG_READCAPTURE);
 }
 
@@ -1313,7 +1319,7 @@ static void cqspi_configure(struct cqspi_flash_pdata *f_pdata,
 		cqspi->sclk = sclk;
 		cqspi_config_baudrate_div(cqspi);
 		cqspi_delay(f_pdata);
-		cqspi_readdata_capture(cqspi, !cqspi->rclk_en,
+		cqspi_readdata_capture(cqspi, !cqspi->rclk_en, false,
 				       f_pdata->read_delay);
 	}
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
