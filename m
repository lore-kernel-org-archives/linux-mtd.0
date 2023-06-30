Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D103AEB64DC
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Jun 2023 14:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HXNNX/MBXHMFjgeYGok+DG1fP34/SFMSNWT8LObRWFA=; b=ZuX3eR20io4wGN
	Xg2cZZkRW8rtuMVITJcVcfgWiK62uocWaqG5cMVxFLPEZY0P7zJJKFEFZKWrZYwqkfg/1to42367q
	27/5mUKpg4+p4232RVQlAlSTVdcaiYMQOJAuwyW2ag0jPHn5vdZGQpiTLGgo3oOi/OoiFuZweKGjd
	lT2h4w7TTr+ym3KhRl/ibZePfXIIJHejFbn9wTk2oOX5OGmjYzix6f5HJbnrgT/f+olYnIzGbfx9l
	X5N6t1jxQwNyFUGDBi9Vyt598ucYPLxzxyQGOXqQo0qRZYKLnB7+b4i0Mk9kZmf582ziVpbUxFheC
	YnxpbT2kzg7APU5NKoiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFF1Z-003qAB-0Y;
	Fri, 30 Jun 2023 14:23:01 +0000
Received: from mail-dm6nam12on20605.outbound.protection.outlook.com ([2a01:111:f400:fe59::605] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFF1W-003q8z-3C
	for linux-mtd@lists.infradead.org;
	Fri, 30 Jun 2023 14:23:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xw7RF+3OqIswbnckuZXrKEah6WYdQ4lBdwRsjXV9s0ji60DhIitsE7XQ8+6krwMMmCPoh5AyRFUfufbK4/v6yGjauu1x4pGRk95OJW7gBnoFOU4KemvM4qD9OLHxjC0Dl3PMUmgXmdaWsgkORkZdelUZGOK/PgvOLliNCL40Ibej8dtVE0E3hFOASOBu6uuQvUs0EdgB4DBIl8/8roBcecEPN8CdjsvRM2sRszbHmRh2tzE8mpiSCKi7RJYMssE95kIW2dVKHDDj1pIaBf47i3+mxJci1BLphIqDm6TpBb1BZ3yfuMWs7C2XABthivpifQFjL7D3ZjOPWmSdZnbTMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1lSxVmcXp5yVNt1hwgwl8dHwzeEFZyc4m/AacEM1+vY=;
 b=ZWXB26rqPafYavJ2FXZiOmEii2fpRAdf68Y/NsWeIgU3zDy4qdwjxwk1QvCgOAseyNpEL8H/Y/We3bwlPLaqtVpGGHKeLb+6Z2hdy3v+C9CocHPPXrhePmj6tld+O1pOXJ7K6DsrRr90r0h9N6LTL+cAVDPeB/FYpGAFEZ/iu62uuHYtlAMMCPDzhtuXDXtMiHly7KH7u6TAvRZ9aprbNgBXlBgw7TNwNGDzJ0S7TLYDRt0h1xYLuLcaTPY2hwJsrVYNF7RT7+zxNqpjb+uDN04NKswWdMJ6LMgDPMj/1kH7wEy3WmTLQTQcMkZXH0cN3eFPrGKRRtMuF0u7UTIKig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1lSxVmcXp5yVNt1hwgwl8dHwzeEFZyc4m/AacEM1+vY=;
 b=NtcAQ1uzyeP6CeDCg0u8XStr1Rk5vmkp2SAlbkMTAnfe5xiRbx3+9c3NWrkr4yP6hMRO9XZ70JIMzUY6Mr1dNjLqei0cKDePiAQV1hJshFlzSCeaYK1ldXNI6QoDveUivQraK9EqByVAtsi0kmCvYEmZ+hrMJ2i0aKqIWDiZRy4=
Received: from SJ0PR05CA0019.namprd05.prod.outlook.com (2603:10b6:a03:33b::24)
 by BL0PR12MB4882.namprd12.prod.outlook.com (2603:10b6:208:1c3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.19; Fri, 30 Jun
 2023 14:22:51 +0000
Received: from DM6NAM11FT107.eop-nam11.prod.protection.outlook.com
 (2603:10b6:a03:33b:cafe::78) by SJ0PR05CA0019.outlook.office365.com
 (2603:10b6:a03:33b::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.12 via Frontend
 Transport; Fri, 30 Jun 2023 14:22:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT107.mail.protection.outlook.com (10.13.172.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6521.43 via Frontend Transport; Fri, 30 Jun 2023 14:22:50 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Fri, 30 Jun
 2023 09:22:49 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Fri, 30 Jun
 2023 07:22:48 -0700
Received: from xhdakumarma40u.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.23
 via Frontend Transport; Fri, 30 Jun 2023 09:22:44 -0500
From: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
To: <tudor.ambarus@linaro.org>, <pratyush@kernel.org>,
	<miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<conor+dt@kernel.org>
CC: <git@amd.com>, <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<amitrkcian2002@gmail.com>, Amit Kumar Mahapatra
	<amit.kumar-mahapatra@amd.com>
Subject: [PATCH v4 2/2] mtd: spi-nor: Avoid setting SRWD bit in SR if WP# signal not connected
Date: Fri, 30 Jun 2023 19:52:33 +0530
Message-ID: <20230630142233.63585-3-amit.kumar-mahapatra@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230630142233.63585-1-amit.kumar-mahapatra@amd.com>
References: <20230630142233.63585-1-amit.kumar-mahapatra@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT107:EE_|BL0PR12MB4882:EE_
X-MS-Office365-Filtering-Correlation-Id: 928c7ed1-dc43-4f9c-b297-08db79757c13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2tzryPe7UsOplof1QoYs9gSppk6sNNN1943dk0HuXhIDJ+5VAaGTZ+UbukuhXKt1FXi5iChMpxK+dhQc+Clx4RKIJ3JAkqP+HtqkU8Fv+bVARdnZR9uHixU/LDGF+g69HB+cs84mRziRxnU3xXNz5S688mygknmyrWIzWBvX+J10dkJzTxaObsMMlcj5bDLJl9cVffZ4BmkhSB9eP4/nBjPPjhmeGgIKYdCeJsSvoMyS2p9pXH6w9bDQRkNJx9lS7OVn0+jq9sd56rI05mp4Toi+8qQAEB6vtB07MCjlIqT+yCJzJsAdUfSmm0CvDQMdT8GdZQJvnd6TtQu8nQyteDt+7wzQm0CeLzpd5MxbPmKZRAtjN/aVdlxwepUiK6iBBbX0gx+qMQ0dIuf9ZgAc8Ubdm3SgoqOQXyDpjC83pLJH3YsR85jVHKd82YgE4dnQoOqTBS6QJP6dH9k6uRvsLRmHXFn/vtRRlJahJ87IvmDYZvZ0UJGeO1ZCYNOnyRlw5lRRShT6vld0Xiy9vS99fKr2CJCHOhR2tqVdC7td5T444MQ0ytZqoAlRvadFnmzhSY1nQdNCSqJE71r4JKLYW5VOYDfyWKn01xFlEJnI8J7Lgnj8g6EZd5+k1cdIwLOKo2N35QNeeze3eBY4BAen/6wZzy+lbZv2b6BLzgGIpLrjTsZWBPXxcpYrx1SLhF8CMhSkgNbwp0oy/GgIhUo09dyahLHBrq26HUNz25U6vef3gbZrmN0hCVZGkNHy/eI9Be9S0YieZURR+QVlRdNYUQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(136003)(39860400002)(376002)(451199021)(36840700001)(46966006)(40470700004)(40460700003)(4326008)(316002)(70586007)(6666004)(478600001)(110136005)(70206006)(54906003)(36756003)(86362001)(47076005)(426003)(83380400001)(186003)(26005)(2616005)(336012)(36860700001)(82310400005)(1076003)(2906002)(5660300002)(7416002)(41300700001)(8676002)(8936002)(40480700001)(356005)(81166007)(82740400003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2023 14:22:50.2076
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 928c7ed1-dc43-4f9c-b297-08db79757c13
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT107.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4882
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230630_072259_036091_88084CD6 
X-CRM114-Status: GOOD (  14.46  )
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
register (SR) with WP# signal of the flash left floating or wrongly tied to
GND (that includes internal pull-downs), will configure the SR permanently
as read-only. If WP# signal is left floating or wrongly tied to GND, avoid
setting SRWD bit while writing the SR during flash protection.

Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
---
 drivers/mtd/spi-nor/core.c    | 3 +++
 drivers/mtd/spi-nor/core.h    | 1 +
 drivers/mtd/spi-nor/debugfs.c | 1 +
 drivers/mtd/spi-nor/swp.c     | 9 +++++++--
 4 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 0bb0ad14a2fc..520f5ab86d2b 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2864,6 +2864,9 @@ static void spi_nor_init_flags(struct spi_nor *nor)
 	if (flags & NO_CHIP_ERASE)
 		nor->flags |= SNOR_F_NO_OP_CHIP_ERASE;
 
+	if (of_property_read_bool(np, "no-wp"))
+		nor->flags |= SNOR_F_NO_WP;
+
 	if (flags & SPI_NOR_RWW && nor->info->n_banks > 1 &&
 	    !nor->controller_ops)
 		nor->flags |= SNOR_F_RWW;
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 4fb5ff09c63a..55b5e7abce6e 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -132,6 +132,7 @@ enum spi_nor_option_flags {
 	SNOR_F_SWP_IS_VOLATILE	= BIT(13),
 	SNOR_F_RWW		= BIT(14),
 	SNOR_F_ECC		= BIT(15),
+	SNOR_F_NO_WP		= BIT(16),
 };
 
 struct spi_nor_read_command {
diff --git a/drivers/mtd/spi-nor/debugfs.c b/drivers/mtd/spi-nor/debugfs.c
index e11536fffe0f..6e163cb5b478 100644
--- a/drivers/mtd/spi-nor/debugfs.c
+++ b/drivers/mtd/spi-nor/debugfs.c
@@ -27,6 +27,7 @@ static const char *const snor_f_names[] = {
 	SNOR_F_NAME(SWP_IS_VOLATILE),
 	SNOR_F_NAME(RWW),
 	SNOR_F_NAME(ECC),
+	SNOR_F_NAME(NO_WP),
 };
 #undef SNOR_F_NAME
 
diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
index 0ba716e84377..5ab9d5324860 100644
--- a/drivers/mtd/spi-nor/swp.c
+++ b/drivers/mtd/spi-nor/swp.c
@@ -214,8 +214,13 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 
 	status_new = (status_old & ~mask & ~tb_mask) | val;
 
-	/* Disallow further writes if WP pin is asserted */
-	status_new |= SR_SRWD;
+	/*
+	 * Disallow further writes if WP# pin is neither left floating nor
+	 * wrongly tied to GND (that includes internal pull-downs).
+	 * WP# pin hard strapped to GND can be a valid use case.
+	 */
+	if (!(nor->flags & SNOR_F_NO_WP))
+		status_new |= SR_SRWD;
 
 	if (!use_top)
 		status_new |= tb_mask;
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
