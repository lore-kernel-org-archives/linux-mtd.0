Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ABE8606A325
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2026 11:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dZzvWmsV;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=a+QUakx4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References:Message-ID
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+gx5UOINw+LQbYCi7I0Ix+kBP14wkvNdr1AWTooNdPk=; b=dZzvWmsVWAnZMl7ann9v/Ml6nD
	6vNi+pY/c9rXXFO4otNuVrdvRSutFhP+8sgj7CZmXcDkdT6QN+q4S3nEXJsK+8Gvu2J06KMXIENB5
	RDH03w0Mzqto2bbH40KrwmK+0XQfSxnyst8jWcUWP9LsYrGmcI6PnO2lbaLB+bXjgs03lzFOTqV2S
	dNVPqrDzn4zMte6GvdtSXh0iPDlzD2lP3m+L9eZXtnWYuHtY1m2IDTEQJBDu8oBFMa0yRe4DdERAt
	cCaOtLShQRg/M8bRqBn9elorHGJKbcQopHP2FXXOvqTxQ/Q+ELApgQqQQ6UTCycBjZqiI21UWbbVX
	O4W/Jxgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMO5-0000000EguH-3RQi;
	Fri, 20 Nov 2026 11:02:37 +0000
Received: from mail-westcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c112::7] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMNx-0000000EgqX-14wo
	for linux-mtd@lists.infradead.org;
	Fri, 20 Nov 2026 11:02:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z/HeKMwQxTSEblmun/ZyBVCeFB4zZKoy0lL8esWgnsDuXRvtiE0ZYiXgTHkdRQ591fCJcY+mAoHuc8lhdJvdPrkdaPXYfBB1B9jrbNmmAJ5TkIQiBfXh/UWd2dyhgUAM56NfTv9opC2ChXoHNSJng8LPxRBIi0BTbXG0Pc5EAwPjIOMOoFG99cydAoiZDvdQ3nrMmYnZEtw0p4HnB6h0OA4akhEo+BgcwVBrl5yCvXVTWGBQKzhx2RkNUtvT+FhEVc6iprAImGrSyWDqAn4vHPwcu6qSxekIGSbKXAk6o/RZBtDGFrpYvYUdGM+BIRKg0UV8dJnkOltVCdRzZ9O7gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cFOGD/X3Q0Gnx5XymDCNo//QoWnkJkBjG/Y0Fwbionk=;
 b=MFdigN5gzjVb+f+2LOiWt1x+ybm0B1YLUb+J+QoylA87sKha5x2ZpUAK3FClp5/YKpTiuGbH3t1h0QqqEWyvB+0FUhTne1BFfijz1fVIAK2RACYAOPTe6JXcCxgtP9h9SO8yU+vAdHwx5IwQfUADA/PdEm2VXuvmqECqUHrKvDqSXTLtk/osJpWS2fogahTSOIhDSv6WpYwsGoec515DnnaRQC7qlbM2vxBN2HzpX9orvsLl5IKA1zAodYbu3KPLIL2jVGs9e6L5zgJ0pXS5fg94619bjo/pi3we7ohOhz730MeqUbs0GW4HWtHH61B+X9FddE6f4Z4/ym6kzmsZgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=infineon.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cFOGD/X3Q0Gnx5XymDCNo//QoWnkJkBjG/Y0Fwbionk=;
 b=a+QUakx4WOl3hhG0I/Hj5lu4N/AtpmDbhThJWAwcr7rakHKsAJEdMH+rgcuY4IO58w3sVdnIdFfY1n1ANHg46SKU5kER5bhWHXK1BM3cpsLSPbGMe/KCFv3n82K2wg4lpyn2oNN5Pw5Ae7ty8XMNb1VCvz/SLpmJ3HRNX5iq4ZI=
Received: from BN9P222CA0026.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:10c::31)
 by DM3PR12MB9392.namprd12.prod.outlook.com (2603:10b6:0:44::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.14; Fri, 20 Nov 2026 11:02:18 +0000
Received: from BN3PEPF00022BD9.namprd03.prod.outlook.com
 (2603:10b6:408:10c:cafe::7e) by BN9P222CA0026.outlook.office365.com
 (2603:10b6:408:10c::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.12 via Frontend Transport; Fri,
 20 Nov 2026 11:02:18 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF00022BD9.mail.protection.outlook.com (10.167.248.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Fri, 20 Nov 2026 11:02:18 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Fri, 20 Nov
 2026 05:01:46 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Fri, 20 Nov
 2026 05:01:33 -0600
Received: from xhdlc220225.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Fri, 20 Nov 2026 05:01:30 -0600
From: Srikanth Boyapally <srikanth.boyapally@amd.com>
Date: Fri, 20 Nov 2026 16:31:15 +0530
Subject: [PATCH 2/2] mtd: spi-nor: Reset flash device on resume
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-ID: <20261120-nor_11_20-v1-2-70332a54037f@amd.com>
References: <20261120-nor_11_20-v1-0-70332a54037f@amd.com>
In-Reply-To: <20261120-nor_11_20-v1-0-70332a54037f@amd.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, "Vignesh
 Raghavendra" <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<michal.simek@amd.com>, <git@amd.com>, Srikanth Boyapally
	<srikanth.boyapally@amd.com>, Sai Krishna Potthuri
	<sai.krishna.potthuri@amd.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795172476; l=1189;
 i=srikanth.boyapally@amd.com; s=20261106; h=from:subject:message-id;
 bh=yN9aPxQqJaDsOAbpE5rSLp2yvlgLBx1lKHuc2w5DwGU=;
 b=K+mCIjqgT45hpbb99l6T3JTJtzM5HWyiLjj4+QyNz6na8/0774w18/m6dxAHKbXN+16SQQE0k
 1mFwkI8WZSOCsRD/KkrMiXh0mitMJzTAV3C2Fw5cHGvbmisX2BDZ7mn
X-Developer-Key: i=srikanth.boyapally@amd.com; a=ed25519;
 pk=VZiIwz5+m6FvZJ+3hzpXDQl0u531OPVeBcB2OVGeZVk=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BD9:EE_|DM3PR12MB9392:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fa3e730-beed-44dc-5809-08df46f5be38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|36860700016|82310400026|10067099003|261102123227099003|56012099006|11063799006|261026140227099003|261022105027099003|261022075727099003|261028144727099003|261021121427099003|261009223027099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: V2reefnQQTjnsXJxts7q6jyJ6F8yIefGKAtpPvVPfLrfeAwgJHvJEXUxMLTdA9YG1QGM4IsZRj79Fc2qm3JPKz6dQsv+50FCA7XcyNgK0GfFV2LfEFuk50HOHWMPkvoEnMm8lMurkzed1SSfzHqC67YxzVuBroFEW9j2gE6xTUzahfyNKHtJ4WAGX7OW4laZp+XSozbN7nAgnzIYtmEu9M5VazbPr/48lw0xxCw920/8s72VjeiKy65ILi8Kpvi9/J1zKdVI6b719nY3BJu1gyRdMUh6/ihrALtFBakKcxMIy7nScN8vpk5l0auBhV1vP1y45etbZi7MufR6/CZOhHft3wPZPDvXPFgkrfmAYv720c4J/Caj0N7Ld1OBqN1meGQd6jRbgjUbxhHvRRexN60ZKsX63iFF/fZigzVCVO+cjHmtZ07N4Jcyl8t1N7O+xl0Ex3wmcDe+XBvYV1OG9kMkmRgIwbdkWZ1R9ywNSRqW0bZXHfUJMlAY7zNEzLHsZzLscadiKJdur6y3CIXpgcnFAXanNWR/DT253BIWCPWPXj3WYgO0aP8OhfiBNC0KQr9SR2lgc3E14pdVLgZGW93xmycEws+FZ/v+YicWYNzUAQLNnJefrVqzZET/u3j94/Vwh1Gm/Qr53PZEe7mD15uVtXkeTRhZwVAY8o/EcYOJ2K7GYd0jI1EblMl1MSyRQa6XhcjRLlb6n/J7WZOq7g==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(36860700016)(82310400026)(10067099003)(261102123227099003)(56012099006)(11063799006)(261026140227099003)(261022105027099003)(261022075727099003)(261028144727099003)(261021121427099003)(261009223027099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: s1w03b64bca0f5DMxtnbCPP8EzgbtoRL/IXatub0qClJHq2juqCiPPumRc+wMDTncxHIX9r6dXRvtYQ1jdJK9Px7KgRLFOPiDfUw/ybYqS/qd96Px/E7uvyKTlccSQzSBR9HYLjVQ7utTUXmQolk/fnpkcdz7ejL3YDvSKp6AhPwIoRHIO74aN8hnvnujPXAsXGc+C+ygJ3Nf1UOsbMNVSjJQ2PXgTrmMUh7FKuL8Pel3oKXMQH1K7CpIC1pQCRjxHRbXky7rgC+LevN10Pw9xT7ZvUH4cmYITHtGJGo0ss1Ux9cCGcwKEOpWD9uBsWnWQSmE+XsUMjllnz25PG/camz4k463W3CSWUuAKw8EJsQII/JTDp56qOe66mxEASVPWMPx3WvWz8nzVDcr9f2XtwaZb0NMcnkOu6+M0UF4hvKpQwmn10bB1LJoOqSe6vL
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 11:02:18.1818
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fa3e730-beed-44dc-5809-08df46f5be38
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF00022BD9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9392
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_030230_821201_44B04D58 
X-CRM114-Status: GOOD (  12.95  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>

Reset the SPI NOR device before reinitializing it during resume.
This ensures that the flash is brought back to a known state before
spi_nor_init() restores the device configuration.

Signed-off-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Signed-off-by: Srikanth Boyapally <srikanth.boyapally@amd.com>
---
 drivers/mtd/spi-nor/core.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 11227f8fa8ea..29bce6b7348d 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -45,6 +45,9 @@
 #define SPI_NOR_SRST_SLEEP_MIN 200
 #define SPI_NOR_SRST_SLEEP_MAX 400
 
+/* Perform a device reset */
+static int spi_nor_hw_reset(struct spi_nor *nor);
+
 /**
  * spi_nor_get_cmd_ext() - Get the command opcode extension based on the
  *			   extension type.
@@ -3191,6 +3194,10 @@ static void spi_nor_resume(struct mtd_info *mtd)
 	struct device *dev = nor->dev;
 	int ret;
 
+	ret = spi_nor_hw_reset(nor);
+	if (ret)
+		dev_err(dev, "device reset failed during resume()\n");
+
 	/* re-initialize the nor chip */
 	ret = spi_nor_init(nor);
 	if (ret)

-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
