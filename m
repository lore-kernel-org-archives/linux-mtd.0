Return-Path: <SRS0=sMU9=O7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93C57C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Oct 2021 20:48:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D7E160E8B
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Oct 2021 20:48:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5D7E160E8B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UAN6KV19Y8ofRzhjUgk+Yz2MCsv3sm17XwXCn3bArJA=; b=v4tu/eqrKNaFzB
	U9WoiA8gDVbk5nrk7AhRY1iz77vLRMTNHkeTkB/WiPNKdV2xjBeug48boftt0BFQkbYE76HSY0Bmp
	JfXNKonxb/RVi00bfVvlGaV5WFACP4EMwIk6rMBe0TB2B6rAi0MBUopcRFF2MnCBMdZV3hg5ZqXQ5
	y5vclvfC6lD4GBL424BUPp0bi8Df5J0dt1XMZxIP/zmea5uxpuqQswsFvCW+5zTv3eSIsVO4676w5
	vy1+cMcU7iqZhRv4Uhsse8NiKgIoMw/5X0tc1jQEYVbFnhFaDMdFbOTmQAUDSaU3436Vtuidv3ICq
	p7rIm88OUEb1pYTH2+9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ma2D9-00Adh7-09; Mon, 11 Oct 2021 20:47:51 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ma2CG-00AdSF-AE
 for linux-mtd@lists.infradead.org; Mon, 11 Oct 2021 20:46:57 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 19BKknQn070955;
 Mon, 11 Oct 2021 15:46:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1633985209;
 bh=zuAnALlNlpxKf8XxKC5WEtmIbZqVguvc3Q0C3DzvGGs=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=UoLlY5j4IzTnUDuQDYGeq+cA6N1uER9VLr7a5yRy4D+o0pOjrQ8GRvEeXDtAV3r2v
 1raSQOPIFVo9vPvYjZUHCNLR7bkxwbzEYUfBS7fIlqOlK56vXSo+j2swtcb4g0TjRc
 ieR4nfFB8YcIyv2M9cYLAw4fttIY/H4gqsIwnSnI=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 19BKknFl105109
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 11 Oct 2021 15:46:49 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 11
 Oct 2021 15:46:49 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 11 Oct 2021 15:46:48 -0500
Received: from LT5CD112GSQZ.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 19BKkKEi069811;
 Mon, 11 Oct 2021 15:46:43 -0500
From: Apurva Nandan <a-nandan@ti.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Mark Brown
 <broonie@kernel.org>, Apurva Nandan <a-nandan@ti.com>, Patrice Chotard
 <patrice.chotard@foss.st.com>, Christophe Kerello
 <christophe.kerello@foss.st.com>, Boris Brezillon
 <boris.brezillon@collabora.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>
CC: <p.yadav@ti.com>
Subject: [PATCH v2 04/14] mtd: spinand: Fix odd byte addr and data phase in
 read and write reg op for Octal DTR mode
Date: Tue, 12 Oct 2021 02:16:09 +0530
Message-ID: <20211011204619.81893-5-a-nandan@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211011204619.81893-1-a-nandan@ti.com>
References: <20211011204619.81893-1-a-nandan@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_134656_465413_5A4C59F6 
X-CRM114-Status: GOOD (  15.71  )
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

The odd length cmd and dummy phases get handled by spimem_patch_op()
but the odd length address and data phases need to be handled according
to the use case. For example in Octal DTR mode, read register operation
has one byte long address and data phase. So it needs to extend it
by adding a suitable extra byte in addr and reading 2 bytes of data,
discarding the second byte.

Handle address and data phases for Octal DTR mode in read and write
register operations by adding a suitable extra byte in the address and
data phase.

Create spimem_patch_reg_op() helper function to ease setting up
read/write register operations in other functions, e.g. wait().

Signed-off-by: Apurva Nandan <a-nandan@ti.com>
---
 drivers/mtd/nand/spi/core.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 11746d858f87..4da794ae728d 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -63,12 +63,29 @@ static void spinand_patch_op(const struct spinand_device *spinand,
 	}
 }
 
+static void spinand_patch_reg_op(const struct spinand_device *spinand,
+				 struct spi_mem_op *op)
+{
+	if (spinand->reg_proto == SPINAND_OCTAL_DTR) {
+		/*
+		 * Assigning same first and second byte will result in constant
+		 * bits on the SPI bus between positive and negative clock edges
+		 */
+		op->addr.val = (op->addr.val << 8) | op->addr.val;
+		op->addr.nbytes = 2;
+		op->data.nbytes = 2;
+	}
+
+	spinand_patch_op(spinand, op);
+}
+
 static int spinand_read_reg_op(struct spinand_device *spinand, u8 reg, u8 *val)
 {
 	struct spi_mem_op op = SPINAND_GET_FEATURE_OP(reg,
 						      spinand->scratchbuf);
 	int ret;
 
+	spinand_patch_reg_op(spinand, &op);
 	ret = spi_mem_exec_op(spinand->spimem, &op);
 	if (ret)
 		return ret;
@@ -82,7 +99,8 @@ static int spinand_write_reg_op(struct spinand_device *spinand, u8 reg, u8 val)
 	struct spi_mem_op op = SPINAND_SET_FEATURE_OP(reg,
 						      spinand->scratchbuf);
 
-	*spinand->scratchbuf = val;
+	spinand_patch_reg_op(spinand, &op);
+	memset(spinand->scratchbuf, val, op.data.nbytes);
 	return spi_mem_exec_op(spinand->spimem, &op);
 }
 
@@ -547,6 +565,7 @@ static int spinand_wait(struct spinand_device *spinand,
 	u8 status;
 	int ret;
 
+	spinand_patch_reg_op(spinand, &op);
 	ret = spi_mem_poll_status(spinand->spimem, &op, STATUS_BUSY, 0,
 				  initial_delay_us,
 				  poll_delay_us,
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
