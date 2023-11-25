Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64386C636BD
	for <linux-mtd@archiver.kernel.org>; Sat, 25 Nov 2023 09:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b3Gbtowzx5j7VxbDTkecyQT34ciYlO3vQIacmCb8mZc=; b=DYHrLACmwrWy1G
	niKkv6WOMlBQOMRDjK2CBLcberMddIeSRimIiriTpTrVBEs01xHitLecKMvDNUfwzUDkayGbRcTdy
	6iflVt/BBiHjSIPfsnc5j+TXKqDmF+NvEIzyA/KVvPdpL5yUzOcwOcKffdNTKfZgH/7dfrglb7kt5
	wuHJs1ROGWslaEJ4dXKiu2YTZIB4mqu5kv8So4SFjnnbaUBT8Ak+T/g4+mHmXoxXNTXamA+PC+MCY
	abzT9cHovyPsaZB8sjUbs3TCCQ1UmICAV+Ur599z+U4BmFc/EfH1uvt/PCnXcgcuAXfP3QlrxOPX9
	7nE3ERj4247PCN2hwvog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6osj-008uxu-2S;
	Sat, 25 Nov 2023 09:23:21 +0000
Received: from mail-dm6nam12on20600.outbound.protection.outlook.com ([2a01:111:f400:fe59::600] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6osU-008um0-20;
	Sat, 25 Nov 2023 09:23:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KBtEJ5K/mTzjZ86/+N3Jac05YFYtqONn+bZood2So9wyE3uwIiQnn5v59Q51hjh6zhbYGM38SZM+oNJ8H3z1ik7AU3hG73mJ91WXI3At6zaxMG7iGg3VhTd7B0EWkvfOXQWGB0C/ECFi9XnzF+CrMTmXqh9Z4580RHP1W+UbhkOrQLGrLIM+1ZnL+zx+BpprHQST6QksHPpznkDrrs7XGAWBlQ2WbBhmAbgjPLF5uy8c6lGUsyAzwc2cykhRsyjRdMLyV+0UZxf/BwEV+PmNUO01412dp0IanjpIAzueKkjW4fAWGjgLdV22UMGZZxf+d7aZWDkYUL9Mkg4EsYj/vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uctAgBsWbg4zjYa/iQFFs5zeaRx7Y3UIWC12hEqotVg=;
 b=dqrWEgCWoCWfAaWTLtIiWePuDtZc47j1zmNszRh3tVtQRxWS07IqApcKgNVRzpHgRc3g6oM/2MhEha3/3l2SwHjQs6jiVWiiXLH0LUHTvkWNFgJEPZSOpWmGnUJlulDpzJUtq559k67vL4y896kqJcunU56PxJgdZcwqVp4dnsVEHEqSirNwOuC2dImmdh3FjzhqT62Wv+h3QbQ+jl/brgy/ZpGfISwxgar/O+xbdut5UXdP7Ur+6qJZaHoy7m0/2Iy0wUOgxCw6QGXCSDFmQdxbJ44P53g7+NJtr9XSeVPF69illN8LYVect+HpEFYQmV5rlxio3peb4aIlCMqJtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uctAgBsWbg4zjYa/iQFFs5zeaRx7Y3UIWC12hEqotVg=;
 b=G6tXW1rM0BduUgPpzWata/93Jx0VXfu8EzZza39rVxbPWt7c6KN6mOJyH6jtf36TxfVWZrk8KeQ732XiG0tszQWFfX/Ug2tcAvVOPivNzNwJNoLivbizSGGX9F6Xig+R1TYmfVSWfzMDWZU42KXRbpEjm8fGP47A31Ds1UvkpRI=
Received: from CY5PR13CA0004.namprd13.prod.outlook.com (2603:10b6:930::27) by
 SA1PR12MB5670.namprd12.prod.outlook.com (2603:10b6:806:239::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.25; Sat, 25 Nov 2023 09:22:58 +0000
Received: from CY4PEPF0000E9D8.namprd05.prod.outlook.com
 (2603:10b6:930:0:cafe::9) by CY5PR13CA0004.outlook.office365.com
 (2603:10b6:930::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.19 via Frontend
 Transport; Sat, 25 Nov 2023 09:22:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000E9D8.mail.protection.outlook.com (10.167.241.83) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7046.17 via Frontend Transport; Sat, 25 Nov 2023 09:22:58 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Sat, 25 Nov
 2023 03:22:57 -0600
Received: from xhdakumarma40u.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34
 via Frontend Transport; Sat, 25 Nov 2023 03:22:51 -0600
From: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
To: <broonie@kernel.org>, <tudor.ambarus@linaro.org>, <pratyush@kernel.org>,
	<miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<sbinding@opensource.cirrus.com>, <lee@kernel.org>,
	<james.schulman@cirrus.com>, <david.rhodes@cirrus.com>,
	<rf@opensource.cirrus.com>, <perex@perex.cz>, <tiwai@suse.com>
CC: <linux-spi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<michael@walle.cc>, <linux-mtd@lists.infradead.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <michal.simek@amd.com>,
	<linux-arm-kernel@lists.infradead.org>, <alsa-devel@alsa-project.org>,
	<patches@opensource.cirrus.com>, <linux-sound@vger.kernel.org>,
	<git@amd.com>, <amitrkcian2002@gmail.com>, Amit Kumar Mahapatra
	<amit.kumar-mahapatra@amd.com>
Subject: [PATCH v11 10/10] spi: spi-zynqmp-gqspi: Add parallel memories support in GQSPI driver
Date: Sat, 25 Nov 2023 14:51:37 +0530
Message-ID: <20231125092137.2948-11-amit.kumar-mahapatra@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231125092137.2948-1-amit.kumar-mahapatra@amd.com>
References: <20231125092137.2948-1-amit.kumar-mahapatra@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D8:EE_|SA1PR12MB5670:EE_
X-MS-Office365-Filtering-Correlation-Id: 4dce4a65-03f5-45f9-4633-08dbed981d3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9e8KTXIRFeKWvAxAwZp0A5Jhwpaq3ekmlMDjtBJotG4m7ukT6l2sqKx7aYnwLzhpSaXWEcnLNkyEcWPQdNu5v/kYxOTH8+mRN+K1NGSh4RzpcML8qY+wwKatYgbek/cE6P5/O+68OwlQBTVAgIQflof1ctsCFRgJZBE4WHZL8MJ3w9yRi/BXIPvVNLtwqz8vzidq8up+G7Fdbv9zYG6avKv9oh3Co1MWtTeTnAZLjeaMP/mLy9ijF2Jj8LHj8dNfCarcSEy4APpOyjUh5KXcME5uh6xQ4WfO1Ej885LrSoJFa6tIFyUsO9rNFYdWC7cqzU5plWgCbbHwuFCPp3cMIA/e9HgyRmoxXjSoVUwV/8DuSEicPbz0bcVms+3sWV/meGfeokVLnr4ACYfJqjaORHq2yuK+KkRRKUNYnz54a42cjdFIA9AMo+V1ltCHfAZEhnh5HMVGVudOw7mlQXsSkmZsuS6txdO+NVOQi5j8Om8ZY+mj6v5x+o6ZLGqZNQrEG8jn/YX0MNVXgxIs9F5SzyysKjg5ug+ESXwoHxQMlipVpg0SWj5l4dFExkBACyZ2/OcIYVuyANZQO1WFvMt3MIt+KLrJ8swqGbr8tArNotHfjMsljicDxCVdPw0CvhkA/odXJcQFlFYPDJPxmhuRWYLO5o0wRNByVfGx+3aJ5Y8uhuBfuFVAYPnQOQ4Pz7e/lGgGa9CFdKa1FnNUwOtfuiluZ+ELgs2oeNxs6yI6Ori4I5Paw0rHPZZwKgvYTO22fE0GgaZuXYf/iUTOjp+Zmd8hWSFezWuqcw5SlxPxw+c=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(396003)(346002)(39860400002)(136003)(230922051799003)(186009)(82310400011)(64100799003)(451199024)(1800799012)(46966006)(40470700004)(36840700001)(6666004)(54906003)(316002)(70586007)(70206006)(110136005)(478600001)(40460700003)(7416002)(5660300002)(921008)(41300700001)(36756003)(2906002)(4326008)(8676002)(8936002)(86362001)(82740400003)(81166007)(83380400001)(2616005)(26005)(336012)(426003)(1076003)(356005)(47076005)(36860700001)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2023 09:22:58.3264
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dce4a65-03f5-45f9-4633-08dbed981d3c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5670
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231125_012306_664857_2380FD32 
X-CRM114-Status: GOOD (  19.57  )
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
index c5d12ddd4ab3..61e91d59014b 100644
--- a/drivers/spi/spi-zynqmp-gqspi.c
+++ b/drivers/spi/spi-zynqmp-gqspi.c
@@ -21,6 +21,7 @@
 #include <linux/spinlock.h>
 #include <linux/workqueue.h>
 #include <linux/spi/spi-mem.h>
+#include <linux/mtd/spi-nor.h>
 
 /* Generic QSPI register offsets */
 #define GQSPI_CONFIG_OFST		0x00000100
@@ -190,6 +191,7 @@ struct qspi_platform_data {
  * @op_lock:		Operational lock
  * @speed_hz:          Current SPI bus clock speed in hz
  * @has_tapdelay:	Used for tapdelay register available in qspi
+ * @is_parallel:		Used for multi CS support
  */
 struct zynqmp_qspi {
 	struct spi_controller *ctlr;
@@ -212,8 +214,33 @@ struct zynqmp_qspi {
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
@@ -468,7 +495,14 @@ static void zynqmp_qspi_chipselect(struct spi_device *qspi, bool is_high)
 
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
@@ -1137,6 +1171,8 @@ static int zynqmp_qspi_exec_op(struct spi_mem *mem,
 	}
 
 	if (op->data.nbytes) {
+		if (xqspi->is_parallel && zynqmp_gqspi_update_stripe(op))
+			genfifoentry |= GQSPI_GENFIFO_STRIPE;
 		reinit_completion(&xqspi->data_completion);
 		if (op->data.dir == SPI_MEM_DATA_OUT) {
 			xqspi->txbuf = (u8 *)op->data.buf.out;
@@ -1332,6 +1368,7 @@ static int zynqmp_qspi_probe(struct platform_device *pdev)
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
