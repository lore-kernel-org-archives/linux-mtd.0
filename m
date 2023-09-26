Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 309E8E7E62E
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Sep 2023 12:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TUUcfH3RLzAnqlGDHHNO8eMBZtd5XzG8AyHmydxwzTU=; b=A/74jeDCq+vOlG
	/QveMxhEyaozkc/GacjRN5ozXSdJYZKlZxbyEwBDW7zeKhqJCRPYUJc2rsj5LkRkmFkoDuJmB8sc5
	bB4W4covqVFD7HHfOan3pZ/BHPa2CuFhB7Oj1nMyDKxoqGlvky7i/82ROFlcZsIWG04/c1cajGB7v
	2+hOv1lfClvRmZW7DnQB7huuWUHVhk+SDUBqKkPT4rTDBqCYz8Hl3sRQhrv4TJF/gvZ2KdVfJ/TE1
	Hnl64RxaPQn6HrdIsZG/I27b4Tz+vVf9OtJo/XOr5IIRnsyK44C2J4kQHhCm4tZi96i9ma57+Gg7W
	GM9LWkAYZ7UA8FMXLfZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ql6x9-00GL92-2n;
	Tue, 26 Sep 2023 12:14:11 +0000
Received: from mail-dm6nam12on20604.outbound.protection.outlook.com ([2a01:111:f400:fe59::604] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ql6x7-00GL8b-3C
	for linux-mtd@lists.infradead.org;
	Tue, 26 Sep 2023 12:14:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P2cIpreUlBh4WKOIlVda53niYlBay0RKCxZ+VjKRRov7X+GWsQx6vdfPoBupMVecbcSogvPexSiFnZBrU/3bmOlDsuNlaCXgwmOQSy7MYKssWBlBAGeoQ/ekOnOuxdiIY5+nHEMhwrt7yIyqb6ODC4r/3H77Ihe3zQE8efwSJFqaUPvcQzq/k0U2V15YrihHlGrtSWsjXx4Ly4hWWp3ka78Vdb2LTTO+o4Bb35wz8FwSysgEZuinDHQ4qHvyqnfN5c9yOA3fjIymTf1/+HZqFsWLHhZ4R0m6wrR0AH3wHQW6hl6xu215zCxKK40U2hWyojA4aaA6/3IMKuWUzrIwJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JfszOCIyKig4gfMdxp1fH3WfZ1UYJ562Uac8fG+a9Xg=;
 b=kyv7gE8yg2eoeHDrzyoorqkRvmsopNHEMcuwbSlVqQ11HkoeWCgj8kaKknpVB6ixE7qdVFf66lYTG107+bjVadCk2Q9AUiZ06iinrZP2LpyGQKeKHbvUSasPEh7dzliIzfLz1zUc6KxJrCasjsrNl8vW6TdOIykq3YB8vMykT8T1nJfOBILL00vyFRXNvmmSqTaPKsVI//y8kR3R5i7j9+jrcFBFDFhFI+Vj8UvCzajKyjhbiYAQmB2BtR+6zIOinDe6NheLn6X8BB2K02iExwtpheZqT5zbfIVMA3wONYl8ix2AhWJsLEuRxaalbVs94jC3vTsRwAIpRsXTScWtxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JfszOCIyKig4gfMdxp1fH3WfZ1UYJ562Uac8fG+a9Xg=;
 b=wzUPb2CcX/L03B86fV2cV3EIUt76ijD5or5H/mX3FQgEMGGAFGtcSTUuzmLTpt8obPLK3Kx/NxERbMfyOSng6t0zdRNyT464X2FjL0PsdxRzbBdZetwfGdEPl6SW1IpzYXXEuS/4+Rx/M7OZzkWwUX/dIkR7LXJyn/P/fxjLIBE=
Received: from CY8PR22CA0017.namprd22.prod.outlook.com (2603:10b6:930:45::20)
 by SN7PR12MB6931.namprd12.prod.outlook.com (2603:10b6:806:261::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Tue, 26 Sep
 2023 12:14:03 +0000
Received: from CY4PEPF0000EDD4.namprd03.prod.outlook.com
 (2603:10b6:930:45:cafe::36) by CY8PR22CA0017.outlook.office365.com
 (2603:10b6:930:45::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.35 via Frontend
 Transport; Tue, 26 Sep 2023 12:14:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EDD4.mail.protection.outlook.com (10.167.241.208) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Tue, 26 Sep 2023 12:14:03 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 26 Sep
 2023 07:14:02 -0500
Received: from xhdsgoud40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Tue, 26 Sep 2023 07:14:00 -0500
From: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
To: <miquel.raynal@bootlin.com>, <vigneshr@ti.com>
CC: <git@amd.com>, <michal.simek@amd.com>, <richard@nod.at>,
	<boris.brezillon@collabora.com>, <linux-mtd@lists.infradead.org>,
	<akumarma@amd.com>, <amitrkcian2002@gmail.com>, Amit Kumar Mahapatra
	<amit.kumar-mahapatra@amd.com>
Subject: [PATCH] mtd: rawnand: arasan: Check for bitflips in page data & its ECC data
Date: Tue, 26 Sep 2023 17:43:52 +0530
Message-ID: <20230926121352.2250115-1-amit.kumar-mahapatra@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD4:EE_|SN7PR12MB6931:EE_
X-MS-Office365-Filtering-Correlation-Id: 176f3fb2-bd7f-404c-dade-08dbbe8a131b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iELQFNZRXj/sDWgWbTIQr5FqhLCh8PYyfgTNDrMZF91a95L9EmQXPGsRHAm9NFv1b0f5s/3uDDBT5YtfRY3A/UutwEvfoTmyd4sbdWJ54aTInAMy20N8zhrMOf42dJoMUNwGUktu5i9Iq3+gBdYiVc5LuLHFxw6OmKH8IFVnA1Ipuqz9qY0qhSa70VMCDs0f3Mcp7qoiZrg75LhPDKul9bS2vIMIuy45r81fv0/b1YNOPGkOUgi9pgr2eVCY66G+ZdirKaoHQIQYWxC0uApJIcXt4yg6yDvkT3IhsSISJjBA+ZDcw9AAsuPV9207MtR9ZYhulUwaq1DmyzULMTlJ8SSbvzHQezRZhwTiDhMI421yGGqXQGciil8uCl4n+kaZX/z21tTEY+gteVSw4Jx+1f7a/vrJy4K/AZuA9EqHNjZEDp+Ks9ktDE3nZsZs4YVzDD+i8wdIIcfWnwXWnNV3ngFdXs6EdYKVMpytDNn6KspLUKm8Zl/ZtPYBd2cFEAytjiQkRO/ZKRkhsvDs4WqXqy2lcj8sRmKLMyfDzaAnIcoXRGQFrS5NmqMSsjP3fpa2X+L/R+SrJDtBReigQ4DZ7OyFMPfsmuXEU5/yQz8dLzzdNMurnvk+FELBqwOlkiHvbOpKptRp+iqMwhCLpy82kDJiGc7RI7TFixewDq72crCkufgC04vuMyRTgkOgaeYdra7iUlf5o39RQ0VrwM8WGIMQztAgr2tk1kE00gDe5F43uKqh3m/eUxgDRB2cSamucBqoKQuy4WJmLWVwHKz8lw==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(376002)(39860400002)(396003)(230922051799003)(186009)(1800799009)(82310400011)(451199024)(40470700004)(46966006)(36840700001)(2616005)(356005)(8936002)(81166007)(26005)(82740400003)(2906002)(1076003)(40460700003)(8676002)(36860700001)(336012)(4326008)(426003)(36756003)(83380400001)(47076005)(5660300002)(86362001)(478600001)(110136005)(40480700001)(316002)(70586007)(54906003)(6666004)(70206006)(41300700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 12:14:03.7320
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 176f3fb2-bd7f-404c-dade-08dbbe8a131b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6931
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230926_051410_050083_86B5DBAE 
X-CRM114-Status: GOOD (  13.73  )
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

During page read in HW-ECC mode the driver checks for bitflips to confirm
that the page is erased one or not, currently this check is only for page
data and not for ECC data of that page. Due to this, in case of ECC
corruption, the driver considers some of the page data as erased page data
and overwrites the valid data with 0xFF. Update the driver to include the
ECC bitflips check along with page data while checking for erased ECC data
chunk.

Fixes: 88ffef1b65cf ("mtd: rawnand: arasan: Support the hardware BCH ECC engine")
Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
---
BRANCH: nand/next
---
 drivers/mtd/nand/raw/arasan-nand-controller.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/arasan-nand-controller.c b/drivers/mtd/nand/raw/arasan-nand-controller.c
index 4621ec549cc7..547cc82b5d80 100644
--- a/drivers/mtd/nand/raw/arasan-nand-controller.c
+++ b/drivers/mtd/nand/raw/arasan-nand-controller.c
@@ -481,7 +481,7 @@ static int anfc_read_page_hw_ecc(struct nand_chip *chip, u8 *buf,
 		}
 
 		bf = nand_check_erased_ecc_chunk(raw_buf, chip->ecc.size,
-						 NULL, 0, NULL, 0,
+						 anand->hw_ecc, chip->ecc.bytes, NULL, 0,
 						 chip->ecc.strength);
 		if (bf > 0) {
 			mtd->ecc_stats.corrected += bf;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
