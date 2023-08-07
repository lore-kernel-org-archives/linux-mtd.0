Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8637CC001DF
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Aug 2023 12:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EdSsptsTjCF3H8An3cvCswk2K80SQMgl0seVSUEFXTc=; b=Hg7a72BzOZi0ER
	/yPsntVyBQbCO1kLw2yXyaMqInDr8YFxlYkrihyWMUviAKIS0wYbQXtxa6+Gx9jsk5AKPx0XA7tNj
	cVrhNxd+sjWnQpgL+chMBl7r7ksg29r9I/vMJwvNlbXA3AjZgPas1aFhidE+7eiwguAk62wmeg9h2
	t2dIe2z3OHHJ8+EtcV5vXk6w8Ri3Tl5M2PYkMJdpt/ntFC0AZJFXHFVVRM2T8LfgElumk1BcEPDyC
	yx6kncmH8Ku0fOO2M1clwNoBJ9aVKeGua67pqUelmptj/9stMQxe3rkLgGgWOMp/6S0Q391tB2quK
	GKwviGGoGecN65F4kqjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSzNS-00HDCR-1N;
	Mon, 07 Aug 2023 12:30:26 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qSyGW-00H3JI-0o
	for linux-mtd@lists.infradead.org;
	Mon, 07 Aug 2023 11:19:13 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1bc76cdf0cbso605985ad.1
        for <linux-mtd@lists.infradead.org>; Mon, 07 Aug 2023 04:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1691407148; x=1692011948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dp1PQp+5gTkm4DG/kxrQVAZ0rB7KyI/rGW6TiEnUaUw=;
        b=Te7kg9d2kQW6gac9UP89KtIVcLTfWDu6srH7dtxrmXTL4ErpAX/pJkQtXd7hg2HtRV
         b8geFLLbM8+wRhZIYuLjJhyOfyGHnlddPjbSoTi8+7JUn0itl8DrGEf9FkegNhDgT4QU
         +aRhY4yC93Sy/uol3bSwIULh/giMXKgqvscX8PDfZ03M6CNIZOjJqm4ZovfIFxg7FXvq
         HemaZ47NKkfhG9oH07mD8LDQiWRUxbmI+sshlvUeh5qK7EeOWS/jAB9AyDVCuXh9Krsn
         cGXM1IoaSAiEJffIAN7TmuDV3qm2xRt9nfiAYhQ3/VTYWFSG3zxU2XV/jGXOIaUTjpLr
         zeJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691407148; x=1692011948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dp1PQp+5gTkm4DG/kxrQVAZ0rB7KyI/rGW6TiEnUaUw=;
        b=hRf+U2Ej0xxmknEI+AEjOxTTnqDqcs7c3h2hRf8qFRg7k2xxVka9p6OLJDSGufwlsr
         EIQWr9+a+N3JFhypOlrpbkVWid3NY7byHjuvSkyfvricJSgdtF2AXfUW5aCDkC/m0HRo
         rfDBPlohy5cHXlM4k1DfgynOL3MqITpdkt7uAKVRpclQ9wy7EOa9/kExxxzY+7D6ZYnJ
         ivZew5wODwtIjkPN2mHQMJ6BL5FduWUsHAynWTF1XgpNmsLWkH4xvW13bardfRn25tH1
         H9ZvD3pJrgi0+wCn6AKocrEqBWxru5rre/az+uBG8yE+ThIQxWUdC93lVfgBWLsXtGaG
         D7pA==
X-Gm-Message-State: ABy/qLb6kj4nPMDcX/D6zOHpuHe6Juu5FHNs/z/ah4P8XdIW4hBCTXwg
	r8K/u26zRc8NcK9rVyhaX0cQgA==
X-Google-Smtp-Source: APBJJlGWGDf3ZP6TvEF/B95Km+XRmBUarTmlKp42txasQQnYUyfeo2SyrhxLvRA3BfrSE4M4+QRzMg==
X-Received: by 2002:a17:902:dace:b0:1b8:17e8:5472 with SMTP id q14-20020a170902dace00b001b817e85472mr32807567plx.1.1691407148534;
        Mon, 07 Aug 2023 04:19:08 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.146])
        by smtp.gmail.com with ESMTPSA id y13-20020a17090aca8d00b0025be7b69d73sm5861191pjt.12.2023.08.07.04.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 04:19:07 -0700 (PDT)
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
	muchun.song@linux.dev,
	simon.horman@corigine.com,
	dlemoal@kernel.org
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
	Qi Zheng <zhengqi.arch@bytedance.com>,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v4 43/48] drm/ttm: introduce pool_shrink_rwsem
Date: Mon,  7 Aug 2023 19:09:31 +0800
Message-Id: <20230807110936.21819-44-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230807110936.21819-1-zhengqi.arch@bytedance.com>
References: <20230807110936.21819-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_041912_288070_81DA8A43 
X-CRM114-Status: GOOD (  12.36  )
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
Reviewed-by: Muchun Song <songmuchun@bytedance.com>
---
 drivers/gpu/drm/ttm/ttm_pool.c | 15 +++++++++++++++
 include/linux/shrinker.h       |  2 --
 mm/shrinker.c                  | 15 ---------------
 3 files changed, 15 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
index c9c9618c0dce..38b4c280725c 100644
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
index c55c07c3f0cb..025c8070dd86 100644
--- a/include/linux/shrinker.h
+++ b/include/linux/shrinker.h
@@ -103,8 +103,6 @@ struct shrinker *shrinker_alloc(unsigned int flags, const char *fmt, ...);
 void shrinker_register(struct shrinker *shrinker);
 void shrinker_free(struct shrinker *shrinker);
 
-extern void synchronize_shrinkers(void);
-
 #ifdef CONFIG_SHRINKER_DEBUG
 extern int __printf(2, 3) shrinker_debugfs_rename(struct shrinker *shrinker,
 						  const char *fmt, ...);
diff --git a/mm/shrinker.c b/mm/shrinker.c
index 3ab301ff122d..a27779ed3798 100644
--- a/mm/shrinker.c
+++ b/mm/shrinker.c
@@ -650,18 +650,3 @@ void shrinker_free(struct shrinker *shrinker)
 	kfree(shrinker);
 }
 EXPORT_SYMBOL_GPL(shrinker_free);
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
