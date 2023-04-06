Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D335EC7618D
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Apr 2023 06:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IN2Clte5/J77jnIBT5KrTaCx48PRU1Ys2xJ9Bb/qwHQ=; b=41g9Y5TqRXCl0X
	bB2gkQ1KBiravu/atjdMcc96e9XEI2d/Qhw665sZe6Bb7+iE/kOUl7DvW9wCCdKLm+2GOei8nkviq
	MsL7squHd8zBMojl9xjncuj6uqvkjXfqOCZY45M+cduI1O3M9VH/QNfRjRqz/sjW1RpPHVO2z5wvV
	UEdY2h6E4odAnsucv5D3TAab9j3a2RsOZd7RdxiENv+x0j4dukUH90Kxu6POQmDxYSrF4Lem78JpS
	kGqozBnYFxtONZpLXaCHFhRqXBieOjZwCe3hukYB1WtVrBrZKs6eXq443mQCbnTqFVXfINc0l4pjT
	eFdMTraKzKJM76qWyUmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkJVz-006XSa-2S;
	Thu, 06 Apr 2023 06:54:35 +0000
Received: from mail-bn8nam11on20601.outbound.protection.outlook.com ([2a01:111:f400:7eae::601] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkJVn-006XIj-2g;
	Thu, 06 Apr 2023 06:54:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Au3Lcrs8kS+KRfbkn5wUK8DDRlpiT736znwXh/XFN1Ec2fws2KbQUrduHun3JS7GigZMQYFrFD41A+Z5/cEf/7R7STZbhb9DfswhP5Nq5EuyWpG9UjWcPxM5Y7yKLWUBHLQysSxA4T7au4tQYBJ2L3ABks+VgE4gQDkbrSvWu1MXVp9ttWSBeyhCR1Ev2pBC6kYaV8kwBxhcC6TcLr7Sgh199tnLZp2soI1cbQ3ak+saktkLim4yw/S0gWIbSlHOhP8iVTQl00vG61NT7ITMPnXp9JfxHjy8i+NqfgXHMtzwj+jNWNR9O/teXBABz8/ErJ1HcObRs3UrY5P8bWfu6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=he65cIQQwqLcPUh0K7+4CXQr0jLidhcBa3blMtvOwsw=;
 b=dWpmjhFnDb0rPZvgTWpcKpsTJxvrC46CB3Y+IzmFRDRjRdP6HFABU6p0o38Z62ZMh2SI/rByGLFt6o66SHNeWG0JgnVralPlMQzVJ8laNcIowTzm3hLMThvJOL2G7KaroWlUAhXz2ERADStBtQz0DPIXQXWyWJHAvw48wUoAK8jHlbHxphViNTlphhFsCmtMe8QhmHL1oqdXyWL47uzpenv7IR4ATcvViMbdQruQCAMlaG0wSXKb9lnmDi0reAoIjR/44PweoBrPR36/JQ/SkYkGczeMLQUH6P/uPfvzK1YPNKrU0b9CwH3o/549lUP9KzuVJ7lXrZqDMgZ+fRlVjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=he65cIQQwqLcPUh0K7+4CXQr0jLidhcBa3blMtvOwsw=;
 b=I/02DhrLSPcvhjSP2fNC8o+dSkHM2u7QxC9GiCEumLSQtvvdlLulFTvudngeD/rCOcnne/CQ4oU88ObcJAr70UlyJ1oovJVIRScxDsuf55Jh8LQGBUonc45h5rqZcjGUyEtZVFS0qz/As/nTbyL8W/kD8VDV2/gxVi6GOXrqe9A=
Received: from DM6PR10CA0006.namprd10.prod.outlook.com (2603:10b6:5:60::19) by
 CH0PR12MB5187.namprd12.prod.outlook.com (2603:10b6:610:ba::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6277.31; Thu, 6 Apr 2023 06:54:20 +0000
Received: from DM6NAM11FT104.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:60:cafe::39) by DM6PR10CA0006.outlook.office365.com
 (2603:10b6:5:60::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.38 via Frontend
 Transport; Thu, 6 Apr 2023 06:54:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT104.mail.protection.outlook.com (10.13.173.232) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6277.31 via Frontend Transport; Thu, 6 Apr 2023 06:54:20 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 6 Apr
 2023 01:54:20 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 5 Apr
 2023 23:54:19 -0700
Received: from xhdakumarma40u.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Thu, 6 Apr 2023 01:54:14 -0500
From: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
To: <broonie@kernel.org>, <tudor.ambarus@linaro.org>, <pratyush@kernel.org>,
	<michael@walle.cc>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
	<vigneshr@ti.com>
CC: <git@amd.com>, <sbinding@opensource.cirrus.com>,
	<linux-spi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-mtd@lists.infradead.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@microchip.com>,
	<michal.simek@amd.com>, <linux-arm-kernel@lists.infradead.org>,
	<amitrkcian2002@gmail.com>, Amit Kumar Mahapatra
	<amit.kumar-mahapatra@amd.com>
Subject: [PATCH V7 7/7] spi: spi-zynqmp-gqspi: Add parallel memories support in GQSPI driver
Date: Thu, 6 Apr 2023 12:23:36 +0530
Message-ID: <20230406065336.10980-8-amit.kumar-mahapatra@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230406065336.10980-1-amit.kumar-mahapatra@amd.com>
References: <20230406065336.10980-1-amit.kumar-mahapatra@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT104:EE_|CH0PR12MB5187:EE_
X-MS-Office365-Filtering-Correlation-Id: 494d67d8-e623-4094-3e07-08db366bbf71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	SpmIKOT9Dohs1NGteojJfhwsZ7ZRG/z9qJJeHytzG6BOOZ6PHYwrD2X8zToWrKs3oyWJNqWCV9xAgVry7V5IFHQP846vwJmoifbYo1TbtiEL1uNiBLyde//dMymOXlx0NpmvPUw2Lnu6NWJREGMSRXzZp8EK01CN7ztwG3a1YY1qNdEkDPug2ZfcI1rucYfuYn7rkjogaqo8Vc87WfFigKbM85u9OV8k2TfIgnHCs9xwTFmihq50brOEzaAux2Os7BbR0fcMLNDx93VkaSvENN9e6OkNah7XWRQgUSvOlb1uAdqAP4x47TakjLj1ObwQ3RDID499Bn8JKAVNZvf6bJCybDbnmlt5F/K4RWkPqcyFcGERpuBUGI/FfppOHOflmzXuWHkPsRpGNV9FNIiAwIaYnZuQlzFxp8y9Ydd268n1z6gAgvEWTlKT9AlUqjDdXwexLoGammNr7Rwf4Ullsk4BARyiRt0HgFcsRJErKv4xJ+oEekD30FWj0RDIJIAFIXHUErMAMguD7kcIsQbsWy7dZMAVAJW7shiKwgmo2a7pK0SIa4J1TdjIIKO1rdyAZiPtYjzzkqDqnQUC/cLGzXjUU7ywiUg7qS+7P60Of5W0twcbgycxYrfjE604pCPF7mDL/ehpOJ6zT4XDb0DKLCZYZ1tWcmuG25SRyvuvrJqCK15vr7h44QujmqFR1BrmkWd5AqEApImcuBAJP/WWe0Rm9K+bS7F5VzmyuLo8qu8eXQIQN5Bz6pMik9xLh213
X-Forefront-Antispam-Report: 	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(396003)(376002)(39860400002)(451199021)(40470700004)(36840700001)(46966006)(426003)(336012)(47076005)(2616005)(83380400001)(36860700001)(316002)(478600001)(6666004)(110136005)(1076003)(54906003)(26005)(186003)(5660300002)(7416002)(2906002)(40460700003)(36756003)(4326008)(81166007)(70206006)(70586007)(8676002)(356005)(82740400003)(41300700001)(86362001)(82310400005)(40480700001)(8936002)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2023 06:54:20.3546
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 494d67d8-e623-4094-3e07-08db366bbf71
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 	DM6NAM11FT104.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5187
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_235423_938497_44EA78F2 
X-CRM114-Status: GOOD (  18.75  )
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

During probe GQSPI driver sets SPI_CONTROLLER_MULTI_CS bit in ctlr->flags
for notifying SPI core about multi CS capability of the controller.
In parallel mode the controller can either split the data between both the
flash or can send the same data to both the flashes, this is determined by
the STRIPE bit. While sending commands to the flashes the GQSPI driver
send the same command to both the flashes by resetting the STRIPE bit, but
while writing/reading data to & from the flash the GQSPI driver splits the
data evenly between both the flashes by setting the STRIPE bit.

Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
---
 drivers/spi/spi-zynqmp-gqspi.c | 39 +++++++++++++++++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-zynqmp-gqspi.c b/drivers/spi/spi-zynqmp-gqspi.c
index 3d2b92a88e8a..2b2b5c0385fc 100644
--- a/drivers/spi/spi-zynqmp-gqspi.c
+++ b/drivers/spi/spi-zynqmp-gqspi.c
@@ -23,6 +23,7 @@
 #include <linux/spinlock.h>
 #include <linux/workqueue.h>
 #include <linux/spi/spi-mem.h>
+#include <linux/mtd/spi-nor.h>
 
 /* Generic QSPI register offsets */
 #define GQSPI_CONFIG_OFST		0x00000100
@@ -192,6 +193,7 @@ struct qspi_platform_data {
  * @op_lock:		Operational lock
  * @speed_hz:          Current SPI bus clock speed in hz
  * @has_tapdelay:	Used for tapdelay register available in qspi
+ * @is_parallel:		Used for multi CS support
  */
 struct zynqmp_qspi {
 	struct spi_controller *ctlr;
@@ -214,8 +216,33 @@ struct zynqmp_qspi {
 	struct mutex op_lock;
 	u32 speed_hz;
 	bool has_tapdelay;
+	bool is_parallel;
 };
 
+/**
+ * zynqmp_gqspi_update_stripe - For GQSPI controller data stripe capabilities
+ * @op:	Pointer to mem ops
+ * Return:      Status of the data stripe
+ *
+ * Returns true if data stripe need to be enabled, else returns false
+ */
+bool zynqmp_gqspi_update_stripe(const struct spi_mem_op *op)
+{
+	if (op->cmd.opcode ==  SPINOR_OP_BE_4K ||
+	    op->cmd.opcode ==  SPINOR_OP_BE_32K ||
+	    op->cmd.opcode ==  SPINOR_OP_CHIP_ERASE ||
+	    op->cmd.opcode ==  SPINOR_OP_SE ||
+	    op->cmd.opcode ==  SPINOR_OP_BE_32K_4B ||
+	    op->cmd.opcode ==  SPINOR_OP_SE_4B ||
+	    op->cmd.opcode == SPINOR_OP_BE_4K_4B ||
+	    op->cmd.opcode ==  SPINOR_OP_WRSR ||
+	    op->cmd.opcode ==  SPINOR_OP_BRWR ||
+	    (op->cmd.opcode ==  SPINOR_OP_WRSR2 && !op->addr.nbytes))
+		return false;
+
+	return true;
+}
+
 /**
  * zynqmp_gqspi_read - For GQSPI controller read operation
  * @xqspi:	Pointer to the zynqmp_qspi structure
@@ -470,7 +497,14 @@ static void zynqmp_qspi_chipselect(struct spi_device *qspi, bool is_high)
 
 	genfifoentry |= GQSPI_GENFIFO_MODE_SPI;
 
-	if (qspi->cs_index_mask & GQSPI_SELECT_UPPER_CS) {
+	if ((qspi->cs_index_mask & GQSPI_SELECT_LOWER_CS) &&
+	    (qspi->cs_index_mask & GQSPI_SELECT_UPPER_CS)) {
+		zynqmp_gqspi_selectslave(xqspi,
+					 GQSPI_SELECT_FLASH_CS_BOTH,
+					 GQSPI_SELECT_FLASH_BUS_BOTH);
+		if (!xqspi->is_parallel)
+			xqspi->is_parallel = true;
+	} else if (qspi->cs_index_mask & GQSPI_SELECT_UPPER_CS) {
 		zynqmp_gqspi_selectslave(xqspi,
 					 GQSPI_SELECT_FLASH_CS_UPPER,
 					 GQSPI_SELECT_FLASH_BUS_LOWER);
@@ -1139,6 +1173,8 @@ static int zynqmp_qspi_exec_op(struct spi_mem *mem,
 	}
 
 	if (op->data.nbytes) {
+		if (xqspi->is_parallel && zynqmp_gqspi_update_stripe(op))
+			genfifoentry |= GQSPI_GENFIFO_STRIPE;
 		reinit_completion(&xqspi->data_completion);
 		if (op->data.dir == SPI_MEM_DATA_OUT) {
 			xqspi->txbuf = (u8 *)op->data.buf.out;
@@ -1334,6 +1370,7 @@ static int zynqmp_qspi_probe(struct platform_device *pdev)
 	ctlr->bits_per_word_mask = SPI_BPW_MASK(8);
 	ctlr->dev.of_node = np;
 	ctlr->auto_runtime_pm = true;
+	ctlr->flags |= SPI_CONTROLLER_MULTI_CS;
 
 	ret = devm_spi_register_controller(&pdev->dev, ctlr);
 	if (ret) {
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
