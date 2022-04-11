Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA65AC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Apr 2022 11:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h8I2mAVeqmswfaYAa7VAj+1k1K7TJkKVXQFqDL97yiY=; b=W1BTlxC13pHUNu
	oaY2+VDg1WosibJJeCeCyYMg8zR7Tikj+FdBUJllvnLsWjZh7ia/+//2DvbGZW0rbTNnJfRU3tKXS
	rHEnotwQfoqWp+BhnCPvAB3J8ACByffMj36Fs8WlyE/VZ0NA7KcxEuwaUXWXLWbk+3pT2lRyyUr+r
	VfOtJ+xPFpEUSbIYKClhOe40dL1Ktdous5pVwlfvScdL9MoXL1exStHs6SjPMnJdRORWsBfYYzb6z
	ZC/oZdw13iurAgiC+Ym9cmOQlvCLTIJKBOhY/tKPN36W2NJXT9K7Qr5PKDS4XeVpEQ13MsYAkrezx
	lrhYbyLC4+p5V+oCH7xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndsH8-008iHO-IS; Mon, 11 Apr 2022 11:32:06 +0000
Received: from mga12.intel.com ([192.55.52.136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndsH5-008iEn-8b
 for linux-mtd@lists.infradead.org; Mon, 11 Apr 2022 11:32:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649676723; x=1681212723;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PV29Orv9pBDJt8XEvCOh3NTUHG4PLQEFzrylRgRophk=;
 b=Ow+r5ag9auWq6T9SsB2iJDxCnSpgV6s67Hqw0nr/GevWGNTYwK4+yPvm
 vQJ92N8fK7OvEXtfk+ldEGt37Zii3OyopY3O6qRZ0oGVXLoqpqTXfHPsR
 SPhPC7zl3DCsQcGWfvZ2FgdA0TPvXzA1u/UAvIrIe0me68s3gnlAGidA/
 qpj3LF7hIuuEacYv4RMnAMrJry7EdLDj0ryp5A8MNUbHEGkeobG6lVuK3
 0Ke1H1pnYeO6/nAaH6vQ4JOyGIoNJklTw+geRo1+yx8cEu9FO+7Pofqvm
 MRNP7NFPVcnrXLxZXs3yvrXaZa5r44P+CE982bszfdwl6wHireWdgXK9y w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10313"; a="242029846"
X-IronPort-AV: E=Sophos;i="5.90,251,1643702400"; d="scan'208";a="242029846"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 04:32:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,251,1643702400"; d="scan'208";a="572083694"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga008.jf.intel.com with ESMTP; 11 Apr 2022 04:31:58 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
 id 81975144; Mon, 11 Apr 2022 14:31:58 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Michael Walle <michael@walle.cc>, Pratyush Yadav <p.yadav@ti.com>,
 Hongli Li <hongli.li@intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: [PATCH 2/2] spi: intel: Implement dirmap hooks
Date: Mon, 11 Apr 2022 14:31:58 +0300
Message-Id: <20220411113158.2037-2-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220411113158.2037-1-mika.westerberg@linux.intel.com>
References: <20220411113158.2037-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_043203_353287_227A917A 
X-CRM114-Status: GOOD (  12.36  )
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
 drivers/spi/spi-intel.c | 49 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/drivers/spi/spi-intel.c b/drivers/spi/spi-intel.c
index 1bdb227e0ca2..43c3ddced86d 100644
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
+	ret = iop->exec_op(ispi, desc->mem, iop, &op);
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
+	ret = iop->exec_op(ispi, desc->mem, iop, &op);
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
