Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F712C5AC80
	for <linux-mtd@archiver.kernel.org>; Sun,  9 Aug 2026 08:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iLoaM8nz5P3qkZKnkoqVRoJmdQkcz7KauvSGKFklkDI=; b=phyVGGOLypM2mq
	OBi2aosRqNRtTtsQVRSuKRJ3JZKS83nT6MnMioR+Jl3Q2c/XO44qI/e3iTLCwQ4sLK33YBiTt1RQ2
	SKU8cKTeBMG5ZrO7PT29FDr/UWZCMfQcEVgpZUTlmUDdwcO4BQ4AsTPJGpcJJGCoiscvfiBasN0bv
	FXX6O0pJ+9wdsXWDLB+4DgY8DfngRshJnaI06p9/psoDzFgWYbGYC509HZCdURPx+0gveTki3RDOe
	OQG2srJ1RwQdvZtUvniYuty8P5db63aUtsYcCfxhz/PuvhliKyzMzGHGGxIZlu/CTuLA1PuaX9O9z
	ZEyEezqGiIyW2Bv4QQvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsz7t-0000000A6UH-19SC;
	Sun, 09 Aug 2026 08:43:25 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsz7p-0000000A6Tb-2L7P
	for linux-mtd@lists.infradead.org;
	Sun, 09 Aug 2026 08:43:23 +0000
Received: from PC-202605011814.localdomain (unknown [222.191.246.242])
	by smtp.qiye.163.com (Hmail) with ESMTP id 494c177b7;
	Sun, 9 Aug 2026 16:43:06 +0800 (GMT+08:00)
From: Runyu Xiao <runyu.xiao@seu.edu.cn>
To: tudor.ambarus@linaro.org
Cc: pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	runyu.xiao@seu.edu.cn,
	jianhao.xu@seu.edu.cn,
	stable@vger.kernel.org
Subject: [PATCH] mtd: spi-nor: scope the exclusive RWW lock
Date: Sun,  9 Aug 2026 16:42:23 +0800
Message-Id: <20260809084223.3596259-1-runyu.xiao@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-HM-Tid: 0a9fe5b0a38f03a1kunm5a5ec2c57af50
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDHhpJVk9NGk1OThpCSxlNT1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUlVSkJKVUlPTVVJT0lZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pPSExVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=ZZF7O/oJRpUbMlkTsjS+9Cws+AZc4q8oCLYw9BpYB1OO2IN4uY2uYYYnN7HG4iZ7dFPtzJu/XZM6Cgg0GMnKkvO77koKaFU9KIrxw3Mfcvh9zieWvagBeqpzdS+AjFMKSrq2oZnS76MT7Z5wkZpaYSz5TLQT7dKfBl5x01abusQ=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=/HLUWOYWl3NIuNetNvUqiUL58b1bFtzurpO33MPK5T4=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_014321_769840_4B728F80 
X-CRM114-Status: GOOD (  10.26  )
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

spi_nor_rww_start_exclusive() is used as a wait_event_killable()
condition. The raw mutex_lock() leaves nor->lock held when the busy
condition returns false, so the waiter can block the active operation that
must clear the RWW state.

Use the same scoped mutex guard as the other RWW start helpers so the
mutex is released on both the busy and successful condition paths. The
state flags remain the handoff to the caller, while
spi_nor_rww_end_exclusive() continues
to acquire the mutex when clearing them.

The change was checked by comparing the original and patched source.

A source-level check of the original wait condition found that it takes
`nor->lock` and returns false while an RWW operation is still active. The
patched source was checked for a scoped mutex guard that releases
`nor->lock` before the wait condition returns. A user-space pthread model
held `nor->lock` on the false-condition path and showed that the
operation-ending path then blocks when it needs the same mutex. No live
SPI-NOR test was run.

Fixes: 03e7bb864d9a ("mtd: spi-nor: use scope-based mutex cleanup helpers")
Cc: stable@vger.kernel.org
Signed-off-by: Runyu Xiao <runyu.xiao@seu.edu.cn>
---
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
