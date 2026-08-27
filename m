Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C88C3C61DC2
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Aug 2026 08:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=indtzqSUlcs7Vi/VAbq92mEymNF6heqARqRq5WK7qqc=; b=xY9AUv/w+lHYDx
	YblsWYI0kcRvu1NAUUrI6vQ4AV31hqQgeR/UhvuAqYZjXR5SgkHCmabPhpuYXCxO6I2St1I3s7qC1
	Hy+nZCuf/J1+TUwe4aJFCmRwFx3g8lNI5ck8onCr8tgfBZ15xc+cnpye/S1jpYJxICLGa3FTUabJf
	ileFx27ygQ9NcyNSW70A7mO7K4kasYxGpoSdr7mzUs3VloOLiNX4GgLLHnVctNpapVnIIifFd4tU9
	JjvXQkWm7cBPcbcE5N6hbVsT+qvlm6L3z0kG0m/v+V8A0dpT4SWFFdBUyL8O9oREY/6wlQVBD8bXO
	TJV8FdAuAz6RbCIO5hzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzVSC-00000003deH-2n0P;
	Thu, 27 Aug 2026 08:27:20 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzVS8-00000003ddI-0Ei2
	for linux-mtd@lists.infradead.org;
	Thu, 27 Aug 2026 08:27:19 +0000
Received: from PC-202605011814.localdomain (unknown [222.191.246.242])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4b890ca46;
	Thu, 27 Aug 2026 16:27:00 +0800 (GMT+08:00)
From: Runyu Xiao <runyu.xiao@seu.edu.cn>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Runyu Xiao <runyu.xiao@seu.edu.cn>,
	Jianhao Xu <jianhao.xu@seu.edu.cn>
Subject: [PATCH v5] mtd: spi-nor: core: Fix mutex leak in spi_nor_rww_start_exclusive()
Date: Thu, 27 Aug 2026 16:26:56 +0800
Message-Id: <20260827082656.2772784-1-runyu.xiao@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <87tsoigz8x.fsf@bootlin.com>
References: <87tsoigz8x.fsf@bootlin.com>
MIME-Version: 1.0
X-HM-Tid: 0aa042545fa603a1kunm50d5e1a85c8a5
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZQx1MVk1LGRoaQhoYHx9OGlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUlVSkJKVUlPTVVJT0lZV1kWGg8SFR0UWUFZT0tIVUJCSU
	5LVUpLS1VKQktCWQY+
DKIM-Signature: a=rsa-sha256;
	b=mP1ZkGPgEVq7JP7GWZquTpOr+Vv6+NTWEyYXIVs0wUN3kw0fSZ9l9n5kMUQle+mb+DZYJ6b6BfNxTNe4KAsSItjPWZTyxlUUAmWWvYzhHpfdNV7wQsWX31bRrKzB3YDWIb+D9aAzwNBjpWoqO196wszGkWdsTirceZCDWX5/QkY=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=0YHVsFg6BoIIn7D9s6VZmkuiKmYY6gmtcPRgsQPlfj8=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_012716_726153_6A277746 
X-CRM114-Status: GOOD (  12.67  )
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
condition. When an RWW operation is already in progress, it returns
false while still holding nor->lock. The wait condition is then retried,
but spi_nor_rww_end_exclusive() needs the same lock to clear the RWW
state, so the wait can deadlock.

Use the same guard(mutex) pattern as the other RWW helpers so nor->lock
is released on both the busy and successful return paths.

Fixes: 03e7bb864d9a ("mtd: spi-nor: use scope-based mutex cleanup helpers")
Cc: stable@vger.kernel.org
Signed-off-by: Runyu Xiao <runyu.xiao@seu.edu.cn>
---
Changes in v5:
- Drop the interrupted-wait cleanup patch because an equivalent fix is
  already pending upstream.
- Restore the focused guard(mutex) change for the exclusive RWW helper.
- Restore the original Fixes tag and keep the other RWW helpers unchanged.

Changes in v4:
- Add the interrupted-wait cleanup as a separate patch.
- Convert all RWW start helpers used as wait conditions to conditional
  scoped mutex guards.
- Update the subject and change the Fixes tag while reworking the patch.

Changes in v3:
- Use guard(mutex) in spi_nor_rww_start_exclusive() so the lock is
  released on both return paths.
- Update the subject to describe the guard-based fix.

Changes in v2:
- Explicitly unlock nor->lock before returning from the busy path.
- Clarify the lock leak and its effect on the matching end helper.

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
