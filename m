Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CB24C04E69
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jul 2023 08:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jQFBZg6KwrB+ecdNAcLElp5kaA7hKBPqdVnamLHfzDo=; b=mPMhVuuE5ecfRm
	YCmbwywUwgV37Fcv5qbTeXimlIKn85MRGtJd4vL0gGAaWfutV8PirDGJxixoMDiwX6jj0OfncxGen
	MrXWkq0eGcI6A4keO4eYU2i0zBghePJ9vAJVvznFYrD8P+iGo45WtXYBzXNLpr6yf4PUba5DoIjv+
	9AE9ojprPGxUeHGfHn3sBbCfMd5duejBTWgr6ROxqeL1f7Ue0+YABA4FxCkrOGCdpUUyw1TTiyoGN
	FDxKRrTTanvbCeT/jusHcIwmLTdro3mJ+9dobNhJ+ALb002EHhfqXvYnVLu+65B5moaeWZ8ZHyAkB
	aV1rS/YwM0Oqha3f/Pyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOw0e-00CYyt-2I;
	Thu, 27 Jul 2023 08:06:08 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOw0Y-00CYvR-33
	for linux-mtd@lists.infradead.org;
	Thu, 27 Jul 2023 08:06:05 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-686f6231bdeso112240b3a.1
        for <linux-mtd@lists.infradead.org>; Thu, 27 Jul 2023 01:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1690445160; x=1691049960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CmSKD1W4o1llBpukOwDAPdWOg+LYzWoL67ya0UPwqvg=;
        b=bWsdCjXI/QTCbfrXnl1D1RHs1UzV532bO1xy0F2QKWdmxdeZNg1bc8fwYppoEa2Sii
         fv3Dw05OLiEoJFGdDqA0cK2BR0yissZW0QGh0p8G2jYOCo1VM3qmhhRKOuDu3Ld44+HC
         IlU/6E6PL7OGmulpkRgvQIFGvR7K7vSKmFATJlzNsM5VU0kfb+Q9ux9XLDln9HSGLjNa
         erFo50JbYYva+gdlhuASAFmcGCxJk1UklUElA3OcQq/NsulVXFSALP8x8A3jEL8k5O2s
         pAuqLDXkBW250K5e8xHlcez81V5k+DmAOms7sfdEUrryxL8JhS9LUOK5EJtF0pDaEYI9
         8JWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690445160; x=1691049960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CmSKD1W4o1llBpukOwDAPdWOg+LYzWoL67ya0UPwqvg=;
        b=gOLo4UP1dtgD7dwYFYmriTvxbGDFB9NI9uHIdNqmR+16K3st3nAYhDbP9npq7GaY5x
         cTFiN/f0amVa9k8jYkC41DIwtPsjcFqhVez8kfHwypndNortKx2m6I659MeOv+pSlc9Y
         DPyiWH53+qReIz8/EstX/RKkNBa0+0xHkJpMSjr7G7f3F0vAWA0Ukgk2YrnlgybkCj6G
         RYeI6tuihOEBGKR3Fe8JOmB0eUL7afvozJC+8unrpnemm9wMjSzT1Ymo+sVVinDD2srA
         w07QWxVjgz5me3Dgot8nqkgivjnn/QNs17qis2mmuYPDaj2LZypNS1WChZzoSi9snDkD
         M69g==
X-Gm-Message-State: ABy/qLbO017MUB1QXoUqy84upddOka5f4nXuRuqcGy1fTlAYUNG/Wvus
	JePeKQyDTEgkPPG28wGTUgXhfQ==
X-Google-Smtp-Source: APBJJlGsBl3klUilUFzaktHEHOMbkNlcOB/1K8g6HjcIbYlgfdxi92AgDTolw1HjCRkDLU6/tzA6hQ==
X-Received: by 2002:a05:6a21:78a8:b0:137:3eba:b81f with SMTP id bf40-20020a056a2178a800b001373ebab81fmr6002609pzc.3.1690445159927;
        Thu, 27 Jul 2023 01:05:59 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
        by smtp.gmail.com with ESMTPSA id j8-20020aa78d08000000b006828e49c04csm885872pfe.75.2023.07.27.01.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 01:05:59 -0700 (PDT)
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
	Carlos Llamas <cmllamas@google.com>
Subject: [PATCH v3 01/49] binder: fix memory leak in binder_init()
Date: Thu, 27 Jul 2023 16:04:14 +0800
Message-Id: <20230727080502.77895-2-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
References: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_010603_094729_45579E30 
X-CRM114-Status: GOOD (  11.41  )
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

In binder_init(), the destruction of binder_alloc_shrinker_init() is not
performed in the wrong path, which will cause memory leaks. So this commit
introduces binder_alloc_shrinker_exit() and calls it in the wrong path to
fix that.

Fixes: f2517eb76f1f ("android: binder: Add global lru shrinker to binder")
Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Acked-by: Carlos Llamas <cmllamas@google.com>
---
 drivers/android/binder.c       | 1 +
 drivers/android/binder_alloc.c | 6 ++++++
 drivers/android/binder_alloc.h | 1 +
 3 files changed, 8 insertions(+)

diff --git a/drivers/android/binder.c b/drivers/android/binder.c
index 486c8271cab7..d720f93d8b19 100644
--- a/drivers/android/binder.c
+++ b/drivers/android/binder.c
@@ -6617,6 +6617,7 @@ static int __init binder_init(void)
 
 err_alloc_device_names_failed:
 	debugfs_remove_recursive(binder_debugfs_dir_entry_root);
+	binder_alloc_shrinker_exit();
 
 	return ret;
 }
diff --git a/drivers/android/binder_alloc.c b/drivers/android/binder_alloc.c
index 662a2a2e2e84..e3db8297095a 100644
--- a/drivers/android/binder_alloc.c
+++ b/drivers/android/binder_alloc.c
@@ -1087,6 +1087,12 @@ int binder_alloc_shrinker_init(void)
 	return ret;
 }
 
+void binder_alloc_shrinker_exit(void)
+{
+	unregister_shrinker(&binder_shrinker);
+	list_lru_destroy(&binder_alloc_lru);
+}
+
 /**
  * check_buffer() - verify that buffer/offset is safe to access
  * @alloc: binder_alloc for this proc
diff --git a/drivers/android/binder_alloc.h b/drivers/android/binder_alloc.h
index 138d1d5af9ce..dc1e2b01dd64 100644
--- a/drivers/android/binder_alloc.h
+++ b/drivers/android/binder_alloc.h
@@ -129,6 +129,7 @@ extern struct binder_buffer *binder_alloc_new_buf(struct binder_alloc *alloc,
 						  int pid);
 extern void binder_alloc_init(struct binder_alloc *alloc);
 extern int binder_alloc_shrinker_init(void);
+extern void binder_alloc_shrinker_exit(void);
 extern void binder_alloc_vma_close(struct binder_alloc *alloc);
 extern struct binder_buffer *
 binder_alloc_prepare_to_free(struct binder_alloc *alloc,
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
