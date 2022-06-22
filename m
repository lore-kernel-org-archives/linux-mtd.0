Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D3C8C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Jun 2022 14:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bBS+uBxSng2KsqalPrQ0ARzDz6nEVGdJOTllkjPtQE8=; b=RVg28IGhuIWcWy
	4aLIgn6DMTX6iP8R6W+bQkTa1TinQuGan4M6aXSkzaLvLSDmOIaIZGoy4Gvh4X/1SS+GVbmbjzcpz
	7A0sKscgLr8Y5KzRguEPabQePnGw7KPi14B+J1/FxeQ/5gE5sByIbF0SOewYO0eU2t7vjE6aUTfeI
	fVJz768BJUqhAN9ZxQ2DNHIkai9tF4/QciMVVngPNRU87QyzmyrEhEFKrDTKOc4jmTSAyt6m7aEFT
	HrtrGW5TI4dziisop6R/IFkXxlCbLNm7AxsuPlQI6SjlRUYJPePezDTCpqPTmjCCjJYkfZzH3k9eg
	V6Ivj3JGU6+jWu59Xx1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o41Wy-00AxT2-Gj; Wed, 22 Jun 2022 14:40:32 +0000
Received: from smtpbg138.qq.com ([106.55.201.18] helo=smtpbg.qq.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o41Wo-00AxKq-T6
	for linux-mtd@lists.infradead.org; Wed, 22 Jun 2022 14:40:29 +0000
X-QQ-mid: bizesmtp80t1655908781tevl9d6o
Received: from ubuntu.localdomain ( [106.117.78.84])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 22 Jun 2022 22:39:36 +0800 (CST)
X-QQ-SSF: 01000000008000B0B000E00A0000000
X-QQ-FEAT: YBQGNezXUizOQFRGfh/1skeSfdYVavSWwoeeimSk6BnF3UTOXYQIlgagPwwo4
	tfjKtAPsUKV4LQ7ACEuSvXXjGHyP7u6J1DtqX6WPjIvo8RkdQh8d53k6Et8M9hO77RcyTTh
	RWkR4NAQH/MFLnDgN/15ZmTx3G1KXD4fP8j5uPTAUi6ee/AeCLgoRCreSt9dFIA7sToGwQi
	anmmyABNwDYObLLCDJuDmCs2dL1YBeamLS6daGi0OeK08L07zlz9EOkvBEJODGgD2kU9udx
	X7d8izO6YYnm4LaHEaXUAKUyYWdOTnCpdNaLGPtdDZMRTJ0G5w+bQwTxL/pDS7ySsif72dE
	YXOsdsb8JNgFgigSex8HlWltX3q4hLhWNeeTiQq
X-QQ-GoodBg: 0
From: Jiang Jian <jiangjian@cdjrlc.com>
To: miquel.raynal@bootlin.com,
	vigneshr@ti.com
Cc: richard@nod.at,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jiang Jian <jiangjian@cdjrlc.com>
Subject: [PATCH] ubi: eba: Fix typo in comments
Date: Wed, 22 Jun 2022 22:39:34 +0800
Message-Id: <20220622143934.18390-1-jiangjian@cdjrlc.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybgspam:qybgspam10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220622_074023_320047_8090B66D 
X-CRM114-Status: UNSURE (   9.29  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Remove the repeated word 'and' from comments

Signed-off-by: Jiang Jian <jiangjian@cdjrlc.com>
---
 drivers/mtd/ubi/eba.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
index ccc5979642b7..09c408c45a62 100644
--- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -377,7 +377,7 @@ static int leb_write_lock(struct ubi_device *ubi, int vol_id, int lnum)
  *
  * This function locks a logical eraseblock for writing if there is no
  * contention and does nothing if there is contention. Returns %0 in case of
- * success, %1 in case of contention, and and a negative error code in case of
+ * success, %1 in case of contention, and a negative error code in case of
  * failure.
  */
 static int leb_write_trylock(struct ubi_device *ubi, int vol_id, int lnum)
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
