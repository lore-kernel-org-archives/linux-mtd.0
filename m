Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2559C5DF86
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Aug 2026 14:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z0Cx5j3MWHCw2TMhqQGHqaVZWZ4Ee8fyZzBUkP3T/dY=; b=jmC7eneZ5bh7lL
	wuBGh2WZz6ts1IvmpwnKqkClRipbX5Ea/aSWUdjTjse9hOWnI9CqnhQ2sOuTGKAYzIo4F7Iw7TWpg
	Gej/m/Ux4lrJEQ8EJoIZdhmgMN3ijY7KjHaqygtTlR+vfy6j3belipN8dmestKdB7q/9PpMjfBMdL
	eO+IBeU6nLAODFjbn6y8oaAqpKOmnaAsaT8dZl8c9svukXYMSxqIvpMRklo2l3EWa6MBK+w0W3dwa
	6WKPqhj5ISZaXlxPbd/i+K4vt0xTSs/jHNSwXv+LwPZINdAja0NMCgaaVwHKEzrzl/qrvOKiRDzDO
	2lX+JOgfNSjGA/lIBnhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwgyO-00000009wVi-2umm;
	Wed, 19 Aug 2026 14:08:56 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwgyL-00000009wUk-1nKU
	for linux-mtd@lists.infradead.org;
	Wed, 19 Aug 2026 14:08:54 +0000
Received: from PC-202605011814.localdomain (unknown [58.241.16.34])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4a93deded;
	Wed, 19 Aug 2026 22:03:48 +0800 (GMT+08:00)
From: Runyu Xiao <runyu.xiao@seu.edu.cn>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Runyu Xiao <runyu.xiao@seu.edu.cn>,
	Jianhao Xu <jianhao.xu@seu.edu.cn>
Subject: [PATCH v4 2/2] mtd: spi-nor: core: Unprepare after interrupted RWW wait
Date: Wed, 19 Aug 2026 22:03:37 +0800
Message-Id: <20260819140337.36775-3-runyu.xiao@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260819140337.36775-1-runyu.xiao@seu.edu.cn>
References: <0a15f6e8-f1ca-4945-9bd5-2b64a2802a58@linaro.org>
 <20260819140337.36775-1-runyu.xiao@seu.edu.cn>
MIME-Version: 1.0
X-HM-Tid: 0aa01a55d98003a1kunm0db6d2d0140e2c
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDTR5MVhlNHhlDSExPGR9MS1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlOQ1VJT0pVSk1VSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpPSE
	xVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=eyZfHJPA1IC/3LJrlNuQCRVbVAuGSsWmfIeEf2gvORk3JeFrlP66I8OMWCSZA2lDM0veBsbvZLZHgkIkZUfu+A4uj5JlMaeQYaP1kJnkJq2Dcs97DRO8UkSB7LiLGLnaw1La4nvB46J+IaHjPlWYgez+BgLYPSdefsOv8Zt+Y5Y=; c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=YzavkBzAhnxid9s07HfUC9Bg5vaUt0KhGfcnHKf2bjQ=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_070853_662385_F62A22CF 
X-CRM114-Status: UNSURE (   8.55  )
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

spi_nor_prep_and_lock() calls spi_nor_prep() before waiting. If the wait
is interrupted, the controller setup is left active.

Call spi_nor_unprep() before returning an error from each helper.

Fixes: 74df43b3f626 ("mtd: spi-nor: Enhance locking to support reads while writes")
Cc: stable@vger.kernel.org
Signed-off-by: Runyu Xiao <runyu.xiao@seu.edu.cn>

Changes in v4:
- Add the cleanup for interrupted RWW waits as a separate patch.
- Use the original RWW locking commit in Fixes.
---
 drivers/mtd/spi-nor/core.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index d5c6a925862e..52264e24eb4b 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1348,6 +1348,9 @@ int spi_nor_prep_and_lock(struct spi_nor *nor)
 		ret = wait_event_killable(nor->rww.wait,
 					  spi_nor_rww_start_exclusive(nor));
 
+	if (ret)
+		spi_nor_unprep(nor);
+
 	return ret;
 }
 
@@ -1421,6 +1424,9 @@ static int spi_nor_prep_and_lock_pe(struct spi_nor *nor, loff_t start, size_t le
 		ret = wait_event_killable(nor->rww.wait,
 					  spi_nor_rww_start_pe(nor, start, len));
 
+	if (ret)
+		spi_nor_unprep(nor);
+
 	return ret;
 }
 
@@ -1496,6 +1502,9 @@ static int spi_nor_prep_and_lock_rd(struct spi_nor *nor, loff_t start, size_t le
 		ret = wait_event_killable(nor->rww.wait,
 					  spi_nor_rww_start_rd(nor, start, len));
 
+	if (ret)
+		spi_nor_unprep(nor);
+
 	return ret;
 }
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
