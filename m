Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3B30C0015E
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jul 2023 08:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pE8DTOUSACgr4qXzCQLMJhc0NbilzgswjdTS3QDpBwQ=; b=ovjBPznU43ZXB9
	D+p84PFdH+rfaz8ywl+vVYXcdT85pnFeNDC/cmQJjJK1MMr1VCrnSs7R3NZX2FbehP8yYJZRPfL6+
	31DsBJb0ywfqgoWVPw/IlQ8iEhQjrDsoU7CFN6FIVlKU0QiYLztqBkqfDh99YHILW8yk6lBg/GBdE
	3mLW8+SrLj+fBV+nLQpK/zJDc7EDjx0t6XntenghxpW/fE1WM7oO8njy1JDFwWRN156gHRFdEB+aH
	AkQnvap9nZWapaG4SyFMGaz7I5EHSmxtyQx8zHKTuKdMYxFyypG2Q2e6Eph2fiA8QcjfE6ePWjh2x
	ICBwIFhJ+Hwur6OnJPSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOw4P-00Caxy-08;
	Thu, 27 Jul 2023 08:10:01 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOw4J-00Cau8-0E
	for linux-mtd@lists.infradead.org;
	Thu, 27 Jul 2023 08:09:58 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-686f6231bdeso113076b3a.1
        for <linux-mtd@lists.infradead.org>; Thu, 27 Jul 2023 01:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1690445393; x=1691050193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YHU8OaKZwBmHAPsd+ulZSL5GxfVyMtJ49ZlHBntG+/k=;
        b=Ws66ywmifmcLi+WS7kmIq1OGsH1BFTj57lSknLEKHfbjZoq0FCk32P7hFix2O77y/C
         4VExY7boGbko1TLXa8rf04m6+c8ScNg+Ye07GBCAr/bT75kG0yI8bdxHraEPkF+rcUYR
         8BmftTtO1b4i7ZeslsgPT7KHdxn3xY8ziOGXEmWj+FzniwFS8tNvAxdGJbvq/4djXF38
         gQDVTQD96XEDgWvn9v9d4yLEL0qbZzBxPnvHBbbs4StP2CGFCs0AHk/pzAfhLwFN3LYv
         MATNwQY8c4ti2yb34XlOR1fjl5eoQUN5qPDBlkMol6h4RrCuQdh3qGqhSkTUZQAnG9Jo
         zXhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690445393; x=1691050193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YHU8OaKZwBmHAPsd+ulZSL5GxfVyMtJ49ZlHBntG+/k=;
        b=A/U6seBOPvABwv/Fbll1UJ59nAsQI26krb5iL0iX6md+fYk33kOLp/eFE8//jTl1GI
         7CQTJZQjPVRJsXSM+pYKD0f4iY9cAxoW3lnCwwhZmaCsr6i6xHH0F9HM34JnzdlxXtnJ
         gVSu+oNOqnZehSKIbqdh37fKncNL5rfNv3If2rxOJbBcp8z1gBFrLlByeg0JROSCTcnH
         4y352EjtEBPbHJL3J8fY/YRoICOw5rlq/bcURUz/U9bma6XKoqv6iMjgI+M3iPBs036i
         V0G8ajX83uFggGgv9mCGbdizWJpc/Dc/NbuNVsIKI/L3QGz2YhJksJG2YxiNbOj/rZYa
         owmQ==
X-Gm-Message-State: ABy/qLb17LA8f+Rd9ACcKM/7yD6W+80Zqp+fm2S3xJZeMEv345ml+UcE
	jCDW+0x5zdCN1i13T+gVizWYCQ==
X-Google-Smtp-Source: APBJJlFl46sZLt7x9x1yarGXcrDY9BzfubiI/ML/2A4f5iYMwILGEdxBDjTGuKdYIeQS2k9MfMDqhg==
X-Received: by 2002:a05:6a00:4a0e:b0:677:3439:874a with SMTP id do14-20020a056a004a0e00b006773439874amr5199798pfb.3.1690445393467;
        Thu, 27 Jul 2023 01:09:53 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
        by smtp.gmail.com with ESMTPSA id j8-20020aa78d08000000b006828e49c04csm885872pfe.75.2023.07.27.01.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 01:09:53 -0700 (PDT)
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
Subject: [PATCH v3 20/49] rcu: dynamically allocate the rcu-kfree shrinker
Date: Thu, 27 Jul 2023 16:04:33 +0800
Message-Id: <20230727080502.77895-21-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
References: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_010955_118882_C5FDF267 
X-CRM114-Status: GOOD (  11.59  )
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

Use new APIs to dynamically allocate the rcu-kfree shrinker.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 kernel/rcu/tree.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/kernel/rcu/tree.c b/kernel/rcu/tree.c
index cb1caefa8bd0..6d2f82f79c65 100644
--- a/kernel/rcu/tree.c
+++ b/kernel/rcu/tree.c
@@ -3449,13 +3449,6 @@ kfree_rcu_shrink_scan(struct shrinker *shrink, struct shrink_control *sc)
 	return freed == 0 ? SHRINK_STOP : freed;
 }
 
-static struct shrinker kfree_rcu_shrinker = {
-	.count_objects = kfree_rcu_shrink_count,
-	.scan_objects = kfree_rcu_shrink_scan,
-	.batch = 0,
-	.seeks = DEFAULT_SEEKS,
-};
-
 void __init kfree_rcu_scheduler_running(void)
 {
 	int cpu;
@@ -4931,6 +4924,7 @@ static void __init kfree_rcu_batch_init(void)
 {
 	int cpu;
 	int i, j;
+	struct shrinker *kfree_rcu_shrinker;
 
 	/* Clamp it to [0:100] seconds interval. */
 	if (rcu_delay_page_cache_fill_msec < 0 ||
@@ -4962,8 +4956,18 @@ static void __init kfree_rcu_batch_init(void)
 		INIT_DELAYED_WORK(&krcp->page_cache_work, fill_page_cache_func);
 		krcp->initialized = true;
 	}
-	if (register_shrinker(&kfree_rcu_shrinker, "rcu-kfree"))
-		pr_err("Failed to register kfree_rcu() shrinker!\n");
+
+	kfree_rcu_shrinker = shrinker_alloc(0, "rcu-kfree");
+	if (!kfree_rcu_shrinker) {
+		pr_err("Failed to allocate kfree_rcu() shrinker!\n");
+		return;
+	}
+
+	kfree_rcu_shrinker->count_objects = kfree_rcu_shrink_count;
+	kfree_rcu_shrinker->scan_objects = kfree_rcu_shrink_scan;
+	kfree_rcu_shrinker->seeks = DEFAULT_SEEKS;
+
+	shrinker_register(kfree_rcu_shrinker);
 }
 
 void __init rcu_init(void)
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
