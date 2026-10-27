Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0B360A263F
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Oct 2026 22:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cV31tumO;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=n9SC05o8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Unsubscribe-Post:List-Owner;
	bh=ZV07jJ0l2A0pAzSVUyssun4dreSmMfCLBvsbii0ZZG8=; b=cV31tumOJRuJpm08aj7lRmmw93
	/1Ot239u6Cs4VFAappsQRGmLrd9T5FtyLZJKwv+DAjEpVmVeDMy3cfI8k0JFkK1lLajGpHa9doxMw
	o/xtTHXNLQg8pzkoh1/tjxEooO0Tmksvun9wX+3+t41uvc45R/d+jDpSg1MmULL7FbNtds46rcSwE
	ABgme92QpDXYlma2KrLUuLTfA72rtJngLpiWoao+QTxANqjKkVgMcirVCZYiUDfnGyzgcTZpjX/Nl
	MfdgOXf9oi9zFwLTnEReLictSVdK36gAX4NE5NSLeaX0gX9b0aX/SKh1HjbaVIUE6FVmyf/oYqvGc
	Jgd9reWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLpp7-00000005qzx-45k0;
	Tue, 27 Oct 2026 22:39:18 +0000
Received: from mail-dl1-x1247.google.com ([2607:f8b0:4864:20::1247])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLpp1-00000005qzF-27xr
	for linux-mtd@lists.infradead.org;
	Tue, 27 Oct 2026 22:39:13 +0000
Received: by mail-dl1-x1247.google.com with SMTP id a92af1059eb24-1a2f2ea3c3cso596003c88.0
        for <linux-mtd@lists.infradead.org>; Tue, 27 Oct 2026 15:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793140749; x=1793745549; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pEmx5PL3tlnBiGr2rjVOl0G+YHkBW7VB5cziBEiH9l0=;
        b=n9SC05o8KnCQLDceaLzt1U08Z6hEd5XCTNFzTmA+W3aXMXSeseG0dzspUOzm8ukNQ0
         FgXekX9VLWPIHfYK1tkzFbKn8ppHYO6cejkZQZ55ZZ5AR/Nj5Dz7vSp6jBvrKgn+24Wk
         qV9cv3OUHPVAQgWHa2ZNCBLeHRvTjvateNxsNzGgcG+5E/54yKmzE3dOPM8z2WqS6Xrz
         e27ewR17Srl+RtjV3UQ1tOsH58+UmyhrzaYqBdal+qCTmM/NMFS3XjyZynglV6o2Ma6A
         8a2c5icqfrtjz1Y9TpHCzDOqPBrJ+R5fsBh7Rhk37nwGfjDn7PqAaaD++z0MxjbW8f8U
         TuAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793140749; x=1793745549;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pEmx5PL3tlnBiGr2rjVOl0G+YHkBW7VB5cziBEiH9l0=;
        b=UqxJmjdaKNUYWPl87933nnoseR2lpWy6St8D4xXeye/OfI+kiSuc0grYgHvrvMQ6+u
         HAQyCaW1fQzjnCsgn3JfPBn4FKY10IwIpPGZxXbWwUbWPZ7UhPHWr6vIl/9/jg+F+SIP
         Izzz9yJROC0U+Q5uQhTNrFir1lFD6Te4n64TXPZb2Wl/niJtZxp+6PtcMctKn63PsWwV
         H901PUMikt2wrFfeU+jlwgu53qlDefPcjDe4cYl0DBgt5ykrDuaEVzHWRAvRvxV4/l6T
         ffDG86WJ8qXP9b7ERSwt/6M/qvpnyZCsKhqL9abFTfRLPpymZC9V21xDFBB3E6GsfBm1
         KPEg==
X-Forwarded-Encrypted: i=1; AKwUvBzLb8qjdyItZ8cakBXvwoZVZJ/FoNKpNadF0KPELctL39ws/2kdAa2bqD7pA5RiLWXNYYNCZN8Ji4s=@lists.infradead.org
X-Gm-Message-State: AFq9FYJDcbLj7S7U6LsUOXRRwQxoMsqT0kw+lcZPsZ/c4NU4f9ln+hgh
	vzwfrVVGJPpzQiDggY/g7Bx2qUfdPLhMV/jE7eQR14YZiXhfPqmPBYdJWyw6DpBbUE4CTMmfD94
	xOs+Y8bqcAw==
X-Received: from dli9.prod.google.com ([2002:a05:7022:289:b0:1a1:da78:f9b9])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:6989:b0:165:90af:a25f
 with SMTP id a92af1059eb24-1a6cfa0c447mr941563c88.41.1793140748444; Tue, 27
 Oct 2026 15:39:08 -0700 (PDT)
Date: Tue, 27 Oct 2026 15:38:35 -0700
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.313.g2479322e68-goog
Message-ID: <20261027223847.652884-1-irogers@google.com>
Subject: [PATCH v2 0/9] Add __must_init and require explicit kobj_type::release
From: Ian Rogers <irogers@google.com>
To: Kees Cook <kees@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, Zhihao Cheng <chengzhihao1@huawei.com>, 
	Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>, Sumanth Korikkar <sumanthk@linux.ibm.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, driver-core@lists.linux.dev, 
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-pm@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, 
	linux-s390@vger.kernel.org, gfs2@lists.linux.dev, 
	xen-devel@lists.xenproject.org, linux-mtd@lists.infradead.org, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Ian Rogers <irogers@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_153911_587292_74A8BC09 
X-CRM114-Status: GOOD (  19.77  )
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
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Clang supports the 'require_explicit_initialization' attribute on struct
fields to enforce that the field is explicitly initialized when an
aggregate object is constructed, emitting -Wuninitialized-explicit-init
(enabled by default) if the field is omitted.

Following discussion at the Linux Plumbers Conference [1], patch 1 adds
the attribute to include/linux/compiler_attributes.h as __must_init. In
v1 it was called __require_explicit_initialization. Kees picked up that
patch with a first seq_file user [2], and in that thread Greg suggested
the shorter __must_init spelling, which Kees and Miguel agreed to. As
the attribute did not land in the v7.4 merge window, Kees asked that
this series carry the renamed attribute. The Acked-by/Reviewed-by tags
on patch 1 were given for the original spelling; the rename is
mechanical.

As Documentation/core-api/kobject.rst notes:
  "One important point cannot be overstated: every kobject must have a
  release() method, and the kobject must persist (in a consistent state)
  until that method is called. If these constraints are not met, the
  code is flawed."

Annotating struct kobj_type::release caught struct kobj_type definitions
across the tree that omitted .release:
- Patches 2-8 fix struct kobj_type definitions where dynamically
  allocated kobjects, ksets, or enclosing structures were either leaked
  on kobject_put(), freed prematurely before kobject release, or missing
  proper static initializers.
- Patch 9 annotates struct kobj_type::release with __must_init and
  explicitly sets .release = NULL (with explanatory comments prefixed
  with "Pre-existing:") on the remaining legacy struct kobj_type
  definitions whose kobjects are static, per-CPU, permanent firmware
  structures, or embedded in devm- or parent-managed structures.

Note on tool use: An LLM coding assistant was used to help audit the
compiler diagnostics across the tree, draft the fixes and changelog
descriptions, and verify builds and review feedback.

Changes in v2:
- Rebased on v7.3-16928-g83f32c773255 (v7.4 merge window).
- Patch 1: Rename __require_explicit_initialization to __must_init per
  Greg Kroah-Hartman; document the Clang >= 20 requirement per Miguel
  Ojeda; note the Clang gap for file-scope objects without an
  initializer reported by Kees Cook; add tags from v1 and from Kees's
  posting.
- Move LLM assistance attribution from Assisted-by tags to this cover
  letter per commit 1e035297ffda ("docs: remove Assisted-by
  references").
- Patch 4 (cpufreq): Use "cpufreq: governor:" prefix, drop Fixes tag,
  fix typo, and remove the redundant runtime assignment in
  cpufreq_dbs_governor_init() per Zhongqiu Han.
- Dropped v1 patch 5 (ACPI: CPPC), already fixed upstream by
  commit 27954e29d7de ("ACPI: CPPC: Release CPC descriptors through
  kobject").
- Patch 5 (dlm): Call kobject_del() before dlm_recoverd_stop() in
  release_lockspace() and the new_lockspace() error path, and wait on a
  new ls_kobj_done completion before freeing the lockspace or dropping
  the module reference, avoiding races with delayed kobject release.
- Dropped v1 patch 8 (s390/sclp_mem) per Sumanth Korikkar: the
  /sys/firmware/memory/memoryX kobjects are permanent, so sclp_mem.c is
  folded into patch 9 with .release = NULL.
- Patch 7 (ubifs): Add Tested-by and Reviewed-by from Zhihao Cheng.
- Patch 8 (drm/amdkfd): Check q->kobj.state_in_sysfs before
  kobject_del() in kfd_procfs_del_queue().
- Patch 9 (kobject): Cover sclp_mem.c and the new amdgpu_ualink.c
  ualink_xcp_info_ktype, fix the overlay-sysfs.c comment, and prefix
  legacy .release = NULL comments with "Pre-existing:".
- Patch 9 (kobject): The ioat, kunpeng_hccs and omapfb display comments
  now say that the existing teardown can use-after-free under
  CONFIG_DEBUG_KOBJECT_RELEASE (reported by Sashiko). Fixing those
  drivers is left to follow-up patches.

v1: https://lore.kernel.org/all/20261013223946.1836757-1-irogers@google.com/
[1] https://lpc.events/event/20/contributions/2392/
[2] https://lore.kernel.org/lkml/20261014225811.i.852-kees@kernel.org/

Ian Rogers (9):
  Compiler Attributes: Add __must_init macro
  powerpc/secvar: Add missing kobject release callback to secvar_ktype
  sh: sq: Add missing kobject release callback to ktype_percpu_entry
  cpufreq: governor: Initialize kobj_type release callback statically
  dlm: Free dlm_ls in kobject release callback
  xen/sys-hypervisor: Add release callback to hyp_sysfs_kobj_type
  ubifs: sysfs: Use kset_create_and_add() for ubifs_kset
  drm/amdkfd: Free queue in procfs_queue_type kobject release callback
  kobject: Require explicit initialization of struct kobj_type::release

 Documentation/conf.py                         |  1 +
 arch/arm64/kernel/cpuinfo.c                   |  5 ++++
 arch/powerpc/kernel/secvar-sysfs.c            |  6 +++++
 arch/sh/kernel/cpu/sh4/sq.c                   |  6 +++++
 drivers/acpi/sysfs.c                          |  2 ++
 drivers/cpufreq/cpufreq_conservative.c        |  5 +++-
 drivers/cpufreq/cpufreq_governor.c            |  4 +--
 drivers/cpufreq/cpufreq_governor.h            |  1 +
 drivers/cpufreq/cpufreq_ondemand.c            |  5 +++-
 drivers/dma/ioat/sysfs.c                      |  7 +++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c    |  5 ++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c       | 10 +++++++
 drivers/gpu/drm/amd/amdkfd/kfd_process.c      | 12 ++++++---
 drivers/gpu/drm/amd/amdkfd/kfd_queue.c        |  5 +++-
 drivers/infiniband/hw/hfi1/sysfs.c            |  5 ++++
 drivers/infiniband/hw/usnic/usnic_ib_sysfs.c  |  2 ++
 drivers/parisc/pdc_stable.c                   |  5 ++++
 drivers/power/supply/ab8500_fg.c              |  5 ++++
 drivers/s390/char/sclp_mem.c                  |  2 ++
 drivers/soc/hisilicon/kunpeng_hccs.c          | 21 +++++++++++++++
 .../fbdev/omap2/omapfb/dss/display-sysfs.c    |  7 +++++
 .../fbdev/omap2/omapfb/dss/manager-sysfs.c    |  5 ++++
 .../fbdev/omap2/omapfb/dss/overlay-sysfs.c    |  5 ++++
 drivers/xen/sys-hypervisor.c                  |  6 +++++
 fs/dlm/dlm_internal.h                         |  1 +
 fs/dlm/lockspace.c                            | 26 ++++++++++++++-----
 fs/erofs/sysfs.c                              | 10 +++++++
 fs/f2fs/sysfs.c                               | 15 +++++++++++
 fs/ocfs2/cluster/masklog.c                    |  5 ++++
 fs/ubifs/sysfs.c                              | 24 +++++------------
 include/linux/compiler_attributes.h           | 12 +++++++++
 include/linux/kobject.h                       |  2 +-
 scripts/checkpatch.pl                         |  1 +
 tools/lib/python/kdoc/xforms_lists.py         |  1 +
 34 files changed, 202 insertions(+), 32 deletions(-)


base-commit: 83f32c773255720a661aa45d83e36278135f23f5
-- 
2.56.0.313.g2479322e68-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
