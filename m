Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B2FDC433F5
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Feb 2022 05:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1hwg7AZcvQlKLg851XUU4pcXw0nzpBOoL5vAvp+rY1Q=; b=PXTAnQplDyx0h4
	uM3G67Jfpd/eGNp+FmOiohX7mMubkEB+AGc3+DQB9kk8KhTFW/v+jKE0xHHDrkRbbzhVuVAmyCapq
	gQ1Dvy0CbNfe7OBb5WE6qUimfkcCVwL4FbwlULVCzYpjRjJl4HlINVLAxDwnOeUwkKEkTqmN1cKbT
	hQWyK3GPUUxjVE44bQQIFbYzwfePRebD8jm1BvDhfzXc4N6YOjXU5ArlABRTnAWYCYElA2SyR+FKw
	rhk4JWcSji2Bn9gygMYLMLJ5TlLA361eP1SvxOMLNpS6EmizE8ICLcPnyYu2TOYaYOnJSGDFS2Phk
	Tv1a12VzGhG1amKsXjhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHfcp-00GGVK-JQ; Wed, 09 Feb 2022 05:34:43 +0000
Received: from mail-bn8nam12on2077.outbound.protection.outlook.com
 ([40.107.237.77] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHfcn-00GGUQ-3Z
 for linux-mtd@lists.infradead.org; Wed, 09 Feb 2022 05:34:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i066eOzf6ePeMwO7qZBCmmTRL5frCAVUH2Q+5bUWxDP+L39cjTS1HhRLmlVdxPY2/OJ/OZV2nq08sAvWJyM+V1yyC5x0jpK1RXfSA8NJriz3i8O58jzWsa7DA7+L8TinBik0ExIO6jXpmNYfuViXOrWJhBZrO7uicBp6VDUzhi4xTmzz/J48lILvbUy+ZMuFxxdChma1CPb7t3zxQV7YIQYOb43VhF7UtlYfGJYsiJBv+OndJXutjC7daXQfU4BAy0hmbLs9Gch19IXIYltSSl1m65Ozoqwd8XGI32D+G/oIiD9968OKH4qmBdgJrtRfpV3h2z3yoGMHZT06n8Qoiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NU96ABsEwkCOAk2k+gW2zoCe4zQsiyREY4XgHyCEBjg=;
 b=bO95c8uL/ZqYY41ne78g+R0lvV0zmm+rjlRpNIiYY8px0Z8oXtXyFeHnb8FI8DnX5MPcTonUMk12Ngo9+xxQeSc8VVwmcTmxT8cWQ70KX6tpU5ps48G5wgAqXObH1IlFveLTJEsRIMW6/g7yQEtIrKx3U9MPLcpP3PLWozulOKdOm/kFftpYeAItHn75XXEWnuwtEsoostgbCQluriyDAvJy4k3DiF85vRcZpgwNSjO0U66wFhNQPQcefNVfqiYV8ZsRiEWc8vIVmWztfr3PaNSUqosFaaKstrHACwEuEwxX+TYmNuXKpxnaJNaWVeLpLIItZ99DU/3NlEWDFpPNGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=bootlin.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NU96ABsEwkCOAk2k+gW2zoCe4zQsiyREY4XgHyCEBjg=;
 b=jg3cdPcg515O3GONQzTcvw0pLkBOK5kq01n8h7zE9w4A8ps539akIei/kUlB6IVX0X4AvyziRk5c5xIC1G18rPohNtU/KwhOrkuGT7qqEpWlPuW7ADpjuhfk82up7dem+gXSxNCO1e3kBqS9mrUREBStNrUIoLsWJQ3v6UgZzV0=
Received: from BN8PR04CA0026.namprd04.prod.outlook.com (2603:10b6:408:70::39)
 by BL0PR02MB5393.namprd02.prod.outlook.com (2603:10b6:208:81::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.17; Wed, 9 Feb
 2022 05:34:35 +0000
Received: from BN1NAM02FT031.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:70:cafe::f6) by BN8PR04CA0026.outlook.office365.com
 (2603:10b6:408:70::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11 via Frontend
 Transport; Wed, 9 Feb 2022 05:34:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT031.mail.protection.outlook.com (10.13.2.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Wed, 9 Feb 2022 05:34:34 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 8 Feb 2022 21:34:32 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 8 Feb 2022 21:34:32 -0800
Received: from [10.140.6.18] (port=58200 helo=xhdlakshmis40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <amit.kumar-mahapatra@xilinx.com>)
 id 1nHfcd-000CJW-JI; Tue, 08 Feb 2022 21:34:32 -0800
From: Amit Kumar Mahapatra <amit.kumar-mahapatra@xilinx.com>
To: <miquel.raynal@bootlin.com>, <nagasure@xilinx.com>, <vigneshr@ti.com>
CC: <richard@nod.at>, <git@xilinx.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, Amit Kumar Mahapatra
 <amit.kumar-mahapatra@xilinx.com>
Subject: [PATCH v2] mtd: rawnand: pl353: Set the nand chip node as the flash
 node
Date: Wed, 9 Feb 2022 11:04:27 +0530
Message-ID: <20220209053427.27676-1-amit.kumar-mahapatra@xilinx.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7044c44a-c3ba-47cf-5e51-08d9eb8ddb11
X-MS-TrafficTypeDiagnostic: BL0PR02MB5393:EE_
X-Microsoft-Antispam-PRVS: <BL0PR02MB53932330A7224987BB2D76E9BA2E9@BL0PR02MB5393.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hucCXKOSFUAlK9vgvgiFDOV2zRGIRkaAJvrAGweyiT1BIjuXOWiIcCRzMmFjuKfa9Vkt89sl8VnooKl3tHQBsGabSkJiM9MwJ7DTiE475OSSJkT3tXGsS9mewbWisgQ23UHpNeqLVaCvaPsRfaZ5UrRHo+O6KNA+Cm8gGwb/i1DnBzFJqBLDTQnraVErGU+6LwoIIP8PkshjymR3DIl4w0/aTuCP2yvlRWObS2cXxMnJSrmQCG6wb0SynzPkzsrqRWy4qjjqc07aPx78AMnoIuJM/Zw2Jq/Q1l3JWDoHkZsNH7pTvlRbZfTWlhOpAC7XHha5DOszJ3xoO5J3yfIqOygHoyTvwtU6gztykPgQg9dY2H2DYObZCeH5+4pwf7dl0GUw1VJz+WqhaM8QLIWpeAnorjsrm9hD3Kk9GKIFQ9CdPcyzyRIgRRUE/HhH1Jhpu9jE39cPnV5kKx9v0GVjWuxCa6oAXfGdc2JxTVPhTjtKVu8sz2q3UH9EvwOSN1/pGEHwBjJE9ECGAZMV4eUIgE57RLqxtVKdBN8WPGvU7jfVhmbuM6tQpfFvCB731CyHK6ZTg9kJItj8AMrbWse3AVScqjnc0SXfElYruH6CzC040LKahmAT4Z5P2eFcLydJUrViOvWSIsyFgY2CrNWP6vWkd8XSrWnTNgaCkK/JcDihOqm3ehhh8GjAaKIWgUGf
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(46966006)(4326008)(1076003)(426003)(336012)(186003)(83380400001)(356005)(110136005)(2616005)(36860700001)(26005)(7636003)(107886003)(5660300002)(47076005)(316002)(7696005)(9786002)(70586007)(8676002)(70206006)(8936002)(6666004)(2906002)(82310400004)(508600001)(36756003)(54906003)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 05:34:34.6338 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7044c44a-c3ba-47cf-5e51-08d9eb8ddb11
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT031.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB5393
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_213441_195230_6E9A4E54 
X-CRM114-Status: UNSURE (   9.67  )
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

In devicetree the flash information is embedded within nand chip node,
so during nand chip initialization the nand chip node should be passed
to nand_set_flash_node() api, instead of nand controller node.

Fixes: 08d8c62164a3 ("mtd: rawnand: pl353: Add support for the ARM PL353 SMC NAND controller")
Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@xilinx.com>
---
BRANCH: nand/next

Changes in v2:
- Added Fixes tag.
---
 drivers/mtd/nand/raw/pl35x-nand-controller.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/pl35x-nand-controller.c b/drivers/mtd/nand/raw/pl35x-nand-controller.c
index 8a91e069ee2e..3c6f6aff649f 100644
--- a/drivers/mtd/nand/raw/pl35x-nand-controller.c
+++ b/drivers/mtd/nand/raw/pl35x-nand-controller.c
@@ -1062,7 +1062,7 @@ static int pl35x_nand_chip_init(struct pl35x_nandc *nfc,
 	chip->controller = &nfc->controller;
 	mtd = nand_to_mtd(chip);
 	mtd->dev.parent = nfc->dev;
-	nand_set_flash_node(chip, nfc->dev->of_node);
+	nand_set_flash_node(chip, np);
 	if (!mtd->name) {
 		mtd->name = devm_kasprintf(nfc->dev, GFP_KERNEL,
 					   "%s", PL35X_NANDC_DRIVER_NAME);
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
