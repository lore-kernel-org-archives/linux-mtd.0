Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF98AEB64DD
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Aug 2023 11:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Oq2Anfpoqegg/9pGlkg+DugWwtklnEA684X+3RBgIU=; b=gsjw5DgmrNRrwq
	walJ4SX7AQ+VXe5yHlHnNtF9F9dxRYPzOD1VOcOy0gJnxcYT4HD2Hfo9Q7/lcO5oTlRjGGyS48pxI
	0+xbCaZFQ1zSRyLmkMwmYG+Hh9zOZBwE3AWvndZ6hVWesSpT/CWgV2CRyvGzJV9j8Mv2pDQbkPLdo
	K1z/L37KVvYpPPcl0m1gdt7Hs1aDaqSjFLm67ChmtA9LBkZI57wmVNIjDSv6cUZRY/FdzOExgGTh5
	Pcut1oc0edTM+/llZdVqHz4NCya82MDPv3N8aQsjSpnO57uXsnzDoRYr/bSKR7aTejj/b4Joo3nbh
	nrM/nLGVf8fJTNcILg8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSyAa-00H00P-1w;
	Mon, 07 Aug 2023 11:13:04 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qSyAW-00Gzx1-19
	for linux-mtd@lists.infradead.org;
	Mon, 07 Aug 2023 11:13:03 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1bc76cdf0cbso594105ad.1
        for <linux-mtd@lists.infradead.org>; Mon, 07 Aug 2023 04:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1691406778; x=1692011578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iXZOOFmuwv6/pQ9jzhgVENlSQpZ5agnqrhquB4Bsoao=;
        b=g3KOL41mxVnCoIlh87RyEsDJeaXpKCIwoVRjVxhTYPV9ovyT4HRH6y73TA0C1Q2AYh
         C+3L3G8pIHBsXVWnvOx0AYLweEtefCIlRKKK8q0sPYgt+7jxn0bL+VsW/sqLMELcQU4/
         RSW5M4MR9/5lWavNFyTrMZwhNOCIGcyf5LN7etoWY5j2p6K+9KrJUCEBYyshFVPRQ9qE
         9NhNeOSkMhfop8u2oBI3A6CKgZEogh2PPWGLFqTsvR6J0EWD/e9GH+/ajfKoDwPmRCfa
         I4bJZTgzaT9SOC+CveLtEvd/OempVrgFf6BTSlV6Y7dsnz5tzmtW7m2tX5rTM+xAbpCn
         YMzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691406778; x=1692011578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iXZOOFmuwv6/pQ9jzhgVENlSQpZ5agnqrhquB4Bsoao=;
        b=lg1NSRDKuS8W2SAVGTPuPUwRUkfZpuuYZL0ESuFPFTdudIAuYKQoqRS8ofyzAj8Soa
         dUDyZ3qvJJJpbIl7iAVRnsAm0g23WCjNU4uWZQs7OE4kQBvgnl6dqx1hoFTbBKxMBUk9
         x3orgdt4J+sW/eAhpbcP7rYXIb2Jyea6a3f8t1ApodfpOCa1QSpV/75J/kkNGIYiOwJh
         BHpV8AmA774p10sM1ImEXWGDKduRn8AV42MHyeA5yjhxq9Cep9wAlCHoiTMYHsPtVeuh
         JyXdQP2QlJMpToR0+gsUvWcH+XnxCTHWhOZrtzOOqrsFf73F/Pv+uSIqzixN6wDJH27b
         /86g==
X-Gm-Message-State: ABy/qLbKI0vBurlFfudhRB9NFBnqjRi1uXK43X86s7QQOpk9kpwAdN3I
	dXR2Lkcuz/Hq52Chh027Y2esow==
X-Google-Smtp-Source: APBJJlFDSvCAq9gTdHkFF7Bzn2YL0W/qaEPzJ7AdGJ/zjCXgG1JFMDLiaFr2l43qqes0mOglkhZu9g==
X-Received: by 2002:a17:902:f688:b0:1bb:d7d4:e2b with SMTP id l8-20020a170902f68800b001bbd7d40e2bmr33138766plg.0.1691406778592;
        Mon, 07 Aug 2023 04:12:58 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.146])
        by smtp.gmail.com with ESMTPSA id y13-20020a17090aca8d00b0025be7b69d73sm5861191pjt.12.2023.08.07.04.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 04:12:58 -0700 (PDT)
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
	Qi Zheng <zhengqi.arch@bytedance.com>,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v4 14/48] nfs: dynamically allocate the nfs-acl shrinker
Date: Mon,  7 Aug 2023 19:09:02 +0800
Message-Id: <20230807110936.21819-15-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230807110936.21819-1-zhengqi.arch@bytedance.com>
References: <20230807110936.21819-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_041300_396149_61C4CCB3 
X-CRM114-Status: GOOD (  12.46  )
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
 fs/nfs/super.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/fs/nfs/super.c b/fs/nfs/super.c
index 2284f749d892..1b5cd0444dda 100644
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
@@ -153,9 +149,19 @@ int __init register_nfs_fs(void)
 	ret = nfs_register_sysctl();
 	if (ret < 0)
 		goto error_2;
-	ret = register_shrinker(&acl_shrinker, "nfs-acl");
-	if (ret < 0)
+
+	acl_shrinker = shrinker_alloc(0, "nfs-acl");
+	if (!acl_shrinker) {
+		ret = -ENOMEM;
 		goto error_3;
+	}
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
@@ -175,7 +181,7 @@ int __init register_nfs_fs(void)
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
