Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBAB7C0015E
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Jul 2023 10:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CRjQaIcZcH63mT1j2PlvECZT/fbt1GJjGKxKFJKUIs4=; b=eKaN70J+N/mgB1
	CzO7KI+7JovnLmr5kzANmopgE6R1c34n4gtoTI8sZ/P5A0wG04LQAud4LBl9zEzzE0Ol5PraLt/Sj
	vQOq6kxI5GGGjdptsBz0HlZJ+KRuedCa2yUfggL3CFpIAIJh8/XwCcmfjkm9YnePM4q68Rr/DMySz
	VdhS66USfIFhGGrhN7YfyO36+e+28d9+PpFP9C7LRPd0VMfLIUQbO2uXYwK0LVVfif/4uquh955Fh
	I7+RTt2/dTwVMFQfuXdAf2I4dCVE2BSIMzPuAnywROhzBWsURCGM7SVpJrgJHnYFlVPJ0E6+sIqmW
	yLeegBQ5DGX674uJooeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNtFu-003vN6-2G;
	Mon, 24 Jul 2023 10:57:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNtFs-003vMb-3B
	for linux-mtd@bombadil.infradead.org;
	Mon, 24 Jul 2023 10:57:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=5g6npGIA+Om/kUVtGYVOvbagC3ZLyiKj4WIBQXCM8VE=; b=A3eeBmVgIchpXvvH3btBPSN1z3
	Xw0x40Bd8YSfYYM+8l4FQGGs3SrGyYdjjXncWGX2MgMbhAt/TZYtAtx3i3rAu+y3APvmxLJNajmzL
	XfVfMGHZDkglucaAwJHmTnsFF7BQRnHrAwi78kK84UJNkpjPNqIfT/zMJl7E267iZucdZIlNK/dcq
	afoetJ5XrnvFPQtgDLQxgy7mFMmyzp2o2qT1FBs/kcI4aDTUjuJzXHTBaYa2XKVUM2Kex1Oq13ez0
	wZBtN0Mnp9BnfffOaC2PiuFLC1NEmmlc+j6BsHcr5yVze5qs67NxZPJPhPXXEOJVsXYGLWHMkxQkM
	Bz1aqyPQ==;
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNsFf-002WyV-02
	for linux-mtd@lists.infradead.org;
	Mon, 24 Jul 2023 09:53:18 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1b8c364ad3bso8867315ad.1
        for <linux-mtd@lists.infradead.org>; Mon, 24 Jul 2023 02:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1690192386; x=1690797186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5g6npGIA+Om/kUVtGYVOvbagC3ZLyiKj4WIBQXCM8VE=;
        b=S2U/TnIA3BvgIyDkI8CsZ/yGFHKz1H8MS/f3pGlXtajPbbIppzU4ekfHL7vbq4g/ee
         nkf99zZjxk8j/nQjCgbgKMXC9ObMD83Ww5ZyYdUYjsuItMzxm4Wsn6u5uqxvVJ5NZt73
         oOt/92HNqWFmybRGcw0zXn+oMfRVMEsr/DoqAZVnk2ZNsy7sblyXn+NZzmRKVz6cNdRV
         wWtdi5bD+tAEC91We9COVwQH6n4HnMN8tXvp4wHRFfihGnGQMhJey9Jy141oS1MYMhJE
         j+pvADu7PynqQJvb+d3VqI6dVhi2sWMN+NPa+E6Stx9k9uciZAdzPwJ0PeFQ9YZYARAb
         3C3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690192386; x=1690797186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5g6npGIA+Om/kUVtGYVOvbagC3ZLyiKj4WIBQXCM8VE=;
        b=Z0V1aRQg0DqyFRkKR3BHoX5c/rSLyaTWcEQowH98M3AkoYBvbKWGV6uL/s86BR8Dp8
         OdfmxZYc761beiAphSc1Ee/3VGbiLOhA03jSraLRPbdKLhlFLpOQYVLy2SuPFw1sL/JI
         477O+YakCfMu7VnjqoYx1cgG2B444IH6NUJJiAIrfq3D0xs2zCj9zZOpCAfsWS+oztMx
         KQ1mkQjpIBW9zipF1TgALYVWmJEiW6GlLvp1Tf/92R01Bw0nK6lrsZT62On1YNzIl4fi
         54blza8BPowvmWDXAvnZsBk4mTKdjZFhIwF7pbvn0f7CVJ4b52l9xF4YyCt82MLZYXr6
         1mlQ==
X-Gm-Message-State: ABy/qLbBEz/mXxl4eXuHN2fk+R1Iewe+U0HsokE4HQfPVceRSJUKwGbF
	xbZpxAfg8fgTlw6FWiVy5yocig==
X-Google-Smtp-Source: APBJJlEx0UJtyjeglsteyzH1DFG53jEzFogOJaFJ6A1FWxhCOYZ9xoBbTcFIdBRvvwYlgD9HKyyPmg==
X-Received: by 2002:a17:902:ce92:b0:1b8:1591:9f81 with SMTP id f18-20020a170902ce9200b001b815919f81mr12186048plg.4.1690192385749;
        Mon, 24 Jul 2023 02:53:05 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
        by smtp.gmail.com with ESMTPSA id d5-20020a170902c18500b001bb20380bf2sm8467233pld.13.2023.07.24.02.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 02:53:05 -0700 (PDT)
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
Subject: [PATCH v2 40/47] fs: super: dynamically allocate the s_shrink
Date: Mon, 24 Jul 2023 17:43:47 +0800
Message-Id: <20230724094354.90817-41-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_105315_405373_E5D6C263 
X-CRM114-Status: GOOD (  16.98  )
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

In preparation for implementing lockless slab shrink, use new APIs to
dynamically allocate the s_shrink, so that it can be freed asynchronously
using kfree_rcu(). Then it doesn't need to wait for RCU read-side critical
section when releasing the struct super_block.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 fs/btrfs/super.c   |  2 +-
 fs/kernfs/mount.c  |  2 +-
 fs/proc/root.c     |  2 +-
 fs/super.c         | 37 +++++++++++++++++++++----------------
 include/linux/fs.h |  2 +-
 5 files changed, 25 insertions(+), 20 deletions(-)

diff --git a/fs/btrfs/super.c b/fs/btrfs/super.c
index f1dd172d8d5b..fad4ded26c80 100644
--- a/fs/btrfs/super.c
+++ b/fs/btrfs/super.c
@@ -1513,7 +1513,7 @@ static struct dentry *btrfs_mount_root(struct file_system_type *fs_type,
 			error = -EBUSY;
 	} else {
 		snprintf(s->s_id, sizeof(s->s_id), "%pg", bdev);
-		shrinker_debugfs_rename(&s->s_shrink, "sb-%s:%s", fs_type->name,
+		shrinker_debugfs_rename(s->s_shrink, "sb-%s:%s", fs_type->name,
 					s->s_id);
 		btrfs_sb(s)->bdev_holder = fs_type;
 		error = btrfs_fill_super(s, fs_devices, data);
diff --git a/fs/kernfs/mount.c b/fs/kernfs/mount.c
index d49606accb07..2657ff1181f1 100644
--- a/fs/kernfs/mount.c
+++ b/fs/kernfs/mount.c
@@ -256,7 +256,7 @@ static int kernfs_fill_super(struct super_block *sb, struct kernfs_fs_context *k
 	sb->s_time_gran = 1;
 
 	/* sysfs dentries and inodes don't require IO to create */
-	sb->s_shrink.seeks = 0;
+	sb->s_shrink->seeks = 0;
 
 	/* get root inode, initialize and unlock it */
 	down_read(&kf_root->kernfs_rwsem);
diff --git a/fs/proc/root.c b/fs/proc/root.c
index a86e65a608da..22b78b28b477 100644
--- a/fs/proc/root.c
+++ b/fs/proc/root.c
@@ -188,7 +188,7 @@ static int proc_fill_super(struct super_block *s, struct fs_context *fc)
 	s->s_stack_depth = FILESYSTEM_MAX_STACK_DEPTH;
 
 	/* procfs dentries and inodes don't require IO to create */
-	s->s_shrink.seeks = 0;
+	s->s_shrink->seeks = 0;
 
 	pde_get(&proc_root);
 	root_inode = proc_get_inode(s, &proc_root);
diff --git a/fs/super.c b/fs/super.c
index e781226e2880..04643fd80886 100644
--- a/fs/super.c
+++ b/fs/super.c
@@ -67,7 +67,7 @@ static unsigned long super_cache_scan(struct shrinker *shrink,
 	long	dentries;
 	long	inodes;
 
-	sb = container_of(shrink, struct super_block, s_shrink);
+	sb = shrink->private_data;
 
 	/*
 	 * Deadlock avoidance.  We may hold various FS locks, and we don't want
@@ -120,7 +120,7 @@ static unsigned long super_cache_count(struct shrinker *shrink,
 	struct super_block *sb;
 	long	total_objects = 0;
 
-	sb = container_of(shrink, struct super_block, s_shrink);
+	sb = shrink->private_data;
 
 	/*
 	 * We don't call trylock_super() here as it is a scalability bottleneck,
@@ -182,7 +182,8 @@ static void destroy_unused_super(struct super_block *s)
 	security_sb_free(s);
 	put_user_ns(s->s_user_ns);
 	kfree(s->s_subtype);
-	free_prealloced_shrinker(&s->s_shrink);
+	if (s->s_shrink)
+		shrinker_free_non_registered(s->s_shrink);
 	/* no delays needed */
 	destroy_super_work(&s->destroy_work);
 }
@@ -259,16 +260,20 @@ static struct super_block *alloc_super(struct file_system_type *type, int flags,
 	s->s_time_min = TIME64_MIN;
 	s->s_time_max = TIME64_MAX;
 
-	s->s_shrink.seeks = DEFAULT_SEEKS;
-	s->s_shrink.scan_objects = super_cache_scan;
-	s->s_shrink.count_objects = super_cache_count;
-	s->s_shrink.batch = 1024;
-	s->s_shrink.flags = SHRINKER_NUMA_AWARE | SHRINKER_MEMCG_AWARE;
-	if (prealloc_shrinker(&s->s_shrink, "sb-%s", type->name))
+	s->s_shrink = shrinker_alloc(SHRINKER_NUMA_AWARE | SHRINKER_MEMCG_AWARE,
+				     "sb-%s", type->name);
+	if (!s->s_shrink)
 		goto fail;
-	if (list_lru_init_memcg(&s->s_dentry_lru, &s->s_shrink))
+
+	s->s_shrink->seeks = DEFAULT_SEEKS;
+	s->s_shrink->scan_objects = super_cache_scan;
+	s->s_shrink->count_objects = super_cache_count;
+	s->s_shrink->batch = 1024;
+	s->s_shrink->private_data = s;
+
+	if (list_lru_init_memcg(&s->s_dentry_lru, s->s_shrink))
 		goto fail;
-	if (list_lru_init_memcg(&s->s_inode_lru, &s->s_shrink))
+	if (list_lru_init_memcg(&s->s_inode_lru, s->s_shrink))
 		goto fail;
 	return s;
 
@@ -326,7 +331,7 @@ void deactivate_locked_super(struct super_block *s)
 {
 	struct file_system_type *fs = s->s_type;
 	if (atomic_dec_and_test(&s->s_active)) {
-		unregister_shrinker(&s->s_shrink);
+		shrinker_unregister(s->s_shrink);
 		fs->kill_sb(s);
 
 		/*
@@ -599,7 +604,7 @@ struct super_block *sget_fc(struct fs_context *fc,
 	hlist_add_head(&s->s_instances, &s->s_type->fs_supers);
 	spin_unlock(&sb_lock);
 	get_filesystem(s->s_type);
-	register_shrinker_prepared(&s->s_shrink);
+	shrinker_register(s->s_shrink);
 	return s;
 
 share_extant_sb:
@@ -678,7 +683,7 @@ struct super_block *sget(struct file_system_type *type,
 	hlist_add_head(&s->s_instances, &type->fs_supers);
 	spin_unlock(&sb_lock);
 	get_filesystem(type);
-	register_shrinker_prepared(&s->s_shrink);
+	shrinker_register(s->s_shrink);
 	return s;
 }
 EXPORT_SYMBOL(sget);
@@ -1312,7 +1317,7 @@ int get_tree_bdev(struct fs_context *fc,
 		down_write(&s->s_umount);
 	} else {
 		snprintf(s->s_id, sizeof(s->s_id), "%pg", bdev);
-		shrinker_debugfs_rename(&s->s_shrink, "sb-%s:%s",
+		shrinker_debugfs_rename(s->s_shrink, "sb-%s:%s",
 					fc->fs_type->name, s->s_id);
 		sb_set_blocksize(s, block_size(bdev));
 		error = fill_super(s, fc);
@@ -1385,7 +1390,7 @@ struct dentry *mount_bdev(struct file_system_type *fs_type,
 		down_write(&s->s_umount);
 	} else {
 		snprintf(s->s_id, sizeof(s->s_id), "%pg", bdev);
-		shrinker_debugfs_rename(&s->s_shrink, "sb-%s:%s",
+		shrinker_debugfs_rename(s->s_shrink, "sb-%s:%s",
 					fs_type->name, s->s_id);
 		sb_set_blocksize(s, block_size(bdev));
 		error = fill_super(s, data, flags & SB_SILENT ? 1 : 0);
diff --git a/include/linux/fs.h b/include/linux/fs.h
index b4dca987a5d8..92748fc368b2 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -1231,7 +1231,7 @@ struct super_block {
 
 	const struct dentry_operations *s_d_op; /* default d_op for dentries */
 
-	struct shrinker s_shrink;	/* per-sb shrinker handle */
+	struct shrinker *s_shrink;	/* per-sb shrinker handle */
 
 	/* Number of inodes with nlink == 0 but still referenced */
 	atomic_long_t s_remove_count;
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
