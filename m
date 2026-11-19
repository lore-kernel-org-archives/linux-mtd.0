Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B6B60A262D
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2026 19:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XjndrqGJ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=diO404DR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=UxEjxfDxlB72Sc9ZZQ5c4BAMVTMAXc7XI/C7aptrLuE=; b=XjndrqGJHD9cCYO1xOjgZFXQRn
	PnfkPp3HodAPeziyNABV2oDGSldE8O+jjMbVjiawFPGvhW3ieT2YuuhvDRlKviXfjNGVoyWqIjNGT
	dx+AOfkBHKizsisC7eIMVcsmiJHuMae1XA4brlDvu7s7p9knEeGyretWYsmbENigqG79dKJICojmE
	pTd1veb8tPdzizrdfo6V1WcvE2Dele6cCDZzHI/n37jyKNMVCbIyNV3dmRgeSOnj6Us2jJu6iOZVK
	ekEkefVRlS8wn6Hjmbo6s3G2tXFVvrAYEo45XPGFMq2622R8mxSM1VyAXl56PoMgECajmIzOqtWmx
	moMF6Miw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7lK-0000000DBwE-2vXC;
	Thu, 19 Nov 2026 19:25:38 +0000
Received: from mail-dy1-x1348.google.com ([2607:f8b0:4864:20::1348])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7lI-0000000DBv1-1YKl
	for linux-mtd@lists.infradead.org;
	Thu, 19 Nov 2026 19:25:37 +0000
Received: by mail-dy1-x1348.google.com with SMTP id 5a478bee46e88-38531c1a566so110514eec.1
        for <linux-mtd@lists.infradead.org>; Thu, 19 Nov 2026 11:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795116335; x=1795721135; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5sSK0mEpHDMvzrLQAsEFtk5LbI4UItSogecSbLV64WI=;
        b=diO404DR/MtwEmcLVcLwqdihibOyGK5o+XtV+LSpkfEbOLVH5lbN9HB2KLeJW05JZ2
         PxSDJXQoB47kuBLuFdJzxHUWv1KK6nMCLnO64tHjgwzh2QzhXZ9TJaRhNvM2iD9AHrTc
         hkEb2oIuoTT0r3TjfCV931cRuVbWyuJIavc1uu25ykDUCjL5ZkXyN04uc5xfuAFDD5ks
         NVDg5efovfep49jxO4RclpWMVvfTGanhfj7V4gGc04Wcmi1r5Aw9qSXaUEkERg3H95Ci
         hYiwx5lnVKcEiyApH3fRjp28ctMmKupRXL+EbfiQDZuYheMS9p7ytZcjC2L13Uab0Umf
         2x3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795116335; x=1795721135;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5sSK0mEpHDMvzrLQAsEFtk5LbI4UItSogecSbLV64WI=;
        b=h+0+rTg6Bdp8llh2+FdhKGkRLDdtBpvzLwwIxu26MwwiCaNITIYT/xqKpWgd5aMcyO
         LTjwtP50BO8f5dCoEajplxA9HjsxGHvI3VhYNW2rTk0MJDIWihVb1LNn9YDJGerZhMAV
         yj6GB0gSKAHzAl/fsb9kpqpa2FpjbeD1DW4X5Y2HzJxek5aNI1W5JfIQ94uAp6QjOfh0
         OdW5DU1aGMcM7NhYbYmwGNFzglEvLDnvTY5gOW2ASEUrIJAXzJFl0M7JVYPZTyBKn7rf
         QUrdeudsNnKggRaN+L5w9fOrIDarqYyyZyqfPb3BC4ThAxOIvP5ug9CFvrr2HGL+qpY+
         Xpkw==
X-Forwarded-Encrypted: i=1; AL+hErEcf377P8itKdZdm7bzSACrNfSLYjrB09a8E1IlTe4Uub19FmaBwMXnJYY4+ixHYENr98GwGdF9GvY=@lists.infradead.org
X-Gm-Message-State: APuU4Z9ijGR1Boo0YHvVhVGJmK4LBUU/ujYIHqoxsMv1f+ZiLfgmd7KP
	hIFQCjKITLI2Tvo/7C8h+S2ee7Z6tNmEZL2ThH+XQGD10WVawXQIg7+3y24NaUDmHR+9xTOAu1N
	pKkia/7zaiA==
X-Received: from dybqm10.prod.google.com ([2002:a05:7301:670a:b0:385:6c3c:3ea1])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:152f:b0:381:c532:3d88
 with SMTP id 5a478bee46e88-3857093c38bmr360600eec.23.1795116334302; Thu, 19
 Nov 2026 11:25:34 -0800 (PST)
Date: Thu, 19 Nov 2026 11:25:12 -0800
In-Reply-To: <20261119192520.1983406-1-irogers@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261119192520.1983406-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261119192520.1983406-2-irogers@google.com>
Subject: [PATCH v4 1/9] Compiler Attributes: Add __must_init macro
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
X-CRM114-CacheID: sfid-20261119_112536_425519_DF7664EF 
X-CRM114-Status: GOOD (  13.47  )
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
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Clang supports the 'require_explicit_initialization' attribute on struct
fields to indicate that a field must be initialized explicitly by the
user when the object is constructed. When an aggregate initializer or
uninitialized variable omits an annotated field, Clang emits a
-Wuninitialized-explicit-init warning (enabled by default).

Add the __must_init macro to include/linux/compiler_attributes.h (which
is included by include/linux/compiler_types.h and
include/linux/compiler.h) so kernel structs with error-prone
initialization (such as mandatory callbacks or cleanup handlers) can
enforce explicit initialization at compile time, as discussed at the
Linux Plumbers Conference. The shorter __must_init spelling, rather than
the attribute's full name, keeps annotated struct members readable and
was suggested by Greg Kroah-Hartman.

Note that Clang versions prior to the fix for
https://github.com/llvm/llvm-project/issues/232483 do not diagnose
file-scope objects declared without any initializer (initializers at
file scope that omit the field are diagnosed).

Also teach Sphinx (Documentation/conf.py), kernel-doc
(tools/lib/python/kdoc/xforms_lists.py), and checkpatch.pl about the new
attribute macro.

Link: https://lpc.events/event/20/contributions/2392/
Link: https://lore.kernel.org/lkml/2026101532-fantastic-deafness-e04c@gregkh/
Acked-by: Miguel Ojeda <ojeda@kernel.org>
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Kees Cook <kees@kernel.org>
Signed-off-by: Ian Rogers <irogers@google.com>
---
 Documentation/conf.py                 |  1 +
 include/linux/compiler_attributes.h   | 12 ++++++++++++
 scripts/checkpatch.pl                 |  1 +
 tools/lib/python/kdoc/xforms_lists.py |  1 +
 4 files changed, 15 insertions(+)

diff --git a/Documentation/conf.py b/Documentation/conf.py
index 5ab26ce89daf..baaa4035258c 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -203,6 +203,7 @@ c_id_attributes = [
     "__noreturn",
     "__packed",
     "__pure",
+    "__must_init",
     "__section",
     "__always_unused",
     "__maybe_unused",
diff --git a/include/linux/compiler_attributes.h b/include/linux/compiler_attributes.h
index 476c4c560d17..b9c0b56dd22e 100644
--- a/include/linux/compiler_attributes.h
+++ b/include/linux/compiler_attributes.h
@@ -322,6 +322,18 @@
  */
 #define __pure                          __attribute__((__pure__))
 
+/*
+ * Optional: not supported by gcc
+ * Optional: only supported since clang >= 20.0
+ *
+ * clang: https://clang.llvm.org/docs/AttributeReference.html#require-explicit-initialization
+ */
+#if __has_attribute(__require_explicit_initialization__)
+# define __must_init __attribute__((__require_explicit_initialization__))
+#else
+# define __must_init
+#endif
+
 /*
  *   gcc: https://gcc.gnu.org/onlinedocs/gcc/Common-Function-Attributes.html#index-section-function-attribute
  *   gcc: https://gcc.gnu.org/onlinedocs/gcc/Common-Variable-Attributes.html#index-section-variable-attribute
diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index b8b64f720191..6a091c45b1a1 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -6888,6 +6888,7 @@ sub process {
 				"noreturn"			=> "__noreturn",
 				"packed"			=> "__packed",
 				"pure"				=> "__pure",
+				"require_explicit_initialization" => "__must_init",
 				"section"			=> "__section",
 				"used"				=> "__used",
 				"weak"				=> "__weak"
diff --git a/tools/lib/python/kdoc/xforms_lists.py b/tools/lib/python/kdoc/xforms_lists.py
index db23fb650ea8..42956b98aae3 100644
--- a/tools/lib/python/kdoc/xforms_lists.py
+++ b/tools/lib/python/kdoc/xforms_lists.py
@@ -36,6 +36,7 @@ class CTransforms:
         (CMatch("CRYPTO_MINALIGN_ATTR"), ""),
         (CMatch("__private"), ""),
         (CMatch("__rcu"), ""),
+        (CMatch("__must_init"), ""),
         (CMatch("____cacheline_aligned_in_smp"), ""),
         (CMatch("____cacheline_aligned"), ""),
         (CMatch("__cacheline_group_(?:begin|end)"), ""),
-- 
2.56.1.708.g77570a6a1d-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
