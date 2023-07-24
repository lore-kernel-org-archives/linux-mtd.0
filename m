Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DEFEC001DF
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Jul 2023 09:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2124R8J+10RZuVwfhoxTq8aP60bNkmqzlg7jDEe48aE=; b=bAw3nAwhpA7otp
	zPxRo4jNwePL3sx22L4lZnrQ1FCiLT8q24cWAUJesTNXSSZAbf+ZkTZtiOQ4RrI7XgeVcCs/R3fKV
	V6OSe7biOam86pLD6/dwEWekA0gosQDNBTQMuXCrsDodun/dqiW3sKzrFeh2nqEx6HcNcePCwFCRy
	YiBDDfGtqgSsmxC5ErZCQZDJxLDpalPxSxvd+SszlcMohYpFnVonuk191c5p9vDy1V3ePVNbvf8SV
	BX4fFGT0UsRJ2NhNNn+wnJVPlLy7nSYspMoAurrBEU51DtnaR9M9i0UWYUSKRhtjHHimOqK74tHFw
	OQpjUqkD9bKcl20n7G7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNsGu-003X5y-2n;
	Mon, 24 Jul 2023 09:54:32 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNsGr-003X4o-1k
	for linux-mtd@lists.infradead.org;
	Mon, 24 Jul 2023 09:54:31 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1bba9539a23so652845ad.1
        for <linux-mtd@lists.infradead.org>; Mon, 24 Jul 2023 02:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1690192469; x=1690797269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F/oK6bm2Afi7WKsfFLPLaSlUUie3UdhMRHX1z52bb4o=;
        b=W9Prg0fDQM4GlbOp7Efh7k12YSFxbQAIDSIFUNXpcxiaiwsMOqIS9spB+ZW9R8bqkG
         2eUk3vAJhRvOfzbc0lzRJ0pjebzRGDfg8mSr9wE4svx2n4tEZzvgmCHhvlLJZaqcPuTF
         ajZf7zR02a5nB3jGeTnCYDCOv2ZoK+omuzdRQRiU6Gx6ifxD/5gUipR32piSj3zU9ojE
         giQ5EbsOhgO/nBwZ9hR/Jy1y+NlQ/pZ5vMWcA3q2UVTMdeqbP2Ck3FtJpUlMmobx8vUB
         vcMI8GxEI7t1W6HxEfOkf8W6IvWEtYrQu4A2vSBZhjnQNuGVAvXWDybi001tXCfDYH7J
         BNiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690192469; x=1690797269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F/oK6bm2Afi7WKsfFLPLaSlUUie3UdhMRHX1z52bb4o=;
        b=GyWvIIz8Ov700InQzhz+BalGgVQ7WttG6tt1okilauhQvwmd9Qlu7ySCf2QJbrllac
         8m7YxzaremOyzy4fgviREr/1Rm8H7TpXD820Q7JEKlWp2z+EP1zB4yLObTNnrSxDQ7AM
         LrWPPtAFFIQ7ZzyLNiqZsc2fMLvb+Is6mJYQaIKbCSHLGCNNAWkpQwoZv5+RBmBhoIQe
         d3F5f/ugNLVHtIqFoYpZNg/KQNHMNHhqbERv/Y24jFGpr7W+MH0mZbqCnEb+EA2J6ey+
         QxKgPYSqfMu5aBocYastJHNgQRg2asM8j0AqUJv3O7Usk3OELtNZ4NMfkx5NYSjBfu3M
         GFOw==
X-Gm-Message-State: ABy/qLY2pto1KC5UnUM0+pIuwYDIsPeG2v/1itmOuiGc5K3bPhZeROtp
	4pcmyjVuqU/Q2p/4VWyAK3T7Yg==
X-Google-Smtp-Source: APBJJlFeSJXGwKM1/4Fx4M034iEieIqp39l7VwM/I3gIgSntmWk50xYbsW/3q3bB2XT8c22SamI2Bg==
X-Received: by 2002:a17:902:dad2:b0:1b8:9fc4:2733 with SMTP id q18-20020a170902dad200b001b89fc42733mr12483608plx.3.1690192468770;
        Mon, 24 Jul 2023 02:54:28 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
        by smtp.gmail.com with ESMTPSA id d5-20020a170902c18500b001bb20380bf2sm8467233pld.13.2023.07.24.02.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 02:54:28 -0700 (PDT)
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
Subject: [PATCH v2 47/47] mm: shrinker: convert shrinker_rwsem to mutex
Date: Mon, 24 Jul 2023 17:43:54 +0800
Message-Id: <20230724094354.90817-48-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_025429_580975_85AF540D 
X-CRM114-Status: GOOD (  16.24  )
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

Now there are no readers of shrinker_rwsem, so we can simply replace it
with mutex lock.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 drivers/md/dm-cache-metadata.c |  2 +-
 fs/super.c                     |  2 +-
 mm/shrinker.c                  | 16 ++++++++--------
 mm/shrinker_debug.c            | 14 +++++++-------
 4 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/md/dm-cache-metadata.c b/drivers/md/dm-cache-metadata.c
index acffed750e3e..9e0c69958587 100644
--- a/drivers/md/dm-cache-metadata.c
+++ b/drivers/md/dm-cache-metadata.c
@@ -1828,7 +1828,7 @@ int dm_cache_metadata_abort(struct dm_cache_metadata *cmd)
 	 * Replacement block manager (new_bm) is created and old_bm destroyed outside of
 	 * cmd root_lock to avoid ABBA deadlock that would result (due to life-cycle of
 	 * shrinker associated with the block manager's bufio client vs cmd root_lock).
-	 * - must take shrinker_rwsem without holding cmd->root_lock
+	 * - must take shrinker_mutex without holding cmd->root_lock
 	 */
 	new_bm = dm_block_manager_create(cmd->bdev, DM_CACHE_METADATA_BLOCK_SIZE << SECTOR_SHIFT,
 					 CACHE_MAX_CONCURRENT_LOCKS);
diff --git a/fs/super.c b/fs/super.c
index 04643fd80886..602cf54eb7da 100644
--- a/fs/super.c
+++ b/fs/super.c
@@ -54,7 +54,7 @@ static char *sb_writers_name[SB_FREEZE_LEVELS] = {
  * One thing we have to be careful of with a per-sb shrinker is that we don't
  * drop the last active reference to the superblock from within the shrinker.
  * If that happens we could trigger unregistering the shrinker from within the
- * shrinker path and that leads to deadlock on the shrinker_rwsem. Hence we
+ * shrinker path and that leads to deadlock on the shrinker_mutex. Hence we
  * take a passive reference to the superblock to avoid this from occurring.
  */
 static unsigned long super_cache_scan(struct shrinker *shrink,
diff --git a/mm/shrinker.c b/mm/shrinker.c
index 90c045620fe3..5c4546d2c234 100644
--- a/mm/shrinker.c
+++ b/mm/shrinker.c
@@ -7,7 +7,7 @@
 #include <trace/events/vmscan.h>
 
 LIST_HEAD(shrinker_list);
-DECLARE_RWSEM(shrinker_rwsem);
+DEFINE_MUTEX(shrinker_mutex);
 DEFINE_SPINLOCK(shrinker_lock);
 
 #ifdef CONFIG_MEMCG
@@ -80,7 +80,7 @@ int alloc_shrinker_info(struct mem_cgroup *memcg)
 	int nid, ret = 0;
 	int array_size = 0;
 
-	down_write(&shrinker_rwsem);
+	mutex_lock(&shrinker_mutex);
 	array_size = shrinker_unit_size(shrinker_nr_max);
 	for_each_node(nid) {
 		info = kvzalloc_node(sizeof(*info) + array_size, GFP_KERNEL, nid);
@@ -91,7 +91,7 @@ int alloc_shrinker_info(struct mem_cgroup *memcg)
 			goto err;
 		rcu_assign_pointer(memcg->nodeinfo[nid]->shrinker_info, info);
 	}
-	up_write(&shrinker_rwsem);
+	mutex_unlock(&shrinker_mutex);
 
 	return ret;
 
@@ -104,7 +104,7 @@ static struct shrinker_info *shrinker_info_protected(struct mem_cgroup *memcg,
 						     int nid)
 {
 	return rcu_dereference_protected(memcg->nodeinfo[nid]->shrinker_info,
-					 lockdep_is_held(&shrinker_rwsem));
+					 lockdep_is_held(&shrinker_mutex));
 }
 
 static struct shrinker_info *shrinker_info_rcu(struct mem_cgroup *memcg,
@@ -158,7 +158,7 @@ static int expand_shrinker_info(int new_id)
 	int new_size, old_size = 0;
 	struct mem_cgroup *memcg;
 
-	down_write(&shrinker_rwsem);
+	mutex_lock(&shrinker_mutex);
 
 	if (!root_mem_cgroup)
 		goto out;
@@ -179,7 +179,7 @@ static int expand_shrinker_info(int new_id)
 	if (!ret)
 		shrinker_nr_max = new_nr_max;
 
-	up_write(&shrinker_rwsem);
+	mutex_unlock(&shrinker_mutex);
 
 	return ret;
 }
@@ -303,7 +303,7 @@ void reparent_shrinker_deferred(struct mem_cgroup *memcg)
 		parent = root_mem_cgroup;
 
 	/* Prevent from concurrent shrinker_info expand */
-	down_write(&shrinker_rwsem);
+	mutex_lock(&shrinker_mutex);
 	for_each_node(nid) {
 		child_info = shrinker_info_protected(memcg, nid);
 		parent_info = shrinker_info_protected(parent, nid);
@@ -316,7 +316,7 @@ void reparent_shrinker_deferred(struct mem_cgroup *memcg)
 			}
 		}
 	}
-	up_write(&shrinker_rwsem);
+	mutex_unlock(&shrinker_mutex);
 }
 #else
 static int shrinker_memcg_alloc(struct shrinker *shrinker)
diff --git a/mm/shrinker_debug.c b/mm/shrinker_debug.c
index badda35464c3..44b620b1919d 100644
--- a/mm/shrinker_debug.c
+++ b/mm/shrinker_debug.c
@@ -8,7 +8,7 @@
 #include <linux/rculist.h>
 
 /* defined in vmscan.c */
-extern struct rw_semaphore shrinker_rwsem;
+extern struct mutex shrinker_mutex;
 extern struct list_head shrinker_list;
 
 static DEFINE_IDA(shrinker_debugfs_ida);
@@ -168,7 +168,7 @@ int shrinker_debugfs_add(struct shrinker *shrinker)
 	if (!shrinker_debugfs_root)
 		return 0;
 
-	down_write(&shrinker_rwsem);
+	mutex_lock(&shrinker_mutex);
 	if (shrinker->debugfs_entry)
 		goto fail;
 
@@ -196,7 +196,7 @@ int shrinker_debugfs_add(struct shrinker *shrinker)
 			    &shrinker_debugfs_scan_fops);
 
 fail:
-	up_write(&shrinker_rwsem);
+	mutex_unlock(&shrinker_mutex);
 	return ret;
 }
 
@@ -215,7 +215,7 @@ int shrinker_debugfs_rename(struct shrinker *shrinker, const char *fmt, ...)
 	if (!new)
 		return -ENOMEM;
 
-	down_write(&shrinker_rwsem);
+	mutex_lock(&shrinker_mutex);
 
 	old = shrinker->name;
 	shrinker->name = new;
@@ -233,7 +233,7 @@ int shrinker_debugfs_rename(struct shrinker *shrinker, const char *fmt, ...)
 			shrinker->debugfs_entry = entry;
 	}
 
-	up_write(&shrinker_rwsem);
+	mutex_unlock(&shrinker_mutex);
 
 	kfree_const(old);
 
@@ -246,7 +246,7 @@ struct dentry *shrinker_debugfs_detach(struct shrinker *shrinker,
 {
 	struct dentry *entry = shrinker->debugfs_entry;
 
-	down_write(&shrinker_rwsem);
+	mutex_lock(&shrinker_mutex);
 	kfree_const(shrinker->name);
 	shrinker->name = NULL;
 
@@ -257,7 +257,7 @@ struct dentry *shrinker_debugfs_detach(struct shrinker *shrinker,
 	 */
 	smp_wmb();
 	shrinker->debugfs_entry = NULL;
-	up_write(&shrinker_rwsem);
+	mutex_unlock(&shrinker_mutex);
 
 	return entry;
 }
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
