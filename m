Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8BADEB64DD
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Jul 2023 15:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4uBLKkhdTnAaJgeuG5ary0Y0xXTV52rrFskwS3UzucQ=; b=fuAUe+xvuAIJjl
	WkowICPxiXtyrz1nXDG449Ot/7AyMnJuxuwnCT4tHUU/kDaN07MAJ0ZQMv3JNFhOv2BV4bpqF/Gfo
	hwW7DRcdpi+tlgMGdTBpCM4hD92SbIMnYG2ZX6mpiteAI898c4XhrglTbq+N5p3mhe3wqXsXoTFIL
	0oM9hslLdjlkB6SlSqZcsvcsRtxxXm/7RInwOT6UYU5XLT3kw/HE5h6GNXjzJdBuXYgrc37LsYYk5
	vZfVpntDWtO/Ik8qrD/jtLjGMUDbG8/uW1eiA7v01m/8m6fsPHooe1Guf44NTpa8qazz5B1zIa2gs
	g0X+cTwwGsOOlqkKHrrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qH4lW-00GNuV-0w;
	Wed, 05 Jul 2023 15:50:02 +0000
Received: from mail-am6eur05on20725.outbound.protection.outlook.com ([2a01:111:f400:7e1b::725] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qH4lT-00GNtA-1q
	for linux-mtd@lists.infradead.org;
	Wed, 05 Jul 2023 15:50:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KJvYPv60stF+WNZuWyH8ooMICJTb9K8LS7svJKFQ01VpYdqn3b2A5n/ZkQPkIAJNiYjnQT9jafeKT/c2tkAmiEUkImW7xItcaZ6nhYXU4c+g/34HXoqFQmj9AXolK4Mbu9BRWltSp6uvsXtAlG697UAzP8J4HL83DfIf3l6odnc096kv3TpUh0Q5p38aBAJgnP60x5DY3GMGSrj1VzCgQPMwr/GvG4nCgtBuqLtVhjREz8SQZGCZDG2qjccW81BOlRE1xpOf4lZyZzm0Nel04uSPzFU3QiJIdi9iYa7UoNWmuBAWszJSpFbNuyqas+wTcXEeKtq4XzB9RANpIAcU0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XLSJlQQK40VNdYzvDUs5zvYM3zH81yG/vs/WLU+oWFA=;
 b=FXujvFtjetyy3UuMYSOXHqCkD8+TnlmoQbNXcC00oqynJN26Mb1r8vGnFZQIeYeg9RRTN2/oYAR9o/grgPmi3FCAyhJuiCL2otfHLsFhY+xeTivtGtZjkTUDzYzsge5B2q2+DdXHPDGNtJSfgjUDoP0m5K2Fy9RTfFFvvV5SwbWNsXU+3CSMWxKt98UJsqpeYq8R+C46Atr+QmT16I1mm6zHdOFl71Q1VxfJkLsiJPO6ctFuqZ7KzzvXZEEQI/U++aLunRiwW5ujbKNvXZGa9Hgdu5Jo/0YSW5umPAFS/FBAWXSQ6ncinqkWlOM34em4aGW8cSeWlS7f9IoufaLbSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XLSJlQQK40VNdYzvDUs5zvYM3zH81yG/vs/WLU+oWFA=;
 b=XszQhHltOO0ieFIWH0MO7rvzhxm7uKkkk0YKosVvHUjAFldQ3S17spSJfYzxPLNu10KaGMY9Q1hsbO0T6dnLVoT11SXIE6dFWY4cRMzLgSozCBvc7jxAwj+chFUlrm7H2KOYE3F4hK10bFiHVKkPpyxVYHH+iabzzP1+jGRkxZ4=
Received: from AS8P189CA0051.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:458::34)
 by AM8PR06MB7108.eurprd06.prod.outlook.com (2603:10a6:20b:1d0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 15:49:51 +0000
Received: from AM0EUR02FT026.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:20b:458:cafe::69) by AS8P189CA0051.outlook.office365.com
 (2603:10a6:20b:458::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.18 via Frontend
 Transport; Wed, 5 Jul 2023 15:49:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 AM0EUR02FT026.mail.protection.outlook.com (10.13.54.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6565.23 via Frontend Transport; Wed, 5 Jul 2023 15:49:51 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Wed, 5 Jul 2023 17:49:50 +0200
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
Subject: [PATCH v2] mtd: micron-st: enable lock/unlock for mt25qu512a
Date: Wed,  5 Jul 2023 17:49:42 +0200
Message-Id: <20230705154942.3936658-1-mamta.shukla@leica-geosystems.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-OriginalArrivalTime: 05 Jul 2023 15:49:50.0817 (UTC) FILETIME=[555B4D10:01D9AF58]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0EUR02FT026:EE_|AM8PR06MB7108:EE_
X-MS-Office365-Filtering-Correlation-Id: ded5f5ea-fbb6-4d57-3010-08db7d6f77f4
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Va4KRfL7tqovS+sMFsIwdh7Z1K3jsqqSDfDiDawn+0HfMdeZg7D2WQjnYXPi5gffjZJXskYudWYaXS4lcyh41WrsV7hpoUj+cpfkQO1I1kuuBzGbuDM8IqCOFgskUlDaZjVuIfu9J0YANFYS6a8SdtUykwznGwF2eD97jYIXAa06kqnzhSl1QyK0SXbRpbQXsQAUIi0oI+JDpPABo+u9lMuh4MTq0C0PVbn6rr9+7gx8K/j/2ca6PZQr0iJbxCbzf6nPhGfYSZONwu/dq+KpWaUuodVkpGFXz786Uee/gCXUfJeQRlxJ47KUXk6XPW8ptWyvirXZEh/cKE8hN0GF6LdH2B0MzEJt9apTj9QAw6iZgKdbnexEMHAsBl/61l7GmZj9R8wmPuFVW1LGyBQdZMAJnmVjLbVUeERq8OXKShvo/fvcjqGSkUNQSUKzgc31nwXm7bByG1ATWRJ1FzIg3D4kdS0Y1vqB1eo+HqO3sknS2FwgM6pbg8tTEFI1VNL9QJnPqSAWwYZeVpV33de5keBbj6QB/ijuBiKTqA2ZWkjpFppEGGmagA0+f3YAf6D3N4wsf51+JVrBJaALdWlbPWYBp9UYlHS8GjT2B0BqIicGrI4oqn7otMS+4UI00KLoiR1hjD+MFFoKmdUFEabQht4DdeA48z3iiA/yUCMExny6GnoDR8dxxgFABgDgHLZcFJ4jW324He0QHrmFEejm9vx7NC/XkbzFfkdRv3sLmO/EM8IwcWRVVY33OM2GDxP1
X-Forefront-Antispam-Report: CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(376002)(346002)(39860400002)(451199021)(36840700001)(46966006)(40470700004)(4326008)(70586007)(70206006)(356005)(81166007)(2616005)(40480700001)(186003)(86362001)(966005)(36756003)(6666004)(1076003)(478600001)(26005)(107886003)(40460700003)(82310400005)(36860700001)(44832011)(8936002)(8676002)(5660300002)(316002)(82740400003)(2906002)(336012)(41300700001)(47076005)(83380400001)(138113003);DIR:OUT;SFP:1102;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 15:49:51.0078
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ded5f5ea-fbb6-4d57-3010-08db7d6f77f4
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: AM0EUR02FT026.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR06MB7108
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_084959_665496_FE570208 
X-CRM114-Status: UNSURE (   8.12  )
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

Link: https://media-www.micron.com/-/media/client/global/documents/products/data-sheet/nor-flash/serial-nor/mt25q/die-rev-b/mt25q_qlkt_u_512_abb_0.pdf?rev=b259aadc3bea49ea8210a41c9ad58211
Signed-off-by: Mamta Shukla <mamta.shukla@leica-geosystems.com>
---
 Changes in v2:
 - add Link tag
 - fix chip part number mt25ql512a->mt25qu512a

 drivers/mtd/spi-nor/micron-st.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index 4b919756a205..08e94340ebaa 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -229,6 +229,8 @@ static const struct flash_info st_nor_parts[] = {
 		MFR_FLAGS(USE_FSR)
 	},
 	{ "mt25qu512a",  INFO6(0x20bb20, 0x104400, 64 * 1024, 1024)
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
