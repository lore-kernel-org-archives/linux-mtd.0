Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EEFAC433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Dec 2021 11:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sRIBBQqiE8BzqM2MjJl8MVyU1fHdB4bzEQ/fUZMT7no=; b=Z2HjCG3PntvyRx
	P6jvS1fKvgr4syzLfveME7RqFy2ngvau0jfvPFQnh1ErwA3xlsd+5dJyVEzvybpPIE/kg4xMTU0Wt
	ns8/QMuTmYnoku21840C9ypv4vVYCDMF5g1d5yI+KsoyBDUrEsdiBUvycbdovig1uczYYOht3kIvQ
	d4bawRKnL5XktM+Knh/ahCNhsAnhOo5ggrDMHJN4R7tKfklRgUXYe1OEJMlMb+R3z8BLv60s606OE
	dtyPf+goNciLG+v/tL2Gqdi5D60cQ6oohjEvqWws3eYoBmhHp+JyCeaPXxH4uVV1aei7HTVBcfh7A
	xv+R4RiKRS6eqasS7ubw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mx6EC-00DkSi-5R; Tue, 14 Dec 2021 11:44:16 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mx6Bu-00DjZx-CV
 for linux-mtd@lists.infradead.org; Tue, 14 Dec 2021 11:41:55 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 4381E240007;
 Tue, 14 Dec 2021 11:41:51 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>, Mark Brown <broonie@kernel.org>,
 <linux-spi@vger.kernel.org>
Cc: Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Xiangsheng Hou <xiangsheng.hou@mediatek.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v5 04/13] spi: spi-mem: Create a helper to gather all the
 supports_op checks
Date: Tue, 14 Dec 2021 12:41:31 +0100
Message-Id: <20211214114140.54629-5-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211214114140.54629-1-miquel.raynal@bootlin.com>
References: <20211214114140.54629-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_034154_605084_487C8976 
X-CRM114-Status: GOOD (  13.69  )
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

So far we check the support for:
- regular operations
- dtr operations
Soon, we will also need to check the support for ECC operations.

As the combinatorial will increase exponentially, let's gather all the
checks in a single generic function which takes a capabilities structure
as input. This new helper is supposed to be called by the currently
exported functions instead of repeating a similar implementation.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-mem.c       | 34 +++++++++++++++++++++++++---------
 include/linux/spi/spi-mem.h |  8 ++++++++
 2 files changed, 33 insertions(+), 9 deletions(-)

diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
index 37f4443ce9a0..4c6944d7b174 100644
--- a/drivers/spi/spi-mem.c
+++ b/drivers/spi/spi-mem.c
@@ -160,26 +160,42 @@ static bool spi_mem_check_buswidth(struct spi_mem *mem,
 	return true;
 }
 
+static bool spi_mem_generic_supports_op(struct spi_mem *mem,
+					const struct spi_mem_op *op,
+					struct spi_mem_controller_caps *caps)
+{
+	if (!caps->dtr) {
+		if (op->cmd.dtr || op->addr.dtr ||
+		    op->dummy.dtr || op->data.dtr)
+			return false;
+
+		if (op->cmd.nbytes != 1)
+			return false;
+	} else {
+		if (op->cmd.nbytes != 2)
+			return false;
+	}
+
+	return spi_mem_check_buswidth(mem, op);
+}
+
 bool spi_mem_dtr_supports_op(struct spi_mem *mem,
 			     const struct spi_mem_op *op)
 {
-	if (op->cmd.nbytes != 2)
-		return false;
+	struct spi_mem_controller_caps caps = {
+		.dtr = true,
+	};
 
-	return spi_mem_check_buswidth(mem, op);
+	return spi_mem_generic_supports_op(mem, op, &caps);
 }
 EXPORT_SYMBOL_GPL(spi_mem_dtr_supports_op);
 
 bool spi_mem_default_supports_op(struct spi_mem *mem,
 				 const struct spi_mem_op *op)
 {
-	if (op->cmd.dtr || op->addr.dtr || op->dummy.dtr || op->data.dtr)
-		return false;
+	struct spi_mem_controller_caps caps = {};
 
-	if (op->cmd.nbytes != 1)
-		return false;
-
-	return spi_mem_check_buswidth(mem, op);
+	return spi_mem_generic_supports_op(mem, op, &caps);
 }
 EXPORT_SYMBOL_GPL(spi_mem_default_supports_op);
 
diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
index 85e2ff7b840d..f365efcfb719 100644
--- a/include/linux/spi/spi-mem.h
+++ b/include/linux/spi/spi-mem.h
@@ -220,6 +220,14 @@ static inline void *spi_mem_get_drvdata(struct spi_mem *mem)
 	return mem->drvpriv;
 }
 
+/**
+ * struct spi_mem_controller_caps - SPI memory controller capabilities
+ * @dtr: Supports DTR operations
+ */
+struct spi_mem_controller_caps {
+	bool dtr;
+};
+
 /**
  * struct spi_controller_mem_ops - SPI memory operations
  * @adjust_op_size: shrink the data xfer of an operation to match controller's
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
