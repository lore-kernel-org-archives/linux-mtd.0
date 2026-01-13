Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49EC9D2D10B
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Jan 2026 14:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VrGE/MqiTcqUsLSZm5XrmerTLhqmFNr5tOscvpfbZTU=; b=rbE8b+E+7iB4mj
	Axerp23eXUAFoTHKkyw47+UKqXzAgE7j2qOtQO7VWKwGKCTwJfM1sGlUwIgaQWMTtqhfDFU9VwAhg
	2cQ9P+5iICmBp+SQNNh8WwywchrHk9mUU/Ue9yUsosidLNxlSfQcJFAX2YsSvvp34Qce9r1x3CdmF
	oXexFaesVu1N+lyTPehH1t/6HN5aeI4MzcfzkoWJuczRmB2p4Ju3rucVYdVwiEDm19PeBY+TENB8L
	ciI2fUlLERBd9AT9YD+5hUJkevbX1i8KlsgjxkRZ8eDLjCj6vwGRtLgQnjzWdUJtZmPEBw+xqD6+D
	CYKdXDZFO6+bg0KiKX9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vffCy-00000007Dfp-3ljH;
	Tue, 13 Jan 2026 14:17:20 +0000
Received: from mail-westcentralusazon11013040.outbound.protection.outlook.com ([40.93.201.40] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vffCv-00000007Dcf-4B7A
	for linux-mtd@lists.infradead.org;
	Tue, 13 Jan 2026 14:17:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oSLzKWe1o6azB8BP3fEo+nIPbCkuBkrEFaTQzAK3IRKxfHcl8Qgp0/RAaQPht0K9gY8Pk23f3+oM1W2Fkc5Rpct3IVC52W6/pAvYrklhn+fJ0wGVtrXu1QUYVzGyBLPDtVZFMF6ML+vbPsw+r9IUuCMr/KZY6AqhnF9mrUqHdjnc3jDdH1xR4ElHiGmr2cKL6X2PmVrfy/5LHp+gooTY5ZVjINDOgmeXB2jveTDYm8ZDXkVa20YXKmf65bnR/jGxa1a8t9+LcdTGJyYP9TWCtTP1Lq5YSr/l/GO26TlsGgJs6BT5y4oNzgiFuX2Zx9I9k06x796cCRl5R4F09vL0PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MS0Gw1y9C6x/hpXdzRn+k1+y6EsRQWA0PAqTPUIAQrY=;
 b=A+MWoCkqx+ZxXjehejO0NRi8eTZoScx+oakfZl8hldDqIKvFRCuvsKX977lbJ3Pcn5M9eVtGC6jVHCAp1Hf9Wbjb5upCU60IJD7FuOlH6V/ck7bvP+k4ATHY3p5XDtN9FYzdydNSRYSPNg1q1bUod9IeNc1f9MaSp+k5oZ3Su/YCXgkbla1LNvm3iODOkudUuopLntTavAz4o39MeDDVDpcyOO6vx5rqa3X9ZUAw28CFexMoK0zL34xOjIGg1GICt+rFrR9Ahd6BOOhSMUQeKF9X/jzff+u/PItTvxf1zD+0U6eL6HmYwDuYt8JjRF0WxdxEvy2QzPXSuAysWfh1QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MS0Gw1y9C6x/hpXdzRn+k1+y6EsRQWA0PAqTPUIAQrY=;
 b=cHyMzO4wvuU0YNaJw85UxahlVKgkeAQeNhpKXNDOjDErGgPM272TO4JO4UoKcumvmIVpLkMTZkBr3N+NgDu5mwpM6tPjQsz2NLomKXvPjg4+skJJ88ixTxUJg04B35w+H56nas9OwbM0pdXLgs3lNMKhmtdHH9ECZw5SxIKN8AA=
Received: from BLAPR03CA0090.namprd03.prod.outlook.com (2603:10b6:208:329::35)
 by PH0PR10MB5893.namprd10.prod.outlook.com (2603:10b6:510:149::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 14:17:11 +0000
Received: from BL02EPF0001A102.namprd05.prod.outlook.com
 (2603:10b6:208:329:cafe::9c) by BLAPR03CA0090.outlook.office365.com
 (2603:10b6:208:329::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Tue,
 13 Jan 2026 14:17:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL02EPF0001A102.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Tue, 13 Jan 2026 14:17:10 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 13 Jan
 2026 08:17:07 -0600
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 13 Jan
 2026 08:17:07 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 13 Jan 2026 08:17:07 -0600
Received: from santhoshkumark.dhcp.ti.com (santhoshkumark.dhcp.ti.com [172.24.233.254])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60DEGLoq2381510;
	Tue, 13 Jan 2026 08:17:02 -0600
From: Santhosh Kumar K <s-k6@ti.com>
To: <broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
	<vigneshr@ti.com>, <tudor.ambarus@linaro.org>, <pratyush@kernel.org>,
	<mwalle@kernel.org>
CC: <linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
	<praneeth@ti.com>, <u-kumar1@ti.com>, <p-mantena@ti.com>, <a-dutta@ti.com>,
	<s-k6@ti.com>
Subject: [RFC PATCH v2 07/12] spi: cadence-quadspi: add DQS support to read data capture
Date: Tue, 13 Jan 2026 19:46:12 +0530
Message-ID: <20260113141617.1905039-8-s-k6@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260113141617.1905039-1-s-k6@ti.com>
References: <20260113141617.1905039-1-s-k6@ti.com>
MIME-Version: 1.0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A102:EE_|PH0PR10MB5893:EE_
X-MS-Office365-Filtering-Correlation-Id: ffe773a8-723d-45b3-f471-08de52ae70eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|82310400026|34020700016|1800799024|36860700013|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ML9OmAEgtEUKYpSf+x8dkvvl5w1zzwlRZq3TQwcHPZi0Mm2KGA0jlpEYiih1?=
 =?us-ascii?Q?oo0OHSRKa3ldaAvwPMS4TDks1rBDbb22W89xdZxzYQIoqH/xlJ2m/iffvjQe?=
 =?us-ascii?Q?phWPVMVn3N4ozDLLefLRMU4d4gA4aUdxXwK7e367EuXX+/5ZRNTsharMgZiA?=
 =?us-ascii?Q?S4r/D7ZlyGOAAa37slNQDeXtCwRz789JSkthO5oft2ZM1Z2EPKe7nIc9qznl?=
 =?us-ascii?Q?ZFZHLL6En22cHhqsPf250mWJiEU0J6l3GVTqXnTD/JYiFqxAKsV/cSK2vO9S?=
 =?us-ascii?Q?kcIVZo+LQPx74xJeX9yQPRL++G7rlrgO+NQE+156BEU+SVAT8UcZCAytmp9g?=
 =?us-ascii?Q?rmz64ckG1gt5peffOyRQsdbxBpeA5lxKPOf4o2YexKARscRp0bwpxtoeRdjE?=
 =?us-ascii?Q?fKAvr4kp6dbS9K3634uuJC9DxwVVyzTtn2A1QwKHXwnlW0MRpsQ0a7wY7y+p?=
 =?us-ascii?Q?QOS4ZXDLe5ijmz4tnEs8dn2EA8deDb/plPmps/1WK74+EAKBjHSQM67daA26?=
 =?us-ascii?Q?IXHuMzi2P0l/B2pHJm0t3QIp/iH+2/ZnlBfmvIrpnqwiDim6TydOTu2KRlEl?=
 =?us-ascii?Q?eSjtRh1sarPc8ElyMb649U5oembjGVH5AWpfgd5TBg7l4rPmoT2/VZ1n/Q3d?=
 =?us-ascii?Q?Nidwa5A7KlJ5aNuOFsjPB5ljHfwZGWLnYvIilX28TC5FGXO1ju0yHjWEfAff?=
 =?us-ascii?Q?YMI69IGol0H/LoSxJAJ3cHJfY4V9KLqFqBHLE3SpjxsPLtUVPATGAD8lAfS7?=
 =?us-ascii?Q?89yawSDmURuOe5p4HdmWae9rKbP8MLjXJDICkaDULctiAUBqB0/rq7O2g1G/?=
 =?us-ascii?Q?tAAMMJY6nzvrR8cqQXayJvbHdu3EhRZOibA7Vp2x/Ep+Y94xqBApRi5PpW6w?=
 =?us-ascii?Q?5uweZfj1xGFI2/2WlHuOGPWEYNFDnkjxxE50G1rIUNvkdSH16oztbptNu4IQ?=
 =?us-ascii?Q?YRrZ5cfT+pLJOLF+c+TfNjo5M+wMM4I/SDqq/Ko80P2L9PK+Mp/0A9HxE2zR?=
 =?us-ascii?Q?O/VgQ+4gDiQJaBiNu+3MvCzRosl3PkFgwRe32pcgFmTdh3D+ZHbhhCj7d7Mj?=
 =?us-ascii?Q?XLvfRRNfjjDdJhufsXrSGtR7WRjVTnwUCh7EcIoSgqmzzi2iasrUeiR0pWCo?=
 =?us-ascii?Q?rcEJvFl66ocAWJDg+JYHmBJijCxIc+oJxySwJXAp2Up6IKAXZu8/1oXWeMVE?=
 =?us-ascii?Q?Hz1mDOnEUOXbY7d273B+CTKzGW0BVwoCa9cCpydIB8QUgausOGS7j5YL6LCP?=
 =?us-ascii?Q?VECeqvF1+KVhUhLtUFQKEiQEHigjfeii2jLDyXT1+mC/9oFwiBbn2JJJzc+d?=
 =?us-ascii?Q?LE/g3m/q4AYsB2uaqH1DWtSQ9rr2rpHSG219L5BpVTrWpPHgDGR0Qjj0MsxV?=
 =?us-ascii?Q?MODEOg3oKRkpz7anJ8ui32/heT9y+ATZe1ECDEGJRTUZpkV78QvS9G5imM/H?=
 =?us-ascii?Q?rhSTo6fIW6Gth+WTUbgbObM2ASLxxBysYpwimMGKa8kPyuIxf7xxeYuzlyMn?=
 =?us-ascii?Q?98m29Y8RvGINTwGIATMsPfOlEMi9BiMujBq2nsXl4vzPeil5XWbmAUxXCG1F?=
 =?us-ascii?Q?N1Q+hKIKavfe7H6/v5yuvGFfe8I3d1bmv8K6vLbQ?=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(34020700016)(1800799024)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 14:17:10.4270
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ffe773a8-723d-45b3-f471-08de52ae70eb
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A102.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5893
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_061718_047407_8D5EE362 
X-CRM114-Status: GOOD (  11.55  )
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

Signed-off-by: Santhosh Kumar K <s-k6@ti.com>
---
 drivers/spi/spi-cadence-quadspi.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-quadspi.c
index 303064fdfe2c..1d708dde4463 100644
--- a/drivers/spi/spi-cadence-quadspi.c
+++ b/drivers/spi/spi-cadence-quadspi.c
@@ -186,6 +186,7 @@ struct cqspi_driver_platdata {
 #define CQSPI_REG_READCAPTURE_BYPASS_LSB	0
 #define CQSPI_REG_READCAPTURE_DELAY_LSB		1
 #define CQSPI_REG_READCAPTURE_DELAY_MASK	0xF
+#define CQSPI_REG_READCAPTURE_DQS_LSB		8
 
 #define CQSPI_REG_SIZE				0x14
 #define CQSPI_REG_SIZE_ADDRESS_LSB		0
@@ -451,7 +452,7 @@ static int cqspi_wait_idle(struct cqspi_st *cqspi)
 }
 
 static void cqspi_readdata_capture(struct cqspi_st *cqspi, const bool bypass,
-				   const unsigned int delay)
+				   const bool dqs, const unsigned int delay)
 {
 	void __iomem *reg_base = cqspi->iobase;
 	unsigned int reg;
@@ -469,6 +470,11 @@ static void cqspi_readdata_capture(struct cqspi_st *cqspi, const bool bypass,
 	reg |= (delay & CQSPI_REG_READCAPTURE_DELAY_MASK)
 	       << CQSPI_REG_READCAPTURE_DELAY_LSB;
 
+	if (dqs)
+		reg |= BIT(CQSPI_REG_READCAPTURE_DQS_LSB);
+	else
+		reg &= ~BIT(CQSPI_REG_READCAPTURE_DQS_LSB);
+
 	writel(reg, reg_base + CQSPI_REG_READCAPTURE);
 }
 
@@ -1310,7 +1316,7 @@ static void cqspi_configure(struct cqspi_flash_pdata *f_pdata,
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
