Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3AEEC0015E
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Jul 2023 09:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ULi4d8WnplmsdUhajADJ0qt4eFfHb7ObHSoQJMuN+CM=; b=Y9emPPIXHhU2h/
	9Hs5tJoLBwpaCVVg44TdI7ZlSXB5XaTDbjtVZgPfMc4C0+mvaLJku7IJUW1xIhDvhnb5bohMRSeVF
	aqw4h4+t33bUKbl7F68n0J+E3aWeUZA98ASM6iOiI/41v0KEfhfWDj2D7vuU/1gBvRX79gsV8Ps9f
	ZZGJH5MZfUuMYx7mEalXdzFOKY+sz7xV/gI8h63kE9cgcTImqVhdL3FmHLqrctbbE1KXZj7m8ccvc
	HKRmqB02V1giw5cnaValdgGEFsRNyFs4GI4K+VMhmgSQ/l0g9/x6POoUkUpLThVKsGqDJEFQ+unTD
	lo067z8o+yb4n0EN4iSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNsAX-003TKE-1H;
	Mon, 24 Jul 2023 09:47:57 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNsAV-003TIk-0X
	for linux-mtd@lists.infradead.org;
	Mon, 24 Jul 2023 09:47:56 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1b7dfb95761so5876415ad.1
        for <linux-mtd@lists.infradead.org>; Mon, 24 Jul 2023 02:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1690192074; x=1690796874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qReDjbjFz0xyiV7re04rgbBc1uubNDIxQ7QKRYWZSRs=;
        b=ENVLEGhvMjLiUvisyoHJontwb50xfTslV0XVCIZNbj3XxjFa+A4sTXO4Rw3QqFmux5
         XbznTWGuyuir8FMQeIa7tywzBJUnyvYSwuYJ02HBKdcTkSJdAtoOPw44n28eP8zUKucc
         q8yY+ysDs6yXU3SX/8XFuGMKyo+SMyS0Zlg4rwVloT2TyOVOz/Imh5E9tEAGm8xg8jyO
         QATQrcFlR17SUbjRuc1dqQxPY8algfDWOcvmKhvXGbaXm39iJYJiLthaOzWAxzJVeqgh
         fJOtvB6CBEjtg12DSwkb6lmHRDFIhGbGsjcgpxt8MGvrxNBdwtVQD4ot+/N3ASfLH/lS
         XEeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690192074; x=1690796874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qReDjbjFz0xyiV7re04rgbBc1uubNDIxQ7QKRYWZSRs=;
        b=XDtg4R1h+ezHLugpMAGMZl7HcJlpyzMwpWqih99Vjb4/IfpLEMQvM+HJfADIKpzQ9r
         WI5hWUkMh/bOYsKDhROVOJ4r823+LuP6TnlkHIVbkbpasTwkEBQAZdpkJTGI0SZZ2CRh
         dt+hEwlMTE89JaiLQjTaXbBFj9Yi5zvQ+QyS2AdDF2ocV7ZQ0cLZKywdo6mO08MjmnHh
         BpmGqVG9ebbw2xHhzSp9QAIadVwova+SmUwGgZH6otLdcW7tJ4jwhxkZn9sEg9BW0AnR
         yCADtENh9BfXPFPQrcpiBjH3g6dRIRCPY4kXLwpgRA8ntSUltFcGN8vH/78npQcyG/DW
         I5Aw==
X-Gm-Message-State: ABy/qLY6QvsR7poqbNcf1mjEkmxnCKoU19a1jzYbQhn/LGw2W2aXPoJn
	1zj6XTLC0omo7oWw9KH8cMakyw==
X-Google-Smtp-Source: APBJJlFmRr0YS7/80cQjb3Wv0/ryy4A2Bv0/hjBc48SsvJ3Rmt9/pUa2TTT24oRtgj6qJ02D1OEnuA==
X-Received: by 2002:a17:902:dacf:b0:1b8:9215:9163 with SMTP id q15-20020a170902dacf00b001b892159163mr12197474plx.6.1690192074491;
        Mon, 24 Jul 2023 02:47:54 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
        by smtp.gmail.com with ESMTPSA id d5-20020a170902c18500b001bb20380bf2sm8467233pld.13.2023.07.24.02.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 02:47:54 -0700 (PDT)
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
Subject: [PATCH v2 14/47] nfsd: dynamically allocate the nfsd-filecache shrinker
Date: Mon, 24 Jul 2023 17:43:21 +0800
Message-Id: <20230724094354.90817-15-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_024755_223696_A36B7E63 
X-CRM114-Status: GOOD (  10.40  )
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

Use new APIs to dynamically allocate the nfsd-filecache shrinker.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 fs/nfsd/filecache.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/fs/nfsd/filecache.c b/fs/nfsd/filecache.c
index ee9c923192e0..50216768d408 100644
--- a/fs/nfsd/filecache.c
+++ b/fs/nfsd/filecache.c
@@ -521,11 +521,7 @@ nfsd_file_lru_scan(struct shrinker *s, struct shrink_control *sc)
 	return ret;
 }
 
-static struct shrinker	nfsd_file_shrinker = {
-	.scan_objects = nfsd_file_lru_scan,
-	.count_objects = nfsd_file_lru_count,
-	.seeks = 1,
-};
+static struct shrinker *nfsd_file_shrinker;
 
 /**
  * nfsd_file_cond_queue - conditionally unhash and queue a nfsd_file
@@ -746,12 +742,18 @@ nfsd_file_cache_init(void)
 		goto out_err;
 	}
 
-	ret = register_shrinker(&nfsd_file_shrinker, "nfsd-filecache");
-	if (ret) {
-		pr_err("nfsd: failed to register nfsd_file_shrinker: %d\n", ret);
+	nfsd_file_shrinker = shrinker_alloc(0, "nfsd-filecache");
+	if (!nfsd_file_shrinker) {
+		pr_err("nfsd: failed to allocate nfsd_file_shrinker\n");
 		goto out_lru;
 	}
 
+	nfsd_file_shrinker->count_objects = nfsd_file_lru_count;
+	nfsd_file_shrinker->scan_objects = nfsd_file_lru_scan;
+	nfsd_file_shrinker->seeks = 1;
+
+	shrinker_register(nfsd_file_shrinker);
+
 	ret = lease_register_notifier(&nfsd_file_lease_notifier);
 	if (ret) {
 		pr_err("nfsd: unable to register lease notifier: %d\n", ret);
@@ -774,7 +776,7 @@ nfsd_file_cache_init(void)
 out_notifier:
 	lease_unregister_notifier(&nfsd_file_lease_notifier);
 out_shrinker:
-	unregister_shrinker(&nfsd_file_shrinker);
+	shrinker_unregister(nfsd_file_shrinker);
 out_lru:
 	list_lru_destroy(&nfsd_file_lru);
 out_err:
@@ -891,7 +893,7 @@ nfsd_file_cache_shutdown(void)
 		return;
 
 	lease_unregister_notifier(&nfsd_file_lease_notifier);
-	unregister_shrinker(&nfsd_file_shrinker);
+	shrinker_unregister(nfsd_file_shrinker);
 	/*
 	 * make sure all callers of nfsd_file_lru_cb are done before
 	 * calling nfsd_file_cache_purge
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
