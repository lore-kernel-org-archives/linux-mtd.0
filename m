Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 525E9CD68E8
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Oct 2023 08:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WHS8rWmBDZz67Rty+8hsRhRxOxNT0Pu//7UE+RY1mTk=; b=NzEeuh5eMorcxt
	g8ibQaEowkQGMnL+24tW6ru1Pta6GpWmgMZAjTrKskdPEmaDhfjfUHYKJX7pSYU6txCHM0heBIBiS
	WDXQWaQQkRbA2JXumfJaS5UfjxPumZ/1gRmPZJ1UCuJv9klWA0PFMBqiaocyrJefx45hR8MtY0iM3
	QcUa3fwKbDFk0Te8eELxrI/q/mkSGJIqgXWya2CkfGtj2s3CGvU+8d+GMoq5tqfXzO/H8L/aZMluu
	MAymPeVv1HYnIyGvl2i4dCmZPrlRS5NKfyLEMaGiA8NBJAv5khHiZPgaU1FR7VoBVDMn0tIyd4jUl
	eBg3VVyvpUElqy2LxUMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qq8aa-00CsnD-11;
	Tue, 10 Oct 2023 08:59:40 +0000
Received: from mail-db5eur01on0721.outbound.protection.outlook.com ([2a01:111:f400:fe02::721] helo=EUR01-DB5-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qq8aX-00CsmM-06
	for linux-mtd@lists.infradead.org;
	Tue, 10 Oct 2023 08:59:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=meAQO9RxwM16IOrW1pXf9erRllpeceRBoN+z36/MZa2aw3dTxqx2Gcd1FP5zL5uy9MvHWzuK/haylqHDfLrko7pk1dBFXD3K/gZ2eizcFl+gsfb7zwEwjiHH2VBvFDfd4cd9k+BZigYCvYwoP6+xTUDSuxaLIs9Z3YcunqrCwh/Uvc9RLDjnsJwUBPWs8LNM3Y7nquGi2s/6l7IWU5OMu1txrkFXIeGVQ1cXwwmYLWlfKPbfDsAP4YrML8jDZ8etciR8EkFjb3exnjfFcZvnJBCz6g+MDCMQyBOceu8PoTyZIS7MSPbbR4Hl7yolSBz3vDbtCjXW4aXUayFLBDb+Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vrfR5Y/88iLjVt5OpNjlWtAop8x4E0hStZQy8D2ICMA=;
 b=JcLpaJRUQwALxa58Ct4XC8HKBeMH2Obts25+YIO/u4n/ZpoCoLXWxdH4r7niccmrJh+fylt3g0wteZyHcFZsyjSzLl54AVUZXBNDBYrdT0adDW6H7fd1tN5sw6tt5E+wJ+PuBmuInuI1cLUEtXLglrq6LihnFgTCE9/jyZRKOATT4i7S0tcwMYakDHUXpbs2FH3ltBd9VjbKhqQ/kd3buyg+XGLa5XmsOnTq9tbDGjN4VcxIy9R8DUjCRIpfqURy5SeVB564ORhhi543oFWpmG2ADT9Tys72CFPDmuMH7usAd57qgLQ96TbO6EoSie5aHjR4YpQPXIauROny96BqPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vrfR5Y/88iLjVt5OpNjlWtAop8x4E0hStZQy8D2ICMA=;
 b=TURo/5MrNMdBhPXNUOoNAg5cWPA7DkLgkwUNZXyj08czJloF82o4TG8hkKkBh9GfjcwoUp3sAR/EMNiRFOw3hVXtZ3UDSTEYHXLrYIHhCVhUZi+aiTCrv2bg3dpCLHZVa7rLowmDxdhKA/MFu9yK5sgceK7YGHAaTfaEb+dp1fE=
Received: from AM0PR03CA0013.eurprd03.prod.outlook.com (2603:10a6:208:14::26)
 by PR3PR06MB6779.eurprd06.prod.outlook.com (2603:10a6:102:60::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.37; Tue, 10 Oct
 2023 08:43:42 +0000
Received: from AMS1EPF00000047.eurprd04.prod.outlook.com
 (2603:10a6:208:14:cafe::7a) by AM0PR03CA0013.outlook.office365.com
 (2603:10a6:208:14::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38 via Frontend
 Transport; Tue, 10 Oct 2023 08:43:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 AMS1EPF00000047.mail.protection.outlook.com (10.167.16.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.22 via Frontend Transport; Tue, 10 Oct 2023 08:43:41 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Tue, 10 Oct 2023 10:43:41 +0200
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
Subject: [PATCH v3 1/3] mtd: micron-st: enable lock/unlock for mt25qu512a
Date: Tue, 10 Oct 2023 10:43:21 +0200
Message-Id: <6b89ae4e4d7a381050746458cb000cd3c60f7a42.1696849423.git.mamta.shukla@leica-geosystems.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-OriginalArrivalTime: 10 Oct 2023 08:43:41.0729 (UTC) FILETIME=[DF0FD910:01D9FB55]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000047:EE_|PR3PR06MB6779:EE_
X-MS-Office365-Filtering-Correlation-Id: 546e1765-3a49-445a-a150-08dbc96d01ab
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wjL0M08tAQ0e4I1qtEMmCIAmKLdu/iOebJnRuK+DR3hhOnsYFA3INAl04/VN56tt91kTG26LaSmdll5fIZ9zt6LrwaDCG0uujnCrqMIuFPokEd7hqtuWVp5NfYD/63UqOdcTbnKZ7SSWFEcknN0Fyjp2FjYZ5pmbSN4eJ08KJsG5etT/hnBDhGWr2LYVpWkMoCV+auuWcOszhfvoEgkpjSEVCBtwqMYiSLg18K4PO75feh7cq/ogEtgvSWYeRMsjGr8eHi3fCIUyGnyp2SGpJ4imgbkE0kBDYwBEeqhU6iS+BeTXRiKGuLxE0H1aaVTE10pj+ngUMapcT4LNt7JQu3xkCeshgExrHb8T9YhX0lEQLFPg7LiUzCCD9ogWIFYUZLnuPOmZ4q9uiNDDRp8bRcAqxYfcEy9nfmszOKIsc4KfYXlM8gVqqi6ai/Gk1wkLAwH4xZzPYJdq4Okn3TOTHcXvyLNhzoVR22/aYtCQDKbHXpnycP6P/FWHH7KnFNB5o+RECRZ5yf/pD8bEfvcvVYjbmwlAHeNP1l9+QSbaJMulrrLy8/xm3EKnhFJQj1Jg+gUC2dWAQFYQQxOH394VAJ0p9IN8kze9wEx5H7MxzcVN44kWc1ckbpdJ9WK2KA6vGjzx95xx0N2+6kvE/GFhz6q/pchrodbciVnbveCcGHCGA3+p0J7+9TR9KxNT1pnQcBfE5FZ06bKmgC1d09843rTBEj4VQEU3nXhupRc3a4Cu3bBvnKp7UwdfpdrCq7cK
X-Forefront-Antispam-Report: CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(346002)(39860400002)(136003)(376002)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(82310400011)(40470700004)(36840700001)(46966006)(6666004)(2616005)(107886003)(82740400003)(40460700003)(86362001)(40480700001)(81166007)(36756003)(36860700001)(356005)(44832011)(83380400001)(336012)(2906002)(966005)(47076005)(41300700001)(316002)(478600001)(8676002)(8936002)(70206006)(26005)(4326008)(5660300002)(70586007)(138113003);DIR:OUT;SFP:1102;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 08:43:41.9388
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 546e1765-3a49-445a-a150-08dbc96d01ab
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000047.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR06MB6779
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231010_015937_071010_46D59790 
X-CRM114-Status: GOOD (  10.55  )
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

Changes in v3:
 - sync with spi-nor/next:8f407eda173f to align with new FLASH_INFO format
 - new patch in series for parsing SFDP table
 - new patch in series to add post bfpt fixup

Lock/Unlock Verification:
[   72.584003] spi-nor spi-PRP0001:00: mt25qu512a (65536 Kbytes)

# flash_lock -i /dev/mtd0
Device: /dev/mtd0
Start: 0
Len: 0x4000000
Lock status: unlocked
Return code: 0
# flash_lock -l /dev/mtd0
# flash_lock -i /dev/mtd0
Device: /dev/mtd0
Start: 0
Len: 0x4000000
Lock status: locked
Return code: 1

# mtd_debug erase /dev/mtd0 0 1048576
[  203.419693] spi-nor spi-PRP0001:00: at 0x0, len 1048576
[  203.438616] spi-nor spi-PRP0001:00: Erase operation failed.
[  203.444283] spi-nor spi-PRP0001:00: Attempted to modify a protected sector.
MEMERASE: Input/output error

# flash_lock -u /dev/mtd0
# flash_lock -i /dev/mtd0
Device: /dev/mtd0
Start: 0
Len: 0x4000000
Lock status: unlocked
Return code: 0

# mtd_debug erase /dev/mtd0 0 1048576
[  215.585620] spi-nor spi-PRP0001:00: at 0x0, len 1048576
Erased 1048576 bytes from address 0x00000000 in flash


drivers/mtd/spi-nor/micron-st.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index 4afcfc57c896..6c8cabbead2e 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -405,6 +405,8 @@ static const struct flash_info st_nor_parts[] = {
 	}, {
 		.id = SNOR_ID(0x20, 0xbb, 0x20, 0x10, 0x44, 0x00),
 		.name = "mt25qu512a",
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+			SPI_NOR_BP3_SR_BIT6,
 		.size = SZ_64M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 		.fixup_flags = SPI_NOR_4B_OPCODES,
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
