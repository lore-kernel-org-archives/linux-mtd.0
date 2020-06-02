Return-Path: <SRS0=dUJy=7P=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB40FC433DF
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Jun 2020 11:25:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B861920679
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Jun 2020 11:25:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ll6gna8x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B861920679
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6Y8jo7TIJj5L3S8PhZ5hYpuxLEURcucQUVdHvzP3myE=; b=ll6gna8xpxeRoA
	Olb21sKKX7xU6uAIaPTwPeoyJw6D0JUG2nki3fEqdjP1cdqjXAuyT9Mjmjg4ucgidK4Ek1u3lGU39
	/0JY0cGGDh9LeobPHQhQhzR1BFXWWBvCUrqTBDW1+6tTxnkokowGU8TIHvFd0GxM86GE1ucB/sZlx
	WJjUuV0HrPQw0VHeqOs7julfPdeG6Y429Pg16YU4X/B7EhA932+V1hQlkTbnPImnu2/wMJwkQEJH8
	B5Y1N2sqCZDkztIn+YE32jwRkEpqC9PS0p7M55JLGxpWMsvxNBfnU6s0CjpieRWJ1RTQB0ONuKbeW
	qjHSPnCsQSchImUmS8xw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jg52Q-0004EK-65; Tue, 02 Jun 2020 11:24:58 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jg52M-00049q-HF
 for linux-mtd@lists.infradead.org; Tue, 02 Jun 2020 11:24:56 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 4377ECEEEE6F8789CF8B;
 Tue,  2 Jun 2020 19:24:45 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.487.0; Tue, 2 Jun 2020
 19:24:35 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] ubi: fastmap: Don't produce the initial anchor PEB when
 fastmap is disabled
Date: Tue, 2 Jun 2020 19:24:10 +0800
Message-ID: <20200602112410.660785-1-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200602_042454_739247_29F253AD 
X-CRM114-Status: UNSURE (   9.26  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: richard@nod.at, s.hauer@pengutronix.de, yi.zhang@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Following process triggers a memleak caused by forgetting to release the
initial anchor PEB (CONFIG_MTD_UBI_FASTMAP is disabled):
1. attach -> __erase_worker -> produce the initial anchor PEB
2. detach -> ubi_fastmap_close (Do nothing, it should have released the
   initial anchor PEB)

Don't produce the initial anchor PEB in __erase_worker() when fastmap
is disabled.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
Suggested-by: Sascha Hauer <s.hauer@pengutronix.de>
Fixes: f9c34bb529975fe ("ubi: Fix producing anchor PEBs")
Reported-by: syzbot+d9aab50b1154e3d163f5@syzkaller.appspotmail.com
---
 drivers/mtd/ubi/wl.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 5146cce5fe32..f88486ccf5d5 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -1079,7 +1079,8 @@ static int __erase_worker(struct ubi_device *ubi, struct ubi_work *wl_wrk)
 	if (!err) {
 		spin_lock(&ubi->wl_lock);
 
-		if (!ubi->fm_anchor && e->pnum < UBI_FM_MAX_START) {
+		if (!ubi->fm_disabled && !ubi->fm_anchor &&
+		    e->pnum < UBI_FM_MAX_START) {
 			ubi->fm_anchor = e;
 			ubi->fm_do_produce_anchor = 0;
 		} else {
-- 
2.25.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
