Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D00CCCA473
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Jun 2022 11:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bBJC459NNH835RFJgisA8vqQUT0LNsazAbZY1+RWlmU=; b=v5nx23xwWPCuxq
	TJRTOqtIjVHAVy6WvmXXSr11yIFpUINHlk5MDWflVSwK0eu946+aXzd0BjjDYnXvVvYJ8flonXWyT
	/dbpGiFCefs46mlPCiusxgNRAicIEx6zeRRr5dARYvxmCf25RjkoF3ukTXxdoYw6CUFn1FbX31fY1
	Ym7zZd6tvCCA7puUIvjCnT4STq69Htdt31QiKr9UVzJMVLtbU8nQN0llWEcDxoVeArF6jn4k7yiAf
	Zi8QqJpOL0v2U48IQNGuNsGIATtlbPsPKbkP4JL/GQRpNbFKjdODo565nu+k94VNBTwA/0D858LLE
	uYYtjKhebOmuN/yxS7Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyAsl-000wuD-B4; Mon, 06 Jun 2022 11:26:51 +0000
Received: from mail-dm6nam12on2061b.outbound.protection.outlook.com ([2a01:111:f400:fe59::61b] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyAsQ-000wo9-K6; Mon, 06 Jun 2022 11:26:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cZGzbhk0O800I1XW6QWjxFsIxA3z1/H1sIrmulrWJninb1HLsTiSXNBI9NsJtJ11JyXHfwaogzu0DSf+4AdHs2j9sCwNFgOvj8TEcbRaj+CuQRT32vylHr6HsBw2HGIA27AXB4xj16iASTZVKhelA0MPvOutULE5n88chJQxwUbyihN8jw8uYlI42tantNVyMf2KunVzJ47iBY6nAROvddOgp6RtfTJ5R07OUXoUCin6fqgM6bEGEWMs+71PSu2nZeT2pKJNg/ss4HVRtnWg7RVHS7Bdz8m+xUdOKhTvbn4XaItxFlwpvH85GM2IOYG2EbYjLyv2uNo6uIBy4IdDWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CgP5OGzBjXrobQssBJhZ1oI5mmdLJW7VqgdZPQxPSxo=;
 b=hZJB6lX1hT8Cha28+jMVaS1qv/dqUnSVAICriQDzCeT0dgPaZ1X/jqrWxxLwbFK8kmt/P9yORmSjvxUeK0k5CnMFEa74c/N+OYXEd3TgcNjE5tOqYvnteEyAtpQpOWx9tVplnXtsyyWfOxyIZc4gFpz5DZvjA5dXg75L7sQEkES8a+FR5+ACyv0IzRlkphhB/JmiBl6ujGs0bi1qDlRXc8eVQaWiC3iZysH3zTvdqHgeKl9a/L/gThjy6qeLaMD0ndL7kusO3A6ic2FAUxIQQkqhCRB9q/VW/THLDhe7pBiHIBk4G3HlpKXdLJa7Fo1e4lqKU68ijtCcb5BNzVsVjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CgP5OGzBjXrobQssBJhZ1oI5mmdLJW7VqgdZPQxPSxo=;
 b=AKxIfinNSeBr8LNraU7Ip4lBqD0zRmAv26KlN1253H02hSOj0NU7tku/kEzEmrCPqFgLCcNzoI0c3UTrzksk2ygvnGJTPp3j6izD1shhtJJR3lPQ8M/Q46JZ1hRoO0uQgqycnRPyv2rklSByJoLyZFg9tHbXmcmXQtW+XzJagdw=
Received: from SN6PR16CA0041.namprd16.prod.outlook.com (2603:10b6:805:ca::18)
 by MW4PR02MB7282.namprd02.prod.outlook.com (2603:10b6:303:72::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Mon, 6 Jun
 2022 11:26:25 +0000
Received: from SN1NAM02FT0021.eop-nam02.prod.protection.outlook.com
 (2603:10b6:805:ca:cafe::2a) by SN6PR16CA0041.outlook.office365.com
 (2603:10b6:805:ca::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.19 via Frontend
 Transport; Mon, 6 Jun 2022 11:26:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0021.mail.protection.outlook.com (10.97.5.32) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5314.12 via Frontend Transport; Mon, 6 Jun 2022 11:26:25 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 6 Jun 2022 04:26:23 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 6 Jun 2022 04:26:23 -0700
Received: from [10.140.6.18] (port=43350 helo=xhdlakshmis40.xilinx.com)
	by smtp.xilinx.com with esmtp (Exim 4.90)
	(envelope-from <amit.kumar-mahapatra@xilinx.com>)
	id 1nyAsI-0000SR-EU; Mon, 06 Jun 2022 04:26:22 -0700
From: Amit Kumar Mahapatra <amit.kumar-mahapatra@xilinx.com>
To: <broonie@kernel.org>, <p.yadav@ti.com>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>
CC: <git@xilinx.com>, <michal.simek@xilinx.com>, <linux-spi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<michael@walle.cc>, <linux-mtd@lists.infradead.org>, Amit Kumar Mahapatra
	<amit.kumar-mahapatra@xilinx.com>
Subject: [RFC PATCH 1/2] spi: Add multiple CS support for a single SPI device
Date: Mon, 6 Jun 2022 16:56:06 +0530
Message-ID: <20220606112607.20800-2-amit.kumar-mahapatra@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220606112607.20800-1-amit.kumar-mahapatra@xilinx.com>
References: <20220606112607.20800-1-amit.kumar-mahapatra@xilinx.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f4e835a-f573-4bad-36d6-08da47af6422
X-MS-TrafficTypeDiagnostic: MW4PR02MB7282:EE_
X-Microsoft-Antispam-PRVS: 	<MW4PR02MB7282F6364B2CB8456E0DFC03BAA29@MW4PR02MB7282.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	6fjH68oqaNPRDV3otN7BXok51WSbzLxtBxpT9YVuNefEvPzl+JOWRqMY0dY0NsR3nCZMyYjwcWmD8t5IRxu8vUc13FWQrnPxy0Y+OUY6oAM4Sf0KKPDe2vzrOEVq219J9qLUqTM4VAyF+LWvwKwgMfADNmAfrR0IiU1i6mb6pOasGxJ101XCO/UHqsHu4GKaJANP67yxiJqXqw5przzZtGV2NvqjCCExuZwPZAAKuxWrR1Bbn7Wj/xaRMjlYcUgLDPA1nclPovNaRzBMsi+Z3zYp1Hh7TMX0V/f1R8DrijAOvW3zOuzgRxKPZIaIW2eYXi9aF3oluhoMRBPkh61w8RHT6+8O2lg8SU2C986xXBOuDAZe8fe9GnWuGMjkp3PcOnaVp2L3hNuEKLGmXcMSlUlqlPK9jLi3nvrIAo75VzK584UmFiwDU1yLFIyqkVs1x4UhLBolZDn/ZgfWgoEcjR9kbIgpDuI8wwfKT5dY2V0EAvJL2NOVc14K+vGVYxIz4v9hCmvcOwncTILY5a7+YNvzKxpIuXGGHbNinaAhsIzSZb2QecQ0PsniHN1JJmiRVn8dPME9w3JpopPRK+wrlZSJrQTBkINKf8qBEsB178UtiQXuigjjLCOCeRfWmHCgcQ14S6jruDTPLhJd6cl0/n5K+GgvLwuEsT/wMNqk2c+JlqOcFk3CW/aeh4LATaMEyd+8w1KtaQGGed+pqvkxXQ==
X-Forefront-Antispam-Report: 	CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(82310400005)(7696005)(9786002)(110136005)(186003)(47076005)(426003)(8936002)(107886003)(40460700003)(26005)(36860700001)(1076003)(54906003)(316002)(36756003)(2616005)(7636003)(356005)(336012)(7416002)(508600001)(83380400001)(5660300002)(70206006)(70586007)(8676002)(2906002)(4326008)(6666004)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2022 11:26:25.0378
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f4e835a-f573-4bad-36d6-08da47af6422
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: 	SN1NAM02FT0021.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR02MB7282
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_042630_717686_1DAA2C2F 
X-CRM114-Status: GOOD (  20.74  )
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

For supporting multiple CS the SPI device need to be aware of all the CS
values. So the "chip_select" member in the spi_device structure is now an
array that holds all the CS values.

spi_device structure now has a "cs_index_mask" member. This acts as an
index to the chip_select array. If nth bit of spi->cs_index_mask is set then
the driver would assert spi->chip_slect[n].

When flashes are connected in stacked mode SPI-NOR will enable the required
chip select by setting the appropriate bit in spi->cs_index_mask.

In parallel connection both the flashes need to be asserted simultaneously,
this can be achieved by enabling 0th(CS0) & 1st(CS1) bit in spi->cs_index_mask.

Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@xilinx.com>
---
 drivers/spi/spi-zynqmp-gqspi.c | 30 ++++++++++++++++++++++++++----
 drivers/spi/spi.c              | 10 +++++++---
 include/linux/spi/spi.h        | 10 +++++++++-
 3 files changed, 42 insertions(+), 8 deletions(-)

diff --git a/drivers/spi/spi-zynqmp-gqspi.c b/drivers/spi/spi-zynqmp-gqspi.c
index c760aac070e5..2535a8bca4da 100644
--- a/drivers/spi/spi-zynqmp-gqspi.c
+++ b/drivers/spi/spi-zynqmp-gqspi.c
@@ -136,6 +136,11 @@
 
 #define GQSPI_MAX_NUM_CS	2	/* Maximum number of chip selects */
 
+#define GQSPI_SELECT_LOWER_CS	BIT(0)
+#define GQSPI_SELECT_UPPER_CS	BIT(1)
+#define GQSPI_SELECT_BOTH_CS	(GQSPI_SELECT_LOWER_CS | \
+				 GQSPI_SELECT_UPPER_CS)
+				 
 #define SPI_AUTOSUSPEND_TIMEOUT		3000
 enum mode_type {GQSPI_MODE_IO, GQSPI_MODE_DMA};
 
@@ -361,16 +366,33 @@ static void zynqmp_qspi_chipselect(struct spi_device *qspi, bool is_high)
 	struct zynqmp_qspi *xqspi = spi_master_get_devdata(qspi->master);
 	ulong timeout;
 	u32 genfifoentry = 0, statusreg;
+	u8 cs_index_mask = qspi->cs_index_mask;
 
 	genfifoentry |= GQSPI_GENFIFO_MODE_SPI;
 
 	if (!is_high) {
-		if (!qspi->chip_select) {
-			xqspi->genfifobus = GQSPI_GENFIFO_BUS_LOWER;
-			xqspi->genfifocs = GQSPI_GENFIFO_CS_LOWER;
-		} else {
+		/*
+		 * GQSPI controller only supports two chip selects,
+		 * CS0 and CS1
+		 */
+		if (cs_index_mask & GQSPI_SELECT_BOTH_CS) {
+
+			xqspi->genfifobus = GQSPI_GENFIFO_BUS_LOWER |
+				GQSPI_GENFIFO_BUS_UPPER;
+			xqspi->genfifocs = GQSPI_GENFIFO_CS_LOWER |
+				GQSPI_GENFIFO_CS_UPPER;
+
+		} else if ((cs_index_mask & GQSPI_SELECT_UPPER_CS) &&
+			   (qspi->chip_select[GQSPI_SELECT_UPPER_CS - 1])) {
+
 			xqspi->genfifobus = GQSPI_GENFIFO_BUS_UPPER;
 			xqspi->genfifocs = GQSPI_GENFIFO_CS_UPPER;
+
+		} else if ((cs_index_mask & GQSPI_SELECT_LOWER_CS) &&
+			   (!qspi->chip_select[GQSPI_SELECT_LOWER_CS - 1])) {
+
+			xqspi->genfifobus = GQSPI_GENFIFO_BUS_LOWER;
+			xqspi->genfifocs = GQSPI_GENFIFO_CS_LOWER;
 		}
 		genfifoentry |= xqspi->genfifobus;
 		genfifoentry |= xqspi->genfifocs;
diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 2e6d6bbeb784..d3077874e6e8 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -2082,6 +2082,8 @@ static int of_spi_parse_dt(struct spi_controller *ctlr, struct spi_device *spi,
 {
 	u32 value;
 	int rc;
+	u32 cs[SPI_CS_CNT_MAX];
+	u8 idx;
 
 	/* Mode (clock phase/polarity/etc.) */
 	if (of_property_read_bool(nc, "spi-cpha"))
@@ -2154,13 +2156,15 @@ static int of_spi_parse_dt(struct spi_controller *ctlr, struct spi_device *spi,
 	}
 
 	/* Device address */
-	rc = of_property_read_u32(nc, "reg", &value);
-	if (rc) {
+	rc = of_property_read_variable_u32_array(nc, "reg", &cs[0],
+						 1, SPI_CS_CNT_MAX);
+	if (rc < 0) {
 		dev_err(&ctlr->dev, "%pOF has no valid 'reg' property (%d)\n",
 			nc, rc);
 		return rc;
 	}
-	spi->chip_select = value;
+	for(idx = 0; idx < rc; idx++)
+		spi->chip_select[idx] = cs[idx];
 
 	/* Device speed */
 	if (!of_property_read_u32(nc, "spi-max-frequency", &value))
diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
index 5f8c063ddff4..e930d987f3c2 100644
--- a/include/linux/spi/spi.h
+++ b/include/linux/spi/spi.h
@@ -18,6 +18,9 @@
 #include <uapi/linux/spi/spi.h>
 #include <linux/acpi.h>
 
+/* Max no. of CS supported per spi device */
+#define SPI_CS_CNT_MAX	2
+
 struct dma_chan;
 struct software_node;
 struct ptp_system_timestamp;
@@ -148,6 +151,7 @@ extern int spi_delay_exec(struct spi_delay *_delay, struct spi_transfer *xfer);
  *	deasserted. If @cs_change_delay is used from @spi_transfer, then the
  *	two delays will be added up.
  * @statistics: statistics for the spi_device
+ * @cs_index_mask: Bit mask of the active chipselect(s) in the chipselect array
  *
  * A @spi_device is used to interchange data between an SPI slave
  * (usually a discrete chip) and CPU memory.
@@ -163,7 +167,7 @@ struct spi_device {
 	struct spi_controller	*controller;
 	struct spi_controller	*master;	/* compatibility layer */
 	u32			max_speed_hz;
-	u8			chip_select;
+	u8			chip_select[SPI_CS_CNT_MAX];
 	u8			bits_per_word;
 	bool			rt;
 #define SPI_NO_TX	BIT(31)		/* no transmit wire */
@@ -194,6 +198,10 @@ struct spi_device {
 	/* the statistics */
 	struct spi_statistics	statistics;
 
+	/* Bit mask of the chipselect(s) that the driver
+	 * need to use form the chipselect array.
+	 */
+	u8			cs_index_mask : 2;
 	/*
 	 * likely need more hooks for more protocol options affecting how
 	 * the controller talks to each chip, like:
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
