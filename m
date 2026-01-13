Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B36D9D2D10B
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Jan 2026 14:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QLRp/xz6bSzNFl6olqy0LUsTnJkHfyLUGkevWYG9Hxo=; b=gzdteH/xZTuzJf
	eh21cGFkfcd1Fe/idD1atkuM6V1AgF8wRzMsP6pHBY+L3WP+6pW1jzm1L6rrA0gI2zbksg488ErGs
	q+xpLrzetRBPyHieyaoWikSl7n2t1yCESnltQ4s/OaD2Gi2XWQGwBGFfWrdFFHU/+EtJWsKGbSxPr
	4Kbp33EPo4XpkaaWGx5KcIbQfdbX2oniudTYijHDR9PZ+S7AZ+G0+iKVtJOZQNfMQVN6uaILj9vh7
	fKSsayNQZb+9Z59RpvSdcTvSik7mbPVMqkgaQ9j9SlG/Ohvqm8zSAqoJagE4ET31zuzbTWzxG2xtw
	R6uBSPU1GsLKTKOJX+0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vffCo-00000007DZJ-1K6j;
	Tue, 13 Jan 2026 14:17:10 +0000
Received: from mail-eastusazon11012037.outbound.protection.outlook.com ([52.101.53.37] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vffCm-00000007DX0-0Vyj
	for linux-mtd@lists.infradead.org;
	Tue, 13 Jan 2026 14:17:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vTigFFXvX5LKkxkVNs9sQSJOuOTnk4VRzEr6dOgA3C+kLXcWxi1dmTScfGpih27D+FT2AwguYHIoqcQPXEFbzR7Ngb330ag3bfHuOQfabIURAOY0jRd1zTONS6IgdTaBNrcSgyFHCjGST11dGzjrCsiXLViMcfDVvcqkgmXIV4GVzeq4DWqgz0mVJ+9o4J1ieWTLJ77J0cn5R2AQ3Q9E7KK265otX2xgG49480+ozm379/pHOV3hU62GcaZsIdY15aAPejMH2rVa+fZFKfaJpSrCDSPkwpRCuymappdmmMSp7NCmhGZXF0hBZHUk1wVYaw8SMgsRzLj5H3kIlGq//w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lvu/GG1eB5CCQ2YjhSW/X9lc1BagUZktkNNziacNRRM=;
 b=oGLDXH26NrmQ94SzEID/hvtG07x7qwIX3jG9GWkwxLL1O+R+8MKuZdX5Uxf20+hvj/h8WTgDaSgu0pDweSX8oACGMJQEv9T9hx9HNsQYvf3IsLqil8eRSCLr797NlrQ4lXSBthqlOlP/KYOIg8+QQJUuhARBIdTXqnBkTq9DAJV0HRx1eDWYzmqJWs6vx+T8J0kD/w8fjVyCLRXRdOgfeInWGZ8dnZVc8W9/ptRa8b94oF/pMc1pHLc5wOdledHzziYxAZ69WKTja2dusB4HHmSPu6dNRUYsptv8NBuzgfGeqNOlkUIpr3j/zbDdaD/tBPRjkYg96l1KtsxCal50ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lvu/GG1eB5CCQ2YjhSW/X9lc1BagUZktkNNziacNRRM=;
 b=BwYpqSxY1Z/imlU0hGp/FaFvtzC1jpxx0Uhl8F6xjoF9Us6HTD+Z0WIdc9bejCtmQP56GGKvZt+ZZtqgwGTKzOcBpDGPCNRi0Wz/CDdwGMklA0ZA1VLR52tB30TI1E7SAbzeD59LscctPQcZk0PWXfZCPh2rygYl2iaxAZqGIYY=
Received: from PH8PR15CA0002.namprd15.prod.outlook.com (2603:10b6:510:2d2::29)
 by PH3PPFE7CE61147.namprd10.prod.outlook.com (2603:10b6:518:1::7d5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 14:17:03 +0000
Received: from CY4PEPF0000FCBF.namprd03.prod.outlook.com
 (2603:10b6:510:2d2:cafe::1b) by PH8PR15CA0002.outlook.office365.com
 (2603:10b6:510:2d2::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.4 via Frontend Transport; Tue,
 13 Jan 2026 14:17:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY4PEPF0000FCBF.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Tue, 13 Jan 2026 14:17:02 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 13 Jan
 2026 08:17:02 -0600
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 13 Jan
 2026 08:17:01 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 13 Jan 2026 08:17:01 -0600
Received: from santhoshkumark.dhcp.ti.com (santhoshkumark.dhcp.ti.com [172.24.233.254])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60DEGLop2381510;
	Tue, 13 Jan 2026 08:16:56 -0600
From: Santhosh Kumar K <s-k6@ti.com>
To: <broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
	<vigneshr@ti.com>, <tudor.ambarus@linaro.org>, <pratyush@kernel.org>,
	<mwalle@kernel.org>
CC: <linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
	<praneeth@ti.com>, <u-kumar1@ti.com>, <p-mantena@ti.com>, <a-dutta@ti.com>,
	<s-k6@ti.com>
Subject: [RFC PATCH v2 06/12] spi: cadence-quadspi: move cqspi_readdata_capture earlier
Date: Tue, 13 Jan 2026 19:46:11 +0530
Message-ID: <20260113141617.1905039-7-s-k6@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260113141617.1905039-1-s-k6@ti.com>
References: <20260113141617.1905039-1-s-k6@ti.com>
MIME-Version: 1.0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBF:EE_|PH3PPFE7CE61147:EE_
X-MS-Office365-Filtering-Correlation-Id: 05556bbc-4311-4832-8980-08de52ae6c2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|34020700016|82310400026|376014|7416014|1800799024|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?l4eoqHVLqGEkBCGIcBj0HLJAu8DMivUQ8/Fl1uFRaQopY9ZeJPNlaXXEqyBL?=
 =?us-ascii?Q?c0fz6ijtUlJQHXv2EyPaPEBnMjrDc2ic9WeHMECWbT4FXzCXPUSdWbl2eG2c?=
 =?us-ascii?Q?vV7OnqewG+UOHAGSqN8zf+5XJlCKhuSQYMaJVNbxYMJaqF+NTeiex9LPBuiq?=
 =?us-ascii?Q?vhnZgwStdRoquK5HgpkgLlV+VIyosWNIAy6FXq0l7wy8RtoYcoGLYnHIimXt?=
 =?us-ascii?Q?hR0rTo9HwYZrg3fEJcPlzp2vCtGunezDkCYbOYz9T7OYKKi4b0Z5X500UM8y?=
 =?us-ascii?Q?q9FWgZ8Dj8En8ajO8uEW6/mFvfQ6Z6gjkF6J9Kzj5C4fCjriTeK6Zi4+zpyv?=
 =?us-ascii?Q?hCpNWNALBSesRqTFbNgsOBftP6WpbInIWeGl0/mOxnjlJPu38AITr94PRCiD?=
 =?us-ascii?Q?UK3jcttx0rwrUKE3jkNd6WzkPSNARVsFFkMp4eEWiX+fLOCZXb+rmdFJdQ/Q?=
 =?us-ascii?Q?hdVy0ROiPNEzv7SWubD1ErEWUeW+g7DHV/huFzv3m9Q1gAL85mezkT+2/Nod?=
 =?us-ascii?Q?YKZOvy7ZqpJzsYcCVrcaLsRb6JdPAxNOjk5tWPN0WQCR3R/7VTp/o+5jACbU?=
 =?us-ascii?Q?oaL83D5ZJpo5/cU67RXGvp70X+eg+Uf+AC9rsdVtol1CSFDV5buVfTsxFKw6?=
 =?us-ascii?Q?Ojxdq/foTh9k3P3k7ZVpwux7Hu0xQh17bg9zgMQg1Ez3HjeyS4CR7MOZCTI1?=
 =?us-ascii?Q?MZ4LLzL/uXHFCznbZH/OVfnFbXfJ7BD/RWe4FRSkJGh/N5noHvbjviCiBs4U?=
 =?us-ascii?Q?MlFWxOtCbI05vACzHbhmL5N5CAGsYc5Lef3uwFAZUjUWV8fRmjd5JPHS7gYU?=
 =?us-ascii?Q?nNNvP+pRs8S/nCgEvANC9OCRrei3d+H8LbBwRgbzYfi/EViWtnVh6ZK4nmym?=
 =?us-ascii?Q?ZVnLA4nc+5xBshk8bp7/V221QTLY8CDDs0z9dXm6+tguae/z7gqnKWsfFFAQ?=
 =?us-ascii?Q?Kb5RqsvhGi4qPprXwHeJ8T0D24OsL9ZbyDqQSpvzViWYcOFM06bqKoUjtLVO?=
 =?us-ascii?Q?onhX7BzDgJC7yfS9bVwwSVqrIuIA17cbPr9Wt56fhR7pydyHJm6qIHDnVkXm?=
 =?us-ascii?Q?aZdmuMoQ8D9QWZC16wSP0ARydYDN+GyItWq3b3l7a9rSzONY1Qjyr5NkIbgu?=
 =?us-ascii?Q?bmJP7v75DoxwBCWLK8RgrFkzpRoe9w++AtlIa93+ps+HZqpko8P5szsRTMGO?=
 =?us-ascii?Q?WxhtgufoTSBIVSgL9h+5pumj3he1nQxntx0D4jDye1cH7S7lN0w/IO/W0QVF?=
 =?us-ascii?Q?103qrtPGkyMrZsQq2TlTPBpL58BARoSwgT3V1Q5h1uudbhXIkrOBiYXaO4E8?=
 =?us-ascii?Q?CDPB7e4+NpGS0DBMyVWeYKf/rTOesLDDaRCoOZLR3H8RSQnRaRNu3QvY8xu+?=
 =?us-ascii?Q?mDrJpZ+7T/kbjdCMzwx1Z7Zpz+/UihnmS+7LAjGDB71TwZyTSDieDhnIFuDD?=
 =?us-ascii?Q?M8EVuxF7oXSTbeBk/gOpzv+X1A/rnmmvhCxmy9AphB26LwvU0LkOZGC58wYp?=
 =?us-ascii?Q?U31GYeySpNKCJAYQy0BoJ2XC8+vWNLGhw8rnSMZ4KZfjZvVThW5KrRxC8nad?=
 =?us-ascii?Q?ijLx9OSfyl/CBjJCl7yXLSY0BfV9DuMfBrcycEUD?=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(34020700016)(82310400026)(376014)(7416014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 14:17:02.5010
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 05556bbc-4311-4832-8980-08de52ae6c2c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCBF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFE7CE61147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_061708_162976_809D4F57 
X-CRM114-Status: GOOD (  10.20  )
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

Move cqspi_readdata_capture() function earlier in the file. This is
preparatory refactoring for upcoming PHY tuning support for read and
write operations.

No functional changes.

Signed-off-by: Santhosh Kumar K <s-k6@ti.com>
---
 drivers/spi/spi-cadence-quadspi.c | 45 +++++++++++++++----------------
 1 file changed, 22 insertions(+), 23 deletions(-)

diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-quadspi.c
index b1cf182d6566..303064fdfe2c 100644
--- a/drivers/spi/spi-cadence-quadspi.c
+++ b/drivers/spi/spi-cadence-quadspi.c
@@ -450,6 +450,28 @@ static int cqspi_wait_idle(struct cqspi_st *cqspi)
 	}
 }
 
+static void cqspi_readdata_capture(struct cqspi_st *cqspi, const bool bypass,
+				   const unsigned int delay)
+{
+	void __iomem *reg_base = cqspi->iobase;
+	unsigned int reg;
+
+	reg = readl(reg_base + CQSPI_REG_READCAPTURE);
+
+	if (bypass)
+		reg |= BIT(CQSPI_REG_READCAPTURE_BYPASS_LSB);
+	else
+		reg &= ~BIT(CQSPI_REG_READCAPTURE_BYPASS_LSB);
+
+	reg &= ~(CQSPI_REG_READCAPTURE_DELAY_MASK
+		 << CQSPI_REG_READCAPTURE_DELAY_LSB);
+
+	reg |= (delay & CQSPI_REG_READCAPTURE_DELAY_MASK)
+	       << CQSPI_REG_READCAPTURE_DELAY_LSB;
+
+	writel(reg, reg_base + CQSPI_REG_READCAPTURE);
+}
+
 static int cqspi_exec_flash_cmd(struct cqspi_st *cqspi, unsigned int reg)
 {
 	void __iomem *reg_base = cqspi->iobase;
@@ -1267,29 +1289,6 @@ static void cqspi_config_baudrate_div(struct cqspi_st *cqspi)
 	writel(reg, reg_base + CQSPI_REG_CONFIG);
 }
 
-static void cqspi_readdata_capture(struct cqspi_st *cqspi,
-				   const bool bypass,
-				   const unsigned int delay)
-{
-	void __iomem *reg_base = cqspi->iobase;
-	unsigned int reg;
-
-	reg = readl(reg_base + CQSPI_REG_READCAPTURE);
-
-	if (bypass)
-		reg |= BIT(CQSPI_REG_READCAPTURE_BYPASS_LSB);
-	else
-		reg &= ~BIT(CQSPI_REG_READCAPTURE_BYPASS_LSB);
-
-	reg &= ~(CQSPI_REG_READCAPTURE_DELAY_MASK
-		 << CQSPI_REG_READCAPTURE_DELAY_LSB);
-
-	reg |= (delay & CQSPI_REG_READCAPTURE_DELAY_MASK)
-		<< CQSPI_REG_READCAPTURE_DELAY_LSB;
-
-	writel(reg, reg_base + CQSPI_REG_READCAPTURE);
-}
-
 static void cqspi_configure(struct cqspi_flash_pdata *f_pdata,
 			    unsigned long sclk)
 {
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
