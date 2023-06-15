Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E05CEB64DC
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Jun 2023 11:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+wbsvgxzcLVK3hiHednrESTG5aAB08dogC0WmV1RMks=; b=0ORPdSZ7qtCSd5
	Ny2eQ97yipUIlKADKUS6ehs3mRB0ANdEWvxKrU19k/npgKFwlP+cKSB6WuIjmaQJURGMuI5SOlMMr
	aN+am5SZnJwfjZPonzOOUcCCKo7b374hO4WCsiJ0iprXjnKtnHTKL8lSiEvDJ0HXhml4C5/MbIPA+
	RPrU2fqh6efOPjLu63CaEqfa7PPE7FzSdVX1xKVTUxpK4bJrb4PMpxoSLyQ9oEmgjUGFhKOtvRY+/
	TgRoL8aIJ8MVCl8Rha3ZaF79a3nObRK4P3pjQniRI/JoMsBZztUoHPW4b78mkRxes7pva/g3bGjr6
	qMHfhvr3haBHW1Iwlt+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9kya-00EgRZ-2j;
	Thu, 15 Jun 2023 11:17:16 +0000
Received: from mail-bn8nam11on20600.outbound.protection.outlook.com ([2a01:111:f400:7eae::600] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9kyY-00EgPw-0d
	for linux-mtd@lists.infradead.org;
	Thu, 15 Jun 2023 11:17:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RmorYjQyipi/fHroXiCpmy4YOP3Xim5Jqe1OEDWni3kGhFPvM1eYOSmVjViXRDiPY/zOApbGQGFqNtNy+J3gxAQFrXmBYAmdsRQvnFkdH9o8+UZB+QISQoWgKfN6uDHjbsbO6snul0cNDPT+a5KL3r65v/A49xzZYPd1Qh3SMhW1ZWWgW/u/OZgnXxEUvE/s+1DLKXQKgd5ZImhM8s7rivcrTVqilaQ1OQpBhA8PFvZuSJnK1ruFQ1YLRu9BysUiHr7Aa5CnyVG4ek/d3dCvnCokt5SVmhuvahO0bRtrRL2vgABuLZJAeY9ECpmChjBlS7/6tUjXbaA21gLbleISjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zr1+zYjtepEiq7UlcHy7vwzAYrAfxjUoBXuNizs+2r0=;
 b=jQ8PdOuBaq/vKFL3nGYYaHrKQlgXBqTyYQELFjGWbnxEafKIAX/i+K5CMKu1kEZkn2nP3Fw1VYNqhyONlVINbBZbOOFRS2/bkXXOXsrCqkSG+RUek9vzqRX2bf5Lqh9MkVgkxN7NkVbD75sjyDVnL+FmUtIkKyBsjU8mtyTvXGqtY4HeKSW5WCFfEgVmMaiAvFxcQ/ZSCyfHOihDMEqW1S6fhaR+5j9ASVO37qJxccxhlHBHpmzpb6WrDrqYnvCkXbBcJR+RgNSbrbP/6LGBYznfyW0y/1QHafgmc5ulc3tV+f9w6NrKz6Rx5Lng22SQNS+E3GKUXAY5sF0XuD+Q2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zr1+zYjtepEiq7UlcHy7vwzAYrAfxjUoBXuNizs+2r0=;
 b=ejScmY6cReE4MfJGi0GwMMytziCyoEMElCQhsEN2TT2Mdo6v2Ik6iu+WlqFhAgOWxjEoitBjHS86Pua0eZIT5BPEoBCypQuY94Fi2ot46nJgtIjDxm//fj1L5nq39UZXdLuIFHdwFNDlm7SIs9cRFF/bwZ5nXpp97hIs/jk0H4I=
Received: from DS7PR03CA0088.namprd03.prod.outlook.com (2603:10b6:5:3bb::33)
 by SA3PR12MB8802.namprd12.prod.outlook.com (2603:10b6:806:312::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.25; Thu, 15 Jun
 2023 11:17:05 +0000
Received: from DM6NAM11FT103.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3bb:cafe::d4) by DS7PR03CA0088.outlook.office365.com
 (2603:10b6:5:3bb::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37 via Frontend
 Transport; Thu, 15 Jun 2023 11:17:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT103.mail.protection.outlook.com (10.13.172.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6500.26 via Frontend Transport; Thu, 15 Jun 2023 11:17:05 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Thu, 15 Jun
 2023 06:17:04 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Thu, 15 Jun
 2023 04:17:04 -0700
Received: from xhdakumarma40u.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.23
 via Frontend Transport; Thu, 15 Jun 2023 06:17:00 -0500
From: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
To: <tudor.ambarus@linaro.org>, <pratyush@kernel.org>,
	<miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<conor+dt@kernel.org>
CC: <git@amd.com>, <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<amitrkcian2002@gmail.com>, Amit Kumar Mahapatra
	<amit.kumar-mahapatra@amd.com>
Subject: [PATCH 2/2] mtd: spi-nor: Avoid setting SRWD bit in SR if WP signal not connected
Date: Thu, 15 Jun 2023 16:46:49 +0530
Message-ID: <20230615111649.36344-3-amit.kumar-mahapatra@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230615111649.36344-1-amit.kumar-mahapatra@amd.com>
References: <20230615111649.36344-1-amit.kumar-mahapatra@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT103:EE_|SA3PR12MB8802:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ae19120-460b-40a2-1693-08db6d920ce0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IyROXzdFB7BFYv71BvpiNkbF+DktKPNbimxweM94UZDypIWScPY3QhwpPdbGm+8MlgSnatyIwDHKczs9T3FjRaMr0SNanGNMp5ycB5QuqhjWcusO84kxRDq3lrbGdR/BuZb9tvHD6BH7YamO3E/ayhgLWiwgjebDwt4mbqfr5j0vXQdEwqlzZKmGerO4SH7LcRifRWYWuauCJ2E/kfDJzLb1DxK7dbsNlFH2iU0OhvPCEPhTe9HobMPt/2QaLVcFs/FGH9aYQL10+dVKk+hF1jlcOQKSXCjejrFXEATHQbiMKgw9NpudRMO06iSGAsipwo4ZKXg1U5DsUEooWBp23DSnslp47yHVXLa2zflwnFWZcUlhzJIL4t9b7bL9flHhE6iAb5Gx7VFelRaJKmqR0DshMI3/iJGM5VVKik8Qb0Mg1q8v3hZSANJ1/jVcw1db0F9t6GpLRsW/p0mtBnwMc5GD8O7MDA3b/XPkKzA1jq4iJ7IhmSfg2DlB44CRazKfiOHyZvrOW10d3M/tzsTEuHa70dxXsjv8XygU2FntprVE/eR5/GE1kAU+LOXV85Jm2cbHSSGfcNIXCTfka6SZEhnmRCnp4QEnTwUiEV4pXX5sBtvYFIp6nxc57GHu9QEZx01O5vKCrmeFzhzN4+ONS7azky1hBkFA3RZfLhxb8290092YjJfONqvubfF9Rx2ROG1fEmPzaxC4mjYKkiDJdv9nK9Xk9r7v7Dkuuw4nanaY7FDwjiMa4ed0Pl2cCBTN6raOayraDLBCXroV7ynlhA==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(376002)(39860400002)(136003)(451199021)(36840700001)(46966006)(40470700004)(5660300002)(478600001)(54906003)(40480700001)(8936002)(41300700001)(316002)(8676002)(1076003)(7416002)(186003)(4326008)(70206006)(70586007)(110136005)(6666004)(26005)(2616005)(47076005)(40460700003)(36860700001)(336012)(426003)(2906002)(83380400001)(356005)(82740400003)(81166007)(82310400005)(86362001)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2023 11:17:05.0784
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ae19120-460b-40a2-1693-08db6d920ce0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT103.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8802
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230615_041714_237081_D5D2BAFD 
X-CRM114-Status: GOOD (  13.87  )
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

Setting the status register write disable (SRWD) bit in the status
register (SR) with WP signal of the flash not connected will configure the
SR permanently as read-only. If WP signal is not connected, avoid setting
SRWD bit while writing the SR during flash protection.

Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
---
 drivers/mtd/spi-nor/core.c | 3 +++
 drivers/mtd/spi-nor/core.h | 1 +
 drivers/mtd/spi-nor/swp.c  | 5 +++--
 3 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 0bb0ad14a2fc..81b57c51f41c 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2864,6 +2864,9 @@ static void spi_nor_init_flags(struct spi_nor *nor)
 	if (flags & NO_CHIP_ERASE)
 		nor->flags |= SNOR_F_NO_OP_CHIP_ERASE;
 
+	if (of_property_read_bool(np, "broken-wp"))
+		nor->flags |= SNOR_F_BROKEN_WP;
+
 	if (flags & SPI_NOR_RWW && nor->info->n_banks > 1 &&
 	    !nor->controller_ops)
 		nor->flags |= SNOR_F_RWW;
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 4fb5ff09c63a..6ac932eba913 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -132,6 +132,7 @@ enum spi_nor_option_flags {
 	SNOR_F_SWP_IS_VOLATILE	= BIT(13),
 	SNOR_F_RWW		= BIT(14),
 	SNOR_F_ECC		= BIT(15),
+	SNOR_F_BROKEN_WP	= BIT(16),
 };
 
 struct spi_nor_read_command {
diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
index 0ba716e84377..074f3bce2034 100644
--- a/drivers/mtd/spi-nor/swp.c
+++ b/drivers/mtd/spi-nor/swp.c
@@ -214,8 +214,9 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 
 	status_new = (status_old & ~mask & ~tb_mask) | val;
 
-	/* Disallow further writes if WP pin is asserted */
-	status_new |= SR_SRWD;
+	/* Disallow further writes if WP pin is connected */
+	if (!(nor->flags & SNOR_F_BROKEN_WP))
+		status_new |= SR_SRWD;
 
 	if (!use_top)
 		status_new |= tb_mask;
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
