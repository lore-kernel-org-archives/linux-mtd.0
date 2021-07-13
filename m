Return-Path: <SRS0=HIhO=MF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 764E2C07E95
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Jul 2021 13:07:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33A8661073
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Jul 2021 13:07:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33A8661073
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zJlKSqpW/2nf3vtl97eMHTZXdRGqDDakdEMOWc1wEZc=; b=nvDuJBaCCU0Cpb
	YWZoMyKKawU5OY6vC/Vrz9KHNYlRz7mlPuyWKlo3kEiaWoT08X2lviJwO9ppEXz9D6R52Cn7XXmvF
	uQkipfzbhbBl33hWxiVqsilQOag7EE+1XQ4ixoPnwKiZikSGdBsdIOA39J1QUp/Rf7r7VfM2l0Oy6
	7BDcw5z48M4vyHQSH7ZBZeiacd381sqjqPQVw+sam0GrgG1u2JmcmHlmZN+FYZk5Ju1UETjb4CYxt
	aaKoVr2Tdsl5GBlMqRMX+kLU0dp4AqG364LWUngnq/uRkTvqT0Ne6S9jcnyv0on4Tsq6zRd4ymNpP
	UTWH1xyYuwMkN2RbRVNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3I81-00ASck-A9; Tue, 13 Jul 2021 13:07:13 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3I71-00ASI2-7X
 for linux-mtd@lists.infradead.org; Tue, 13 Jul 2021 13:06:14 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 16DD644V073299;
 Tue, 13 Jul 2021 08:06:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1626181564;
 bh=1k4ivvZ3xXy03Q4E8raaV+ou93EXAdzBGlKPdFnNSkw=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=LPhI6E8Vkm3LJSfa8HpdGxV+WiA5bLMh5wjpMvwxCQlJQhiktKNs8vSrtb43yASIt
 WlB0tUxQkdppes4njA6l6ddvjPkRFIutoourP5oYct4T2BcQiM9WnvjIC/sYVUEv4N
 /koF7j5K1EdEFM676rWq2g2o1Hnm74eLIXQoQfck=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 16DD64cl091370
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 13 Jul 2021 08:06:04 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 13
 Jul 2021 08:06:04 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 13 Jul 2021 08:06:04 -0500
Received: from LT5CD112GSQZ.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 16DD5daE109825;
 Tue, 13 Jul 2021 08:05:59 -0500
From: Apurva Nandan <a-nandan@ti.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Mark Brown
 <broonie@kernel.org>, Patrice Chotard <patrice.chotard@foss.st.com>, Boris
 Brezillon <boris.brezillon@collabora.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>
CC: Apurva Nandan <a-nandan@ti.com>, Pratyush Yadav <p.yadav@ti.com>
Subject: [PATCH 04/13] mtd: spinand: Fix odd byte addr and data phase in
 read/write reg op and write VCR op for Octal DTR mode
Date: Tue, 13 Jul 2021 13:05:29 +0000
Message-ID: <20210713130538.646-5-a-nandan@ti.com>
X-Mailer: git-send-email 2.31.1.windows.1
In-Reply-To: <20210713130538.646-1-a-nandan@ti.com>
References: <20210713130538.646-1-a-nandan@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210713_060611_398200_4A9306CF 
X-CRM114-Status: GOOD (  15.69  )
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

In Octal DTR SPI mode, 2 bytes of data gets transmitted over one clock
cycle, and half-cycle instruction phases aren't supported yet. So,
every DTR spi_mem_op needs to have even nbytes in all phases for
non-erratic behaviour from the SPI controller.

The odd length cmd and dummy phases get handled by spimem_setup_op()
but the odd length address and data phases need to be handled according
to the use case. For example in Octal DTR mode, read register operation
has one byte long address and data phase. So it needs to extend it
by adding a suitable extra byte in addr and reading 2 bytes of data,
discarding the second byte.

Handle address and data phases for Octal DTR mode in read/write
register and write volatile configuration register operations
by adding a suitable extra byte in the address and data phase.

Create spimem_setup_reg_op() helper function to ease setting up
read/write register operations in other functions, e.g. wait().

Signed-off-by: Apurva Nandan <a-nandan@ti.com>
---
 drivers/mtd/nand/spi/core.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 2e59faecc8f5..a5334ad34f96 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -65,12 +65,27 @@ static void spinand_setup_op(const struct spinand_device *spinand,
 	}
 }
 
+static void spinand_setup_reg_op(const struct spinand_device *spinand,
+				 struct spi_mem_op *op)
+{
+	if (spinand->reg_proto == SPINAND_OCTAL_DTR) {
+		/*
+		 * Assigning same first and second byte will result in constant
+		 * bits on ths SPI bus between positive and negative clock edges
+		 */
+		op->addr.val = (op->addr.val << 8) | op->addr.val;
+		op->addr.nbytes = 2;
+		op->data.nbytes = 2;
+	}
+	spinand_setup_op(spinand, op);
+}
+
 static int spinand_read_reg_op(struct spinand_device *spinand, u8 reg, u8 *val)
 {
-	struct spi_mem_op op = SPINAND_GET_FEATURE_OP(reg,
-						      spinand->scratchbuf);
+	struct spi_mem_op op = SPINAND_GET_FEATURE_OP(reg, spinand->scratchbuf);
 	int ret;
 
+	spinand_setup_reg_op(spinand, &op);
 	ret = spi_mem_exec_op(spinand->spimem, &op);
 	if (ret)
 		return ret;
@@ -81,10 +96,10 @@ static int spinand_read_reg_op(struct spinand_device *spinand, u8 reg, u8 *val)
 
 static int spinand_write_reg_op(struct spinand_device *spinand, u8 reg, u8 val)
 {
-	struct spi_mem_op op = SPINAND_SET_FEATURE_OP(reg,
-						      spinand->scratchbuf);
+	struct spi_mem_op op = SPINAND_SET_FEATURE_OP(reg, spinand->scratchbuf);
 
-	*spinand->scratchbuf = val;
+	spinand_setup_reg_op(spinand, &op);
+	memset(spinand->scratchbuf, val, op.data.nbytes);
 	return spi_mem_exec_op(spinand->spimem, &op);
 }
 
@@ -547,6 +562,7 @@ static int spinand_wait(struct spinand_device *spinand,
 	u8 status;
 	int ret;
 
+	spinand_setup_reg_op(spinand, &op);
 	ret = spi_mem_poll_status(spinand->spimem, &op, STATUS_BUSY, 0,
 				  initial_delay_us,
 				  poll_delay_us,
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
