Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC626C4828C
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Feb 2024 13:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xV1vsQm3G0iCuvdtrLkbeEIcBEJnLn0FzCIXYiGDz9g=; b=b83gqw9hA+6A9W
	HeoEi9/TP9yw7ZqP7hOm+qw4MCtZZg0x5ptaGuu5AoBQLWaEARcUSJRnEcj9IpOYjld6Rs4qVWSlY
	tCzWyTnMplasRxdiJVfexKdmCaPzT/nTQC7tWZvBxg2FBuEEhhqF0MpZRwgsogSaCi/nHd8iBaXy9
	T7WTjCpxYYrRzJDwQJ/R0UPHEIw1x5mRZokjQGHKO8PQUpzcLC8AUsppZOkp4u67UJVr9PUhKIsLC
	7xO0knSCz6a3/TkMyt6sglEwIfgxMe/8jqvH0QlFbNMEd9EQUgn3u0YYQS9NQPogYv3apy65xXmfr
	dDeiLItGTmJ6sTEOacIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVXHs-0000000888S-2RTE;
	Thu, 01 Feb 2024 13:39:28 +0000
Received: from mail-am0eur02on20700.outbound.protection.outlook.com ([2a01:111:f403:2606::700] helo=EUR02-AM0-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVWxs-00000007zWu-2EOk
	for linux-mtd@lists.infradead.org;
	Thu, 01 Feb 2024 13:18:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TlpEayKQ2NP0AtcGOJnwpFaCsn0cV6wO8gMkCu5iS8dWEzPL+I8UdOmcuBsPA9ARnBLvbXNDqJ1Ga2CJQmV4DOkXySX6DOHWBeCUk5IedPHbuc3lvS9GKDtFG/BS1ED48/gxHj0kccyxLiCnH1WYgfXlp3oyDKa6cro+0HjVxarmq5b4NwBestdAXoO+6CcTJYbYtz9ymL15/MWODdirA1rR+NwHAFtLlDgiLeEOMumZjhu/z3Zaa6dKBk2j2Ypb0blwOWZVaR1ojDUJeX28+UetxdkKgTiG7+qz2709c9wF53g45MgLLqXzlS72ykgM/9jENi8WYNuFcFn9YfA1aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gbk6GEaZFm2CqJE8OhLPw9fpnMMZjNb43lrAdGQwPeQ=;
 b=Up1IyOHvsmAfLXSlINW9biAcfVhVWQo0WC28psgH7lz7n+aUKJ7aUz8jBl6viqzzgq6n3Eu381hhaiFor/r2G9DJEr6tgRKt0XftpMI2Fx/GV5PjzKtmPajL727ehaXqB+GebXu73kemvjc6BQjNWpWPgS1FUc7B0ZXGcc/3VGwLPUpXbJFMZyxusLBsVEu/0E5WD15ssyszs8/Ul3PuF7TXxC2Z5MSfWzh4sYp3uMw26RbgpGI+yowmUxnE15yD0vf8iG5buvwJxrv5U6MLDyRNTuPmRxBqoZPlfHCKvfUkHKfQsLbaWMXcmIIJcNQiX16kbZswmQKD4ShKiowoJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 151.1.184.193) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=asem.it; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=asem.it; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gbk6GEaZFm2CqJE8OhLPw9fpnMMZjNb43lrAdGQwPeQ=;
 b=UXFXBfWvUiAsJF6UNe3vTh4anvmav6O1VKdJu6KZ+dgYNdUczVTBaZoRAGUVo9Fi2jdaNyBWs2tj5IxdyKYpChtVRbiM3p3YTXJ1jOjwWcNjlAYBlIPqzulLTTobfkVg6N2osaz6RXIsaZwvbyAHHyUiMnlACOClQ8TutrE2XN0=
Received: from DU2PR04CA0055.eurprd04.prod.outlook.com (2603:10a6:10:234::30)
 by DBBPR01MB10459.eurprd01.prod.exchangelabs.com (2603:10a6:10:538::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Thu, 1 Feb
 2024 13:18:40 +0000
Received: from DB5PEPF00014B99.eurprd02.prod.outlook.com
 (2603:10a6:10:234:cafe::c2) by DU2PR04CA0055.outlook.office365.com
 (2603:10a6:10:234::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.24 via Frontend
 Transport; Thu, 1 Feb 2024 13:18:40 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 151.1.184.193) smtp.mailfrom=asem.it; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=asem.it;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 asem.it discourages use of 151.1.184.193 as permitted sender)
Received: from asas054.asem.intra (151.1.184.193) by
 DB5PEPF00014B99.mail.protection.outlook.com (10.167.8.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7249.19 via Frontend Transport; Thu, 1 Feb 2024 13:18:40 +0000
Received: from flavio-x.asem.intra ([172.16.18.47]) by asas054.asem.intra with Microsoft SMTPSVC(10.0.14393.4169);
	 Thu, 1 Feb 2024 14:18:38 +0100
From: Flavio Suligoi <f.suligoi@asem.it>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Flavio Suligoi <f.suligoi@asem.it>
Subject: [PATCH 1/1] mtd: spi-nor: everspin: add em004lxb entry
Date: Thu,  1 Feb 2024 14:17:10 +0100
Message-Id: <20240201131710.797505-2-f.suligoi@asem.it>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240201131710.797505-1-f.suligoi@asem.it>
References: <20240201131710.797505-1-f.suligoi@asem.it>
MIME-Version: 1.0
X-OriginalArrivalTime: 01 Feb 2024 13:18:38.0651 (UTC) FILETIME=[2B15E0B0:01DA5511]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B99:EE_|DBBPR01MB10459:EE_
X-MS-Office365-Filtering-Correlation-Id: 557da0d4-5618-4c5a-bd04-08dc23284e9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 13y/pNlnmmg0dvJbnkENQ11oaU7l2qUTtt9UgE4Ztbh6JOFi9xiS8pI4elScBHsC6V71YZM1bGg3XE6cXa/mF1hJ4aKDpNJFBU/YnD0WeZkDnA6ua6IH0kLhQcuZlAoe46jZwaiWdyiaGPvuRN8tzc8P3WaH8QxItjFQumtCrAqPozpvDMOzcAgrBoB+L/HkFJxOh4CocfbTXEpQfu9johEI7yC5s6vHVp28CZYmO3J0PePnxwPmGmJkbBFUStFvzWp8yzB27U3pxXgoi5qSOKAcgR2oU3vi8APkH6zDygPztDPYlFbYJnSdnivV1juT71oN3rcZ00Zbtpt75bKFgIkm3pbHuIkTyxxwz90QHFMLzip4MJWI0kBrlx5WL+57okJFfIOPM0sypEoDsVmqnzj73M2UfBv7anW/Pi1J8JCshQN3dpGKZsCZSRhtF+ScZVnpxBfzeTr23nfIrqJ0k0zt28XLOzR3K98FpqElwuuQbFoxA/FfKF5xilaJqc5DNbGMWoTplDa8xOX4yEwwal7eueJELyVjNOYgEFEGqnj0hYRSnvwjsmkndflbGoHTvqIphgxISqGQsdts8ZG/JTLQfI/80UQnIIGHA5FtFTfELjLfqlEth/98k2K3y830aTZfiNuImUe4kDHLChZWrg1dLk7cIk1kFF0rLz0KXW/o1bjyOcXZaT4olCTJtiePIahrkN6DJ2a42COYFXLc0Mifxebu2z8ziMNL3mD9akY=
X-Forefront-Antispam-Report: CIP:151.1.184.193;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:asas054.asem.intra;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(346002)(39850400004)(136003)(376002)(396003)(230922051799003)(1800799012)(451199024)(186009)(82310400011)(64100799003)(36840700001)(46966006)(47076005)(40480700001)(966005)(478600001)(82740400003)(356005)(36860700001)(81166007)(36756003)(6666004)(316002)(2616005)(26005)(86362001)(4744005)(5660300002)(2906002)(110136005)(8676002)(336012)(4326008)(8936002)(83380400001)(70586007)(70206006)(1076003)(107886003)(41300700001)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: asem.it
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2024 13:18:40.3429
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 557da0d4-5618-4c5a-bd04-08dc23284e9f
X-MS-Exchange-CrossTenant-Id: d0a766c6-7992-4344-a4a2-a467a7bb1ed2
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d0a766c6-7992-4344-a4a2-a467a7bb1ed2;Ip=[151.1.184.193];Helo=[asas054.asem.intra]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B99.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR01MB10459
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_051848_970409_45F2E57C 
X-CRM114-Status: UNSURE (   9.58  )
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

Add the Everspin EM0004LXB 4Mb (512KB) Industrial STT-MRAM Persistent
Memory.
This device is JEDEC compatible (JESD251 and JESD251-1), but it is not
able to provide SFDP information.

Link: https://www.everspin.com/file/158244/download

Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
---
 drivers/mtd/spi-nor/everspin.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/mtd/spi-nor/everspin.c b/drivers/mtd/spi-nor/everspin.c
index 5f321e24ae7d..4741930ce9a8 100644
--- a/drivers/mtd/spi-nor/everspin.c
+++ b/drivers/mtd/spi-nor/everspin.c
@@ -31,6 +31,14 @@ static const struct flash_info everspin_nor_parts[] = {
 		.size = SZ_512K,
 		.sector_size = SZ_512K,
 		.flags = SPI_NOR_NO_ERASE | SPI_NOR_NO_FR,
+	}, {
+		.id = SNOR_ID(0x6b, 0xbb, 0x13),
+		.name = "em004lxb",
+		.size = SZ_512K,
+		.sector_size = SZ_512K,
+		.flags = SPI_NOR_NO_ERASE | SPI_NOR_NO_FR | SPI_NOR_HAS_LOCK |
+			 SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP | SPI_NOR_BP3_SR_BIT6,
+		.no_sfdp_flags = SPI_NOR_SKIP_SFDP,
 	}
 };
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
