Return-Path: <SRS0=Vrwx=JK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB191C43460
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Apr 2021 12:05:28 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69A3461222
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Apr 2021 12:05:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 69A3461222
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=x5Mhjg0vzf7FZuWRDxgxkUXYO5rl7L5ci9bPuWLc2sQ=; b=MttBcOpWoXqJMFESpe2PGnF9r9
	U4RwcCfP9jZ3S4iOeD+MXXYBnFYC42AXrCoasrYy+AloqNhaVZ9E16QSwVR1THn0AGDCM3L5zrM/l
	QN+DaJ6H9JaYyE+LRi5L1qmaftfMrGj28XMCvJtJ1U47G5L9bT14o979Qg8d5AZXhlhZDrZ9gd7hL
	hvy2hohqCVlQ6T5BFbSXeic3S9oNHJIgjjN4Yqz3wc8FYzeFuL75m+lkh1+x6Ej3CzrMOnC0n/7uu
	KKd30/WxrjqKbYZSebG4te5NWvtUVW4phsPA5pqAtjHBz0GxUQbdhWhh30E7qYLNuykBzbNwqHLhE
	EvKesBqg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWHlz-009AIt-Qh; Tue, 13 Apr 2021 12:04:04 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWHkK-0099zG-AT
 for linux-mtd@desiato.infradead.org; Tue, 13 Apr 2021 12:02:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=43U774HFHYflbPQdqOHAW3OVnrmdMQMR7y/I+ghE8Cg=; b=V4yzZWtKxj4k7SBkTjrS18npUd
 QaEI9VPYKyB6Dz1XEF15QeW6OnZtPltl0y20l2QZfjm4PNfPfFQZj7OmBu3e073swVcV1DJbjWEnV
 MjYNnoRY5WlqlJd98ZWnX2Tir1KcjoQ+umM09xEoYRcSh+d8yjT5C2NVNFxuUiD4bAHuTJTt4QghS
 Rbf6YZeqfD3zaWSZ7+wWXPin6pfLjA0pg+A6CfWRt1+KACBoSdkgn7h2D8GvRZa1fPjbQRWG/ucyQ
 dk7koVWL1FyTTdZZKiC1/fmHPyhauMmrQ1OW3oJcgQxspfPb7tnNv6yZSrvuJONrVcRGEoDnF5OHg
 yGvbTbZw==;
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWHkH-0070Fr-Cx
 for linux-mtd@lists.infradead.org; Tue, 13 Apr 2021 12:02:19 +0000
Received: by mail-pf1-x431.google.com with SMTP id i190so11268879pfc.12
 for <linux-mtd@lists.infradead.org>; Tue, 13 Apr 2021 05:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=43U774HFHYflbPQdqOHAW3OVnrmdMQMR7y/I+ghE8Cg=;
 b=Z7j7DCZKXLddsX2fqj/zX3WzQ5l5zPPGKjSr1HnCVr095YpcTxwE2E9BJl2rqO8vuI
 jn0nv8/r5goPmqCmgC49hS4cnXFuntnRi6C2Okh3IFuHo3wUYkksDpOIE1d+/Raj8nAm
 WjH93riEfnHZCouhf13N+IAxB7oqX7jhyjTlE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=43U774HFHYflbPQdqOHAW3OVnrmdMQMR7y/I+ghE8Cg=;
 b=ODCSoRVrpzOWNNZw+sESfXWOHuxqZm05ZT5v13m5/eObxNWBrIUo2wdtNo+Q79t7Mn
 xsEQxbVpFx0L6FH627ygnIWWXlbjpgciVFDRxf8wzozXPNm5xUTKayvKtRpeEsSx+Fpx
 Lxyua/n/USE0ySFKoD5njLpHaqi/BvHem9Ds0ABkFfYjYwxLfsGywLqYYx32mUdqTFEP
 hfciwq4X51iu8zE9BRVFLqBH/fAfQ4BR/vpDppD0GQ+3Whgsr3/tCTYkft1CVZgX8pxu
 27htCwM3ohSlbz7vmDHKjQmg6exNXwHOMzn+8jKSao22GXQNHrbdgcy758Eppqj0Ct3M
 J/nw==
X-Gm-Message-State: AOAM530cOcaaomZaE2RgJz3/SEwJbQB74SQsiJRzsMalPENLiKGIQuSv
 8WV46z4cXjKvEDKT9Zh3V9uoE1AtTuRfOA==
X-Google-Smtp-Source: ABdhPJwRUSJwBr95cQTeg64Q0dvGduBBNUuNPb62QCZ/Zzo6SJwiFeI4tdnSMPCFghGczizW+gppRg==
X-Received: by 2002:a65:5b85:: with SMTP id i5mr30812637pgr.269.1618315335258; 
 Tue, 13 Apr 2021 05:02:15 -0700 (PDT)
Received: from ikjn-p920.tpe.corp.google.com
 ([2401:fa00:1:b:f18a:a81b:ae0c:64f8])
 by smtp.gmail.com with ESMTPSA id d13sm14522058pgb.6.2021.04.13.05.02.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 05:02:14 -0700 (PDT)
From: Ikjoon Jang <ikjn@chromium.org>
To: linux-mtd@lists.infradead.org
Cc: Ikjoon Jang <ikjn@chromium.org>, Michael Walle <michael@walle.cc>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Pratyush Yadav <p.yadav@ti.com>,
 Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: spi-nor: macronix: Add block protection support to
 mx25u6435f
Date: Tue, 13 Apr 2021 20:02:10 +0800
Message-Id: <20210413120210.3671536-1-ikjn@chromium.org>
X-Mailer: git-send-email 2.31.1.295.g9ea45b61b8-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210413_050217_481033_16A445CB 
X-CRM114-Status: GOOD (  21.58  )
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

This patch adds block protection support to Macronix mx25u6432f and
mx25u6435f. Two different chips share the same JEDEC ID while only
mx25u6423f support section protections. And two chips have slightly
different definitions of BP bits than generic (ST Micro) implementation.

So this patch defines a new spi_nor_locking_ops only for macronix
until this could be merged into a generic swp implementation.

Signed-off-by: Ikjoon Jang <ikjn@chromium.org>

---

 drivers/mtd/spi-nor/macronix.c | 193 ++++++++++++++++++++++++++++++++-
 1 file changed, 192 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index 42c2cf31702e..563005830e46 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -8,6 +8,195 @@
 
 #include "core.h"
 
+/*
+ * mx25u6435f/mx25u6432f common protection table:
+ *
+ * mx25u6432f has T/B bit, but mx25u6435f doesn't.
+ * while both chips have the same JEDEC ID,
+ * Also BP bits are slightly different with generic swp.
+ * So here we only use common part of the BPs definitions.
+ *
+ * - Upper 2^(Prot Level - 1) blocks are protected.
+ * - Block size is hardcoded as 64Kib.
+ * - Assume T/B is always 0 (top protected, factory default).
+ *
+ *   BP3| BP2 | BP1 | BP0 | Prot Level
+ *  -----------------------------------
+ *    0 |  0  |  0  |  0  |  NONE
+ *    0 |  0  |  0  |  1  |  1
+ *    0 |  0  |  1  |  0  |  2
+ *    0 |  0  |  1  |  1  |  3
+ *    0 |  1  |  0  |  0  |  4
+ *    0 |  1  |  0  |  1  |  5
+ *    0 |  1  |  1  |  0  |  6
+ *    0 |  1  |  1  |  1  |  7
+ *   .....................|  differ by 35f/32f, not used
+ *    1 |  1  |  1  |  1  |  ALL
+ */
+
+#define MX_BP_MASK	(SR_BP0 | SR_BP1 | SR_BP2 | SR_BP3)
+#define MX_BP_SHIFT	(SR_BP_SHIFT)
+
+static int mx_get_locked_len(struct spi_nor *nor, u8 sr, uint64_t *lock_len)
+{
+	struct mtd_info *mtd = &nor->mtd;
+	u8 bp;
+
+	bp = (sr & MX_BP_MASK) >> MX_BP_SHIFT;
+
+	if (bp == 0xf) {
+		/* protected all */
+		*lock_len = mtd->size;
+		return 0;
+	}
+
+	/* sorry, not yet supported */
+	if (bp > 0x7)
+		return -EOPNOTSUPP;
+
+	/* block size = 64Kib */
+	*lock_len = bp ? (0x8000 << bp) : 0;
+	return 0;
+}
+
+static int mx_set_prot_level(struct spi_nor *nor, uint64_t lock_len, u8 *sr)
+{
+	uint64_t new_len;
+	u8 new_lvl;
+
+	if (lock_len) {
+		/* 64Kib block size harcoded */
+		new_lvl = ilog2(lock_len) - 15;
+		new_len = 1ULL << (15 + new_lvl);
+
+		if (new_len != lock_len)
+			return -EINVAL;
+	} else {
+		new_lvl = 0;
+	}
+
+	*sr &= ~MX_BP_MASK;
+	*sr |= (new_lvl) << MX_BP_SHIFT;
+
+	return 0;
+}
+
+static int mx_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
+{
+	struct mtd_info *mtd = &nor->mtd;
+	int ret;
+	uint64_t lock_len;
+	u8 sr;
+
+	ret = spi_nor_read_sr(nor, nor->bouncebuf);
+	if (ret)
+		return ret;
+
+	sr = nor->bouncebuf[0];
+
+	/* always 'top' protection */
+	if ((ofs + len) != mtd->size)
+		return -EINVAL;
+
+	ret = mx_get_locked_len(nor, sr, &lock_len);
+	if (ret)
+		return ret;
+
+	/* already locked? */
+	if (len <= lock_len)
+		return 0;
+
+	ret = mx_set_prot_level(nor, len, &sr);
+	if (ret)
+		return ret;
+
+	/* Disallow further writes if WP pin is asserted */
+	sr |= SR_SRWD;
+
+	return spi_nor_write_sr_and_check(nor, sr);
+}
+
+static int mx_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
+{
+	struct mtd_info *mtd = &nor->mtd;
+	int ret;
+	uint64_t lock_len;
+	u8 sr;
+
+	if ((ofs + len) > mtd->size)
+		return -EINVAL;
+
+	ret = spi_nor_read_sr(nor, nor->bouncebuf);
+	if (ret)
+		return ret;
+
+	sr = nor->bouncebuf[0];
+
+	ret = mx_get_locked_len(nor, sr, &lock_len);
+	if (ret)
+		return ret;
+
+	/* already unlocked? */
+	if ((ofs + len) <= (mtd->size - lock_len))
+		return 0;
+
+	/* can't make a hole in a locked region */
+	if (ofs > (mtd->size - lock_len))
+		return -EINVAL;
+
+	lock_len = mtd->size - ofs - len;
+	ret = mx_set_prot_level(nor, lock_len, &sr);
+	if (ret)
+		return ret;
+
+	/* Don't protect status register if we're fully unlocked */
+	if (lock_len == 0)
+		sr &= ~SR_SRWD;
+
+	return spi_nor_write_sr_and_check(nor, sr);
+}
+
+static int mx_is_locked(struct spi_nor *nor, loff_t ofs, uint64_t len)
+{
+	struct mtd_info *mtd = &nor->mtd;
+	int ret;
+	uint64_t lock_len;
+	u8 sr;
+
+	if ((ofs + len) > mtd->size)
+		return -EINVAL;
+
+	if (!len)
+		return 0;
+
+	ret = spi_nor_read_sr(nor, nor->bouncebuf);
+	if (ret)
+		return ret;
+
+	sr = nor->bouncebuf[0];
+
+	ret = mx_get_locked_len(nor, sr, &lock_len);
+	if (ret)
+		return ret;
+
+	return (ofs >= (mtd->size - lock_len)) ? 1 : 0;
+}
+
+static const struct spi_nor_locking_ops mx_locking_ops = {
+	.lock		= mx_lock,
+	.unlock		= mx_unlock,
+	.is_locked	= mx_is_locked,
+};
+
+static void mx_default_init(struct spi_nor *nor)
+{
+	nor->params->locking_ops = &mx_locking_ops;
+}
+
+static const struct spi_nor_fixups mx_locking_fixups = {
+	.default_init = mx_default_init,
+};
+
 static int
 mx25l25635_post_bfpt_fixups(struct spi_nor *nor,
 			    const struct sfdp_parameter_header *bfpt_header,
@@ -48,7 +237,9 @@ static const struct flash_info macronix_parts[] = {
 			      SPI_NOR_QUAD_READ) },
 	{ "mx25u4035",   INFO(0xc22533, 0, 64 * 1024,   8, SECT_4K) },
 	{ "mx25u8035",   INFO(0xc22534, 0, 64 * 1024,  16, SECT_4K) },
-	{ "mx25u6435f",  INFO(0xc22537, 0, 64 * 1024, 128, SECT_4K) },
+	{ "mx25u6435f",  INFO(0xc22537, 0, 64 * 1024, 128,
+			      SECT_4K | SPI_NOR_HAS_LOCK)
+		.fixups = &mx_locking_fixups },
 	{ "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256, SECT_4K) },
 	{ "mx25l12855e", INFO(0xc22618, 0, 64 * 1024, 256, 0) },
 	{ "mx25r1635f",  INFO(0xc22815, 0, 64 * 1024,  32,
-- 
2.31.1.295.g9ea45b61b8-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
