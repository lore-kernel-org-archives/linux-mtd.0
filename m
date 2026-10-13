Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26977CC6B1D
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Oct 2026 22:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=KZlr/XCPyOEdIqkucCRU3jFDjFRmCl4BVygK+0cSSh0=; b=bfQOmD5o4WfqnADZx4pXXktMpn
	WCBeA7YILBFnO0FGFtP3sDLuAOQ6c64hH6fayEw43nRJ7g/FZ2+X5bPbUEfl38Rhxhzn8djjo1hjI
	r7GnlZUB16i0tccvwvxsCjvI7/erbhGlUb219QF9XDu0eGjf40dDzpL0hm88hJX2NUxQ/SJ386DrD
	cUVZjnMRY0G9COJ7bIGaqVjwzpm4dB2qN7pBzlPY4Tv5zjJEpuScjfb3rTLu551+Iuer1WL5WYSfe
	AFwm3s89p24wFpMuqKKQzFdXb4UA3RI7uncb0fTWF6f8KZxv4VAT5EXc5ME2EhK3fw1kkMfhM5wJS
	wr/E8Xmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGlAf-0000000E9ZT-1gpK;
	Tue, 13 Oct 2026 22:40:33 +0000
Received: from mail-dy1-x1347.google.com ([2607:f8b0:4864:20::1347])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGlAZ-0000000E9Sa-3otf
	for linux-mtd@lists.infradead.org;
	Tue, 13 Oct 2026 22:40:31 +0000
Received: by mail-dy1-x1347.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso7840579eec.1
        for <linux-mtd@lists.infradead.org>; Tue, 13 Oct 2026 15:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791931225; x=1792536025; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wbjJdHqZPRkvVZnH2yPkFa6V1wQ6/MdT39yYoogCQX4=;
        b=U6zec6qp3rN1uqmjQuBdTdsnz0tTVXwOe/qrMmKz8Khw8k0h0nkYI1oRl7UFUib/Z2
         Bhj+vH2AT/+tF+QihuwiPtFhh+X/lVuh6WuBDYzuupFirqNbeE11UmtYiWOsb9mAP2eN
         yccoKRufdDTvEgyHS97/F80cvMh+LHU08zCIOfH/AwvtDSjTdjmE8lm1m5jzUwkf1vW3
         ugldSO3WN6W+mQdRG3fj24wdJHyJ3hnomsp9frdlUFo16nGPx1dnNuwWLznohaEI/10+
         tEDDa7hkIaGiqurjeus4psJm/s5/+FmTvZ45KNP3s1zQUDAlx3mbPHA+hA1k2IMo050M
         wciw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791931225; x=1792536025;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wbjJdHqZPRkvVZnH2yPkFa6V1wQ6/MdT39yYoogCQX4=;
        b=NNFBKshMChZYDzi45YS7fk+/En3ekZepnTRTyGuv8lkfjE9O2ib9AZu0MYl80nv5AS
         Lue2koUxiVEMxyU3+Ba3OV/BwhXOZ58LDKbHI6OZ5/e6aJtadP082spRQPkVsZ/1+Dxj
         p+Rs4aoQMdXDvFoDzsBXuwlhJ3T+RSzdeCvc4DT8bfhRAC6mR+T0Avumj2o4i1Cl4PHA
         Sv7F7BIIUMsY1a4qD+o7BWIk5MQrF8mR+jnfiNBw09dJUIm+DJK+bwt4W/WeQ2TzFqmR
         LFxMQLjg0lUFvvc5B51nrGbgEHQfHCBYw4liSN1x5f3TpdAJKBTAVMLLfqnebOlxceRC
         33+Q==
X-Forwarded-Encrypted: i=1; AKwUvByOTh0QWQDeXyaZzEvJ8d0jZil5x0pD5miQOO0wOxMsqrAHdFjsYWooVWavXlK7qp6010AWRBEik04=@lists.infradead.org
X-Gm-Message-State: AFq9FYKzp8MjoosHT5qtBNxzF02j7XC8lhpOivST590z7kv0yPvTIVAm
	34YZUbRHgAcdJBayzZHQdWbYv7V6KNe2JgdtFEjZPJ3ea2q2fSy53Jx6Uei5o6vqjxzy0GJj2PP
	F7BLEuU03tw==
X-Received: from dyr27.prod.google.com ([2002:a05:693c:401b:b0:359:e5f1:14fb])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:470e:b0:35c:73ca:a1e0
 with SMTP id 5a478bee46e88-35c73caae65mr4317399eec.15.1791931223446; Tue, 13
 Oct 2026 15:40:23 -0700 (PDT)
Date: Tue, 13 Oct 2026 15:39:40 -0700
In-Reply-To: <20261013223946.1836757-1-irogers@google.com>
Mime-Version: 1.0
References: <20261013223946.1836757-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261013223946.1836757-6-irogers@google.com>
Subject: [PATCH 05/11] ACPI: CPPC: Free cpc_desc in kobject release callback
From: Ian Rogers <irogers@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <chleroy@kernel.org>, Nayna Jain <nayna@linux.ibm.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Viresh Kumar <viresh.kumar@linaro.org>, 
	David Teigland <teigland@redhat.com>, Alexander Aring <aahringo@redhat.com>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Richard Weinberger <richard@nod.at>, Zhihao Cheng <chengzhihao1@huawei.com>, 
	Felix Kuehling <Felix.Kuehling@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, driver-core@lists.linux.dev, 
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org, 
	linux-doc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-sh@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-acpi@vger.kernel.org, gfs2@lists.linux.dev, 
	xen-devel@lists.xenproject.org, linux-s390@vger.kernel.org, 
	linux-mtd@lists.infradead.org, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Ian Rogers <irogers@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_154027_966015_ECF54B48 
X-CRM114-Status: GOOD (  16.71  )
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

cpc_desc_ptr embeds a struct kobject that is registered in sysfs via
kobject_init_and_add(), but cppc_ktype lacked a .release callback and
acpi_cppc_processor_exit() freed cpc_ptr immediately after kobject_put().
With CONFIG_DEBUG_KOBJECT_RELEASE=y, this causes a use-after-free when
kobject_delayed_cleanup() runs on freed memory.

Move the sys_mem_vaddr unmapping and kfree(cpc_ptr) into a new
cppc_release() callback on cppc_ktype, and initialize the kobject on
allocation so kobject_put() handles cleanup in all paths.

Fixes: 158c998ea44b ("ACPI / CPPC: add sysfs support to compute delivered performance")
Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/acpi/cppc_acpi.c | 39 ++++++++++++++++++---------------------
 1 file changed, 18 insertions(+), 21 deletions(-)

diff --git a/drivers/acpi/cppc_acpi.c b/drivers/acpi/cppc_acpi.c
index fef54fcd00b7..2a80404f85d3 100644
--- a/drivers/acpi/cppc_acpi.c
+++ b/drivers/acpi/cppc_acpi.c
@@ -297,7 +297,22 @@ static struct attribute *cppc_attrs[] = {
 };
 ATTRIBUTE_GROUPS(cppc);
 
+static void cppc_release(struct kobject *kobj)
+{
+	struct cpc_desc *cpc_ptr = to_cpc_desc(kobj);
+	unsigned int i;
+
+	for (i = 2; i < cpc_ptr->num_entries; i++) {
+		void __iomem *addr = cpc_ptr->cpc_regs[i - 2].sys_mem_vaddr;
+
+		if (addr)
+			iounmap(addr);
+	}
+	kfree(cpc_ptr);
+}
+
 static const struct kobj_type cppc_ktype = {
+	.release = cppc_release,
 	.sysfs_ops = &kobj_sysfs_ops,
 	.default_groups = cppc_groups,
 };
@@ -799,6 +814,7 @@ int acpi_cppc_processor_probe(struct acpi_processor *pr)
 		ret = -ENOMEM;
 		goto out_buf_free;
 	}
+	kobject_init(&cpc_ptr->kobj, &cppc_ktype);
 
 	/* First entry is NumEntries. */
 	cpc_obj = &out_obj->package.elements[0];
@@ -1001,11 +1017,9 @@ int acpi_cppc_processor_probe(struct acpi_processor *pr)
 	/* Plug PSD data into this CPU's CPC descriptor. */
 	per_cpu(cpc_desc_ptr, pr->id) = cpc_ptr;
 
-	ret = kobject_init_and_add(&cpc_ptr->kobj, &cppc_ktype, &cpu_dev->kobj,
-			"acpi_cppc");
+	ret = kobject_add(&cpc_ptr->kobj, &cpu_dev->kobj, "acpi_cppc");
 	if (ret) {
 		per_cpu(cpc_desc_ptr, pr->id) = NULL;
-		kobject_put(&cpc_ptr->kobj);
 		goto out_free;
 	}
 
@@ -1013,14 +1027,7 @@ int acpi_cppc_processor_probe(struct acpi_processor *pr)
 	return 0;
 
 out_free:
-	/* Free all the mapped sys mem areas for this CPU */
-	for (i = 2; i < cpc_ptr->num_entries; i++) {
-		void __iomem *addr = cpc_ptr->cpc_regs[i-2].sys_mem_vaddr;
-
-		if (addr)
-			iounmap(addr);
-	}
-	kfree(cpc_ptr);
+	kobject_put(&cpc_ptr->kobj);
 
 out_buf_free:
 	kfree(output.pointer);
@@ -1037,8 +1044,6 @@ EXPORT_SYMBOL_GPL(acpi_cppc_processor_probe);
 void acpi_cppc_processor_exit(struct acpi_processor *pr)
 {
 	struct cpc_desc *cpc_ptr;
-	unsigned int i;
-	void __iomem *addr;
 	int pcc_ss_id = per_cpu(cpu_pcc_subspace_idx, pr->id);
 
 	if (pcc_ss_id >= 0 && pcc_data[pcc_ss_id]) {
@@ -1056,15 +1061,7 @@ void acpi_cppc_processor_exit(struct acpi_processor *pr)
 	if (!cpc_ptr)
 		return;
 
-	/* Free all the mapped sys mem areas for this CPU */
-	for (i = 2; i < cpc_ptr->num_entries; i++) {
-		addr = cpc_ptr->cpc_regs[i-2].sys_mem_vaddr;
-		if (addr)
-			iounmap(addr);
-	}
-
 	kobject_put(&cpc_ptr->kobj);
-	kfree(cpc_ptr);
 }
 EXPORT_SYMBOL_GPL(acpi_cppc_processor_exit);
 
-- 
2.56.0.385.gd3acb90ef8-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
