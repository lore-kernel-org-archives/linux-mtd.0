Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FC54C19F2A
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Aug 2022 13:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=R4nEfajKKWpmKJDL7oEpVk9XpFrWBsuk+Gr4yDhFY6o=; b=rZKInGkhiP836h
	1yxH/jsrbPmQ8KqyS5/UbARYkPiIDhCoEfsSBMuSdq1zZH/nY9atd1qcWQz+pNH0eFupIxV+8wWeD
	9WmrZGsO00HbwdO/zc6YfJwFXE5MTVLOv+n7vN+qqzR5PHAbCGnAgJYxGlHvuZlNzS+HVWVynGUBU
	dZFObMM7fKTUHTR9Zy4bRA2hnykUXpyyuEPaD7rpPXC4a51QDfKn5JU6nPFJaGKs4jtoIh+tRZqpe
	HbH41aPI8GfMfmsSI1L7F4Whel73/plc1tro7M7ND9FHgrCGKBCeQEg+172B1p4wsJZS6/yZgpTd6
	ZrhkQEC6qfE1P8BPDn6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oM8hF-00CxMS-Qk; Thu, 11 Aug 2022 13:58:01 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58] helo=bg5.exmail.qq.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oM8hC-00CxDf-3K
	for linux-mtd@lists.infradead.org; Thu, 11 Aug 2022 13:58:00 +0000
X-QQ-mid: bizesmtp84t1660226268tlmonl37
Received: from localhost.localdomain ( [182.148.14.53])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 11 Aug 2022 21:57:47 +0800 (CST)
X-QQ-SSF: 01000000002000G0V000B00A0000020
X-QQ-FEAT: D2GZf6M6C/hr+2yB39PrCViDgEXAc6iDufKPtA3sEet/sciEm9iJ9nvlBZ6/f
	U3KaqOXh+oP5iNQ5hJo7e0YhLBDhuM5I09IYlrKKpkk2YnCRoDIYTcFS5McOiTO1m0fwynG
	V3TC5j278AnA5X5/glvqvbRxFMCn7OLpnJh/uIr0YcyU/Pz2y6WprSmD86A97EcG+080xjJ
	pnf+9zGGb/DlRhAOX+McOyTwXbTtcSpaO0j48Hl2Sda+acU3nHWX3qrsA1+1kO2WtwdmG0H
	0cx129cN9fgS7BjIMXPxYjkoCU6ZzPqOiYpoEtj8EuRDyC62E9lY3QCJs/kNunkCIuJBG7Z
	3ynJq5D3xXwY/JVmpUeFjhey6TWxih8KuUAo9mgTSjKOEBBh9viuueDFczxxJlTURHN7t7Q
X-QQ-GoodBg: 0
From: Jason Wang <wangborong@cdjrlc.com>
To: vigneshr@ti.com
Cc: richard@nod.at,
	miquel.raynal@bootlin.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jason Wang <wangborong@cdjrlc.com>
Subject: [PATCH] ubi: ubi-media.h: Fix comment typo
Date: Thu, 11 Aug 2022 21:57:30 +0800
Message-Id: <20220811135730.25480-1-wangborong@cdjrlc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220811_065758_456695_8C3E59FA 
X-CRM114-Status: GOOD (  10.76  )
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

The double `the' is duplicated in the comment, remove one.

Signed-off-by: Jason Wang <wangborong@cdjrlc.com>
---
 drivers/mtd/ubi/ubi-media.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/ubi-media.h b/drivers/mtd/ubi/ubi-media.h
index 386db0598e95..2c9cd3b6434f 100644
--- a/drivers/mtd/ubi/ubi-media.h
+++ b/drivers/mtd/ubi/ubi-media.h
@@ -131,7 +131,7 @@ enum {
  * is changed radically. This field is duplicated in the volume identifier
  * header.
  *
- * The @vid_hdr_offset and @data_offset fields contain the offset of the the
+ * The @vid_hdr_offset and @data_offset fields contain the offset of the
  * volume identifier header and user data, relative to the beginning of the
  * physical eraseblock. These values have to be the same for all physical
  * eraseblocks.
-- 
2.36.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
