Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 079E2C0015E
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jul 2023 08:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s6a90uPhPXKy5s0FQixlnv2DzEHS3TIIbu1OxIfPDvg=; b=1yIX2bJp/3vuS5
	CHx6ypmRiqsxRlUHgsmNMGy+R4gFmb7GnkbUp59K3eMTJvnzU+1ZnV1D8J7udTSHTwdKjo/3wAh4C
	5cRLZw8GYhrTpRWc4FOaWbo+SXqce+RKQOYwklh8JdlHHN/Ndd1xBGqxrykqomRBzfS+aSzGFiZgJ
	9LA/lI7zVG56UxMWEFBll4fd6v8EV+y+o+5RmSdqSqpecgXwROTIaWDAeg3nk9LeaYAVIR7u3P5TP
	ii6MgAmWbTlRCGXEMAO16N5MEyjB4hcjR9Ka9KWhsBPV6ELiFdkyakOxsGBfP87w2zo/qUe5/LoFd
	i4TPma4ZAIParH66X6Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOw2a-00CZyn-0l;
	Thu, 27 Jul 2023 08:08:08 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOw2W-00CZwj-2i
	for linux-mtd@lists.infradead.org;
	Thu, 27 Jul 2023 08:08:06 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-686f6231bdeso112588b3a.1
        for <linux-mtd@lists.infradead.org>; Thu, 27 Jul 2023 01:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1690445284; x=1691050084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f+zNYaRC7WOrXvS9MeEiQUBTAQfjLjc/pgN/esuhj34=;
        b=abLX7f3+1Jx7z4l7fMDPHLPoRZGZ9R0nM8ns3oWVX7aiHujgqPmDptRXrf7K4N1NV7
         iafFd1vKgmMytglgpeByIm2etm8PBx6nYdrahZ4g0/dxHWR3bRoC5c0K2oAToNHdR0rs
         G85XXQ+OMNSfgkQPICGhKu4AFUznJk92yyLKwDX6t68bXy1Y1afxgcqF2Hrs2hRsS8Pi
         1cVGQ/135Rq8DHs2i32YJ/uaSpZLHmMFkQEdBwI9bGEy1fU1/6Py8qR+g4Mw2XtURfuH
         rP2vSQAfzwsm7AmoQxkWOyj1kIWSKeW+aRYJEV/VwcFYAz1pgMCM8AVBtPjE13HITA/4
         GS9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690445284; x=1691050084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f+zNYaRC7WOrXvS9MeEiQUBTAQfjLjc/pgN/esuhj34=;
        b=l58rpJr/jqVFy26X60OmnJ5ROxWIE30PO/J/pXDGs0p1a0YG7iXgU4QcARkajmgywe
         4iJE3mXY9L9p9J8+eqmpOYoZaxAfAoTquSlpO922AaSYQcDV4rzkgFqDAratFn6FubOs
         Dcqy14K0yAUMiwdvRP5z5PtV86IYUe1gV8Ja7S2VnwhRNWpIVLpOdRKqrxKFhW3PM+Hn
         6eMSbXpCc1OJSr7qsjdShID4bpT6ttp8YTY7Xr50aQOxt65KPbnkgT3jOcFTlsQOx84B
         hCkI4PFSs4PLwEi8whxJC8tGnyXEHtXNnzIQJ2jBb9nIaiHQZ2fd5TZBrxECPeMTEpBM
         9vZQ==
X-Gm-Message-State: ABy/qLaUyJ6hwZcoI3bSfeFQm5ygbSqJjV77SVDDrYypTjDzlTzgbuyz
	/m6lXahBA/TtACg6Ap3oRk3kMA==
X-Google-Smtp-Source: APBJJlHpYZMPheHhGtAzh7w//Dgf2VgsvvziRNiT4CodVVfE3Y9RoyQKb/hEjPAgUidNi6thlhXB+g==
X-Received: by 2002:a05:6a20:4286:b0:12d:77e:ba3 with SMTP id o6-20020a056a20428600b0012d077e0ba3mr6418674pzj.0.1690445284151;
        Thu, 27 Jul 2023 01:08:04 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
        by smtp.gmail.com with ESMTPSA id j8-20020aa78d08000000b006828e49c04csm885872pfe.75.2023.07.27.01.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 01:08:03 -0700 (PDT)
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
Subject: [PATCH v3 11/49] f2fs: dynamically allocate the f2fs-shrinker
Date: Thu, 27 Jul 2023 16:04:24 +0800
Message-Id: <20230727080502.77895-12-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
References: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_010804_956577_75DA40E7 
X-CRM114-Status: GOOD (  12.31  )
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

Use new APIs to dynamically allocate the f2fs-shrinker.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Reviewed-by: Muchun Song <songmuchun@bytedance.com>
---
 fs/f2fs/super.c | 32 ++++++++++++++++++++++++--------
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index a123f1378d57..9200b67aa745 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -83,11 +83,27 @@ void f2fs_build_fault_attr(struct f2fs_sb_info *sbi, unsigned int rate,
 #endif
 
 /* f2fs-wide shrinker description */
-static struct shrinker f2fs_shrinker_info = {
-	.scan_objects = f2fs_shrink_scan,
-	.count_objects = f2fs_shrink_count,
-	.seeks = DEFAULT_SEEKS,
-};
+static struct shrinker *f2fs_shrinker_info;
+
+static int __init f2fs_init_shrinker(void)
+{
+	f2fs_shrinker_info = shrinker_alloc(0, "f2fs-shrinker");
+	if (!f2fs_shrinker_info)
+		return -ENOMEM;
+
+	f2fs_shrinker_info->count_objects = f2fs_shrink_count;
+	f2fs_shrinker_info->scan_objects = f2fs_shrink_scan;
+	f2fs_shrinker_info->seeks = DEFAULT_SEEKS;
+
+	shrinker_register(f2fs_shrinker_info);
+
+	return 0;
+}
+
+static void f2fs_exit_shrinker(void)
+{
+	shrinker_free(f2fs_shrinker_info);
+}
 
 enum {
 	Opt_gc_background,
@@ -4937,7 +4953,7 @@ static int __init init_f2fs_fs(void)
 	err = f2fs_init_sysfs();
 	if (err)
 		goto free_garbage_collection_cache;
-	err = register_shrinker(&f2fs_shrinker_info, "f2fs-shrinker");
+	err = f2fs_init_shrinker();
 	if (err)
 		goto free_sysfs;
 	err = register_filesystem(&f2fs_fs_type);
@@ -4982,7 +4998,7 @@ static int __init init_f2fs_fs(void)
 	f2fs_destroy_root_stats();
 	unregister_filesystem(&f2fs_fs_type);
 free_shrinker:
-	unregister_shrinker(&f2fs_shrinker_info);
+	f2fs_exit_shrinker();
 free_sysfs:
 	f2fs_exit_sysfs();
 free_garbage_collection_cache:
@@ -5014,7 +5030,7 @@ static void __exit exit_f2fs_fs(void)
 	f2fs_destroy_post_read_processing();
 	f2fs_destroy_root_stats();
 	unregister_filesystem(&f2fs_fs_type);
-	unregister_shrinker(&f2fs_shrinker_info);
+	f2fs_exit_shrinker();
 	f2fs_exit_sysfs();
 	f2fs_destroy_garbage_collection_cache();
 	f2fs_destroy_extent_cache();
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
