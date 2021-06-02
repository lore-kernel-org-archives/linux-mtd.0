Return-Path: <SRS0=DONg=K4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FBDEC47092
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Jun 2021 06:57:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FB946108C
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Jun 2021 06:57:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4FB946108C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DoM+AJOKL8WqNKuHcXzGE92TuIizL2AnHU9TtdrXeDo=; b=jyJNSlnZpe5gWZ
	BnVML/v0Knh0VSNZqFNSOhJpbGnRDaj1O20A+rp3hTVci69f5gqKE3fnI7WMLmGkXgwVmIb+N3eFR
	FuH6xLIlBqbzLkp2Sz7H0FNHfe+xr/wzE35ayW9MRSCKIxRUWKhAEINqUw5+AeYvtcEMhisdcB+N+
	hVoGVyVisM0NeoFCZK1t11mrQZ4ZvUTw55td905I+pPHbdxMtAvkZyNSTY7tTI6vrjVZsEOjByexc
	RZObX9cZ0wIlknJg7xW4vFiWNo06U0Lbbbtb8Dqi5QpGANqjYhWmutRRBwy3AsaIN4U3btX5bSEDr
	0T4BGDnn5YO7Khj9TNXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loKo4-00278X-Rm; Wed, 02 Jun 2021 06:56:48 +0000
Received: from shol69.static.otenet.gr ([83.235.170.67] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loKlL-0025I2-Rr; Wed, 02 Jun 2021 06:54:00 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Justin Sanders <justin@coraid.com>, Denis Efremov <efremov@linux.com>,
 Josef Bacik <josef@toxicpanda.com>, Tim Waugh <tim@cyberelk.net>,
 Geoff Levand <geoff@infradead.org>, Ilya Dryomov <idryomov@gmail.com>,
 "Md. Haris Iqbal" <haris.iqbal@ionos.com>,
 Jack Wang <jinpu.wang@ionos.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
 Mike Snitzer <snitzer@redhat.com>,
 Maxim Levitsky <maximlevitsky@gmail.com>, Alex Dubov <oakad@yahoo.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, dm-devel@redhat.com,
 linux-block@vger.kernel.org, nbd@other.debian.org,
 linuxppc-dev@lists.ozlabs.org, ceph-devel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, xen-devel@lists.xenproject.org,
 linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-s390@vger.kernel.org
Subject: [PATCH 02/30] blk-mq: improve the blk_mq_init_allocated_queue
 interface
Date: Wed,  2 Jun 2021 09:53:17 +0300
Message-Id: <20210602065345.355274-3-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210602065345.355274-1-hch@lst.de>
References: <20210602065345.355274-1-hch@lst.de>
MIME-Version: 1.0
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

Don't return the passed in request_queue but a normal error code, and
drop the elevator_init argument in favor of just calling elevator_init_mq
directly from dm-rq.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-mq.c           | 36 ++++++++++++++----------------------
 block/blk.h              |  1 -
 block/elevator.c         |  2 +-
 drivers/md/dm-rq.c       |  9 +++------
 include/linux/blk-mq.h   |  5 ++---
 include/linux/elevator.h |  1 +
 6 files changed, 21 insertions(+), 33 deletions(-)

diff --git a/block/blk-mq.c b/block/blk-mq.c
index eaacfa963a73..6112741e1ff9 100644
--- a/block/blk-mq.c
+++ b/block/blk-mq.c
@@ -3115,21 +3115,18 @@ void blk_mq_release(struct request_queue *q)
 struct request_queue *blk_mq_init_queue_data(struct blk_mq_tag_set *set,
 		void *queuedata)
 {
-	struct request_queue *uninit_q, *q;
+	struct request_queue *q;
+	int ret;
 
-	uninit_q = blk_alloc_queue(set->numa_node);
-	if (!uninit_q)
+	q = blk_alloc_queue(set->numa_node);
+	if (!q)
 		return ERR_PTR(-ENOMEM);
-	uninit_q->queuedata = queuedata;
-
-	/*
-	 * Initialize the queue without an elevator. device_add_disk() will do
-	 * the initialization.
-	 */
-	q = blk_mq_init_allocated_queue(set, uninit_q, false);
-	if (IS_ERR(q))
-		blk_cleanup_queue(uninit_q);
-
+	q->queuedata = queuedata;
+	ret = blk_mq_init_allocated_queue(set, q);
+	if (ret) {
+		blk_cleanup_queue(q);
+		return ERR_PTR(ret);
+	}
 	return q;
 }
 EXPORT_SYMBOL_GPL(blk_mq_init_queue_data);
@@ -3273,9 +3270,8 @@ static void blk_mq_realloc_hw_ctxs(struct blk_mq_tag_set *set,
 	mutex_unlock(&q->sysfs_lock);
 }
 
-struct request_queue *blk_mq_init_allocated_queue(struct blk_mq_tag_set *set,
-						  struct request_queue *q,
-						  bool elevator_init)
+int blk_mq_init_allocated_queue(struct blk_mq_tag_set *set,
+		struct request_queue *q)
 {
 	/* mark the queue as mq asap */
 	q->mq_ops = set->ops;
@@ -3325,11 +3321,7 @@ struct request_queue *blk_mq_init_allocated_queue(struct blk_mq_tag_set *set,
 	blk_mq_init_cpu_queues(q, set->nr_hw_queues);
 	blk_mq_add_queue_tag_set(set, q);
 	blk_mq_map_swqueue(q);
-
-	if (elevator_init)
-		elevator_init_mq(q);
-
-	return q;
+	return 0;
 
 err_hctxs:
 	kfree(q->queue_hw_ctx);
@@ -3340,7 +3332,7 @@ struct request_queue *blk_mq_init_allocated_queue(struct blk_mq_tag_set *set,
 	q->poll_cb = NULL;
 err_exit:
 	q->mq_ops = NULL;
-	return ERR_PTR(-ENOMEM);
+	return -ENOMEM;
 }
 EXPORT_SYMBOL(blk_mq_init_allocated_queue);
 
diff --git a/block/blk.h b/block/blk.h
index 3440142f029b..d3fa47af3607 100644
--- a/block/blk.h
+++ b/block/blk.h
@@ -192,7 +192,6 @@ void blk_account_io_done(struct request *req, u64 now);
 
 void blk_insert_flush(struct request *rq);
 
-void elevator_init_mq(struct request_queue *q);
 int elevator_switch_mq(struct request_queue *q,
 			      struct elevator_type *new_e);
 void __elevator_exit(struct request_queue *, struct elevator_queue *);
diff --git a/block/elevator.c b/block/elevator.c
index 440699c28119..06e203426410 100644
--- a/block/elevator.c
+++ b/block/elevator.c
@@ -693,7 +693,7 @@ void elevator_init_mq(struct request_queue *q)
 		elevator_put(e);
 	}
 }
-
+EXPORT_SYMBOL_GPL(elevator_init_mq); /* only for dm-rq */
 
 /*
  * switch to new_e io scheduler. be careful not to introduce deadlocks -
diff --git a/drivers/md/dm-rq.c b/drivers/md/dm-rq.c
index 9c3bc3711b33..0dbd48cbdff9 100644
--- a/drivers/md/dm-rq.c
+++ b/drivers/md/dm-rq.c
@@ -530,7 +530,6 @@ static const struct blk_mq_ops dm_mq_ops = {
 
 int dm_mq_init_request_queue(struct mapped_device *md, struct dm_table *t)
 {
-	struct request_queue *q;
 	struct dm_target *immutable_tgt;
 	int err;
 
@@ -557,12 +556,10 @@ int dm_mq_init_request_queue(struct mapped_device *md, struct dm_table *t)
 	if (err)
 		goto out_kfree_tag_set;
 
-	q = blk_mq_init_allocated_queue(md->tag_set, md->queue, true);
-	if (IS_ERR(q)) {
-		err = PTR_ERR(q);
+	err = blk_mq_init_allocated_queue(md->tag_set, md->queue);
+	if (err)
 		goto out_tag_set;
-	}
-
+	elevator_init_mq(md->queue);
 	return 0;
 
 out_tag_set:
diff --git a/include/linux/blk-mq.h b/include/linux/blk-mq.h
index bb950fc669ef..73750b2838d2 100644
--- a/include/linux/blk-mq.h
+++ b/include/linux/blk-mq.h
@@ -429,9 +429,8 @@ enum {
 struct request_queue *blk_mq_init_queue(struct blk_mq_tag_set *);
 struct request_queue *blk_mq_init_queue_data(struct blk_mq_tag_set *set,
 		void *queuedata);
-struct request_queue *blk_mq_init_allocated_queue(struct blk_mq_tag_set *set,
-						  struct request_queue *q,
-						  bool elevator_init);
+int blk_mq_init_allocated_queue(struct blk_mq_tag_set *set,
+		struct request_queue *q);
 struct request_queue *blk_mq_init_sq_queue(struct blk_mq_tag_set *set,
 						const struct blk_mq_ops *ops,
 						unsigned int queue_depth,
diff --git a/include/linux/elevator.h b/include/linux/elevator.h
index dcb2f9022c1d..783ecb3cb77a 100644
--- a/include/linux/elevator.h
+++ b/include/linux/elevator.h
@@ -120,6 +120,7 @@ extern void elv_merged_request(struct request_queue *, struct request *,
 extern bool elv_attempt_insert_merge(struct request_queue *, struct request *);
 extern struct request *elv_former_request(struct request_queue *, struct request *);
 extern struct request *elv_latter_request(struct request_queue *, struct request *);
+void elevator_init_mq(struct request_queue *q);
 
 /*
  * io scheduler registration
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
