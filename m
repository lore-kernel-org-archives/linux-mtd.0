Return-Path: <SRS0=s0lc=QE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5F9CC433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Nov 2021 07:17:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87BA561A53
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Nov 2021 07:17:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 87BA561A53
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dZRYGPiQxhy5rhICWdJFTIPY+c7P7ipQgNJ4BGily+A=; b=3H3gDltuFnCDHo
	vyzDTeSPR6z4esldcxQtGtpUkWlRL8WfqFIjkG0uv61uHVvWUlsupMUEddEIUhlAVBL74TQu9dgSv
	TzA7T2nEYsXoV5dmNjwRz8TjzB56gW6maxm3JM/Ldq/tEQ9HaG/7jaGz/EGvkn5zYv5WCaDbQMwEj
	lwP89p0YlepbNx+DQxtzni2IA1+H7jJ3hTLFAABMHxlfmvjG0JF6/pvMtWEpqz3Ljs4wnhsvGrc1w
	VL5YcKo7zuykWiz6JMnhyM8mKs4RRBoOHdtOfXtnmJyLjWasipyaVh0Zys8w4ctr3aPUWXW7uMUgB
	htwPAZ9F8Y4EDV4eslVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnFBU-003iLG-NM; Wed, 17 Nov 2021 07:16:45 +0000
Received: from out30-42.freemail.mail.aliyun.com ([115.124.30.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnEyP-003dSC-Bk
 for linux-mtd@lists.infradead.org; Wed, 17 Nov 2021 07:03:15 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R131e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04423; MF=yang.lee@linux.alibaba.com;
 NM=1; PH=DS; RN=7; SR=0; TI=SMTPD_---0Ux0WBIM_1637132585; 
Received: from
 j63c13417.sqa.eu95.tbsite.net(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0Ux0WBIM_1637132585) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 17 Nov 2021 15:03:07 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: richard@nod.at
Cc: nathan@kernel.org, ndesaulniers@google.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 Yang Li <yang.lee@linux.alibaba.com>
Subject: [PATCH -next] ubifs: Fix kernel-doc
Date: Wed, 17 Nov 2021 15:03:04 +0800
Message-Id: <1637132584-52066-1-git-send-email-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_230313_710942_937B8626 
X-CRM114-Status: UNSURE (   6.79  )
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

Fix function name in fs/ubifs/io.c kernel-doc comment
to remove some warnings found by clang(make W=1 LLVM=1).

fs/ubifs/io.c:497: warning: expecting prototype for
wbuf_timer_callback(). Prototype was for wbuf_timer_callback_nolock()
instead
fs/ubifs/io.c:513: warning: expecting prototype for new_wbuf_timer().
Prototype was for new_wbuf_timer_nolock() instead
fs/ubifs/io.c:538: warning: expecting prototype for cancel_wbuf_timer().
Prototype was for cancel_wbuf_timer_nolock() instead

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 fs/ubifs/io.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/ubifs/io.c b/fs/ubifs/io.c
index 789a781..1dbee23 100644
--- a/fs/ubifs/io.c
+++ b/fs/ubifs/io.c
@@ -488,7 +488,7 @@ void ubifs_prep_grp_node(struct ubifs_info *c, void *node, int len, int last)
 }
 
 /**
- * wbuf_timer_callback - write-buffer timer callback function.
+ * wbuf_timer_callback_nolock - write-buffer timer callback function.
  * @timer: timer data (write-buffer descriptor)
  *
  * This function is called when the write-buffer timer expires.
@@ -505,7 +505,7 @@ static enum hrtimer_restart wbuf_timer_callback_nolock(struct hrtimer *timer)
 }
 
 /**
- * new_wbuf_timer - start new write-buffer timer.
+ * new_wbuf_timer_nolock - start new write-buffer timer.
  * @c: UBIFS file-system description object
  * @wbuf: write-buffer descriptor
  */
@@ -531,7 +531,7 @@ static void new_wbuf_timer_nolock(struct ubifs_info *c, struct ubifs_wbuf *wbuf)
 }
 
 /**
- * cancel_wbuf_timer - cancel write-buffer timer.
+ * cancel_wbuf_timer_nolock - cancel write-buffer timer.
  * @wbuf: write-buffer descriptor
  */
 static void cancel_wbuf_timer_nolock(struct ubifs_wbuf *wbuf)
-- 
1.8.3.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
