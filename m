Return-Path: <SRS0=HIhO=MF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B8DAC07E95
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Jul 2021 13:07:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24748611C0
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Jul 2021 13:07:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24748611C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g4dpm+l0Je8HLu1PfaNUO14MboDXXSDyeyUaRqiqwzU=; b=DZeAHAh2m2jjUE
	gxAvJ1HXenISG84PtSXLjhygo6gn0GPhz6tpbbp4VgVpg5DXsXES28PhNaH9ZNZ9w74sHbxM5u8vN
	LCdI5+4UP4kIl52IXi0dIPpibD/2GBNxNCop9OvPQ/gwbiSzuZBz4sEpKVAif0zWn2BZEmCUjoeng
	9sdALTeqFRoLqOxHh9p3Ri7zIgB5VX0YDZn6pV49upxSkD2f7tiJFpTh9zCfJKH9NZ8l/ARO2X+Yq
	NaI2m0cOS+Zdk8CGyF5xgIlk4bFB7d4FVuwrmLDwx9LT47CukwhXt5mztrGlaFWrdigkB4ePRvj3C
	uZAIHGx9/kZ6XLguhseA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3I7b-00ASTS-I7; Tue, 13 Jul 2021 13:06:47 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3I6w-00ASFo-DO
 for linux-mtd@lists.infradead.org; Tue, 13 Jul 2021 13:06:09 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 16DD5xO6073273;
 Tue, 13 Jul 2021 08:05:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1626181559;
 bh=wOeelgD35VXJcTWVNjU1ob5kt3+vg6MXZy2vU/+9Qp0=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=bjoev2fXH8g6EqbhaG2XgAFUJE9EL7e8kRhdtJdT1a59ejXKO04vQAkKbPLaVxL/z
 HJhJywkTMVclJRKvgZoAsgZkohoS0XKZ3SdDHFqjnAJnfenj60H34lmVo9Ctb5YwJ6
 4MoTPY8rL9ofzR1tdjX92IDrgkHHhc326feE2WYk=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 16DD5xcB085853
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 13 Jul 2021 08:05:59 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 13
 Jul 2021 08:05:59 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 13 Jul 2021 08:05:59 -0500
Received: from LT5CD112GSQZ.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 16DD5daD109825;
 Tue, 13 Jul 2021 08:05:55 -0500
From: Apurva Nandan <a-nandan@ti.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Mark Brown
 <broonie@kernel.org>, Patrice Chotard <patrice.chotard@foss.st.com>, Boris
 Brezillon <boris.brezillon@collabora.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>
CC: Apurva Nandan <a-nandan@ti.com>, Pratyush Yadav <p.yadav@ti.com>
Subject: [PATCH 03/13] mtd: spinand: Setup spi_mem_op for the SPI IO protocol
 using reg_proto
Date: Tue, 13 Jul 2021 13:05:28 +0000
Message-ID: <20210713130538.646-4-a-nandan@ti.com>
X-Mailer: git-send-email 2.31.1.windows.1
In-Reply-To: <20210713130538.646-1-a-nandan@ti.com>
References: <20210713130538.646-1-a-nandan@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210713_060606_582978_8D6E6CD1 
X-CRM114-Status: GOOD (  15.68  )
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

Currently, the op macros in spinand.h don't give the option to setup
any non-array access instructions for Dual/Quad/Octal DTR SPI bus.
Having a function that setups the op based on reg_proto would be
better than trying to write all the setup logic in op macros.

Create a spimem_setup_op() that would setup cmd, addr, dummy and data
phase of the spi_mem op, for the given spinand->reg_proto. And hence,
call the spimem_setup_op() before executing any spi_mem op.

Note: In this commit, spimem_setup_op() isn't called in the
read_reg_op(), write_reg_op() and wait() functions, as they need
modifications in address value and data nbytes when in Octal DTR mode.
This will be fixed in a later commit.

Signed-off-by: Apurva Nandan <a-nandan@ti.com>
---
 drivers/mtd/nand/spi/core.c | 51 +++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index a4f25649e293..2e59faecc8f5 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -20,6 +20,51 @@
 #include <linux/spi/spi.h>
 #include <linux/spi/spi-mem.h>
 
+/**
+ * spinand_setup_op() - Helper function to setup the spi_mem op based on the
+ *			spinand->reg_proto
+ * @spinand: the spinand device
+ * @op: the spi_mem op to setup
+ *
+ * Set up buswidth and dtr fields for cmd, addr, dummy and data phase. Also
+ * adjust cmd opcode and dummy nbytes. This function doesn't make any changes
+ * to addr val or data buf.
+ */
+static void spinand_setup_op(const struct spinand_device *spinand,
+			     struct spi_mem_op *op)
+{
+	u8 op_buswidth = SPINAND_PROTO_BUSWIDTH(spinand->reg_proto);
+	u8 op_is_dtr = SPINAND_PROTO_IS_DTR(spinand->reg_proto);
+
+	if (spinand->reg_proto == SPINAND_SINGLE_STR)
+		return;
+
+	op->cmd.buswidth = op_buswidth;
+	op->cmd.dtr = op_is_dtr;
+	if (spinand->reg_proto == SPINAND_OCTAL_DTR) {
+		op->cmd.opcode = (op->cmd.opcode << 8) | op->cmd.opcode;
+		op->cmd.nbytes = 2;
+	}
+
+	if (op->addr.nbytes) {
+		op->addr.buswidth = op_buswidth;
+		op->addr.dtr = op_is_dtr;
+	}
+
+	if (op->dummy.nbytes) {
+		op->dummy.buswidth = op_buswidth;
+		if (op_is_dtr) {
+			op->dummy.nbytes *= 2;
+			op->dummy.dtr = true;
+		}
+	}
+
+	if (op->data.nbytes) {
+		op->data.buswidth = op_buswidth;
+		op->data.dtr = op_is_dtr;
+	}
+}
+
 static int spinand_read_reg_op(struct spinand_device *spinand, u8 reg, u8 *val)
 {
 	struct spi_mem_op op = SPINAND_GET_FEATURE_OP(reg,
@@ -341,6 +386,7 @@ static int spinand_write_enable_op(struct spinand_device *spinand)
 {
 	struct spi_mem_op op = SPINAND_WR_EN_DIS_OP(true);
 
+	spinand_setup_op(spinand, &op);
 	return spi_mem_exec_op(spinand->spimem, &op);
 }
 
@@ -351,6 +397,7 @@ static int spinand_load_page_op(struct spinand_device *spinand,
 	unsigned int row = nanddev_pos_to_row(nand, &req->pos);
 	struct spi_mem_op op = SPINAND_PAGE_READ_OP(row);
 
+	spinand_setup_op(spinand, &op);
 	return spi_mem_exec_op(spinand->spimem, &op);
 }
 
@@ -475,6 +522,7 @@ static int spinand_program_op(struct spinand_device *spinand,
 	unsigned int row = nanddev_pos_to_row(nand, &req->pos);
 	struct spi_mem_op op = SPINAND_PROG_EXEC_OP(row);
 
+	spinand_setup_op(spinand, &op);
 	return spi_mem_exec_op(spinand->spimem, &op);
 }
 
@@ -485,6 +533,7 @@ static int spinand_erase_op(struct spinand_device *spinand,
 	unsigned int row = nanddev_pos_to_row(nand, pos);
 	struct spi_mem_op op = SPINAND_BLK_ERASE_OP(row);
 
+	spinand_setup_op(spinand, &op);
 	return spi_mem_exec_op(spinand->spimem, &op);
 }
 
@@ -531,6 +580,7 @@ static int spinand_read_id_op(struct spinand_device *spinand, u8 naddr,
 		naddr, ndummy, spinand->scratchbuf, SPINAND_MAX_ID_LEN);
 	int ret;
 
+	spinand_setup_op(spinand, &op);
 	ret = spi_mem_exec_op(spinand->spimem, &op);
 	if (!ret)
 		memcpy(buf, spinand->scratchbuf, SPINAND_MAX_ID_LEN);
@@ -543,6 +593,7 @@ static int spinand_reset_op(struct spinand_device *spinand)
 	struct spi_mem_op op = SPINAND_RESET_OP;
 	int ret;
 
+	spinand_setup_op(spinand, &op);
 	ret = spi_mem_exec_op(spinand->spimem, &op);
 	if (ret)
 		return ret;
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
