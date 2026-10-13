Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33344CC6B1F
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Oct 2026 22:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=mwgvJ57NqLLUGEFwqPxshoJwC0Hdi/UuLJsiYlfYlyI=; b=LsjXTGZBx7Oo1UPdJnFdnW9G5f
	Xv6D07FDZlEuqv/OIGDSQwuSg/RWp+xFyEqUvO6Frkrx73ZmGJZiD6k62xtxHrsnz15m2BpJJuwT5
	ugCLQYzv34onTrn0FD00ZLjAYKJehVLQaugn4m1K1J9sp5Hu4a6bQWYNA7bjNwVHSOd9Ihm36OtDj
	rMhpuaRdrg5mZnFBfiStgoT9ZneDo2TWl80ybC3JS00U9grt8q5+SnggYcAoKfNiHo77zJsZOAGhF
	BJD+12baLDmp+PGpzAsdJbVlV6aQhM9pmMWgMuGeowE7A+TLj1dpKk1ycF4hY6fdV1gE0O9aNiLtw
	OELZPkhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGlB3-0000000E9kX-2QGM;
	Tue, 13 Oct 2026 22:40:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGlAp-0000000E9hO-2mjM
	for linux-mtd@bombadil.infradead.org;
	Tue, 13 Oct 2026 22:40:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=gurzTkqqRagMZrBgJFBCVz7i93uSa3r8+lp0iuHqO9A=; b=puvzvhJGetuYIDxU02kh6W/+cs
	53wFm1Wx18M09saDb5x0uJXHVZmSY3/eJfx7+gHET1QTM8D1D8OvXwbhSQISvcH9AZnzcLFIJAvFR
	2qgAbUp1jqSkAKvgKcL3w3xTJTgi+9gckUq7Ng3KfWdbg6+fU1iVfpSv/uy3lBfmH7m78vJG1X0Jf
	HVaCDSWEuA5l+mkdp/56/AFdy7KTkQZErv/2apUMk7pjjIt3KrO7KrugksaVN8k+inGUs8vUIUdqT
	zgIrWihMnkBuWuI34m/ZuJ9uxl/m7bfVDSvXeAqdjj8s3NtctIB5zASPZa2SwTFriYXDcO0gSAvYu
	8S7gaaZg==;
Received: from mail-dy1-x1348.google.com ([2607:f8b0:4864:20::1348])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGlAk-0000000G9or-2Kra
	for linux-mtd@lists.infradead.org;
	Tue, 13 Oct 2026 22:40:40 +0000
Received: by mail-dy1-x1348.google.com with SMTP id 5a478bee46e88-30c0d568830so7230971eec.1
        for <linux-mtd@lists.infradead.org>; Tue, 13 Oct 2026 15:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791931236; x=1792536036; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gurzTkqqRagMZrBgJFBCVz7i93uSa3r8+lp0iuHqO9A=;
        b=otLBJVR794WAeKeP+nY3cyW1aRH6L2tcZmbN0Xp+s07BNuJ4Bao1FA3N1eZMOVe9r9
         jWifbTFrDF8D0F62ddhNCQduYKW3nfEgD+zBvxMeJprhaDi3GTcVQmfALKIl0hnRjcrc
         b+sr1oNETiDWBWb+HijJWoOKsv+1ExebT4u0ZgyCMI3DFawWLlhBfo8vrB/8z71jHkwC
         pGnR07Oc1ohi85WVlTYchyqbvFdmCsOmJwgMbcLwf6vMwQdhBVlFoKX1R0AWy8nauWzR
         AvwtJWZknz4RkYuoZSDgGp9Fyi1QArQ7KHlkV/k16MgGSLXiFwDHwfNLnO98yIOB00SC
         0sQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791931236; x=1792536036;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gurzTkqqRagMZrBgJFBCVz7i93uSa3r8+lp0iuHqO9A=;
        b=EwVoKrxJmDdibfvgZ+0BKQY1pXm7Ej+4o1562HfPuhA6nQGRjrjH7UBlFq3eIuV3lV
         wou9/ELEMCpbfGUE1xoSXVGE4VZEdSo0aloVf5ZNeLhdcW+gx+7faHfoogbK+KEu6XVH
         Y6E34THvKtPSNDJgcdJ/wS9j26j/cGJ+e/9OS0Odom5FZv3BdDPSlsT788ly9IbVWjKF
         tr+16tajqwUlXfWgrBFWOcyelbssPEObXi6iYR16vycyGU30uRSIOekxD+lxksN8sjfn
         t7aKoEGA2j2sbploxPMU2ol8vC4bQI3g3otuJF+1SUnHkmZuwqrJ4a6d7eMUN1sOSU3N
         Sg+g==
X-Forwarded-Encrypted: i=1; AKwUvByaxWAO+tBadRRnN+cIbwGu/xjwHFcgaBTYdIcFdHmqj8JjC0t8FH8ODQxOmSa5U2/9Ga+UjX3ojl8=@lists.infradead.org
X-Gm-Message-State: AFq9FYJtgYvPwJfVthNSOpavsQXNDIIJ1G6k+7TiaDJgbGMZvzUjXH8I
	eZOD2HxTFYyGz35VkNu1q6HpboaqcwJkKCmYT0bnuXh8EEkpTkqHEh2MIOJp1KYDBGhXkLkoxHX
	KDSwZtFBAZg==
X-Received: from dleg6-n1.prod.google.com ([2002:a05:701b:4306:10b0:160:bb23:390d])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:4586:20b0:169:b1b1:1445
 with SMTP id a92af1059eb24-16a5dbfe73dmr17947821c88.31.1791931232672; Tue, 13
 Oct 2026 15:40:32 -0700 (PDT)
Date: Tue, 13 Oct 2026 15:39:44 -0700
In-Reply-To: <20261013223946.1836757-1-irogers@google.com>
Mime-Version: 1.0
References: <20261013223946.1836757-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261013223946.1836757-10-irogers@google.com>
Subject: [PATCH 09/11] ubifs: sysfs: Use kset_create_and_add() for ubifs_kset
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
X-CRM114-CacheID: sfid-20261013_234038_900510_ADAEA608 
X-CRM114-Status: GOOD (  15.24  )
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

ubifs_kset was a static struct kset using a custom ubifs_ktype that
had no default_groups and no .release callback. With
CONFIG_DEBUG_KOBJECT_RELEASE=y, unloading the ubifs module while delayed
kobject release is pending causes a use-after-free on the static kset.

Replace the static ubifs_kset and empty ubifs_ktype with a dynamically
allocated kset via kset_create_and_add().

Fixes: 203a55f04f66 ("ubifs: Fix memory leak in ubifs_sysfs_init()")
Assisted-by: Antigravity:gemini-3.1-pro
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
2.56.0.385.gd3acb90ef8-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
