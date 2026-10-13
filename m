Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B44BCC6B20
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Oct 2026 22:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=C5sPG3BOe28o6Sn481kddHSFg8DVp1K1TeYsWuTM4Vc=; b=5GThU5aocSKAxx9hvvXQy5p9aZ
	mht2iWiuhEs8EcgRWemhLse5KlAyllcIL2nZRdNYy23ab8vSBdk7bs5F+cXIiTvbR+DWsfVT/hxEl
	WlEIKIlPCDISMq/Qr0mbiu8wvHxOyZ9zH0/FGeoF117fkzh1+tYACh1VpdvYF2KF3e1n6TtIbiIgj
	XjrPVfkrr+5EfSka7RHwjez0VI7HXfec7nhQZbQN6F/Pq/WJEjRjbYUWpchrP7q+gbYab00QvAlEM
	W0nbaYcLeznAHhYgu1JWl3NT9/rwHkPRaMta+kg8eBSsu5X57TeLp5djVGH7eY8x/em04GpsoLVYa
	v6dbg9AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGlAU-0000000E9QM-1X8N;
	Tue, 13 Oct 2026 22:40:22 +0000
Received: from mail-dl1-x1247.google.com ([2607:f8b0:4864:20::1247])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGlAP-0000000E9O2-3qUE
	for linux-mtd@lists.infradead.org;
	Tue, 13 Oct 2026 22:40:19 +0000
Received: by mail-dl1-x1247.google.com with SMTP id a92af1059eb24-1663fb7e005so4564588c88.0
        for <linux-mtd@lists.infradead.org>; Tue, 13 Oct 2026 15:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791931215; x=1792536015; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zS2ZTWNtYHltA9QytinDsw+p3+JtthDKSkNq3q9AYXg=;
        b=oe4y0ojtCAh9WRexxn4Cq8lGF0NtNrQY68xoKahLuZI98aks0rv2lHW9FT1sOyXcvp
         zhTCE+5rEnlXnNxcb6RzZpvQQKKpabDlBCT8p+FKaw89TSfXo1rxQA2ygaLAaW77Ztcy
         2Xy2Co8VyZp03/wKUrxD7vfjHAuqbUB0GUK6g6XCu8uRa9vvUNbKmhx1F5QfU6Pigsl4
         Jv1nW4Kb8A6oTIpC0GeKlIiXY2YeFFDDdnYNPDQqkE9uh1LFxObI6TMzgpaIHvXeCAVf
         0OVekP3f+3uNx0zomRsb4uV0x11Na6P8HfCgl9JvU9kDjYtKAg5sN5hrwHzqXPBBqLUj
         Gobg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791931215; x=1792536015;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zS2ZTWNtYHltA9QytinDsw+p3+JtthDKSkNq3q9AYXg=;
        b=nF0RE5FY6k65nMOtt2wQAjvah+nc0rB6OFCs7xl3LGsoGvmT/9/Xfnw8jkmxRFUy6E
         G8Y3JNsl3NFQuQfHnuiTtYSKabCrNcicQ2mY2B/O9M+r+mtrOTSQ1UOfJnH/nqs5W6dR
         gMcsY5cZ+HfKOhkebnKufRQQuMko5Ga7bhOUk01ui12qzbrx9X9paTiSKG+DKzcZgzSD
         QP0b99e1Q9MrXBW4z301puRA2mhQLwCDPtvRI0T/OYyzMNzsR+O7olm1w+c1huKF6Mmk
         MIvXTlkCvIobnbWgzcft9wB0JCtd4uX9/OjzRuNtzghFJRCL4zbZk6zv6GwpblJUf4EH
         4xsw==
X-Forwarded-Encrypted: i=1; AKwUvBwoOV5TtXHIhNHH9ZWh3YOXpYNKmBtT03gjSrfCH4Pf078De6hJSrgjAk9cLngoK/hPD9985faU/DI=@lists.infradead.org
X-Gm-Message-State: AFq9FYI+WQcpTODoLiSgmyb/x2vtUL6Vy//bOnix7Ql5G50zwK1SZbH3
	dmlQXoI1632YMVYQOb7O4L1H+9ieJtrm0wNKzW9gx8zdNKxNXlTGzEPg1/2/IiqM9BZUSEoBBFP
	JvCxzjoBnxQ==
X-Received: from dlbvs3.prod.google.com ([2002:a05:7022:3f03:b0:16a:e18b:92ba])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:4553:20b0:166:9e0d:3b56
 with SMTP id a92af1059eb24-16a6384d0c8mr17137930c88.38.1791931214565; Tue, 13
 Oct 2026 15:40:14 -0700 (PDT)
Date: Tue, 13 Oct 2026 15:39:36 -0700
In-Reply-To: <20261013223946.1836757-1-irogers@google.com>
Mime-Version: 1.0
References: <20261013223946.1836757-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261013223946.1836757-2-irogers@google.com>
Subject: [PATCH 01/11] Compiler Attributes: Add __require_explicit_initialization
 macro
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
X-CRM114-CacheID: sfid-20261013_154017_980256_CDB9F0A3 
X-CRM114-Status: GOOD (  13.34  )
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

Clang supports the 'require_explicit_initialization' attribute on struct
fields to indicate that a field must be initialized explicitly by the
user when the object is constructed. When an aggregate initializer or
uninitialized variable omits an annotated field, Clang emits a
-Wuninitialized-explicit-init warning (enabled by default).

Add the __require_explicit_initialization macro to
include/linux/compiler_attributes.h (which is included by
include/linux/compiler_types.h and include/linux/compiler.h) so kernel
structs with error-prone initialization (such as mandatory callbacks or
cleanup handlers) can enforce explicit initialization at compile time,
as discussed at the Linux Plumbers Conference.

Also teach Sphinx (Documentation/conf.py), kernel-doc
(tools/lib/python/kdoc/xforms_lists.py), and checkpatch.pl about the new
attribute macro.

Link: https://lpc.events/event/20/contributions/2392/
Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Ian Rogers <irogers@google.com>
---
 Documentation/conf.py                 |  1 +
 include/linux/compiler_attributes.h   | 11 +++++++++++
 scripts/checkpatch.pl                 |  1 +
 tools/lib/python/kdoc/xforms_lists.py |  1 +
 4 files changed, 14 insertions(+)

diff --git a/Documentation/conf.py b/Documentation/conf.py
index 5ab26ce89daf..3e5cb9ca0970 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -203,6 +203,7 @@ c_id_attributes = [
     "__noreturn",
     "__packed",
     "__pure",
+    "__require_explicit_initialization",
     "__section",
     "__always_unused",
     "__maybe_unused",
diff --git a/include/linux/compiler_attributes.h b/include/linux/compiler_attributes.h
index 476c4c560d17..60522ab80c5a 100644
--- a/include/linux/compiler_attributes.h
+++ b/include/linux/compiler_attributes.h
@@ -322,6 +322,17 @@
  */
 #define __pure                          __attribute__((__pure__))
 
+/*
+ * Optional: not supported by gcc
+ *
+ * clang: https://clang.llvm.org/docs/AttributeReference.html#require-explicit-initialization
+ */
+#if __has_attribute(__require_explicit_initialization__)
+# define __require_explicit_initialization __attribute__((__require_explicit_initialization__))
+#else
+# define __require_explicit_initialization
+#endif
+
 /*
  *   gcc: https://gcc.gnu.org/onlinedocs/gcc/Common-Function-Attributes.html#index-section-function-attribute
  *   gcc: https://gcc.gnu.org/onlinedocs/gcc/Common-Variable-Attributes.html#index-section-variable-attribute
diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 8a7787d228a6..4a3ae6b0100a 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -6871,6 +6871,7 @@ sub process {
 				"noreturn"			=> "__noreturn",
 				"packed"			=> "__packed",
 				"pure"				=> "__pure",
+				"require_explicit_initialization" => "__require_explicit_initialization",
 				"section"			=> "__section",
 				"used"				=> "__used",
 				"weak"				=> "__weak"
diff --git a/tools/lib/python/kdoc/xforms_lists.py b/tools/lib/python/kdoc/xforms_lists.py
index e3dda2fe8a53..32066fbbe763 100644
--- a/tools/lib/python/kdoc/xforms_lists.py
+++ b/tools/lib/python/kdoc/xforms_lists.py
@@ -36,6 +36,7 @@ class CTransforms:
         (CMatch("CRYPTO_MINALIGN_ATTR"), ""),
         (CMatch("__private"), ""),
         (CMatch("__rcu"), ""),
+        (CMatch("__require_explicit_initialization"), ""),
         (CMatch("____cacheline_aligned_in_smp"), ""),
         (CMatch("____cacheline_aligned"), ""),
         (CMatch("__cacheline_group_(?:begin|end)"), ""),
-- 
2.56.0.385.gd3acb90ef8-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
