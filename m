Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 144D0EB64DA
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Jul 2023 13:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rFRzEZlxQbaXeaQIxtdCm+t4ZJ/iShQdAfJ/1xlGU+I=; b=VhZ+G+ETGAFHmW
	wX/F9dRfyBzfYLFyKywmTS+gUgZ1HrQVc9vkxBI9OmLpB7yn8p2e8QK3AIZ4MDApHxlql4jlSQO7k
	PSzx9FIbMzalnD38nqJKtOOffQZ2lWKeMerCIto64Hp45NF4HeJplIx6RoOJC6TBi/AXVxsKusXTn
	uq4s+S9l/iI5Es0/Qry4dW2KMUtPNVVDOa22vL3OtXqPco9OJyAEpQOVcOCb7KO5TwvguIpXJ4Y8N
	tyVWKZjsorkngrwKUh3xp9vyuzDLolovHYf2dXOq50M1Sh5qw6tN5YTtkkd40j7TKutQFFNDKX2N8
	Sn9KLzJAMOCgv7uXVH3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qH27o-00FwVN-0A;
	Wed, 05 Jul 2023 13:00:52 +0000
Received: from mail-am0eur02on2070e.outbound.protection.outlook.com ([2a01:111:f400:fe13::70e] helo=EUR02-AM0-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qH27l-00FwU0-2R
	for linux-mtd@lists.infradead.org;
	Wed, 05 Jul 2023 13:00:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UWKctAixWCU03ukcSW4cVhWpc8qMhdzvYz9da3BHGcGEYX/XDjSQZudPSjLDrmOKDyZt2jkJLHAZGskJlzpuYk70nBzym3Ri7XCwAkEc+2txpTZyD21Dgd+X4Nxx9hhD3mJWysC9IGmmVp3315hvh+EwDCgR+V4vwJbJo2gnEIHwUMlMkK1Kq2QGpODoAMCp9OWbZmvUYfT4o+r7H+0aXA/45M65JtwBo0J47xnLQG2ozffz7BtI0+JGu/WB2GIOWHszL8YuDdFJ7HEg1bQHojtSsu9L7wgTTSgn2FvKu8/kf3mKzZDDLMB7uoUBn/4r0joJFdJ9fL5uny2i7zXLBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WjWHcXNonHylLQR+y/OMH8/07S8zwCoOsUy7Xv+6sTg=;
 b=RG4KjJxwkOQOHTHxoE8Z1/jG/ty5+XdbHFsSDOsxGC7tn4sZQBe8xj4UYxYSATi/DJhEWNJWC86018GFURX75IOXYPYyHK0FOJ3SseT+vvnPKVjVHDXZfp/qCeXH0iqH7+udQ+66r+svgGDezWn1B3MvCArXJwrZfmpkE8nPa5JJaa5KIwuPt00AaQ3f2qxc+A2KCQEakfsiQWfv+l2cHFYxcAcD60n+L2PZROm+AJrGnCaEImZ1ziQahRkLQaOQ68j0L1B7+HK/lMUSd9gg9rx3q7QBz8uIVDAWLnDZzD0wxr1fdjAo/zfacrmo1f8Oc8vk/Xm9nrSnOAOsWNFz5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 193.8.40.94) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=leica-geosystems.com; dmarc=temperror action=none
 header.from=leica-geosystems.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WjWHcXNonHylLQR+y/OMH8/07S8zwCoOsUy7Xv+6sTg=;
 b=IoLN0taUFYltKI/B/7kMWzz0lfvfYoGIaCHnXqvXY54HvZdxZ/8qXtfeHlFr/CFBS79eB2aRQDKxBKaIRXFUtvCMCi8gGlIv+FezIegbMzz9i0zb3/5w4kUzDQTVx684d02MVEsu5JtZvxqGXSUqJWlm4hHr27x0ozVp6/i6tvg=
Received: from AM6PR10CA0015.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:89::28)
 by VI1PR06MB8662.eurprd06.prod.outlook.com (2603:10a6:800:1d7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Wed, 5 Jul
 2023 13:00:38 +0000
Received: from AM0EUR02FT053.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:209:89:cafe::b2) by AM6PR10CA0015.outlook.office365.com
 (2603:10a6:209:89::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.18 via Frontend
 Transport; Wed, 5 Jul 2023 13:00:38 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=leica-geosystems.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of leica-geosystems.com: DNS Timeout)
Received: from hexagon.com (193.8.40.94) by
 AM0EUR02FT053.mail.protection.outlook.com (10.13.55.226) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6565.18 via Frontend Transport; Wed, 5 Jul 2023 13:00:36 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Wed, 5 Jul 2023 15:00:36 +0200
From: Mamta Shukla <mamta.shukla@leica-geosystems.com>
To: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: bsp-development.geo@leica-geosystems.com,
	Mamta Shukla <mamta.shukla@leica-geosystems.com>
Subject: [PATCH] mtd: micron-st: enable lock/unlock for mt25qu512a
Date: Wed,  5 Jul 2023 15:00:10 +0200
Message-Id: <20230705130010.2999839-1-mamta.shukla@leica-geosystems.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-OriginalArrivalTime: 05 Jul 2023 13:00:36.0750 (UTC) FILETIME=[B10FA2E0:01D9AF40]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0EUR02FT053:EE_|VI1PR06MB8662:EE_
X-MS-Office365-Filtering-Correlation-Id: 11e0e144-3580-45e9-d590-08db7d57d3a2
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1k97tKpPw/DofXuDYVhEzlSS3yT+2ZJcjmHvBxu2ZRQ4EFX9TWBGos02NKtqCO7r4NN6JZhlfDClPb+g2jkgoz9kpqbwksq5R+MLWjtJ3VcqutIUsEzAzQn1xnnhuKv71yJL0nCNiObAMrHvDN3peX/RkcXq63Mu0Gcyr2BIP44a002bbST8TSoHxxKXPLRns3HW/JCjg6l8EfDKeEh0X6uTmTC5VRbElihUB98r7Ib8yX/Po2gXIXEZimLHTKuJe5aMcaO6YPoEQWMR2eNb+6UD6ZwfFz6RMYph2QhazT0Q2bm3rKGltKlrhR/nKIqW5rcWi2ALuokI0yastWC0RZLVG1LUb2vo997nPfDOYDW94VDTLU99es51bccM8J4dv4rbxjYtEEWDkcPPFp+K0gWnjqHe7P+DEB+yfCK9GhVuh8UUJWaiTiJf1h1L+5C2RwzZXyGZNV5NjW4fQnwYmQLTdkCvYfgC2CXXRIB5hNT9SZlOhWCz3AALjqpt3XJJhbg1r1vu+6i4m0bLvKM3BM/1mTxUv9CvciAunEbifvtlaeqRTXsjUGAU2Gk5AbtJuN8xZlUyLlnQs3aUqtDplFx2qnxFjnI+ZSQoRiEV1Ct9EdyassBmAGBe1ZtEV6ZXanF2jiP9bz0H96RB6oIUU6JBcRI1w4qsgylpS9A9wkOgLF9+2YzfuZQs0q44UmMg7yH9eYnRNSdngr4IAM1UEcJTZG8JaeDMBrpyxnkh2ZmiEMctB7WMtRTrEyheXP+5
X-Forefront-Antispam-Report: CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(136003)(39860400002)(346002)(451199021)(36840700001)(46966006)(40470700004)(6666004)(478600001)(36860700001)(336012)(63350400001)(47076005)(83380400001)(63370400001)(966005)(86362001)(107886003)(81166007)(356005)(70206006)(316002)(82740400003)(26005)(186003)(1076003)(70586007)(4326008)(2616005)(5660300002)(8936002)(44832011)(2906002)(40460700003)(8676002)(41300700001)(40480700001)(82310400005)(36756003)(138113003);DIR:OUT;SFP:1102;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 13:00:36.8879
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11e0e144-3580-45e9-d590-08db7d57d3a2
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: AM0EUR02FT053.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR06MB8662
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_060049_817068_01CA6E4E 
X-CRM114-Status: UNSURE (   6.47  )
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

mt25qu512a[1] supports locking/unlocking through BP bits in SR.

Tested using mtd-utils- flash_lock/flash_unlock for MT25QU512ABB8E12.

[1] https://media-www.micron.com/-/media/client/global/documents/products/data-sheet/nor-flash/serial-nor/mt25q/die-rev-b/mt25q_qlkt_u_512_abb_0.pdf?rev=b259aadc3bea49ea8210a41c9ad58211

Signed-off-by: Mamta Shukla <mamta.shukla@leica-geosystems.com>
---
 drivers/mtd/spi-nor/micron-st.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index 4b919756a205..5d1dc8e0bbba 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -218,6 +218,8 @@ static const struct flash_info st_nor_parts[] = {
 		MFR_FLAGS(USE_FSR)
 	},
 	{ "mt25ql512a",  INFO6(0x20ba20, 0x104400, 64 * 1024, 1024)
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+		      SPI_NOR_BP3_SR_BIT6)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
 		FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
 		MFR_FLAGS(USE_FSR)
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
