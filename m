Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 714AFC04E69
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jul 2023 08:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O+c/nELNRMfNi11oZB/xkBRBM/zm9peH7LC9OgI5wWE=; b=zM02qzJog8rQfS
	3hqfKakIeKVpo+WA638V6ieC7+0sl1UrXvGt6TaniXFMMFcWU2FbXJV4hv+/ZdcAkSTSH2ESep2/g
	aMcssLRRnQbPB6zaXcUdTPjah0ezEHPwNpjYD1u42xpsSgD+w4TqATHPpqTitd0mC+If4kfQLIjy1
	hoqCIBozAg9EOm4VNEpn8GVHCN0rSWM0mRJhNQWOszol2J91RNDzAgx7C+gMvXwNLRUaTg+KUtJTh
	BfJL5vs2mOBB1o+7eSVZgTVoOORyrwdb8XOwG6CeIsyttW77/BW3cZhvfZm+RpSPhVrIlIitAvYJu
	kVmUqXBLhQSDrzTrZcig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOw3M-00CaPo-0h;
	Thu, 27 Jul 2023 08:08:56 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOw3J-00CaNf-1A
	for linux-mtd@lists.infradead.org;
	Thu, 27 Jul 2023 08:08:54 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-686f74a8992so77596b3a.1
        for <linux-mtd@lists.infradead.org>; Thu, 27 Jul 2023 01:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1690445332; x=1691050132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9TzzNXWnGUC4v0Im6lZC1fetjV0NX81rj7dQA53Eb1w=;
        b=fVbo4B1Sn0AGX1nNJK0Eo1gukSsful8PC6Tpi9R2ay4P+tk9frdioPsIm2s6rPxi46
         ++BpYvSQrpfhaqWc0rmuBFjQPz0zzH5N+AGXb67rsChsvEkjfu687Mjmoln0lCJnbS1t
         S6gxfZ/pYInNuKorknrCkgDtrsNJQ+5b+KQpVkQdCPQpNRB6D3agySMM3uM99/xhPotu
         rAoYyPnK20sDnc7vY5XomSSW5p6ngHpl0qbTjtgeFdhf5V6H8EL0+GE/5QBEhSY2aRe8
         CqIfoMbQ3ZACqieIYGVBf+Lq9zLueZGm5ISvf4EF/2FFF37Zi67sB1q+1Y4ZesHEzWZS
         zb1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690445332; x=1691050132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9TzzNXWnGUC4v0Im6lZC1fetjV0NX81rj7dQA53Eb1w=;
        b=Kny1hz8YZa9IyaJt2WLD66KOsRgmfaO0n11ZAPQb3Wmz0o307EchwETllbYXLhnBDx
         I+9IHFZPgsi5Tnwew2J3QA76aMwsUS8wS6D6nm1VmvLrlttSgHTozJM3f7ymQJ0kcxqx
         FTsayJyz7RWGwjr7KqCzxN+MSDV/9J6eJW3ftIqsgvHGVfkQd+oeb1t7hAbBOcR9rvcg
         Tfq2eAQBhOlVwBG1K/1aJsbL0Q7t8kqZRQUS0KVDzAMLjmI9/NEEXzldWogZQamWV4B+
         zqAb5PXd6fQcPepDkPE8+Z9sZyi72DxWv1SXt5wBtmwWHQGOuvOTPIUvzIYXWVWh4tLe
         AIxg==
X-Gm-Message-State: ABy/qLZgLDs9Gmakd/VY5AJFEGSUYOUXVpQ7lV+aSYQS7SVzBTSadD3R
	AMnWOtmt5oVRuScBKOiVqff/Ug==
X-Google-Smtp-Source: APBJJlFfoYzSpk6JWYRi+8IvWqqU5f15Mb/GG4zvV09auI3h1+KA8DLVYcizqJGa8aoS7uGFfDYCtA==
X-Received: by 2002:a05:6a00:488e:b0:677:bb4c:c321 with SMTP id dk14-20020a056a00488e00b00677bb4cc321mr4639246pfb.0.1690445332713;
        Thu, 27 Jul 2023 01:08:52 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
        by smtp.gmail.com with ESMTPSA id j8-20020aa78d08000000b006828e49c04csm885872pfe.75.2023.07.27.01.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 01:08:52 -0700 (PDT)
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
Subject: [PATCH v3 15/49] nfs: dynamically allocate the nfs-acl shrinker
Date: Thu, 27 Jul 2023 16:04:28 +0800
Message-Id: <20230727080502.77895-16-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
References: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_010853_399792_81F54A6E 
X-CRM114-Status: GOOD (  12.36  )
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

Use new APIs to dynamically allocate the nfs-acl shrinker.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Reviewed-by: Muchun Song <songmuchun@bytedance.com>
---
 fs/nfs/super.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/fs/nfs/super.c b/fs/nfs/super.c
index 2284f749d892..072d82e1be06 100644
--- a/fs/nfs/super.c
+++ b/fs/nfs/super.c
@@ -129,11 +129,7 @@ static void nfs_ssc_unregister_ops(void)
 }
 #endif /* CONFIG_NFS_V4_2 */
 
-static struct shrinker acl_shrinker = {
-	.count_objects	= nfs_access_cache_count,
-	.scan_objects	= nfs_access_cache_scan,
-	.seeks		= DEFAULT_SEEKS,
-};
+static struct shrinker *acl_shrinker;
 
 /*
  * Register the NFS filesystems
@@ -153,9 +149,17 @@ int __init register_nfs_fs(void)
 	ret = nfs_register_sysctl();
 	if (ret < 0)
 		goto error_2;
-	ret = register_shrinker(&acl_shrinker, "nfs-acl");
-	if (ret < 0)
+
+	acl_shrinker = shrinker_alloc(0, "nfs-acl");
+	if (!acl_shrinker)
 		goto error_3;
+
+	acl_shrinker->count_objects = nfs_access_cache_count;
+	acl_shrinker->scan_objects = nfs_access_cache_scan;
+	acl_shrinker->seeks = DEFAULT_SEEKS;
+
+	shrinker_register(acl_shrinker);
+
 #ifdef CONFIG_NFS_V4_2
 	nfs_ssc_register_ops();
 #endif
@@ -175,7 +179,7 @@ int __init register_nfs_fs(void)
  */
 void __exit unregister_nfs_fs(void)
 {
-	unregister_shrinker(&acl_shrinker);
+	shrinker_free(acl_shrinker);
 	nfs_unregister_sysctl();
 	unregister_nfs4_fs();
 #ifdef CONFIG_NFS_V4_2
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
