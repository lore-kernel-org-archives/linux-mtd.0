Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCB0FC5AE5B
	for <linux-mtd@archiver.kernel.org>; Sat, 18 Nov 2023 13:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O7/z8I21ySbPVRujiFxTJcU+hOOHKTZ9cHZFw5wuE1s=; b=OvV0gm8+dNBBLT
	QxHshBjwWgc/ScdVQr4BERbhst7ogVWGAqObXc0Yjvmj11PMqDJeZlKqZwkghZ0A9RbWxe9GNvATv
	5QW6033GcmDSoe1mkWE2Rta3a/PQzMRfkTS/nju5clPKbJZ9ol7//+EsIwBOGPQxq08BnMgTEek1Z
	aG+AyBTJGX0Ec7N6/PysRgZyEcjtxLKel7yh0oPwh4VhXBBHm2evW2PQVrKRHvmoqYTNgQg7dvzEp
	sAcXqak8hgeR/E6Uh79x1RaFudlhF6Nu4W8p94X6GMxqeCU1WgZfx0pTMVzn+nW5U+mMOWZpIUJ9E
	KPZFQr6U2aySJcMcJPXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r4Ln5-008aqJ-04;
	Sat, 18 Nov 2023 13:55:19 +0000
Received: from mail-mw2nam12on20609.outbound.protection.outlook.com ([2a01:111:f400:fe5a::609] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r4Lmz-008ami-04;
	Sat, 18 Nov 2023 13:55:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZVr4YLBVdCRiKTth5XjBMQ8iTrKkmL8fs6B1p79hMQnDBMJxyW/bZyUJ50IljEgWp+wqrYgY9GOLUNu/nfRaSQPbprc8DL/zX3wbs/M0Em7erJm8XKNHoxjP3c/spe3gGbW5juAPPcl4wyVGlqT+5FfDKKmzt0dybMdVSI+vHTuDdSqdvfMA/Bw6p5kf1IHyEs4ZTRqtAYLyLE2A7YD5rG7ii+AzXj/aSzd67jvXiuZqwt+NlxUE+hFqNo5GLhsxjV4SItIihHamsQJ7pl9bmfrARkOzqjApCgy3ySz9uQS+BZDtFddqqiXcHmAUJCeWuL3/R7oz+q8C8UasSCnKbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D5mqpHnfYMEPp/K3f3bZgmug97OgZD/HN9a0e4dtXkU=;
 b=A3L/CyHYIXmo7k9tZOfymuvP6qhs/6lNgXe7R5GbTmFe5AVTGCWOIGyaaWmPJyiHq2YYTJvMOT5wlqBVFU80yfUYRP+wDVewosed1kG0DN3sS5pzrMPDAJSMgaoirljFsE1ez0ymbXHvSb5el0J3WCwl/8/2wSjEGLsey+6AQXLMEjYTsid7sHXUPm5ZJGpoZ3uNa7dc1QHMOmRR6tu/BJDJ8+JJNORykgHQATcJZ8zlPZUgJNW/mgl6cV5oHDfcSjsBhhVBRPb28Lodzm9Ab1tRHj0pdkddEwbRiyTtQ54bRE0NoklsNGxPV9otAgdmH3bghJ9VfKUJGhF9MEyscg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D5mqpHnfYMEPp/K3f3bZgmug97OgZD/HN9a0e4dtXkU=;
 b=EDov61IiGSn7tWO8PKfEta3mHmy1W/lLoqFrs4iNq2ZTouGhEI+giF7aUVdKtzzgSvS8Zy2/LGcnmkmrs9M46QQs8FA7TDxyHTPB89qhHgVVHuDZuhjK1oRdj9F0zy2uhOpUTuW/6Wc1ggADj1is932jdeOAiqIW2MT2gT1fWIY=
Received: from DM6PR06CA0047.namprd06.prod.outlook.com (2603:10b6:5:54::24) by
 MN0PR12MB6054.namprd12.prod.outlook.com (2603:10b6:208:3ce::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.23; Sat, 18 Nov
 2023 13:55:03 +0000
Received: from DS2PEPF0000343A.namprd02.prod.outlook.com
 (2603:10b6:5:54:cafe::20) by DM6PR06CA0047.outlook.office365.com
 (2603:10b6:5:54::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.23 via Frontend
 Transport; Sat, 18 Nov 2023 13:55:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343A.mail.protection.outlook.com (10.167.18.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7025.13 via Frontend Transport; Sat, 18 Nov 2023 13:55:03 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Sat, 18 Nov
 2023 07:55:02 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Sat, 18 Nov
 2023 07:55:02 -0600
Received: from xhdakumarma40u.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34
 via Frontend Transport; Sat, 18 Nov 2023 07:54:58 -0600
From: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
To: <broonie@kernel.org>, <tudor.ambarus@linaro.org>, <pratyush@kernel.org>,
	<miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<sbinding@opensource.cirrus.com>
CC: <linux-spi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<michael@walle.cc>, <linux-mtd@lists.infradead.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <michal.simek@amd.com>,
	<linux-arm-kernel@lists.infradead.org>, <git@amd.com>,
	<amitrkcian2002@gmail.com>, Amit Kumar Mahapatra
	<amit.kumar-mahapatra@amd.com>
Subject: [PATCH v10 2/8] mtd: spi-nor: Convert macros with inline functions
Date: Sat, 18 Nov 2023 19:24:40 +0530
Message-ID: <20231118135446.52783-3-amit.kumar-mahapatra@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231118135446.52783-1-amit.kumar-mahapatra@amd.com>
References: <20231118135446.52783-1-amit.kumar-mahapatra@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343A:EE_|MN0PR12MB6054:EE_
X-MS-Office365-Filtering-Correlation-Id: 70e031ab-3906-4e9d-51c6-08dbe83df6ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SMRPS6z7lpDHtrLzS5/WDPCpfhEkLeZ7wJu9t9VvvNnGiuJHZdbCPGBj6kb7O0p/u06n6OHXRCKrU3gwJvXE3pEpgTeNRdjSJxUeVQ5S+YReLSdEQGLGK0vMwXeE5CrR77IXnr3lhZVOtnU376aUhmFRx7mHH7FFw4ZbSFqyWBOwplhAaFYeitkabRNtl39obojWKebfr8UiwD75eKraSf/0LrO2DyJwMMC8A+TbDYQEWG3ld0zH05uwui8dNuZY9Jl6i/2zdht+Xbuo4risTysKpAeIfIu5aBRVJlSeokYGdqJ0+VGT3gH/T9JTKxaC2UUosSB0ZZHNai+i2uDnuZnkImyQin0v34Ui/73YKRHvfVnid5U9ZAnlqCA5Vj80f1wOYXtFtmAnDuU28IlNJyjz2tLk0qlpZHyQ/0PYSLhYVpiexkYDsgnLCgyG6wbAhPPF8r5b+t0dOMQYG5QokNOKihNRY6ueW6U1d9wUJm41ddqyeGySeHooW/tyEa8+kgeVhFawGCUTfqKHwhq6CmIErHrcMgvsJDIOGqQIy32M35aBlwAHKUKztXWKZ8rrkeT268jzJTZRnQEgwbZpaa7JXrmdS3NqLjOuktxqhAaDEwZ2NLFG1bxrC28DeP6WuGwuQfIRSvq/Bq/LpOrSKe3UbVWsM1p3t/DMsDa7cwc8UvrDzV7pU/Y6LJNPtlvZMuMep1NHQySpozQsnoDXyyVcAKyhZzllATsP/B0HaCVSBhfiz1MhyqtPhyuItSsVVJeo+gSSvNlZwlxfCXe7Rw==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(346002)(376002)(39860400002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(82310400011)(46966006)(40470700004)(36840700001)(1076003)(81166007)(26005)(36860700001)(47076005)(41300700001)(356005)(36756003)(82740400003)(2616005)(83380400001)(336012)(426003)(40480700001)(6666004)(40460700003)(2906002)(7416002)(5660300002)(86362001)(316002)(54906003)(70586007)(110136005)(70206006)(478600001)(8676002)(4326008)(8936002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2023 13:55:03.3379
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 70e031ab-3906-4e9d-51c6-08dbe83df6ca
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231118_055513_062536_EB7912A2 
X-CRM114-Status: UNSURE (   9.47  )
X-CRM114-Notice: Please train this message.
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

In further patches the nor->params references in
spi_nor_otp_region_len(nor) & spi_nor_otp_n_regions(nor) macros will be
replaced with spi_nor_get_params() API. To make the transition smoother,
first converting the macros into static inline functions.

Suggested-by: Michal Simek <michal.simek@amd.com>
Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
---
 drivers/mtd/spi-nor/otp.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/otp.c b/drivers/mtd/spi-nor/otp.c
index 9a729aa3452d..23fe75ddc9cf 100644
--- a/drivers/mtd/spi-nor/otp.c
+++ b/drivers/mtd/spi-nor/otp.c
@@ -11,8 +11,27 @@
 
 #include "core.h"
 
-#define spi_nor_otp_region_len(nor) ((nor)->params->otp.org->len)
-#define spi_nor_otp_n_regions(nor) ((nor)->params->otp.org->n_regions)
+/**
+ * spi_nor_otp_region_len() - get size of one OTP region in bytes
+ * @nor:        pointer to 'struct spi_nor'
+ *
+ * Return: size of one OTP region in bytes
+ */
+static inline unsigned int spi_nor_otp_region_len(struct spi_nor *nor)
+{
+	return nor->params->otp.org->len;
+}
+
+/**
+ * spi_nor_otp_n_regions() - get number of individual OTP regions
+ * @nor:        pointer to 'struct spi_nor'
+ *
+ * Return: number of individual OTP regions
+ */
+static inline unsigned int spi_nor_otp_n_regions(struct spi_nor *nor)
+{
+	return nor->params->otp.org->n_regions;
+}
 
 /**
  * spi_nor_otp_read_secr() - read security register
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
