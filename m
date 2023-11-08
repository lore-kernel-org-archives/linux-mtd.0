Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1396C4167D
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Nov 2023 09:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lilvUH2DflOpxw0J341vezK1vO65mGmerUx4jqLsDNg=; b=GCEmqarrVmxlTx
	fyOlqd5XICp1nfALFIVgMlBZJGZxBu9iMk+EpCGgYa8Sk7vZ5zseMNUot4JAEaFTgOoSeBvLmj+5S
	kpZPhQFcTfsP3g4hv6DVfe95QxEDGun82+Mh0ouMxAAd+BoTjPLVBO7IhpDSUmmH5ZB2grAnfD/8G
	E/xwRIKmxoIyercichGnX+T4iovXjRDihz+xfP1oU/bvbhGBWKv+DgqVNtaY4yQ2f6Vdc3Ubs98XI
	yD065kz3f64MIdgXYxOaM7JK3QsBYmcquOvH8ZkJAT9E70dLzyD4JUq+ovG8waOmohkXRU8mrH6kO
	LUrWNDKPKVebPBwOdtyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0f5c-003Nk4-0L;
	Wed, 08 Nov 2023 09:43:12 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0f5X-003Niy-2D
	for linux-mtd@lists.infradead.org;
	Wed, 08 Nov 2023 09:43:09 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-507e85ebf50so8301144e87.1
        for <linux-mtd@lists.infradead.org>; Wed, 08 Nov 2023 01:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699436585; x=1700041385; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=NNgNeA+u/JG3dEDGHsCnM23bBRNPsNNIJ7v/48PUAqU=;
        b=Qxnkrg+6qjvlhN48I4ZLq7vbsxObB7iOzh4Te3ffx3xDCIpXAkobJSN5C5CCb7al0I
         YyiIE1197gERWDJK7EiJk7i40iYh2f1dKTsbsxVQs8SufJ53jV0hnZ/naz1V3pOjo/gd
         9tX39wVnwEkyU2dEfgrVR6IzqiJnghV1quKxDFCLO107UgZ2jlg3Eu5i9Z+Jzv+n8d0z
         +uCIFgirPyo6w4VLWG4zNydoYbBLSFWe0lVE5/N9d16qBd8pbMOjkHOl1MiBRTZONVse
         hR4cLo0MxfPLSuCpAQAuXsWH6q3DMsNTh/yXc6ns6eaNg49zd1Vb9FG4GFrK8MLUz6re
         9fAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699436585; x=1700041385;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NNgNeA+u/JG3dEDGHsCnM23bBRNPsNNIJ7v/48PUAqU=;
        b=rA+Ari6ts5DecUpUPdm7zJEPEKKpCwCNemItbyvYjbvS5Yy9gUAiNxYf3ndNBmJuG0
         ql+q09ckbVQFvG58sGgvPVUr+hgJjLNcXi4Ie9JIj0teF6Th+/atr6DVjec3GgqZ/f8k
         jWsdpqsJz9CSc/B7RohiCBQsdDx3zoWP2UiELpKRStTwdrfXWvtA/Oehe5s0Y42iOrC+
         m0VVM/vBx2mjdMnMLi6CHaZnvLpswyH6EfV/utskwqtDOOP1t5fOkLTU0yjabJoN0+nE
         tt58EInb2VmZBU6+GYK3OgAOy9Ozm3UZUVmA7CfZGpyGjja0l3DQ3UtUoG3GrfU7GxFO
         NJdw==
X-Gm-Message-State: AOJu0YwxLHYAwJQ+ykeGB3YoSoyNS2HLJxzv+0MtewhrbbK7smvMObVy
	SPerJ+xGTpwr69DDwNMdcSA=
X-Google-Smtp-Source: AGHT+IFRUyOnJMY5kv/BmZ5a7xXVG9PzwlcBzcVJUddNpWTxLnFR2m9649vH9tJ19JapgSjvwUH32g==
X-Received: by 2002:ac2:5edb:0:b0:4f8:77db:1d9e with SMTP id d27-20020ac25edb000000b004f877db1d9emr823229lfq.12.1699436585110;
        Wed, 08 Nov 2023 01:43:05 -0800 (PST)
Received: from localhost ([195.13.248.78])
        by smtp.gmail.com with ESMTPSA id u3-20020a05651206c300b00501c51ab085sm622510lff.60.2023.11.08.01.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 01:43:04 -0800 (PST)
From: AceLan Kao <acelan.kao@canonical.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Dhruva Gole <d-gole@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/2] spi: Replace -ENOTSUPP with -EOPNOTSUPP in op checking
Date: Wed,  8 Nov 2023 17:43:02 +0800
Message-Id: <20231108094303.46303-1-acelan.kao@canonical.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_014307_723922_79FE3A2E 
X-CRM114-Status: GOOD (  17.15  )
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

From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>

No functional changes are introduced by this patch; it's a code cleanup
to use the correct error code.

Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>

---
v5. distinguish -EOPNOTSUPP from -ENOTSUPP
---
 drivers/mtd/nand/spi/core.c | 2 +-
 drivers/spi/atmel-quadspi.c | 2 +-
 drivers/spi/spi-ath79.c     | 2 +-
 drivers/spi/spi-bcm-qspi.c  | 2 +-
 drivers/spi/spi-mem.c       | 6 +++---
 drivers/spi/spi-npcm-fiu.c  | 2 +-
 drivers/spi/spi-ti-qspi.c   | 4 ++--
 drivers/spi/spi-wpcm-fiu.c  | 2 +-
 8 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 393ff37f0d23..d1df5cd401cf 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -973,7 +973,7 @@ static int spinand_manufacturer_match(struct spinand_device *spinand,
 		spinand->manufacturer = manufacturer;
 		return 0;
 	}
-	return -ENOTSUPP;
+	return -EOPNOTSUPP;
 }
 
 static int spinand_id_detect(struct spinand_device *spinand)
diff --git a/drivers/spi/atmel-quadspi.c b/drivers/spi/atmel-quadspi.c
index 3d1252566134..370c4d1572ed 100644
--- a/drivers/spi/atmel-quadspi.c
+++ b/drivers/spi/atmel-quadspi.c
@@ -272,7 +272,7 @@ static int atmel_qspi_find_mode(const struct spi_mem_op *op)
 		if (atmel_qspi_is_compatible(op, &atmel_qspi_modes[i]))
 			return i;
 
-	return -ENOTSUPP;
+	return -EOPNOTSUPP;
 }
 
 static bool atmel_qspi_supports_op(struct spi_mem *mem,
diff --git a/drivers/spi/spi-ath79.c b/drivers/spi/spi-ath79.c
index c9f1d1e1dcf7..b7ada981464a 100644
--- a/drivers/spi/spi-ath79.c
+++ b/drivers/spi/spi-ath79.c
@@ -146,7 +146,7 @@ static int ath79_exec_mem_op(struct spi_mem *mem,
 	/* Only use for fast-read op. */
 	if (op->cmd.opcode != 0x0b || op->data.dir != SPI_MEM_DATA_IN ||
 	    op->addr.nbytes != 3 || op->dummy.nbytes != 1)
-		return -ENOTSUPP;
+		return -EOPNOTSUPP;
 
 	/* disable GPIO mode */
 	ath79_spi_wr(sp, AR71XX_SPI_REG_FS, 0);
diff --git a/drivers/spi/spi-bcm-qspi.c b/drivers/spi/spi-bcm-qspi.c
index ef08fcac2f6d..d96222e6d7d2 100644
--- a/drivers/spi/spi-bcm-qspi.c
+++ b/drivers/spi/spi-bcm-qspi.c
@@ -1199,7 +1199,7 @@ static int bcm_qspi_exec_mem_op(struct spi_mem *mem,
 
 	if (!op->data.nbytes || !op->addr.nbytes || op->addr.nbytes > 4 ||
 	    op->data.dir != SPI_MEM_DATA_IN)
-		return -ENOTSUPP;
+		return -EOPNOTSUPP;
 
 	buf = op->data.buf.in;
 	addr = op->addr.val;
diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
index edd7430d4c05..2dc8ceb85374 100644
--- a/drivers/spi/spi-mem.c
+++ b/drivers/spi/spi-mem.c
@@ -323,7 +323,7 @@ int spi_mem_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
 		return ret;
 
 	if (!spi_mem_internal_supports_op(mem, op))
-		return -ENOTSUPP;
+		return -EOPNOTSUPP;
 
 	if (ctlr->mem_ops && ctlr->mem_ops->exec_op && !spi_get_csgpiod(mem->spi, 0)) {
 		ret = spi_mem_access_start(mem);
@@ -339,7 +339,7 @@ int spi_mem_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
 		 * read path) and expect the core to use the regular SPI
 		 * interface in other cases.
 		 */
-		if (!ret || ret != -ENOTSUPP)
+		if (!ret || ret != -ENOTSUPP || ret != -EOPNOTSUPP)
 			return ret;
 	}
 
@@ -559,7 +559,7 @@ spi_mem_dirmap_create(struct spi_mem *mem,
 	if (ret) {
 		desc->nodirmap = true;
 		if (!spi_mem_supports_op(desc->mem, &desc->info.op_tmpl))
-			ret = -ENOTSUPP;
+			ret = -EOPNOTSUPP;
 		else
 			ret = 0;
 	}
diff --git a/drivers/spi/spi-npcm-fiu.c b/drivers/spi/spi-npcm-fiu.c
index 03db9f016a11..f3bb8bbc192f 100644
--- a/drivers/spi/spi-npcm-fiu.c
+++ b/drivers/spi/spi-npcm-fiu.c
@@ -556,7 +556,7 @@ static int npcm_fiu_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
 		op->data.nbytes);
 
 	if (fiu->spix_mode || op->addr.nbytes > 4)
-		return -ENOTSUPP;
+		return -EOPNOTSUPP;
 
 	if (fiu->clkrate != chip->clkrate) {
 		ret = clk_set_rate(fiu->clk, chip->clkrate);
diff --git a/drivers/spi/spi-ti-qspi.c b/drivers/spi/spi-ti-qspi.c
index 4c81516b67db..0877dc5058a1 100644
--- a/drivers/spi/spi-ti-qspi.c
+++ b/drivers/spi/spi-ti-qspi.c
@@ -613,12 +613,12 @@ static int ti_qspi_exec_mem_op(struct spi_mem *mem,
 	/* Only optimize read path. */
 	if (!op->data.nbytes || op->data.dir != SPI_MEM_DATA_IN ||
 	    !op->addr.nbytes || op->addr.nbytes > 4)
-		return -ENOTSUPP;
+		return -EOPNOTSUPP;
 
 	/* Address exceeds MMIO window size, fall back to regular mode. */
 	from = op->addr.val;
 	if (from + op->data.nbytes > qspi->mmap_size)
-		return -ENOTSUPP;
+		return -EOPNOTSUPP;
 
 	mutex_lock(&qspi->list_lock);
 
diff --git a/drivers/spi/spi-wpcm-fiu.c b/drivers/spi/spi-wpcm-fiu.c
index 852ffe013d32..d76f7b5a9b97 100644
--- a/drivers/spi/spi-wpcm-fiu.c
+++ b/drivers/spi/spi-wpcm-fiu.c
@@ -361,7 +361,7 @@ static int wpcm_fiu_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
 
 	wpcm_fiu_stall_host(fiu, false);
 
-	return -ENOTSUPP;
+	return -EOPNOTSUPP;
 }
 
 static int wpcm_fiu_adjust_op_size(struct spi_mem *mem, struct spi_mem_op *op)
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
