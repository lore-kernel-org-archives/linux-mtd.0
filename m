Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5BF4EB64D9
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Jul 2023 07:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1I4t+17vFn0lHcu+2JQVQSSq4TMnClA2jfysNJFEX+4=; b=XzL+lAXgWnGZpk
	aqqrhoKW1lH/EZ1hUtXVjk1SoVf/+dkuTXkLQWW/fd0QnHfpGFRp1BNdNNzESW0rBH1dOPyZuFC0c
	hSFp2FD6451ERutP2O5oF1EXwKr9Ns5qi9tgkTUQ/KLPijOCMwJaGFReCvC7iB0Xp9QEiB/oQrZ1A
	gM/7wa7WBkYEKFiI+y5RttnZ+UQtj/Mt84yrQQ00RtKUhMQcw9+vjp1xv2bBeNcPvF3yMPIhTkAWf
	w38cy0melKeYCpvdRsEjYXoA7R9akcSvx+58xWQn2ZrHGF+205+P7IG1nU3uMj4lrDxk8uJ7OGt5e
	oxvqckW73Dp4/qgkKURw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJUYm-00Goxa-0W;
	Wed, 12 Jul 2023 07:46:52 +0000
Received: from out30-113.freemail.mail.aliyun.com ([115.124.30.113])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJUYh-00GowP-2r
	for linux-mtd@lists.infradead.org;
	Wed, 12 Jul 2023 07:46:50 +0000
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045170;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0VnBzeAQ_1689147998;
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0VnBzeAQ_1689147998)
          by smtp.aliyun-inc.com;
          Wed, 12 Jul 2023 15:46:39 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: richard@nod.at
Cc: chengzhihao1@huawei.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yang Li <yang.lee@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH -next v2] ubifs: Fix some kernel-doc comments
Date: Wed, 12 Jul 2023 15:46:37 +0800
Message-Id: <20230712074637.129248-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_004648_155625_6D2B7666 
X-CRM114-Status: UNSURE (   6.81  )
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

--change in v2:
According to Zhihao's suggestion, add a more accurate description to @flags.

 fs/ubifs/file.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index 436b27d7c58f..860497532555 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1375,6 +1375,9 @@ static inline int mctime_update_needed(const struct inode *inode,
 /**
  * ubifs_update_time - update time of inode.
  * @inode: inode to update
+ * @time:  timespec structure to hold the current time value
+ * @flags: time updating control flag determines updating
+ *	    which time fields of @inode
  *
  * This function updates time of the inode.
  */
-- 
2.20.1.7.g153144c


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
