Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C310C0015E
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Jul 2023 09:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l0jnEbUyQ5J+SnZkORUsoO8W5V0GfEHm4ATnwF2cqaI=; b=yxXcHizZTB7yjP
	QWgkePy95AEPbgNeffxQdaq8CfiJZ2nx9DTjk8Pp1m97JqAQXYiqymdXc+d1TRXkcN0U+JEy8RLd3
	D8q+sbTTbHJEXeT7HcKLUc0bYQcQVtXljDLRdRn0RdpZ2gSNXOjq58bWk71e35rmt8W9j9v4XJWY6
	oV34O0TeLbsGYW64I4mfJ+qybssR6Wegz4HQFmWpOEPvfXhmsjb4B1vOSGY2+ZjDPGYCf+QryFCsK
	53JOH4dosJxYQFzSmheVQVDbuVwZojltB191qt/W470oFqchxXPyjYE+3ZlmFUpsjdmSWatPd9+Ry
	XcEhpEiO/ZMX3Eti2xuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNs9B-003SMW-2i;
	Mon, 24 Jul 2023 09:46:33 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNs99-003SKO-09
	for linux-mtd@lists.infradead.org;
	Mon, 24 Jul 2023 09:46:32 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1b867f9198dso8894655ad.0
        for <linux-mtd@lists.infradead.org>; Mon, 24 Jul 2023 02:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1690191990; x=1690796790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TtWMuwNQICElQwN/uI+F3WL3CTikAs+Dtp5goHq/uX4=;
        b=I+UdRoo7PtFa/HFb9ptM84BLJk51Oz8G0P2vA9d94Wc/XjfftjzLyxRBwA01anb/sX
         9mresCrzzrrBEvcw02T2JRUzwmE2N5g0vsbRd5C+EoXN25pNGYeZ6g16/FMxa3H5VNDH
         6ji0rzPXwUbXzJbwXvPiq1FHNNE8ocU8HPGADHiXDhNHZabYES9ASLXofIUnLzuIXCW+
         kwLOx4qHBhz6RtbAZxDD88fTSzK7LENJJOn1r+bRhOQmNpcKYfm1Yk1Egb7OAZu9liNf
         8Q2C/an05GdrxKmh9WrMTyMLOPzFeZw3WZtFR0oz9alHcEF4Djwn7mAV20C2gc5TCLWm
         V2MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690191990; x=1690796790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TtWMuwNQICElQwN/uI+F3WL3CTikAs+Dtp5goHq/uX4=;
        b=A1gZZJjiP6/hW+McruhfBFgHqQ36WxDyF+IVVZdR/4piOiCbkrfgdgZuUTLaD/O+uY
         t6bGy2iaEKGO7htpsLK1rLf3+KoG+sp+BlS641DcGcY4okuC9nednDJLD6o2rXRZ8jTW
         jX2znQHDxe0Vdt7s23nMKGSYNQcVY1HPhEjF5a4DSdCiof2zzgSHzuS9QQzmD7eCIhxH
         wumAd554Kvnus+PgJl56I8n0sPXU/MP6eRn/63s5ZDDaiIiWwJYYiMg+tTfVJ20J4Mkf
         //3PT9KvpnLwkr91xGZPTDImEOkbmne4v9epX5umVFQCahLmAnHbApeJi34QaNCc0AVf
         5T/A==
X-Gm-Message-State: ABy/qLaDrTE4HTYU51YLxmAAKRjaZy7vRjqFs0ZSBZMrrLmPhXvW1o9C
	Nk4vldQlLvBFRF8ddBzt+2LzgQ==
X-Google-Smtp-Source: APBJJlE4z/oQr/nYJvsLLx4ZH1UH5CYL5idBHg9QqjGajgFE/t5dphI4tPFsRKn6N/RjSu5tdTiopA==
X-Received: by 2002:a17:902:ecd2:b0:1b8:b4f6:1327 with SMTP id a18-20020a170902ecd200b001b8b4f61327mr12289687plh.6.1690191990533;
        Mon, 24 Jul 2023 02:46:30 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
        by smtp.gmail.com with ESMTPSA id d5-20020a170902c18500b001bb20380bf2sm8467233pld.13.2023.07.24.02.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 02:46:30 -0700 (PDT)
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
Subject: [PATCH v2 07/47] xenbus/backend: dynamically allocate the xen-backend shrinker
Date: Mon, 24 Jul 2023 17:43:14 +0800
Message-Id: <20230724094354.90817-8-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_024631_082129_6C37D280 
X-CRM114-Status: GOOD (  12.07  )
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

Use new APIs to dynamically allocate the xen-backend shrinker.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 drivers/xen/xenbus/xenbus_probe_backend.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/xen/xenbus/xenbus_probe_backend.c b/drivers/xen/xenbus/xenbus_probe_backend.c
index da96c260e26b..b4c3cf27af30 100644
--- a/drivers/xen/xenbus/xenbus_probe_backend.c
+++ b/drivers/xen/xenbus/xenbus_probe_backend.c
@@ -284,10 +284,7 @@ static unsigned long backend_shrink_memory_count(struct shrinker *shrinker,
 	return 0;
 }
 
-static struct shrinker backend_memory_shrinker = {
-	.count_objects = backend_shrink_memory_count,
-	.seeks = DEFAULT_SEEKS,
-};
+static struct shrinker *backend_memory_shrinker;
 
 static int __init xenbus_probe_backend_init(void)
 {
@@ -305,8 +302,16 @@ static int __init xenbus_probe_backend_init(void)
 
 	register_xenstore_notifier(&xenstore_notifier);
 
-	if (register_shrinker(&backend_memory_shrinker, "xen-backend"))
-		pr_warn("shrinker registration failed\n");
+	backend_memory_shrinker = shrinker_alloc(0, "xen-backend");
+	if (!backend_memory_shrinker) {
+		pr_warn("shrinker allocation failed\n");
+		return 0;
+	}
+
+	backend_memory_shrinker->count_objects = backend_shrink_memory_count;
+	backend_memory_shrinker->seeks = DEFAULT_SEEKS;
+
+	shrinker_register(backend_memory_shrinker);
 
 	return 0;
 }
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
