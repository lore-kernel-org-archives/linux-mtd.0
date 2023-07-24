Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E961C0015E
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Jul 2023 10:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KCUhIEkZVOBFCkfyRHIGnvlUUsk1ZbcWWOm9afUBfdc=; b=03meVNllw6TklD
	SM+Pbyx2dhUNk1xmBO0zZIDFamDUnswGtmgpSztUTchwesdj2cK4Aafbfx7/k4u4waZr7NCoJ9QTp
	VtsQRZ6f0HnF+lXtQazHvsPDJ2xc17zyktyNlHAH+4LCHyyc43Lnk/XfJTM4CFS9zYC0tp8jQxPcH
	32cubgKeWmCq7JuHVOaoDVnsYy0CAG7Y6A+obgBvUhrW+MtWnzWLxW2pLa1RTpgJT4RnpSww/vmp1
	JE+JxXq2jVn7cz6USkxr47Us4IiDUzRIdQ5mi3ffg4YNxIbuT71UzdQPzdqdd7RRq0SUruYZBYDz8
	4FXPgZr+kzVKihP5iosA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNtFG-003v9l-33;
	Mon, 24 Jul 2023 10:56:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNtFF-003v98-13
	for linux-mtd@bombadil.infradead.org;
	Mon, 24 Jul 2023 10:56:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=tgz3Agis5n4s/WxjwmGNRU8p70ZOSlVCE9Y6IFYv5Fc=; b=Wkbzs1zkXyXiqCCQZkqFDBipa7
	QGD4ulJOYs7ws/mIO42DSVBMYTgOR3wJCfWF/toWCtMvBqQMFZYiR7Vrz7q7KJzwg9vAhQOdQYtIg
	9zeV1Xm9DAfptlw9FdbfeHxzskGrCs9wbCrd8f+xV2LYGKYmDVYNwv+mWGSbgl4e/SVpSyjI8IdBb
	oIcJK1Z0l/cz3w6ovRQqaHpwyEMm1uqksU3cDUZ/2dlIrYiwdZKwcqe1FpGHxXEBS+3ImIYW5UzDe
	cWoLptBaDOl18Iy7gUA4fadLUcfGus1AhY7O5f+BRnA4VqC2xVqwVOtEvLPTq/9Ne/eOrSg/2ifNj
	gyjleGdA==;
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNsFv-002X24-1e
	for linux-mtd@lists.infradead.org;
	Mon, 24 Jul 2023 09:53:33 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6864c144897so1023548b3a.1
        for <linux-mtd@lists.infradead.org>; Mon, 24 Jul 2023 02:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1690192409; x=1690797209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tgz3Agis5n4s/WxjwmGNRU8p70ZOSlVCE9Y6IFYv5Fc=;
        b=eiUPUGpded6z/EEpZ8kcBg2OU6CGo1gYbzczLwywLM+tiNX7NfxZ/UX56b+ECXWGVH
         v0+fBr9ZR2zpMAlXtEMsjJ0CP0T6ghJOZlIp4XvJRpj8mBoc0pWtxFqlQOAd5pU8ho3C
         /ZF88/qParVm3q/t2C5C9G6TKSIcK6iTaJcqE2ic3WbFUt7IFInWBxxki/5fOt9V+TbB
         A3A3KxQQy8HhELpvIDxSXQyR+9LFYaXi6y1sjrAoM0XnjPHdW4Yjr/fiDUUV6qlqOpNO
         kBdOBkmF9qj5RcGgCCau8brZhsZui1mwOYvY6Yl7YB6A8sVwNtEK8JeAfRs7jSuBenIO
         iXvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690192409; x=1690797209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tgz3Agis5n4s/WxjwmGNRU8p70ZOSlVCE9Y6IFYv5Fc=;
        b=DQsoKI2kQ1U2pxtq9sET8lwQH6yyCz1mOLC4mlfe0k41Ymb/k8oOqbxVp235ixe2BK
         jW4tt0SebIqjgYzqlbm/buOk19iPRk/YgNR5LmWft8FQR6lu/6HH19W8Qz72DsqenpR+
         8P7VUiP6pUZkz6HWXpWO8cuAIYGcnvhdcR4ITCpxidIxoyYElEAzeceZzFAKaDuidKlu
         ZJK/fhGlsUmTySn0SLuMKPW1sq6JBGUI3jOGe9TkJxdCJdUm0wuyV2xBlzb2DiYeuBjr
         w3MOT8wgzn+8sPdvWjiLClPUr+rxPZKOOeXVgcwT59oQUX1N7lnQ6M6OeSz2Yk37IHkS
         FI+w==
X-Gm-Message-State: ABy/qLYVbkXRfI8/YCgTQzE8CEg7lm25IyHLgvraghUY6ZrmPu3aNzQ4
	wV+GEHbo/FiGdXraoqBX0K8asg==
X-Google-Smtp-Source: APBJJlGQECD+YmQyidx3CbYp8mtos2ukz3b+adApuBRwpx+yQP4R50i+1wYRdDRgYwf/0cvAmnpMMg==
X-Received: by 2002:a17:902:f681:b0:1b8:a469:53d8 with SMTP id l1-20020a170902f68100b001b8a46953d8mr12732513plg.0.1690192409468;
        Mon, 24 Jul 2023 02:53:29 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
        by smtp.gmail.com with ESMTPSA id d5-20020a170902c18500b001bb20380bf2sm8467233pld.13.2023.07.24.02.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 02:53:29 -0700 (PDT)
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
Subject: [PATCH v2 42/47] drm/ttm: introduce pool_shrink_rwsem
Date: Mon, 24 Jul 2023 17:43:49 +0800
Message-Id: <20230724094354.90817-43-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_105331_663306_A1647687 
X-CRM114-Status: GOOD (  12.75  )
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

Currently, the synchronize_shrinkers() is only used by TTM pool. It only
requires that no shrinkers run in parallel.

After we use RCU+refcount method to implement the lockless slab shrink,
we can not use shrinker_rwsem or synchronize_rcu() to guarantee that all
shrinker invocations have seen an update before freeing memory.

So we introduce a new pool_shrink_rwsem to implement a private
synchronize_shrinkers(), so as to achieve the same purpose.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 drivers/gpu/drm/ttm/ttm_pool.c | 15 +++++++++++++++
 include/linux/shrinker.h       |  2 --
 mm/shrinker.c                  | 15 ---------------
 3 files changed, 15 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
index e1eb73d0b72a..8a35fd48ec46 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -74,6 +74,7 @@ static struct ttm_pool_type global_dma32_uncached[MAX_ORDER + 1];
 static spinlock_t shrinker_lock;
 static struct list_head shrinker_list;
 static struct shrinker *mm_shrinker;
+static DECLARE_RWSEM(pool_shrink_rwsem);
 
 /* Allocate pages of size 1 << order with the given gfp_flags */
 static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
@@ -317,6 +318,7 @@ static unsigned int ttm_pool_shrink(void)
 	unsigned int num_pages;
 	struct page *p;
 
+	down_read(&pool_shrink_rwsem);
 	spin_lock(&shrinker_lock);
 	pt = list_first_entry(&shrinker_list, typeof(*pt), shrinker_list);
 	list_move_tail(&pt->shrinker_list, &shrinker_list);
@@ -329,6 +331,7 @@ static unsigned int ttm_pool_shrink(void)
 	} else {
 		num_pages = 0;
 	}
+	up_read(&pool_shrink_rwsem);
 
 	return num_pages;
 }
@@ -572,6 +575,18 @@ void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
 }
 EXPORT_SYMBOL(ttm_pool_init);
 
+/**
+ * synchronize_shrinkers - Wait for all running shrinkers to complete.
+ *
+ * This is useful to guarantee that all shrinker invocations have seen an
+ * update, before freeing memory, similar to rcu.
+ */
+static void synchronize_shrinkers(void)
+{
+	down_write(&pool_shrink_rwsem);
+	up_write(&pool_shrink_rwsem);
+}
+
 /**
  * ttm_pool_fini - Cleanup a pool
  *
diff --git a/include/linux/shrinker.h b/include/linux/shrinker.h
index e464b4e9be0e..23ea9360c5d8 100644
--- a/include/linux/shrinker.h
+++ b/include/linux/shrinker.h
@@ -105,8 +105,6 @@ void shrinker_free_non_registered(struct shrinker *shrinker);
 void shrinker_register(struct shrinker *shrinker);
 void shrinker_unregister(struct shrinker *shrinker);
 
-extern void synchronize_shrinkers(void);
-
 #ifdef CONFIG_SHRINKER_DEBUG
 extern int shrinker_debugfs_add(struct shrinker *shrinker);
 extern struct dentry *shrinker_debugfs_detach(struct shrinker *shrinker,
diff --git a/mm/shrinker.c b/mm/shrinker.c
index 2f3635ad1b45..3c4d3fe2fa17 100644
--- a/mm/shrinker.c
+++ b/mm/shrinker.c
@@ -660,18 +660,3 @@ void shrinker_unregister(struct shrinker *shrinker)
 	kfree(shrinker);
 }
 EXPORT_SYMBOL(shrinker_unregister);
-
-/**
- * synchronize_shrinkers - Wait for all running shrinkers to complete.
- *
- * This is equivalent to calling unregister_shrink() and register_shrinker(),
- * but atomically and with less overhead. This is useful to guarantee that all
- * shrinker invocations have seen an update, before freeing memory, similar to
- * rcu.
- */
-void synchronize_shrinkers(void)
-{
-	down_write(&shrinker_rwsem);
-	up_write(&shrinker_rwsem);
-}
-EXPORT_SYMBOL(synchronize_shrinkers);
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
