Return-Path: <SRS0=YgIB=6I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FD78C55186
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Apr 2020 17:39:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EADB20736
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Apr 2020 17:39:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="M6xnFHax"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0EADB20736
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FSUyapV7P6Ne5gzY7IDt/nJta46LR7shHrFB65QwCvU=; b=M6xnFHaxazy3bx
	RJ+8t7D03pMkhLcPNJEMOfqokHjtfQZtLmwIhUuvM+E1M+WeHsoTVWGUe0VkuDgwJwdEamav4jxX4
	ibPYuE+VRR0GeBkRgBvF4B2FImQJ5rG6/jAh4MoZoatL8W9NIKY5nQdc+nwTRYEAhkFY8UHTMPZWd
	BcEUcm+blNBxLCh82unXb8KE6amdLYS9PsqntGQNltjc1O8vn95HJjxOWRMXhinO0r38+AQRy/3kn
	8Mg0yOwAMGAM4havt69dFk+JJe3F4GDt4U8sbatxUy/oErxeQtIkD19ESUQgbsMotcVGire5DKB5U
	WkL54/uQ+0/XMkYDOUhw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jS2Im-0000dH-IQ; Fri, 24 Apr 2020 17:39:48 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jS2Fo-00067S-88
 for linux-mtd@lists.infradead.org; Fri, 24 Apr 2020 17:36:47 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 628CB2000D;
 Fri, 24 Apr 2020 17:36:41 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH 07/10] mtd: rawnand: Help supporting controllers that are not
 able to split operations
Date: Fri, 24 Apr 2020 19:36:28 +0200
Message-Id: <20200424173631.14311-8-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200424173631.14311-1-miquel.raynal@bootlin.com>
References: <20200424173631.14311-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200424_103644_614271_6AF8B587 
X-CRM114-Status: GOOD (  16.69  )
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
Cc: Michal Simek <monstr@monstr.eu>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

While performing any NAND operation is as simple as following the
cores order and send "command", "address" and "data" cycles as
provided in a list of instructions, certain controllers are "too
clever" and are not able to split the sending of these cycles.

Try to find out at boot time if the controller will be problematic and
flag it. Additional changes will make use of this flag to workaround
the capricious controllers by proposing "packed" operations as an
alternative.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/internals.h |  5 ++++
 drivers/mtd/nand/raw/nand_base.c | 44 ++++++++++++++++++++++++++++++++
 include/linux/mtd/rawnand.h      |  8 ++++++
 3 files changed, 57 insertions(+)

diff --git a/drivers/mtd/nand/raw/internals.h b/drivers/mtd/nand/raw/internals.h
index 9d0caadf940e..38898b8639ee 100644
--- a/drivers/mtd/nand/raw/internals.h
+++ b/drivers/mtd/nand/raw/internals.h
@@ -130,6 +130,11 @@ static inline bool nand_has_setup_data_iface(struct nand_chip *chip)
 	return true;
 }
 
+static inline bool nand_pack_ops(struct nand_chip *chip)
+{
+	return (chip->options & NAND_PACK_OPS);
+}
+
 /* BBT functions */
 int nand_markbad_bbt(struct nand_chip *chip, loff_t offs);
 int nand_isreserved_bbt(struct nand_chip *chip, loff_t offs);
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 15a9189b2307..6e4eabb9dc11 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -5031,6 +5031,44 @@ static int nand_dt_init(struct nand_chip *chip)
 	return 0;
 }
 
+/**
+ * nand_controller_needs_packed_op - Check the controller habilities to perform
+ *                                   a set of split operations that the core is
+ *                                   very likely to try. If one of them do not
+ *                                   pass, then try to pack operations together.
+ * @chip: The NAND chip
+ *
+ * Returns @true if packing is needed, false otherwise.
+ */
+static bool nand_controller_needs_packed_op(struct nand_chip *chip)
+{
+	u8 tmp[8];
+	struct nand_op_instr data_in_instrs[] = {
+		NAND_OP_DATA_IN(8, tmp, 0),
+	};
+	struct nand_op_instr data_out_instrs[] = {
+		NAND_OP_DATA_OUT(8, tmp, 0),
+	};
+	struct nand_operation ops[] = {
+		NAND_OPERATION(0, data_in_instrs),
+		NAND_OPERATION(0, data_out_instrs),
+	};
+	int ret, i;
+
+	if (!nand_has_exec_op(chip))
+		return false;
+
+	for (i = 0; i < ARRAY_SIZE(ops); i++) {
+		ret = chip->controller->ops->exec_op(chip, &ops[i], true);
+		if (ret) {
+			pr_debug("Using ->exec_op() packed operations only\n");
+			return true;
+		}
+	}
+
+	return false;
+}
+
 /**
  * nand_scan_ident - Scan for the NAND device
  * @chip: NAND chip object
@@ -5052,6 +5090,7 @@ static int nand_scan_ident(struct nand_chip *chip, unsigned int maxchips,
 	struct nand_memory_organization *memorg;
 	int nand_maf_id, nand_dev_id;
 	unsigned int i;
+	bool pack_ops;
 	int ret;
 
 	memorg = nanddev_get_memorg(&chip->base);
@@ -5080,6 +5119,11 @@ static int nand_scan_ident(struct nand_chip *chip, unsigned int maxchips,
 
 	memorg->ntargets = maxchips;
 
+	/* Verify the controller's abilities */
+	pack_ops = nand_controller_needs_packed_op(chip);
+	if (pack_ops)
+		chip->options |= NAND_PACK_OPS;
+
 	/* Read the flash type */
 	ret = nand_detect(chip, table);
 	if (ret) {
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 21753b83d536..4ecc6be434e0 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -170,6 +170,14 @@ enum nand_ecc_algo {
 /* Non chip related options */
 /* This option skips the bbt scan during initialization. */
 #define NAND_SKIP_BBTSCAN	BIT(16)
+
+/*
+ * Controller does not support "naked" operations, the core should try to pack
+ * the NAND commands as much as possible thanks to the constant use of a bounce
+ * buffer. This flag must be set by the core only.
+ */
+#define NAND_PACK_OPS		BIT(17)
+
 /* Chip may not exist, so silence any errors in scan */
 #define NAND_SCAN_SILENT_NODEV	BIT(18)
 
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
