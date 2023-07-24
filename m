Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32D80C0015E
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Jul 2023 09:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uURbRLRCjzdcg1JLo9uMjMVcTGxyor9XtWsifF01V+A=; b=UXPbs7XvNwwpgX
	6cNtVN+Mt7P+ztJWCzx7kw0cTlxcYYtNZlvqb8Vr2t6xNIurYazre4+wE7qOjgBLc0Ap0IeMdr99v
	FM6vtYnF3cZ4E3BRACQWdn+IvrqkCy64znoOEx8u2AP4353ZsxeATSSkNhxmQjhoyXWAe/19Irfcp
	v/Mda7Si8QoCMX+wl4SP256f/kF8QhHg8LdNL+nwGodt9ZHIP3R5h31LE8ZK8m0okaGWFWdb/A/+e
	s8wJD4/N1ySIXdEDbAzitRgOcgtGwRH1iIccs/x+cWxtQHi6Gw5p7klHR5VajCs4bgbo9hr8lccyE
	gOzPS4DK3YqnixCgycag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNsB8-003TkF-0w;
	Mon, 24 Jul 2023 09:48:34 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNsB5-003TiB-03
	for linux-mtd@lists.infradead.org;
	Mon, 24 Jul 2023 09:48:32 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1b7dfb95761so5877365ad.1
        for <linux-mtd@lists.infradead.org>; Mon, 24 Jul 2023 02:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1690192110; x=1690796910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8oqpenbl7KoJJhQpMWpio5jwf7tXqseO0h4l218M5aA=;
        b=aCj2BNfrpcxtoTz1/CdONfPnB9TAYVTaqB4T4WqFv6y7Hxl9V0boEFHOTATComBNn2
         xnFJ8tDKgZzO2TH4FwPeDTaYzb9x0D/uxmdjUcwFhXWgN5824wox+O8c9U9ybGUIohlv
         M3vK6kDUgbRBz02IXlUWPuxdPW8hkxiMWgJebr95xqiqSLJbGYOLAINvEuBU6c5+0m2D
         KwQfMs1a5lB1SKCsavAJR55Sjok6of8gfoBXMKjbRTfwQ6NM1BD/3dZZP6dR7OXOKSHl
         QBl4iWtqq0OikEBOGyMzrxqP+jJMX2cWmHkmCbYCS6DP7MDoD2ilfcJavniQ/pgHFrWu
         bw9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690192110; x=1690796910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8oqpenbl7KoJJhQpMWpio5jwf7tXqseO0h4l218M5aA=;
        b=T+HoFXQNm9oZ/49Iy/shtif34HPPsZxdl1KRskumgiBh+D5OsSvg/couneb60en7Qa
         dM3bQorzdVJLNRQ+cVsrVpN1kYjrOimJucSFoZm8dzsy9WIWlEFhq3K4PnmneKM1gco/
         Qf9wEo2dZyClzA4rSAFU2xO7Q6DJCCXFJ9TPCiBfzlJMJXMWnqG8vuLHtY4Gx8UwZfP8
         Fl0ezppzId/ry7SQxXLsdExufB55zkNCbQ1mVbfJeMxsD0qHf76OBUIud9eTblw7tdz+
         8EE8W8yc/G/4wxMMrj5CwDuDSG69byE6RllSLvBJgZ7ipy5AkhEVJqpnQEuQlfuXk26B
         XWmg==
X-Gm-Message-State: ABy/qLbe4n3uICrKqWoQYkGHg7mX3q1mH+HOMR5EgvvdJdS7RrMp1uxV
	axPCsMr5PXy2Pel3HiWfcsJvCw==
X-Google-Smtp-Source: APBJJlFv5Kl04F8rp2naJTMNzHe6rYzFJJPXcSejcs04WaV/YhAbklIOobqPbsV/O0Fdd5o/IKlERw==
X-Received: by 2002:a17:902:d484:b0:1b8:a27d:f591 with SMTP id c4-20020a170902d48400b001b8a27df591mr12259746plg.5.1690192110449;
        Mon, 24 Jul 2023 02:48:30 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
        by smtp.gmail.com with ESMTPSA id d5-20020a170902c18500b001bb20380bf2sm8467233pld.13.2023.07.24.02.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 02:48:30 -0700 (PDT)
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
Subject: [PATCH v2 17/47] rcu: dynamically allocate the rcu-lazy shrinker
Date: Mon, 24 Jul 2023 17:43:24 +0800
Message-Id: <20230724094354.90817-18-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_024831_052162_7549BE72 
X-CRM114-Status: GOOD (  11.17  )
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

Use new APIs to dynamically allocate the rcu-lazy shrinker.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 kernel/rcu/tree_nocb.h | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/kernel/rcu/tree_nocb.h b/kernel/rcu/tree_nocb.h
index 43229d2b0c44..919f17561733 100644
--- a/kernel/rcu/tree_nocb.h
+++ b/kernel/rcu/tree_nocb.h
@@ -1397,12 +1397,7 @@ lazy_rcu_shrink_scan(struct shrinker *shrink, struct shrink_control *sc)
 	return count ? count : SHRINK_STOP;
 }
 
-static struct shrinker lazy_rcu_shrinker = {
-	.count_objects = lazy_rcu_shrink_count,
-	.scan_objects = lazy_rcu_shrink_scan,
-	.batch = 0,
-	.seeks = DEFAULT_SEEKS,
-};
+static struct shrinker *lazy_rcu_shrinker;
 #endif // #ifdef CONFIG_RCU_LAZY
 
 void __init rcu_init_nohz(void)
@@ -1436,8 +1431,16 @@ void __init rcu_init_nohz(void)
 		return;
 
 #ifdef CONFIG_RCU_LAZY
-	if (register_shrinker(&lazy_rcu_shrinker, "rcu-lazy"))
-		pr_err("Failed to register lazy_rcu shrinker!\n");
+	lazy_rcu_shrinker = shrinker_alloc(0, "rcu-lazy");
+	if (!lazy_rcu_shrinker) {
+		pr_err("Failed to allocate lazy_rcu shrinker!\n");
+	} else {
+		lazy_rcu_shrinker->count_objects = lazy_rcu_shrink_count;
+		lazy_rcu_shrinker->scan_objects = lazy_rcu_shrink_scan;
+		lazy_rcu_shrinker->seeks = DEFAULT_SEEKS;
+
+		shrinker_register(lazy_rcu_shrinker);
+	}
 #endif // #ifdef CONFIG_RCU_LAZY
 
 	if (!cpumask_subset(rcu_nocb_mask, cpu_possible_mask)) {
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
