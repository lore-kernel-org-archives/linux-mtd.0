Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44B01C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 24 May 2022 04:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zLUts+tkvVR1UI1Zk/Eax5TmqYtafeDIB/dT0YriCpo=; b=0TyH88nW1jpd07
	XBZnVTMnTLW8mBxv1vV4uvzVpLUKIZeFxNMJkpMCospfRNTTbC95XM7//LhJUNX3qxGee4s+0loO8
	sgx8ctlh5oqwetwUcJ7QpNF83OXvANDlgm8ogkwSu91U+FG/682b7UbWNzXx23fr3JXDaPSkIrd+5
	+8TKPjX3YOtf/R2Nrdx0LuEodhrj8itK6PZCSsJma1mVBQOlVtlse0WZPyuuZfLNX0OYHOisNceYt
	MQ9mRaHgVgp5NkhDkpCeQRK+J4z32YKHjpnN2ywPh4Uy9Pg6YEd3itzCzb1NXFCkIDo5s0Pa2yHfB
	+X0jn2KTov7xCApMF/jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntMTw-006nsv-EP; Tue, 24 May 2022 04:49:20 +0000
Received: from azure-sdnproxy.icoremail.net ([20.232.28.96]
 helo=azure-sdnproxy-3.icoremail.net)
 by bombadil.infradead.org with smtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntMTr-006nrD-MG
 for linux-mtd@lists.infradead.org; Tue, 24 May 2022 04:49:18 +0000
Received: from ubuntu.localdomain (unknown [124.236.130.193])
 by mail-app3 (Coremail) with SMTP id cC_KCgDX36OqY4xig7u_AA--.14600S2;
 Tue, 24 May 2022 12:48:55 +0800 (CST)
From: Duoming Zhou <duoming@zju.edu.cn>
To: linux-mtd@lists.infradead.org
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 linux-kernel@vger.kernel.org, Duoming Zhou <duoming@zju.edu.cn>
Subject: [PATCH] mtd: Fix deadlock caused by cancel_work_sync in sm_release
Date: Tue, 24 May 2022 12:48:41 +0800
Message-Id: <20220524044841.10517-1-duoming@zju.edu.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: cC_KCgDX36OqY4xig7u_AA--.14600S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZFW5XrWkWFy8Zr1DZw1DZFb_yoW8Jw1Dpr
 WrCry8JFW8Ar4DJ34DKa13ZF4ru34kKFW7Kr1UK3W5ZrZ5XFnIg345KFyFgFWfGFy8A39I
 vFs2grW5ZF1rZw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkq14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc2xSY4AK67AK6r45
 MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr
 0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0E
 wIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJV
 W8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAI
 cVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjX4S5UUUUU==
X-CM-SenderInfo: qssqjiasttq6lmxovvfxof0/1tbiAgQAAVZdtZ1wIAAZst
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_214915_890124_0A8B2572 
X-CRM114-Status: UNSURE (   9.71  )
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

There is a deadlock between sm_release and sm_cache_flush_work
which is a work item. The cancel_work_sync in sm_release will
not return until sm_cache_flush_work is finished. If we hold
mutex_lock and use cancel_work_sync to wait the work item to
finish, the work item also requires mutex_lock. As a result,
the sm_release will be blocked forever. The race condition is
shown below:

    (Thread 1)             |   (Thread 2)
sm_release                 |
  mutex_lock(&ftl->mutex)  | sm_cache_flush_work
                           |   mutex_lock(&ftl->mutex)
  cancel_work_sync         |   ...

This patch moves del_timer_sync and cancel_work_sync out of
mutex_lock in order to mitigate deadlock.

Fixes: 7d17c02a01a1 ("mtd: Add new SmartMedia/xD FTL")
Signed-off-by: Duoming Zhou <duoming@zju.edu.cn>
---
 drivers/mtd/sm_ftl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/sm_ftl.c b/drivers/mtd/sm_ftl.c
index 0cff2cda1b5..7f955fade83 100644
--- a/drivers/mtd/sm_ftl.c
+++ b/drivers/mtd/sm_ftl.c
@@ -1111,9 +1111,9 @@ static void sm_release(struct mtd_blktrans_dev *dev)
 {
 	struct sm_ftl *ftl = dev->priv;
 
-	mutex_lock(&ftl->mutex);
 	del_timer_sync(&ftl->timer);
 	cancel_work_sync(&ftl->flush_work);
+	mutex_lock(&ftl->mutex);
 	sm_cache_flush(ftl);
 	mutex_unlock(&ftl->mutex);
 }
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
