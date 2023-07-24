Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0871C001E0
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Jul 2023 09:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B/823kjkdh6hcLl/1Q4Sn3nEXVozx7Op+r1uQATZxMA=; b=Jt/OUVGyopusr0
	Zs7DfaaV3zqi8ZJKB7D8hRL317dMFLD5Jkvm6vXCIPgwYWZ2YS6059+56UXzuZ8CRkT0Z/4sBX+EL
	I2LZlGk0ZwK8HjjOim/5Ftwcgv/1eUg1Y/mMBq99NXvrx+1xTnbiEX9NlhZ6ZvAQ6w8qD8D65RBF9
	8xNnKMo/bi1gOd9/q1QUvyPgTw34ty72rSLz+fa0pQ5I/+cDdFFvygoAjrT2+HnNlBp8ytAmH/J3X
	+dagCtqecXBu2btbRzzC579Pxdb9wPzi/vPlJMYoPR1rFcCZupG+37KBMFBYKK4UdF4kgDwEjY98M
	eh24x/cSFXvzjXaXSkVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNsBi-003U9V-1t;
	Mon, 24 Jul 2023 09:49:10 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNsBf-003U7D-1F
	for linux-mtd@lists.infradead.org;
	Mon, 24 Jul 2023 09:49:08 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1b867f9198dso8898585ad.0
        for <linux-mtd@lists.infradead.org>; Mon, 24 Jul 2023 02:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1690192147; x=1690796947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3CXd5cxT7BQDd98tt8oaC0MvbTuhoGV4WCiM7GrnKVE=;
        b=KQjtvrM5WCun+a4xOj456S6UuqGIkvzyD2jHH3TR9iY9a97Nt32MSSfeCXCmbM81Y3
         7CR481sQUeyCzPya4qTSPUgO2X/EhgaM7LuUX3zxeHldHQRKH0RrsI+JkYmanpIzppK4
         +abROecNMX11crshq9sHFZamNywEwoxtK8Vecu9T/ezkwCibUb1czEw6+JIKkmPyPcQg
         1hoEKHuQR39hivSCYtyLe70icTB0k15MuRyTV7pjq8M21zBZSftgM/Uwfo8RV8+TAK3Y
         pOSIhBz1N9cqbqrOLeJG0Mkh/NqdVj/Db67KzjXs12zF9HPMwZax5Fae+E8V7mgE4uk/
         /g5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690192147; x=1690796947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3CXd5cxT7BQDd98tt8oaC0MvbTuhoGV4WCiM7GrnKVE=;
        b=BdKrB1z+iizynJMJXRfWgE9rcMSliOFxPvUClw9Tqo8klF9Qu3vX/CES6VHzdgsW70
         EPPySQ4rAfao3+ZDlcXkXAtBY6G1aYWWknU2qkkew/ngDA7Qdz6RVNvHf7wMwo/ZgXgP
         Gtehx/WKY64yLrjRmrfbSE/aAMOs64+/dgEI1hYNDsjEHpLE0Rs/LvowV+/XF4vKsPfT
         sndLjp+Z8GpN2M4tuogNv9vSx9sZWgYGUZS0G5S6fovwo6Pmj7dF8cFgZxK8hXP/CkNz
         c8BOFm38dnZxmqC73nOW8oBOtWdYrR7C/CI6rr9+vf+1uKGvlOyeU1HeW4mX5hvTZg2M
         eCEQ==
X-Gm-Message-State: ABy/qLbmb1U3C5XVHydOB5JcjZL9CA/hG6Xiw0Mbi/jc90rr1Tr+lIjb
	ic/vwXmgL07oGdwJHQNeYrmKCA==
X-Google-Smtp-Source: APBJJlGIkgxKi3c8vlsRfvF8eC2AUaCtjB+PIQLMdMMArsufsHEWiltHfQyyqXBdYUy9SpebX4CtOg==
X-Received: by 2002:a17:902:e80a:b0:1b8:50a9:6874 with SMTP id u10-20020a170902e80a00b001b850a96874mr12324079plg.5.1690192146760;
        Mon, 24 Jul 2023 02:49:06 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
        by smtp.gmail.com with ESMTPSA id d5-20020a170902c18500b001bb20380bf2sm8467233pld.13.2023.07.24.02.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 02:49:06 -0700 (PDT)
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
Subject: [PATCH v2 20/47] sunrpc: dynamically allocate the sunrpc_cred shrinker
Date: Mon, 24 Jul 2023 17:43:27 +0800
Message-Id: <20230724094354.90817-21-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_024907_421381_B7256039 
X-CRM114-Status: GOOD (  11.92  )
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

Use new APIs to dynamically allocate the sunrpc_cred shrinker.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 net/sunrpc/auth.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/net/sunrpc/auth.c b/net/sunrpc/auth.c
index 2f16f9d17966..74e40c8a512d 100644
--- a/net/sunrpc/auth.c
+++ b/net/sunrpc/auth.c
@@ -861,11 +861,7 @@ rpcauth_uptodatecred(struct rpc_task *task)
 		test_bit(RPCAUTH_CRED_UPTODATE, &cred->cr_flags) != 0;
 }
 
-static struct shrinker rpc_cred_shrinker = {
-	.count_objects = rpcauth_cache_shrink_count,
-	.scan_objects = rpcauth_cache_shrink_scan,
-	.seeks = DEFAULT_SEEKS,
-};
+static struct shrinker *rpc_cred_shrinker;
 
 int __init rpcauth_init_module(void)
 {
@@ -874,9 +870,16 @@ int __init rpcauth_init_module(void)
 	err = rpc_init_authunix();
 	if (err < 0)
 		goto out1;
-	err = register_shrinker(&rpc_cred_shrinker, "sunrpc_cred");
-	if (err < 0)
+	rpc_cred_shrinker = shrinker_alloc(0, "sunrpc_cred");
+	if (!rpc_cred_shrinker)
 		goto out2;
+
+	rpc_cred_shrinker->count_objects = rpcauth_cache_shrink_count;
+	rpc_cred_shrinker->scan_objects = rpcauth_cache_shrink_scan;
+	rpc_cred_shrinker->seeks = DEFAULT_SEEKS;
+
+	shrinker_register(rpc_cred_shrinker);
+
 	return 0;
 out2:
 	rpc_destroy_authunix();
@@ -887,5 +890,5 @@ int __init rpcauth_init_module(void)
 void rpcauth_remove_module(void)
 {
 	rpc_destroy_authunix();
-	unregister_shrinker(&rpc_cred_shrinker);
+	shrinker_unregister(rpc_cred_shrinker);
 }
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
