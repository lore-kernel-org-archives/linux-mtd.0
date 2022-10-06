Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44C0FC433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Oct 2022 07:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZWB5pQw3+EVwYsbhnb/caqMv/vT98Y7bnCi6e6L4oZY=; b=vl+aH1eqXpY6WG
	Epgt5KWeUOlSiVq8PJA0jQBD12Xg8r2ZDNG0lqpC84Gaf17O1YT1vZ399UhIUaUxbhtrZoOEIR98m
	pW18BLZhadOFkdvc5L8OssKRQgiRFZGV5lRBF0wH11HiKnjZMc6BTwy72AzGhoO9irSIuPdLUAOlC
	cxj5gAd8K5LlZ/cTNVNsQFsnGlsiowbxUYJrimgxhT/wjaISXapr8bUoTiQcBJYtPGbQQlxPL9E15
	szQ/xkUKCFiiRH+Y//F1Rt4lInIdeOpQiuhdlUoqe0ljAfR0+k7LLE1EqEAY76yo0tJVN0SaSOKkI
	oIcdePbE67KiVzwvGwPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogL07-000KYG-Iy; Thu, 06 Oct 2022 07:08:59 +0000
Received: from mail-psaapc01on2074.outbound.protection.outlook.com ([40.107.255.74] helo=APC01-PSA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogL04-000KWr-BQ
	for linux-mtd@lists.infradead.org; Thu, 06 Oct 2022 07:08:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ecczGMTio7CZQKk9fQVPyFsjhaWrNlKJe7Eug7vxFTGhMptOdSzeuVj5ID+ATfH2GDVC6GWZlE5BMmEW723OkFuYRxrveyAuzrouy9q5iLiAF6t0x34Ca6AWSGI3ufFiUgt6TAN9J7r3oiW5Fc90sWIQmVmtGWCIaJvmrVrMtIxe13QMdZrYZOKmKoMpuCrRKdG74Vs6j7sWDtg7peMtrE2YbrMxB6cVDHsCNpnIOKK44C2GlYWcD1JSGe2KDvQpXEjcJl5s9is8Ur+QtBvwA3k7EeF2eJS9ootDm5Otv9zgBVoItNfM8UEFYwirRzkEtMyQtqw5g2el0xxGh/4a+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oEhfys8WyLik2IG5wuweP4+UICMjWC7PBzvNuxx5xsU=;
 b=Z3aQD3JwQcNRzzA1SqsxdHMjr3xn9Dry6KPdLEa83uRC7l+c+EpmWnnj/duOXwZSLXIYrgLarLAvvoJzo9aJ1EVmukSj/x6Bko42F48fNnAEXvAtlRSfQ+qnbGbhz4ia5UHnStiruQPAdMnsaoSujzj6xml1a+aScvsWpg3OeVNfKeS3dGEhIVStoJG8ipiPxXxnMcuA87MrB0dpT/inSP7bO3xVXMQuFLfYUvnUc6mLydUYGTt1TVrvGRhRneJMOSV1j6pVviENWjsmXTh1ij3szarwrUlsaOIV++yT1LGyIrdhCYwc+GIEjxfv7j44ymXEojy8YOSqGiAfg/Sp9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=lists.sr.ht smtp.mailfrom=wiwynn.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oEhfys8WyLik2IG5wuweP4+UICMjWC7PBzvNuxx5xsU=;
 b=nhdMcRTA8s7HmsBm/u1j5jeo7vxUAVcuRlTK5emtMR/81BhGLwcwkIn7ijriVXWBcWMHzE/L4FcW6VL29qdStOvqfIPxNav2/wxyj12QroO28CTQkUZz8Gcj9P3WKAI1pbDdr+ahECXmPG5um7Z2VYIg9Es9XibtB4Qe2zhtlM/QFfmtp7furLfoA9+oDHYQ/6KuYS9Y7g9qsByv+Z3cZTUxtLiTCK5oNC78aR1v0lERwf4XS1Q+GJkenUKlX6I2SQjzkd/g6UYu/mh9bBEEy0aWtlwp8GchTaN0m1AT0OiPCghscP6k5RMDitY4U+PM6T4losj73NbdNScHLgIgbQ==
Received: from TYAPR01CA0219.jpnprd01.prod.outlook.com (2603:1096:404:11e::15)
 by SEZPR04MB6825.apcprd04.prod.outlook.com (2603:1096:101:eb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.34; Thu, 6 Oct
 2022 07:08:50 +0000
Received: from TYZAPC01FT030.eop-APC01.prod.protection.outlook.com
 (2603:1096:404:11e:cafe::5e) by TYAPR01CA0219.outlook.office365.com
 (2603:1096:404:11e::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.32 via Frontend
 Transport; Thu, 6 Oct 2022 07:08:49 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=Wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=Wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of Wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 TYZAPC01FT030.mail.protection.outlook.com (10.118.152.138) with Microsoft
 SMTP Server id 15.20.5709.10 via Frontend Transport; Thu, 6 Oct 2022 07:08:48
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
To: ~sircmpwn/email-test-drive@lists.sr.ht
Cc: patrick@stwcx.xyz,
	garnermic@fb.com,
	Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>,
	Tudor Ambarus <tudor.ambarus@microchip.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: spi-nor: winbond: add support for w25q01jv-im
Date: Thu,  6 Oct 2022 15:08:40 +0800
Message-Id: <20221006070841.2106194-1-Delphine_CC_Chiu@Wiwynn.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZAPC01FT030:EE_|SEZPR04MB6825:EE_
X-MS-Office365-Filtering-Correlation-Id: 81783988-8a25-44a8-bc2a-08daa7699e0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	jQ2CJggutL6XXj0NglqU+m+a1wKjJI0MR1e7TWm3f9gp8y1YmFgmU7t7FbGJaiNV8vNM/NEsYQIwwWez7A11DmWmZ+YXC4lTytz4Kx/21BxKZ+LWT8Er3n7vPHieNbtQyUzbHeeMYLzJCM0p7WMP+H1p260vGXgx2ag8s2N/10m605aMcBQqy3XOgGSOBKvG1UERo/0fnC1xan+CzQN44EYF3U1BqE68x3jrEcXmKO2RYLKOF/ACmvJhJ7m2f8LO1w2ukQodtK6XrKQqhmSW25+OJw3DQSjm/G85huQ8mEUtc/VJRxzFxWAQY4Xa4JNfZJjKBzy9xW/cXWDamCf5c4pXxBk2g0Amr+tlATO8cyHDedsAAm1HAv/8MY7ly46hNK9gjwyy6KOqkZ3esB8Byd7fyCRVPwsnT4jqRbZMuomndZPcZ+vZ2XUhheIuTO2Eok3ATfWvI9zCBC/qiA0+YyDnSFp+3KjBTYcTucqqiqbDLWc2o187ZTsw8iGcCp2x6hMIw++3LVcWcqUCJWwQ/hnOUsOHDdL+nl0Dbcrx84rP3wSfOtZZ6xX1Yr+W/o18OjVc9zZR0p7Baf001nAc0FakauEFQ/4Nn89XwZlWmdr4bRXCjCX45shyP1sOsyD2rOQawABRn5gxnrBoeGgXx5WSl+8GFyzSiCTDDIxlMe4ULDu0QSPAWn6fgSSDfc4GmVXZn06uvkOGut5T+/a8snw7ig5740iuN185QF/LmyY=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230022)(6069001)(4636009)(136003)(346002)(396003)(39860400002)(376002)(451199015)(46966006)(36840700001)(956004)(2616005)(336012)(1076003)(186003)(47076005)(8676002)(4744005)(5660300002)(41300700001)(7416002)(8936002)(70206006)(4326008)(70586007)(6512007)(82310400005)(6666004)(2906002)(9316004)(26005)(36756003)(6506007)(40480700001)(316002)(54906003)(36736006)(478600001)(6486002)(36906005)(86362001)(82740400003)(356005)(81166007)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2022 07:08:48.6830
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81783988-8a25-44a8-bc2a-08daa7699e0e
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	TYZAPC01FT030.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR04MB6825
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_000856_410333_8BB7F86C 
X-CRM114-Status: UNSURE (   8.19  )
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

Add support for winbond w25q01jv-im chip.

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
---
 drivers/mtd/spi-nor/winbond.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index ffaa24055259..2b02b05ceb0a 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -139,6 +139,9 @@ static const struct flash_info winbond_nor_parts[] = {
 	{ "w25q512jvq", INFO(0xef4020, 0, 64 * 1024, 1024)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
 			      SPI_NOR_QUAD_READ) },
+	{ "w25q01jv-im", INFO(0xef7021, 0, 64 * 1024, 2048)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
+			      SPI_NOR_QUAD_READ) },
 };
 
 /**
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
