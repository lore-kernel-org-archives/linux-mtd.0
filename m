Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60F22CC6B1E
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Oct 2026 22:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=9sE/4FS0D8k1SlpKO9/WriwBD3XKDgTq6xKJp3k/44s=; b=w0KA/AO+1inF2n58bZDimYTpXh
	A05YU3dfnSEIUYbq0/A7kNuyYa7C6eVQUdQyyFgwI+RDVHrPruKZh/aCp8utjPDmlC29tkE7klooG
	Xd7VL/TXRI4oUEU8GLr46tRNPbw3vkE0be2UWePloEwyzltnH97iCphj0AfaWfPuEiNmUVvQ0LrfM
	48Xn71bY08YjEx3HV7vVsXuEs8w1pkMUvJ4bkVbPZkSBkGMjIGB8QHA3L1yuujwArdddxVoJWAQFy
	yQAyXIW4l05VauOYDLxqkUjU6/DBh1faVmYZ3MsREM1XwLd3wVknjmyJw+8APQSCpI44ZzsQoNG3s
	D0i1CGvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGlAf-0000000E9aI-3jLi;
	Tue, 13 Oct 2026 22:40:33 +0000
Received: from mail-dy1-x1346.google.com ([2607:f8b0:4864:20::1346])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGlAd-0000000E9Vj-1inq
	for linux-mtd@lists.infradead.org;
	Tue, 13 Oct 2026 22:40:32 +0000
Received: by mail-dy1-x1346.google.com with SMTP id 5a478bee46e88-3580c07911eso9020098eec.0
        for <linux-mtd@lists.infradead.org>; Tue, 13 Oct 2026 15:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791931229; x=1792536029; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SzuEQJa4uF6wSn0s7ZpxNvjcEHFt9KB4NkbiARikmlQ=;
        b=UemEA5Ru1AFQrat9819q134aADepxP6XFpJgo8QZ1AxUDafa2yTkizqrlEZehsszl0
         TtxxG56vMVtVt6cPX6JRgDk5C33dc0szDAEer6uL20ajeg4n3eaG1Sl/O4DR0hAxVq17
         wx4lCX8FacDcoVjHOoUnIXZrFedPyCosHRqAagBEIM2dlcXKl6+B29nChdZumkDVRQW+
         aWMZppvyJ5h9xDmcSOYByd2S5LShD99dWysdwHYhzaKEjtpOskdcr/2XyCViDvQ2hZkY
         BbIx8kCf30IV5a31Y8AWJqdsmvEBPKAzdw5vYLJ9X2ZQciap8fe2BvrbwP1SbwJrfdyO
         ZLWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791931229; x=1792536029;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SzuEQJa4uF6wSn0s7ZpxNvjcEHFt9KB4NkbiARikmlQ=;
        b=FdlSVGcsj1d+7ifKBZhAgTZnzVki4Qlfc5wSZKFnO1bXkpD6ETHNtCl6cOJkgTvfMI
         GhHntzVyZEvtfcYfLYAPU/UHZDnK5SmBMWwFEkZsB/yntkobcKOlCLodRgEW6QD6hJmZ
         Bt0gwPV3J3v6WQa3wIeZku/TZYlmAflalEyuX52sB2zPLHzVlkz0CcTGgMzYzkcazLr3
         4j1p4AFJ21mumdB7kqcPjjUiWSfdPJxAgTCtpjR26LZlgC/Y53edBnjQnA53eT/9iHtf
         KqtQI2LRYUGimOdpSJYo9qbaiXas0C96gdPdYj6wk/pkSanYTqMzFuLP/whYW9wRUz0k
         nspw==
X-Forwarded-Encrypted: i=1; AKwUvBzbh9TiT3SjVZQOsT5PHwVsIFf/GxXGGJwuG3nFz1QyEbYX0id9U+Frpizd5zWeRmrzpIaL1nbj5fU=@lists.infradead.org
X-Gm-Message-State: AFq9FYKbmqUc8JwswdIIm6/Yn2KHf6zhW2M+iSXAiAgTk7drrovv+NYf
	aMaHQXCWAnVtuHEKIzFqPyYRAEviIICKQzo7ufAfXekjjUIhLMx+spG+apdbyI+0JtEGBhecGtn
	XY6/PxEW8HQ==
X-Received: from dybmf44.prod.google.com ([2002:a05:7301:92c:b0:358:41fa:f46f])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:c8c2:b0:35a:8dad:6724
 with SMTP id 5a478bee46e88-35a8dad7ec8mr9213311eec.22.1791931228757; Tue, 13
 Oct 2026 15:40:28 -0700 (PDT)
Date: Tue, 13 Oct 2026 15:39:42 -0700
In-Reply-To: <20261013223946.1836757-1-irogers@google.com>
Mime-Version: 1.0
References: <20261013223946.1836757-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261013223946.1836757-8-irogers@google.com>
Subject: [PATCH 07/11] xen/sys-hypervisor: Add release callback to hyp_sysfs_kobj_type
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
X-CRM114-CacheID: sfid-20261013_154031_489128_79AB43B8 
X-CRM114-Status: GOOD (  11.18  )
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

hypervisor_init() in drivers/base/hypervisor.c creates hypervisor_kobj
with kobject_create_and_add() (which allocates a dynamic kobject using
dynamic_kobj_ktype), and hypervisor_subsys_init() in
drivers/xen/sys-hypervisor.c then overwrites hypervisor_kobj->ktype with
&hyp_sysfs_kobj_type, which had no .release callback.

Add hyp_sysfs_release() calling kfree(kobj) to preserve the dynamic
kobject release behavior.

Fixes: cff7e81b3dd7 ("xen: add /sys/hypervisor support")
Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/xen/sys-hypervisor.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/xen/sys-hypervisor.c b/drivers/xen/sys-hypervisor.c
index 91923242a5ae..0e8a2cd69fd6 100644
--- a/drivers/xen/sys-hypervisor.c
+++ b/drivers/xen/sys-hypervisor.c
@@ -659,7 +659,13 @@ static const struct sysfs_ops hyp_sysfs_ops = {
 	.store = hyp_sysfs_store,
 };
 
+static void hyp_sysfs_release(struct kobject *kobj)
+{
+	kfree(kobj);
+}
+
 static const struct kobj_type hyp_sysfs_kobj_type = {
+	.release = hyp_sysfs_release,
 	.sysfs_ops = &hyp_sysfs_ops,
 };
 
-- 
2.56.0.385.gd3acb90ef8-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
