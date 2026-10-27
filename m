Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3274360A2614
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Oct 2026 22:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=F2eTZAe2;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IfUyZk2f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=uQtzqTuvAR5Tocual6dWfoMWlE+NYzLRTidFu8a3PcU=; b=F2eTZAe2BeSmYgzCDdCFoXCrsK
	oWotaiqtPRAYFrmg82faWARhWH3ymS8LD+kx+DF5eFbNJjjs/C8rCs1cPbqLNptfMuYkGKI/SKxCp
	frkcStEftjRKys0vCyCvyp1cpJL1n5SwswmEy8SYbDjO2kOpbKQ8Lq4jhs1jJLQYIJ25ScxSdY0h6
	JxEIcYIQ9FVXaY//sBEN//A0wJF/v0uKyg1HmEVawd/d3TLeiEKVUm2BaHVRznD63L8Co3S5c2Pv5
	T69hmZ4f9E8IholT5RsEoZ7ZsHLAajctK+/bz/NVKhoSTW0owsu6f0J6RJ1XkFcFQaPxiX1Onw5ZZ
	lE1pgB3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLppF-00000005r4z-3nAn;
	Tue, 27 Oct 2026 22:39:25 +0000
Received: from mail-dy1-x1346.google.com ([2607:f8b0:4864:20::1346])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLppD-00000005r2R-32lX
	for linux-mtd@lists.infradead.org;
	Tue, 27 Oct 2026 22:39:24 +0000
Received: by mail-dy1-x1346.google.com with SMTP id 5a478bee46e88-30c0d568830so607970eec.1
        for <linux-mtd@lists.infradead.org>; Tue, 27 Oct 2026 15:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793140762; x=1793745562; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JWqYb4bGeUKpshpA/YjhKSWXxaEK2QVlfhqplD6YlhY=;
        b=IfUyZk2f6MnRVqOG+ImrIsQ0dYPDucLWr4gIMwVSUztPvwwZNVqvh3rw6FIikzHuxC
         K1AwlvQSXqzdrPz3iJNk0aTGhsWQnZUNrRzi/QFxrly2SEMvJSfeA0CV1G1+glR5tZVw
         ZTOu1p29OyHespRKJOuwB3dCK768lXVwQ71o1p9xlAY6RvRmQBWMsL5hD6txHqhrDfgi
         L+7zLhwgaz8tb5pw4XRx5FD5wzfLLZQsD1F1aLD7/LLYnuaKOJ7EciOL+6AvZr/+oaB3
         6mOHRhZAXfIbjuhvzS54bZz1CuXA54JflqJ93SbESmqV3tMdDRLXhWLhY3AiiCnjoiRV
         tqiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793140762; x=1793745562;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JWqYb4bGeUKpshpA/YjhKSWXxaEK2QVlfhqplD6YlhY=;
        b=XSR4UGk8uLsR/DMifftKk+TXD6dqV4P64vrHljxZLcrkyUA/chgcnNEIb7v5bDxAp8
         1UVidtQJG1BGjZ/bL+4ZMo4jYPuzpiBIvT9tEvXhVa6FM6UICT39cX0mHC6o6GW+WE12
         2SlA3M1fXzlm61yPjuAia4+Jk8qKScyNtm4bNOMtxMSqyFe2K0tAgyG7BZVdNiPM+mEQ
         YfRLKjhD0IX91TiU2+EagSjyUUnNPqPnvbGqA0lvz9xdyd3X9BNsM8Jr7o3OV1h9fw3r
         JZn351trvct0LZ1/iU52Jkj/vbnvDChrp3hsPc8MYLuNUHp0DNyji7mLkWIslFZ9uDb6
         AEzQ==
X-Forwarded-Encrypted: i=1; AKwUvBzJ5B7Oj9Sly5GhD9/8Rb+sjTgU+3Cnf861h8YTNW9RO0/WffCFxNbfQx25DxTSVJZqNmThYv9Zz0E=@lists.infradead.org
X-Gm-Message-State: AFq9FYJXHcGqJiW/yl+XbvfKV8apPEqnFQuK8cEnEbeZQsAdWPM/f+1U
	wuIMUa+1CP1PBEoCHuVcFqSwYcYGNbC9WNNgHLZ4TWhrkelGjZTfxOu5qqpoVVzkPfwwExoGILo
	Cu71O78D86A==
X-Received: from dycna3.prod.google.com ([2002:a05:7300:ea83:b0:36a:1b4f:e8f9])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:e9c8:10b0:365:d42a:f415
 with SMTP id 5a478bee46e88-36a2036d4d1mr1220304eec.12.1793140761297; Tue, 27
 Oct 2026 15:39:21 -0700 (PDT)
Date: Tue, 27 Oct 2026 15:38:39 -0700
In-Reply-To: <20261027223847.652884-1-irogers@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261027223847.652884-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.313.g2479322e68-goog
Message-ID: <20261027223847.652884-5-irogers@google.com>
Subject: [PATCH v2 4/9] cpufreq: governor: Initialize kobj_type release
 callback statically
From: Ian Rogers <irogers@google.com>
To: Kees Cook <kees@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, Zhihao Cheng <chengzhihao1@huawei.com>, 
	Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>, Sumanth Korikkar <sumanthk@linux.ibm.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, driver-core@lists.linux.dev, 
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-pm@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, 
	linux-s390@vger.kernel.org, gfs2@lists.linux.dev, 
	xen-devel@lists.xenproject.org, linux-mtd@lists.infradead.org, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Ian Rogers <irogers@google.com>, 
	Viresh Kumar <viresh.kumar@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_153923_837042_C37038E1 
X-CRM114-Status: GOOD (  13.72  )
X-Spam-Score: -9.5 (---------)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Export cpufreq_dbs_data_release() and set .kobj_type.release statically
in the ondemand and conservative governors so their gov_attr_set
kobjects have a valid release callback statically initialized, matching
cpufreq_governor_dbs. Remove the redundant runtime assignment in
cpufreq_dbs_governor_init().

This prepares for annotating struct kobj_type::release with
__must_init.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/cpufreq/cpufreq_conservative.c | 5 ++++-
 drivers/cpufreq/cpufreq_governor.c     | 4 ++--
 drivers/cpufreq/cpufreq_governor.h     | 1 +
 drivers/cpufreq/cpufreq_ondemand.c     | 5 ++++-
 4 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/cpufreq/cpufreq_conservative.c b/drivers/cpufreq/cpufreq_conservative.c
index 02bfd46543e9..146a2353b1a2 100644
--- a/drivers/cpufreq/cpufreq_conservative.c
+++ b/drivers/cpufreq/cpufreq_conservative.c
@@ -318,7 +318,10 @@ static void cs_limits(struct cpufreq_policy *policy)
 
 static struct dbs_governor cs_governor = {
 	.gov = CPUFREQ_DBS_GOVERNOR_INITIALIZER("conservative"),
-	.kobj_type = { .default_groups = cs_groups },
+	.kobj_type = {
+		.release = cpufreq_dbs_data_release,
+		.default_groups = cs_groups,
+	},
 	.gov_dbs_update = cs_dbs_update,
 	.alloc = cs_alloc,
 	.free = cs_free,
diff --git a/drivers/cpufreq/cpufreq_governor.c b/drivers/cpufreq/cpufreq_governor.c
index f3bd3dbe7c41..f8b5aca09b6b 100644
--- a/drivers/cpufreq/cpufreq_governor.c
+++ b/drivers/cpufreq/cpufreq_governor.c
@@ -419,7 +419,7 @@ static void free_policy_dbs_info(struct policy_dbs_info *policy_dbs,
 	gov->free(policy_dbs);
 }
 
-static void cpufreq_dbs_data_release(struct kobject *kobj)
+void cpufreq_dbs_data_release(struct kobject *kobj)
 {
 	struct dbs_data *dbs_data = to_dbs_data(to_gov_attr_set(kobj));
 	struct dbs_governor *gov = dbs_data->gov;
@@ -427,6 +427,7 @@ static void cpufreq_dbs_data_release(struct kobject *kobj)
 	gov->exit(dbs_data);
 	kfree(dbs_data);
 }
+EXPORT_SYMBOL_GPL(cpufreq_dbs_data_release);
 
 int cpufreq_dbs_governor_init(struct cpufreq_policy *policy)
 {
@@ -488,7 +489,6 @@ int cpufreq_dbs_governor_init(struct cpufreq_policy *policy)
 	policy->governor_data = policy_dbs;
 
 	gov->kobj_type.sysfs_ops = &governor_sysfs_ops;
-	gov->kobj_type.release = cpufreq_dbs_data_release;
 	ret = kobject_init_and_add(&dbs_data->attr_set.kobj, &gov->kobj_type,
 				   get_governor_parent_kobj(policy),
 				   "%s", gov->gov.name);
diff --git a/drivers/cpufreq/cpufreq_governor.h b/drivers/cpufreq/cpufreq_governor.h
index 806d8fb4dff1..1026712bb79b 100644
--- a/drivers/cpufreq/cpufreq_governor.h
+++ b/drivers/cpufreq/cpufreq_governor.h
@@ -150,6 +150,7 @@ static inline struct dbs_governor *dbs_governor_of(struct cpufreq_policy *policy
 }
 
 /* Governor callback routines */
+void cpufreq_dbs_data_release(struct kobject *kobj);
 int cpufreq_dbs_governor_init(struct cpufreq_policy *policy);
 void cpufreq_dbs_governor_exit(struct cpufreq_policy *policy);
 int cpufreq_dbs_governor_start(struct cpufreq_policy *policy);
diff --git a/drivers/cpufreq/cpufreq_ondemand.c b/drivers/cpufreq/cpufreq_ondemand.c
index 9942dbb38dae..7386d043c665 100644
--- a/drivers/cpufreq/cpufreq_ondemand.c
+++ b/drivers/cpufreq/cpufreq_ondemand.c
@@ -374,7 +374,10 @@ static struct od_ops od_ops = {
 
 static struct dbs_governor od_dbs_gov = {
 	.gov = CPUFREQ_DBS_GOVERNOR_INITIALIZER("ondemand"),
-	.kobj_type = { .default_groups = od_groups },
+	.kobj_type = {
+		.release = cpufreq_dbs_data_release,
+		.default_groups = od_groups,
+	},
 	.gov_dbs_update = od_dbs_update,
 	.alloc = od_alloc,
 	.free = od_free,
-- 
2.56.0.313.g2479322e68-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
