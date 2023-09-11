Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53F10EE7FF4
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Sep 2023 09:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J6oTDuUBozt8Zj713/u08r2WuKU3/preP+1loeXY2zA=; b=LqFovvLssSdbi9
	CKqXecjOJ7E6hs5f4I/g4pRbIcuTa88d0h9r0dJeS5aNbFQJ4vQv5x1720R0BBILkaSiLYRynOs2D
	KEif3zQGa/9lLdy9ZbkKNpCz2OhFh9zVLEdBjWJdDTgpSHPK+v7AEs9x+Pc4Q0bLjq2iPmprtqrEz
	oXCH9Oo2Pk+zTzZuCbVvk2Q7nR461yJGU27FMrLKAK8T/a88Wb4zIRuFcrN2yN+PexURemn6Ijn5x
	SOG/02TwS4GzPfUwqQ9+KVyRmfxuJ35gvhYkGInkEfSlmtbi5l/7mGdmeIvE+4HUIRVcirx1eMfo1
	gHFvctSQM2wJKoCdl27Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfdVr-0003Ki-23;
	Mon, 11 Sep 2023 09:47:23 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfdVo-0003Fw-0h
	for linux-mtd@lists.infradead.org;
	Mon, 11 Sep 2023 09:47:22 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-2684e225a6cso580086a91.1
        for <linux-mtd@lists.infradead.org>; Mon, 11 Sep 2023 02:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1694425634; x=1695030434; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4NJRoYJvtB3JAQ6HjBpWzHn90j4fvohvXnELHULg3ZY=;
        b=fmbSGH4E1evBjVE2CeG/+0g6c8qP9OZ/7eARborLut4cNe6eMwv6i8EEqmOlr7cvvJ
         CDX2gaXM2gak8XbF/ghoHGK8+HdJsq5b17oG4T06thukcrvwVudZrw10dGMDj4EdAHw0
         btHRb+g9D5qsoNTD688H8inu/QYHsGEhRQRqxaKem/x8XZgRaQFMHJ7K4BHViy8VTqiF
         B0WlaSpbbxQTbDt1GPvdFdxmS3Abmxw9Ug0Qz2oBmK9krf6I3zru8u3qhdFwMGxVg68J
         KE6EGq/j2S60ws7VPOTdS+Dx8BPQIJ3s5n00oKJokvelH/HKMQ37bGSRPjYFoUODj878
         rbGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694425634; x=1695030434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4NJRoYJvtB3JAQ6HjBpWzHn90j4fvohvXnELHULg3ZY=;
        b=vfrthp26TbXPrpWTclqOe1vGcLHB2gmGwL7+dthVDL0BreNUG0aDK5/mqXaSrY7hyb
         hStEWm4wAa8lghHS34jtZSnE0FQIW6L3TFMnO+APs2GXz475G0enk9uZuRbRLpIpjmSl
         DJFA/NAuwCXg4/4iKXwWZNbTQIJ/5+8yZCOMMfJQ1/qlsI3a/JyqkCPkTGlCb3HKoba/
         1XyZtLt1TPCcYDOv8LFOowyXKk1eIPqtadzaBO3V9u7iEK5KiHG83UQ0o8D9l3PzMO6x
         19snOVakQhjAXzTBcO8ZgmQrhD2TpUam6BchYf+yn2T9s92nwGyS3gcUZq4B/HNnqCuR
         gD6Q==
X-Gm-Message-State: AOJu0Yy8j5p0gr0P2+ReEFi9iW6hkqub2DIPT641Mt8p+Pr6Vi8/EdsH
	zxdk0TV3iNiiES/Le+O8NK0rnw==
X-Google-Smtp-Source: AGHT+IHGrhLYQcHrSOL/A0AfShLW1GL1aOG0gH1s0a/WptYINVPGtQZkcxOK/Zv27+cAk2ggUFIjmg==
X-Received: by 2002:a17:90a:9bc4:b0:273:e4a7:ce72 with SMTP id b4-20020a17090a9bc400b00273e4a7ce72mr6446431pjw.3.1694425634193;
        Mon, 11 Sep 2023 02:47:14 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.146])
        by smtp.gmail.com with ESMTPSA id az7-20020a170902a58700b001bdc2fdcf7esm5988188plb.129.2023.09.11.02.47.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 02:47:13 -0700 (PDT)
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
	linux-fsdevel@vger.kernel.org,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	Muchun Song <songmuchun@bytedance.com>,
	Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org
Subject: [PATCH v6 14/45] ubifs: dynamically allocate the ubifs-slab shrinker
Date: Mon, 11 Sep 2023 17:44:13 +0800
Message-Id: <20230911094444.68966-15-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230911094444.68966-1-zhengqi.arch@bytedance.com>
References: <20230911094444.68966-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_024720_280174_5621BA75 
X-CRM114-Status: GOOD (  13.45  )
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

Use new APIs to dynamically allocate the ubifs-slab shrinker.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Reviewed-by: Muchun Song <songmuchun@bytedance.com>
CC: Richard Weinberger <richard@nod.at>
CC: linux-mtd@lists.infradead.org
---
 fs/ubifs/super.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index b08fb28d16b5..96f6a9118207 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -54,11 +54,7 @@ module_param_cb(default_version, &ubifs_default_version_ops, &ubifs_default_vers
 static struct kmem_cache *ubifs_inode_slab;
 
 /* UBIFS TNC shrinker description */
-static struct shrinker ubifs_shrinker_info = {
-	.scan_objects = ubifs_shrink_scan,
-	.count_objects = ubifs_shrink_count,
-	.seeks = DEFAULT_SEEKS,
-};
+static struct shrinker *ubifs_shrinker_info;
 
 /**
  * validate_inode - validate inode.
@@ -2373,7 +2369,7 @@ static void inode_slab_ctor(void *obj)
 
 static int __init ubifs_init(void)
 {
-	int err;
+	int err = -ENOMEM;
 
 	BUILD_BUG_ON(sizeof(struct ubifs_ch) != 24);
 
@@ -2439,10 +2435,15 @@ static int __init ubifs_init(void)
 	if (!ubifs_inode_slab)
 		return -ENOMEM;
 
-	err = register_shrinker(&ubifs_shrinker_info, "ubifs-slab");
-	if (err)
+	ubifs_shrinker_info = shrinker_alloc(0, "ubifs-slab");
+	if (!ubifs_shrinker_info)
 		goto out_slab;
 
+	ubifs_shrinker_info->count_objects = ubifs_shrink_count;
+	ubifs_shrinker_info->scan_objects = ubifs_shrink_scan;
+
+	shrinker_register(ubifs_shrinker_info);
+
 	err = ubifs_compressors_init();
 	if (err)
 		goto out_shrinker;
@@ -2467,7 +2468,7 @@ static int __init ubifs_init(void)
 	dbg_debugfs_exit();
 	ubifs_compressors_exit();
 out_shrinker:
-	unregister_shrinker(&ubifs_shrinker_info);
+	shrinker_free(ubifs_shrinker_info);
 out_slab:
 	kmem_cache_destroy(ubifs_inode_slab);
 	return err;
@@ -2483,7 +2484,7 @@ static void __exit ubifs_exit(void)
 	dbg_debugfs_exit();
 	ubifs_sysfs_exit();
 	ubifs_compressors_exit();
-	unregister_shrinker(&ubifs_shrinker_info);
+	shrinker_free(ubifs_shrinker_info);
 
 	/*
 	 * Make sure all delayed rcu free inodes are flushed before we
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
