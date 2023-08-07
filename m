Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A27B6C001DB
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Aug 2023 11:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=15HBK9kJa61JmhMMSFArkMh7lgHWalBsCVqVMBDhuDo=; b=Te/EZsEm+Z/5K6
	io50pcYSsBVySVMY6Ky0puFC4Zc/gaDf86aOGtHGrTvfZVPT+OVwfgKVW1mGrLpCikbytLe2dOJTI
	CAZ5HNdgZzvBi41FBjYhj9K5xEKAK6zpJMfehx2MWJlz7fKpLKVPpm2v/x/zSN6NBkQLM6Fj7mUf6
	596SAvabf/oOd6Y3+V+SHPJwxLwpTLxfU60gbxXrvIkWR5hYjZ507+g1v4jbRxWtgkuKyf8OMkeVw
	R44XTHYIUYxnIhEQENmBQrp80CpDeXS9pLKEXA4btYUqiWYi6q8G02rMH6fd/9fSVK9T0vnyQm53E
	Yid3WF1zLZP8RnXrSKOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSy96-00Gz4T-3C;
	Mon, 07 Aug 2023 11:11:33 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qSy92-00GyzB-2X
	for linux-mtd@lists.infradead.org;
	Mon, 07 Aug 2023 11:11:30 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-56462258cdeso525405a12.1
        for <linux-mtd@lists.infradead.org>; Mon, 07 Aug 2023 04:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1691406686; x=1692011486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ppdDbzxLfV7T8uyJ0+LWzuRMVQS50F9BO9dGotbDPbU=;
        b=MlLUTFwBYj7txqomyX5RsQbZ0tuOTesyUPZa0imDy/CbzwI18VWLrI273BHEpiy/59
         rQ1jtyDjjrm0A2fn5g0PDon6y1ODu6aNGJCylYpk7eBz5aCl8EYDqiryatgBLfE6j6wl
         z5DQPgedGrLwi+nxG0CDlruIcPgTiyaIMd4jUriznEP5tOm9lhp6XNenm09AU0AYyYPz
         hP8xB6m5xmZ4JEVQ0Bc2ouPU+2lWMJulVYbharTYlD2LjNPOhOgz1BVr9kOg3WfUC2R8
         kqamQX4BkmNd+ktmJD6D1JNyz78v+ezzbXueyJ3khYdsrERbOdoO7diXy9Rr3O+Hss94
         NCVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691406686; x=1692011486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ppdDbzxLfV7T8uyJ0+LWzuRMVQS50F9BO9dGotbDPbU=;
        b=Z2Oks5EgcfquDixNav+/64DwVgJrn2J53oMUzPrItYeJz8iSvmlDMMXYuOJ2Rxe8Ek
         IAeYDy26r5mgronHA4Uzpsmw5pwdqYKpG5yNasdrFdC0PUhHDorrcVzZT6/tHPX40JGz
         f8lZ9m8kX5ZvrTIrSPuGj3ojqI++6MXjlPUrUk4d2NBbjzDQAKxrlVEanevcAh1H+m6O
         qv+Qu5lNyxiU1q//b+eFFGl2jOkFsafrcLish49424y+LVuj0TKiS9wcRLm1K5PAqr4g
         Bk6TgvUq7YoOvtIWZltobX4PHmDyXtLkIFZliIoJvYbjSMnsOc/DGTOoI0NBiaJfxdRn
         16hg==
X-Gm-Message-State: AOJu0YzwZ/sQUkC+y7mNc6gU0CzlBgoH78XXZcC3vSt6pragLh2qZ0fn
	YWkkqUVxEzphlInGW5PRO8CFsQ==
X-Google-Smtp-Source: AGHT+IF4N48rqO+yuBXOFXn//EzxG9zSjzgF29ivUv9kLYfrFhE3z4laIyd5mkV4h78zNK2JaBG8Rw==
X-Received: by 2002:a17:90a:9c3:b0:269:41cf:7212 with SMTP id 61-20020a17090a09c300b0026941cf7212mr4956295pjo.4.1691406685878;
        Mon, 07 Aug 2023 04:11:25 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.146])
        by smtp.gmail.com with ESMTPSA id y13-20020a17090aca8d00b0025be7b69d73sm5861191pjt.12.2023.08.07.04.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 04:11:25 -0700 (PDT)
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
Subject: [PATCH v4 07/48] drm/ttm: dynamically allocate the drm-ttm_pool shrinker
Date: Mon,  7 Aug 2023 19:08:55 +0800
Message-Id: <20230807110936.21819-8-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230807110936.21819-1-zhengqi.arch@bytedance.com>
References: <20230807110936.21819-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_041128_829689_F3E167D7 
X-CRM114-Status: GOOD (  11.39  )
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

Use new APIs to dynamically allocate the drm-ttm_pool shrinker.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Reviewed-by: Muchun Song <songmuchun@bytedance.com>
---
 drivers/gpu/drm/ttm/ttm_pool.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
index cddb9151d20f..c9c9618c0dce 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -73,7 +73,7 @@ static struct ttm_pool_type global_dma32_uncached[MAX_ORDER + 1];
 
 static spinlock_t shrinker_lock;
 static struct list_head shrinker_list;
-static struct shrinker mm_shrinker;
+static struct shrinker *mm_shrinker;
 
 /* Allocate pages of size 1 << order with the given gfp_flags */
 static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
@@ -734,8 +734,8 @@ static int ttm_pool_debugfs_shrink_show(struct seq_file *m, void *data)
 	struct shrink_control sc = { .gfp_mask = GFP_NOFS };
 
 	fs_reclaim_acquire(GFP_KERNEL);
-	seq_printf(m, "%lu/%lu\n", ttm_pool_shrinker_count(&mm_shrinker, &sc),
-		   ttm_pool_shrinker_scan(&mm_shrinker, &sc));
+	seq_printf(m, "%lu/%lu\n", ttm_pool_shrinker_count(mm_shrinker, &sc),
+		   ttm_pool_shrinker_scan(mm_shrinker, &sc));
 	fs_reclaim_release(GFP_KERNEL);
 
 	return 0;
@@ -779,10 +779,17 @@ int ttm_pool_mgr_init(unsigned long num_pages)
 			    &ttm_pool_debugfs_shrink_fops);
 #endif
 
-	mm_shrinker.count_objects = ttm_pool_shrinker_count;
-	mm_shrinker.scan_objects = ttm_pool_shrinker_scan;
-	mm_shrinker.seeks = 1;
-	return register_shrinker(&mm_shrinker, "drm-ttm_pool");
+	mm_shrinker = shrinker_alloc(0, "drm-ttm_pool");
+	if (!mm_shrinker)
+		return -ENOMEM;
+
+	mm_shrinker->count_objects = ttm_pool_shrinker_count;
+	mm_shrinker->scan_objects = ttm_pool_shrinker_scan;
+	mm_shrinker->seeks = 1;
+
+	shrinker_register(mm_shrinker);
+
+	return 0;
 }
 
 /**
@@ -802,6 +809,6 @@ void ttm_pool_mgr_fini(void)
 		ttm_pool_type_fini(&global_dma32_uncached[i]);
 	}
 
-	unregister_shrinker(&mm_shrinker);
+	shrinker_free(mm_shrinker);
 	WARN_ON(!list_empty(&shrinker_list));
 }
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
