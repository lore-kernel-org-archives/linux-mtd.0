Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C821C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Jul 2022 07:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Xgq0ah5X61Yf1BjL9KlFcMlQRZShWl2NKJbMr9coChU=; b=Z4yZzVKOcUhlig
	Whh69RJIo0XchLnKZyva4hB60nl6QOX8ByA4stJamvXl+qYbGH6LYxeQQTHSojvtilW77ohwBlvDi
	iVq0PYv7hDRiq8+/LQ3eOByVUgeo6oQmWbbcZ71ti+ih+MHYuOIW/6IUp/pRmT4ii9C+WqNd06Dq8
	sfh8tKGqQMIMJx8L8ADt2QYUenRMg5WcjXZHWwGGWeAYTjrpSpTtSML2qbcMlhdD25v9zsN2XGVS6
	/SSGT4ZKzsJhFIcRlRI2qRhALO5k5JJYiwd2nOXvgJIJNfvwgxdOtBfdyFOcG3SBABCviL3u4gQxp
	7gbvf5CA3ciX6UipEjwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEn62-000eFU-6v; Fri, 22 Jul 2022 07:29:14 +0000
Received: from mail-m971.mail.163.com ([123.126.97.1])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEn5y-000eCx-Ry
	for linux-mtd@lists.infradead.org; Fri, 22 Jul 2022 07:29:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=hmh2V
	SRjRLodrsAW7x5oJgozIuK5DOps7uTD8a8Stn4=; b=i0VOSoTcwBIZhDrjeMixC
	AOmtsQMh6o9ca0k1920ZyycsahgdL54mKYtT7XNTl5LEcvtWmOA1oZYGjkqHlQNT
	Ze25Dkg3YRy0ksekbyeZ4kkDPwwNAfBsmAG5jKTTMwWz+k6GwoE51uGcgijkn17w
	PZ6409zp3/7q6Wa4bKPhyc=
Received: from localhost.localdomain (unknown [112.97.59.29])
	by smtp1 (Coremail) with SMTP id GdxpCgAXJ3K8UdpiQH8YPw--.5756S2;
	Fri, 22 Jul 2022 15:29:03 +0800 (CST)
From: Slark Xiao <slark_xiao@163.com>
To: han.xu@nxp.com,
	miquel.raynal@bootlin.com,
	vigneshr@ti.com,
	richard@nod.at
Cc: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	Slark Xiao <slark_xiao@163.com>
Subject: [PATCH] mtd: rawnand: gpmi: Fix typo 'the the' in comment
Date: Fri, 22 Jul 2022 15:28:50 +0800
Message-Id: <20220722072850.72797-1-slark_xiao@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CM-TRANSID: GdxpCgAXJ3K8UdpiQH8YPw--.5756S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZFWUWr1xJFWDCw45ury7Awb_yoWfGFgEgw
	nFya4xCw1UGr1qvF1SkFn8Xryjy3yFgw1UZr1FgrZIvan8GrZ3A3WDAwnFyF17uwnrC3W3
	G3Wrtw13Kw1kGjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRpT5B5UUUUU==
X-Originating-IP: [112.97.59.29]
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/1tbiJR9GZGAJpKX6GwAAsR
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220722_002911_312120_4FAB8DFC 
X-CRM114-Status: UNSURE (   9.51  )
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

Replace 'the the' with 'the' in the comment.

Signed-off-by: Slark Xiao <slark_xiao@163.com>
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 889e40329956..0893320d250b 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -1359,7 +1359,7 @@ static int gpmi_alloc_dma_buffer(struct gpmi_nand_data *this)
 /*
  * Handles block mark swapping.
  * It can be called in swapping the block mark, or swapping it back,
- * because the the operations are the same.
+ * because the operations are the same.
  */
 static void block_mark_swapping(struct gpmi_nand_data *this,
 				void *payload, void *auxiliary)
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
