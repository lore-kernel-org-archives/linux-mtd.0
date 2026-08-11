Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01861C5CFC1
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Aug 2026 08:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C/sl/85Pex9mLsAmtxNa2JmVxuCSSfM4xGr9Q9ojHBE=; b=SAOGdI0i8Y03BX
	+pK8UbLdv0ZO0MXTAMXdpVPwKMi5gafaF5I00Awh51mVZ3Vy2YTpPtO+IrE45S6wZhk7oV8UvpNjW
	U0+m9B2Lcfu6WBjp86MlIM1CmyzwDGdfmVT2TVhhAzGzCn8j5O5xhj3A8EigAOaqs8Uvb+ZupVEdK
	cxgdid3QRqft1sH94XzJzpFqeLaZE6pLF+XSVOz5nGypbOxzOX7uHkWwe+wP6+RuOaicPQhYrm0c8
	GDTNKN2uZdi4RQFpURA4+1OS2eBno+m0FUoqWRIYADF2ILGtNKRH7Ay886gmFfYHqq92Y3sY6QcO0
	LsgSUtPn4Bv/0tPcOjPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wthtS-0000000Dbne-3ijw;
	Tue, 11 Aug 2026 08:31:30 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wthtQ-0000000Dbn8-0Cl1
	for linux-mtd@lists.infradead.org;
	Tue, 11 Aug 2026 08:31:30 +0000
Received: from PC-202605011814.localdomain (unknown [222.191.246.242])
	by smtp.qiye.163.com (Hmail) with ESMTP id 498cc46c1;
	Tue, 11 Aug 2026 16:31:17 +0800 (GMT+08:00)
From: Runyu Xiao <runyu.xiao@seu.edu.cn>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	runyu.xiao@seu.edu.cn,
	jianhao.xu@seu.edu.cn
Subject: [PATCH v3] mtd: spi-nor: use guard() in spi_nor_rww_start_exclusive
Date: Tue, 11 Aug 2026 16:31:11 +0800
Message-Id: <20260811083111.403453-1-runyu.xiao@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260811041349.333176-1-runyu.xiao@seu.edu.cn>
References: <20260811041349.333176-1-runyu.xiao@seu.edu.cn>
MIME-Version: 1.0
X-HM-Tid: 0a9feff2880903a1kunmefe39414d7ca4
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCSBkdVhhCGE9KT0tIHR1ITVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUlVSkJKVUlPTVVJT0lZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pPSExVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=PF1Rb1sA3ShyJ+G10WSaZ3RLTvm7dIzLN2f+XE1+92ZQMohgm/yHrbtR+lV6rfYta9lleRPHQZn60p8Vlo04iQPXDT0ufxDViLwiJE9SSJ4Nrkqxo7g9aFm12zuMHF2cZzOjQAtBw4A21VXsKqyOcwKdEAOTA/6u/nxEz6fMGmg=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=1B3HkixR4JIMuhN8lZdHL+sI1WrlOm70bK7D3bmLLq4=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_013129_076007_BFE80D30 
X-CRM114-Status: GOOD (  10.70  )
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

Commit 03e7bb864d9a ("mtd: spi-nor: use scope-based mutex cleanup
helpers") converted the RWW start helpers to scoped mutex cleanup, but
left spi_nor_rww_start_exclusive() using a plain mutex_lock().

spi_nor_rww_start_exclusive() is used as a wait_event_killable()
condition. When it returns false on the busy path, the raw mutex_lock()
leaves nor->lock held and blocks the operation that must clear the RWW
state in spi_nor_rww_end_exclusive().

Use guard(mutex) here as well so this helper matches the other RWW
start helpers and releases nor->lock on the false return path.

Fixes: 03e7bb864d9a ("mtd: spi-nor: use scope-based mutex cleanup helpers")
Cc: stable@vger.kernel.org
Signed-off-by: Runyu Xiao <runyu.xiao@seu.edu.cn>
---
Changes in v3:
- Reframe the changelog around the scoped-helper conversion that missed
  spi_nor_rww_start_exclusive().

Changes in v2:
- Replace the analysis-style explanation with a short maintainer-facing
  description of the busy-path lock hold.
- Keep the fix focused on using guard(mutex) so the mutex is released on
  both paths.

drivers/mtd/spi-nor/core.c | 2 +-
1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index ccf4396cdcd0..8bc117b46e02 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1310,7 +1310,7 @@ static bool spi_nor_rww_start_exclusive(struct spi_nor *nor)
 {
 	struct spi_nor_rww *rww = &nor->rww;
 
-	mutex_lock(&nor->lock);
+	guard(mutex)(&nor->lock);
 
 	if (rww->ongoing_io || rww->ongoing_rd || rww->ongoing_pe)
 		return false;
-- 
2.34.1

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
