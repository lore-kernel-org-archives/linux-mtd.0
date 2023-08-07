Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43F73C04FE1
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Aug 2023 11:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=enspDBUL4D1KhK0K7jSBdqPE8+yM6YS8BzOnVxPe1Co=; b=SMBzFPQFJ9ht3r
	VreShV934ZnN30jYdZgX22En84Cro46D11Np4QAsR2o4BZ3dZcD+Po1O1i3cjrxl16ugUZhpFzbDk
	R57tq4+hDBPPIZajAQp71hfuFIrTNH0fNNGsp91jXwJTXCu812+8INkqumRG0KBw33nNHycIp1jet
	Js/FBM1uJHT+AbXjmia7y38t+5vpBb20W7GWuV20hSPG9PrmifVooPQvJC7R2r1okponXefHb24hj
	PcKx7wg5OZg6N5xUuPnRQYcOssIN3T9EaJYJEtUTmAgQ88fXgR3qYd2fg3oxec6Ypdvocdcdh8tXy
	r6I8IEOHLRRaVYhip3og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSy7o-00GyDD-2O;
	Mon, 07 Aug 2023 11:10:12 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qSy7l-00GyCA-35
	for linux-mtd@lists.infradead.org;
	Mon, 07 Aug 2023 11:10:11 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-5648fca18b9so574481a12.0
        for <linux-mtd@lists.infradead.org>; Mon, 07 Aug 2023 04:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1691406609; x=1692011409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r8W8qq2Uz0spC2GoySlMERPhgmOL8aWRmiOXTDM010g=;
        b=LtcpivNSr/5U6x0m/uiyeqUuM2dtsqsVmyslCvnMZ+TbsDLmyfYCok7TOqfFwU4aou
         suPwxQHD97VI0Q62GW+ZYHDc8tjkHAC6Y2CfDY4CzUPMlkJryxFMZeRg2u77WPUScUma
         /UWc/sCeR8W9qQ3wk0oPqkWmTEZmPd4YXzSaovoOZwWfn9s/VibhxnVRbQAxTTT4rsLS
         7EPkGC2ZgyKx21jg/v6bd406CHIloRAPbtMcp+52o9Mv0AXgKZgqXOlA0BowU0u6XLn9
         g3j+asxGnqU4OhqCycxU0aToYArdbvRqg5AMoRMXcXqSNLhcPxtT3QmhYn/OoV2pniV3
         od0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691406609; x=1692011409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r8W8qq2Uz0spC2GoySlMERPhgmOL8aWRmiOXTDM010g=;
        b=dtHapk2QxPE6LPVkWPgKal0FEf1/O28+Hy1g6v1F3Li0Vobib3yFh1wz6SGBsmFqXw
         UskAlCCas+iDZlwmh6ShSzP6g3S3RBVhwnXW9uNE9utg7miJr0AAXHf/Fq8Ip8YT+57N
         IxUmqdKkSbAZutLuO0vWyQjxJLFwFRrXwR4rIw9/BRs68uNx0Pqt/N8FhK3xzSe5+yv9
         G4n5Ozpn2/dbgU5Ys4eOnn9aziTimCtNLDujxTdQwLbiTcQVNUyv2ETC+vsg6h7joPMd
         ONaSe7xgKrfF2s+hR/g3nXxToWbQ+d0F38Cs7O9elUQv6CW4+3CKqT33BwA6dPZ0hDea
         e3bA==
X-Gm-Message-State: ABy/qLZMBEVl4iW7j3uxTVukE4ZJfaRRMgA1g90HSgWxAyXnYfW92nO0
	hZKTEhbPE8T7Q/sQ4D+PabnAKw==
X-Google-Smtp-Source: APBJJlH4Xq2ZH2mKI5CfuqTuY77FQCtuH4PGEB2vg3tzfU2CpFxEqGweFj8X5L0soAOYNhp1I46kQg==
X-Received: by 2002:a17:90a:4104:b0:25c:1ad3:a4a1 with SMTP id u4-20020a17090a410400b0025c1ad3a4a1mr24586808pjf.1.1691406608964;
        Mon, 07 Aug 2023 04:10:08 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.146])
        by smtp.gmail.com with ESMTPSA id y13-20020a17090aca8d00b0025be7b69d73sm5861191pjt.12.2023.08.07.04.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 04:10:08 -0700 (PDT)
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
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v4 01/48] mm: move some shrinker-related function declarations to mm/internal.h
Date: Mon,  7 Aug 2023 19:08:49 +0800
Message-Id: <20230807110936.21819-2-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230807110936.21819-1-zhengqi.arch@bytedance.com>
References: <20230807110936.21819-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_041009_994187_993CC720 
X-CRM114-Status: GOOD (  10.72  )
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

The following functions are only used inside the mm subsystem, so it's
better to move their declarations to the mm/internal.h file.

1. shrinker_debugfs_add()
2. shrinker_debugfs_detach()
3. shrinker_debugfs_remove()

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 include/linux/shrinker.h | 19 -------------------
 mm/internal.h            | 28 ++++++++++++++++++++++++++++
 2 files changed, 28 insertions(+), 19 deletions(-)

diff --git a/include/linux/shrinker.h b/include/linux/shrinker.h
index 224293b2dd06..8dc15aa37410 100644
--- a/include/linux/shrinker.h
+++ b/include/linux/shrinker.h
@@ -106,28 +106,9 @@ extern void free_prealloced_shrinker(struct shrinker *shrinker);
 extern void synchronize_shrinkers(void);
 
 #ifdef CONFIG_SHRINKER_DEBUG
-extern int shrinker_debugfs_add(struct shrinker *shrinker);
-extern struct dentry *shrinker_debugfs_detach(struct shrinker *shrinker,
-					      int *debugfs_id);
-extern void shrinker_debugfs_remove(struct dentry *debugfs_entry,
-				    int debugfs_id);
 extern int __printf(2, 3) shrinker_debugfs_rename(struct shrinker *shrinker,
 						  const char *fmt, ...);
 #else /* CONFIG_SHRINKER_DEBUG */
-static inline int shrinker_debugfs_add(struct shrinker *shrinker)
-{
-	return 0;
-}
-static inline struct dentry *shrinker_debugfs_detach(struct shrinker *shrinker,
-						     int *debugfs_id)
-{
-	*debugfs_id = -1;
-	return NULL;
-}
-static inline void shrinker_debugfs_remove(struct dentry *debugfs_entry,
-					   int debugfs_id)
-{
-}
 static inline __printf(2, 3)
 int shrinker_debugfs_rename(struct shrinker *shrinker, const char *fmt, ...)
 {
diff --git a/mm/internal.h b/mm/internal.h
index 154da4f0d557..6f21926393af 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -1143,4 +1143,32 @@ struct vma_prepare {
 	struct vm_area_struct *remove;
 	struct vm_area_struct *remove2;
 };
+
+/*
+ * shrinker related functions
+ */
+
+#ifdef CONFIG_SHRINKER_DEBUG
+extern int shrinker_debugfs_add(struct shrinker *shrinker);
+extern struct dentry *shrinker_debugfs_detach(struct shrinker *shrinker,
+					      int *debugfs_id);
+extern void shrinker_debugfs_remove(struct dentry *debugfs_entry,
+				    int debugfs_id);
+#else /* CONFIG_SHRINKER_DEBUG */
+static inline int shrinker_debugfs_add(struct shrinker *shrinker)
+{
+	return 0;
+}
+static inline struct dentry *shrinker_debugfs_detach(struct shrinker *shrinker,
+						     int *debugfs_id)
+{
+	*debugfs_id = -1;
+	return NULL;
+}
+static inline void shrinker_debugfs_remove(struct dentry *debugfs_entry,
+					   int debugfs_id)
+{
+}
+#endif /* CONFIG_SHRINKER_DEBUG */
+
 #endif	/* __MM_INTERNAL_H */
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
