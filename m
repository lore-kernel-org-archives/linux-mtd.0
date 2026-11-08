Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 488DD608363F
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Nov 2026 22:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sOM7VLIB;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GmNgOZMo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=KW4qS1IalQO9QsQLE1WAyjW43mloeHDm4NWjUmDhU2c=; b=sOM7VLIBa9LWaZu7WywHBNmnZG
	ESRHUerN8iLvuvzcT8zAPyF1E0nS4UaQA2wTBfC/0brJneLVY2HkvkFc3dXtQhuK8LtNpiBszowZy
	ua4jTCTP+rlGWJzfZujRWuNAAytrZ3/9ICI/D8684Sg8ChPYZ75TzCY2jEDAAyxWTnkoYCoRUA142
	to1zBMq2XfroVdCudQvshGOo5/MDTrc5UapxzSv/l74BBTtnvsuruS6PMVtfSvxZvA2DG/vWLZSYf
	rU4AKWpugsC88zafTR0K77akLVft3Dcl1clPeU9VTYJ7gxCtZWaV6rPZCxmLokAyavWB94+l+IlHi
	0WtHDvvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQBYN-0000000GqCD-3gUu;
	Sun, 08 Nov 2026 22:39:59 +0000
Received: from mail-dy1-x1346.google.com ([2607:f8b0:4864:20::1346])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQBYK-0000000Gq5V-2la5
	for linux-mtd@lists.infradead.org;
	Sun, 08 Nov 2026 22:39:58 +0000
Received: by mail-dy1-x1346.google.com with SMTP id 5a478bee46e88-36efb506f29so200271eec.1
        for <linux-mtd@lists.infradead.org>; Sun, 08 Nov 2026 14:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794177595; x=1794782395; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vy7610mZpT38CbXCq7RNEhhWWcPldBtQplNazUNUwLE=;
        b=GmNgOZMow46gLggijwxyGqhN9LNUPDLX49cERYLJrx6oyq6NBg9IYvM+OQX2Z/DUpH
         qEdRb16+VaW77nO0eqYEouvf7bSccTGE0JB9fWZ8/rsRneFDwYRbtbr4ICYF0GR8qZm9
         tAVsNMhPb5CT+Nu7lcKClH6y/K6yo8Av4j2wO/Z5QjBiL7aOsyG1ekmY1bl2GWQXzprJ
         v8+2pVaf9/+XC5LyH0w/I6vw0qoxU9o1Jglv2nNPkxiIf/DFiDOJJPjowSU0f6RgHT7/
         rt/meLtSsA8rfAo/W/3Vj+53n/U9e6hU+sf1L9nZbRU1UTE6Ici6xbevd6+pBR2oCgWs
         xTZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794177595; x=1794782395;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vy7610mZpT38CbXCq7RNEhhWWcPldBtQplNazUNUwLE=;
        b=uCgwpxZV4cHg7FOO56b0ZyJrIZ2I4k0AaRfHb4X+pmVRxp8uwNiU/X8VkzVL2FxdVM
         uW+D+Lj5MaA2jsXVPGXgrEWtHLmJhSpplnmC3I3Jgz8Gp9PXTQQe07kTwcWO6QXxta5y
         sjRQflloQr6GE1DlZUpQ//3auAEFBDNE3qT+86Z7HQLVugusJltf7q1jhe2MDl6CnPJ7
         JxZsYULzd9SDb1COA0nxcVY9JgyTX08k1NgbXnt4y48ru5DVvY1KFqQxwuRyHd2l9yd2
         J+xTiiRtmm4AgQvTrfRVZcvxxcr1hMUjykiKOlcLEo3jwQuFFUio/TuEXRqBF/Q9Hnth
         Svng==
X-Forwarded-Encrypted: i=1; AL+hErFby45vuXiUEINPmCPIJtdf3LmQnSV3f4OKXzO09H3v5BfjICs7U/+so4kJ63eibvXisi95f18eyjM=@lists.infradead.org
X-Gm-Message-State: APuU4Z9f1Kzo72n5qEMW2XK4Vlzq8P00xBOihQe7wRVqWWXSCmshgsrS
	fDONLe3yhdJG2cGzZAung6cp3Q/mSQ8Yn2xLc4G6PYAawrkAXfRoeSFNPq+27vucjmeUkfY2jBb
	CwU+q+a6phA==
X-Received: from dyblf39.prod.google.com ([2002:a05:7301:a27:b0:373:6c70:7c9c])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:d584:b0:36c:9f1a:30b8
 with SMTP id 5a478bee46e88-3725661520amr5331882eec.31.1794177594363; Sun, 08
 Nov 2026 14:39:54 -0800 (PST)
Date: Sun,  8 Nov 2026 14:39:11 -0800
In-Reply-To: <20261108223913.3624571-1-irogers@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261108223913.3624571-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261108223913.3624571-8-irogers@google.com>
Subject: [PATCH v3 7/9] ubifs: sysfs: Use kset_create_and_add() for ubifs_kset
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
X-CRM114-CacheID: sfid-20261108_143956_791997_C5A7CDF2 
X-CRM114-Status: GOOD (  12.98  )
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

ubifs_kset was a static struct kset using a custom ubifs_ktype that
had no default_groups and no .release callback. With
CONFIG_DEBUG_KOBJECT_RELEASE=y, unloading the ubifs module while delayed
kobject release is pending causes a use-after-free on the static kset.

Replace the static ubifs_kset and empty ubifs_ktype with a dynamically
allocated kset via kset_create_and_add().

Fixes: 203a55f04f66 ("ubifs: Fix memory leak in ubifs_sysfs_init()")
Tested-by: Zhihao Cheng <chengzhihao1@huawei.com>
Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>
Signed-off-by: Ian Rogers <irogers@google.com>
---
 fs/ubifs/sysfs.c | 24 +++++++-----------------
 1 file changed, 7 insertions(+), 17 deletions(-)

diff --git a/fs/ubifs/sysfs.c b/fs/ubifs/sysfs.c
index dbf967dcf26e..e20931e3a62f 100644
--- a/fs/ubifs/sysfs.c
+++ b/fs/ubifs/sysfs.c
@@ -80,13 +80,7 @@ static const struct kobj_type ubifs_sb_ktype = {
 	.release	= ubifs_sb_release,
 };
 
-static const struct kobj_type ubifs_ktype = {
-	.sysfs_ops	= &ubifs_attr_ops,
-};
-
-static struct kset ubifs_kset = {
-	.kobj	= {.ktype = &ubifs_ktype},
-};
+static struct kset *ubifs_kset;
 
 int ubifs_sysfs_register(struct ubifs_info *c)
 {
@@ -107,7 +101,7 @@ int ubifs_sysfs_register(struct ubifs_info *c)
 		goto out_free;
 	}
 
-	c->kobj.kset = &ubifs_kset;
+	c->kobj.kset = ubifs_kset;
 	init_completion(&c->kobj_unregister);
 
 	ret = kobject_init_and_add(&c->kobj, &ubifs_sb_ktype, NULL,
@@ -139,18 +133,14 @@ void ubifs_sysfs_unregister(struct ubifs_info *c)
 
 int __init ubifs_sysfs_init(void)
 {
-	int ret;
+	ubifs_kset = kset_create_and_add("ubifs", NULL, fs_kobj);
+	if (!ubifs_kset)
+		return -ENOMEM;
 
-	kobject_set_name(&ubifs_kset.kobj, "ubifs");
-	ubifs_kset.kobj.parent = fs_kobj;
-	ret = kset_register(&ubifs_kset);
-	if (ret)
-		kset_put(&ubifs_kset);
-
-	return ret;
+	return 0;
 }
 
 void ubifs_sysfs_exit(void)
 {
-	kset_unregister(&ubifs_kset);
+	kset_unregister(ubifs_kset);
 }
-- 
2.56.0.455.g6c5a503b38-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
