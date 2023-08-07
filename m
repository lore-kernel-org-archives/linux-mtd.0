Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83453EB64DD
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Aug 2023 11:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TPYnajIwPYlDp9B7GLkVyKxgk9xj12plz2w4f+UajuM=; b=1psnNp3/3/VIl/
	ZaTshenPt0kNuD8x1UofzLVvcb0l1bYguQioLMSwmNvjRr+fv/mmy83P15YhnV6znNVIWteyu82TQ
	xooam4RDPsyRE7u9TaduYZXWqhBvNpCNd5QLUhTXqW60te55wXG5b6sXqNlVd8zZ3ldfyrfRJBby9
	Zn/331qmBntYPpTQTz6n0FmbJDaN70ej8oBKAo/Z5puvKdYav3GId9AWfuFbL70wvKO2TlGL64KEV
	xtGPs/zdA5waSF/a5a+GXVOVB452dM1PbZ+H8iNQI6Zd9R5hBnIeUvRU8rLYo6ssFv3iQIVVs68uK
	vB0NuzjYsoMCH8tO0odA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSyFf-00H2rm-32;
	Mon, 07 Aug 2023 11:18:19 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qSyFd-00H2qk-18
	for linux-mtd@lists.infradead.org;
	Mon, 07 Aug 2023 11:18:18 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-564670fad4bso390965a12.1
        for <linux-mtd@lists.infradead.org>; Mon, 07 Aug 2023 04:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1691407097; x=1692011897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NbTnBXz1rftevvtnrJnbyUTbBXZHNhmRyJT9VBuSKEk=;
        b=I0fRADtMeQ7ZYN4lawqOYqpZyATzMma8+JI7v8Zk4meeIAhlCUAEE4oant9GMpCU9c
         e1/RDTnNhNkcs7YzYpKhdN1XDfh3C1CzV0J+KZ3/D4mlZFUuIdDCGJV9GUewRdITND6b
         4GYUs3S5ZWDZ5Jh0dvaqr1VDHgapHBN1S1ychIZWiQ7oRwFoKrrtIpw0qxts3s8CAjGr
         ydAlHOG9qMq4ZFwUnfssYxxr3X8fPLTZ5CluqYa54YAa1ITLLjbOydQ2pku3tDphziTJ
         CgtcI6R1bGyzpwkNzZouq5zSQbcmQPiHyBeMkjagL4bEVNYZ8WMV4Nik0kWzaqHzYD2e
         Au8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691407097; x=1692011897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NbTnBXz1rftevvtnrJnbyUTbBXZHNhmRyJT9VBuSKEk=;
        b=ckifFreWB3i3EEej4VyMWL9+TpbRuQTxQd55nT7ViJPbTYz8oqSzxvVwue1ai6LuSb
         j8jQKYuTFiYWo4qzCIiVYqSv7Smrb2amjrCxTsptCzVUL3v2cioGBljFqOhcvJMSRZ+w
         N2aGl3lpwtllTZRfwupvzfUxBz9k61hxASkxh7wK7gmKFT8szCdvgksRebEu7STefi4C
         Loe0u2bl+IuXijlAl9RCt/hE2GN9Bb/aWBWN8HtfCnz94/3sCCsk0J5puLyPXvqTNgzK
         e25hZBoQSk9DDGowPqILXqZDYpTS2XSP90JqA17hmwmwfdhUYq6UCzykjuRVubj+Wz2f
         wKIQ==
X-Gm-Message-State: ABy/qLbrZZtJxd3RDGHM91mBt1Pj0KDISzdFnP/CdxiPsoaPVcmP/oUI
	FNe+zjZc8FqHl1OOKnmlO6HrPA==
X-Google-Smtp-Source: APBJJlHEA3k+axkYWIvy1nHuTMRTEcDAAx3CbSXEmipYg83y/9axHDl54yrvmY4ExsXdwismqiSLfg==
X-Received: by 2002:a17:90a:901:b0:268:3a31:3e4d with SMTP id n1-20020a17090a090100b002683a313e4dmr23078546pjn.2.1691407096844;
        Mon, 07 Aug 2023 04:18:16 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.146])
        by smtp.gmail.com with ESMTPSA id y13-20020a17090aca8d00b0025be7b69d73sm5861191pjt.12.2023.08.07.04.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 04:18:16 -0700 (PDT)
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
Subject: [PATCH v4 39/48] xfs: dynamically allocate the xfs-qm shrinker
Date: Mon,  7 Aug 2023 19:09:27 +0800
Message-Id: <20230807110936.21819-40-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230807110936.21819-1-zhengqi.arch@bytedance.com>
References: <20230807110936.21819-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_041817_386983_AB4603F2 
X-CRM114-Status: GOOD (  12.80  )
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
dynamically allocate the xfs-qm shrinker, so that it can be freed
asynchronously using kfree_rcu(). Then it doesn't need to wait for RCU
read-side critical section when releasing the struct xfs_quotainfo.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Reviewed-by: Muchun Song <songmuchun@bytedance.com>
---
 fs/xfs/xfs_qm.c | 28 +++++++++++++++-------------
 fs/xfs/xfs_qm.h |  2 +-
 2 files changed, 16 insertions(+), 14 deletions(-)

diff --git a/fs/xfs/xfs_qm.c b/fs/xfs/xfs_qm.c
index 6abcc34fafd8..15ba23f11271 100644
--- a/fs/xfs/xfs_qm.c
+++ b/fs/xfs/xfs_qm.c
@@ -504,8 +504,7 @@ xfs_qm_shrink_scan(
 	struct shrinker		*shrink,
 	struct shrink_control	*sc)
 {
-	struct xfs_quotainfo	*qi = container_of(shrink,
-					struct xfs_quotainfo, qi_shrinker);
+	struct xfs_quotainfo	*qi = shrink->private_data;
 	struct xfs_qm_isolate	isol;
 	unsigned long		freed;
 	int			error;
@@ -539,8 +538,7 @@ xfs_qm_shrink_count(
 	struct shrinker		*shrink,
 	struct shrink_control	*sc)
 {
-	struct xfs_quotainfo	*qi = container_of(shrink,
-					struct xfs_quotainfo, qi_shrinker);
+	struct xfs_quotainfo	*qi = shrink->private_data;
 
 	return list_lru_shrink_count(&qi->qi_lru, sc);
 }
@@ -680,15 +678,19 @@ xfs_qm_init_quotainfo(
 	if (XFS_IS_PQUOTA_ON(mp))
 		xfs_qm_set_defquota(mp, XFS_DQTYPE_PROJ, qinf);
 
-	qinf->qi_shrinker.count_objects = xfs_qm_shrink_count;
-	qinf->qi_shrinker.scan_objects = xfs_qm_shrink_scan;
-	qinf->qi_shrinker.seeks = DEFAULT_SEEKS;
-	qinf->qi_shrinker.flags = SHRINKER_NUMA_AWARE;
-
-	error = register_shrinker(&qinf->qi_shrinker, "xfs-qm:%s",
-				  mp->m_super->s_id);
-	if (error)
+	qinf->qi_shrinker = shrinker_alloc(SHRINKER_NUMA_AWARE, "xfs-qm:%s",
+					   mp->m_super->s_id);
+	if (!qinf->qi_shrinker) {
+		error = -ENOMEM;
 		goto out_free_inos;
+	}
+
+	qinf->qi_shrinker->count_objects = xfs_qm_shrink_count;
+	qinf->qi_shrinker->scan_objects = xfs_qm_shrink_scan;
+	qinf->qi_shrinker->seeks = DEFAULT_SEEKS;
+	qinf->qi_shrinker->private_data = qinf;
+
+	shrinker_register(qinf->qi_shrinker);
 
 	return 0;
 
@@ -718,7 +720,7 @@ xfs_qm_destroy_quotainfo(
 	qi = mp->m_quotainfo;
 	ASSERT(qi != NULL);
 
-	unregister_shrinker(&qi->qi_shrinker);
+	shrinker_free(qi->qi_shrinker);
 	list_lru_destroy(&qi->qi_lru);
 	xfs_qm_destroy_quotainos(qi);
 	mutex_destroy(&qi->qi_tree_lock);
diff --git a/fs/xfs/xfs_qm.h b/fs/xfs/xfs_qm.h
index 9683f0457d19..d5c9fc4ba591 100644
--- a/fs/xfs/xfs_qm.h
+++ b/fs/xfs/xfs_qm.h
@@ -63,7 +63,7 @@ struct xfs_quotainfo {
 	struct xfs_def_quota	qi_usr_default;
 	struct xfs_def_quota	qi_grp_default;
 	struct xfs_def_quota	qi_prj_default;
-	struct shrinker		qi_shrinker;
+	struct shrinker		*qi_shrinker;
 
 	/* Minimum and maximum quota expiration timestamp values. */
 	time64_t		qi_expiry_min;
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
