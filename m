Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58578C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Nov 2021 11:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Mi6T4cmRR46yMrcQSmjR5sQk1f/5qlXKKyFvOqVlrUk=; b=Z53sTH3v00PSgm
	zkypZ7iX05onjlgN6ralN73CzIENEQc0IJ3WNblpooaZ9VTzT7d9HzqzDyn9+CKn1PCO11vgTk1pT
	//II3dEyqaumZ/k4TL63Luq9Xo/5zMC8L525s52Jw75HBIa4uhYL2Po+tzqAqnK+2/0TLLBS8bkpM
	t0MT7issg+uEVT8aP9LxKgLWCAQN0gZuvh+C4O+rxMBgMQ37griIfpdyIZUOaYuj0qA/3+nZW1MLp
	On2J4yylztXFE/nTktJa5UmnXhHlz2c/UzDp7NaeolvgXFmjyPBuCJ8s5spCirRiGV76fhBOAQp91
	E1ikYTFa09Mqc9WsKirQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ms1Fu-004qse-6a; Tue, 30 Nov 2021 11:25:02 +0000
Received: from mail-co1nam11on2060.outbound.protection.outlook.com
 ([40.107.220.60] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ms1Fr-004qqv-7x
 for linux-mtd@lists.infradead.org; Tue, 30 Nov 2021 11:25:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ECsc6q4iBQLL4agMX4ynScudCXPEQK+0zF42FVQ9HiJ+MFwP1Kk3FDFVrv9JHdyDmZJWj0nGOPElqDGfNuPnJamnUPJutKjUlLZp5pxuXiDi4zCJ0Nsw7znftZPGmOr11z8+zUuavZqRq6m20F6ru4Jw+u8eZff8Y3b9AAm2HOd+TJ8foqJF+w8k86Ff2cAwQupxktt32NfLTx90e2D+xn6JOYXAOEF7DgCAkMg/Gx6ymaOD1KQTPPO9BM3d5quJRuKUDxDf9v6aIrqM3nLIeikhWzfF1Ik7znenqXSfSAT/lKU1tbFkYI/PT+sZHMxk8XcPTQrzg2i3fp8TKGRGww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9+MQm5nXYrsLpgcTLBre7vMx7NN+HfQRnctP0dvKRdQ=;
 b=DRy4NlXxVEcsnV7Lg9SbvZlr/Otmxf8Vq7x2Dc/wsbB/OlDJGIP8tdm8RR5OJbv0MIq85wxVxgN1wAdHwPSdKEO4zmEyZJVTWO1+H1DX1vvDxtIx7/bsfC/2hPLB4TY2g6JT3eRTT/FIH/mHhsyocR0mrAA3ZtWB3YUMTETMVoeFL8UEez6vjmrbXSuuM0SEw9T5y3CfJp/y6GM24qPsQH7wOyRUu1ViHesA9mlCmvZouagpV1OG1KkEAko/hncWiLzzk9/bu6vVFOqWvi6sqz7CEXmgeXz2i3P1TFP0CctnvN66H6KrLJ/0anqkwK9UB0QRPeYkVBtj24GhQlwH/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9+MQm5nXYrsLpgcTLBre7vMx7NN+HfQRnctP0dvKRdQ=;
 b=ly6ttoIz9PHJBKfm/wUo5I29fKZKkr2tDmspqJEAw3uz+bbJVr8FnUg/02QHQiwPThB2nUuzzqs44RZMqPHX7TnNUU7Q4uelrQisga6e0iu9m+07iA2tE4bsWl04T9SEzwAe1Na/ldSLFQjQxO/JCCa2A2+lsJ329zSOnIM+VPHVX7WzYpaGyj7SdmpFKEg/5iLNhI+SgiYsovtorVlw931e2MKfoz/fxFKii+ac0uskZ0phRXbDGksSnX6yCtr7tgbc+l3HY/Xg+ESm45wJQezBslr8z6VudpzVaiKNUzJg07DujD5Qy1dIMN8hVw3y5lbPFiAlLjSpm265jZ6isA==
Received: from MW4PR04CA0123.namprd04.prod.outlook.com (2603:10b6:303:84::8)
 by BN8PR12MB3201.namprd12.prod.outlook.com (2603:10b6:408:6c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.24; Tue, 30 Nov
 2021 11:24:54 +0000
Received: from CO1NAM11FT021.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:84:cafe::f7) by MW4PR04CA0123.outlook.office365.com
 (2603:10b6:303:84::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23 via Frontend
 Transport; Tue, 30 Nov 2021 11:24:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT021.mail.protection.outlook.com (10.13.175.51) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4734.22 via Frontend Transport; Tue, 30 Nov 2021 11:24:54 +0000
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 30 Nov
 2021 11:24:53 +0000
Received: from moonraker.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Tue, 30 Nov 2021 11:24:52 +0000
From: Jon Hunter <jonathanh@nvidia.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-tegra@vger.kernel.org>, Mark Brown <broonie@kernel.org>, Jon Hunter
 <jonathanh@nvidia.com>
Subject: [PATCH V2] mtd: dataflash: Add device-tree SPI IDs
Date: Tue, 30 Nov 2021 11:24:43 +0000
Message-ID: <20211130112443.107730-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-NVConfidentiality: public
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b98eb9b8-a02d-4f88-0fab-08d9b3f4087f
X-MS-TrafficTypeDiagnostic: BN8PR12MB3201:
X-Microsoft-Antispam-PRVS: <BN8PR12MB3201ACE94F68014CC94E1F8DD9679@BN8PR12MB3201.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KVx1tF0aHaua7Buwj4SuYDDZJmeUkTgK9awL0TtAGbgdeSafTG0XrA3C0UPBFLBqsbRuobzKK5fdXSB9iYDRuTt8nGzcZT8PuIF+EvKKtGuLp629u6WUuPC+xlQ/WGqnJ5tL8Mx+78ZztKBtcGlkQ2HwXMUDnr13b3f3JFS6BgXnnYrk2DjnkRkMu/oDD16ZH+2IV192qkXZo1qV/rHhTMZKkQxAca4C0o1C0NrYqTR7mMRbXzcbWDFfB9h1MmV59tEd274qRUVkeiUbqjxLB5xpM5wSkKcP5sA0eJDgW9oa56yrczJovuppXLrr89goMHx82QGezCwz+6IPspK46hdclsgnUrjBiUK9LsQzywjB2EDXCXZvhzGVipBoIKqFfyyMTXnshjlzhQKjeaZ56bLjyhBW9MHntK8lUr0WXs7wo/9rf+lQBY633C5+gcv0oLNjj4B17VCPAE0nK3/Npgl+ahii5uun0pCcIjAB5oKwzoHJ2zON57R4p5EQ9SNcMNzfEv5dkq6WUipGtCInkfNJVASerW5o8MqsD57vS36bfa/L1LmUvel05drSSqSZAxCRl2R/lfnZoXqcPInmBXwiAPS+SyqYD2vDNWMvlxoVB2wFKfnFICG8551EsjJIg0ZUHTLQIlYFHIJwyqnXQqiOEYg3EIAfVycelXaZDR26frTch0VAI2cdnT8LjQ1fpmXsjxpzpbACtIdTLrqcyraVA950FdhFjbM7izoh+4ewX1fpcZB/jEwdrl7jvW2HuNFV72EfajKZyCAt+KyYuw==
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(40470700001)(7636003)(356005)(7696005)(47076005)(36860700001)(82310400004)(36756003)(40460700001)(426003)(70206006)(83380400001)(4326008)(110136005)(107886003)(316002)(8936002)(1076003)(5660300002)(6666004)(26005)(336012)(86362001)(2616005)(70586007)(54906003)(2906002)(508600001)(8676002)(186003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2021 11:24:54.4493 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b98eb9b8-a02d-4f88-0fab-08d9b3f4087f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT021.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3201
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_032459_370385_8BC43573 
X-CRM114-Status: GOOD (  13.29  )
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

Commit 5fa6863ba692 ("spi: Check we have a spi_device_id for each DT
compatible") added a test to check that every SPI driver has a
spi_device_id for each DT compatiable string defined by the driver
and warns if the spi_device_id is missing. The spi_device_ids are
missing for the dataflash driver and the following warnings are now
seen.

 WARNING KERN SPI driver mtd_dataflash has no spi_device_id for atmel,at45
 WARNING KERN SPI driver mtd_dataflash has no spi_device_id for atmel,dataflash

Fix this by adding the necessary spi_device_ids.

Fixes: 96c8395e2166 ("spi: Revert modalias changes")
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
Changes since V1:
- Added Fixes tag

 drivers/mtd/devices/mtd_dataflash.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/mtd/devices/mtd_dataflash.c b/drivers/mtd/devices/mtd_dataflash.c
index 293cab758299..734878abaa23 100644
--- a/drivers/mtd/devices/mtd_dataflash.c
+++ b/drivers/mtd/devices/mtd_dataflash.c
@@ -96,6 +96,13 @@ struct dataflash {
 	struct mtd_info		mtd;
 };
 
+static const struct spi_device_id dataflash_dev_ids[] = {
+	{ "at45" },
+	{ "dataflash" },
+	{ },
+};
+MODULE_DEVICE_TABLE(spi, dataflash_dev_ids);
+
 #ifdef CONFIG_OF
 static const struct of_device_id dataflash_dt_ids[] = {
 	{ .compatible = "atmel,at45", },
@@ -927,6 +934,7 @@ static struct spi_driver dataflash_driver = {
 		.name		= "mtd_dataflash",
 		.of_match_table = of_match_ptr(dataflash_dt_ids),
 	},
+	.id_table = dataflash_dev_ids,
 
 	.probe		= dataflash_probe,
 	.remove		= dataflash_remove,
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
