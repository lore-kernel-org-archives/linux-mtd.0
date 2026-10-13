Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9760BCC6B1D
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Oct 2026 22:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Vy0xORtCsp7uhoTraK4kFzaCtFbimfEXgsAcYRbpks4=; b=2RONGecR9x+jtwYch7zscCHhX/
	U2dr4s62wjYsb/2j+sBz/WntnEEKRFDaAwqRfloEzQARB5hgYDC4FXQ4dKcpmhuAg6f4zA7lA0ySF
	T+8I5n3TC3CxJZncIlKMPx9cpUkqMGX66PeHUhQFwWnvMJFJdmzyLogD0kQb+VMFLovXP+1fxIqMR
	tD4zs6TihjoalafcE6BWLtJRse4cft3S+dJBemMEjUafMaXeIUXBA1ulW8zmB7uC7nwo8lHD2BAlD
	N1uOrJucfzRfvm3mi5XGTxN2GExsitEwD+KkD71dMU6F7dI1YELIIqtedOdRBpQq6U2YhW5+5ZMta
	2+9IBRaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGlAt-0000000E9k6-0GbV;
	Tue, 13 Oct 2026 22:40:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGlAq-0000000E9hS-06ze
	for linux-mtd@bombadil.infradead.org;
	Tue, 13 Oct 2026 22:40:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=5eLIAAx2L+9DvCRKYW0jDBbtdiyv3jUNIhafttj/B0g=; b=Va/sUd6rLhztzCegxMK90J3lzC
	ln5FNc2WmkctRnPWnG+F1yR6YVW/GDw57Cdqea8z0SulyTpf+/KnfhY4ullzjufkf9WhQR5MWwdOz
	mUYAJHtkOGaaOyb1w31hnWvy1lNyLLZUJCGMJfAtYN8+EcSJeWjbgp85NIcfrGdDu8xfO63deVIBn
	TVbhxrHSM+ObHe6mczzPCNPQ1eFGHW7UoVJesBwkRNwOQL5W+6oRvaQkf4LuJxnhUKEp270EgjeXv
	W+tlt+guLODOt8rj3TUar4klvYpEyTxg2T+NpFATf1vyr2NvfGNO1HEr+u08Nd8j9NYEegNFG8/J6
	prJjSGPw==;
Received: from mail-dy1-x1348.google.com ([2607:f8b0:4864:20::1348])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGlAk-0000000G9oq-21io
	for linux-mtd@lists.infradead.org;
	Tue, 13 Oct 2026 22:40:40 +0000
Received: by mail-dy1-x1348.google.com with SMTP id 5a478bee46e88-357e2bc3b1bso5884417eec.0
        for <linux-mtd@lists.infradead.org>; Tue, 13 Oct 2026 15:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791931236; x=1792536036; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5eLIAAx2L+9DvCRKYW0jDBbtdiyv3jUNIhafttj/B0g=;
        b=P2l0dK0AmVOOABXGpy4gjItKD9GHsq8EpCNsxJEhLJacRYM4117WSYuvjnYPvvO6si
         B/LT61t3ARcykJW/mCx7OGPd+Uv4R7luRWvS3jF28G6daWknNFrtfEfCZX/4C99aFNyR
         L23dPy98SvbcHHd9fMg0pe1Uu/LKR3U9A51ZjDTVAa8XMuzKLzfnb1QEztbE8ZElLx0c
         oYz7UlGiaofkO2KZJLb9tIfVOnGr2A4v+sZalR18xAs39Igq5+gqWvorInCaf9CSrhxu
         jbysNPqC49muXmAB99grG6Kv6Pzwi3AtdI3/aDKEOcsEFEC9v5sGxLvx/bn/PGVdVJkG
         rXZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791931236; x=1792536036;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5eLIAAx2L+9DvCRKYW0jDBbtdiyv3jUNIhafttj/B0g=;
        b=BewekVPtzqsHuCS+wv+1vTnHpTcv7gqysWA79FGpy7B868pg8r2rXBkDxHQ/xX/VAw
         kf9K4CHFkKk4g/vGXrSMhEh0xPPHpYWs6aRBPq8edRc+4iUkZI5LqJsZlqdVErrgbKPS
         4pGYPL6xVHshbLIQrxFn/eeLpHHa8a/VSYaxkEH9tOjQZaEiTzoDUIR80ArTKslCDAje
         UUv9YoKoldyEhKXEToQYqxpd0CUunyBDZm/74re+Xg9kK1hZ4na79KrACak1VGiKwNk4
         NcFNlMfxbwdF3EKItOEn1tpfdw2zMmHRslbl0fRV5bGG9WoEX5aGXb02G4cwUQe9UB7Y
         8h/Q==
X-Forwarded-Encrypted: i=1; AKwUvBwtJOVL0FRtRZBYWQ1Hn/X/q0NyFmMXbCXzKGMNZv1Fi/Sr4LYCE6yN+ButJ+ZBcA1HP5fnzujSK/k=@lists.infradead.org
X-Gm-Message-State: AFq9FYJmFvFTek4QMpvGzGyYi7NaHrPuic7J3f3lNQHGfralU02gN/eU
	Z0dDd/d3nkZ0rOLXwHGlYVIxCt+CYWRSD2eymFJK6Fh/yFzp2bTV4lJy23wxfPaAjgvgBIN48yw
	okoppUzTCpA==
X-Received: from dlbuu9.prod.google.com ([2002:a05:7022:7e89:b0:16c:bd18:1ee2])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:231b:b0:165:55e2:2d69
 with SMTP id a92af1059eb24-16a640fcc35mr21018967c88.46.1791931235508; Tue, 13
 Oct 2026 15:40:35 -0700 (PDT)
Date: Tue, 13 Oct 2026 15:39:45 -0700
In-Reply-To: <20261013223946.1836757-1-irogers@google.com>
Mime-Version: 1.0
References: <20261013223946.1836757-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261013223946.1836757-11-irogers@google.com>
Subject: [PATCH 10/11] drm/amdkfd: Free queue in procfs_queue_type kobject
 release callback
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
X-CRM114-CacheID: sfid-20261013_234038_779159_840F8DC4 
X-CRM114-Status: GOOD (  15.45  )
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

struct queue embeds a struct kobject (q->kobj) for procfs entries, but
procfs_queue_type had no .release callback and uninit_queue() freed q
immediately after kfd_procfs_del_queue() called kobject_put(&q->kobj).
With CONFIG_DEBUG_KOBJECT_RELEASE=y, this causes a use-after-free.

Add kfd_procfs_queue_release() to free struct queue from the kobject
release callback, change kfd_procfs_del_queue() to only remove the
kobject from sysfs via kobject_del(), and drop the final reference in
uninit_queue() via kobject_put().

Fixes: 6d220a7e7971 ("drm/amdkfd: Add queue information to sysfs")
Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_process.c | 10 ++++++++--
 drivers/gpu/drm/amd/amdkfd/kfd_queue.c   |  5 ++++-
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index 0a7c1900da95..6099cb893573 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -510,7 +510,15 @@ static const struct sysfs_ops procfs_queue_ops = {
 	.show = kfd_procfs_queue_show,
 };
 
+static void kfd_procfs_queue_release(struct kobject *kobj)
+{
+	struct queue *q = container_of(kobj, struct queue, kobj);
+
+	kfree(q);
+}
+
 static const struct kobj_type procfs_queue_type = {
+	.release = kfd_procfs_queue_release,
 	.sysfs_ops = &procfs_queue_ops,
 	.default_groups = procfs_queue_groups,
 };
@@ -550,7 +558,6 @@ int kfd_procfs_add_queue(struct queue *q)
 	if (ret < 0) {
 		pr_warn("Creating proc/<pid>/queues/%u failed",
 			q->properties.queue_id);
-		kobject_put(&q->kobj);
 		return ret;
 	}
 
@@ -699,7 +706,6 @@ void kfd_procfs_del_queue(struct queue *q)
 		return;
 
 	kobject_del(&q->kobj);
-	kobject_put(&q->kobj);
 }
 
 int kfd_process_create_wq(void)
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_queue.c b/drivers/gpu/drm/amd/amdkfd/kfd_queue.c
index 15eeaaebbbcd..8d1afc5b47e2 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_queue.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_queue.c
@@ -83,7 +83,10 @@ int init_queue(struct queue **q, const struct queue_properties *properties)
 
 void uninit_queue(struct queue *q)
 {
-	kfree(q);
+	if (q && q->kobj.state_initialized)
+		kobject_put(&q->kobj);
+	else
+		kfree(q);
 }
 
 #if IS_ENABLED(CONFIG_HSA_AMD_SVM)
-- 
2.56.0.385.gd3acb90ef8-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
