Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2013C38145
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Sep 2022 06:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=isYIi9Os4G0uCMeR411+SZFmCTt0CLicZpevT5A9P5U=; b=0cWD1gxKHwhKqj
	5f+2eMT51DAQE1padC5zB52K/5UoPcHR9n/oVw5rT5VSKtAr8GqoBySePNBEMkKmINEkvzy/CxsFA
	Y6IB3RV/S21aJ2keRhu+c4/Ih2/et0eubPxH2+MWqUvqA/4ylzFJYO/1zKh4lOKHXnhEVjfh6u7sF
	Xeir/SKwgUMRDepsAqFsN0fSHEazgRBGbuRfY6MNLEyg5w3vN9rljyKfa1AeDjc9KGOkqQURH5Re7
	sL6eGuKs9dvv/PpUZeZbCGc/bdvqtloTZPzuh94IPuaGRZa3zbCkpQpHF+E/WTuSfAB6HqYODPBxx
	QZyxbQsBuyNJyB9gj1RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWBKK-00HXgj-Ax; Thu, 08 Sep 2022 06:47:52 +0000
Received: from mail-dm6nam10on2073.outbound.protection.outlook.com ([40.107.93.73] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWBK7-00HXYA-4F
	for linux-mtd@lists.infradead.org; Thu, 08 Sep 2022 06:47:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jcQkK+rSq4c9JLVjMoeapd4DJuFOA8r3py1xRLDOdsl04TCgjhU9f/ZKeCdt+b/2mUfXNr4Adf7xbVqrPZBkcUGgfdZmOZZD+QorDCmo3jn9dvkVJpjal00dTX8rZMFkgVxFc/dHnrtLVJBtjPNaJAnz2vB0r4UHB7cKSX3jH7rBQLZ1MS+vWyQClIuzqhzWKTF7LHOuEklVUFRvJH+PPSZE0x/ogAryi47tPrXQ1he8+oSPR/oUIg1ZMdnY3rNmEqazBgGjFO9USQJYeGMFTrLnApjjcaJuuBZnoYn00YA31AV3vjHTVKrUpW5kWs+FSQpd2bagVctfNKa7sd2ysg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G6LzYBVLiB4OLIdbI0hVyP5dTRLQswQ0mmo9DUHu9KA=;
 b=hQBTVSBzJRiAC0WNh7Ws3AspJ23wSDrVXRUPAIu+yu0VYcB9m0SNo8JJl1kWojeOoW351bvId0QbSwpRqpDsb2OanfYQSLUAQZ8imZM2pBFXW3WuYv4qKuflV/4YW180efNqGcA91ZKL6n94h/RKyoWgEZMXQKbLTKlDMZJi73pGjwiVJ3QceyI4+PSFWMrWu0Bka0m4O32hTJtKDvnYqxPC7oujLBHMKL4fTMpSMLZyM0Xbf1sM8A9RTfDlx5FVC+zM27Zs+SGAastRALYsR6iHISBJqm0AWJWejYU8XPjyRdFY+KauqrR8yH3NIMwn2mqOSBjmo+CtT70+Imk97Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=microchip.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G6LzYBVLiB4OLIdbI0hVyP5dTRLQswQ0mmo9DUHu9KA=;
 b=Ial6UFznPe4oPNGS95V9YZq1hwRe68My5U6KmWFBEkZ2Zkzc+5A4LNSnWxHAbMrK9ndlTT9uDF1gQ46goyVCmhyRuGYyRqpnyxzTJrmUiwocQVjWMoxKsFDeHesh76pPXiSnZi79+HmUelzJeDUFFdZCq6+mudWjFQ1dwE7CysA=
Received: from BN9PR03CA0427.namprd03.prod.outlook.com (2603:10b6:408:113::12)
 by MN2PR12MB4406.namprd12.prod.outlook.com (2603:10b6:208:268::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12; Thu, 8 Sep
 2022 06:47:33 +0000
Received: from BL02EPF0000C402.namprd05.prod.outlook.com
 (2603:10b6:408:113:cafe::e6) by BN9PR03CA0427.outlook.office365.com
 (2603:10b6:408:113::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12 via Frontend
 Transport; Thu, 8 Sep 2022 06:47:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0000C402.mail.protection.outlook.com (10.167.241.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5612.10 via Frontend Transport; Thu, 8 Sep 2022 06:47:32 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 8 Sep
 2022 01:47:19 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 7 Sep
 2022 23:47:15 -0700
Received: from xhdlakshmis40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Thu, 8 Sep 2022 01:47:11 -0500
From: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav
	<pratyush@kernel.org>, Michael Walle <michael@walle.cc>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>
CC: <devicetree@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <saikrishna12468@gmail.com>, <git@amd.com>,
	Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Subject: [PATCH v3 1/2] dt-bindings: mtd: spi-nor: Add reset-gpios property
Date: Thu, 8 Sep 2022 12:14:27 +0530
Message-ID: <20220908064428.2962-2-sai.krishna.potthuri@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220908064428.2962-1-sai.krishna.potthuri@amd.com>
References: <20220908064428.2962-1-sai.krishna.potthuri@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0000C402:EE_|MN2PR12MB4406:EE_
X-MS-Office365-Filtering-Correlation-Id: fdf75e7b-f7bc-42d1-9d55-08da916601c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	VTNmRv8GZakscBsTtjNkUgmBuMHYsDmoVLjLrU0nAwmxLZfNLG2NJG7mR9d7v/YRtN6v/fkKJT39uPBZvr7TZImnsbDl6iJ80lQKgwYqwi8la4+ioHKslRvQxPFGdLdbTI/EF/OtM+e+S8TLYJyE3TrqoCw0HHcDwAgjUY4i9lgx/dUF750E27vXhMWg5BNYPIXTUMrwnoszb7I3HqhlcBk9NOhMok/PEcosyxkNhkITUrZEdjDumBOlmBbiyTcOadtjxqw7SsbbE2jaUgtN/veVRgqI6/ufWiYXqCAY49yJ/9S/DJMm1Et6mbgHWY9g8o5p+r3FdHTYlXIWCve9efTU9akemfHRkg4v/KPeXximPDHKvjT3bC67LSj4pCPqkZORtC+fDd11z7QR6Lyw2/rmScOiYL5Y+UkHCPlTN69mzuSxbeMeM8+mhxnUA1LYX3/mkBNsTsR86B3QB3hQceRF4Ba8AFf1odcXz5PWIPehTFfbzsCWe9IANKgPcGH6AP+pUYQ8xphFZ8X6JcwQV4xVG6NVbnkanpTbs0bNtxsQUYOuJIm6LQH0q0RBPGTx0C4ODNj+yDWRvLBtZpv/oiKYGsJTxVJhZCh0Yv08+1k1bqv3tat+/VCY/3riWvg1gSX6O7KrReCCrEKNo4gyxx2Hi8KryoFtRkZy0j/DCly2XTZZ3+TdwJmZbbM/qYUm94ejmr5fxU2dERyaCPoUGh3PS5qUGaYHmXPphjEwu5H3yXCSd9Nwafdmyg4OaibJ0ErnZuqSxFxcDudeWjSQhgMUsgA956WEHGlw6cJhdk05iSG6VKbL8aZSv7NpYDxy
X-Forefront-Antispam-Report: 	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(346002)(136003)(396003)(376002)(46966006)(40470700004)(36840700001)(426003)(41300700001)(478600001)(26005)(6666004)(2616005)(8936002)(2906002)(7416002)(5660300002)(82310400005)(40480700001)(1076003)(40460700003)(110136005)(186003)(54906003)(316002)(4326008)(70206006)(8676002)(336012)(356005)(47076005)(36756003)(81166007)(70586007)(103116003)(82740400003)(36860700001)(86362001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 06:47:32.8247
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fdf75e7b-f7bc-42d1-9d55-08da916601c9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 	BL02EPF0000C402.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4406
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220907_234739_229105_C8A11801 
X-CRM114-Status: GOOD (  13.25  )
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
 Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
index 7149784a36ac..8a843b9b8673 100644
--- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
+++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
@@ -70,6 +70,12 @@ properties:
       be used on such systems, to denote the absence of a reliable reset
       mechanism.
 
+  reset-gpios:
+    description:
+      A GPIO line connected to the RESET (active low) signal of the device.
+      If "broken-flash-reset" is present then having this property does not
+      make any difference.
+
   partitions:
     type: object
 
@@ -88,6 +94,7 @@ unevaluatedProperties: false
 
 examples:
   - |
+    #include <dt-bindings/gpio/gpio.h>
     spi {
         #address-cells = <1>;
         #size-cells = <0>;
@@ -97,6 +104,7 @@ examples:
             reg = <0>;
             spi-max-frequency = <40000000>;
             m25p,fast-read;
+            reset-gpios = <&gpio 12 GPIO_ACTIVE_LOW>;
         };
     };
 ...
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
