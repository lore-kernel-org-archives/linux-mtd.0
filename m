Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 258FFC433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Apr 2022 10:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9zwCN51weJk8LgtMSX5a00cGu3PRc8o9bxDLfeLu8pY=; b=al44Y9K9aJf5/q
	p83LeTgAyRHw8ww5F3nIBHXRyX6EpwCQJf94hYaXcm1yfsv5YhROxs5aB0BTkf8Cze1KsvDE53hLi
	EAxTD3k13oFn9RNjBbmcA80+6MPnhUDxB7AKJFFqs6/8oe6QTcQIbwDI0RSzkciKHfwBhEcbPlr8l
	+fIclueYoa9LeypO1GJKhp4q4X1X/6EZ/cFPRyzA/VFhf9mx2u1o5qH0dGvnB6CR1XXCULUxQ3hnr
	kI1iX5l2wQOzepagi2EQevsG3ybfo+2mOJrDrp7qWBxJKuLxqShQdU1G/ckQRVjvl48qdflRPE4o0
	DmgwdI1KSjvJkTfiOa4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nh7oV-008fsF-SL; Wed, 20 Apr 2022 10:43:59 +0000
Received: from mga07.intel.com ([134.134.136.100])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nh7oT-008fr7-8o
 for linux-mtd@lists.infradead.org; Wed, 20 Apr 2022 10:43:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650451437; x=1681987437;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=o5yT9UzNrraQ2tLA5o16WyRIH7hvHJDrSDqIy32sChE=;
 b=d44ngot+RX94LuIVGBzJ3m4CBBHp1kdUNMmRjD05d3sjJa0pBQYTyhLK
 LHhns5NEF5BNig52jplxdxJqwN837bcYrp26nPRmdRp8XCBzinOGjI65v
 QHw4pCS4+Hza+Q9HHfOX6wMabQmE8FNgy8HNDAuDJtIA1mY7qLYrPqs+C
 rsELIrLpw4uBiNM2tCObPnLm3XxCmFaT6llAhNSE09I23fb0/OhDP5r8C
 onabOlY5QHtF+5Fs0UgthBe1AM50xpygvkMlXTPsqz3DDssOqYxIGVRmQ
 +3U1UfG/OVkku8YgkucSd8h++99m2aGg5mvsgjjrsxNFvtduO2TbVxaLX g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10322"; a="326896756"
X-IronPort-AV: E=Sophos;i="5.90,275,1643702400"; d="scan'208";a="326896756"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2022 03:43:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,275,1643702400"; d="scan'208";a="626013234"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga004.fm.intel.com with ESMTP; 20 Apr 2022 03:43:51 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
 id 0FE40179; Wed, 20 Apr 2022 13:43:50 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Michael Walle <michael@walle.cc>, Pratyush Yadav <p.yadav@ti.com>,
 Hongli Li <hongli.li@intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: [PATCH v2] spi: intel: Implement dirmap hooks
Date: Wed, 20 Apr 2022 13:43:50 +0300
Message-Id: <20220420104350.19510-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_034357_391101_EAB18807 
X-CRM114-Status: GOOD (  13.61  )
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

Currently the driver goes over the supported opcodes list each time
->exec_op() is called and finds the suitable for the given operation.
This consumes unnecessary amount of CPU cycles because the operation is
always the same. For this reason populate dirmap hooks for the driver so
that we cache the selected operation and then simply call it on each
read/write.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
v1: https://lore.kernel.org/linux-spi/20220411113158.2037-2-mika.westerberg@linux.intel.com/

Changes from v1:

  * Fix build error by passing correct number of arguments to ->exec_op().

 drivers/spi/spi-intel.c | 49 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/drivers/spi/spi-intel.c b/drivers/spi/spi-intel.c
index 1bdb227e0ca2..50f42983b950 100644
--- a/drivers/spi/spi-intel.c
+++ b/drivers/spi/spi-intel.c
@@ -779,10 +779,59 @@ static const char *intel_spi_get_name(struct spi_mem *mem)
 	return dev_name(ispi->dev);
 }
 
+static int intel_spi_dirmap_create(struct spi_mem_dirmap_desc *desc)
+{
+	struct intel_spi *ispi = spi_master_get_devdata(desc->mem->spi->master);
+	const struct intel_spi_mem_op *iop;
+
+	iop = intel_spi_match_mem_op(ispi, &desc->info.op_tmpl);
+	if (!iop)
+		return -EOPNOTSUPP;
+
+	desc->priv = (void *)iop;
+	return 0;
+}
+
+static ssize_t intel_spi_dirmap_read(struct spi_mem_dirmap_desc *desc, u64 offs,
+				     size_t len, void *buf)
+{
+	struct intel_spi *ispi = spi_master_get_devdata(desc->mem->spi->master);
+	const struct intel_spi_mem_op *iop = desc->priv;
+	struct spi_mem_op op = desc->info.op_tmpl;
+	int ret;
+
+	/* Fill in the gaps */
+	op.addr.val = offs;
+	op.data.nbytes = len;
+	op.data.buf.in = buf;
+
+	ret = iop->exec_op(ispi, iop, &op);
+	return ret ? ret : len;
+}
+
+static ssize_t intel_spi_dirmap_write(struct spi_mem_dirmap_desc *desc, u64 offs,
+				      size_t len, const void *buf)
+{
+	struct intel_spi *ispi = spi_master_get_devdata(desc->mem->spi->master);
+	const struct intel_spi_mem_op *iop = desc->priv;
+	struct spi_mem_op op = desc->info.op_tmpl;
+	int ret;
+
+	op.addr.val = offs;
+	op.data.nbytes = len;
+	op.data.buf.out = buf;
+
+	ret = iop->exec_op(ispi, iop, &op);
+	return ret ? ret : len;
+}
+
 static const struct spi_controller_mem_ops intel_spi_mem_ops = {
 	.supports_op = intel_spi_supports_mem_op,
 	.exec_op = intel_spi_exec_mem_op,
 	.get_name = intel_spi_get_name,
+	.dirmap_create = intel_spi_dirmap_create,
+	.dirmap_read = intel_spi_dirmap_read,
+	.dirmap_write = intel_spi_dirmap_write,
 };
 
 #define INTEL_SPI_OP_ADDR(__nbytes)					\
-- 
2.35.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
