Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C08D7D2D10B
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Jan 2026 14:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ArNdNo7MsaeTtt8KW7Kg4Ne4qeTWrFW4Bpv5bM4dLsw=; b=BPvKm0xV3408iR
	WZpXKo4R4sldHHISXwXN4DH9oAYqq/jO7m1jGHaMQxRe9uN3XRQkLhnjeXAb3Qth0zyIG3s9pkkIT
	3Hq6HyqWpJQlRBavfoD36r2kpv5vxYh44xqbuoQecQaitulveHcO6UAuR0SEH91uHJjGPWIUV/nJJ
	IghjrPx54hasn6T3YcnvX9BvklSXwSMlT2qrOW/y7c1WzMzwEqomqHarf3xRKTSDVJuKMpQbzxPTI
	MevoeEekFydKrlzVwjCRm7fO0dX7p6/lw3YI2OpgVG4ZeXnfS8J/qFU2+bU89coWrLn14f9hQKyG4
	1uDhCAT4ARHhroX2tcCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vffCf-00000007DTb-0ffz;
	Tue, 13 Jan 2026 14:17:01 +0000
Received: from mail-southcentralusazon11013046.outbound.protection.outlook.com ([40.93.196.46] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vffCc-00000007DSV-2dyr
	for linux-mtd@lists.infradead.org;
	Tue, 13 Jan 2026 14:16:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DrRP8svxCfBCxiuogP1mF0YF0awIN8xVxA2DKTpMOkYWLV3fghk+prMijfzp2d47GavmIGPg7T5/WZ6sa3sgCinFKfR6KqMaTmdgvNsX/fDHbd4La6y2jo7Gr3jot9PK6JMlrlAsAvFsKkisABnNiSxvxCgiewmcbahU0YHgbPVIVm+dTl3Uh+lFoWkKd9rTrslEThmwq/jMD9vky9srBSSHfhISFuJAVd8o6wh/UBUYOeEwoGDsYJRcX8tI9vUXpukr16gLmYhPxhVdJattVp3RoSrQSyHNj0zb9oxJDG0FodPFkLzOl9iA4n5zp8VYJQndR1T8pIQitQJy0OApvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xHS5ZZ7tj1xlq8WXPZrggjNqQIzyME6QyG4UIm3DqsE=;
 b=XZYDnEgSz05uMMpHJpCv4Li7qVusf6PrAYtCKePV26RHjdxzhoO553r2PI5nizyv1TlIZnaMdA/h/eFsjmYb85+UzYguDXQOv4FM0gUZ6/OkQTAp5IxISUeXazkEOo1jhaVfqI5mDb62ZmWI9zyw8laP7TzPg49MdbByfJi7eocIBTXeWyDrBtYElfYoHCWuRA8KFa2DyQS/VADXLlx8L/B+PamCEHi8UuYesioG9lCJ4lTiH+Wqt9F74fzg/Sd9mDJ/MfxkPnQdoDyd2zGLzWmtj7mbwtpnMor5YGRJgTzPmW6QflMlr4m2+ysN+PO1NedCpLfxcYzbW2TZN/idGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xHS5ZZ7tj1xlq8WXPZrggjNqQIzyME6QyG4UIm3DqsE=;
 b=UPzCqPf+qfmrNjAwaaxZaU583aFOPICMqyRpyN7sGjkQSo8HJCHE59pSBgNcnMnU98bO81sCmGHeZKVG7faRjb/2MyWW+48vf+6PP8O4ikOsbhXroK6OGp3wFmlGzpHqVDkCona3BsmqiCzqBTF3UggyQJjBQ+qlJ6G+jQvu+PQ=
Received: from BLAPR03CA0079.namprd03.prod.outlook.com (2603:10b6:208:329::24)
 by PH0PR10MB5682.namprd10.prod.outlook.com (2603:10b6:510:147::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Tue, 13 Jan
 2026 14:16:53 +0000
Received: from BL02EPF0001A103.namprd05.prod.outlook.com
 (2603:10b6:208:329:cafe::3a) by BLAPR03CA0079.outlook.office365.com
 (2603:10b6:208:329::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Tue,
 13 Jan 2026 14:16:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL02EPF0001A103.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Tue, 13 Jan 2026 14:16:52 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 13 Jan
 2026 08:16:50 -0600
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 13 Jan
 2026 08:16:50 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 13 Jan 2026 08:16:50 -0600
Received: from santhoshkumark.dhcp.ti.com (santhoshkumark.dhcp.ti.com [172.24.233.254])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60DEGLon2381510;
	Tue, 13 Jan 2026 08:16:45 -0600
From: Santhosh Kumar K <s-k6@ti.com>
To: <broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
	<vigneshr@ti.com>, <tudor.ambarus@linaro.org>, <pratyush@kernel.org>,
	<mwalle@kernel.org>
CC: <linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
	<praneeth@ti.com>, <u-kumar1@ti.com>, <p-mantena@ti.com>, <a-dutta@ti.com>,
	<s-k6@ti.com>
Subject: [RFC PATCH v2 04/12] mtd: spi-nor: extract read operation setup into helper
Date: Tue, 13 Jan 2026 19:46:09 +0530
Message-ID: <20260113141617.1905039-5-s-k6@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260113141617.1905039-1-s-k6@ti.com>
References: <20260113141617.1905039-1-s-k6@ti.com>
MIME-Version: 1.0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A103:EE_|PH0PR10MB5682:EE_
X-MS-Office365-Filtering-Correlation-Id: cae61bc1-2579-4300-2ba4-08de52ae6670
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|34020700016|376014|7416014|36860700013|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pavW3MT80YIAMoT307dypsge4kg5cMh3wtQmpE6aD/ZDgFMBY/a8WxSXU1QQ?=
 =?us-ascii?Q?OoII+YAsAbiGtsR29UtNUCxy96dRBWobFRwMs0BjtLsCGTOY6TE6iQ+ZvGsW?=
 =?us-ascii?Q?wKg4g+XgzNv9qk3rHDxPeGsDBvr3WVYDHQnBDEBuFzF3aPs/SCZ2WHaDBQiq?=
 =?us-ascii?Q?iLhzMRF7YZgOS0iwEILzl2B3LnU8fhmxAvYaTcGK/cV64gl1FiLx1Ia9SrvP?=
 =?us-ascii?Q?rAIUoPinpy1lCFCz3cDjkZefhMMH0PnJyC7XAe03bX5+LBZcEAhvbdSkyvPh?=
 =?us-ascii?Q?je10f4W+/vaKTRxaU9LX3IwSb3NILxMqPvTmzq7+wYw8fzZz6XDzb3BE5o0S?=
 =?us-ascii?Q?OSZtLEYZ0xw6KNDqFEQuUgpY5cMoJL70et7RZpOA7N5KEwXambJtNImdsV2S?=
 =?us-ascii?Q?FplJv3O67L8utegbfaI0QZVqoRNiVa4P9vvoaP3c/Nd91RE3+L1DmXLj36dk?=
 =?us-ascii?Q?JvVCGq1MVqDwXM/5somBnqSWkIQR/6YN7jD475qZ2Cc8SfvwbIhA360eBjZH?=
 =?us-ascii?Q?W09qh1/ABHM+RekecaVrHDV270iMVTE+7zx2dKmYmAozPc+ORZbma/jkD1mK?=
 =?us-ascii?Q?A7ldBGi6CsBHvqRh3fan/FQ3iH19t3UJyoUlSgE5WcM69QT9Fr0pfgsjSa2k?=
 =?us-ascii?Q?Vg3+8+VLcdOV0n6MQSqi11c99RD8sL3boSV9jk+6uBnHV/Y787/Bcxwv4ZxK?=
 =?us-ascii?Q?QGm3UO+Ro3Do7yPw23i7VX/fVDnlcJwJVEuGjTLFdSo9JSSSs+uQCU3b6abs?=
 =?us-ascii?Q?VE+JO9tz8p32w5I5WPsVLhwG/NRfNGiCcX+Kium48gVchhAFLtiSktaGc48l?=
 =?us-ascii?Q?e2+4MuUhW+PTz0VbnmyoZ3gqIibHVD36pV4YHFjJbMFBUwWbSZ7P2jnzxjbK?=
 =?us-ascii?Q?/r4gQb7uvhvog0JOoVvdvZbHt6ajtCJnhdBDeR7GjNJRcSc9fOeQFL9Xl//T?=
 =?us-ascii?Q?Jit0WjwkTUAcCj/MvGF16SMyslOCPeb0DgF+zsRhmHkJ7fkj6KkUFDz20NYG?=
 =?us-ascii?Q?HwcYxDNiSJSqDjRXDbum+/Budtlo5h1/r66JvCXibYqjWpWVn/ncdqf7tsH0?=
 =?us-ascii?Q?hZi88xRtlrDZPN9w5CSunPn+iLGSuaIABFkNXP5QpPyOmBBXTxoDpEZQIFch?=
 =?us-ascii?Q?IH9Y4gqh3KAazEoBILRC1A2nj4AsiMYKX6GS8I9uHXdZyLbXCosoiPcphSj/?=
 =?us-ascii?Q?rXdiyo4QActsBsqJk7NAG5rFIOVNT8sQ93x0rz6uscA4SViBbRTUrcvx6wYI?=
 =?us-ascii?Q?3IMMnW10WEfF0O47pLo+DvYdn7FV6fmSfavNl4dkHrtSBJBQpRbDJ6KllmDK?=
 =?us-ascii?Q?L2gqsqLWac75OfwxTRUg0/pvNNLZL9GOgB8Ci2yxXhg6ZGed8csjrMNKQfas?=
 =?us-ascii?Q?jLYK8AaAzyGYEEvT79rXSNWK4aNupKZU1Pzs7T2scPuGeFjjF6nBIehYq235?=
 =?us-ascii?Q?OxjM8C8d0+A0w2Pv5TTYY5c9qMv0RO1tfM6zr3CHJeDaF7eN5mnHzIsORYto?=
 =?us-ascii?Q?g7tnF1DiU/XfKABB9hiUdWLpVBISorVv7T+P3i11tAsfcw891+LiQJn6WtSv?=
 =?us-ascii?Q?TAaG4HCzTGzXwUqN86FeLZwB+urk6lOh059rtPjd?=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(34020700016)(376014)(7416014)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 14:16:52.8383
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cae61bc1-2579-4300-2ba4-08de52ae6670
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A103.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5682
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_061658_674631_002B6FF0 
X-CRM114-Status: GOOD (  14.61  )
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

From: Pratyush Yadav <pratyush@kernel.org>

spi_nor_spimem_read_data() and spi_nor_create_read_dirmap() duplicate
the logic for constructing read operations: both create a spi_mem_op,
call spi_nor_spimem_setup_op(), and convert dummy cycles to bytes.

Extract this into spi_nor_spimem_get_read_op() to eliminate duplication.
The helper returns a configured template that callers populate with
address, data length, and buffer.

Signed-off-by: Pratyush Yadav <pratyush@kernel.org>
Signed-off-by: Santhosh Kumar K <s-k6@ti.com>
---
 drivers/mtd/spi-nor/core.c | 60 +++++++++++++++++++-------------------
 1 file changed, 30 insertions(+), 30 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index d3f8a78efd3b..63f3051d7a6b 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -188,6 +188,31 @@ static int spi_nor_controller_ops_erase(struct spi_nor *nor, loff_t offs)
 	return nor->controller_ops->erase(nor, offs);
 }
 
+/**
+ * spi_nor_spimem_get_read_op() - get spi_mem read operation template
+ * @nor:	the spi-nor device
+ *
+ * Returns a read operation template with buswidths and dummy cycles
+ * configured. Caller must set address, data length, and data buffer.
+ */
+static struct spi_mem_op spi_nor_spimem_get_read_op(struct spi_nor *nor)
+{
+	struct spi_mem_op op =
+		SPI_MEM_OP(SPI_MEM_OP_CMD(nor->read_opcode, 0),
+			   SPI_MEM_OP_ADDR(nor->addr_nbytes, 0, 0),
+			   SPI_MEM_OP_DUMMY(nor->read_dummy, 0),
+			   SPI_MEM_OP_DATA_IN(1, NULL, 0));
+
+	spi_nor_spimem_setup_op(nor, &op, nor->read_proto);
+
+	/* convert the dummy cycles to the number of bytes */
+	op.dummy.nbytes = (nor->read_dummy * op.dummy.buswidth) / 8;
+	if (spi_nor_protocol_is_dtr(nor->read_proto))
+		op.dummy.nbytes *= 2;
+
+	return op;
+}
+
 /**
  * spi_nor_spimem_read_data() - read data from flash's memory region via
  *                              spi-mem
@@ -201,21 +226,14 @@ static int spi_nor_controller_ops_erase(struct spi_nor *nor, loff_t offs)
 static ssize_t spi_nor_spimem_read_data(struct spi_nor *nor, loff_t from,
 					size_t len, u8 *buf)
 {
-	struct spi_mem_op op =
-		SPI_MEM_OP(SPI_MEM_OP_CMD(nor->read_opcode, 0),
-			   SPI_MEM_OP_ADDR(nor->addr_nbytes, from, 0),
-			   SPI_MEM_OP_DUMMY(nor->read_dummy, 0),
-			   SPI_MEM_OP_DATA_IN(len, buf, 0));
+	struct spi_mem_op op = spi_nor_spimem_get_read_op(nor);
 	bool usebouncebuf;
 	ssize_t nbytes;
 	int error;
 
-	spi_nor_spimem_setup_op(nor, &op, nor->read_proto);
-
-	/* convert the dummy cycles to the number of bytes */
-	op.dummy.nbytes = (nor->read_dummy * op.dummy.buswidth) / 8;
-	if (spi_nor_protocol_is_dtr(nor->read_proto))
-		op.dummy.nbytes *= 2;
+	op.addr.val = from;
+	op.data.nbytes = len;
+	op.data.buf.in = buf;
 
 	usebouncebuf = spi_nor_spimem_bounce(nor, &op);
 
@@ -3641,28 +3659,10 @@ EXPORT_SYMBOL_GPL(spi_nor_scan);
 static int spi_nor_create_read_dirmap(struct spi_nor *nor)
 {
 	struct spi_mem_dirmap_info info = {
-		.op_tmpl = SPI_MEM_OP(SPI_MEM_OP_CMD(nor->read_opcode, 0),
-				      SPI_MEM_OP_ADDR(nor->addr_nbytes, 0, 0),
-				      SPI_MEM_OP_DUMMY(nor->read_dummy, 0),
-				      SPI_MEM_OP_DATA_IN(0, NULL, 0)),
+		.op_tmpl = spi_nor_spimem_get_read_op(nor),
 		.offset = 0,
 		.length = nor->params->size,
 	};
-	struct spi_mem_op *op = &info.op_tmpl;
-
-	spi_nor_spimem_setup_op(nor, op, nor->read_proto);
-
-	/* convert the dummy cycles to the number of bytes */
-	op->dummy.nbytes = (nor->read_dummy * op->dummy.buswidth) / 8;
-	if (spi_nor_protocol_is_dtr(nor->read_proto))
-		op->dummy.nbytes *= 2;
-
-	/*
-	 * Since spi_nor_spimem_setup_op() only sets buswidth when the number
-	 * of data bytes is non-zero, the data buswidth won't be set here. So,
-	 * do it explicitly.
-	 */
-	op->data.buswidth = spi_nor_get_protocol_data_nbits(nor->read_proto);
 
 	nor->dirmap.rdesc = devm_spi_mem_dirmap_create(nor->dev, nor->spimem,
 						       &info);
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
