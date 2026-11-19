Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC508606A325
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2026 19:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SyVVpdSC;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mVkQRLNq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=ZXEKp8IxJZY/byx9QMIsoFfXCdAIkP7cj17z3bVYdJc=; b=SyVVpdSCL/B6ukyG1hvn8WK51G
	frxrwIttTHEztd7K++npR4gpqHZY+5+Jx56zlRZmEamG2kCafHoeSv36nKFQIjpfQqnwgWujspkU6
	X6eHjbjuCBvXnYOwzqAVIMAkcEkm1y9o9VxLLR1nbJwCdMmXgHVda58Y+9ri8vP4zgBYN/bS+8p6A
	nlcjW/iA2V1s8q29KhrCySs84X7YS73cloTlDDE9Aa7+i3PnFb00S3LQwUGNuDvcgbpCQwYrMd3Yr
	OEn+GNN8vCC+UOJxrlhEuv9WV7WK9VmPpyruduSXUUxiSkklbv7YRgAjkIhglweD9FXeXh/zmggOa
	6AwTJabA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7ls-0000000DCNt-25ul;
	Thu, 19 Nov 2026 19:26:12 +0000
Received: from mail-pj1-x1047.google.com ([2607:f8b0:4864:20::1047])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7lm-0000000DCGP-3HbU
	for linux-mtd@lists.infradead.org;
	Thu, 19 Nov 2026 19:26:10 +0000
Received: by mail-pj1-x1047.google.com with SMTP id 98e67ed59e1d1-3ae6fda7a00so149202a91.2
        for <linux-mtd@lists.infradead.org>; Thu, 19 Nov 2026 11:26:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795116365; x=1795721165; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CSDEU43/2Gwf+VbjlCClZWJ4rTvHhhRb4YqVFYZr7ik=;
        b=mVkQRLNq7Hso+pUQTDhP4puvpHzRvvx83URpGIhlFtFRRnZ3epZXC4O9WyXo1Ul6IW
         rOhFdU71cSny10t58E4B7qWSo8QeL/17KUljJiEo4lf0Hx/22w1Ai04wOzBstNvMx2mb
         Oo8FViXqQ+ArgwJfeADVy/VLXdcz6z2DOq8lXjF+yoAZVCSDi5Jhl820JzDZbkL2e8KU
         yoaRWx0Hd17ldAhh5DxpT7KOizgSkuQoIZ6U1ppz6IMkzTPp1AW1RDmATo/W5QkwmFx6
         7e1zVDFeQn/O29vECK5Oo4XXSNXACE/LU21sOLGdTJO75ej93EzthoFDU10zSrlP9F6L
         p74w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795116365; x=1795721165;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CSDEU43/2Gwf+VbjlCClZWJ4rTvHhhRb4YqVFYZr7ik=;
        b=HRyVZrtoLB6/umSSuGQafqYHqFtNv1/eOnDTRqMLhHCfxUio75rzdL6uW3HDx8Duu/
         qOQgzSoIedJhe0giB5cmpAiylzEy/ne32Jm9wJF2e3dtUUwLG/p4vK7Gu43CM/kOaU21
         VNErP6B6rL4mefI6RwlO9SKZPjB+OcMldKk4vAMWFROJ65uoAE66nx7f+1trCXXDWlKQ
         jE4uA/edxRUOLmfmaTGFHf2yxF5x+vWpSrs3ii0CNwADFZ6t1b3iXqV8/mKr4tl/4UNu
         PVX6cVAHa9PKwZJ8ZOyagKGYQe6jrBDfUOu45bGy9VzIYLTzRyCV0ysVU4HPWcRqsTvX
         mT8g==
X-Forwarded-Encrypted: i=1; AL+hErH45yTHsGgCiNzFcNle5++0kT+lo0ozINFnNTuRgTLjiaVd4UHWSxlrZfOr2RviCiuDQQR1Ls4FTXs=@lists.infradead.org
X-Gm-Message-State: APuU4Z99zXUzMmcSulemPPCYiTBx/qApe03rSPPKGstSfrsohmMrgn0Y
	WFnMj+9gkseuMQz/wnwyXNzKnG/XgTdM0jCLd6uKYT/IHKxtfyh+CLjHTUQXkj72K9CF4gzC0KX
	B+NP7FW3ZhQ==
X-Received: from pjbsk16.prod.google.com ([2002:a17:90b:2dd0:b0:3b3:ada0:c008])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1c03:b0:3b4:1bf1:988f
 with SMTP id 98e67ed59e1d1-3b41cb138f0mr288962a91.54.1795116364835; Thu, 19
 Nov 2026 11:26:04 -0800 (PST)
Date: Thu, 19 Nov 2026 11:25:18 -0800
In-Reply-To: <20261119192520.1983406-1-irogers@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261119192520.1983406-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261119192520.1983406-8-irogers@google.com>
Subject: [PATCH v4 7/9] ubifs: sysfs: Use kset_create_and_add() for ubifs_kset
From: Ian Rogers <irogers@google.com>
To: Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kees Cook <kees@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Srish Srinivasan <ssrish@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <chleroy@kernel.org>, Nayna Jain <nayna@linux.ibm.com>, 
	Mimi Zohar <zohar@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
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
X-CRM114-CacheID: sfid-20261119_112606_890692_7E1022AD 
X-CRM114-Status: GOOD (  13.28  )
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

Fixes: 2e3cbf425804 ("ubifs: Export filesystem error counters")
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
2.56.1.708.g77570a6a1d-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
