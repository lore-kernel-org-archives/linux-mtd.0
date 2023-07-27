Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7379C0015E
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jul 2023 08:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wlFjaRxEzuZtjJZemneFznCdlgqehMN4K9r+a6jM51Q=; b=G2ANYNMwK6nuF6
	hfRjkefRnCg6devLtod3r2jzaib2dSLwyEVhhbNrErglfmvH2mZlkfQQUAM88nGRu2ausjRae+Q+a
	ukGcnG5CcaAoIBr4+CogfrE9ILyCzEQh17wmGouiEXaarDucjHzLquP2qM2OKk0EkVEhGMdo6PB6e
	AptDLA+nRGeU2FcWCjZqhyUlrYFmIhKlTpXQD+YrqRKzl+yjkUHJqIfrNDIDLFBWV7EMrSbW+I4rm
	hVSMZk2jBirKaBY7RXM4j9RwJC4acPvfnFGLfzDT1ux7bEEkqoGY66n+M1aIS60ThQaR9Qg7bmpjR
	qFjM8SOZ6hipqdu8j9MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOw4j-00Cb9h-1j;
	Thu, 27 Jul 2023 08:10:21 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOw4f-00Cb7N-2b
	for linux-mtd@lists.infradead.org;
	Thu, 27 Jul 2023 08:10:19 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-686f74a8992so77849b3a.1
        for <linux-mtd@lists.infradead.org>; Thu, 27 Jul 2023 01:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1690445417; x=1691050217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PYuXWIGRd3SDQUNwBNnDU/RFUGkEJd0z6ud/pRWhp58=;
        b=T9ifvBS7grSXMXHZ+aFeKzum6pF3H2DhLFdohTJRx7vF7szcBG6tJ5VPINqCVu3pCX
         FmubTvt88b5ysMWaYtFibatbXMnoo6Jib8lbo65gbMoj4iY6HbdoFrEeXgYSqYC9Jqe0
         PGHsLAS4RpAPQjTV72r0GtDUpuZ/ybvTZ9EZC90EXosh65ardfAALzeVYgFduHUdYxNh
         uE3GuwKiv2CyHXolQ3XZqpbE7oSyCW4E0iZzkXVJZoTlkXjievgPAGhg1+Kv8s/E0hIi
         dyIaavdNWwWhQNwuCKJwqWG502/DMJOkmwjObTrka2ckcmNrtUCmvsEGY2FZ9fmQFWZZ
         aE4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690445417; x=1691050217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PYuXWIGRd3SDQUNwBNnDU/RFUGkEJd0z6ud/pRWhp58=;
        b=A+koSUc7Suy0G/OdJPpHvMU8R7SWda2TM1/FIXjwzm3UQWDXO2itevtpuW6s5dDlJH
         LXxuIDpQWkPZaoO3usk3FqQ9TUcO6k3i+t31SBBiydp7JM3RDq3EPuru/l3W3fe5Su8k
         gFtWIk6at0rDq0W5ZEKZ9BiVNgsuGn4NPQONA+Ko95GyAZLCvMjKro4Ppjxjt+OoM+FN
         q00gnwUkYkuC1YtI/whPRDC7cdN1PHGm/czKyXSaTwT7Xj9KnPPEpBreBYIkDKMU5jYd
         GIATqG06867GLfCvQd4C4F1ftOBhmdUNtZXWRuRYUN7OO/Zee6SRe4HuzkjIUQ3LpVYS
         SMvg==
X-Gm-Message-State: ABy/qLYEuGpQC/E24McOQvdqEdbxeixitwAYKqN4eaOjo6JsCcoo4mJW
	pI1z+BTO3pmUMa2jdRJex/fGqQ==
X-Google-Smtp-Source: APBJJlFP1iLC566NPrkWwKL0iKI9L1P+4s+IlmNKaBmXVe5HE8WAAvDQ5uBELCFt4/l7YPuEeyQdfQ==
X-Received: by 2002:a05:6a21:7882:b0:123:3ec2:360d with SMTP id bf2-20020a056a21788200b001233ec2360dmr5970181pzc.5.1690445417252;
        Thu, 27 Jul 2023 01:10:17 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
        by smtp.gmail.com with ESMTPSA id j8-20020aa78d08000000b006828e49c04csm885872pfe.75.2023.07.27.01.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 01:10:16 -0700 (PDT)
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
Subject: [PATCH v3 22/49] sunrpc: dynamically allocate the sunrpc_cred shrinker
Date: Thu, 27 Jul 2023 16:04:35 +0800
Message-Id: <20230727080502.77895-23-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
References: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_011017_843365_02AB0B96 
X-CRM114-Status: GOOD (  11.81  )
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
Reviewed-by: Muchun Song <songmuchun@bytedance.com>
---
 net/sunrpc/auth.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/net/sunrpc/auth.c b/net/sunrpc/auth.c
index 2f16f9d17966..6b898b1be6f5 100644
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
+	shrinker_free(rpc_cred_shrinker);
 }
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
