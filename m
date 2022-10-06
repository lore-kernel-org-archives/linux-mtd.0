Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD94EC433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Oct 2022 07:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZWB5pQw3+EVwYsbhnb/caqMv/vT98Y7bnCi6e6L4oZY=; b=HV6adyRxRZNNq8
	sg1LTD5NZZH85tAa7EI+sTJF6Dedy3//PAJP/6Pvo20r+6VwCtGHe8JJzvSs7nSq/dCh7BKv/6Uxc
	y3DAxpPWe726LTJ7tWkaNQ3XQZqBoYE+QWK9TXKy8bofMNEOPvGiSlsHIcohCpb6HJqhVg8h+gB/O
	7pk9Yh1eYbLYm2ynDfxFMpIHUoRNzn55jMlO0C38ddWwI7iP5XeXHNlyB3s0ucOFZzmN/ypNdnt15
	z5OfwdVKG/L8kVUJj6Rz3IMwTrPb8E8c4uWcFguDjwGK6rtRM9DMx9vfyaaQifYgpcKbnygyFVb7l
	6Wtnj+2jMnnKpBCNvaXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogLSS-000REE-HS; Thu, 06 Oct 2022 07:38:16 +0000
Received: from mail-tyzapc01on2056.outbound.protection.outlook.com ([40.107.117.56] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogLSP-000RBF-DR
	for linux-mtd@lists.infradead.org; Thu, 06 Oct 2022 07:38:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fb5lnHi4EGBYTigEB0EfI44gsKG51DAvowNsSx35PL+IRgw1ZaAgzLcTvOW7PN7AuPYlVnPrMjVR1NFTX3tH90Kbs0hb1cevqasnX8S+4ivLaDXmn8BcW0Ziat2kkHIeTjqU934vxtKE7oU6uHgDrJMCivWlEJS3PntFglGHrzH0KoUAorZtgu5kMSgO1lmlpZKcOwncs/WlwlMidm8zIA1HnRmn4roqN2x3r7HhGx1uI+fBP+Z/OyU8z9WO2mBTSqJ5eTrsRLx+ljmDeAvPpEE5X59Q1XevGZ7jVqP6rPRkcx2QjiP/Fqo4pKBL8vQrpXukuS3px6vEa2bYwl6zVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oEhfys8WyLik2IG5wuweP4+UICMjWC7PBzvNuxx5xsU=;
 b=U4WRYITH/FRrLNY9xr7lt2BkzkvxVCcuMMEPnUitIBDfO+b/HPuTqsNGtazGlctuSLNgKPzmOoCh1uSZi8owFub3Rq0Bf9bUPeEF+gjNd7D+OwE1jHRBQNL0v5bdbyMuf63o+PEr1cax6ErLNpGomehRNCFu16sPV+8M5rhNnmwoAyi+8CmKa62UXGRgfCyS1O4S5/UCJVDstW+TQMtZ/UG8lIdDK9qwc2JQlIRcLMrAAhlx/vev1TkipgQlIMZmm04kmUZUM+28iLoxhqNe7oYqDyp+/GWtv+JEcc0ciaSL81dXnNl88kE6OTMZd626GKPg/kZvXMlusqNIZi5f8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=lists.sr.ht smtp.mailfrom=wiwynn.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oEhfys8WyLik2IG5wuweP4+UICMjWC7PBzvNuxx5xsU=;
 b=K7LwXamvNTeknu4y7AINa7u3qDqecLW2aQIZ0gDegS0mOa2vzRV2xdM5j0hE1iQe6Y/OxhURJXOkUFLLaVdyMxxz73YOtMb9IvOVV5Fy9dTqswOEOk/dylimPGvXi9kFMGL5m3z3fHvufZzQsf8VhFw0ZwJt3qt7eRnlzfCPd+HgBJV0vPh1u0ij6mD/39pP4XJcmymX+e1k0eIEN6PDSi7BcXq4ZGnArzrspafs4bSRKNFifLjOTzCaH0QqAZf4mlkkDctw7IzLpaFBZn4vb5WT/Jqlq5pGtbhXmOWfhOEcIiay87OmUGcAmhPExiteYJ1aCkJ3fXWhSwkFJmnv7A==
Received: from PS2PR03CA0007.apcprd03.prod.outlook.com (2603:1096:300:5b::19)
 by PUZPR04MB6245.apcprd04.prod.outlook.com (2603:1096:301:ed::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.34; Thu, 6 Oct
 2022 07:38:05 +0000
Received: from PSAAPC01FT016.eop-APC01.prod.protection.outlook.com
 (2603:1096:300:5b:cafe::43) by PS2PR03CA0007.outlook.office365.com
 (2603:1096:300:5b::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.10 via Frontend
 Transport; Thu, 6 Oct 2022 07:38:04 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=Wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=Wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of Wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 PSAAPC01FT016.mail.protection.outlook.com (10.13.38.116) with Microsoft SMTP
 Server id 15.20.5709.10 via Frontend Transport; Thu, 6 Oct 2022 07:38:03
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
Date: Thu,  6 Oct 2022 15:38:01 +0800
Message-Id: <20221006073801.2220201-1-Delphine_CC_Chiu@Wiwynn.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PSAAPC01FT016:EE_|PUZPR04MB6245:EE_
X-MS-Office365-Filtering-Correlation-Id: 90ad5a1b-6812-4b07-3463-08daa76db3f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	lplQG4wJEA6qnXxglY2Z24dgReM2ORFDLC3uCmkE2gjKCf+eISoNj7WBtBEYQg3yJ4m7fogvJwGaCBng6ZMvRrqdINzzq7ui89iw9xFYdGXj56CXqcNFUwC7LkS2SoH/GQItXno/hiVzoOW6yXNs3Ow1mvDy6kpEzXiy7Wtfxx7dfMP4IN9fhFpF3AMjPbAHBCJtDmN8BIzdqQYBeHvB8gm2sfJi5Cdi2OUCV00E2vOoCyhMDIDU04zKwH1dF4/chzJ1/2G9s/mrFBupjTeabClEO2s/YRz4DbnKMaBgJe9myscpPHHiV9D1XMVTS0LdTx9Xqk3OLMcTkSeHqfwYO4KzatratoNNBJHO8EKPu+OmuxZyB5g79fDxJyNHxwfJ5PcxOG1zHwQo0pX06RgJajrsBH7LZuRFv+MOStODhSkwJYsFZtNNiJC3cJy/B0ERHzV8SC1ZCOdoN0e1S3gchnsSH2NKhnDMaCP3xC4uy+2mqIEck0ooL7jZYPAGSpbp0flaCk6EuqcAxVDNFfkJWq+gRWMY63kSznmJH8mrqTcnI+0cbxDtuy8WpaXZCcWBC5ND0q9yKhTEvPZjrjh7HQ4n2GLuGPeHurfQ9mUBar4Bo32kGRFNwv8YEntFgdgIFPInojPftmBSx72/MoV5a90V2E9607LA1EJxfuqnbnPJ0L84dlCfMuhj2zkChlM2NGV7XWktx1IzUgDMtnu8JOdszzKxsxOKFvulGETwbQaP8qZeoCPRLbS5v2/EhR9wipOqmyKsDJLrTegY08XTbR1Acu742+X09leqEnGa8VE=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230022)(6069001)(4636009)(396003)(39860400002)(136003)(346002)(376002)(451199015)(36840700001)(46966006)(7416002)(54906003)(4326008)(316002)(36906005)(36736006)(6486002)(5660300002)(6506007)(41300700001)(8936002)(26005)(6512007)(4744005)(47076005)(9316004)(82310400005)(82740400003)(81166007)(356005)(2906002)(2616005)(956004)(336012)(1076003)(8676002)(478600001)(36860700001)(70586007)(70206006)(86362001)(40480700001)(36756003)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2022 07:38:03.1649
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90ad5a1b-6812-4b07-3463-08daa76db3f3
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	PSAAPC01FT016.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR04MB6245
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_003813_646728_6BF03B02 
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
