Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98E5EC001DB
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Aug 2023 11:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OZnsPJ59kOOD8XENh3BvRwDGO8GT2o+bebEREpEPFPs=; b=LNMjKhgrCh7aFv
	kiNAlsUmlRb2NTnJ/t/sfaJe07XwSl6C/OUzUHW7jufUnrsrWp/Ps0FvRZ3QCWDkkrOYRuPgpg7GN
	DnPPlYNiuIddumIYQfj8/Sr77hH26Ssfr8oRtymDnVNCOZrPi9Pwz6mezcyApeIw3Li4sNCblgyYm
	WlZkaSIRYc2k1aQ+bChtMA2pO+PNJir2JVzm9b5RRGLbN7PIIO/vowdlNbdyvs1kbSrJXpLKtaQNq
	7CRuMakydnZq3kNgR/1Te7NdfKbCqm1wwj9z0q+Ws+9eIKraop73UQtrELpcetkDUQ+SQwLf/SBTU
	Bj2L1wkeoOkbQPZs+5og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSyHO-00H3mx-25;
	Mon, 07 Aug 2023 11:20:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qSyHN-00H3ls-1b
	for linux-mtd@bombadil.infradead.org;
	Mon, 07 Aug 2023 11:20:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=X5ij/O+E/bk/tTzX9mgxwiCynzBHcXx4EKtI9EsHayo=; b=GhXSvVnVRTWsy1+l4PVnvQUzHk
	0ZMIY2LEwzptnv70MF7oasTn6r2pHzBMFzJXp59SKgQ6cu4jkmE2vqeIUToHOubAYZ2+AQgtDS5kh
	zKU+bLETFbgv+2Bc+lEpC6fnVoOoi+i5pB7sdOFySCMR0yMRx/f6vIhCvrVcq0eFC4XUAUk0CkE/D
	Akkpj7Chju4osnR9Qo1CrjCQP3oweNqrShtagC5lZaBxGo/Lf7mY015QlgkTcceuNV6e+/d/7rc+M
	cGXRdmgejFAJ6RjHvCa141Qd3ZD6x55IPSnZHRzxDXtwTniO05tdooJC6KuF2scBfe9l7z+OokTdC
	xFTmCS8w==;
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qSyHJ-003lwx-2s
	for linux-mtd@lists.infradead.org;
	Mon, 07 Aug 2023 11:20:04 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-26890669c8eso933008a91.1
        for <linux-mtd@lists.infradead.org>; Mon, 07 Aug 2023 04:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1691407200; x=1692012000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X5ij/O+E/bk/tTzX9mgxwiCynzBHcXx4EKtI9EsHayo=;
        b=i3OLYIqgHrVEAaoeqhN7xu/7U1C+reDkv4O93uYT3wVXPD8PclsjVNwGlC6uACGJON
         5G7yHqhhbIuKFoghA6ZSicHcXMJKMfCogQ8szn+vWtZn4EOKB8vbAdIc7rpijTp0cbxa
         Z/AamO41rUovV3Rd5mToLS3fdUn/gIbndWW5fXdkD//uV9WpRp/5E2yE1kJcYdxc2q43
         2kKg85HGCsKzT23sBdglbe/LKtHC4WUeFtaNvdRNowxvHAXGs/cRyz4+kFuB/ka63yH8
         5vv+ldmlZuknYjC0UrMsohE+IjtZuT+2tIf1cSRO1giyAMKM5zLXRshImNoV+3DwaEWW
         qy8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691407200; x=1692012000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X5ij/O+E/bk/tTzX9mgxwiCynzBHcXx4EKtI9EsHayo=;
        b=lkbBH1IX9ZajtqdEnz7kjCxOTOYhOpjq7ARkkadJTuEBWlZPLG88qtXBG+1mmlqIUN
         ZpTqQJLVsZ0/8Bwk+r4lYeitw7PXRDws420BifqzPAngTgDuAGz6gM1OZpxU/cAzr+9K
         9sKgpSWbNpAVsUSTyoj/lalWOHuGab8TPUVDQmoRaaaC9Cbrgy6WmMOKvXZsYd27euFJ
         31KIH97PKPUO3XbdgSDpKS3p5UsjrYLEL9Rl6DbdcOHvV4D0OTbK2AHV7Qzkfa6I3Mk9
         bV51WuOQnGe4r9vcV0JpHWlJEdKERoFQ3lhnflKa0uiaxV47XwDb5NF3Z+Q411wYF//V
         +JPA==
X-Gm-Message-State: AOJu0YyNPqi58KP4mhmfDAIrYK2gpdjS6HqY0HA4dUEXfqT5dvnZSvL1
	ruMslG+op8GUZaeeHKHHZsxlHg==
X-Google-Smtp-Source: AGHT+IH1iUQIXRu8fJbzxUHSh+kWmc44BJdJFh0ZxZy41KSEiq7lusFAb/6JfkXEPdg45Q03TKbByg==
X-Received: by 2002:a17:90a:9c3:b0:269:41cf:7212 with SMTP id 61-20020a17090a09c300b0026941cf7212mr4973775pjo.4.1691407200010;
        Mon, 07 Aug 2023 04:20:00 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.146])
        by smtp.gmail.com with ESMTPSA id y13-20020a17090aca8d00b0025be7b69d73sm5861191pjt.12.2023.08.07.04.19.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 04:19:59 -0700 (PDT)
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
Subject: [PATCH v4 47/48] mm: shrinker: hold write lock to reparent shrinker nr_deferred
Date: Mon,  7 Aug 2023 19:09:35 +0800
Message-Id: <20230807110936.21819-48-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230807110936.21819-1-zhengqi.arch@bytedance.com>
References: <20230807110936.21819-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_122002_558918_659F281B 
X-CRM114-Status: UNSURE (   9.63  )
X-CRM114-Notice: Please train this message.
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

For now, reparent_shrinker_deferred() is the only holder of read lock of
shrinker_rwsem. And it already holds the global cgroup_mutex, so it will
not be called in parallel.

Therefore, in order to convert shrinker_rwsem to shrinker_mutex later,
here we change to hold the write lock of shrinker_rwsem to reparent.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 mm/shrinker.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/shrinker.c b/mm/shrinker.c
index fee6f62904fb..a12dede5d21f 100644
--- a/mm/shrinker.c
+++ b/mm/shrinker.c
@@ -299,7 +299,7 @@ void reparent_shrinker_deferred(struct mem_cgroup *memcg)
 		parent = root_mem_cgroup;
 
 	/* Prevent from concurrent shrinker_info expand */
-	down_read(&shrinker_rwsem);
+	down_write(&shrinker_rwsem);
 	for_each_node(nid) {
 		child_info = shrinker_info_protected(memcg, nid);
 		parent_info = shrinker_info_protected(parent, nid);
@@ -312,7 +312,7 @@ void reparent_shrinker_deferred(struct mem_cgroup *memcg)
 			}
 		}
 	}
-	up_read(&shrinker_rwsem);
+	up_write(&shrinker_rwsem);
 }
 #else
 static int shrinker_memcg_alloc(struct shrinker *shrinker)
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
