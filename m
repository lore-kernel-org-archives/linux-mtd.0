Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15667D32D81
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Nov 2024 18:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MXiarhd4/3CaVymq8QfYSZHBGy8ulLVr4/RpH4FOhfA=; b=o/lzoaD51uNk1U
	7qurOBLVQJph8FACvL8uWXmHOCjXMtVtt+0pNo0cjErhUDtsLJ3QH5KP+Er+HLht2qQbl5fyy69jL
	XquAdawyMD88nZb5uAcXF60omjC1HZSwGq7usQAh3z4m9fM1L5Zuyk+m1dATMnn2dV9uDPfEHuf4n
	HxvtcoO7EuSHWj5JGBkM63frdRs69lAMXGgCPHmwal3fWfcETbh1JPsj03wLco9Xmr3ICiGV89qi3
	vGaF4uD4tLH7UtXMKHRf3UBgp74GCk5M6BxKB5ZZcv4N+n276qoQZxKZOGUDSxkpaYfqWnyaTMWeb
	3TkKtJB+nAvootF/xHVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAvgB-00000004ZHx-0aON;
	Tue, 12 Nov 2024 18:31:55 +0000
Received: from out-172.mta1.migadu.com ([95.215.58.172])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAvfz-00000004ZG5-3mrM
	for linux-mtd@lists.infradead.org;
	Tue, 12 Nov 2024 18:31:45 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1731436300;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0hPGUSawC3wfWVUaw8imv0OPqbrEwJlGlsqYQZ9dtME=;
	b=YxZJ5DeXQCszRej4fDorjEZSMYJ72k/sG0pUZPjWHKvAo7y0NNk458TBedYu/ez7YpWImb
	1FhJ48RFUHTxQwwIk60kpQ9rVwGEYbPRUcCEIWY4nmtT/VlKr6gWfubiua+qKSmxC8+p03
	0Y7dmQyxzYmxs58A2p+EuFQC8vI15QI=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: David Woodhouse <dwmw2@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH] jffs2: Use str_yes_no() helper function
Date: Tue, 12 Nov 2024 19:31:11 +0100
Message-ID: <20241112183113.173127-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_103144_101340_D1562A99 
X-CRM114-Status: UNSURE (   8.38  )
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

Remove hard-coded strings by using the str_yes_no() helper function.

Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 fs/jffs2/nodemgmt.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/fs/jffs2/nodemgmt.c b/fs/jffs2/nodemgmt.c
index bbab2bdc71b6..69569864630e 100644
--- a/fs/jffs2/nodemgmt.c
+++ b/fs/jffs2/nodemgmt.c
@@ -15,6 +15,7 @@
 #include <linux/mtd/mtd.h>
 #include <linux/compiler.h>
 #include <linux/sched/signal.h>
+#include <linux/string_choices.h>
 #include "nodelist.h"
 #include "debug.h"
 
@@ -317,9 +318,9 @@ static int jffs2_find_nextblock(struct jffs2_sb_info *c)
 			   And there's no space left. At all. */
 			pr_crit("Argh. No free space left for GC. nr_erasing_blocks is %d. nr_free_blocks is %d. (erasableempty: %s, erasingempty: %s, erasependingempty: %s)\n",
 				c->nr_erasing_blocks, c->nr_free_blocks,
-				list_empty(&c->erasable_list) ? "yes" : "no",
-				list_empty(&c->erasing_list) ? "yes" : "no",
-				list_empty(&c->erase_pending_list) ? "yes" : "no");
+				str_yes_no(list_empty(&c->erasable_list)),
+				str_yes_no(list_empty(&c->erasing_list)),
+				str_yes_no(list_empty(&c->erase_pending_list)));
 			return -ENOSPC;
 		}
 
@@ -883,7 +884,7 @@ int jffs2_thread_should_wake(struct jffs2_sb_info *c)
 
 	jffs2_dbg(1, "%s(): nr_free_blocks %d, nr_erasing_blocks %d, dirty_size 0x%x, vdirty_blocks %d: %s\n",
 		  __func__, c->nr_free_blocks, c->nr_erasing_blocks,
-		  c->dirty_size, nr_very_dirty, ret ? "yes" : "no");
+		  c->dirty_size, nr_very_dirty, str_yes_no(ret));
 
 	return ret;
 }
-- 
2.47.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
