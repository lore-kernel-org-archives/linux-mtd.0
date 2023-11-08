Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B103C41535
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Nov 2023 17:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qHCE4IRhdi3c2X6ltResjuWE8j+RDtdVQMBvMgF0KRI=; b=UCLNU9XhRzUtun
	4PdgrM/SKfnPuaNngpfl9Wdduiq8GhNdMzsZcIpHLFCiXulW25kxcPwz0QE0Y3VhosAEcY//4JOx0
	28JsKKkFBDKMvZtnI6Fi8sYDGpB88qdLpfM/dkhHBjKhwndfxftU9NxSPbvmEOE8g0C7WIRh61arl
	qSxZa8gzqoJYGh5EYYjE8/aeOHAxiDf2NZZEMdYHIPcPoAwF3UiEpX598VCz1/e8twxFjoBA40YPU
	C7vgc0MRMz+ZduQuVzSiv8D+JaAyiwLndJleEWbxn2QYi5PzLu/yPhcV/YQFiTFBe5Ov8usRi+Z1S
	hKX5h0GUGyGRNBdYhA4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0m63-004NSo-0A;
	Wed, 08 Nov 2023 17:12:07 +0000
Received: from relmlor2.renesas.com ([210.160.252.172] helo=relmlie6.idc.renesas.com)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0m5y-004NPr-0b
	for linux-mtd@lists.infradead.org;
	Wed, 08 Nov 2023 17:12:03 +0000
X-IronPort-AV: E=Sophos;i="6.03,286,1694703600"; 
   d="scan'208";a="186043539"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 09 Nov 2023 02:11:59 +0900
Received: from localhost.localdomain (unknown [10.226.92.247])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 3A68F402E576;
	Thu,  9 Nov 2023 02:11:55 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-spi@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Michael Walle <michael@walle.cc>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH RFC 1/4] spi: spi-mem: Add set_iofv() callback
Date: Wed,  8 Nov 2023 17:11:46 +0000
Message-Id: <20231108171149.258656-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231108171149.258656-1-biju.das.jz@bp.renesas.com>
References: <20231108171149.258656-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_091202_423382_B6188D31 
X-CRM114-Status: GOOD (  15.00  )
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

As per section 8.14 on the AT25QL128A hardware manual,
IO0..IO3 must be set to Hi-Z state for this flash for fast read quad IO.
Snippet from HW manual section 8.14:
The upper nibble of the Mode(M7-4) controls the length of the next FAST
Read Quad IO instruction through the inclusion or exclusion of the first
byte instruction code. The lower nibble bits of the Mode(M3-0) are don't
care. However, the IO pins must be high-impedance before the falling edge
of the first data out clock.

Add set_iofv() callback for configuring IO fixed values to control the
pin state.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/spi/spi-mem.c       | 20 ++++++++++++++++++++
 include/linux/spi/spi-mem.h |  4 ++++
 2 files changed, 24 insertions(+)

diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
index edd7430d4c05..0cfca8c438e3 100644
--- a/drivers/spi/spi-mem.c
+++ b/drivers/spi/spi-mem.c
@@ -297,6 +297,26 @@ static void spi_mem_access_end(struct spi_mem *mem)
 		pm_runtime_put(ctlr->dev.parent);
 }
 
+/**
+ * spi_mem_set_iofv() - Set IO fixed values to control the pin state
+ * @mem: the SPI memory
+ * @val: the IO fixed values
+ *
+ * Set IO fixed values to control the pin state.
+ *
+ * Return: 0 in case of success, a negative error code otherwise.
+ */
+int spi_mem_set_iofv(struct spi_mem *mem, u32 val)
+{
+	struct spi_controller *ctlr = mem->spi->controller;
+
+	if (ctlr->mem_ops && ctlr->mem_ops->set_iofv)
+		return ctlr->mem_ops->set_iofv(mem, val);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(spi_mem_set_iofv);
+
 /**
  * spi_mem_exec_op() - Execute a memory operation
  * @mem: the SPI memory
diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
index 6b0a7dc48a4b..e50f89bf5ba9 100644
--- a/include/linux/spi/spi-mem.h
+++ b/include/linux/spi/spi-mem.h
@@ -232,6 +232,7 @@ static inline void *spi_mem_get_drvdata(struct spi_mem *mem)
  *		    limitations (can be alignment or max RX/TX size
  *		    limitations)
  * @supports_op: check if an operation is supported by the controller
+ * @set_iofv: set IO fixed values to control the pin state
  * @exec_op: execute a SPI memory operation
  * @get_name: get a custom name for the SPI mem device from the controller.
  *	      This might be needed if the controller driver has been ported
@@ -274,6 +275,7 @@ struct spi_controller_mem_ops {
 	int (*adjust_op_size)(struct spi_mem *mem, struct spi_mem_op *op);
 	bool (*supports_op)(struct spi_mem *mem,
 			    const struct spi_mem_op *op);
+	int (*set_iofv)(struct spi_mem *mem, u32 val);
 	int (*exec_op)(struct spi_mem *mem,
 		       const struct spi_mem_op *op);
 	const char *(*get_name)(struct spi_mem *mem);
@@ -367,6 +369,8 @@ int spi_mem_adjust_op_size(struct spi_mem *mem, struct spi_mem_op *op);
 bool spi_mem_supports_op(struct spi_mem *mem,
 			 const struct spi_mem_op *op);
 
+int spi_mem_set_iofv(struct spi_mem *mem, u32 val);
+
 int spi_mem_exec_op(struct spi_mem *mem,
 		    const struct spi_mem_op *op);
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
