Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDCE0ECAAD4
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Aug 2022 09:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DUumR1D68gCwV1x0Gy880a5B6LHQYKq6UeHdakKAWn4=; b=UgUPPgncAtaIR/
	g0z9qqVp4rLoZ+uoWgRoj0z5S9ENrJYh9ABFa2HazBJY+zq+qvpBblPMe7hLwgMd7yD90UhiZ9w3D
	Ym8wKRPnaHsiTqT6AQmFPhlsxEjO9CqatXO5bb0UPu45BsyS2ktiJbIzAZnjjsfmfnhEfsGt27uQY
	Piu21hFs0AkS+lG078/SLYX7pqvV4gV+5jO5/V2UyfsFGYIwxdsnx1MCQCjBwJnjfy6AuhtJpnPun
	ReLQpgFSMFW7hPR2nVw8UDKaz0GciLyCkjqpa3sVyVmLFEdHwsRm6CzL/62O9U2C+XZE43RIMnVvQ
	zTVD8Hjm2kjICDGty2CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSakU-006XRq-Fd; Mon, 29 Aug 2022 09:08:02 +0000
Received: from mail-mw2nam12on2057.outbound.protection.outlook.com ([40.107.244.57] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSakI-006XHu-OV
	for linux-mtd@lists.infradead.org; Mon, 29 Aug 2022 09:07:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J32Q+BCew67rjCC0q1kUjdIFYQcV5L/gqgPC+UBLSblV+DUvhH+w0GDtuPYFANX9cL9iDzb+BZVX0lXFz1wSrYLAhu0oZXtXEWPBM+E2BOizvj+Zm3GfgtY4349TqC0HR4QpkF9M42FSf+Hx1Fc+bjS0pH1r+GFPuv88H4YaUOPFjNvUEnkGC+fQDVBD0J5Qp4Xw2iL3/JJ4kdoS1LEPGtZibDQ66BRX9NYv8sJkMjUP8rAypYWjvlrDfXnlK5tA7hQ+LSEv9DVbbYKXoQ2ZaEAaHr5Y+AQ7/y8UOChOPS4wjrs/dzGXbOPCfVcy9vA1diqFwNvGDg8TMsINyglW6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gb/cGjwYUwlzM+AZmAhFpKRjYIzyJn560lc74ov6OKM=;
 b=EuYUpqTUWZavRldXA9aQ+qghs3ZiXMPOb8FUmJDvREOgJXxzv1FjZp54oX4rPpPEajqRzf3C9Cz5i22QeVYXJXPqyILQMGTTOVpmF7A45eOZw/arIzvcFFuCVXb8JOxxx9/6IlSq1VyZ3EUAE1FmVdE/UDiRn6mm9XLjD6UBsI6MyE4YGmTwT3t1qGv1A5iq5yy5uMvNKwRotTNCmhkQ/lFrCg9vA/O//zG6pVzCMBD4N2289mRhNqzei0+uqZuZUZdOssI/ORpJYOaAwzhfv52h2hSpabjqUETcg/AnsrBB0nfymClUBkm6CD0snaD1WbRxI0530Y0C5qm5zTXr/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=microchip.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gb/cGjwYUwlzM+AZmAhFpKRjYIzyJn560lc74ov6OKM=;
 b=z50dD7LFDH0YxS0qcQX0Bv9QOj5l3hL45KfPXbmrpe+TMd4GR/yhYBaKB93h3j9MjyVUHB4u4+TFiVGt1f/faPIStjNL2Bce2Iav20SVyiRf17cuhL7Ce8DTdUHbI6/L+kWO0qJwdmRsAY/j+B8Ex4ueG67AeOp/TbajvwA0kCI=
Received: from DM6PR07CA0091.namprd07.prod.outlook.com (2603:10b6:5:337::24)
 by MWHPR12MB1535.namprd12.prod.outlook.com (2603:10b6:301:5::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Mon, 29 Aug
 2022 09:07:44 +0000
Received: from DM6NAM11FT028.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:337:cafe::96) by DM6PR07CA0091.outlook.office365.com
 (2603:10b6:5:337::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15 via Frontend
 Transport; Mon, 29 Aug 2022 09:07:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT028.mail.protection.outlook.com (10.13.173.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5566.15 via Frontend Transport; Mon, 29 Aug 2022 09:07:43 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 29 Aug
 2022 04:07:43 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 29 Aug
 2022 04:07:42 -0500
Received: from xhdlakshmis40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Mon, 29 Aug 2022 04:07:38 -0500
From: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav
	<pratyush@kernel.org>, Michael Walle <michael@walle.cc>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>
CC: <devicetree@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <saikrishna12468@gmail.com>, <git@amd.com>,
	Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Subject: [PATCH 1/2] dt-bindings: mtd: spi-nor: Add reset-gpios property
Date: Mon, 29 Aug 2022 14:35:27 +0530
Message-ID: <20220829090528.21613-2-sai.krishna.potthuri@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220829090528.21613-1-sai.krishna.potthuri@amd.com>
References: <20220829090528.21613-1-sai.krishna.potthuri@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5b579499-560f-46fa-263a-08da899def1a
X-MS-TrafficTypeDiagnostic: MWHPR12MB1535:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	aSt3xkkRNJRBVruILWm5uUHd/uTPtfKUXoOuBIY9LfBrDraWSsR4KZXcWz0j0uDWGmmlBD2i21pqkYTOoQq9PZrOXZiENFG89c4vcvOARxxICJx7kYIHv74svSafd16BZPmhrBG/qRp/ByxBRuQGxYdJ2KL5sDAphZZUxpSAAxbuBgKS7xA2/6NXzivuovYL53AibhfegeblFYnuF3jyaumY7xCAIHR0roviySS307V/A2xcdDuBDqTrw9gLQMZeDxzSfgHNBcbz/xcmApoI865Z/nJOvMgcsENb2AsP4ffQ8ONcT5nlAyQldZoEzS9PnbA+bjsnRh877/ox4kcVUG7JDh0Avry2CpwubgRCo1aZ9RTijB9Lgmws9NaTUHzqsnOiAwWdzoZZbDk3y3GzaeIVIqNJQxZU46Eo2Fx6mVRE+AjtDZAHEnYKPtn6BEI2/KLiXwR5MAP4SZVba6uB0hSNFSp6lib3BGfB/iCXJUQUUaWKZwDM64gfLG8e8eOtK2N1Qlb3Z5CQHxgZQSRiLNV/9394iXglqCznr02bUqtlYd8ZyuHNf5z19vhgmNvqPwjtIEH5efAsSy41aCE/qX4oqX51/CZ/+hpIfe2pU0mQILqj/i4zF92tnvGRhrmUPaJ2ItywSOitzcR4McYdfWV39ZZGuEv2wiM1eYSbcmNIC5sMGoaSNGy6rx65n4e4LP/vaZLhVcWiFvUE4Kz3SnL4Go5P+avom4PWEV6quelEQscksMnYNfrqAWDTq6/yglM/T19ZB+npTd4nl1WTwwG4gO74JHTCT6JuFZsPmN4G8PjsmyMgT+6ThKr5ePJA
X-Forefront-Antispam-Report: 	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(346002)(396003)(136003)(46966006)(36840700001)(40470700004)(82310400005)(2906002)(4326008)(7416002)(40480700001)(4744005)(8676002)(70586007)(70206006)(110136005)(6666004)(26005)(316002)(54906003)(103116003)(41300700001)(478600001)(8936002)(81166007)(86362001)(426003)(40460700003)(36860700001)(336012)(186003)(47076005)(1076003)(356005)(2616005)(5660300002)(36756003)(82740400003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2022 09:07:43.9748
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b579499-560f-46fa-263a-08da899def1a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 	DM6NAM11FT028.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_020750_884062_CFF5177E 
X-CRM114-Status: GOOD (  10.90  )
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

SPI-NOR flashes have RESET pin which can be toggled using GPIO
controller, for those platforms reset-gpios property can be used to
reset the flash device.

Signed-off-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
---
 Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
index 7149784a36ac..d2fc8e9c787f 100644
--- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
+++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
@@ -70,6 +70,12 @@ properties:
       be used on such systems, to denote the absence of a reliable reset
       mechanism.
 
+  reset-gpios:
+    description:
+      contains a GPIO specifier. The reset GPIO is asserted and then deasserted
+      to perform device reset. If "broken-flash-reset" is present then having
+      this property does not make any difference.
+
   partitions:
     type: object
 
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
