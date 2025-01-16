Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B053CC02183
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Jan 2025 09:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Sn+GebB8+EK8BqU3qpBK56xAMvDbvwdaTDzWcrph5xY=; b=azqgyyl1eCvz3k
	u5S1PSlbUidOCk4jrYwWT24hX6t3xy3suehcOvqx9gRZtD7oI2Yqwqg2Cxc42JNtOp6GxXG1Afre7
	jO8K23s/K4kRiExM+uPXx0XFs/MqSAyKux6Gq0a1a20pxtU0/WwN+tH8HLK8lmp6dxKL1guoe8/RD
	vGCb2FG1fCvm4v/s4mlycIq3QwocZDyN/98mTknpEgARX5tDGDcHYUFMi6YtnXcaTnfMf/vOPblYv
	+uRDafRWCeTxGEqvD1/PQAlb6yvdAatnMOUN2auVlNYcyVhXooFx0WE/NFjKFRtz9wja9MQ85Z+lz
	t8XwBdn3pRYaWVsHUB3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYMID-0000000ENsG-0El6;
	Thu, 16 Jan 2025 09:36:01 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYMHk-0000000ENmf-3rN2
	for linux-mtd@lists.infradead.org;
	Thu, 16 Jan 2025 09:35:34 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 571851C000C;
	Thu, 16 Jan 2025 09:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737020130;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TPqM1t1LhlpUfdb6iFFni2K1QDgDbd8vcjh2/lHZ8J8=;
	b=brBOlKg4ezE4ZhYbU6ykapcErIHPXc/0VJuAbx3HogHr60yS8Vg+Ui9CxRGyG3MFbiVM2T
	2272LugrA8PaYtdC2wPwFex5qii2qOnxOEAPGMVTH9BbZnNt5xbt6UjdeBd6NQLQ2vr7E2
	YqQcFff+LIF4URrhkLkDcceJTv6CjLuRD7NeukAOaHeSon8TISX9g5l3xAlO8xfzVk3u9L
	qyVBl7XEYQaM9mXssWQZEwF4LzsmaDRgt7KBoYUShMKP47FyDk94MMgg5zS3QmTfvDxTe9
	MaRywfFD+fq3LL5qXgNaofsV3bqfwDDluS5iHg/rpPswY3Y5dP7CVmmuKPkMcg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Steam Lin <stlin2@winbond.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	kernel test robot <lkp@intel.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH] mtd: spinand: skyhigh: Align with recent read from cache variant changes
Date: Thu, 16 Jan 2025 10:35:27 +0100
Message-ID: <20250116093527.472648-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_013533_248944_9B8903EC 
X-CRM114-Status: UNSURE (   9.47  )
X-CRM114-Notice: Please train this message.
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

The SPINAND_PAGE_READ_FROM_CACHE_OP macro has just been changed to stop
encoding the "fast" parameter (the macro has been duplicated and
renamed). The Skyhigh driver is new and is still using the old style
macro.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202501161302.bQqBGjJ5-lkp@intel.com/
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/linux-kernel/20250116132010.4948547d@canb.auug.org.au/
Fixes: 042087247835d ("mtd: spinand: Create distinct fast and slow read from cache variants")
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/skyhigh.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/spi/skyhigh.c b/drivers/mtd/nand/spi/skyhigh.c
index 8b32b74ff34b7..961df0d74984a 100644
--- a/drivers/mtd/nand/spi/skyhigh.c
+++ b/drivers/mtd/nand/spi/skyhigh.c
@@ -21,8 +21,8 @@ static SPINAND_OP_VARIANTS(read_cache_variants,
 		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_DUALIO_OP(0, 2, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
-		SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0),
-		SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, 0));
+		SPINAND_PAGE_READ_FROM_CACHE_FAST_OP(0, 1, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_OP(0, 1, NULL, 0));
 
 static SPINAND_OP_VARIANTS(write_cache_variants,
 		SPINAND_PROG_LOAD_X4(true, 0, NULL, 0),
-- 
2.47.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
