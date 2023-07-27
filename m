Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05567C0015E
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jul 2023 08:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YKcPD04Z46rAi89sj2eSZjgvmOaBP/I3HOyvsnf8USg=; b=bDQgVc9NCABZl8
	2qbg4LvGE+2Tukc9/eUuV8yV/v7d6knO9cgZqFraYJfOgAZkMxu7s2pCqhRcC50X10OSbpyzA7oy+
	wZ70yGtvQuujD98xuQ7NGAz0BIqdhvUU5DeHwl5MXJ7dgBekaPtWQ4WIjxMIExvuPldR4YjuyvNb9
	UrQOYatPgdUiCBZHMzO3PIwP9dBEeReah9JYHrFPS7OlCiv8n21Fd0QuWKgDODqNKp1wiLm6VT9HD
	AmdOpIkls9+gB+8xs1If/fc8lowD6Yz8fIi0cfhKEARaBYHLX8A8XFqXu4LZQSxrFEwb8YlPFnOmm
	dznD6AKPkioh5whwOjkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOw5u-00CbvS-22;
	Thu, 27 Jul 2023 08:11:34 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOw5q-00Cbrr-3C
	for linux-mtd@lists.infradead.org;
	Thu, 27 Jul 2023 08:11:32 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-686f6231bdeso113410b3a.1
        for <linux-mtd@lists.infradead.org>; Thu, 27 Jul 2023 01:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1690445490; x=1691050290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ze2BfjPj3zI6XK14aBXxwpj9cG5VKS+QoT9VkWxAsig=;
        b=lwOoY+OdQN9yyaycuuDe1xOBPNuMdpjPWf9iVdWyTJX4Rze1Ujyu7FqyyXfPUD3aU2
         0geNSiBV+SjLplmH7ILvbtRHCHKM3vLFmOVDmsv1BEm9fkWkTRAM1imR53z99mDpf0IW
         ffoAdzAoMkEyhpVqT3oRFQGqTsCjJOMqkqnQ0DFV07QdT6HdoSrpGoFduwBz2OfpOwFt
         CWOX0mmKGcSRamco0Cg7QpPpz6Lx/kpTjodIKj6Sfbh0QvlZA2O3b8FhSM1hAbz32D/P
         0DhVwgLc1Xu9esSsJfTXPYkz1XSyCT4LoDf/9vVVRpeHu2USWPZ+XNt9qGqYRzfEx2BR
         Y6jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690445490; x=1691050290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ze2BfjPj3zI6XK14aBXxwpj9cG5VKS+QoT9VkWxAsig=;
        b=AcKXEIgGqelfdiWXGZdqrUCg0nAHhIaP7ctjbediPFI21UOAQB7a9LfrrdL81LidZI
         fKa+FYbHUIerZJKVSNnDG2ZxNNaxCqdHl3Z6Kz1FRW0Om9/QHvm1k6MJlF0Dcxr8729r
         L25UKxp/P34B16WuCZH7O7Y7G/8yhAqwLZ3SFQpEYBtF8Ky7ABZ2fYo+l5Qh6PtZ9CBJ
         tO5EpJHWohKh94VmM6blg8Vb2aZ5UX8zcdJqySywor/ZUZD71zeJjgbm+xzY92p20plQ
         5dNUGLxgYF1AwHrzcHJcuw0pS0C67Jtj73gFasVc2a0kQjxPtEv1Uh4JWLrkiBokXwmf
         iAeg==
X-Gm-Message-State: ABy/qLZ7Xw3m5PEafqsApGNY08LXmGmY9tU/E5vkf+7X1lfBHZQ2kkym
	7ewAv2JrcxfrlTz0ZuWZNNKarQ==
X-Google-Smtp-Source: APBJJlFMZtECqV3NWJubuagzux89byKCTiavknA18umD2w/BadGADzl49oXppHX8YppKwxO9L0rdOg==
X-Received: by 2002:a05:6a00:1586:b0:67f:8ef5:2643 with SMTP id u6-20020a056a00158600b0067f8ef52643mr5208150pfk.2.1690445490190;
        Thu, 27 Jul 2023 01:11:30 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
        by smtp.gmail.com with ESMTPSA id j8-20020aa78d08000000b006828e49c04csm885872pfe.75.2023.07.27.01.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 01:11:29 -0700 (PDT)
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
Subject: [PATCH v3 28/49] dm zoned: dynamically allocate the dm-zoned-meta shrinker
Date: Thu, 27 Jul 2023 16:04:41 +0800
Message-Id: <20230727080502.77895-29-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
References: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_011131_060466_BD6C1BAC 
X-CRM114-Status: GOOD (  14.11  )
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
dynamically allocate the dm-zoned-meta shrinker, so that it can be freed
asynchronously using kfree_rcu(). Then it doesn't need to wait for RCU
read-side critical section when releasing the struct dmz_metadata.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Reviewed-by: Muchun Song <songmuchun@bytedance.com>
---
 drivers/md/dm-zoned-metadata.c | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
index 9d3cca8e3dc9..0bcb26a43578 100644
--- a/drivers/md/dm-zoned-metadata.c
+++ b/drivers/md/dm-zoned-metadata.c
@@ -187,7 +187,7 @@ struct dmz_metadata {
 	struct rb_root		mblk_rbtree;
 	struct list_head	mblk_lru_list;
 	struct list_head	mblk_dirty_list;
-	struct shrinker		mblk_shrinker;
+	struct shrinker		*mblk_shrinker;
 
 	/* Zone allocation management */
 	struct mutex		map_lock;
@@ -615,7 +615,7 @@ static unsigned long dmz_shrink_mblock_cache(struct dmz_metadata *zmd,
 static unsigned long dmz_mblock_shrinker_count(struct shrinker *shrink,
 					       struct shrink_control *sc)
 {
-	struct dmz_metadata *zmd = container_of(shrink, struct dmz_metadata, mblk_shrinker);
+	struct dmz_metadata *zmd = shrink->private_data;
 
 	return atomic_read(&zmd->nr_mblks);
 }
@@ -626,7 +626,7 @@ static unsigned long dmz_mblock_shrinker_count(struct shrinker *shrink,
 static unsigned long dmz_mblock_shrinker_scan(struct shrinker *shrink,
 					      struct shrink_control *sc)
 {
-	struct dmz_metadata *zmd = container_of(shrink, struct dmz_metadata, mblk_shrinker);
+	struct dmz_metadata *zmd = shrink->private_data;
 	unsigned long count;
 
 	spin_lock(&zmd->mblk_lock);
@@ -2936,19 +2936,23 @@ int dmz_ctr_metadata(struct dmz_dev *dev, int num_dev,
 	 */
 	zmd->min_nr_mblks = 2 + zmd->nr_map_blocks + zmd->zone_nr_bitmap_blocks * 16;
 	zmd->max_nr_mblks = zmd->min_nr_mblks + 512;
-	zmd->mblk_shrinker.count_objects = dmz_mblock_shrinker_count;
-	zmd->mblk_shrinker.scan_objects = dmz_mblock_shrinker_scan;
-	zmd->mblk_shrinker.seeks = DEFAULT_SEEKS;
 
 	/* Metadata cache shrinker */
-	ret = register_shrinker(&zmd->mblk_shrinker, "dm-zoned-meta:(%u:%u)",
-				MAJOR(dev->bdev->bd_dev),
-				MINOR(dev->bdev->bd_dev));
-	if (ret) {
-		dmz_zmd_err(zmd, "Register metadata cache shrinker failed");
+	zmd->mblk_shrinker = shrinker_alloc(0,  "dm-zoned-meta:(%u:%u)",
+					    MAJOR(dev->bdev->bd_dev),
+					    MINOR(dev->bdev->bd_dev));
+	if (!zmd->mblk_shrinker) {
+		dmz_zmd_err(zmd, "Allocate metadata cache shrinker failed");
 		goto err;
 	}
 
+	zmd->mblk_shrinker->count_objects = dmz_mblock_shrinker_count;
+	zmd->mblk_shrinker->scan_objects = dmz_mblock_shrinker_scan;
+	zmd->mblk_shrinker->seeks = DEFAULT_SEEKS;
+	zmd->mblk_shrinker->private_data = zmd;
+
+	shrinker_register(zmd->mblk_shrinker);
+
 	dmz_zmd_info(zmd, "DM-Zoned metadata version %d", zmd->sb_version);
 	for (i = 0; i < zmd->nr_devs; i++)
 		dmz_print_dev(zmd, i);
@@ -2995,7 +2999,7 @@ int dmz_ctr_metadata(struct dmz_dev *dev, int num_dev,
  */
 void dmz_dtr_metadata(struct dmz_metadata *zmd)
 {
-	unregister_shrinker(&zmd->mblk_shrinker);
+	shrinker_free(zmd->mblk_shrinker);
 	dmz_cleanup_metadata(zmd);
 	kfree(zmd);
 }
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
