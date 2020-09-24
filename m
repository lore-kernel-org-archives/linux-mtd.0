Return-Path: <SRS0=HQC9=DB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22B9AC4363D
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Sep 2020 12:27:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A82CA206A5
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Sep 2020 12:27:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vmR8hL/Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A82CA206A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=hisilicon.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jy/Xd0omeuvcaspikDrwqvAcRoy5WG9IQSR0A7BVVNQ=; b=vmR8hL/YN8yLJIROFpfcwXt28
	URO/q8rfkw6stZyxkjuH+0dQ0jC4+iKjAgkjsREdbbx4NJ8itNM1e+s2UUrfhvJzd8Ksuf3i1Rcn4
	/SvuE/h9Di5lATQElCAISX7rCBCE5BFcl1PB1QVl44Gr/k7ap/imxwE5TUxbYc6MLECz61MF8zweR
	UDhbg7vIK7cppHy/b2Ih2X/1IJj5kLD5SyiahvTbO54S3BXXWj0Ye3aVteTuNrMMGHR4gIXKR/V6v
	WtbyVOn21E+LnPXDIK15FyrP30F1GKK6zFgLyweUPPK1ZX5/LSnBU92yq5+4WQzSIgNQBi8dpZP2c
	PsvK+vplg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLQKF-0007TH-BJ; Thu, 24 Sep 2020 12:26:15 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLQK5-0007Oc-Ce
 for linux-mtd@lists.infradead.org; Thu, 24 Sep 2020 12:26:07 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 71BA3946B41F1798A923;
 Thu, 24 Sep 2020 20:25:53 +0800 (CST)
Received: from localhost.localdomain (10.67.165.24) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.487.0; Thu, 24 Sep 2020 20:25:45 +0800
From: Yicong Yang <yangyicong@hisilicon.com>
To: <john.garry@huawei.com>, <broonie@kernel.org>
Subject: [PATCH 1/4] spi: hisi-sfc-v3xx: factor out IO modes configuration
Date: Thu, 24 Sep 2020 20:24:27 +0800
Message-ID: <1600950270-52536-2-git-send-email-yangyicong@hisilicon.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1600950270-52536-1-git-send-email-yangyicong@hisilicon.com>
References: <1600950270-52536-1-git-send-email-yangyicong@hisilicon.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.165.24]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200924_082606_726122_7011965E 
X-CRM114-Status: GOOD (  16.49  )
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
Cc: linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
 yangyicong@hisilicon.com, tudor.ambarus@microchip.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Factor IO modes configuration out of hisi_sfc_v3xx_generic_exec_op()
using an IO modes lookup table. This will make the process a bit clearer
and reduce the cyclomatic complexity. Simplify the IO mode definition
macros a little bit as well.

Also add the .supports_op() method for the controller mem ops, in order
to avoid OOB access.

Acked-by: John Garry <john.garry@huawei.com>
Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 drivers/spi/spi-hisi-sfc-v3xx.c | 97 +++++++++++++++++++++++------------------
 1 file changed, 55 insertions(+), 42 deletions(-)

diff --git a/drivers/spi/spi-hisi-sfc-v3xx.c b/drivers/spi/spi-hisi-sfc-v3xx.c
index 64a18d0..69f5a7b 100644
--- a/drivers/spi/spi-hisi-sfc-v3xx.c
+++ b/drivers/spi/spi-hisi-sfc-v3xx.c
@@ -23,12 +23,6 @@
 #define HISI_SFC_V3XX_INT_CLR (0x12c)
 #define HISI_SFC_V3XX_INT_CLR_CLEAR (0xff)
 #define HISI_SFC_V3XX_CMD_CFG (0x300)
-#define HISI_SFC_V3XX_CMD_CFG_DUAL_IN_DUAL_OUT (1 << 17)
-#define HISI_SFC_V3XX_CMD_CFG_DUAL_IO (2 << 17)
-#define HISI_SFC_V3XX_CMD_CFG_FULL_DIO (3 << 17)
-#define HISI_SFC_V3XX_CMD_CFG_QUAD_IN_QUAD_OUT (5 << 17)
-#define HISI_SFC_V3XX_CMD_CFG_QUAD_IO (6 << 17)
-#define HISI_SFC_V3XX_CMD_CFG_FULL_QIO (7 << 17)
 #define HISI_SFC_V3XX_CMD_CFG_DATA_CNT_OFF 9
 #define HISI_SFC_V3XX_CMD_CFG_RW_MSK BIT(8)
 #define HISI_SFC_V3XX_CMD_CFG_DATA_EN_MSK BIT(7)
@@ -40,6 +34,33 @@
 #define HISI_SFC_V3XX_CMD_ADDR (0x30c)
 #define HISI_SFC_V3XX_CMD_DATABUF0 (0x400)
 
+/* IO Mode definition in HISI_SFC_V3XX_CMD_CFG */
+#define HISI_SFC_V3XX_STD (0 << 17)
+#define HISI_SFC_V3XX_DIDO (1 << 17)
+#define HISI_SFC_V3XX_DIO (2 << 17)
+#define HISI_SFC_V3XX_FULL_DIO (3 << 17)
+#define HISI_SFC_V3XX_QIQO (5 << 17)
+#define HISI_SFC_V3XX_QIO (6 << 17)
+#define HISI_SFC_V3XX_FULL_QIO (7 << 17)
+
+/*
+ * The IO modes lookup table. hisi_sfc_v3xx_io_modes[(z - 1) / 2][y / 2][x / 2]
+ * stands for x-y-z mode, as described in SFDP terminology. -EIO indicates
+ * an invalid mode.
+ */
+static const int hisi_sfc_v3xx_io_modes[2][3][3] = {
+	{
+		{ HISI_SFC_V3XX_DIDO, HISI_SFC_V3XX_DIDO, HISI_SFC_V3XX_DIDO },
+		{ HISI_SFC_V3XX_DIO, HISI_SFC_V3XX_FULL_DIO, -EIO },
+		{ -EIO, -EIO, -EIO },
+	},
+	{
+		{ HISI_SFC_V3XX_QIQO, HISI_SFC_V3XX_QIQO, HISI_SFC_V3XX_QIQO },
+		{ -EIO, -EIO, -EIO },
+		{ HISI_SFC_V3XX_QIO, -EIO, HISI_SFC_V3XX_FULL_QIO },
+	},
+};
+
 struct hisi_sfc_v3xx_host {
 	struct device *dev;
 	void __iomem *regbase;
@@ -80,6 +101,20 @@ static int hisi_sfc_v3xx_adjust_op_size(struct spi_mem *mem,
 }
 
 /*
+ * The controller only supports Standard SPI mode, Duall mode and
+ * Quad mode. Double sanitize the ops here to avoid OOB access.
+ */
+static bool hisi_sfc_v3xx_supports_op(struct spi_mem *mem,
+				      const struct spi_mem_op *op)
+{
+	if (op->data.buswidth > 4 || op->dummy.buswidth > 4 ||
+	    op->addr.buswidth > 4 || op->cmd.buswidth > 4)
+		return false;
+
+	return spi_mem_default_supports_op(mem, op);
+}
+
+/*
  * memcpy_{to,from}io doesn't gurantee 32b accesses - which we require for the
  * DATABUF registers -so use __io{read,write}32_copy when possible. For
  * trailing bytes, copy them byte-by-byte from the DATABUF register, as we
@@ -167,48 +202,25 @@ static int hisi_sfc_v3xx_generic_exec_op(struct hisi_sfc_v3xx_host *host,
 					 const struct spi_mem_op *op,
 					 u8 chip_select)
 {
-	int ret, len = op->data.nbytes;
+	int ret = 0, len = op->data.nbytes, buswidth_mode;
 	u32 int_stat, config = 0;
 
 	if (op->addr.nbytes)
 		config |= HISI_SFC_V3XX_CMD_CFG_ADDR_EN_MSK;
 
-	switch (op->data.buswidth) {
-	case 0 ... 1:
-		break;
-	case 2:
-		if (op->addr.buswidth <= 1) {
-			config |= HISI_SFC_V3XX_CMD_CFG_DUAL_IN_DUAL_OUT;
-		} else if (op->addr.buswidth == 2) {
-			if (op->cmd.buswidth <= 1) {
-				config |= HISI_SFC_V3XX_CMD_CFG_DUAL_IO;
-			} else if (op->cmd.buswidth == 2) {
-				config |= HISI_SFC_V3XX_CMD_CFG_FULL_DIO;
-			} else {
-				return -EIO;
-			}
-		} else {
-			return -EIO;
-		}
-		break;
-	case 4:
-		if (op->addr.buswidth <= 1) {
-			config |= HISI_SFC_V3XX_CMD_CFG_QUAD_IN_QUAD_OUT;
-		} else if (op->addr.buswidth == 4) {
-			if (op->cmd.buswidth <= 1) {
-				config |= HISI_SFC_V3XX_CMD_CFG_QUAD_IO;
-			} else if (op->cmd.buswidth == 4) {
-				config |= HISI_SFC_V3XX_CMD_CFG_FULL_QIO;
-			} else {
-				return -EIO;
-			}
-		} else {
-			return -EIO;
-		}
-		break;
-	default:
-		return -EOPNOTSUPP;
+	if (op->data.buswidth == 0 || op->data.buswidth == 1) {
+		buswidth_mode = HISI_SFC_V3XX_STD;
+	} else {
+		int data_idx, addr_idx, cmd_idx;
+
+		data_idx = (op->data.buswidth - 1) / 2;
+		addr_idx = op->addr.buswidth / 2;
+		cmd_idx = op->cmd.buswidth / 2;
+		buswidth_mode = hisi_sfc_v3xx_io_modes[data_idx][addr_idx][cmd_idx];
 	}
+	if (buswidth_mode < 0)
+		return buswidth_mode;
+	config |= buswidth_mode;
 
 	if (op->data.dir != SPI_MEM_NO_DATA) {
 		config |= (len - 1) << HISI_SFC_V3XX_CMD_CFG_DATA_CNT_OFF;
@@ -272,6 +284,7 @@ static int hisi_sfc_v3xx_exec_op(struct spi_mem *mem,
 
 static const struct spi_controller_mem_ops hisi_sfc_v3xx_mem_ops = {
 	.adjust_op_size = hisi_sfc_v3xx_adjust_op_size,
+	.supports_op = hisi_sfc_v3xx_supports_op,
 	.exec_op = hisi_sfc_v3xx_exec_op,
 };
 
-- 
2.8.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
