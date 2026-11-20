Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F45F606A325
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2026 11:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=T3NLHE9Y;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=PSkrgagH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:MIME-Version:Message-ID:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=VRScvC9MvKTCQbnFtD+bVmMnrZm70AMN8xQKCkRnLGo=; b=T3NLHE9Y+RTRBrC4m6eJcYed76
	/5ataOGtR70J8XpWaTGF9JH4C6a0SBIt9gK7SLYSbDX64FzAfYH72Es43k8F697V9NaL98PEOEkX+
	MMZNIrDHdkRRp03WwDLVl6arbOO9WLtxJIhbBkMI3uTFM9Ej+xbn0bBhHCgaSdNeov/1I3EYn206U
	Nk3QZPaMEamdqOpQO/Tj23UrEWWduBtV0eFH/vccCc1vYocdLRIU4LGvC+X4X8yYiKWegzQ1NHlNC
	Tdr0HRv/AEk8u9Il3LrJv3t+H1XtDHNbmFQYz5ILNCon1dAgXdH0hjx/sbm2J7yoCygoDdnHHVS6U
	iyZf4Yfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMNb-0000000EglH-10C7;
	Fri, 20 Nov 2026 11:02:07 +0000
Received: from mail-eastus2azlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c110::1] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMNY-0000000Egk8-0L5w
	for linux-mtd@lists.infradead.org;
	Fri, 20 Nov 2026 11:02:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HS7jZ4u4cqkskPygNqJHe1EAu0u1r8ANPOcGnqJQshwWoM3tyHfdT+q1FgT0i/JzMwMVBtU9SAka2Etuc1Do9HdXT4d5WXJauqAZQWsCZB2RpYPa+RYntmxIoM+5tTVvlEczIjWi/JlSFb4ildJFEJC3oMFb0yrioMYa400gbWoXdl7EHW2UGVMSlelnOWqr1MZm9XoeRrJS+71zdw0GawDLDN+ySIxfc82lqzayJQLfTtWxJH8nNobdoohMzejE5tJy2r4dol94QDn3iURbhXMy8zQ2TZo1F20lg9L8a0/KwW45Km3P3GdQ/qHpjjld46mcZcMfWM/I3UzFOc74sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dEkkAmzVJPlzOhnp7OGwqcYzqVwEy2ZzSmPlOweWOYI=;
 b=SXypCGCT+rDHKdTmlb6r8ukFqx8YRJjU01rjfXV/am16Xd9Ouz/fHy4ccbKLQ0RyMjaNYtcbQfwzqgSHCZUOF5BigcS6e85pd5sBI8AdwHAPyD1v/Pj+gdqPUd8jerWieUc4RyBRaTxy0ORKqrCwdUstEalBgCHbToAUdqEVD9+WZSDastEieiOP/8qA778/fW6DS1jHhmXN6hnHBKHIL1yrNZb+LwPYBQ3bRdflgHDUjOkByVioRFG6B16Z/6fVA8yHua/dK0wG4hzK2vpvIikh19Ei1Evkdiys9e+o9QJOsvRqUS3Ps4sh46+b8A3cpqq9OpCVzkszp6BmU2KuqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=infineon.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dEkkAmzVJPlzOhnp7OGwqcYzqVwEy2ZzSmPlOweWOYI=;
 b=PSkrgagHGo/9IhMeYiSS2OW1L0D6Nv4T/g4jSSr5m/FjukU5WWZcyPDOtYAkxGZaPxWCMZSEX1VbCaiOtQbY4oGtU8Ol4ZcJ6DvjsTnMn59+03S8xSwCLjHDMNGnlsRBflgu1u0/rTSqf3L6+UPJsQs9DmtRGmz1SSTFmtMjtjU=
Received: from PH7P220CA0127.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:327::7)
 by IA1PR12MB8357.namprd12.prod.outlook.com (2603:10b6:208:3ff::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Fri, 20 Nov
 2026 11:01:55 +0000
Received: from PH1PEPF00062F24.namprd02.prod.outlook.com
 (2603:10b6:510:327:cafe::7c) by PH7P220CA0127.outlook.office365.com
 (2603:10b6:510:327::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.12 via Frontend Transport; Fri,
 20 Nov 2026 11:01:55 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 PH1PEPF00062F24.mail.protection.outlook.com (10.167.243.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Fri, 20 Nov 2026 11:01:54 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Fri, 20 Nov
 2026 05:01:19 -0600
Received: from xhdlc220225.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Fri, 20 Nov 2026 05:01:16 -0600
From: Srikanth Boyapally <srikanth.boyapally@amd.com>
Subject: [PATCH 0/2] mtd: spi-nor: Add flash reset support during resume
Date: Fri, 20 Nov 2026 16:31:13 +0530
Message-ID: <20261120-nor_11_20-v1-0-70332a54037f@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHkoAGsC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQyMD3bz8onhDw3ggy8w40dTSwtzMxDTVXAmovqAoNS2zAmxWdCyEX1y
 alJWaXAIyQKm2FgB6SyZkbQAAAA==
X-Change-ID: 20261120-nor_11_20-63a5987645e7
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, "Vignesh
 Raghavendra" <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<michal.simek@amd.com>, <git@amd.com>, Srikanth Boyapally
	<srikanth.boyapally@amd.com>, Amit Kumar Mahapatra
	<amit.kumar-mahapatra@amd.com>, Sai Krishna Potthuri
	<sai.krishna.potthuri@amd.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795172476; l=798;
 i=srikanth.boyapally@amd.com; s=20261106; h=from:subject:message-id;
 bh=EKFoSFf071LOYOkWiTaSFrk9uRosj95HpwKyluDnJXk=;
 b=FWEQxgnYehQyLo8QTecI91s1+8nV5yYhKZO+no6mSRE00TbBRUiPe1zVEPlfpbhWUdTR1hCYz
 pMCwMDvo2qbAcH1a2+Y3deazUIecXWOC6vpMSBhLI45adCVZda7lL83
X-Developer-Key: i=srikanth.boyapally@amd.com; a=ed25519;
 pk=VZiIwz5+m6FvZJ+3hzpXDQl0u531OPVeBcB2OVGeZVk=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH1PEPF00062F24:EE_|IA1PR12MB8357:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e50e6dc-b651-4358-acb1-08df46f5b028
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|23010399003|1800799024|36860700016|261102123227099003|10067099003|56012099006|11063799006|261021121427099003|261021123027099003|261022105027099003|261028144727099003|261022075727099003|261026140227099003|261009223027099003|18002099003;
X-Microsoft-Antispam-Message-Info: 7jeQjxHLNinKT26yhYsXOkgw7yWoKCHl2kTzBr4spuRHiGslzAb0uM9BqXxGjoh2ma3Ck8yHRUQ3Q9+kdKoB3jfkg6P+JtI/Ywq2YTc5J2a2VbACzzoC6w41rZi9LFwzSSZfrLeYCfYlYMRXXoMDz9abgLLIOYzdTJ4WfkK1b6OVXgRTMkzEeosVkdLEWOKF0Yiy5PZp4nnuWDKD68/EdUKNtElQjiTa8Tjqw4Jtzi8G9DK8e2n250TBlkrT/b8h08AqUZdrCUWOs5xBs/83IM3OseYH1neomfq9KBzFgXEMQ0S2ZzR1kPDWdtOyD3LgDFC6S8ldqt7vms8oPxRSDHetaoLzSDgkFPYoSWgeFCQ6/0BDTI9gaLNx1BCsSlvCEYU9pAHGPw0mc6u2Z+8AgL2Gas142neHXM6qBjQiR1u8EJFtF2FeilfMe4xaEj8KR2o/QeMMMc/GyvI/3BogmYfNjuzVM+RxuGtTMJxJETpBB67vcrRpV3g8O4vUnBqLj0X9AzViQnXEvwyLMxJQPJ4T3+7WoulbBVC2Qe01hSMrK1YPLa+NZSbwuJgW20S9puDrRakRwy6gZ5U8RA6YiQ/SNrfBy0YkvOrP9aBYtH575Kvvu8hO0oViTfcGMoUaffQi2u6EqQ+SJM/G1nj1Bk9oic7sSwdp3qjoyLsi/E4CLTD/IcfDo422+O7L8tFAe9XCWq/M3XwbUz+jrz5nkg==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(23010399003)(1800799024)(36860700016)(261102123227099003)(10067099003)(56012099006)(11063799006)(261021121427099003)(261021123027099003)(261022105027099003)(261028144727099003)(261022075727099003)(261026140227099003)(261009223027099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: OqGYXA+OMr8Q7qYiS1yIOMkW2fMEcdbR2ygNHw5j3vLkxEpTfOjYpzQcc+qy07sBBot5nzKoDxBTvyW9+lm3HLVBwXVmg5qIxRfLrFQlznMj50sF3f/YLPEDr52AxeFrghDUJd8FGv2ACCtWWp21os1Of5SaTdZfNz7/ZWrp/kT6dKkpUujKe22kwxZjNy4t7TN4rHtLbSfhoG/ZSV5JOgR6kfB+lEGqAwUwBFeI96o9LFB2tZW8yE4coF9oAp5p7UhwXay9DdShvOkLsdbJrY0XCv4jxMAoypXb2qDyQS2dLLAuC2YLu6VM9I4lwtMMr3dAUYodxLHSNwerADr2vKVCGjRqV2nZAWsTfIyxJjTDUdKi4lMiKFLARmJeY0WfVguqUJzyU8MiMHo/U2bKnGnZO8kWKJNTNZgGMeN6vnt5RHBsoLd0wCubPB2q/yIQ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 11:01:54.5509
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e50e6dc-b651-4358-acb1-08df46f5b028
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: PH1PEPF00062F24.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8357
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_030204_158304_5B3A2721 
X-CRM114-Status: UNSURE (   9.83  )
X-CRM114-Notice: Please train this message.
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

This series adds support for resetting SPI NOR devices during resume.

The first patch stores the reset GPIO information required to reset the
flash device, and the second patch uses it to perform the reset during
resume.

Signed-off-by: Srikanth Boyapally <srikanth.boyapally@amd.com>
---
Amit Kumar Mahapatra (1):
      mtd: spi-nor: Store GPIO info for resetting device during resume

Sai Krishna Potthuri (1):
      mtd: spi-nor: Reset flash device on resume

 drivers/mtd/spi-nor/core.c  | 18 ++++++++++++++----
 include/linux/mtd/spi-nor.h |  2 ++
 2 files changed, 16 insertions(+), 4 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261120-nor_11_20-63a5987645e7

Best regards,
--  
Srikanth Boyapally <srikanth.boyapally@amd.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
