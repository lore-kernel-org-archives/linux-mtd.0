Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90C66CC6B0F
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Oct 2026 22:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=4b3WB4E8CrOgGjqMUKs1/yv1r99WQBiq6EQKQUtNkjo=; b=MpaZK80w6XFP6hrSguO22Q89kw
	G/lET6Jef4BRme4zLcCkgDB+D0mKmALtHW2y2q9GlJot6yfhXdedreK9ch+5HRDq7ixt+VeHIeQzA
	zdpVW+v7wGOuFKXVyMmKHp2t+8hQExaaePddXEwNz5aZUnd8FPd+eE7qllm+H+t1tpnoklJLzECQE
	GohoL7ef7UvmzbVbkLxcUHgRo7Ycme7iPnzD3HHIn29lIxPXQsKgMh5yFavZWrS6ZHVqbarBA2fU4
	R7UNxNzijvARf+7crkj/9OfGYZ4X23GYxEESxdTLRnyoz+qFn08V3sg3kvvAtnn5ECwHqXMD/YGRj
	p5IimJSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGlAs-0000000E9jv-3m3Y;
	Tue, 13 Oct 2026 22:40:46 +0000
Received: from mail-dy1-x1345.google.com ([2607:f8b0:4864:20::1345])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGlAe-0000000E9Xb-3jM2
	for linux-mtd@lists.infradead.org;
	Tue, 13 Oct 2026 22:40:35 +0000
Received: by mail-dy1-x1345.google.com with SMTP id 5a478bee46e88-30bcb065bfdso6716355eec.0
        for <linux-mtd@lists.infradead.org>; Tue, 13 Oct 2026 15:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791931231; x=1792536031; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E3db36lwsPWQArDIHzP6eqDHTacNJpd6D0FMiQjZlVc=;
        b=CfiMJP6H+VOcHRSqNZs7kZA/azMkZaWZb7w4dWf5c+PB/lcQQ299Ix9qDC6Jbef5Uo
         aeL78VSQzjJaQQ4lgHIpa3yttLkVoHaDOMlJFYYz1i3m+giBJlNl60Wab4ncdVByOnNi
         6qyq0vyI8PZEIXK8ae6uCxyC12BnNAHnsxTho8jiRdhUdYfgJ4dbesH95YMWEtlsX2PH
         5xRCnxnY98gpEv5bJV9aWsYdEGev3xw59b57uJEs6YhNgCRi/LozCE1Qh/RzSOb0pEJk
         8sdsUpi8uwNJSq+sVNDtzarfJkXM0yI+Bwmckm6RlvubH19uND5UvP6x4FGm0t6X+tSU
         KSuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791931231; x=1792536031;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E3db36lwsPWQArDIHzP6eqDHTacNJpd6D0FMiQjZlVc=;
        b=lBReSHMDfNy1fpKhLnuaPnm5l0TNRbn+WIYebv1DKEG5wVBzgThE9j8Zzh+1c67Vjk
         7ERxGc4fmgZutgw44v06kFSqLgGbhzPB/5UufYGsD+YcKLuXT5BHSn0xtOdpH/iBwWIQ
         qhUIBjaR91kpJy8idDaW4i0UOW0hIZKmDbpVT2ymbWlaes0GXgRL+5df5RdgqDPL9LVg
         9TkRSkKHoOnHHmAnllgysOBIgKHzIarGR2Sb9HFG+ift1cfTno5UA/w0Yp41o8VZhHdS
         pMKPEx77dfkCBQnXymdXf487u8NyslLeuXBiUaxPLpYaPPlERHXGMDJB1lCNCGMJCtIC
         xe0w==
X-Forwarded-Encrypted: i=1; AKwUvBxVpGhGG/GLpJFs46lWxiIYpN1MegEOLvQSA+HX2vOOVK3bUYO6KpMkdWr1bKdX+WlYGrZuF0eAtoI=@lists.infradead.org
X-Gm-Message-State: AFq9FYL9LUJDf/ZGaW91NX5Xj5EB72WCi8DUbjPFb9JSdU6VpXYviz5j
	3p1enjgAijhaL2exKffa7EtJmcOWBlrzWH+skqQw7N0zU+KqnbLoU9Ix1+3Xiq6hppnRkecGRxX
	O3Tdt6nPsBw==
X-Received: from dybmd37.prod.google.com ([2002:a05:7301:1825:b0:351:1da6:c2e7])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:78cb:b0:351:515b:4e85
 with SMTP id 5a478bee46e88-3537e088bd7mr19706222eec.16.1791931230851; Tue, 13
 Oct 2026 15:40:30 -0700 (PDT)
Date: Tue, 13 Oct 2026 15:39:43 -0700
In-Reply-To: <20261013223946.1836757-1-irogers@google.com>
Mime-Version: 1.0
References: <20261013223946.1836757-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261013223946.1836757-9-irogers@google.com>
Subject: [PATCH 08/11] s390/sclp_mem: Allocate struct sclp_mem dynamically and
 add kobject release
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
X-CRM114-CacheID: sfid-20261013_154032_970141_FAAC4B09 
X-CRM114-Status: GOOD (  19.02  )
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

sclp_init_mem() allocated a single array of struct sclp_mem with
kzalloc_objs() and registered each embedded kobject using a kobj_type
without a .release callback. Allocate each struct sclp_mem individually
with kzalloc_obj() instead and add sclp_mem_release() to free it.

Fixes: ff18dcb19aab ("s390/sclp: Add support for dynamic (de)configuration of memory")
Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/s390/char/sclp_mem.c | 73 +++++++++++++++++-------------------
 1 file changed, 34 insertions(+), 39 deletions(-)

diff --git a/drivers/s390/char/sclp_mem.c b/drivers/s390/char/sclp_mem.c
index 6df1926d4c62..f7c161e0d836 100644
--- a/drivers/s390/char/sclp_mem.c
+++ b/drivers/s390/char/sclp_mem.c
@@ -49,11 +49,6 @@ struct sclp_mem {
 #endif
 };
 
-struct sclp_mem_arg {
-	struct sclp_mem *sclp_mems;
-	struct kset *kset;
-};
-
 struct assign_storage_sccb {
 	struct sccb_header header;
 	u16 rn;
@@ -304,7 +299,15 @@ static ssize_t sclp_memmap_on_memory_store(struct kobject *kobj, struct kobj_att
 	return rc ? rc : count;
 }
 
+static void sclp_mem_release(struct kobject *kobj)
+{
+	struct sclp_mem *sclp_mem = container_of(kobj, struct sclp_mem, kobj);
+
+	kfree(sclp_mem);
+}
+
 static const struct kobj_type ktype = {
+	.release = sclp_mem_release,
 	.sysfs_ops = &kobj_sysfs_ops,
 };
 
@@ -321,36 +324,40 @@ static struct attribute_group sclp_mem_attr_group = {
 	.attrs = sclp_mem_attrs,
 };
 
-static int sclp_create_mem(struct sclp_mem *sclp_mem, struct kset *kset,
-			   unsigned int id, bool config, bool memmap_on_memory)
+static int sclp_create_mem(struct kset *kset, unsigned int id, bool config,
+			   bool memmap_on_memory)
 {
+	struct sclp_mem *sclp_mem;
 	int rc;
 
+	sclp_mem = kzalloc_obj(*sclp_mem);
+	if (!sclp_mem)
+		return -ENOMEM;
 	sclp_mem->memmap_on_memory = memmap_on_memory;
 	sclp_mem->config = config;
 #ifdef CONFIG_KASAN
 	sclp_mem->early_shadow_mapped = config;
 #endif
 	sclp_mem->id = id;
-	kobject_init(&sclp_mem->kobj, &ktype);
-	rc = kobject_add(&sclp_mem->kobj, &kset->kobj, "memory%d", id);
-	if (rc)
+	rc = kobject_init_and_add(&sclp_mem->kobj, &ktype, &kset->kobj,
+				  "memory%d", id);
+	if (rc) {
+		kobject_put(&sclp_mem->kobj);
 		return rc;
-	return sysfs_create_group(&sclp_mem->kobj, &sclp_mem_attr_group);
+	}
+	rc = sysfs_create_group(&sclp_mem->kobj, &sclp_mem_attr_group);
+	if (rc) {
+		kobject_put(&sclp_mem->kobj);
+		return rc;
+	}
+	return 0;
 }
 
 static int sclp_create_configured_mem(struct memory_block *mem, void *argument)
 {
-	struct sclp_mem *sclp_mems;
-	struct sclp_mem_arg *arg;
-	struct kset *kset;
-	unsigned int id;
+	struct kset *kset = argument;
 
-	id = mem->dev.id;
-	arg = (struct sclp_mem_arg *)argument;
-	sclp_mems = arg->sclp_mems;
-	kset = arg->kset;
-	return sclp_create_mem(&sclp_mems[id], kset, id, true, false);
+	return sclp_create_mem(kset, mem->dev.id, true, false);
 }
 
 static void __init align_to_block_size(unsigned long *start,
@@ -368,8 +375,7 @@ static void __init align_to_block_size(unsigned long *start,
 	*size = size_align;
 }
 
-static int __init sclp_create_standby_mems_merged(struct sclp_mem *sclp_mems,
-						  struct kset *kset, u16 rn)
+static int __init sclp_create_standby_mems_merged(struct kset *kset, u16 rn)
 {
 	unsigned long start, size, addr, block_size;
 	static u16 first_rn, num;
@@ -394,7 +400,7 @@ static int __init sclp_create_standby_mems_merged(struct sclp_mem *sclp_mems,
 		goto skip_add;
 	for (addr = start; addr < start + size; addr += block_size) {
 		id = addr / block_size;
-		rc = sclp_create_mem(&sclp_mems[id], kset, id, false,
+		rc = sclp_create_mem(kset, id, false,
 				     mhp_supports_memmap_on_memory());
 		if (rc)
 			break;
@@ -405,45 +411,34 @@ static int __init sclp_create_standby_mems_merged(struct sclp_mem *sclp_mems,
 	return rc;
 }
 
-static int __init sclp_create_standby_mems(struct sclp_mem *sclp_mems, struct kset *kset)
+static int __init sclp_create_standby_mems(struct kset *kset)
 {
 	struct memory_increment *incr;
 	int rc = 0;
 
 	list_for_each_entry(incr, &sclp_mem_list, list) {
 		if (incr->standby)
-			rc = sclp_create_standby_mems_merged(sclp_mems, kset, incr->rn);
+			rc = sclp_create_standby_mems_merged(kset, incr->rn);
 		if (rc)
 			return rc;
 	}
-	return sclp_create_standby_mems_merged(sclp_mems, kset, 0);
+	return sclp_create_standby_mems_merged(kset, 0);
 }
 
 static int __init sclp_init_mem(void)
 {
-	const unsigned long block_size = memory_block_size_bytes();
-	unsigned int max_sclp_mems;
-	struct sclp_mem *sclp_mems;
-	struct sclp_mem_arg arg;
 	struct kset *kset;
 	int rc;
 
-	max_sclp_mems = roundup(sclp.rnmax * sclp.rzm, block_size) / block_size;
-	/* Allocate memory for all blocks ahead of time. */
-	sclp_mems = kzalloc_objs(struct sclp_mem, max_sclp_mems);
-	if (!sclp_mems)
-		return -ENOMEM;
 	kset = kset_create_and_add("memory", NULL, firmware_kobj);
 	if (!kset)
 		return -ENOMEM;
 	/* Initial memory is in the "configured" state already. */
-	arg.sclp_mems = sclp_mems;
-	arg.kset = kset;
-	rc = for_each_memory_block(&arg, sclp_create_configured_mem);
+	rc = for_each_memory_block(kset, sclp_create_configured_mem);
 	if (rc)
 		return rc;
 	/* Standby memory is "deconfigured". */
-	return sclp_create_standby_mems(sclp_mems, kset);
+	return sclp_create_standby_mems(kset);
 }
 
 static void __init insert_increment(u16 rn, int standby, int assigned)
-- 
2.56.0.385.gd3acb90ef8-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
