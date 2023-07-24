Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B4F3C001DE
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Jul 2023 09:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=evNdWBvOYnVJQv8uvMZbFuR87M4bVOPhXJG/cB41B5g=; b=kSj+aFtj/i9C+H
	cwRD38Rw2fzDrgbj3yzNJR/nrNe6Mstvf5qjRG2D/wke4Jz/GgXmK86UkF+/fyp7cmVRooPfSStO8
	lTNUxUnaZ4dH+TxOdWlA8zdvpO+dP8fxK6UDEc4/oY+MClsuJbERtAcpGKkRiM2C1g1RLRXa8+Mur
	kcOle7shf2c6QZx/Lu3r95qZ8zOOz5En9bc9BtdqkE2rOBp+qCsNuQo0h50bRwdBKniMhO7w9S1qU
	dXxp6rGDtXTivnPRWGj3JWvpCkKlAaGX9ekwYwKYhB1UM+oCj1W135VrCDZaUahxUjE+An17oSDk+
	AYwM0n6aM1qRx408muPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNs8n-003S8M-2Y;
	Mon, 24 Jul 2023 09:46:09 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNs8l-003S6J-0j
	for linux-mtd@lists.infradead.org;
	Mon, 24 Jul 2023 09:46:08 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1b867f9198dso8893935ad.0
        for <linux-mtd@lists.infradead.org>; Mon, 24 Jul 2023 02:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1690191966; x=1690796766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vu9DfqGDIkVtY7CS+mn/8y6VlhAfp+/Q2ofuaCWar5Q=;
        b=At3xco+o52slbk+Wt2XjpJ6Cu9i6sYrBgnCMc/5CS86ucLHJsGEmN+KJGEE3nRi6sH
         tP3qBPXEcwpvnQz66wRWSap6a1c2U02VEHsWoEgBKOJ+J1jRKgicNVIHL7YJb/2E7nTO
         mH8QuWqeK2DOxQytNGG5waBMmbk4L4jbPvrdsdxuK9v3y/Gywd5CYYO64IbHl7UYCZKj
         8Q8aIDwesLUsAzLtg/KQ6AQafF3z6VJJ9ci5NRM3KksRfjknsFWZGEpbW519fA18aLaX
         x2A/u6CY/jHlR9bkZrq6ZtCOein2LXegx+J7Hclhb+m/DWqNAehg6T+OKXqpv2vIgzAt
         zKew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690191967; x=1690796767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vu9DfqGDIkVtY7CS+mn/8y6VlhAfp+/Q2ofuaCWar5Q=;
        b=WIsSe23T0kQEqQXhme4/7k1uQcGTUJ1uhvgpuSsbwX9PLG4AHdL1WJynQttgpMODXL
         fXumECkLX4VFE7loSTXsVqwiQ3KG23GkpToENhdS2cu4/5K1gt7U9s5B4D1YXHcrQ/z0
         ESf+gJlTf8mxTekm0vjZ2QH6ieegPdLRyOUiP0bkepJ4SQ7qjd2WeLLQddE14FmduVbN
         RJfKgOV0YyOGr6M8sXn/09t82vOwwDkwptZ4zUXqFwLi04CZQjxPoxrAdzF4ev9SCLuz
         9VlSvrTYFOb7FnQ91UO/0OHiyo0jpjAEQm9USZDAV8Wr6th0l8LpsIuJtbzTKjfQDPNt
         6jGQ==
X-Gm-Message-State: ABy/qLYUkjpHt7jMwwVwc/Tokx4e0z+7eMjMHY9M/r72LC0bgy55vHRj
	5LYGJ/b2oLqIV3LWKkF7XqZ4Xw==
X-Google-Smtp-Source: APBJJlGrsdFKJ71ukJT79kDa1W+M4ztJszdSUa3mf2ArYfnWEb5YwD/wtpSbLXe4wEi7ibAUftTBwg==
X-Received: by 2002:a17:902:ecd2:b0:1b8:b4f6:1327 with SMTP id a18-20020a170902ecd200b001b8b4f61327mr12288935plh.6.1690191966684;
        Mon, 24 Jul 2023 02:46:06 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
        by smtp.gmail.com with ESMTPSA id d5-20020a170902c18500b001bb20380bf2sm8467233pld.13.2023.07.24.02.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 02:46:06 -0700 (PDT)
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
Subject: [PATCH v2 05/47] binder: dynamically allocate the android-binder shrinker
Date: Mon, 24 Jul 2023 17:43:12 +0800
Message-Id: <20230724094354.90817-6-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_024607_264888_DC0E29EB 
X-CRM114-Status: GOOD (  12.07  )
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

Use new APIs to dynamically allocate the android-binder shrinker.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 drivers/android/binder_alloc.c | 31 +++++++++++++++++++------------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/drivers/android/binder_alloc.c b/drivers/android/binder_alloc.c
index e3db8297095a..019981d65e1e 100644
--- a/drivers/android/binder_alloc.c
+++ b/drivers/android/binder_alloc.c
@@ -1053,11 +1053,7 @@ binder_shrink_scan(struct shrinker *shrink, struct shrink_control *sc)
 			    NULL, sc->nr_to_scan);
 }
 
-static struct shrinker binder_shrinker = {
-	.count_objects = binder_shrink_count,
-	.scan_objects = binder_shrink_scan,
-	.seeks = DEFAULT_SEEKS,
-};
+static struct shrinker *binder_shrinker;
 
 /**
  * binder_alloc_init() - called by binder_open() for per-proc initialization
@@ -1077,19 +1073,30 @@ void binder_alloc_init(struct binder_alloc *alloc)
 
 int binder_alloc_shrinker_init(void)
 {
-	int ret = list_lru_init(&binder_alloc_lru);
+	int ret;
 
-	if (ret == 0) {
-		ret = register_shrinker(&binder_shrinker, "android-binder");
-		if (ret)
-			list_lru_destroy(&binder_alloc_lru);
+	ret = list_lru_init(&binder_alloc_lru);
+	if (ret)
+		return ret;
+
+	binder_shrinker = shrinker_alloc(0, "android-binder");
+	if (!binder_shrinker) {
+		list_lru_destroy(&binder_alloc_lru);
+		return -ENOMEM;
 	}
-	return ret;
+
+	binder_shrinker->count_objects = binder_shrink_count;
+	binder_shrinker->scan_objects = binder_shrink_scan;
+	binder_shrinker->seeks = DEFAULT_SEEKS;
+
+	shrinker_register(binder_shrinker);
+
+	return 0;
 }
 
 void binder_alloc_shrinker_exit(void)
 {
-	unregister_shrinker(&binder_shrinker);
+	shrinker_unregister(binder_shrinker);
 	list_lru_destroy(&binder_alloc_lru);
 }
 
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
