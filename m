Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECCDAC0015E
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Jul 2023 10:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DXhOoqtMzWvMkhPA6+5XXMjbhhp6iWK8atOStI4d1Zo=; b=drKzAS9ZFvy8Dy
	SCK/rxd3kyanIugSpWNvmhxTvkseWzyzd1FHlSNAGaRbqecYciHHg9OEwdnqF5SEG+M1o+Z5U4I/z
	sRh+Jp3pLJrHWe2HgykwuditXFiCLR/tUNx9wLwcmgFqVE+AWZmA032fYbLidVYpwVpppQmFGSkfS
	zQMpEuireofX/qlFALiNZMTxXABVqHX4CsgFsBxPKEo6ie1Pz5N3CkcwCY/Pv1dVYymv/WsVNdqdY
	ER8ukbmcv38QXP1RKSghTe99RIrB7n5frmvGPXJIMoV8f15ProGcs7u+K7IoeaXFmM88LS1VJkgRO
	birx0k25F340asIRgK+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNtG0-003vOz-1V;
	Mon, 24 Jul 2023 10:57:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNtFz-003vOR-1X
	for linux-mtd@bombadil.infradead.org;
	Mon, 24 Jul 2023 10:57:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=CMESg6KcZ1f/x8j8WNeV/0Ezds9kYbd4Innm/bU0Ooo=; b=YsNHUaZ/VRsNkUbEovHMYx3hiM
	WO5MYzdt39P25Y2C0BLpmRPJ7tInE0y3JmHD+nUOp1pwyilyEOhOhGJ1EqmqYyG2C/ZPxQG8hk5bo
	9smAm04xSoqz63W2vo4P9ncGTx5idauBJmqOPD08chsdVmz0BKtWMetFiB063SgKQ+Uii3IjbHWw1
	LXWT/u1PnPH30PILrUycN2sAcX5HSE/oV/9BF1Plb2PcqmmShPZyXqkSS68zCQy8bzELa35NwOL7z
	fYbMhegiJvsxByeQNdTXymPSq7pZO++0C3mjlzyl2kSjwXHIublk7+xgcHlhDqJ43c3OBJS2ysKOi
	ZwpG1KCQ==;
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNsGg-002X84-1f
	for linux-mtd@lists.infradead.org;
	Mon, 24 Jul 2023 09:54:22 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1b7dfb95761so5887665ad.1
        for <linux-mtd@lists.infradead.org>; Mon, 24 Jul 2023 02:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1690192457; x=1690797257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CMESg6KcZ1f/x8j8WNeV/0Ezds9kYbd4Innm/bU0Ooo=;
        b=dwKlx1oQ8gC3FGBisAur+bDXIIsIsnjGtPcpy7zH7OHDzky5UKxSTJ05GXNV3ifxFh
         uFNY+8ub7jUvRzU2N0mzwWkyUcySnlCtwLD3JQfZApULo5o50SUYvFf7wmqQeUGg+K3w
         AqzVxAjjzV5PNtSqJauuHxoQULcgDnOjWhlM27zpLCCDDjhxzzb13/oecO1ube7S7m7P
         1safwLAq/c10jFTLUU1Xqd0TB13zkKzwSGxlgMOCVqCgGIAn0g9Om1mA4z6ti880Mese
         Evcqc6hGgzGiGoOdWdO80KWYfeQwXeXM+h1Vq8tuq+SebTbp5eEFtPf8XLS7hjdlVp+9
         zxcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690192457; x=1690797257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CMESg6KcZ1f/x8j8WNeV/0Ezds9kYbd4Innm/bU0Ooo=;
        b=dvOaDzrygc78y6kBUeZmJlotOKtiXbqkjP1/QelnlurL5ZjAjCKmfO0DFh9qqP4cRe
         ISG8hFZfq7+NB4vIH/pMIBNzqnfySXA7PWAQKcyOshKgNBQ4/pPETnDN0ztZwwiouFKz
         sMTOCnGAPD8qF+dj6jNh6nPAfPI/3w1m+3kAc0kBCAM3PCGSNeqFLjr3U+JJLjYqpB0Y
         uOsIcUGuuUeSBG5J3dAkOqerlq0Ni3Mm3YEZu7A9c+h8oucUI3TSTwND+WAzAK1spjba
         XJHDrISL6K6y1vR4W3WOrzILU9V0C8IsG8aLZlpvAVNLQoj8hQE7I9nfGVzLZ7JG5C9a
         MDvw==
X-Gm-Message-State: ABy/qLZ+edcYcdDhvyVyA97nBR+NCfKwFXYORy/glLy3w8lRV+ArEZ58
	WYlxCNYrkNogSWPVLP2dmKSXxQ==
X-Google-Smtp-Source: APBJJlGXXWR+7sUNZwfELUHGku1GBmb2Z0Up/m3d12N15W4mEcGvzf3zzmR3Y2DB2osG2hV81y8tMw==
X-Received: by 2002:a17:902:dacf:b0:1b8:9215:9163 with SMTP id q15-20020a170902dacf00b001b892159163mr12209813plx.6.1690192456927;
        Mon, 24 Jul 2023 02:54:16 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
        by smtp.gmail.com with ESMTPSA id d5-20020a170902c18500b001bb20380bf2sm8467233pld.13.2023.07.24.02.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 02:54:16 -0700 (PDT)
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
Subject: [PATCH v2 46/47] mm: shrinker: hold write lock to reparent shrinker nr_deferred
Date: Mon, 24 Jul 2023 17:43:53 +0800
Message-Id: <20230724094354.90817-47-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_105420_350065_3F152915 
X-CRM114-Status: GOOD (  10.21  )
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
index 744361afd520..90c045620fe3 100644
--- a/mm/shrinker.c
+++ b/mm/shrinker.c
@@ -303,7 +303,7 @@ void reparent_shrinker_deferred(struct mem_cgroup *memcg)
 		parent = root_mem_cgroup;
 
 	/* Prevent from concurrent shrinker_info expand */
-	down_read(&shrinker_rwsem);
+	down_write(&shrinker_rwsem);
 	for_each_node(nid) {
 		child_info = shrinker_info_protected(memcg, nid);
 		parent_info = shrinker_info_protected(parent, nid);
@@ -316,7 +316,7 @@ void reparent_shrinker_deferred(struct mem_cgroup *memcg)
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
