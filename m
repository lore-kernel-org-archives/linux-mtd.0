Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A222C41513
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Jul 2023 09:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BSy4XewU9nU+jrTiSJJjsklX7X2S8ka3YSmbjXIsNt0=; b=JF6AM9jbGZpPNj
	pHK/CEoDNav4rvho1Y7X31eS7fauJwl7TP1rZGSMa6h8bguGDpfq/yD+7SfrKO65Gkhle5WCnuW8Q
	+6NjPxJTUJSN8cowoBVqAj42z9RWCqZ0T2n1csYQeLjiGX+Ta0lLz++pqu0XGvET7kEvsG681U7Ed
	hLFw9gxxYScB61tDdw3rQF1f+o+wMGeDQvElwuSp4LyKl6FDU+rwHp5pat7tzjV2Qu1BJsBq1csn4
	3rjDDoXHMR4j3AaG39/wereB0ghnoQwACYtmvBQMdOvZV6KJGpO2bBJhtqAvHpAN4GEX080u06h44
	n2xOjhp/tBPTk4UlPxOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNsAL-003TC1-3D;
	Mon, 24 Jul 2023 09:47:46 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNsAJ-003T9t-0B
	for linux-mtd@lists.infradead.org;
	Mon, 24 Jul 2023 09:47:44 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1b867f9198dso8896415ad.0
        for <linux-mtd@lists.infradead.org>; Mon, 24 Jul 2023 02:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1690192062; x=1690796862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rzRsL3uPXf8EtZhij3twpf+iuH9MzH4dVPBmPqsS5Og=;
        b=gX8Q7SXHLW91QeJQyKDVumBjdRBjyll1XQW/JTChdq9dJqktv+X9ib4/uAMXxgigqH
         2jaNwNGzNzbxV0P1Wq3smVBCy4sNVeMp2d3znSQmH+08EqCorhh8sobS3FzAo1aci+WZ
         ahKKXhVh1u/zcYQLSV07bWs7cg92+ga+7wTGv6JJSEqo99xKqc3+YUXi9LMwyQq6STAk
         AcT7MY/9kuaNFBZqw4pd3+jIBecT2Ao+Yw0ycAdTL8xM/HvxupDlq0E7GLdDU4836YR8
         3HkgcSbyA4vS6vLviPYG979wLCQ5W42uSMh1vXnsGUiqQWrA1KKfF7bNogJb+rMbZ6Yg
         D/lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690192062; x=1690796862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rzRsL3uPXf8EtZhij3twpf+iuH9MzH4dVPBmPqsS5Og=;
        b=dafrHy4BrwDf9RCkzvkoEDXMVb5cdT+W8k1mR37fEatwnIrc0qW7GqikhzL+AgL7ty
         Q/Te8eCFFo49eTxqBl/qeTRCn0nt0a77vaUBebSjL4I+Wnh3HNoyWvUW5Rq581G9eHGa
         v3EHgcGTJJNTzfs0248dXtA8tW7DqzbPKqeNY19q9T5EX9yL5TO5oehmLvwZexKYwb8x
         eR1wfA7YnPOTL0abvrMGRDis+z0H3yPKv3TWNE2W06RDa6M/Dl9DfalEk6jq4tAUqSL1
         1W0Kn1JVbnHQ17dYI7t8htCTLMNdyrp3s/y/bajK4ddMPxmtLxq8rt1LN0Zbiq2DcGPY
         JcBA==
X-Gm-Message-State: ABy/qLa8ItVhuNXK1rn0bHk4JF9MIehntamrKaw4P5Zn7/nzxDwAOqUq
	M5JPbxe0wY0tlpFY0o67JtCXiA==
X-Google-Smtp-Source: APBJJlE2hlcoboYUdUaSOoRiDnmiId7r6Wv5DYfSEbrHd1JPgB9nwdB4ObCAMGW7eL9gTiY+r7GrFA==
X-Received: by 2002:a17:902:d508:b0:1a6:6bdb:b548 with SMTP id b8-20020a170902d50800b001a66bdbb548mr12141350plg.1.1690192062448;
        Mon, 24 Jul 2023 02:47:42 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
        by smtp.gmail.com with ESMTPSA id d5-20020a170902c18500b001bb20380bf2sm8467233pld.13.2023.07.24.02.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 02:47:42 -0700 (PDT)
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
Subject: [PATCH v2 13/47] nfs: dynamically allocate the nfs-acl shrinker
Date: Mon, 24 Jul 2023 17:43:20 +0800
Message-Id: <20230724094354.90817-14-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_024743_092720_515945F7 
X-CRM114-Status: GOOD (  12.47  )
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
---
 fs/nfs/super.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/fs/nfs/super.c b/fs/nfs/super.c
index 2284f749d892..a90b12593383 100644
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
+	shrinker_unregister(acl_shrinker);
 	nfs_unregister_sysctl();
 	unregister_nfs4_fs();
 #ifdef CONFIG_NFS_V4_2
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
