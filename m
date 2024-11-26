Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EB57D6554C
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Nov 2024 18:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fie1lUVBR/PXkSFmHhaH60rmbnaflimCis+7YJCJdSU=; b=MJniSmF99n02m1
	Y1j/E8g0AyhE0O98UToqkKUB3k9yB67lLK8wVVREu11ZiaQ4/1cOddCj9qIWfOdRYGTiyk2CUfhhY
	j7hDUYOipc6LaLnMjGaLptqy9WT9RfFxvdpFAXxDdiM7NWzVIqZJ18MicmX8FHNwdT3YXOpEkgzqg
	OUf2t0c1aZZ2uBiqSJo1S1C2+9v1tJJc/VyrvdVCNOT4Nt5pPY8OkrzCKP5dcT9higJWvIVY9EV9r
	bBcHonEe1JvSmWC5BXgfAoKBDU814sB3Un6W2vQpf0Rv2Wa7380C5YgadkIBII3yqALO5GYsA2h4i
	7YZ0NDho5d7C7eiRJmJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tG0mG-0000000BUQ6-2PFh;
	Tue, 26 Nov 2024 18:59:12 +0000
Received: from mail-dm6nam10on20601.outbound.protection.outlook.com ([2a01:111:f403:2413::601] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tG0mD-0000000BUOb-1jxO
	for linux-mtd@lists.infradead.org;
	Tue, 26 Nov 2024 18:59:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G41Alc3UUJUNDWgqVCTjN98sj9yxX+UdxInHLxwpjkJ/E8751/WujDasuzROPkPeB4es8CAVn5bGYbubYcMtUOpgZUtVPkQVr8ovzawANCF70tS3zg/b/c7vEv5KFyu4TOrpZjxlcRkCjAV68avVgXRrJykjNSlrDYbeNT5VyjVZJSKxpMzrTAHQ3hrca6fpNItoDksLreAqcjSE+dIkt8O4reYlBPpNg68PQwCfjsZ9bsSt/MAmek5JTFku4Q2nkeleGJiLfqi54CauEyLTqz+lqaRMtJvZPtm/WwzMPVSsGXuaiaMK+S/zu+2iJSeSIKhSqdZImAmouyoe5p+RHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XkOHSqbEuu4QqwaKHJb6i/LznXpvgtxaFsmeJH81qQ4=;
 b=CnUPl5RruJd/vqpH4/yCSMXpxV8DpmM2DxegecI9LhDMsBgpK2nhy4b9LoSM5nBr8ui+evZHwPn/cOX6lC41Rc+iuC3tsmpyoLctsiQDEWX8B7C9395co+1adByKhFWqpPbs+NYstzNd4W/Gm9W6ycLm7exWyivHc2cWMK/ie93UHe5qYQUHi7PKaZA9lZqhr4tSTiYd0/GZNn88VL8u6+0reOpkhtwUVh7uUkAYVprogAKDQA+A2+pcvrMl0y+SVoX3fyPmoSrojXLsxthZyFoIztw2PDQxb3GkJu2gk0zEfjeEYDZyXgZk3y9Ig5rV3ppENYD2qekk92lBlmrD5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linaro.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XkOHSqbEuu4QqwaKHJb6i/LznXpvgtxaFsmeJH81qQ4=;
 b=ZmJIwtzzEawxa0cRn/V9FnNgL5J/bxMUwgXzgKBdqMMS6EuO3CWozBt5Ol3fj+i3j+oaKbbIZ13+Q7c+0bpl4OVMoYVCv1OAMlejxGttrdBdQYWWKoMuh+u0FjdenbV2UKZ68th6g6IUZTujb8KYc6jzJWMbgZgH+XYWKPyu47dBY2gbEYGv+Wm19XbLfwQjpeTNgotCgVHxtDLrxR2ExLDx/upXvvZcGrPBwtcBA6uFRBGjpKzliGed5eoLSaXpCkBfJeipk7mOMadl0JbcsnfrS7iOr/qDjf7U4NlKfqWOjfXpey9FNddkPn3i5YWIsxhQPNosxHPhBwC7m6EYyw==
Received: from BL1P223CA0004.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:2c4::9)
 by BN5PR12MB9463.namprd12.prod.outlook.com (2603:10b6:408:2a9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Tue, 26 Nov
 2024 18:58:58 +0000
Received: from BN1PEPF00004683.namprd03.prod.outlook.com
 (2603:10b6:208:2c4:cafe::82) by BL1P223CA0004.outlook.office365.com
 (2603:10b6:208:2c4::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8182.19 via Frontend Transport; Tue,
 26 Nov 2024 18:58:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN1PEPF00004683.mail.protection.outlook.com (10.167.243.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8207.12 via Frontend Transport; Tue, 26 Nov 2024 18:58:57 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 26 Nov
 2024 10:58:42 -0800
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 26 Nov
 2024 10:58:41 -0800
Received: from build-va-bionic-20241022.nvidia.com (10.127.8.12) by
 mail.nvidia.com (10.129.68.9) with Microsoft SMTP Server id 15.2.1544.4 via
 Frontend Transport; Tue, 26 Nov 2024 10:58:38 -0800
From: Vishwaroop A <va@nvidia.com>
To: <tudor.ambarus@linaro.org>, <pratyush@kernel.org>, <mwalle@kernel.org>,
	<cmiquel.raynal@bootlin.com>, <thierry.reding@gmail.com>, <richard@nod.at>,
	<vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <jonathanh@nvidia.com>,
	<kyarlagadda@nvidia.com>, <smangipudi@nvidia.com>
CC: Vishwaroop A <va@nvidia.com>
Subject: [PATCH 0/3] Add support for S25FS512S1, and MX25U51279G
Date: Tue, 26 Nov 2024 18:58:31 +0000
Message-ID: <20241126185834.1130949-1-va@nvidia.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004683:EE_|BN5PR12MB9463:EE_
X-MS-Office365-Filtering-Correlation-Id: be7ec3f4-4887-4c21-94ca-08dd0e4c61f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CNkEaXhbB2yX7fhQX64jIQn35el1w9qU/bm+1XZneafbkttr8n/flSyXVoh+?=
 =?us-ascii?Q?bA5sntG4cjyuBA8xfKqQzMqpPoAtRMfH5NJhQw4ypH9Dq6qSCW0Rrv1KbFLH?=
 =?us-ascii?Q?YtL1BZ2f42FIR08hD5Y5yOLjjQK2liyIDz5EDUgwD9mcdfvXZBcVBEur6iaa?=
 =?us-ascii?Q?aqcNZBgI6qFZqQ2xwNK8n2cWo19+6toZkdOmZxpMez1T2NBVslQbcGLq/ZqV?=
 =?us-ascii?Q?xbCeBO0cn5S2zZ/iTB18JDEIW9zSJJDqG1l1SmbALFqAxHleH4T4Z3dnBC+K?=
 =?us-ascii?Q?I/RkleS1DbrP6TRVme9iNmMHl5O67vbxZNn7Fj7+LKme4B0LWpuL8q268j+U?=
 =?us-ascii?Q?1hYgXMobnnAos4f/JwBZhu4vQKQxE8uqzXrafBNjZGeHT+los+uJEdcoO38H?=
 =?us-ascii?Q?U4mzTuS4SK6+L/4Cx6FcvtmiXdHo7FZYaMAUZSaWf/sWgMz2ie/S4lNIct5f?=
 =?us-ascii?Q?tnuiUJiXIUMnFJrbk1iZygpotYKj2Jqm+kBvDJmXvDR08dVcn3u24cMl8pqn?=
 =?us-ascii?Q?Jwfun1ogT6OZJNePW7Xwr0TYFoO0e3lOF4OZUOZ/enjgPLALe9LdOHnZQvPs?=
 =?us-ascii?Q?9SNU2kJ0OFqzzeGbS6DWDZYPovWoFJILgGzShFMx2g3G4ZgGwR2CcxdGXRFh?=
 =?us-ascii?Q?Ja+U/5oUmKunn+hlOYj/ZTPMQQrsY1X95DaLRATUZOlvzeNESUeAC41Ki93W?=
 =?us-ascii?Q?BozhgrE3L/AQvu4ssYdEu1dIyX7caadedCxEprpa4s+PQfDMl6DGV/+ehEy/?=
 =?us-ascii?Q?QplXamIY6kMlXAQBsUyyj1XpI05Q0+ByC6qXr0FkLnjuPERXwg2IaURUXQ74?=
 =?us-ascii?Q?w/pYEG898WBCYdIdiUhHtkwuC+pNYs9zM0hKpcqGAe1bO5F911mnZpb7URW7?=
 =?us-ascii?Q?PmDVvPzNQPZFRXfci+tGoeDsH9OX5/uEDqeeFWNMS9R6oE1XopL4JHIzuG5o?=
 =?us-ascii?Q?veSrastnPgTmx+DJ2TCK8vWmLepsxGj9IFdi4HkIiPcB8Mhb42FHMmzh92Gb?=
 =?us-ascii?Q?IF9wnJ6WL4cQOQLER6sWx2dKak8NDz16BbeMoOLXL0P49BInXAXPM5FqKu0e?=
 =?us-ascii?Q?zi1ME/2nJq8OwHLWkFN3bqxLSECfbheTSJ6TOB9L7ZEYB5gpdQad69/G3KgZ?=
 =?us-ascii?Q?IUn3dZGpOGhh+guu7t8RJLEpcROlCEIg2rETpI+SQPsul2Zor+1p/6flKfS9?=
 =?us-ascii?Q?bSPPfHdtSkPWnRDjbCuw1PWOxghytfGRVCuJeU4jsPHoMtcmXZO4/HRB5IJn?=
 =?us-ascii?Q?+aUCFLldF+S1dRly8pWhs2/PaI4WiKfW5YlleCb39pAhNDktNqAE5/rCoe7K?=
 =?us-ascii?Q?5ywEpHX0L9z9m2WIKY4vN2dgGC0DsOO2zz7X2t8OvvZHUxlYlPowKn54f3v3?=
 =?us-ascii?Q?48lKzVJzsztjjSYuvwEnV9n+Ci/FG+v4se+TBYQpVyESzj4zuqYg13lrSlre?=
 =?us-ascii?Q?Skbqo/NnAKwWfJKVj/i3MFOyPhz64AzwRXoXswGE2Zzkv0K1hO1bsg=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 18:58:57.8391
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be7ec3f4-4887-4c21-94ca-08dd0e4c61f5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004683.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9463
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_105909_465576_339A4674 
X-CRM114-Status: UNSURE (   8.66  )
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

This patch series adds support for three 64MB SPI NOR flash devices:

1. S25FS512S: Add a post-get-map-id fixup to address an issue with
   the SFDP Address Map incorrectly reporting map ID as 0.

2. S25FS512S1: Add support for this Spansion device, including
   dual/quad read capabilities and s25fs_s_nor_fixups.

3. MX25U51279G: Add support for this Macronix device with 4K sector
   erase, dual/quad read capabilities, and 4-byte opcode support.

Vishwaroop A (3):
  mtd: spi-nor: Add post-get-map-id fixup for S25FS512S/S1
  mtd: spi-nor: Add support for spansion s25fs512s1
  mtd: spi-nor: Add support for mx25u51279g

 drivers/mtd/spi-nor/core.c     | 25 ++++++++++++++++++
 drivers/mtd/spi-nor/core.h     |  4 +++
 drivers/mtd/spi-nor/macronix.c |  6 +++++
 drivers/mtd/spi-nor/sfdp.c     |  7 +++++
 drivers/mtd/spi-nor/spansion.c | 48 ++++++++++++++++++++++++++++++++++
 5 files changed, 90 insertions(+)

-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
