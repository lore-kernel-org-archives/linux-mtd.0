Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00719C3DA6F
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Aug 2023 03:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tNrOx8obqspTDglLTsbCBfVArC/194S14Qc0egJhXfY=; b=nfzHwmSJpv8A/i
	HgxHHw1bMRVLkjD9ga/g7TNQGXQzQ1Z/pV7Y7XkMYnLzrE2Gnv9Hl87AySViykHI/m5wGq/+6CBUu
	AiuxBhOlOgEMhSpKTOwEGCCcCyDUeMfXrllAUeYwFs+7IZets7LaHX85huqgQvXXxyg3mojl+6Dj1
	P5wPLh2LPR2Ab3TztxkXeDvA1z7kryUXlcQRawm7NzD9UuDk5/6anzaiskLYYEd+yvkWv0N3vQ1Tf
	WIjO0sn66tKTi6UNtSSpGWVbCyVJ5FXcKJn7Hftmp+kwF/znYrQJj3aTP2962kpsTBNPMXlxT6mFs
	HJrNnp6pKG3HF4gRKXRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ1Ia-0024LP-34;
	Thu, 24 Aug 2023 03:46:20 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ1IX-0024HI-0U
	for linux-mtd@lists.infradead.org;
	Thu, 24 Aug 2023 03:46:19 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-68a56ed12c0so755957b3a.0
        for <linux-mtd@lists.infradead.org>; Wed, 23 Aug 2023 20:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1692848751; x=1693453551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=txor78tbBDUbFlDeMsr+ZFPB/YYvYFMci1CkfHTVP5Y=;
        b=f2vdVUxrd53niqhHN3lu7O/qQCjl9NcyQMCaxNn5T6viuJuL5MKYfAonmu/gm5BijH
         nC5Wpi4a7PWBB7q8tUPiP0oHBb2PXMLT03b/6gYrtmaZCnd6Mt+uzRWvKmEXemtjQCQG
         ZqOtchTpFwMV/kb2DFtC6mLoj+uRINLATigvC/sQxB1HuNKMTQhQNfDZaNKW7QuCPmlO
         ar3szccuZEbmvlHzXFE8IKU2droLxg3xvWMPq6hPvSFYUp81Eg8+xfvSTACAFhtcNIz4
         psn56S58o40IpPO+R5N36OuNZcU3R6vH+0jY7JcoeFkHzXkKohk/Mg5hsgTkh16avUea
         DzSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692848751; x=1693453551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=txor78tbBDUbFlDeMsr+ZFPB/YYvYFMci1CkfHTVP5Y=;
        b=ZhD2EnKCBXBCFshCTKU1ASUVl4AKT54jDCQK9PippUIeu9nlhs2kpGHpxigoeGYuxQ
         P5wbN8ahni7R/EWueEonFm8pdIxgypOSQVu3InwO03FxWtx3GQDkOvqsbmCQqb/ilhoN
         9NUJMIv67iuC62t2MGA16mAnZleDKunBqk2GEFvu34VA32FfYH9iGc3fHIGdje3xMmN1
         59XFSYMrbGgyZ8/g/PG7P95N5EE5Lorn043TZkD3qS3C2nFvgKO4dZ2X25Dl9+6lXzOK
         3M8+pZA14OY+thqMgRgM2PjT5Dr/qxfic/KcNRUFLCR8X9GkugySP/3GLH7VimmdvJgI
         mq9A==
X-Gm-Message-State: AOJu0Yzqe6a45zZYMippLu51CXKc62hU+S11qB1ZFAoHo1F42DO5QVoC
	5ESlCu1BKCyuu0vA/vkfTsP+fg==
X-Google-Smtp-Source: AGHT+IEvg2+/eMxtzAUOdXGTx3O6wsmWYf8GYszkDdU34p+/e066zZfZMwabjJVp+KFh4Fxn8XPDyg==
X-Received: by 2002:a05:6a00:1d87:b0:67f:8ef5:2643 with SMTP id z7-20020a056a001d8700b0067f8ef52643mr15497296pfw.2.1692848751025;
        Wed, 23 Aug 2023 20:45:51 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.146])
        by smtp.gmail.com with ESMTPSA id t6-20020a63b246000000b005579f12a238sm10533157pgo.86.2023.08.23.20.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 20:45:50 -0700 (PDT)
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
Subject: [PATCH v5 14/45] ubifs: dynamically allocate the ubifs-slab shrinker
Date: Thu, 24 Aug 2023 11:42:33 +0800
Message-Id: <20230824034304.37411-15-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230824034304.37411-1-zhengqi.arch@bytedance.com>
References: <20230824034304.37411-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_204617_574116_971ECF60 
X-CRM114-Status: GOOD (  12.66  )
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
 fs/ubifs/super.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index b08fb28d16b5..c690782388a8 100644
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
 
@@ -2439,10 +2435,16 @@ static int __init ubifs_init(void)
 	if (!ubifs_inode_slab)
 		return -ENOMEM;
 
-	err = register_shrinker(&ubifs_shrinker_info, "ubifs-slab");
-	if (err)
+	ubifs_shrinker_info = shrinker_alloc(0, "ubifs-slab");
+	if (!ubifs_shrinker_info)
 		goto out_slab;
 
+	ubifs_shrinker_info->count_objects = ubifs_shrink_count;
+	ubifs_shrinker_info->scan_objects = ubifs_shrink_scan;
+	ubifs_shrinker_info->seeks = DEFAULT_SEEKS;
+
+	shrinker_register(ubifs_shrinker_info);
+
 	err = ubifs_compressors_init();
 	if (err)
 		goto out_shrinker;
@@ -2467,7 +2469,7 @@ static int __init ubifs_init(void)
 	dbg_debugfs_exit();
 	ubifs_compressors_exit();
 out_shrinker:
-	unregister_shrinker(&ubifs_shrinker_info);
+	shrinker_free(ubifs_shrinker_info);
 out_slab:
 	kmem_cache_destroy(ubifs_inode_slab);
 	return err;
@@ -2483,7 +2485,7 @@ static void __exit ubifs_exit(void)
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
