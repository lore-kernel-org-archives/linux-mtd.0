Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 928B6C04FDF
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jul 2023 08:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gf74i7kWp9s+yVLnjhUz5tS9ZDtR52zezFRdXGfMfb8=; b=iOgujBHR5eFzes
	gPAiyshcKCFO1o/j8IP3W+d7VSpza7JAig4kBnjSN6/gFaxyaieYJbpywmPCVbFJ3Ske3J09LQHDI
	Dz3bB7QJYh+XJwtg09FivqzUHDy4+U5ig3nLGzR+XfMxLZAUmPR6+t2eMjvDXWrbZtEG717kp0q0S
	ds//eD2gqKOrV541d3y3KYGNg9w++BLRBplkFOTHQREBPGoLJnMhEQ6B56B+p6EwH0JhzDlmiaQm0
	YhvUTcwoMcNjhLGyOI+QpR1Ep9wjajw/SZa/joeCFvhIKx/aFsaGvrjhpUWXrnxmCYFYMRWfj8dw0
	53O6y8Dk+JDgfRlAJrNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOw8t-00CdmU-0Y;
	Thu, 27 Jul 2023 08:14:39 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOw8o-00CdjZ-1o
	for linux-mtd@lists.infradead.org;
	Thu, 27 Jul 2023 08:14:37 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-682eef7d752so205025b3a.0
        for <linux-mtd@lists.infradead.org>; Thu, 27 Jul 2023 01:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1690445674; x=1691050474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G6s8y0Dka4KE4srOwy3I0FSAaIGrcYmvE6JrVZfCpDs=;
        b=MBKqtR+m6tRDLwGbmGnhkuL4q0cqlWsjDeU7ZVRwaOZMOF0riGkcJrkyInKFI0pYis
         mWaNeHtwDzmym2/d2f7OIfkckgap6Prz7ne5Q+65Q9kFa2z8w6TXtQPQCrjIFsYVVR2m
         PRIs97KnddHeo2KzvpuxuJU//NWKLj0FPiuARmlExd2GlY1ot6WyHoUBUu1qPjJUPpT3
         ZsG43k1Oz59Ii0r86zAALutb1Gd6A6cdhWxvrkZ21MO6UtDcxtLUaksPoYyR3li5MX3H
         RGe7M6IrmRvaAAMZm9ToAYQ8mPB0OkHGFsJVWBGXFBUa+qGlQpcM3sB1mv4YN0cfvLiI
         gBbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690445674; x=1691050474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G6s8y0Dka4KE4srOwy3I0FSAaIGrcYmvE6JrVZfCpDs=;
        b=fDgHLVWp0sltYznpjENoUsWMsDNCdSLVKSYHMYmTCi5HXO35AnNxm9QdqSatiOUpJY
         rlpe6HIEWLqaYC0pzNehVE3Tuvzt8dIDKN45CWHtEtzAfcWgwKsPI+gThQ0wOmc4nxb5
         8Vyb9oGlCqhz/K6vqZDXl+6lArEg6QMBz6ySd/1i3hXWscVOYNrE5M+VvYY98C6s0qo+
         MZFgbiOWdWG2Em8NV/Gm3yIop91HUB3tWRrbLVlJzVnfaqR5tbdXqehcK3Mm730W0b39
         vQ/Hj4Q7Zf363ncPa4w38hKgGdd5irDwY1n44WgfJ7hxbN1dklbZUwyEczjawhRbtBz9
         3JSg==
X-Gm-Message-State: ABy/qLb0BcELHemEfo3Odpt0GYAU98Eko4bEMep1M9DWAOCH40a9875m
	B+qPBpc/34arS9QxVAP50/f2bw==
X-Google-Smtp-Source: APBJJlHZc+tyEor0irWiukNNv0+VJsTfo/jEPBj29UYMUTILxfRG5SoeWB7BzCnWVmRXaEQSTc0xVA==
X-Received: by 2002:a05:6a00:4a0e:b0:677:3439:874a with SMTP id do14-20020a056a004a0e00b006773439874amr5210105pfb.3.1690445673911;
        Thu, 27 Jul 2023 01:14:33 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
        by smtp.gmail.com with ESMTPSA id j8-20020aa78d08000000b006828e49c04csm885872pfe.75.2023.07.27.01.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 01:14:33 -0700 (PDT)
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
	Qi Zheng <zhengqi.arch@bytedance.com>,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v3 43/49] mm: shrinker: remove old APIs
Date: Thu, 27 Jul 2023 16:04:56 +0800
Message-Id: <20230727080502.77895-44-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
References: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_011434_596945_552E75C4 
X-CRM114-Status: GOOD (  10.36  )
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

Now no users are using the old APIs, just remove them.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Reviewed-by: Muchun Song <songmuchun@bytedance.com>
---
 include/linux/shrinker.h |   7 --
 mm/shrinker.c            | 143 ---------------------------------------
 2 files changed, 150 deletions(-)

diff --git a/include/linux/shrinker.h b/include/linux/shrinker.h
index cc23ff0aee20..c55c07c3f0cb 100644
--- a/include/linux/shrinker.h
+++ b/include/linux/shrinker.h
@@ -103,13 +103,6 @@ struct shrinker *shrinker_alloc(unsigned int flags, const char *fmt, ...);
 void shrinker_register(struct shrinker *shrinker);
 void shrinker_free(struct shrinker *shrinker);
 
-extern int __printf(2, 3) prealloc_shrinker(struct shrinker *shrinker,
-					    const char *fmt, ...);
-extern void register_shrinker_prepared(struct shrinker *shrinker);
-extern int __printf(2, 3) register_shrinker(struct shrinker *shrinker,
-					    const char *fmt, ...);
-extern void unregister_shrinker(struct shrinker *shrinker);
-extern void free_prealloced_shrinker(struct shrinker *shrinker);
 extern void synchronize_shrinkers(void);
 
 #ifdef CONFIG_SHRINKER_DEBUG
diff --git a/mm/shrinker.c b/mm/shrinker.c
index 43a375f954f3..3ab301ff122d 100644
--- a/mm/shrinker.c
+++ b/mm/shrinker.c
@@ -651,149 +651,6 @@ void shrinker_free(struct shrinker *shrinker)
 }
 EXPORT_SYMBOL_GPL(shrinker_free);
 
-/*
- * Add a shrinker callback to be called from the vm.
- */
-static int __prealloc_shrinker(struct shrinker *shrinker)
-{
-	unsigned int size;
-	int err;
-
-	if (shrinker->flags & SHRINKER_MEMCG_AWARE) {
-		err = prealloc_memcg_shrinker(shrinker);
-		if (err != -ENOSYS)
-			return err;
-
-		shrinker->flags &= ~SHRINKER_MEMCG_AWARE;
-	}
-
-	size = sizeof(*shrinker->nr_deferred);
-	if (shrinker->flags & SHRINKER_NUMA_AWARE)
-		size *= nr_node_ids;
-
-	shrinker->nr_deferred = kzalloc(size, GFP_KERNEL);
-	if (!shrinker->nr_deferred)
-		return -ENOMEM;
-
-	return 0;
-}
-
-#ifdef CONFIG_SHRINKER_DEBUG
-int prealloc_shrinker(struct shrinker *shrinker, const char *fmt, ...)
-{
-	va_list ap;
-	int err;
-
-	va_start(ap, fmt);
-	shrinker->name = kvasprintf_const(GFP_KERNEL, fmt, ap);
-	va_end(ap);
-	if (!shrinker->name)
-		return -ENOMEM;
-
-	err = __prealloc_shrinker(shrinker);
-	if (err) {
-		kfree_const(shrinker->name);
-		shrinker->name = NULL;
-	}
-
-	return err;
-}
-#else
-int prealloc_shrinker(struct shrinker *shrinker, const char *fmt, ...)
-{
-	return __prealloc_shrinker(shrinker);
-}
-#endif
-
-void free_prealloced_shrinker(struct shrinker *shrinker)
-{
-#ifdef CONFIG_SHRINKER_DEBUG
-	kfree_const(shrinker->name);
-	shrinker->name = NULL;
-#endif
-	if (shrinker->flags & SHRINKER_MEMCG_AWARE) {
-		down_write(&shrinker_rwsem);
-		unregister_memcg_shrinker(shrinker);
-		up_write(&shrinker_rwsem);
-		return;
-	}
-
-	kfree(shrinker->nr_deferred);
-	shrinker->nr_deferred = NULL;
-}
-
-void register_shrinker_prepared(struct shrinker *shrinker)
-{
-	down_write(&shrinker_rwsem);
-	list_add_tail(&shrinker->list, &shrinker_list);
-	shrinker->flags |= SHRINKER_REGISTERED;
-	shrinker_debugfs_add(shrinker);
-	up_write(&shrinker_rwsem);
-}
-
-static int __register_shrinker(struct shrinker *shrinker)
-{
-	int err = __prealloc_shrinker(shrinker);
-
-	if (err)
-		return err;
-	register_shrinker_prepared(shrinker);
-	return 0;
-}
-
-#ifdef CONFIG_SHRINKER_DEBUG
-int register_shrinker(struct shrinker *shrinker, const char *fmt, ...)
-{
-	va_list ap;
-	int err;
-
-	va_start(ap, fmt);
-	shrinker->name = kvasprintf_const(GFP_KERNEL, fmt, ap);
-	va_end(ap);
-	if (!shrinker->name)
-		return -ENOMEM;
-
-	err = __register_shrinker(shrinker);
-	if (err) {
-		kfree_const(shrinker->name);
-		shrinker->name = NULL;
-	}
-	return err;
-}
-#else
-int register_shrinker(struct shrinker *shrinker, const char *fmt, ...)
-{
-	return __register_shrinker(shrinker);
-}
-#endif
-EXPORT_SYMBOL(register_shrinker);
-
-/*
- * Remove one
- */
-void unregister_shrinker(struct shrinker *shrinker)
-{
-	struct dentry *debugfs_entry;
-	int debugfs_id;
-
-	if (!(shrinker->flags & SHRINKER_REGISTERED))
-		return;
-
-	down_write(&shrinker_rwsem);
-	list_del(&shrinker->list);
-	shrinker->flags &= ~SHRINKER_REGISTERED;
-	if (shrinker->flags & SHRINKER_MEMCG_AWARE)
-		unregister_memcg_shrinker(shrinker);
-	debugfs_entry = shrinker_debugfs_detach(shrinker, &debugfs_id);
-	up_write(&shrinker_rwsem);
-
-	shrinker_debugfs_remove(debugfs_entry, debugfs_id);
-
-	kfree(shrinker->nr_deferred);
-	shrinker->nr_deferred = NULL;
-}
-EXPORT_SYMBOL(unregister_shrinker);
-
 /**
  * synchronize_shrinkers - Wait for all running shrinkers to complete.
  *
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
