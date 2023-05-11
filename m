Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 285AAC7EE25
	for <linux-mtd@archiver.kernel.org>; Thu, 11 May 2023 07:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O7/z8I21ySbPVRujiFxTJcU+hOOHKTZ9cHZFw5wuE1s=; b=b9MNK6i7T624rI
	EXoKJPtx/ELcGsfy2ghPeXavjBKfLP2Uh9CmqFRf6w/gSlU5pMIl3eycbh36f0GExkZBualn1EJsr
	LBxh14IIBxNXU6PgTjCkbsQtlUaAQvoR+mxBJipPxNbHdMWCcLuhG30xEo3SLidFlO18PghlzgiXn
	dy4rhvr0a+LJ45YH92qNQxCiJgOpgEVqW1je9A6gqI7Upe3inWJRcGyD7H+Hm5DOdO4/xRp5e7rL/
	mGh5nB7CYg8Yf1ciZMpMRH9GeqQyfdqPIuiXUNrfT8J0zYN415Upj9Iv3BtAhUxe81qaI1y5xugGU
	O7iiOC7Xt89pNPOxvZSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px0mP-0088hg-20;
	Thu, 11 May 2023 07:32:01 +0000
Received: from mail-co1nam11on20606.outbound.protection.outlook.com ([2a01:111:f400:7eab::606] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px0mM-0088gw-2a;
	Thu, 11 May 2023 07:32:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GY3ts4ZSpOpeV4EMXBe+8M+OzbbHeJSE4zjW2KFH0Qyh1HSEsiJslEGzko1OnHIQlakf/CVtS62IFpRArrTLu1uUh04HWoERiEXRUqosFzmma/aO1vsAdZfEknpx8Y0/dfaBMXLSOrRtzyHTaArYs+3JeP451VdeavYhv+ceDqXLGsCZPi3h8aNeqI4TplX29SXdkTJ5vPivrsa+v3z8uVv01qDAZtQfquIA/VQl7UsFspZVaD+g62tNge70MlYJSwSXleS693yIXe2VjR91Aeb2x/ZzRCe1e8KcPRCZezN81k9Ac8/M9pTvMIxcURiv164dREiLtHMXYU7OuIl4Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D5mqpHnfYMEPp/K3f3bZgmug97OgZD/HN9a0e4dtXkU=;
 b=i0K9yB+NZnwFOtT7KEwxUEZ8LqdtL4TncN1WvpdDOUyf019GKgLMGlbtjhKj6xyHhWC4NZx67eQSwaX1Olbn5wXHEk6/nnCHo6/eh+zfGuuqowMqHhV6EOhYyFgQV1wxb+a7RggDI8T6Vz8reMyyIiG6+wXf0YwRc34CtcyoFxZU4NX/7svaG32z8Cc8l1O9Z5VuitT1xkZ3RHcyg2o0EysK8Pia+SkCRZphBzcWczM/IwgFPyYj7H8ApdEzl3BOTagjdMAlx6iPLYuXZbotHeD5aGsNvzezwG9n+C8jr58A015+8z4MkG5SS9GG7OT3A0dC4H8pnvV2OAcw/GsxSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D5mqpHnfYMEPp/K3f3bZgmug97OgZD/HN9a0e4dtXkU=;
 b=LXTy9jPsm6XgpFUZCpvulgic7LKy+XA7vJVuFGlpGn8hhZKGKc7VdeRf4SgbYF9lsyN50NssoAOT0zftNQSKrOpXAqBi/VZi+B2VQ9cjonNDoC96QV1zfU68T5DB0/47Rwi1WmVhH4t4PMrmCbRfJmA0X56c0aa4hFrJfJurGAQ=
Received: from MW4PR03CA0240.namprd03.prod.outlook.com (2603:10b6:303:b9::35)
 by BL0PR12MB4996.namprd12.prod.outlook.com (2603:10b6:208:1c6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Thu, 11 May
 2023 07:31:53 +0000
Received: from CO1NAM11FT030.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b9:cafe::97) by MW4PR03CA0240.outlook.office365.com
 (2603:10b6:303:b9::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.21 via Frontend
 Transport; Thu, 11 May 2023 07:31:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT030.mail.protection.outlook.com (10.13.174.125) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6387.21 via Frontend Transport; Thu, 11 May 2023 07:31:53 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 11 May
 2023 02:31:52 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 11 May
 2023 00:31:52 -0700
Received: from xhdakumarma40u.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Thu, 11 May 2023 02:31:47 -0500
From: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
To: <broonie@kernel.org>, <tudor.ambarus@linaro.org>, <pratyush@kernel.org>,
	<miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<michael@walle.cc>
CC: <sbinding@opensource.cirrus.com>, <git@amd.com>,
	<linux-spi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-mtd@lists.infradead.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@microchip.com>,
	<michal.simek@amd.com>, <linux-arm-kernel@lists.infradead.org>,
	<amitrkcian2002@gmail.com>, Amit Kumar Mahapatra
	<amit.kumar-mahapatra@amd.com>
Subject: [PATCH V8 2/7] mtd: spi-nor: Convert macros with inline functions
Date: Thu, 11 May 2023 13:01:29 +0530
Message-ID: <20230511073134.41180-3-amit.kumar-mahapatra@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230511073134.41180-1-amit.kumar-mahapatra@amd.com>
References: <20230511073134.41180-1-amit.kumar-mahapatra@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT030:EE_|BL0PR12MB4996:EE_
X-MS-Office365-Filtering-Correlation-Id: e96a6a92-c115-4d46-3dff-08db51f1cad2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	UgscT75HcWclaA8ySCls8Pc4Dk40hyo9Khd4A8Nvep/wkf9Ud+s/ILV1PnlRcG5FS41WsZKhG4xpv1gW6RJTVMLmbNt3ZXsacFOq1gv+X1p5cjqe2NoILpMhWqBZrRWKzvRKZF9RtWqaWvKj23l7TmqhN4RJSuHFurlSwjpyFn9LzQ9k6tODWL6HM8e6OndD8AOVxNiSjzPNyqI4B0rNW3c7/yvbBvFbCtGEJs6pjUIOd0G5+cZC+mPJYcrGBt+9JCT9qylQy350+8KR6Q/MJgg60Aho29S0lONeRUfbdzTKIu3gygG+bH7+ZUZM0NeCiW4DF8k1SXGhLzAxRIMS9gfMC422HZWSL0OJjVgZ823iSkqSGIG8ZpHSEmOfynnD6i0OS++v6k1kvzRetTwwuLkfC1eAPiPtYvW9Tl+/63l41VTnPVs0zo8WBvej1lvDCTV4uUNws+ANOzREDoEoe4ch/jN501sOsL8NQ/TzE7spENxMn0xGBLGk9B2oczCtMzHvL0L9OMRk5Kjaanu++KxiPg+Ug7eH0C/q1GifmxuGOZOxSKATdWTGCLN1lyK0XiU9bKlAOiFSLG2BbpviXIOm5F2hvmAqmMjLQiVyO3s35GMG8udo2GSnhp4r59Ae6YU4GhwSTw4JT9/ANNswMJo2itnyZp3ykNTU6M4roR4AWf9+u6nbkkSxl97+Qe7BgfvFbOVT7LWlvqnPKX4bh64HLvoPbPKzUX+il6Lx93g=
X-Forefront-Antispam-Report: 	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(376002)(39860400002)(346002)(451199021)(36840700001)(46966006)(40470700004)(5660300002)(4326008)(26005)(6666004)(316002)(7416002)(81166007)(41300700001)(356005)(82740400003)(110136005)(86362001)(1076003)(70206006)(70586007)(54906003)(8676002)(186003)(8936002)(2906002)(82310400005)(36860700001)(36756003)(478600001)(40460700003)(83380400001)(47076005)(426003)(2616005)(336012)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 07:31:53.3082
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e96a6a92-c115-4d46-3dff-08db51f1cad2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 	CO1NAM11FT030.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4996
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_003158_839307_B7E73C1F 
X-CRM114-Status: GOOD (  10.05  )
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
