Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54D21C001E0
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jul 2023 08:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JxtoU4VudeVThI9f0Qp7b7RTqIiGBudAUb4MSFreHDw=; b=kRMkx2cXy0rLCZ
	MDq4ijHokfpjy6tVExNLsdXESCDzFbCnXok8Z5EpceT9fs6lPhZOmkhdlMOxSLxKtkc/CDW7trr/h
	pT8ha25t0mgAmqPQEo3E/7AlugXxb9ezvMbrL6z6VN0aF8uYBhpYgzVblYUdEIZtfh/4nC5LrvU4z
	v4u1hyFhIu7ZwA1HbYm4uKUcwFd83r2W+1d07xR6Rdi1O9LBqV4z7drwgE8YsK0eBz4Sdn0IIh0wB
	ak3Q9L1uIB31gnZ8dEcyxNMvDn08s+z70ielXhaYKzPin7xH+KTG/xX2XQmmhxLJswAIkt4PKkp/v
	4LLkUUoFXrZAVNDDfroQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOw3w-00Cail-0C;
	Thu, 27 Jul 2023 08:09:32 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOw3u-00CahW-0V
	for linux-mtd@lists.infradead.org;
	Thu, 27 Jul 2023 08:09:31 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-682ae5d4184so170939b3a.1
        for <linux-mtd@lists.infradead.org>; Thu, 27 Jul 2023 01:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1690445369; x=1691050169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=et7oKjMo2RpAm9eGe6PO8KzXkO6yMET8jj6KuxhxE1o=;
        b=ZArGb8yz+8ycxhYpd3TfnObsbskAktwxKp/LK6E+gx1lOsm2QqxHLjO1qFt766mx4G
         4UOFzMb5rOBT3wq7QpcOo/50dqnABPqLouzBdNx69dJP3kndLHofbdJgcQSOE87tIEP3
         gOFIB0th/ApJ4utKzdT3r6irRm20AGsjylo629bfexLkXBuL+hMcZdtnwSmPAtxRA7F8
         l3r/R789CkvCTacsaPitu2Mn9fHBZCoAT7Xd7Py97lY3Lp4c0X3H7O8uSS1JwsanI4Cy
         Pf3LZprk/pnZjQej6Xzx3T3CJ+QGRGxZd7LUmSV8XGImv+0X4BPv+EIagOcfGqekhivR
         Bv+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690445369; x=1691050169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=et7oKjMo2RpAm9eGe6PO8KzXkO6yMET8jj6KuxhxE1o=;
        b=c/T++qQfkV4/zIBH8OGVuV1B4+3r1G2AO9HcT+C33Jz+7+NhisYpTJeZSXD1lasYVX
         neQqAVsI4E8PfGxfY4oI3e4ChneTw5MwyBIMTCgyfDOXxVXHIVDbN+dBP9mQQUtA8Tbb
         J1rq/uBfwiHxoabMd36peuzyHyrmbc0pY5BacLoH1E0XQQEr/jhvegG9flgTWkBiTd1+
         jeU4/HI4GTtoYyl/N3neWAcwcsKrWAXrhDZn0piS7Po2cUl88Jg9ZC7ZWKP7MD/IEeAZ
         2X/Ud0OVkqPtOpyLVApe+lwavrKd0+WZzGknOe3FTO8fSGwG5KPcGbv0sswDv9m3aSGo
         aRWw==
X-Gm-Message-State: ABy/qLZ+rNBvV1i/57v0/7kggs1x5eil2bBfBI4x4S7cw3hVTwDu2UMX
	fJCmTmZjWHQ6fhnisdvvJNwZYQ==
X-Google-Smtp-Source: APBJJlGUbAM65UTyBU06poLXl/mtaX6EX5YDf65AxeW9rsxnsdAR4xxA054nRzBMt6Eu4ihj5O0Oaw==
X-Received: by 2002:a05:6a20:7da5:b0:137:3941:17b3 with SMTP id v37-20020a056a207da500b00137394117b3mr5573135pzj.6.1690445369382;
        Thu, 27 Jul 2023 01:09:29 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
        by smtp.gmail.com with ESMTPSA id j8-20020aa78d08000000b006828e49c04csm885872pfe.75.2023.07.27.01.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 01:09:28 -0700 (PDT)
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
Subject: [PATCH v3 18/49] ubifs: dynamically allocate the ubifs-slab shrinker
Date: Thu, 27 Jul 2023 16:04:31 +0800
Message-Id: <20230727080502.77895-19-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
References: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_010930_196299_D84C9AEA 
X-CRM114-Status: GOOD (  12.16  )
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
