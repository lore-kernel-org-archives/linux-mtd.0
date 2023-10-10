Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92AE5CD690A
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Oct 2023 09:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C/L5uPPCN1BsawL8QnnUQ94CwkwPhcQVHwkP4N2adH0=; b=RqSaUO7Kj162qN
	w7cAyL5Hr1PrwKs7VEkzs60nbvGMrVcvL7ndspgF7IIOgc8Q47Y+uG4atkE2BTNbfIyHnVfIbWbvL
	ziFO9/A+e+jU7If9xDe6N7wDGTn7NNSc63wpBEOjY23PaHCjQShh+DjXjDKRHa8hdR0BSfJKnOADC
	97BgE5xISVvGlfHzCu5L04/A2r3zVTxKEirpLOZbOuALGLE3W2oYTfmBFQz/zOMwhQc4qvRn2bIoN
	DvBs5gFIggjpQBKch7ar7EPRl2IgELyZmxrfN9oARLT/UygTKRZGix/JX7FowKhao76AOj3Tn0oyN
	cpmvGdJfpatixtxTWqAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qq8at-00Cst8-1E;
	Tue, 10 Oct 2023 08:59:59 +0000
Received: from mail-dbaeur03on2070d.outbound.protection.outlook.com ([2a01:111:f400:fe1a::70d] helo=EUR03-DBA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qq8aq-00Csrp-2C
	for linux-mtd@lists.infradead.org;
	Tue, 10 Oct 2023 08:59:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y8Yoi7I19sKaRAG4FCh/OFe6satuJs6H3OsqhJ2u4ydc/KhJ3xRtZ6TSIwUt01khKDc0VRYbx2ZhNRAYBT/OooE/ONgxBJjuGpk0U/1LIz5Ot0mmnwGdZ00YgZoAWfcnDMS39CQP5wkyueJ5fTz2hLLfHXayLXBMRLHeorjdcF83Fi7t1quxDXu6rugDRHldtZq7Ip4kkMXfecJbjlMhzBDZ40vaTck06Gvabvc/q8HIu213Deipedqr3lhaPGzCCdRiEuW5rp+fhDjqmHYr2UMftZhWZIXwel6RpPHy+9u1EfLZgWEO56/GXvQ/2JFUi+53iJkC95lWgI92JmzLXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H6/JzIfqdOmRIwCHeXtPdofy7Dx/+VqKxk7ZIFYeI6g=;
 b=dZu4lNNaYQEBkY/56hezQP273CeXNf1QIp/sG/XykQ2FJ6grc+Dr/3g4ido3tRXxUbTrKCyW4nxKeFqCugEqvgHkLRwXkeAvJBrKGM7IXbbjTU9YJmC4qChSz6DKpLySVqVFi5Hl+09MUkmEE2CfKbxqpIBmBXPuNAAxLncpUuOnQb85fDnoOuHLgOAPpBBVOfvGpCOF1gsYMT1L3xd44mOlEy4W72FYclZtuxiiVzz4FvMht4zpj7OQ5f8ICn42Y2RTyKtI4Q0Ryhl/AnkQbOMTWeRTKzYL/R1jpg0+ZN1GK2Ry9iPxAp3SglWNko8tqIJBS8pn5JPjuNFEJgGLzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H6/JzIfqdOmRIwCHeXtPdofy7Dx/+VqKxk7ZIFYeI6g=;
 b=oJ2QavnVTVZKlKgJ7gh4T8qKFdyx9AeZ+AfbjRhTYUbp9OFfLlx29bVA3IsEMqBxaMP/Ftal3VztwhzQurehV7AB8BwpeFtj825hkeP5REatHAwVJf8coqFw9BB8k4IEe3arF3xIn3Szss4nmnIK2pAr0t8SmCLD0Ut+OWpNtcY=
Received: from AM6P191CA0057.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:7f::34)
 by DB8PR06MB6539.eurprd06.prod.outlook.com (2603:10a6:10:12f::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Tue, 10 Oct
 2023 08:43:46 +0000
Received: from AMS1EPF0000004B.eurprd04.prod.outlook.com
 (2603:10a6:209:7f:cafe::45) by AM6P191CA0057.outlook.office365.com
 (2603:10a6:209:7f::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38 via Frontend
 Transport; Tue, 10 Oct 2023 08:43:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 AMS1EPF0000004B.mail.protection.outlook.com (10.167.16.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.22 via Frontend Transport; Tue, 10 Oct 2023 08:43:45 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Tue, 10 Oct 2023 10:43:45 +0200
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
Subject: [PATCH v3 2/3] mtd: micron-st: use SFDP table for mt25qu512a
Date: Tue, 10 Oct 2023 10:43:22 +0200
Message-Id: <f1620e5f88b7ef94e83cdb46b8f120a161268f80.1696849423.git.mamta.shukla@leica-geosystems.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <6b89ae4e4d7a381050746458cb000cd3c60f7a42.1696849423.git.mamta.shukla@leica-geosystems.com>
References: <6b89ae4e4d7a381050746458cb000cd3c60f7a42.1696849423.git.mamta.shukla@leica-geosystems.com>
MIME-Version: 1.0
X-OriginalArrivalTime: 10 Oct 2023 08:43:45.0385 (UTC) FILETIME=[E13DB590:01D9FB55]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF0000004B:EE_|DB8PR06MB6539:EE_
X-MS-Office365-Filtering-Correlation-Id: bd9a43aa-7e53-4722-ce4b-08dbc96d03e6
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AZHzfYnxoPKfZf6VsPVbs1U2U3f5VfwKtzX8yMaLnIg0G3y2xOSDWQ//rq3fArDHC0NWk7Dka6VT6hGnpfNFQbQK4Qo0imVlpZTa7SSQ6mTuq/nBhJ2gIxWprYX9TpNpmNS8BDr+dOzw5egHJQi5CjbotBbKKkDX1fR4oSaj4oftEm7BvgyXBhxAgdr1UPQfLe6mh8svUFiXc8LJpB768i33u3msnelbxrhmol+eL2oAr/Rfk/mpdqHVLQV28/dNlEERpLBprXOqIIjL319CDsQUutorS1indXh5iolCK39CvfhVXtRW9zEjFUjAbGp7znMrdhToOxYio/ay4ycgC/QwGK2DjvA72qQMePw0FNBUXweT79iREaBc2tEq0hS/es4JP+hsCGa96n73ztyPNOu29Iny88ae+KHqGSsmIUGifIml9niD6UO3XJzgoQvyGSC/GGoPg7OKTnECSQXyEUa4RXuDbjyrGjRfylwBH3xhTRk1Wb0Dr+rmU/HOJD7bC26uflkC+XbSsqZPlLG2sPhy9edGE4NUazVzIAty/T+Ia3EHiTLVmh9uu1ar1rS+QkKG31TliJ4od4ma5GKGvH57HCZHcnhdrZbmC5OVqsLFDi3Rr+34NTvuPVUxyqH59nu6yVDJkCrdOcQNYvLbjuJnj1f5kRbiVtCKyzz8+6lKSVsXCHXS2N9HguqW/GjxNW1+EGPpztVsHXEkfUAkMXJBWoD/TP0WA2UVq/nitr1GAL66M45mqi7eXGcNX7r7
X-Forefront-Antispam-Report: CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(346002)(39860400002)(376002)(230922051799003)(82310400011)(64100799003)(451199024)(186009)(1800799009)(46966006)(40470700004)(36840700001)(316002)(70586007)(70206006)(966005)(41300700001)(44832011)(5660300002)(8936002)(4326008)(8676002)(4744005)(40460700003)(36860700001)(107886003)(2616005)(86362001)(83380400001)(81166007)(2906002)(40480700001)(82740400003)(356005)(36756003)(6666004)(336012)(26005)(478600001)(47076005)(138113003);DIR:OUT;SFP:1102;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 08:43:45.6820
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd9a43aa-7e53-4722-ce4b-08dbc96d03e6
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF0000004B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR06MB6539
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231010_015956_724882_A72C253D 
X-CRM114-Status: UNSURE (   8.15  )
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

Parse SFDP table to get size and functions of mt25qu512a

Link: https://media-www.micron.com/-/media/client/global/documents/products/data-sheet/nor-flash/serial-nor/mt25q/die-rev-b/mt25q_qlkt_u_512_abb_0.pdf?rev=b259aadc3bea49ea8210a41c9ad58211
Signed-off-by: Mamta Shukla <mamta.shukla@leica-geosystems.com>
---
 drivers/mtd/spi-nor/micron-st.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index 6c8cabbead2e..4feb03ee2d13 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -407,9 +407,6 @@ static const struct flash_info st_nor_parts[] = {
 		.name = "mt25qu512a",
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
 			SPI_NOR_BP3_SR_BIT6,
-		.size = SZ_64M,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
-		.fixup_flags = SPI_NOR_4B_OPCODES,
 		.mfr_flags = USE_FSR,
 	}, {
 		.id = SNOR_ID(0x20, 0xbb, 0x20),
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
