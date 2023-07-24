Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DFABC001DE
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Jul 2023 09:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BKlgnm5kvUVw0Rh86UGct6xwevWJeS3UMDKp4pT092w=; b=1A0JyIafKsicDu
	vGTCrVY2Ex3KK8hQx/QDYAV3e+5TzZb6tPl+KlsVCfWwgtCXLEbB7BcfmkovM+/2/MbGQ3V4u4bdB
	q43crAULGH0BKm9I2Ib2pNj9H9hWTNa2wHoxRM9kLADsJ9BybQkoQ54+VdtOWzqveSAeDsbANgOA3
	ro6FqGqpG93egy5BmbzDlGQQ8eHdVFOfArPLnyG8CKFqYTqpcPmjJrp62gi1VjYKlnxv2EthytsFq
	8zH1/41lFi/wUfskcmPA5dPZ4qW3U2AYzfKYoe0osym+ZKwu5f8ulfUe6j3wwnQQKmON3+ePjjFjA
	uLgEeflCsY8pqCnABWXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNsCh-003UrW-0d;
	Mon, 24 Jul 2023 09:50:11 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNsCe-003Uou-1A
	for linux-mtd@lists.infradead.org;
	Mon, 24 Jul 2023 09:50:10 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1bba9539a23so645945ad.1
        for <linux-mtd@lists.infradead.org>; Mon, 24 Jul 2023 02:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1690192207; x=1690797007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5tyryk3a6lKy52HCDJ7LTSnMns1BMfalny9tATaKfF4=;
        b=amQ/RyxG43H24ZUKc8otE5jiO+PYmxLlS/jMlPB0P6LNf3YwKIyMMGT5x5GETrJzMq
         RUBPJl4XNLYJOZfW+4QQddSzJ1AOcHQOg+iS5NlIsw7P4JxkBKv7P6vm/OPtlqHKc3hY
         SLjp5JA2uLEQMXCeF85H9FjbP+u1neEShB4g/q4BDTYJUem7uHrE3aZx7t8/OvBixlxe
         PbLUlPG8K2MumMSz8pDMF7zGqwESYJNwxt0dJLhsSfALoKSzpnkM0Hd7rb9gY0+HtLOP
         61X4fPzjkMASXPftIRT+bLKVEY2jgFRxsHYQZDL2GJ8BmZMhp7tc/64KlMZKvh3Rfksj
         0TFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690192207; x=1690797007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5tyryk3a6lKy52HCDJ7LTSnMns1BMfalny9tATaKfF4=;
        b=k4BZOum4lGkaF+qnIbMHRxP4I+oQNpildETlXPaYCLTzKqMMkLkWuFkay8Nsn4z6/5
         sIImZY3rL519YAzb+o7fSDfDyndQz8bSQ/dkwj7hMisjVVDzCZpK27MRzrE7llo0BTj8
         e00vnricDIBP+5XmuQR41Yn1ERky51KZu7F/UKMfndElw7zTBZbSIxSqIXuOlmN7yEI6
         wioenUB0CZmzqwt+9OJc/6cdWYDj1bFHqEJX2wWEzNL1gfqaveCoO8D5vuQoTBvKp2Lz
         Any6vbY8IbLnSgckY4xq64LIpTvGFc/Xv6dIvhjZ1Hc3xX4wgc/Ps4TmsiQq/KzfIA60
         lCOg==
X-Gm-Message-State: ABy/qLYpHVS1Tt7ymq/jFiZJBNk9WfWrNppTV2EEJn7t0ch64IBGy6md
	oX6MYF9tfCYlipQWSkLuWsRfxg==
X-Google-Smtp-Source: APBJJlGNSrKSFiHfBgDCDwymx1T6XElAyTc+fmhNn0a9fde+MwuOtWNaHmnJx2SRiMlK6zefGJ37qA==
X-Received: by 2002:a17:902:f682:b0:1b3:ec39:f42c with SMTP id l2-20020a170902f68200b001b3ec39f42cmr12377411plg.5.1690192206827;
        Mon, 24 Jul 2023 02:50:06 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
        by smtp.gmail.com with ESMTPSA id d5-20020a170902c18500b001bb20380bf2sm8467233pld.13.2023.07.24.02.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 02:50:06 -0700 (PDT)
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
Subject: [PATCH v2 25/47] dm: dynamically allocate the dm-bufio shrinker
Date: Mon, 24 Jul 2023 17:43:32 +0800
Message-Id: <20230724094354.90817-26-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_025008_403338_00949FF4 
X-CRM114-Status: GOOD (  13.27  )
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
dynamically allocate the dm-bufio shrinker, so that it can be freed
asynchronously using kfree_rcu(). Then it doesn't need to wait for RCU
read-side critical section when releasing the struct dm_bufio_client.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 drivers/md/dm-bufio.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/md/dm-bufio.c b/drivers/md/dm-bufio.c
index bc309e41d074..028e30a4b2d0 100644
--- a/drivers/md/dm-bufio.c
+++ b/drivers/md/dm-bufio.c
@@ -963,7 +963,7 @@ struct dm_bufio_client {
 
 	sector_t start;
 
-	struct shrinker shrinker;
+	struct shrinker *shrinker;
 	struct work_struct shrink_work;
 	atomic_long_t need_shrink;
 
@@ -2368,7 +2368,7 @@ static unsigned long dm_bufio_shrink_scan(struct shrinker *shrink, struct shrink
 {
 	struct dm_bufio_client *c;
 
-	c = container_of(shrink, struct dm_bufio_client, shrinker);
+	c = shrink->private_data;
 	atomic_long_add(sc->nr_to_scan, &c->need_shrink);
 	queue_work(dm_bufio_wq, &c->shrink_work);
 
@@ -2377,7 +2377,7 @@ static unsigned long dm_bufio_shrink_scan(struct shrinker *shrink, struct shrink
 
 static unsigned long dm_bufio_shrink_count(struct shrinker *shrink, struct shrink_control *sc)
 {
-	struct dm_bufio_client *c = container_of(shrink, struct dm_bufio_client, shrinker);
+	struct dm_bufio_client *c = shrink->private_data;
 	unsigned long count = cache_total(&c->cache);
 	unsigned long retain_target = get_retain_buffers(c);
 	unsigned long queued_for_cleanup = atomic_long_read(&c->need_shrink);
@@ -2490,15 +2490,19 @@ struct dm_bufio_client *dm_bufio_client_create(struct block_device *bdev, unsign
 	INIT_WORK(&c->shrink_work, shrink_work);
 	atomic_long_set(&c->need_shrink, 0);
 
-	c->shrinker.count_objects = dm_bufio_shrink_count;
-	c->shrinker.scan_objects = dm_bufio_shrink_scan;
-	c->shrinker.seeks = 1;
-	c->shrinker.batch = 0;
-	r = register_shrinker(&c->shrinker, "dm-bufio:(%u:%u)",
-			      MAJOR(bdev->bd_dev), MINOR(bdev->bd_dev));
-	if (r)
+	c->shrinker = shrinker_alloc(0, "dm-bufio:(%u:%u)",
+				     MAJOR(bdev->bd_dev), MINOR(bdev->bd_dev));
+	if (!c->shrinker)
 		goto bad;
 
+	c->shrinker->count_objects = dm_bufio_shrink_count;
+	c->shrinker->scan_objects = dm_bufio_shrink_scan;
+	c->shrinker->seeks = 1;
+	c->shrinker->batch = 0;
+	c->shrinker->private_data = c;
+
+	shrinker_register(c->shrinker);
+
 	mutex_lock(&dm_bufio_clients_lock);
 	dm_bufio_client_count++;
 	list_add(&c->client_list, &dm_bufio_all_clients);
@@ -2537,7 +2541,7 @@ void dm_bufio_client_destroy(struct dm_bufio_client *c)
 
 	drop_buffers(c);
 
-	unregister_shrinker(&c->shrinker);
+	shrinker_unregister(c->shrinker);
 	flush_work(&c->shrink_work);
 
 	mutex_lock(&dm_bufio_clients_lock);
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
