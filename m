Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8064CCD68E5
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Oct 2023 08:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ikeqe2x1XFefhpO/FTHeE6b5By7Eg4aypxYR9FFAXwA=; b=qSVKmjRY6Z+RFA
	lQMaTM4oL9yzJv9/wtF9TnbLCr+3j+Wt/va5aMvorenXIkwJh26Ta7RLlqkJ8dwdEY3TYgf+FxEd+
	OS/2qGyk6Kx+Ig1xC999KEyDYmO5a9jAXF+QCaFP7Hgupeo1ZDdfgY1Ta/a5J5PTn8l73O5El/Z+A
	uoo+ls+H/wR4Thq1uhhRwp4sGGYUnFboJgFcMqCTLPcOFfT7aS4TtzwrZF5rUcJIZ/EZtTIBOlKfU
	oW3v840iXrgpYu/lN1gOk+/cCphQEB5ZqEYUx7/Cl0BNZvIRvDmGhRbs67izaFBhinhjQv6lglN/1
	dWhQZ2xcmCjuGpgJ7LPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qq8aL-00Cskc-1F;
	Tue, 10 Oct 2023 08:59:25 +0000
Received: from mail-db3eur04on0728.outbound.protection.outlook.com ([2a01:111:f400:fe0c::728] helo=EUR04-DB3-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qq8aI-00CsjX-0d
	for linux-mtd@lists.infradead.org;
	Tue, 10 Oct 2023 08:59:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JRau3QBfqmB+P7CI7ELzZRhre0J2JrAjq3SQ0/T/c/49fyttJ5rG+2x0Moeakl+oNa44+bMulA6P4kGTUgiR6aSMMaLi6JcVao+QGiWwOD/tsy6tE6FRqboZIOl4odNZo7IJzxVootb1jnd+pAlcdzmikuR/Xbw7Nc1Et8SBIIz3Lh8uFVOVZLb76Qehh8EO3i7hTxy+4si9mVhEQzUiCPJy1scjlohQ9zZgkGuKqlgMCpIpRCnAq9dHPKviQ7YLrbEjP9TooilvnI/EhNvTl9CQImpaNirz1C8l36lxkGNSlB5DbIgihH4N1VNFHKqOhoBujw5L4ETyaWG0ZAEZrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oVo26xdZqOAILJa8xeBMwi007uLApMIutQP2DssQ7No=;
 b=aOVVcjG66aNme8vzTzqt3HtHkx+KYWnUBAVFZsTK4CylqFLEu/jqdZKoaoVtSBX3J+AwYxINHlNHDJQ9RjQTYcq4GdFRjUaWB0YDVICn9BctvqPDvRIO69NlEBSVLrIyhFl5EFczjL/2QRxsZ8LvZ2A1ptb4hbPe94BZjgRPqy9tlwTzsfWVSfIxfX1/f3FUvanZA2S8/3d/etRL5mXPE0s5an/SWIq3ACbQILnR7ykyIIQV8FSgFVsMHRfdDN+WjJT0gnSUp627Gbw0MdTPvyI7GEh2qIqxRYWIXosZpAQIk+960wBlbMxmI2A5PSKk84Yz9y6Fj79jwBs5STrY9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oVo26xdZqOAILJa8xeBMwi007uLApMIutQP2DssQ7No=;
 b=Yy5WcrdymlDeimsQTKjdRdVO5O9BRb64VPOCUsJcjkb73y3axXP8jKi8jEmpiOxP903D2WPg4fDOTuQf3H6X9nZgP2K3oaSBMjttCp3yYbbkhVkgeREoA6Y+IFBncYciHm1y4BA+yXNHTnJyvA+8NmHIPRqyIhZ9bEW07qMjnoI=
Received: from AM6PR05CA0033.eurprd05.prod.outlook.com (2603:10a6:20b:2e::46)
 by AM8PR06MB6945.eurprd06.prod.outlook.com (2603:10a6:20b:1d6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.37; Tue, 10 Oct
 2023 08:43:47 +0000
Received: from AMS1EPF00000049.eurprd04.prod.outlook.com
 (2603:10a6:20b:2e:cafe::2d) by AM6PR05CA0033.outlook.office365.com
 (2603:10a6:20b:2e::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.33 via Frontend
 Transport; Tue, 10 Oct 2023 08:43:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 AMS1EPF00000049.mail.protection.outlook.com (10.167.16.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.22 via Frontend Transport; Tue, 10 Oct 2023 08:43:47 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Tue, 10 Oct 2023 10:43:47 +0200
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
Subject: [PATCH v3 3/3] mtd: micron-st: add post bfpt fix for mt25qu512a
Date: Tue, 10 Oct 2023 10:43:23 +0200
Message-Id: <28b5597f13ca6baab602e076b4beff4c893e4d11.1696849423.git.mamta.shukla@leica-geosystems.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <6b89ae4e4d7a381050746458cb000cd3c60f7a42.1696849423.git.mamta.shukla@leica-geosystems.com>
References: <6b89ae4e4d7a381050746458cb000cd3c60f7a42.1696849423.git.mamta.shukla@leica-geosystems.com>
MIME-Version: 1.0
X-OriginalArrivalTime: 10 Oct 2023 08:43:47.0510 (UTC) FILETIME=[E281F560:01D9FB55]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000049:EE_|AM8PR06MB6945:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cb437a7-b31b-472d-e2f9-08dbc96d0520
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JpG/fb4V+btwkANP7vWFG4md8k5NBT6quJrCUm4d/t4K8qLAOFE8FCA9RZl6wDkSi0Hmju1q2TrmdrSTMqP8LSFbYOdbDAE+ZmI5Ci/PjQnFdtyoBwVqifQp1r57UgIBVmVlSPlHCArG8tmFwr14lgLBp93yaYbqF6Q+qVtoyPzmR0nQW+QpJtWPZJMN+HYdXwzk7CCEz4yuwGYZIpAeO8032FryX3eV2blfK4HcQ/wfgXwdrG4KhYgo/Mrmi1Jwdgk+CjzAGR9IQplefxgR3hzjbnNPukwiN0Sn3ffltt0i+ecEsxdFvTmck2VKOpey7JMUar8ftqtiPbwkhNNPLEONF7NUeBHL6YtnLdYmlK/oIERx9FQqREsS48PZ5WkQprllbMHxrDEpSdF/PdFwIwWuKRshT2t/FRbKFkPL3GO/CTP9Mu+D/7XSk3X0fjxQWdqOMAhQG+CbeQ/KICIBU37wgK1ZJnub152nvaKP3MvaPaGjkgfB8VPyiC1QE9IzDJNaHyN3DAFUUxUdJfbBJWqQrBNcZV9JDqz1ATzCtOrgDEQs2RKrTauVuheUYkVNOi3taE20pEhSc6Dpf/6llRb8QQ1Nd+NzD/6O5ezSVb0ponxM4egymLdQpNZCm4QP4BTRJn3yUE7lzMUBarh0eazKytA3Q6r3bkHVrrK/o9Wn1SguqTmrC0HpM8HgsXHAVhWvB/jtvj2s4k6lWfo/7ZG6QTccyYAgkzK6J6azLupHoraslL4NgXYFt8TuQUoMBNYTKi7aojMPdMI1BHP7gA==
X-Forefront-Antispam-Report: CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(346002)(376002)(39860400002)(136003)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(82310400011)(46966006)(40470700004)(36840700001)(40480700001)(47076005)(40460700003)(336012)(83380400001)(2616005)(107886003)(70586007)(36860700001)(26005)(70206006)(316002)(4326008)(8936002)(8676002)(6666004)(44832011)(41300700001)(5660300002)(2906002)(478600001)(36756003)(81166007)(86362001)(82740400003)(356005)(138113003);DIR:OUT;SFP:1102;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 08:43:47.7404
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cb437a7-b31b-472d-e2f9-08dbc96d0520
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000049.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR06MB6945
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231010_015922_239887_549489E9 
X-CRM114-Status: GOOD (  10.39  )
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

Parsing SFDP Table for mt25qu512a adds flag for 16Bit Status Register.

 cat /sys/kernel/debug/spi-nor/spi-PRP0001:00/params
 name            mt25qu512a
 id              20 bb 20 10 44 00
 size            64.0 MiB
 write size      1
 page size       256
 address nbytes  4
 flags           HAS_SR_TB | 4B_OPCODES | HAS_4BAIT | HAS_LOCK | HAS_16BIT_SR |
  HAS_4BIT_BP | HAS_SR_BP3_BIT6 | SOFT_RESET

This Flag leads to miscalculation of BP bits and thus causes failure of lock/
unlock functionality of chip. Hence, add post bfpt fixups to fix parsed
sfdp setting.

Signed-off-by: Mamta Shukla <mamta.shukla@leica-geosystems.com>
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/spi-nor/micron-st.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index 4feb03ee2d13..b7bf0570c01f 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -180,6 +180,19 @@ static const struct flash_info micron_nor_parts[] = {
 	},
 };
 
+
+static int mt25qu512a_post_bfpt_fixup(struct spi_nor *nor,
+								const struct sfdp_parameter_header *bfpt_header,
+								const struct sfdp_bfpt *bfpt)
+{
+	nor->flags &= ~SNOR_F_HAS_16BIT_SR;
+	return 0;
+}
+
+static struct spi_nor_fixups mt25qu512a_fixups = {
+	.post_bfpt = mt25qu512a_post_bfpt_fixup,
+};
+
 static const struct flash_info st_nor_parts[] = {
 	{
 		.name = "m25p05-nonjedec",
@@ -408,6 +421,7 @@ static const struct flash_info st_nor_parts[] = {
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
 			SPI_NOR_BP3_SR_BIT6,
 		.mfr_flags = USE_FSR,
+		.fixups = &mt25qu512a_fixups,
 	}, {
 		.id = SNOR_ID(0x20, 0xbb, 0x20),
 		.name = "n25q512a",
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
