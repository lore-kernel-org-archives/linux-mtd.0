Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FACAC3A5A7
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Dec 2022 08:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=B65qKsC2ktAvhO/RRU4b06TNnxCO+z/FxBYqef+Yz3o=; b=kLbam6q+8j3Bp5
	S9gHzz6sN2n0K9/nHKgnnBP1LEWgW5shBQrUwoxYOTp3w1XjG0PV4NgtByThKJ6XykBHNt2FUeHck
	lisnigpqpskYriFjMjO/SdV8HFn1hlzx6V1rBM3qXvx2GwfclLznHnynyftiG8H1mWfKCjTnBMXW7
	KcOk5PBTN6NqvPDI1KYtIV098W9LdS3onFaGR75fcecJestohnLEVwfAim+tn9fi61oYJPDLYwYCl
	J5p8vPerr1gl9Z3c4CrQLHGSP5G/K4ro4Q0lKkw1hC2LFyl8uRRjLaRbbbs/E+hZ/r8gg1xlwCbz+
	gyz/zU1r4DD7pR+WlxFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2TW2-0053Aj-0J; Tue, 06 Dec 2022 08:41:26 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2TVy-0052nL-Ix
	for linux-mtd@lists.infradead.org; Tue, 06 Dec 2022 08:41:24 +0000
Received: from kwepemm600002.china.huawei.com (unknown [172.30.72.55])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4NRDPy2x08zQj6p;
	Tue,  6 Dec 2022 16:40:22 +0800 (CST)
Received: from localhost.localdomain (10.175.127.227) by
 kwepemm600002.china.huawei.com (7.193.23.29) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 6 Dec 2022 16:41:10 +0800
From: Zhong Jinghua <zhongjinghua@huawei.com>
To: <richard@nod.at>, <ext-adrian.hunter@nokia.com>,
	<Artem.Bityutskiy@nokia.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<chengzhihao1@huawei.com>, <yukuai3@huawei.com>
Subject: [PATCH-next] block: fix null-deref in percpu_ref_put
Date: Tue, 6 Dec 2022 17:02:08 +0800
Message-ID: <20221206090208.845185-1-zhongjinghua@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600002.china.huawei.com (7.193.23.29)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_004122_817780_695A0C27 
X-CRM114-Status: UNSURE (   9.82  )
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

A problem was find in stable 5.10 and the root cause of it like below.

In the use of q_usage_counter of request_queue, blk_cleanup_queue using
"wait_event(q->mq_freeze_wq, percpu_ref_is_zero(&q->q_usage_counter))"
to wait q_usage_counter becoming zero. however, if the q_usage_counter
becoming zero quickly, and percpu_ref_exit will execute and ref->data
will be freed, maybe another process will cause a null-defef problem
like below:

	CPU0                             CPU1
blk_mq_destroy_queue
 blk_freeze_queue
  blk_mq_freeze_queue_wait
				scsi_end_request
				 percpu_ref_get
				 ...
				 percpu_ref_put
				  atomic_long_sub_and_test
 blk_put_queue
  kobject_put
   kref_put
    blk_release_queue
     percpu_ref_exit
      ref->data -> NULL
   				   ref->data->release(ref) -> null-deref

As suggested by Ming Lei, fix it by getting the release method before
the referebce count is minus 0.

Suggested-by: Ming Lei <ming.lei@redhat.com>
Signed-off-by: Zhong Jinghua <zhongjinghua@huawei.com>
---
 include/linux/percpu-refcount.h | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/include/linux/percpu-refcount.h b/include/linux/percpu-refcount.h
index d73a1c08c3e3..11e717c95acb 100644
--- a/include/linux/percpu-refcount.h
+++ b/include/linux/percpu-refcount.h
@@ -331,8 +331,11 @@ static inline void percpu_ref_put_many(struct percpu_ref *ref, unsigned long nr)
 
 	if (__ref_is_percpu(ref, &percpu_count))
 		this_cpu_sub(*percpu_count, nr);
-	else if (unlikely(atomic_long_sub_and_test(nr, &ref->data->count)))
-		ref->data->release(ref);
+	else {
+		percpu_ref_func_t *release = ref->data->release;
+		if (unlikely(atomic_long_sub_and_test(nr, &ref->data->count)))
+			release(ref);
+	}
 
 	rcu_read_unlock();
 }
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
