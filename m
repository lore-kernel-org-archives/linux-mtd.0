Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A98EC04A94
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Aug 2023 11:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ofku3ByxRIJ2tWbYJtaL92O6WfcdbnC8naTTsc5dwbk=; b=wiF2c2PJwDO6PC
	OUkJUFdMSftazQODd643TRl0v7WWzdsBdessTqb9e1OToA8N8Yu8dnQ/asDMnomABNOXCDb/mQfKX
	e3P+xg0K4hwgm+SRqlvjiW4xa/79HU38RAJrL9a5o3eAvc7C2o7JWs2aGUaOT+gA9MLkgyjF3hL45
	2oAhbRNGEhulWdkT06OHHvkbbLGILAVMCW7X24oblGrNvXzZGv/uHbmRgPyfgZyr3pbLElBvf66LD
	S++wFYcrrG1LyTeR1eldM4oPdqsADVIxeg05qoME94URr4EiLeRVk5VZ/LvDDu/XrH5MiR02jg6v2
	FVLOVHnbT+uARTwI8ERA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSy8r-00Gyt0-22;
	Mon, 07 Aug 2023 11:11:17 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qSy8p-00GypH-02
	for linux-mtd@lists.infradead.org;
	Mon, 07 Aug 2023 11:11:16 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-51f64817809so359945a12.1
        for <linux-mtd@lists.infradead.org>; Mon, 07 Aug 2023 04:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1691406673; x=1692011473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YQ2nJ797AaeiRC4tEbuFSwr/qroaEGD64TBkJX9gwcc=;
        b=ln47b2De8WoaconN/yovNFIYkpyrSlbHjJ7O30AuN0v3fhaptV8Rv8p/uTgMw5ewUp
         ZG1baXWX3w4cWqVDXIBOemS0oLj2+PNkaGXC2OZVpKMXphkVdxVMTs/lnTAL5HQl/5sY
         XaAH/gxR2iJTsD9i1SGvIVeauJ8ohBUlyO6fZCAIfCsaCSqlNBgSWC3X4OcCTxOF8D8P
         aJ3rhIbrBRQ4RScgXu8Juii6sq5YNvbJw6x09Ixyfaq7t74WXRGryvfs7JEz6b0jZFwc
         ahGUwsb8fn5Z7b9T7/r6r1MmeGyYyDblu8RFgBNHHb0eaf9aJCBTyNjHYvmNxb3vGqrU
         A9hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691406673; x=1692011473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YQ2nJ797AaeiRC4tEbuFSwr/qroaEGD64TBkJX9gwcc=;
        b=k2bYZfvVbRzFqlqO8Z7XEdvOi/wbdYU9jb/Ux5Jj0ZCJHbovAgFqiDHVUL4nc0Um30
         m0T6F5L11DXTDBKF8Lvx6vW4UQDjtYbvOSKYXuernVu91lEQCAUuV6SENSxl1V6vn5n/
         91m4sH0uMWFIFcCS0fLEwCEJR6MOex2WPsP9oWB5hXhqiSyRGiQ56T0nrk9VJc/aSD0W
         RYug7pWTDzmUkCKBvw5tn26FETiPuO3zsG+44TzXpaLNpyA7V9Q7U4pToGbYnyvw7eNM
         GVAplMMrHJDNoTnf+5fFZ0wwmxf95bNx4OdWNvMpLgxgfWzLZ3R060zcWPoyb4Imvis4
         renA==
X-Gm-Message-State: ABy/qLYrkFuiA8yWuFzkQQW/mCrocdFxpWRyoocSMSi6jOuvZ45n4u9Y
	d2DGEefHSYq+vZ3uarNhwI1/cw==
X-Google-Smtp-Source: APBJJlHrBtuiCQCJiVcJQ0g2xFi5uTTiYi1uZvqZ47NJp4VxlVmrIr4dlBS1TaGO2GoKAlBNE4DJvw==
X-Received: by 2002:a17:90a:53a3:b0:268:437:7bd9 with SMTP id y32-20020a17090a53a300b0026804377bd9mr23468663pjh.3.1691406672888;
        Mon, 07 Aug 2023 04:11:12 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.146])
        by smtp.gmail.com with ESMTPSA id y13-20020a17090aca8d00b0025be7b69d73sm5861191pjt.12.2023.08.07.04.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 04:11:12 -0700 (PDT)
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
Subject: [PATCH v4 06/48] binder: dynamically allocate the android-binder shrinker
Date: Mon,  7 Aug 2023 19:08:54 +0800
Message-Id: <20230807110936.21819-7-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230807110936.21819-1-zhengqi.arch@bytedance.com>
References: <20230807110936.21819-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_041115_057474_03CEAD02 
X-CRM114-Status: GOOD (  11.49  )
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

Use new APIs to dynamically allocate the android-binder shrinker.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 drivers/android/binder_alloc.c | 31 +++++++++++++++++++------------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/drivers/android/binder_alloc.c b/drivers/android/binder_alloc.c
index e3db8297095a..62675cedd38e 100644
--- a/drivers/android/binder_alloc.c
+++ b/drivers/android/binder_alloc.c
@@ -1053,11 +1053,7 @@ binder_shrink_scan(struct shrinker *shrink, struct shrink_control *sc)
 			    NULL, sc->nr_to_scan);
 }
 
-static struct shrinker binder_shrinker = {
-	.count_objects = binder_shrink_count,
-	.scan_objects = binder_shrink_scan,
-	.seeks = DEFAULT_SEEKS,
-};
+static struct shrinker *binder_shrinker;
 
 /**
  * binder_alloc_init() - called by binder_open() for per-proc initialization
@@ -1077,19 +1073,30 @@ void binder_alloc_init(struct binder_alloc *alloc)
 
 int binder_alloc_shrinker_init(void)
 {
-	int ret = list_lru_init(&binder_alloc_lru);
+	int ret;
 
-	if (ret == 0) {
-		ret = register_shrinker(&binder_shrinker, "android-binder");
-		if (ret)
-			list_lru_destroy(&binder_alloc_lru);
+	ret = list_lru_init(&binder_alloc_lru);
+	if (ret)
+		return ret;
+
+	binder_shrinker = shrinker_alloc(0, "android-binder");
+	if (!binder_shrinker) {
+		list_lru_destroy(&binder_alloc_lru);
+		return -ENOMEM;
 	}
-	return ret;
+
+	binder_shrinker->count_objects = binder_shrink_count;
+	binder_shrinker->scan_objects = binder_shrink_scan;
+	binder_shrinker->seeks = DEFAULT_SEEKS;
+
+	shrinker_register(binder_shrinker);
+
+	return 0;
 }
 
 void binder_alloc_shrinker_exit(void)
 {
-	unregister_shrinker(&binder_shrinker);
+	shrinker_free(binder_shrinker);
 	list_lru_destroy(&binder_alloc_lru);
 }
 
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
