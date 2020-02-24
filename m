Return-Path: <SRS0=aChT=4M=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1332C35679
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Feb 2020 08:48:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F7F620828
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Feb 2020 08:48:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HDJXMkej";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nokia.onmicrosoft.com header.i=@nokia.onmicrosoft.com header.b="H6UdCg8G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F7F620828
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nokia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rMqaJ5HUzsh0QdK69FWwBjRKub81kzKsCMqPJHsjwio=; b=HDJXMkejz10OU4
	uGuHGXZE0Yns0SLTMK1/Qx+C4AiEPglGx8fng8zRPCAKfcFyHnv6OlKo+ooXMh3o3mEM7GECGYNOU
	pAF6ds1JMICAyBh32l+Iq9kT3PlJAQmcHiblsVOj6fJ5NBIq1bGg16x5+vScZd6rbfp366r5gPyZn
	BnRRjD0MFNlDwmriEvS6oTP1+rc9D5143EoDjtT6T+MaCIS2RBQugm6A+C/SiUG0MfT09x5I603Om
	llPbhr/hatQUugBwhPB3ECOnYgj8gXJ+FCmQNwwFnOKVJrijRbCo9iD8iaJMUmxHXfiwl6677iTuQ
	JDlfTiP7xuNChckjW7KA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j69PT-0004Ms-88; Mon, 24 Feb 2020 08:48:15 +0000
Received: from mail-eopbgr60128.outbound.protection.outlook.com
 ([40.107.6.128] helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j69PK-0004D0-OA
 for linux-mtd@lists.infradead.org; Mon, 24 Feb 2020 08:48:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CiXBcdxnalrzEY5cTRPseP0LkkV+XfuHpc0ak7xn4Z0MnGV+7YqnE2zdihRdu8mALM2PEW6HgHTm3LICztx2PuoTeAa12f0wtHjF6G/eu17pBWYK6jZJxgL6sbFMTEc8EUhxucOAtHahn+Q+O/8Y5/o7DGHTs/ExBiATjedr3mmYvHehiJQCou0oSPt+3iiRoPkeMyIHyEg83/RL8Cmxa0gN/BRDCnrUu3Y1wb0Fw/sT0quL+ZQSv4zVu2TfmGNmnXb9ZlAvMXtUtKXrGxXTcjOM8ISi/hhyDQ5WLbyk16FwxyB2bcO7jMWpPxKRYApR1sZ0dBeyJ4hYoeujRiUm4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GOAhx7cZMt8K5B9ustYoJM7lw7oxr3sU8iaw6j2PX6s=;
 b=kg9ab6wXzAjeq1WGJ62LVAJ9h9aCWAAHjHppEvbQOyN7rBPvpmFL1qBb3G92qURxhIu0zLAesfP5hjhvUGVWKYy6XR4inqzEMGzK1bHwJOG+Ccjo42J9O+mcycHGc4EcGwKr9sxYeIeN8caLVpXDF6epLRNq9/T6drFdLVShtFYvQCpINZqa3WYlwgOVZ0kl/e8mOr6+vkbbtAJNG8adFOcXc79wTG+NQIJrL3HLOfWinXOmoGJUi9FH4ENbCoei7kNPEmhGOkKr4clrL5yD105S3dnHC7aEep6ZqmqTgXO6DJi0c91SKnUWTXS33hQ0wYHYxvsbq/CdpTJ7iRC6hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com; 
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GOAhx7cZMt8K5B9ustYoJM7lw7oxr3sU8iaw6j2PX6s=;
 b=H6UdCg8GcuMQjLfgmmyFYucHuaP5ECvZSSzmAe84k1C6SEfZUaQPNSM2MFXDxyFq8MvL9M5HFdFWCs6RQV7KLY8Ml3iWOPz6UXbjz6WECULMIVWGKUtZAYYf5nSSixbhhbK9w9+EdFD3I2Ugt6q5liUDQ3Qj5PE7ooReZZM/d6k=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=alexander.sverdlin@nokia.com; 
Received: from VI1PR07MB5040.eurprd07.prod.outlook.com (20.177.203.20) by
 VI1PR07MB6032.eurprd07.prod.outlook.com (20.178.123.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.9; Mon, 24 Feb 2020 08:48:04 +0000
Received: from VI1PR07MB5040.eurprd07.prod.outlook.com
 ([fe80::f5f9:e89:3fef:2ffd]) by VI1PR07MB5040.eurprd07.prod.outlook.com
 ([fe80::f5f9:e89:3fef:2ffd%7]) with mapi id 15.20.2772.012; Mon, 24 Feb 2020
 08:48:04 +0000
From: Alexander A Sverdlin <alexander.sverdlin@nokia.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v3] mtd: spi-nor: Fixup page size for S25FS-S
Date: Mon, 24 Feb 2020 09:47:41 +0100
Message-Id: <20200224084741.107963-2-alexander.sverdlin@nokia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200224084741.107963-1-alexander.sverdlin@nokia.com>
References: <20200224084741.107963-1-alexander.sverdlin@nokia.com>
X-ClientProxiedBy: HE1PR05CA0275.eurprd05.prod.outlook.com
 (2603:10a6:3:fc::27) To VI1PR07MB5040.eurprd07.prod.outlook.com
 (2603:10a6:803:9c::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ulegcpsvhp1.emea.nsn-net.net (131.228.32.191) by
 HE1PR05CA0275.eurprd05.prod.outlook.com (2603:10a6:3:fc::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.18 via Frontend Transport; Mon, 24 Feb 2020 08:48:02 +0000
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [131.228.32.191]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 258cf6dd-dbe3-4471-7d10-08d7b90642f7
X-MS-TrafficTypeDiagnostic: VI1PR07MB6032:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR07MB6032EA411D89AEA0DE01315E88EC0@VI1PR07MB6032.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 032334F434
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(376002)(39860400002)(396003)(346002)(136003)(199004)(189003)(1076003)(66476007)(66946007)(5660300002)(54906003)(52116002)(66556008)(4326008)(6486002)(6916009)(6666004)(478600001)(956004)(36756003)(6506007)(2906002)(186003)(81156014)(86362001)(26005)(16526019)(81166006)(8676002)(6512007)(316002)(8936002)(2616005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR07MB6032;
 H:VI1PR07MB5040.eurprd07.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: nokia.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bjA/A3wJ3jmSZm8RPUg+CUtdP4AN8zK2r9aOHHhlIW4lnkR8rt4SPToLPfC7LLaq9BY2gtsuzBZpOTNMlvdp7dYAJ77EDZHK5TtqdwWl7/UBY7RjdyXnbtaUC3MlInqNYL6pfOkh4Z52BuJjDj45kwUGN9kRqfmtfzdSOTZN2s2qX89Siv1epB87hbCr3Zr92sHUwppI5KE5HAgyACLO9GlMJKwqsFEBE0GuMWbw7TBKPVLo4VqCvckHRQYkqBODvid15pji/2pBXptZHOFekLrpLD5F1RNU2w+vTZxlvQ+itWor4d5yoJmuYqNMplSyMoLuI+t1rV+Y9D2NjRQk73ETlR4qkOLjhJ7xhsHTOSkF2/zJsSWoy42zZm4Z/1DugB1BUqb/UDYsrE5OgbVZTBkn3Jwesnc3sdetV+JcP6MRXJvkF94QxeEBw6m8c9G3
X-MS-Exchange-AntiSpam-MessageData: LQRtQ6f/xbHH4QT2wb1Y96e/V3X0c67CxoE8DNehZaVZ5q0RhzRzO8JT4xgySAfgoNLBRZRyyxFwZnH533fQoFAOEzbvdP08bo4d5Q3MqURfCtqtlwUgYN6pS3OgD5I1twSysbWLIYrH3ORF4j+eXw==
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 258cf6dd-dbe3-4471-7d10-08d7b90642f7
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2020 08:48:04.2581 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TXhK2TUOUhMF9y9FdqmTEKdLS+iEIOAKiB8As0Wh9db9WRbiDXGw8h3VxBiYoPq2I/hi9O5vhKyaTyxWubw+5S12TACq87C6W9uUII0vOJw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR07MB6032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200224_004806_788119_14B31549 
X-CRM114-Status: GOOD (  15.26  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, John Garry <john.garry@huawei.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Alexander Sverdlin <alexander.sverdlin@nokia.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Alexander Sverdlin <alexander.sverdlin@nokia.com>

Spansion S25FS-S family has an issue in Basic Flash Parameter Table:
DWORD-11 bits 7-4 specify write page size 512 bytes. In reality this
is configurable in the non-volatile CR3NV register and even factory
default configuration is "wrap at 256 bytes". So blind relying on BFPT
breaks write operation on these Flashes.

All this story is vendor-specific, so add the corresponding fixup hook
which first restores the safe page size of 256 bytes from
struct flash_info but checks is more performant 512 bytes configuration
is active and adjusts the page_size accordingly.

Fixes: f384b352c ("mtd: spi-nor: parse Serial Flash Discoverable Parameters (SFDP) tables")
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
Change-Id: I998829dfe43a6778ac439a693f5f41670acd20f1
---
Changelog:
v3: Use spi_nor_read_data()
v2: Thankfully rebased on the hint from John Garry

 drivers/mtd/spi-nor/spi-nor.c | 39 +++++++++++++++++++++++++++++++++++++--
 include/linux/mtd/spi-nor.h   |  5 +++++
 2 files changed, 42 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 1224247..508716a 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -2326,6 +2326,39 @@ static struct spi_nor_fixups gd25q256_fixups = {
 	.default_init = gd25q256_default_init,
 };
 
+/* Spansion S25FS-S SFDP workarounds */
+static int s25fs_s_post_bfpt_fixups(struct spi_nor *nor,
+	const struct sfdp_parameter_header *bfpt_header,
+	const struct sfdp_bfpt *bfpt,
+	struct spi_nor_flash_parameter *params)
+{
+	const struct flash_info *info = nor->info;
+	u8 read_opcode, buf;
+	int ret;
+
+	/* Default is safe */
+	params->page_size = info->page_size;
+
+	/*
+	 * But is the chip configured for more performant 512 bytes write page
+	 * size?
+	 */
+	read_opcode = nor->read_opcode;
+
+	nor->read_opcode = SPINOR_OP_RDAR;
+	ret = spi_nor_read_data(nor, SPINOR_REG_CR3V, 1, &buf);
+	if (!ret && (buf & CR3V_02H_V))
+		params->page_size = 512;
+
+	nor->read_opcode = read_opcode;
+
+	return ret;
+}
+
+static const struct spi_nor_fixups s25fs_s_fixups = {
+	.post_bfpt = s25fs_s_post_bfpt_fixups,
+};
+
 /* NOTE: double check command sets and memory organization when you add
  * more nor chips.  This current list focusses on newer chips, which
  * have been converging on command sets which including JEDEC ID.
@@ -2560,7 +2593,8 @@ static const struct flash_info spi_nor_ids[] = {
 			SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
 	{ "s25fl128s1", INFO6(0x012018, 0x4d0180, 64 * 1024, 256,
 			SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
-	{ "s25fl256s0", INFO(0x010219, 0x4d00, 256 * 1024, 128, USE_CLSR) },
+	{ "s25fl256s0", INFO(0x010219, 0x4d00, 256 * 1024, 128, USE_CLSR)
+			.fixups = &s25fs_s_fixups, },
 	{ "s25fl256s1", INFO(0x010219, 0x4d01,  64 * 1024, 512, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
 	{ "s25fl512s",  INFO6(0x010220, 0x4d0080, 256 * 1024, 256,
 			SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
@@ -2570,7 +2604,8 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "s25sl12800", INFO(0x012018, 0x0300, 256 * 1024,  64, 0) },
 	{ "s25sl12801", INFO(0x012018, 0x0301,  64 * 1024, 256, 0) },
 	{ "s25fl129p0", INFO(0x012018, 0x4d00, 256 * 1024,  64, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
-	{ "s25fl129p1", INFO(0x012018, 0x4d01,  64 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
+	{ "s25fl129p1", INFO(0x012018, 0x4d01,  64 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR)
+			.fixups = &s25fs_s_fixups, },
 	{ "s25sl004a",  INFO(0x010212,      0,  64 * 1024,   8, 0) },
 	{ "s25sl008a",  INFO(0x010213,      0,  64 * 1024,  16, 0) },
 	{ "s25sl016a",  INFO(0x010214,      0,  64 * 1024,  32, 0) },
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index de90724..8533e4f 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -116,6 +116,7 @@
 /* Used for Spansion flashes only. */
 #define SPINOR_OP_BRWR		0x17	/* Bank register write */
 #define SPINOR_OP_CLSR		0x30	/* Clear status register 1 */
+#define SPINOR_OP_RDAR		0x65	/* Read Any Register */
 
 /* Used for Micron flashes only. */
 #define SPINOR_OP_RD_EVCR      0x65    /* Read EVCR register */
@@ -152,6 +153,10 @@
 #define SR2_QUAD_EN_BIT1	BIT(1)
 #define SR2_QUAD_EN_BIT7	BIT(7)
 
+/* Used for Spansion flashes RDAR command only. */
+#define SPINOR_REG_CR3V		0x800004
+#define CR3V_02H_V		BIT(4)	/* Page Buffer Wrap */
+
 /* Supported SPI protocols */
 #define SNOR_PROTO_INST_MASK	GENMASK(23, 16)
 #define SNOR_PROTO_INST_SHIFT	16
-- 
2.4.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
