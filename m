Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8153C04FE1
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jul 2023 08:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BMj7gmEzTGnE4IwJ/1UJ0F8Pnxzafe8Ar4D/IBprnzc=; b=wI6zJkR36iICa0
	RDi+tVdkWdFi/tWYjfWLpwlkQ2orzpAS0MPdiHd95xMAemAy9DKYSMOzlyAd3RyootUQyWZwzFcpX
	ANEz5C6x65JBiOF5mx8kgWj1k4n67mAkrJ8UexOOnAW5FY4d7IyTRGSLLofA/IIxHyOeLIvT1Xq/k
	xs0Xql82hfaBUKpMDMd+9vGicEni8EGkEib8DAoWmqon4YjkKexn29cTEAybuBxR0iiuCUAeXvJaz
	d9pR89wDDHFUpogY1A32wdhk0oW+IgU4PSDK2Mpf7gt5faiZStHyMMzv+csGTQBkKrEjefreaLZ8S
	wmsLzUqESmSUlkePhq8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOw8T-00CdV1-2c;
	Thu, 27 Jul 2023 08:14:13 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOw8Q-00CdRo-0S
	for linux-mtd@lists.infradead.org;
	Thu, 27 Jul 2023 08:14:11 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-6748a616e17so183909b3a.1
        for <linux-mtd@lists.infradead.org>; Thu, 27 Jul 2023 01:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1690445649; x=1691050449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sPvPF+4cfnCSPpn5pwfgQmnhLHHD8eUNQAmayNodhE0=;
        b=YUtSHImzHFhUVx7c3A38/9eSWP8Y2UYGj1FAohSpraRjdigKG79oH7xXGVv/st6Oxo
         VyXpyLT7a2poDQM1BLbe2YZ2f+F4NjGwYTjXKgOmjtdNRT3EltoPRUERX0NGCPGwABx/
         guLbSxl8SczSn7UsZFsKIT2jSYiALWPELONV4dGxl+BgYW8LTo4BMAXY89ObnQ5bwB+z
         TeqwZ6TJLFD7PjgbTEQMgvSuaTCzQbN9MksnEsjGQ7GcxsQYflnPZl/UkK6mnnTiCX+x
         HfuT7U9+62kKpSnlvuoFhz2dd+gEGZ79L6Z5RTD7Q/dArvGRObCoRNap6LnHLL+kySjl
         YAWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690445649; x=1691050449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sPvPF+4cfnCSPpn5pwfgQmnhLHHD8eUNQAmayNodhE0=;
        b=YhrS3RKwt55qwCaNCwTXVlLlnTHKocl6h7lY03gFuPI5U86cXri9UhVc/S9OTHokUt
         ruxFs6roe8Vv17DpUwOG8anrIoNFqr9aTQJXnhySWAoa351UT05UW+PtNFHEApvWkXDz
         akK8HFC5tMuB7PdG9sq7bkSb0u9brC9AF9m4ukgvfQ7XftTy6tKaGP9Kj0MN1bh+c35s
         FrW/ykw9LNtomWRsk0l75Hl3ms9K0c4rqp2O/dcObW6Do11DBpRKBaxNFNIFTC9u///G
         wAVaPqcesymDS0Kz1haIFAxaHVG//nxCR/jus+gNnIIu6wPAA/52yyLVBK++1hwITqvE
         VgWA==
X-Gm-Message-State: ABy/qLbXOMobr8tDdabJBhvPorjMOyKBtNSs0Skci9ocLuIlxGF9Jckv
	Ijh2utkgrLbeUwBKIU6w4PI25g==
X-Google-Smtp-Source: APBJJlHWG/nG8cYGh+bA6ihiUuY1h+OmDGzY+AfGFIW0cwXlJC7qa3aS8ftT4KQ6i8EuYK6gaQtAEg==
X-Received: by 2002:a05:6a20:918e:b0:11a:dbb3:703b with SMTP id v14-20020a056a20918e00b0011adbb3703bmr5557054pzd.6.1690445649366;
        Thu, 27 Jul 2023 01:14:09 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
        by smtp.gmail.com with ESMTPSA id j8-20020aa78d08000000b006828e49c04csm885872pfe.75.2023.07.27.01.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 01:14:08 -0700 (PDT)
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
Subject: [PATCH v3 41/49] zsmalloc: dynamically allocate the mm-zspool shrinker
Date: Thu, 27 Jul 2023 16:04:54 +0800
Message-Id: <20230727080502.77895-42-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
References: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_011410_243953_9962FEB2 
X-CRM114-Status: GOOD (  14.04  )
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
dynamically allocate the mm-zspool shrinker, so that it can be freed
asynchronously using kfree_rcu(). Then it doesn't need to wait for RCU
read-side critical section when releasing the struct zs_pool.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Reviewed-by: Muchun Song <songmuchun@bytedance.com>
---
 mm/zsmalloc.c | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
index b96230402a8d..e63302e07c97 100644
--- a/mm/zsmalloc.c
+++ b/mm/zsmalloc.c
@@ -229,7 +229,7 @@ struct zs_pool {
 	struct zs_pool_stats stats;
 
 	/* Compact classes */
-	struct shrinker shrinker;
+	struct shrinker *shrinker;
 
 #ifdef CONFIG_ZSMALLOC_STAT
 	struct dentry *stat_dentry;
@@ -2086,8 +2086,7 @@ static unsigned long zs_shrinker_scan(struct shrinker *shrinker,
 		struct shrink_control *sc)
 {
 	unsigned long pages_freed;
-	struct zs_pool *pool = container_of(shrinker, struct zs_pool,
-			shrinker);
+	struct zs_pool *pool = shrinker->private_data;
 
 	/*
 	 * Compact classes and calculate compaction delta.
@@ -2105,8 +2104,7 @@ static unsigned long zs_shrinker_count(struct shrinker *shrinker,
 	int i;
 	struct size_class *class;
 	unsigned long pages_to_free = 0;
-	struct zs_pool *pool = container_of(shrinker, struct zs_pool,
-			shrinker);
+	struct zs_pool *pool = shrinker->private_data;
 
 	for (i = ZS_SIZE_CLASSES - 1; i >= 0; i--) {
 		class = pool->size_class[i];
@@ -2121,18 +2119,24 @@ static unsigned long zs_shrinker_count(struct shrinker *shrinker,
 
 static void zs_unregister_shrinker(struct zs_pool *pool)
 {
-	unregister_shrinker(&pool->shrinker);
+	shrinker_free(pool->shrinker);
 }
 
 static int zs_register_shrinker(struct zs_pool *pool)
 {
-	pool->shrinker.scan_objects = zs_shrinker_scan;
-	pool->shrinker.count_objects = zs_shrinker_count;
-	pool->shrinker.batch = 0;
-	pool->shrinker.seeks = DEFAULT_SEEKS;
+	pool->shrinker = shrinker_alloc(0, "mm-zspool:%s", pool->name);
+	if (!pool->shrinker)
+		return -ENOMEM;
+
+	pool->shrinker->scan_objects = zs_shrinker_scan;
+	pool->shrinker->count_objects = zs_shrinker_count;
+	pool->shrinker->batch = 0;
+	pool->shrinker->seeks = DEFAULT_SEEKS;
+	pool->shrinker->private_data = pool;
 
-	return register_shrinker(&pool->shrinker, "mm-zspool:%s",
-				 pool->name);
+	shrinker_register(pool->shrinker);
+
+	return 0;
 }
 
 static int calculate_zspage_chain_size(int class_size)
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
