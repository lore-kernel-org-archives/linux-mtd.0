Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC8F3ECAAD3
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Sep 2022 07:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PWgu6pYAbveEVK98QIzufN7xY8EswJc8EMx+Qe/O4uo=; b=LPrek/dfmUB37S
	r99pYPoPQS+VkhMqBRoAXC10xKuQLfVDfwT6RjSX/DuNgwVX4G0WxuSFOEkeCXL3NPDrCnPLo8dbe
	PqRGgY6uMs3zR1FOOSi1SN2hQq56Kr//gMec8nzY7IBpsaVVQN0ymDi/Cqy/KKAXb1r6Q8wcGO5z4
	CUlZDa6H5nEdu9kqAuXjkyDneFo9+SymPGqRgIOtBP7eTZK42d83WKxPXXaQCcvsg1c5jXH5Lrpwr
	nC0tpQnVjjlV/N15agWdelIfnYoQ8EzvpnqTruzuG3kjUHaD7uOA3y//8FGgV/c2Q4PVYfs3IDQcb
	lbFJgF0GfNQ7OlVWf59A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTegP-00AL1V-V0; Thu, 01 Sep 2022 07:32:14 +0000
Received: from mail-co1nam11on2045.outbound.protection.outlook.com ([40.107.220.45] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTegN-00AKzv-6n
	for linux-mtd@lists.infradead.org; Thu, 01 Sep 2022 07:32:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nV21mEatNSlDNlBCtLPNOfIXwPNiMjf8aIg6CpXD2uz0/NPTvmLThd2Gf6R0fbK8NJNyBSRa4HElVVoC+dKch4oVPQFqvzbDwM/qz6rMVypXHjNtTiucMTzT7FLZpb9Z908mJ8nWpMBoAAOM6jfICQEP1PhV9JKPMDaN1WGAIdmAFpUJngFoobGQWfAr7JV9HweAtq5aFjhhF5mmJURyleu6JLjawILs/NuyeHq/+ov77tSKeKw6h0Bk0RxXvta+5jwE/UU/XwKz4cxQOvQ1GElTqirjd6mciNMJogldQpRDqwClrhoCH/lUHU+yWKTkIA3q4dIzbF4hjF5pJ4oxYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CAbXyVyPx8ggiwfsva4hr5bZta4OKVjO+ggy7gDhhbY=;
 b=lbLALLzjwk2Et0scjppxJH0fsNS/XUXhT0/MmFKyV8NU7iuwUZR/BpWsI67pjshNZKGaucQLEi32Lor8IbG/Dqr8DcBkXObCZyA5do66BpmTzSsBb4mMGPVrDO9Q2u55FW40YBtQiXzNVRI1etvKONgt1wEVgXoKUdJYCIReiRfle+N1hlXaaYnmm4W3bmMM1EqgYamlYEgTWP9mgEC050aoMgpPxbo6qVdD94B3E3nsZcHpm+/oPvfKI1qCvN6M97LIgwO8nCIp/7OHrt8w18iHgIk3Vy7UtmxPGvsoW8vAECs+IN2KVSu1cHVIDzkosLGduy5WkJEJp2wmYyBmqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=microchip.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CAbXyVyPx8ggiwfsva4hr5bZta4OKVjO+ggy7gDhhbY=;
 b=oBKwbCF/gMASBDR+g61CAM2xPuFxzVqHT/grFVpMtwxhw4Igjago8WAaNmkn5eKwK9CuIGM2L8+cyJYMgcR3EqXv9cSDDPGuxFAl26YLdZv2XoqeVKIuhokaQqJ85surCuQTO7O0Q/CeWcmD3vn3K1YuK+GPZzxLj287fCGHj7E=
Received: from MW2PR2101CA0021.namprd21.prod.outlook.com (2603:10b6:302:1::34)
 by CH2PR12MB4199.namprd12.prod.outlook.com (2603:10b6:610:a7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Thu, 1 Sep
 2022 07:32:06 +0000
Received: from CO1NAM11FT021.eop-nam11.prod.protection.outlook.com
 (2603:10b6:302:1:cafe::3a) by MW2PR2101CA0021.outlook.office365.com
 (2603:10b6:302:1::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.6 via Frontend
 Transport; Thu, 1 Sep 2022 07:32:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT021.mail.protection.outlook.com (10.13.175.51) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5588.10 via Frontend Transport; Thu, 1 Sep 2022 07:32:05 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 1 Sep
 2022 02:31:14 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 1 Sep
 2022 02:30:38 -0500
Received: from xhdlakshmis40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Thu, 1 Sep 2022 02:30:02 -0500
From: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav
	<pratyush@kernel.org>, Michael Walle <michael@walle.cc>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>
CC: <devicetree@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <saikrishna12468@gmail.com>, <git@amd.com>,
	Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Subject: [PATCH v2 2/2] mtd: spi-nor: Add support for flash reset
Date: Thu, 1 Sep 2022 12:59:14 +0530
Message-ID: <20220901072914.30205-3-sai.krishna.potthuri@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220901072914.30205-1-sai.krishna.potthuri@amd.com>
References: <20220901072914.30205-1-sai.krishna.potthuri@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9178107f-6e61-471a-0cab-08da8bec1236
X-MS-TrafficTypeDiagnostic: CH2PR12MB4199:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	riC2EN2tFGUZm96Nfja8Gy7IGKjNSILqIUcloSv7FiZRBbvl47A8U/xLmSQdqGuhAXin0/ErmUZgyIkAfcJ+bASL4R3XqOUPB/a3L/bMFLKqT24bW5b9BmKcGYLTFVdsrfk4vQYC5em33Nd73BAVVdmw+Pq2EaMvxmpR/FjdMc2rQv+g53VfPFQ9PUil9EuboVWrC1hy8Y9rOg4pEc3Wc00WJgs7I4WbE+yA+FmKH8YXi35f1sQX1IMtjcFKuMjiHIIF2ZLHe128i2FAXY4BVvYk3rmn+T9dtWneNX/21PacmJLZWEhmCmtlmkUmX2mYpuA1anlouGI4uQUtfr+jQDaTHlStz9qEOmqzKT8r++2J2zPPDCmlIFAj3Tdq6HP1UzS8gOc0CG80zRJV6wHDTdGJMtaVGUt56/Fzfv66CSsLuwIEgYVLNZ/qfHQPtnbPNfLvxN4EyckTdLHCyoSiddQy0VSNqtIBr/qhdD5MGtYn5ZI0YViXDg13TkT0tHFy4nxI2bPfN25lQVtvmMjB6vD9ezuB8T+/ZNM24Zd6cxmyDPvCI58T/UIAbwPBxDKdxPOoQ+6wC3m8dwCn1hs/J16xKli7whC3LWbDzb1m7E+RuW4y41nzHugdsbRlYi9mkTFwNqLEEs/P4e/rwlnaZilFKR5G3sElur43yQprPhfe8d/wrYxrMFp9pPxp8RslBJmz3bzxp5nzaisZbYiRU+9n6nkTvZ0sjKLK7158N4ZlUWjwGEjC46P9fViDDPqMNWpL5TX/COvimKWr/5M6ykT96kLcvj7QERP2xCTLvj9dVMl6BAFRLNvLh/lufiOn
X-Forefront-Antispam-Report: 	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(376002)(39860400002)(136003)(396003)(346002)(46966006)(36840700001)(40470700004)(356005)(82740400003)(2616005)(336012)(186003)(1076003)(36860700001)(36756003)(103116003)(86362001)(41300700001)(81166007)(47076005)(426003)(26005)(6666004)(54906003)(40480700001)(70586007)(316002)(478600001)(70206006)(110136005)(40460700003)(7416002)(2906002)(4326008)(82310400005)(5660300002)(8676002)(8936002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2022 07:32:05.8546
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9178107f-6e61-471a-0cab-08da8bec1236
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 	CO1NAM11FT021.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4199
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_003211_287725_C60C45EF 
X-CRM114-Status: GOOD (  13.90  )
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

Add support for spi-nor flash reset via GPIO controller by reading the
reset-gpio property. If there is a valid GPIO specifier then reset will
be performed by asserting and deasserting the GPIO using gpiod APIs
otherwise it will not perform any operation.

Signed-off-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
---
 drivers/mtd/spi-nor/core.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index f2c64006f8d7..a78ab9bae2be 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2933,6 +2933,27 @@ static void spi_nor_set_mtd_info(struct spi_nor *nor)
 	mtd->_put_device = spi_nor_put_device;
 }
 
+static int spi_nor_hw_reset(struct spi_nor *nor)
+{
+	struct gpio_desc *reset;
+
+	reset = devm_gpiod_get_optional(nor->dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR_OR_NULL(reset))
+		return PTR_ERR_OR_ZERO(reset);
+
+	/*
+	 * Experimental delay values by looking at different flash device
+	 * vendors datasheets.
+	 */
+	usleep_range(1, 5);
+	gpiod_set_value_cansleep(reset, 1);
+	usleep_range(100, 150);
+	gpiod_set_value_cansleep(reset, 0);
+	usleep_range(1000, 1200);
+
+	return 0;
+}
+
 int spi_nor_scan(struct spi_nor *nor, const char *name,
 		 const struct spi_nor_hwcaps *hwcaps)
 {
@@ -2965,6 +2986,10 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	if (!nor->bouncebuf)
 		return -ENOMEM;
 
+	ret = spi_nor_hw_reset(nor);
+	if (ret)
+		return ret;
+
 	info = spi_nor_get_flash_info(nor, name);
 	if (IS_ERR(info))
 		return PTR_ERR(info);
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
