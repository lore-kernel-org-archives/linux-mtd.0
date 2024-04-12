Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D22EC04FF8
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Apr 2024 13:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ezXn1bemALGL/IxsjuHJwdXY+X6kH2tE5LjZnwaFj3c=; b=llrViJvwoosz9f
	KJNlO7rwrqtOesr8LF9rExqCseUpBd5LLWKUsxXLN1/8U9IsfzASe6wvKGNylDhjA8c231/DIdNpH
	EFCaWGEfwYzGfAaUULccgdqkkeTbPzL36RYtlvqwJNBWvVMExi++qollaNEuDQH8+OKnAtJUaAhzN
	kLZr9Iq4esy2Pu0qMWeX/Qah0p7fb/IrujXLBX/3fCBCZAS7nR3WMP6lQccW/oZ3dSMeEWZMporSK
	JQWtUF61nf92jXUTJ3Y64ki+pJ/wYjVJ7W1WPB1Gd8N3IN5a/qhKZb1SHOP3KuJbFhzEmxYqnEmt5
	pMbdfmyzmK9Eby9AmlPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvHCc-0000000HOJn-18ui;
	Fri, 12 Apr 2024 13:44:26 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvHCW-0000000HOFu-1umP
	for linux-mtd@lists.infradead.org;
	Fri, 12 Apr 2024 13:44:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C6A5ACE3914;
	Fri, 12 Apr 2024 13:44:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3FAAC32781;
	Fri, 12 Apr 2024 13:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712929458;
	bh=gKGUc/1cQbsMy5SwuoHZdZG4ZL+HCcopgsRqDXXZ9hs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZmzdkDDascJuxzR8+nPCVHl7jYh25K94DrpS2ELa323WyinpN/GBlZSskLtax//Wk
	 s3ApOWXuhhXGkqtOHgbpOGzG76/jpg99HGyYfTzNUDUez5VUwNNkPJQL9ITjCT4Fb0
	 jwO0sMyoWswWQEuYxKl8MA91tlMKrdMdlhJreZ30OMYFPZkRbsCdv3/mc2Usa5PTgK
	 6QdGoM+KYzLLu18GKoIZUJ8b0kkr9+VbyGosI4HSjCM4nQrqpI48ytJQln2dAsEy9i
	 DbWp9qDQn0yWKa9emz+6CUFnH0YF2PHuMELxp8MQS6ogbFAx/suSVPxzwi8foGTom1
	 M7cqGMUZ/mMjQ==
From: Michael Walle <mwalle@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	Michael Walle <mwalle@kernel.org>
Subject: [PATCH v1 2/6] mtd: spi-nor: get rid of non-power-of-2 page size handling
Date: Fri, 12 Apr 2024 15:44:01 +0200
Message-Id: <20240412134405.381832-3-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240412134405.381832-1-mwalle@kernel.org>
References: <20240412134405.381832-1-mwalle@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_064420_718294_F6EA612F 
X-CRM114-Status: GOOD (  14.53  )
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

The Xilinx flashes were the only user of the page sized that were no
power of 2. Support for them were dropped, thus we can also get rid of
the special page size handling for it.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/mtd/spi-nor/core.c | 27 +++++++++++----------------
 1 file changed, 11 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index cbe5f92eb0af..fb76e0522665 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2098,7 +2098,7 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 	size_t *retlen, const u_char *buf)
 {
 	struct spi_nor *nor = mtd_to_spi_nor(mtd);
-	size_t page_offset, page_remain, i;
+	size_t i;
 	ssize_t ret;
 	u32 page_size = nor->params->page_size;
 
@@ -2111,21 +2111,9 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 	for (i = 0; i < len; ) {
 		ssize_t written;
 		loff_t addr = to + i;
-
-		/*
-		 * If page_size is a power of two, the offset can be quickly
-		 * calculated with an AND operation. On the other cases we
-		 * need to do a modulus operation (more expensive).
-		 */
-		if (is_power_of_2(page_size)) {
-			page_offset = addr & (page_size - 1);
-		} else {
-			u64 aux = addr;
-
-			page_offset = do_div(aux, page_size);
-		}
+		size_t page_offset = addr & (page_size - 1);
 		/* the size of data remaining on the first page */
-		page_remain = min_t(size_t, page_size - page_offset, len - i);
+		size_t page_remain = min_t(size_t, page_size - page_offset, len - i);
 
 		addr = spi_nor_convert_addr(nor, addr);
 
@@ -3054,7 +3042,14 @@ static int spi_nor_init_params(struct spi_nor *nor)
 		spi_nor_init_params_deprecated(nor);
 	}
 
-	return spi_nor_late_init_params(nor);
+	ret = spi_nor_late_init_params(nor);
+	if (ret)
+		return ret;
+
+	if (WARN_ON(!is_power_of_2(nor->params->page_size)))
+		return -EINVAL;
+
+	return 0;
 }
 
 /** spi_nor_set_octal_dtr() - enable or disable Octal DTR I/O.
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
