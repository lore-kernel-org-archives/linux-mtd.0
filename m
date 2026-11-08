Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99ACB606D817
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Nov 2026 22:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KLOEXJZQ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jz/HtmUr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=VNL6/riqohyl1zq8K7Bw5kW6SoiQPVPVb3ASy5tB/MY=; b=KLOEXJZQ8RN/vEL06yzBeDbQVc
	DpTBn/jTuNDSVd8nHVnhZdTev5Ez48p4Auq91LgXXZ2PKiDluObrvLEztEEYd54EebEafiGPXF03i
	24h9X7KbZ6sNuLF3yWHWprlc4560LcIgFiAj7vDsbFkiQxgJHOhFIpTJPd9p0fGZyGJ0NBLB0xrey
	v/n90dnQqn/sOUcDS/IyYlAO+xsBcUthdlmmhluja3mOjcncmvWrgS/g/ActkY0cStKBv1RROQyX8
	i48fToiFFoOeavm/aH7ZncC3gv/9OPavlqiiLx3KJr+MKC3u5ARgjFLGZjW+Kg8hv2XeVYNRrpThp
	n+cUCDNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQBYC-0000000GpyN-1SkT;
	Sun, 08 Nov 2026 22:39:48 +0000
Received: from mail-dy1-x1345.google.com ([2607:f8b0:4864:20::1345])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQBY9-0000000GpwQ-2TAd
	for linux-mtd@lists.infradead.org;
	Sun, 08 Nov 2026 22:39:46 +0000
Received: by mail-dy1-x1345.google.com with SMTP id 5a478bee46e88-370230d93efso689853eec.1
        for <linux-mtd@lists.infradead.org>; Sun, 08 Nov 2026 14:39:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794177584; x=1794782384; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4kX4Ed3A+P912IudIYmkHnIS6SHmJhWXUKLWP4ZNJ5k=;
        b=jz/HtmUrC04AwvFDC8q27oljQNMBcrjy0w+kJaBWV1zzg3w7JUR9JjHs7tBNKn/tF0
         rTBIaO15nXiZFaHJ93/OE7oJ8G56Lczf9/MP5m2qOv9qiWl8MdZ7UHdVZFp7ef5LThkP
         igD7N/5jQeumZr7sp5wGhHq4xcg/+QiPAVhMasDD2AQ6gEy6xtR+o4WU9AWOLONVNqlm
         ucbUbt27PLkhlb6oiaSguS8qIzAUB41RxEULSRrh+IhjOFIq7ZrQAYaZ9bOe0PZoA675
         eb7Vak1NIfmgXJ/8AdDUU3Fe7DwC6C/yHiUs8sRCpMWEBr38WExNe6OsXLohLdgNlC1V
         n9qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794177584; x=1794782384;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4kX4Ed3A+P912IudIYmkHnIS6SHmJhWXUKLWP4ZNJ5k=;
        b=AKh75yBaZPM39YNhI/tvRm0AVu7dnlM3uLfV0Ndz+ypqQiAar9j0N3iY0NYPfFK9An
         H73sGPLOysvbKpTfURisT0oBRa9/cG3noqzlfxHIFDFrW17lxGmEfRODS3cuEjD5mpyF
         pa3aCeIcKbDVmD7s6QSC9yzvKyvFtfdRX/aXCRBcPaMxi2bgh/dP0tKyP/UmvAbiFz4s
         zh1LwHCOLFn8c3sEj86XvFUc7ma9Y9hxO0XgCd5NjZMOD9ROWI3mz6Z+yTDBjXbTz4Tx
         5aZjKzX5vrsT50RyBIKGIsGxXWY416Q3yvfLNW2m+mpDApCdC+drI8XJPA+ufjng9C1h
         6doA==
X-Forwarded-Encrypted: i=1; AL+hErGdWSnnFFZbeuB0rnZl4H26Ms09PBeSnE7rLS85P/qniPM3zG3OFWpjcSEenniXtw+WKZOu+PJ28XA=@lists.infradead.org
X-Gm-Message-State: APuU4Z8Qt6sIyc5Ar2CacNNbt3HWtGAl9JVSSI0035m/FqgfVXFiGVas
	iFg9i6C3M730/1h7DdeOZvl/c251KTLcn2zhL4JL/6bGj9nC9pVrqyyvgVi5f/V3XpxwjSzXWhT
	CYyRX5bAVJw==
X-Received: from dlad1.prod.google.com ([2002:a05:701b:2201:b0:1b2:6421:f4fb])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:ea8a:b0:163:bee9:b250
 with SMTP id a92af1059eb24-1b39fedbec2mr3348910c88.22.1794177583902; Sun, 08
 Nov 2026 14:39:43 -0800 (PST)
Date: Sun,  8 Nov 2026 14:39:06 -0800
In-Reply-To: <20261108223913.3624571-1-irogers@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261108223913.3624571-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261108223913.3624571-3-irogers@google.com>
Subject: [PATCH v3 2/9] powerpc/secvar: Add missing kobject release callback
 to secvar_ktype
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
X-CRM114-CacheID: sfid-20261108_143945_633767_405A4564 
X-CRM114-Status: GOOD (  10.52  )
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

In add_var(), a struct kobject is dynamically allocated with
kzalloc_obj() and initialized with secvar_ktype. If kobject_add() or
sysfs_create_file() fails, kobject_put(kobj) is called to clean up.
However, secvar_ktype does not define a .release callback, which results
in a memory leak of kobj (and a pr_debug warning in kobject_cleanup()
when CONFIG_DEBUG_KOBJECT_RELEASE is enabled).

Provide a secvar_release() callback that calls kfree(kobj).

Fixes: bd5d9c743d38 ("powerpc: expose secure variables to userspace via sysfs")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 arch/powerpc/kernel/secvar-sysfs.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/powerpc/kernel/secvar-sysfs.c b/arch/powerpc/kernel/secvar-sysfs.c
index 395399bbab2c..f3f6ac25ea78 100644
--- a/arch/powerpc/kernel/secvar-sysfs.c
+++ b/arch/powerpc/kernel/secvar-sysfs.c
@@ -126,7 +126,13 @@ static const struct attribute_group secvar_attr_group = {
 };
 __ATTRIBUTE_GROUPS(secvar_attr);
 
+static void secvar_release(struct kobject *kobj)
+{
+	kfree(kobj);
+}
+
 static const struct kobj_type secvar_ktype = {
+	.release	= secvar_release,
 	.sysfs_ops	= &kobj_sysfs_ops,
 	.default_groups = secvar_attr_groups,
 };
-- 
2.56.0.455.g6c5a503b38-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
