Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F30F5C001E0
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jul 2023 08:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f11F7wOdVRCuu1FakOtAiycbTz+RybqpUNGSjtmZjNA=; b=3KQIggzheuJgf0
	bxTGwWDl8SadwBYBtb8Ppr/RdlD4UpZyNXdGS+j2RNlLPprtTsUzO4TwN48JH3Hs21CEmLhba0coZ
	Y+HbNu7dJLrWeMd/LjLdOOdn/BWs7EFfM96B/vrpDC77EriuS4Qa/Wh2vicf8OBJ2Vat+sLttwYrK
	hgNuAC8WJEii7u3mSWaxsIl0JlZar/2o8r5QJ94qYyhJTPvLdqP13i9gZhbgnS/u1+PIPB1sjiSqS
	S4p6BUD/e3rU3ken9Kcnslkx7Mx8yGgDqB+8whqk1XDV5XycqYzG1AObfLMoh/JwsE64+/ELmzETo
	Zqxka/RkwGYKMrjmdn9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOw6J-00CcC2-0b;
	Thu, 27 Jul 2023 08:11:59 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOw6E-00Cc9A-22
	for linux-mtd@lists.infradead.org;
	Thu, 27 Jul 2023 08:11:56 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-682eef7d752so204567b3a.0
        for <linux-mtd@lists.infradead.org>; Thu, 27 Jul 2023 01:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1690445514; x=1691050314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v2xQZfHf5bNVsT7uWSGQWuu07PHxrGT3T56hFvtqSrg=;
        b=lyW6JZhnNvjcNaB7GqN1uV2v79yXaXII/N9CUBx8Ax42gYi0bx7SyKZlp7ota5OGyc
         xz3LFUjbyjINutpLynebvvBHzacoCfStfnIiREC/M8s52LB/S8PozvhLHL2LaKHkf4jF
         9DRdteQ8XPpE6p0UjhjwxUS6BE53kxXxgyc4CEqj+ED289GAULMwnheYekYUqCpohGt5
         Gmsuq+KFKYVL89VZVFvc5W/65nqN5yxt+BmUFxBx+3K9aBUApmiSNjlOWSgfmJvwi5CC
         101OAH2cZQROpO/yBfNUpOitoioZFpWL88ogBko0HO5BvQ0gPjZ0smA8q12LAj1M0Z4O
         lOvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690445514; x=1691050314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v2xQZfHf5bNVsT7uWSGQWuu07PHxrGT3T56hFvtqSrg=;
        b=FTJ41WRapWyOB4OdWCxhNmICWRpW8DR87Fl9jMehxNgFympJdli6IDy1yAaaMq3nIx
         EcLisdKWpDIZUG5FcDinjKWgf4y5tTt67fTKk1tr1mYKEqLD1lWjv7bisGWhBlWNiPpR
         f8nX99I3BeNr+r6Z+HsBw91ymp+fGiKvdwhz7vPJjx/gOswZg44tjV5ulTPXtkAJI9Ts
         iziPYXUKbntLOqd2B1wzshl3hmgwDyohu7XzyOErPxMc6KNGXaspw2vaw2QPO0AxgKTn
         a05DK+tXfgh5gaOI3tHSb09rPJHvtMDyJzDzj4qaNlpOza3LEB5Xm3F6CseIWflaUeLY
         odHg==
X-Gm-Message-State: ABy/qLb0Pk3znRpjuHeAZ/PARD4QDLbCI+oNKDdVw+mHrkKOCh7nFlH/
	x1yQ7BPzDyghEAGD45Ii9kJPBQ==
X-Google-Smtp-Source: APBJJlFvU3cjl1WLZK8F+guGojMG4R1fFJkvV7n2FNowsaFmG5z+7vBu+UKq72H6C7V5uf+meL2LRA==
X-Received: by 2002:a05:6a00:4a0e:b0:677:3439:874a with SMTP id do14-20020a056a004a0e00b006773439874amr5204339pfb.3.1690445513983;
        Thu, 27 Jul 2023 01:11:53 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
        by smtp.gmail.com with ESMTPSA id j8-20020aa78d08000000b006828e49c04csm885872pfe.75.2023.07.27.01.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 01:11:53 -0700 (PDT)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: akpm@linux-foundation.org,
	david@fromorbit.com,
	tkhai@ya.ru,
	vbabka@suse.cz,
	roman.gushchin@linux.dev,
	djwong@kernel.org,
	brauner@kernel.org,
	paulmck@kernel.org,
	tytso@mit.edu,
	steven.price@arm.com,
	cel@kernel.org,
	senozhatsky@chromium.org,
	yujie.liu@intel.com,
	gregkh@linuxfoundation.org,
	muchun.song@linux.dev
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	x86@kernel.org,
	kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-erofs@lists.ozlabs.org,
	linux-f2fs-devel@lists.sourceforge.net,
	cluster-devel@redhat.com,
	linux-nfs@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	rcu@vger.kernel.org,
	netdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	dm-devel@redhat.com,
	linux-raid@vger.kernel.org,
	linux-bcache@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	linux-fsdevel@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	linux-xfs@vger.kernel.org,
	linux-btrfs@vger.kernel.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v3 30/49] bcache: dynamically allocate the md-bcache shrinker
Date: Thu, 27 Jul 2023 16:04:43 +0800
Message-Id: <20230727080502.77895-31-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
References: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_011154_938611_520C6937 
X-CRM114-Status: GOOD (  15.98  )
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

In preparation for implementing lockless slab shrink, use new APIs to
dynamically allocate the md-bcache shrinker, so that it can be freed
asynchronously using kfree_rcu(). Then it doesn't need to wait for RCU
read-side critical section when releasing the struct cache_set.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 drivers/md/bcache/bcache.h |  2 +-
 drivers/md/bcache/btree.c  | 27 ++++++++++++++++-----------
 drivers/md/bcache/sysfs.c  |  3 ++-
 3 files changed, 19 insertions(+), 13 deletions(-)

diff --git a/drivers/md/bcache/bcache.h b/drivers/md/bcache/bcache.h
index 5a79bb3c272f..c622bc50f81b 100644
--- a/drivers/md/bcache/bcache.h
+++ b/drivers/md/bcache/bcache.h
@@ -541,7 +541,7 @@ struct cache_set {
 	struct bio_set		bio_split;
 
 	/* For the btree cache */
-	struct shrinker		shrink;
+	struct shrinker		*shrink;
 
 	/* For the btree cache and anything allocation related */
 	struct mutex		bucket_lock;
diff --git a/drivers/md/bcache/btree.c b/drivers/md/bcache/btree.c
index fd121a61f17c..ae5cbb55861f 100644
--- a/drivers/md/bcache/btree.c
+++ b/drivers/md/bcache/btree.c
@@ -667,7 +667,7 @@ static int mca_reap(struct btree *b, unsigned int min_order, bool flush)
 static unsigned long bch_mca_scan(struct shrinker *shrink,
 				  struct shrink_control *sc)
 {
-	struct cache_set *c = container_of(shrink, struct cache_set, shrink);
+	struct cache_set *c = shrink->private_data;
 	struct btree *b, *t;
 	unsigned long i, nr = sc->nr_to_scan;
 	unsigned long freed = 0;
@@ -734,7 +734,7 @@ static unsigned long bch_mca_scan(struct shrinker *shrink,
 static unsigned long bch_mca_count(struct shrinker *shrink,
 				   struct shrink_control *sc)
 {
-	struct cache_set *c = container_of(shrink, struct cache_set, shrink);
+	struct cache_set *c = shrink->private_data;
 
 	if (c->shrinker_disabled)
 		return 0;
@@ -752,8 +752,8 @@ void bch_btree_cache_free(struct cache_set *c)
 
 	closure_init_stack(&cl);
 
-	if (c->shrink.list.next)
-		unregister_shrinker(&c->shrink);
+	if (c->shrink)
+		shrinker_free(c->shrink);
 
 	mutex_lock(&c->bucket_lock);
 
@@ -828,14 +828,19 @@ int bch_btree_cache_alloc(struct cache_set *c)
 		c->verify_data = NULL;
 #endif
 
-	c->shrink.count_objects = bch_mca_count;
-	c->shrink.scan_objects = bch_mca_scan;
-	c->shrink.seeks = 4;
-	c->shrink.batch = c->btree_pages * 2;
+	c->shrink = shrinker_alloc(0, "md-bcache:%pU", c->set_uuid);
+	if (!c->shrink) {
+		pr_warn("bcache: %s: could not allocate shrinker\n", __func__);
+		return 0;
+	}
+
+	c->shrink->count_objects = bch_mca_count;
+	c->shrink->scan_objects = bch_mca_scan;
+	c->shrink->seeks = 4;
+	c->shrink->batch = c->btree_pages * 2;
+	c->shrink->private_data = c;
 
-	if (register_shrinker(&c->shrink, "md-bcache:%pU", c->set_uuid))
-		pr_warn("bcache: %s: could not register shrinker\n",
-				__func__);
+	shrinker_register(c->shrink);
 
 	return 0;
 }
diff --git a/drivers/md/bcache/sysfs.c b/drivers/md/bcache/sysfs.c
index 0e2c1880f60b..45d8af755de6 100644
--- a/drivers/md/bcache/sysfs.c
+++ b/drivers/md/bcache/sysfs.c
@@ -866,7 +866,8 @@ STORE(__bch_cache_set)
 
 		sc.gfp_mask = GFP_KERNEL;
 		sc.nr_to_scan = strtoul_or_return(buf);
-		c->shrink.scan_objects(&c->shrink, &sc);
+		if (c->shrink)
+			c->shrink->scan_objects(c->shrink, &sc);
 	}
 
 	sysfs_strtoul_clamp(congested_read_threshold_us,
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
