Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCBFFC001E0
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jul 2023 08:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FLKbI2J0cTCAXHFsyOJ7Vl4jMJdwXYyQ44I4EPJPDSY=; b=bPYPGzb2jsZ3Qo
	sA5PyesvIYpB4U3SsrxTrVQrg4KGU1LcyLPOolt0258JK6TGIDxNPSx2iMMrl64JUYMCVi2jWgT7L
	5lXJ40DgfWcJhH0jG2N4OqJm+VUWeN2j8T7R6h1GZsyfURUpYtzbz0oI0/RThx2pTAweRbqyWfUnF
	ao/ylxl4mvgvM60h/aK9ZqRBH1sdi9z2VQA0qevLDXWdORXqufGkfKsDhE7tVg6tASpXWvGHBwPda
	cPQSodVA6oz+hwZcJ4inwwau9rskxehY4IvgLfaKe+GR6ZpPeEqe+7xGlbVK6HbkPrZWjtp1S+bKS
	c7Qvjc/IVKJ9tvy65p8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOw1e-00CZOb-1n;
	Thu, 27 Jul 2023 08:07:10 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOw1Z-00CZL2-0s
	for linux-mtd@lists.infradead.org;
	Thu, 27 Jul 2023 08:07:09 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6862d4a1376so188382b3a.0
        for <linux-mtd@lists.infradead.org>; Thu, 27 Jul 2023 01:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1690445222; x=1691050022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hJ9OcOwqZEZhIoLNGrov7as0vMS5t1dTfm2Sm9qefJI=;
        b=AioCATUlkHfrdNMX26y5cMG8yiZzcrqJVPo4kMJoo0a/SPBGZMItYxbURGlfK0qQ3U
         pdquqHjvBnBibcfcPa96/7pchRYEBHxyNnf24E8fTswl7dwSe4DIa81z6/ovJRcM58gW
         OCn1XGDPuwokH00bwAsXcK1Gr5D3vpz/ZXjhjYJknWBgLZAbQPwFGeGyEdzXyVgOqH5z
         Y8WwL8gpftvasBEeZpl0cei4t7+d2ZCdr5qxpBrrzaVJwzr8lwB/25SUTyxKcTGn9xox
         E7xpcSMCUuenHibKLxGm6dPJne0R4y90eWbLKKoQI9m29dm8UqZ2/hC+L12FcXTeAlus
         bdTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690445222; x=1691050022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hJ9OcOwqZEZhIoLNGrov7as0vMS5t1dTfm2Sm9qefJI=;
        b=DJQDxmgDM2ME4sXwKxyKIHv1R72CQ2uOj6b0snqVz5ryty0U4gISmwKGvPN2cGLT87
         s7+QcFiYSnLkMUxAKAizBS7pCV3xVwhYpp6UNWHlBZgY/TUhaAUJ8sNNCYakb1+Vdc5H
         nhz4CysJ1jDe0RtV12J/aY5IAzCXOY83nn6qRa4EoYKlhXoYdRmVMuYhtb5miFbjj+gu
         IBsV2C7GBqv+EUWWU3lucYsltIGbv476ZRUshTR1Vs2eGZQ6Wn/H5BSzp6jM/rEwwHq4
         h8GMTX9P4uf3CqJNbUzh4/o7quB+5RdWaAa+iWSV3Wq3tKrImsX5P3kloVMxY6XA4zcd
         5ltA==
X-Gm-Message-State: ABy/qLYzGm946MeIq+teuJPYtNUZogidMuFIRnNyjIpY9azx731e1OLG
	9E6FkBdSCmjpo/dEza4idNOHZw==
X-Google-Smtp-Source: APBJJlEQjBlPfpR5V6JAfBPtQGnM4uH9f200On7b1qJi/VneGv5RiS5uPlFi7ClY0YXsCiY0kjcbBw==
X-Received: by 2002:aa7:8615:0:b0:681:9fe0:b543 with SMTP id p21-20020aa78615000000b006819fe0b543mr4619538pfn.2.1690445222261;
        Thu, 27 Jul 2023 01:07:02 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
        by smtp.gmail.com with ESMTPSA id j8-20020aa78d08000000b006828e49c04csm885872pfe.75.2023.07.27.01.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 01:07:01 -0700 (PDT)
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
Subject: [PATCH v3 06/49] kvm: mmu: dynamically allocate the x86-mmu shrinker
Date: Thu, 27 Jul 2023 16:04:19 +0800
Message-Id: <20230727080502.77895-7-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
References: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_010705_360273_3A3B9DC8 
X-CRM114-Status: GOOD (  11.44  )
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

Use new APIs to dynamically allocate the x86-mmu shrinker.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Reviewed-by: Muchun Song <songmuchun@bytedance.com>
---
 arch/x86/kvm/mmu/mmu.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index ec169f5c7dce..15fc92a24a26 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -6847,11 +6847,7 @@ static unsigned long mmu_shrink_count(struct shrinker *shrink,
 	return percpu_counter_read_positive(&kvm_total_used_mmu_pages);
 }
 
-static struct shrinker mmu_shrinker = {
-	.count_objects = mmu_shrink_count,
-	.scan_objects = mmu_shrink_scan,
-	.seeks = DEFAULT_SEEKS * 10,
-};
+static struct shrinker *mmu_shrinker;
 
 static void mmu_destroy_caches(void)
 {
@@ -6984,10 +6980,16 @@ int kvm_mmu_vendor_module_init(void)
 	if (percpu_counter_init(&kvm_total_used_mmu_pages, 0, GFP_KERNEL))
 		goto out;
 
-	ret = register_shrinker(&mmu_shrinker, "x86-mmu");
-	if (ret)
+	mmu_shrinker = shrinker_alloc(0, "x86-mmu");
+	if (!mmu_shrinker)
 		goto out_shrinker;
 
+	mmu_shrinker->count_objects = mmu_shrink_count;
+	mmu_shrinker->scan_objects = mmu_shrink_scan;
+	mmu_shrinker->seeks = DEFAULT_SEEKS * 10;
+
+	shrinker_register(mmu_shrinker);
+
 	return 0;
 
 out_shrinker:
@@ -7009,7 +7011,7 @@ void kvm_mmu_vendor_module_exit(void)
 {
 	mmu_destroy_caches();
 	percpu_counter_destroy(&kvm_total_used_mmu_pages);
-	unregister_shrinker(&mmu_shrinker);
+	shrinker_free(mmu_shrinker);
 }
 
 /*
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
