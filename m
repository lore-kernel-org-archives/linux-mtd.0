Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF985606A330
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Nov 2026 22:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Oi1d63Ma;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IHbrwf8u
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=yI0b3nxPb8cIrSm8y27Ax6yePtzVxhj8WC/AiV5JXYc=; b=Oi1d63MaUt6zUBhxzy6oQMMIHp
	HXh49FKJBlFuYyQ0CEr0beHQATDlJ+u0o23LBwhyErC2a1zb+bGXaJ9BlD2OqcBl6PyTt+0wn33QF
	Mt4YQS6cr88+ARH3V5hQziarZstr0H0GKP6LwRopfjPdvMwAuuGzE7x/e/+YP8pPY8ZKZCZbCHaGO
	ebaQ+xe1pfWaqhPmuOLwgesB1hURfjKd9DDa2V4mcJLvqTxIl4sn25ij7pXzgUqKxckFce/guDm8i
	CNbYuctk0GzKRBCd9VYMWm+VuIDbreXEFHLU1M8NBzCvbVkLLMjtz97wpcRBnsxFmPxOWQBUhWyg7
	u5SNMEvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQBYG-0000000Gq2V-2nbg;
	Sun, 08 Nov 2026 22:39:52 +0000
Received: from mail-dl1-x1245.google.com ([2607:f8b0:4864:20::1245])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQBYD-0000000Gpyt-4Bvw
	for linux-mtd@lists.infradead.org;
	Sun, 08 Nov 2026 22:39:51 +0000
Received: by mail-dl1-x1245.google.com with SMTP id a92af1059eb24-1b25dc2aa8bso798008c88.1
        for <linux-mtd@lists.infradead.org>; Sun, 08 Nov 2026 14:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794177589; x=1794782389; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JYLCMT9RKWWGiMVjfcLUv6CQmbQfnx4zZhBsCcC3dY4=;
        b=IHbrwf8uj+o10Jrx7kPg1+2KSlmjHV08BN3C92NVj7qv97CgjEq0BQeARKGA6A3tj+
         dS7yVVdDAt+klUztv0kP+dYQ6fO6WdRQaHnYtJOye5Mkz0YoFCaAJHzd+9XSxugbg2uS
         I8aFBWzx9FOOkN83lmWQ4cedDxqyr1RNksiBzUEjE703UlGlDPuy5Yeyjs63sy6Jg3T2
         XIyRziumRV3zM3U+FECUmcHYtA/xI2qzw+46LW+NpII3HNFheQRPL/g781RdM4JIHuul
         n7oC20EfdJ7vCq1hwVzTsY6w60sWotOFHEECU560jQIGJWebeVaaCHtXX5Gt5L+LnB52
         jP4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794177589; x=1794782389;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JYLCMT9RKWWGiMVjfcLUv6CQmbQfnx4zZhBsCcC3dY4=;
        b=d5qUgXRXsLZZUuRn3h6JW/RLNwb7nFC9Qo7SS6QlOkioc5InFwFIWkX/ULr3Rqq2mv
         VDHXjg5AuKh328VgWC6SlmC6qtkn7lks+pF1OMKKZDPWStcAvBuk+Qd76AFUb3dmkNLH
         LMo+HfKJK4iCJAqTr90R43U3Ei2xDBydNrSVizDr9AiEYGJswRxiNaG9J4gK2wQXVGSc
         eNnZ0+U0zKqfVY14RU1oCFM7GUuJUjZrLVQnS3cPqzf/8ZJeL+HMkf5ojAZTU3FY5bZc
         m6SdipSc4w581wxCE3AI2YaIFsbMpqsUPmR5r4XR4PRRyI20qferHsSYxv3jcT3ZE7wi
         YFTA==
X-Forwarded-Encrypted: i=1; AL+hErFHca30bOxHb2tzzMLu5cgq3EmM2n66c/cUG1w8b5WabIWFsMC1JET0G8JCGfakM8Rw0ly9aQ4OtP0=@lists.infradead.org
X-Gm-Message-State: APuU4Z/gIseMDuMUSPh/fN3NAUcDlabnou61CFMOC8iP2g+8s4b+y4vY
	/UsWvmyNy9ogtYXAbkipxjTUrPDPJRo3HpC+h2bBcGnjn8Toyb/eZjBT4qGFIb/rpGpyKuA6GYr
	zbib+P08gRQ==
X-Received: from dlec20-n1.prod.google.com ([2002:a05:701b:4294:10b0:1a4:c892:b166])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:ef16:b0:1b3:a26b:8b97
 with SMTP id a92af1059eb24-1b3a26b8c4bmr3821391c88.41.1794177588129; Sun, 08
 Nov 2026 14:39:48 -0800 (PST)
Date: Sun,  8 Nov 2026 14:39:08 -0800
In-Reply-To: <20261108223913.3624571-1-irogers@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261108223913.3624571-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261108223913.3624571-5-irogers@google.com>
Subject: [PATCH v3 4/9] cpufreq: governor: Initialize kobj_type release
 callback statically
From: Ian Rogers <irogers@google.com>
To: Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kees Cook <kees@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <chleroy@kernel.org>, Nayna Jain <nayna@linux.ibm.com>, 
	Srish Srinivasan <ssrish@linux.ibm.com>, Mimi Zohar <zohar@linux.ibm.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Juergen Gross <jgross@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>, Alexander Aring <aahringo@redhat.com>, 
	Felix Kuehling <felix.kuehling@amd.com>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, Zhihao Cheng <chengzhihao1@huawei.com>, 
	Sumanth Korikkar <sumanthk@linux.ibm.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, driver-core@lists.linux.dev, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-pm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-sh@vger.kernel.org, linux-s390@vger.kernel.org, gfs2@lists.linux.dev, 
	xen-devel@lists.xenproject.org, linux-mtd@lists.infradead.org, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Ian Rogers <irogers@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_143950_053516_532AB2D0 
X-CRM114-Status: GOOD (  12.86  )
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Export cpufreq_dbs_data_release() and initialize .kobj_type.release
statically in the ondemand and conservative governors instead of
assigning it at runtime in cpufreq_dbs_governor_init().

This prepares for annotating struct kobj_type::release with
__must_init.

Reviewed-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
Acked-by: Rafael J. Wysocki (Intel) <rafael@kernel.org> # cpufreq
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
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
2.56.0.455.g6c5a503b38-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
