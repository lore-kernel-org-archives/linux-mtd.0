Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FBD3CC6B12
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Oct 2026 22:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=6VXMV9fk0+6Da7Hsp/EgF8LVoiEpic6VBRQG8PTL0R0=; b=G3v
	Ka7kUs4oDr9SHqCFHQaQ0CP7QNfOkpg9cI3KZE3Drb9/rh+ej6Zhfkaial+YIVEdbJntVv84y11XM
	/b3lJbXDlyZ473HWBba34elsL1hFby11XicYNhugXDbcXNa4xDdXDUOeJoKoVSEkVBYLUEAdNYsEP
	f93HluyFsmHRxvNKcN2v4/z5mKJWTC8br9ZOc0MVuX/AlDTrRtYBlyM/d6JSkQrKOfLeWfUrwxaSB
	0p1HMrrFFRfIFuOd/pTzAY36dlQX/eFCXSXQxBZ6SqB7ztY+iUDjCBzxgeyuPnWSM2Vk+B8rq0NF0
	4aAAn2aCjdd9asLOtr+WNKw8x2frWGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGlAS-0000000E9PI-0RvI;
	Tue, 13 Oct 2026 22:40:20 +0000
Received: from mail-dy1-x1346.google.com ([2607:f8b0:4864:20::1346])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGlAP-0000000E9Nv-1nmW
	for linux-mtd@lists.infradead.org;
	Tue, 13 Oct 2026 22:40:19 +0000
Received: by mail-dy1-x1346.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso7840283eec.1
        for <linux-mtd@lists.infradead.org>; Tue, 13 Oct 2026 15:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791931213; x=1792536013; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6CWZGGdh7JOQ6UqV1gxmMbPkjK0LPv1nbOU26QpmZ10=;
        b=hRzNWDWEFFV4cUJX6q1zhtyyrZdyPIPgKkTzFr5WWv2gUCaZnbYclJ8Vm07SJreM6n
         rYcoSglGBJwkRY6RUa1WUSSEMII09bQUERvzFRx5O6mlijNpCKlhq/9dTRYEHnkOC7Zn
         rUi8BEUmWpXNi0drDQ9oHwxKz5/e20KvyInkVV0vnFtsqicLk8N8S9n5dA90gWX258v8
         synduK+rlP0sV4U+ry8UhThLG/+wYgrOQJZuj8tVVrgEn7Bg9Tw25QBhTR/iO3DfBY4V
         ol+4Mg/r+7DxTK1OFOwpGMJQC5gy4xfZ+/I9Qm7RDyrvwLta8VsN1Nu9sRRS9TF1vbO3
         QccQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791931213; x=1792536013;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6CWZGGdh7JOQ6UqV1gxmMbPkjK0LPv1nbOU26QpmZ10=;
        b=Caz3jnoCq+aIT6F34KciUtctvg7U1Njn4jJ+31AYOKVpMEU4Mjk2V+hOMxVChgI9Vv
         DgZYfF0dV1RZ97pvzK6iRAk72Kz1wuGwrgkVL9VeJ6dmL+B1Kcfi28M5nCkgsVGnzFG1
         rsZtBKmDfXBQGGxk9uDhNIac2K7KqDdCbkfc2pIvaWE+9w+HdE+1IzrGSwYz2yQAdaHv
         ubDg5JAKViZrNERtejzTX616EhFpSWfQMYglsYWF0iJJsNFLd4mPRfTGHPBz5Rm+kURj
         ePnOx1/N8xDt0r4ldfV86abu8UM85PaScHIdWlnS0X1sv2Mf1/SV+ec1nGPoWuCVuEfl
         VFNg==
X-Forwarded-Encrypted: i=1; AKwUvBysYxyLyhKfQu/hvIvAW7CxEWzidXh5OGxRYmPmAi1ONFwV+1TrxxV+76t+hWl92SOgiyrx4+R5UOk=@lists.infradead.org
X-Gm-Message-State: AFq9FYJzqr2Wz8zGNQ5Z6nJGEtQFcUh4saMmDPntv/HG0O6Fod5YlPWG
	xmd9GJTin2lsW9Ok9OHhKhzaY1ah7bECk1oguOT82yisF4U4IbaEqwIxC9nRxhKDq5snU/LTIyz
	4mcc46V26jA==
X-Received: from dlak14.prod.google.com ([2002:a05:701b:290e:b0:14e:f9ab:6f83])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:2309:b0:153:7a27:b89
 with SMTP id a92af1059eb24-16a5ed4008cmr22709999c88.21.1791931212336; Tue, 13
 Oct 2026 15:40:12 -0700 (PDT)
Date: Tue, 13 Oct 2026 15:39:35 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261013223946.1836757-1-irogers@google.com>
Subject: [PATCH 00/11] kobject: Require explicit initialization of struct kobj_type::release
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
X-CRM114-CacheID: sfid-20261013_154017_521314_E0756119 
X-CRM114-Status: GOOD (  12.47  )
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
fields to enforce that the field is explicitly initialized when an
aggregate object is constructed, emitting -Wuninitialized-explicit-init
(enabled by default) if the field is omitted.

Following discussion at the Linux Plumbers Conference [1], this series
introduces __require_explicit_initialization in
include/linux/compiler_attributes.h and applies it to
struct kobj_type::release.

As Documentation/core-api/kobject.rst notes:
  "One important point cannot be overstated: every kobject must have a
  release() method, and the kobject must persist (in a consistent state)
  until that method is called. If these constraints are not met, the code
  is flawed."

Annotating struct kobj_type::release caught 30 struct kobj_type
definitions across the tree that omitted .release:
- Patches 2-10 fix 10 struct kobj_type definitions where dynamically
  allocated kobjects, ksets, or enclosing structures were either leaked on
  kobject_put() or freed prematurely before kobject release (risking a
  use-after-free when CONFIG_DEBUG_KOBJECT_RELEASE=y).
- Patch 11 annotates struct kobj_type::release with
  __require_explicit_initialization and explicitly sets .release = NULL
  (with explanatory comments) on the remaining legacy struct kobj_type
  definitions whose kobjects are static, per-CPU, or embedded in devm- or
  parent-managed structures.

[1] https://lpc.events/event/20/contributions/2392/

Ian Rogers (11):
  Compiler Attributes: Add __require_explicit_initialization macro
  powerpc/secvar: Add missing kobject release callback to secvar_ktype
  sh: sq: Add missing kobject release callback to ktype_percpu_entry
  cpufreq: Initialize kobj_type release callback in ondemand and
    conservative governors
  ACPI: CPPC: Free cpc_desc in kobject release callback
  dlm: Free dlm_ls in kobject release callback
  xen/sys-hypervisor: Add release callback to hyp_sysfs_kobj_type
  s390/sclp_mem: Allocate struct sclp_mem dynamically and add kobject
    release
  ubifs: sysfs: Use kset_create_and_add() for ubifs_kset
  drm/amdkfd: Free queue in procfs_queue_type kobject release callback
  kobject: Require explicit initialization of struct kobj_type::release

 Documentation/conf.py                         |  1 +
 arch/arm64/kernel/cpuinfo.c                   |  2 +
 arch/powerpc/kernel/secvar-sysfs.c            |  6 ++
 arch/sh/kernel/cpu/sh4/sq.c                   |  6 ++
 drivers/acpi/cppc_acpi.c                      | 39 +++++-----
 drivers/acpi/sysfs.c                          |  2 +
 drivers/cpufreq/cpufreq_conservative.c        |  5 +-
 drivers/cpufreq/cpufreq_governor.c            |  3 +-
 drivers/cpufreq/cpufreq_governor.h            |  1 +
 drivers/cpufreq/cpufreq_ondemand.c            |  5 +-
 drivers/dma/ioat/sysfs.c                      |  2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c       |  4 +
 drivers/gpu/drm/amd/amdkfd/kfd_process.c      | 10 ++-
 drivers/gpu/drm/amd/amdkfd/kfd_queue.c        |  5 +-
 drivers/infiniband/hw/hfi1/sysfs.c            |  2 +
 drivers/infiniband/hw/usnic/usnic_ib_sysfs.c  |  2 +
 drivers/parisc/pdc_stable.c                   |  2 +
 drivers/power/supply/ab8500_fg.c              |  2 +
 drivers/s390/char/sclp_mem.c                  | 73 +++++++++----------
 drivers/soc/hisilicon/kunpeng_hccs.c          |  6 ++
 .../fbdev/omap2/omapfb/dss/display-sysfs.c    |  2 +
 .../fbdev/omap2/omapfb/dss/manager-sysfs.c    |  2 +
 .../fbdev/omap2/omapfb/dss/overlay-sysfs.c    |  2 +
 drivers/xen/sys-hypervisor.c                  |  6 ++
 fs/dlm/lockspace.c                            | 19 +++--
 fs/erofs/sysfs.c                              |  4 +
 fs/f2fs/sysfs.c                               |  6 ++
 fs/ocfs2/cluster/masklog.c                    |  2 +
 fs/ubifs/sysfs.c                              | 24 ++----
 include/linux/compiler_attributes.h           | 11 +++
 include/linux/kobject.h                       |  2 +-
 scripts/checkpatch.pl                         |  1 +
 tools/lib/python/kdoc/xforms_lists.py         |  1 +
 33 files changed, 170 insertions(+), 90 deletions(-)

-- 
2.56.0.385.gd3acb90ef8-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
