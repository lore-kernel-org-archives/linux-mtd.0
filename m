Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E75EEB64DA
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Jul 2023 07:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HwMUWXYzlYgXkhq1ASvqZvLuvi7xi4PW7RnyFqDATio=; b=anT0S/7F/fuUXt
	tbWdtu2y7W9pjnGSYGSnE168fGIJHLZPziOzPPxdVHq2SCbstQ2q7SHLvsouoKJbTSNbc7+EiBo2w
	lKvr4Rd4X7eWZ4TZJl6ijwK7ELcLjAJbdiPEmINxB3yBci5WXs6bmrx1UO4CDJlJOKU38Qrq8xBO2
	n5pZpQqUDDIWjc1EbJr8Mz9MNtfXB5CXIYDK8casZ6XpKkRiS55nbl6s1wtqviRsX50ll+Cx7Hnri
	uvP1seyQDw7WNmmGhclVqjLyAJ7NV9Nqn57mDSr979c1zMiVlO9OZah01ntUFbZuJ8DJCxlRUKOEj
	NfnnnAnRfXnMdPZcDLNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJU1G-00GlAo-06;
	Wed, 12 Jul 2023 07:12:14 +0000
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJU1D-00Gl8Q-04
	for linux-mtd@lists.infradead.org;
	Wed, 12 Jul 2023 07:12:13 +0000
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R201e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046051;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0VnBzP3I_1689145921;
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0VnBzP3I_1689145921)
          by smtp.aliyun-inc.com;
          Wed, 12 Jul 2023 15:12:02 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: richard@nod.at
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yang Li <yang.lee@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH -next] ubifs: Fix some kernel-doc comments
Date: Wed, 12 Jul 2023 15:12:00 +0800
Message-Id: <20230712071200.78575-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_001211_553444_F6C409A3 
X-CRM114-Status: UNSURE (   7.34  )
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

Add description of @time and @flags in ubifs_update_time().

to silence the warnings:
fs/ubifs/file.c:1383: warning: Function parameter or member 'time' not described in 'ubifs_update_time'
fs/ubifs/file.c:1383: warning: Function parameter or member 'flags' not described in 'ubifs_update_time'

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=5848
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 fs/ubifs/file.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index 436b27d7c58f..5e86ef1be698 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1375,6 +1375,8 @@ static inline int mctime_update_needed(const struct inode *inode,
 /**
  * ubifs_update_time - update time of inode.
  * @inode: inode to update
+ * @time:  timespec structure to hold the current time value
+ * @flags: file time flag
  *
  * This function updates time of the inode.
  */
-- 
2.20.1.7.g153144c


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
