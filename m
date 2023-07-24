Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5962EC001DE
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Jul 2023 09:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S4mZkFsPIrYmlz0exjUC0IyxOXlfBDWNwBNlkBAH+t4=; b=2O+mvRaOGiZEQH
	k+9ncfL1SXzg5vDzVvtQC8AW4CnlyR5q4mdhnT0Q9u7bWVJHiUdPya/zrqomBxyXVBJfhjIvwMQdS
	D7UfFrmPVPNk9mHgf+lb1Frl6OaWdpMHI/3EI7clA7FOeKyvROmj3E6+FoQbJzxIxyxfEYIw6830n
	lQXnlwrMdEP4G98TAG1Hqtc3FejHNjN6nZ4KZbhNBHv63IpM7npABzWiVpAJMHsEWDw+eF1ZTtGGW
	vIXjUtIL2fEDlrp/GzT5I3dN3t5MGBiLg06mhCHtPRVkq+stafy3mpxb9KgozkyiEmzWI4O6hcqU9
	f8i3AjhVhV6OP7uqeYbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNsDH-003VHa-1A;
	Mon, 24 Jul 2023 09:50:47 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNsDE-003VDQ-2H
	for linux-mtd@lists.infradead.org;
	Mon, 24 Jul 2023 09:50:46 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1bba9539a23so647215ad.1
        for <linux-mtd@lists.infradead.org>; Mon, 24 Jul 2023 02:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1690192242; x=1690797042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZDFCq+3UkmhmTN0HM4/h2IKWPu86Pd5FvtdYemXQxRk=;
        b=XqHXKo6vbgHHpc6RhHf64kOEkWmd4DwF9S3G2HlcDNVprLbMgrziPLHmF3/SloAlTi
         M4qErsaBI3Xm//ZP8dUEW0qhn54k8U+Wqiz5Z3pGQ/Kj67wHGAvT2pzICXrQ4EWgGi4s
         SU7OWwibP9GfdaanTmVVTd7EGnabpaclCsU9Kc2UxrRFm4MGqpHvMAQuuWz3XkPdgRtX
         h20Y8gEliJsCmA8XQP0mFOD72LdPGTY+615jy3RfIBkDojgIRwF3RNuCELN3vZVJJ3vk
         B2oIbMm9U2+ETc6xL/s4Xuc7N8cOCExDDhuoZilq51tIchlhwDinGVhSK9NnH/LxlRAX
         CyQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690192242; x=1690797042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZDFCq+3UkmhmTN0HM4/h2IKWPu86Pd5FvtdYemXQxRk=;
        b=WZPMBtxMZ1NV8oEvghgOP7CTZF2ywWrL9XYUQ9DlS9mS/6U6T3q5YljZt03m70FFXM
         h5NP1O/0mMqpXyE0wGpnPIyC3geNytE85k0TWt39W71chShkAoVqGbQknV8colBvmxwM
         NoD+ZoLZMfyOthQpmvviAvRlyYP4D1y/Aiuys4g4j/pSUE8fh+ECIYOAQdRyg5I7RHac
         Yc7Ga5eZG50nE0rghP9iz8QnM34MhKA1AkpWQydjWrNOgtz11rgCmGzoYKOBbAREY7JO
         rbWICFRTOIYR2HMBJceCF6Jk7056TIbUiaKR9Tf3fWkuPHrLCNxgVBrrhFQTABO30eG1
         JMBA==
X-Gm-Message-State: ABy/qLZx0f0h5EyHVROdtZs85PaWunpToC8SuA+XzPQTsyPL8Wp+NbHw
	WnCVjN7dfRPjc7jO+kuV/q59pQ==
X-Google-Smtp-Source: APBJJlGR+n0mPlGVKvsXqmDpjqybpKJnY8gMKNhLgc/3jSHzBMUiGDHHAqX91CFo21fNITu34xNtfg==
X-Received: by 2002:a17:902:ec8b:b0:1b3:d8ac:8db3 with SMTP id x11-20020a170902ec8b00b001b3d8ac8db3mr12344607plg.6.1690192242411;
        Mon, 24 Jul 2023 02:50:42 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
        by smtp.gmail.com with ESMTPSA id d5-20020a170902c18500b001bb20380bf2sm8467233pld.13.2023.07.24.02.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 02:50:42 -0700 (PDT)
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
Subject: [PATCH v2 28/47] bcache: dynamically allocate the md-bcache shrinker
Date: Mon, 24 Jul 2023 17:43:35 +0800
Message-Id: <20230724094354.90817-29-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_025044_749168_BA99FCF2 
X-CRM114-Status: GOOD (  15.61  )
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
index fd121a61f17c..c176c7fc77d9 100644
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
+		shrinker_unregister(c->shrink);
 
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
+		return -ENOMEM;
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
