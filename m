Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0E2606A320
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2026 19:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EsY1pCNd;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=M41GE+Zp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=ZXqwh7YX6MS2iXvdrFHlOdB0uG2jOSgRaJXxfJfdGvo=; b=EsY1pCNdnfRhahfJkw+xvlPosu
	aR0GTfVrtDIfqCeDS/U5uOSlXZXbg+fYCcxitybn3OUjqmk6sQYO72kahoVfs3uQ6Na25UcMCk83g
	TNVQ992fvUT2mJkQdh7tfx8tNrRp4d7yfe8khJgnCsKQ3JvtpOZcD08Kr5KWSfsSq3BTlKjK5iDjk
	GKbN7wY0oSP3vD03hnwUQ/SVkY2Cb3SNYk+vKkWxUFsRsOC/oq4Ib5w60GQKCgUKWYoCYSY6YsscW
	MWesB+/b9kNyEsIq4F3NlWX/tOnfL3FKeYi7/xHzfGAqwxYcDzgruy10SYt/8nPD5S5vK2M3EhgzZ
	9J6am1CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7mB-0000000DCbX-0YRP;
	Thu, 19 Nov 2026 19:26:31 +0000
Received: from mail-oi1-x245.google.com ([2607:f8b0:4864:20::245])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7lz-0000000DCT5-1e9U
	for linux-mtd@lists.infradead.org;
	Thu, 19 Nov 2026 19:26:29 +0000
Received: by mail-oi1-x245.google.com with SMTP id 5614622812f47-4ab8b4887d4so179006b6e.1
        for <linux-mtd@lists.infradead.org>; Thu, 19 Nov 2026 11:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795116378; x=1795721178; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d2DVsEOIJmONwY68Fz20HCkoh5ZG0X1B/QknI6oOs3U=;
        b=M41GE+ZpJxSMg3z+/kBCpT2qnOTBs9hOCfksFMazjqLeSQiU5lf2Svl5J0oUVcg28H
         S2TcA6EdlGeExY5+8OniMc8CTAKX1jhtCV8PwVY2mcXmd3ThosbnMaWqGkJcwn9p4Phv
         Eg+4u5O7r0pHrIM63oYbTZ/x/mOma/QHwqut0L2cZ42N/iIqnGu+AU1XggJXNKhnhj9b
         wl2AA5em3KISwAboLw++TGnpgu2kRJ7WbDIYE7YtHy13kPEiTSFOaoz5ULow+OlPoix7
         1lZQie3cyediqBnRIVfw8ubfeSHBB2uHSLrPjBBgO9UQb91Hqq4xcbQ7BfK63ycFhlEj
         3yLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795116378; x=1795721178;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d2DVsEOIJmONwY68Fz20HCkoh5ZG0X1B/QknI6oOs3U=;
        b=ok/54ZxW3GkYs6m/TG3R5QwhtzLZaWrR3Wva963od0VoOhz0Ek6zFyKxNytm+zweS3
         qtfboRm4t+oTYXnYapCu8vzWUK+OnJ+CiMQ7bHT5PmIumq5S36pJDEVSh9SWpR2uuQAs
         tGZN68Y1P5wQgN/GVA+8+vw8M275v+LoCnY2SyQ7DygPNMVsuEawnrNaKCENix+HUP3d
         DbTm0TkccO0dH0cmHnA5pA1qnwmiLqGwRwH7cU7toqu++td1YjjLmvHD7aTfJVTS0uxC
         WylVnlPqRvw98CmUAh+AGLNtp/xDxWglM3msGicZlqOmxEnFXU+ivBL374GAtEUhKRD1
         yh/A==
X-Forwarded-Encrypted: i=1; AL+hErG7diMvebWkD6/4NESpa1LPVKqRegS6MCq74zOWedjfA3xbWgcVWU4UKzqV1F+J8h6ZBRLSB0wcGBs=@lists.infradead.org
X-Gm-Message-State: APuU4Z+L+TjC2lro8eAWTA65ecDTivKKG0gI1eXl4OXp0X7zA3WZMdFJ
	NeKGSPWOzx+ETslKirghvl9CvrRK9f3SU+S6w38PmOAiOoSyL61an53s/xMT6EUFYJtQlEJXsx2
	KmL6/dJ89Fw==
X-Received: from jaqb6.prod.google.com ([2002:a05:6638:1a6:b0:61f:e4cd:8716])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6808:c3eb:b0:4b9:e5fa:8a17
 with SMTP id 5614622812f47-57a0a913526mr994137b6e.28.1795116377408; Thu, 19
 Nov 2026 11:26:17 -0800 (PST)
Date: Thu, 19 Nov 2026 11:25:20 -0800
In-Reply-To: <20261119192520.1983406-1-irogers@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261119192520.1983406-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261119192520.1983406-10-irogers@google.com>
Subject: [PATCH v4 9/9] kobject: Require explicit initialization of struct kobj_type::release
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
X-CRM114-CacheID: sfid-20261119_112619_516953_90558487 
X-CRM114-Status: GOOD (  19.49  )
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

Documentation/core-api/kobject.rst states:

  "One important point cannot be overstated: every kobject must have a
  release() method, and the kobject must persist (in a consistent state)
  until that method is called. If these constraints are not met, the code
  is flawed. Note that the kernel will warn you if you forget to provide
  a release() method. Do not try to get rid of this warning by providing
  an \"empty\" release function."

Annotate struct kobj_type::release with __must_init so the compiler
diagnoses any struct kobj_type initializer that omits .release.

For the remaining legacy struct kobj_type definitions that still omit a
release callback, explicitly initialize .release = NULL and document
each site's lifetime status:
- In built-in code where the backing storage is static, per-CPU, or
  allocated once at boot and never freed (arm64 cpuinfo, ACPI hotplug
  profiles, and s390 sclp_mem), note that omitting release() violates
  the kobject API contract while explaining what guarantees the storage
  outlives kobject cleanup.
- In drivers and tristate modules with broken kobject lifetime
  management (where enclosing dynamic or devm allocations are freed or
  zeroed independently of kobject_put(), or where module unload unmaps
  static kobjects/ksets while final or CONFIG_DEBUG_KOBJECT_RELEASE
  delayed cleanup may still be pending), document the lifetime hazard
  with a FIXME comment for follow-up fixes.

This change does not alter runtime behavior at these sites.

Link: https://lpc.events/event/20/contributions/2392/
Signed-off-by: Ian Rogers <irogers@google.com>
---
 arch/arm64/kernel/cpuinfo.c                   |  7 +++++++
 drivers/acpi/sysfs.c                          |  7 +++++++
 drivers/dma/ioat/sysfs.c                      |  8 +++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c    |  8 +++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c       | 17 +++++++++++++++
 drivers/infiniband/hw/hfi1/sysfs.c            |  7 +++++++
 drivers/infiniband/hw/usnic/usnic_ib_sysfs.c  |  7 +++++++
 drivers/parisc/pdc_stable.c                   |  8 +++++++
 drivers/power/supply/ab8500_fg.c              |  8 +++++++
 drivers/s390/char/sclp_mem.c                  |  6 ++++++
 drivers/soc/hisilicon/kunpeng_hccs.c          | 18 ++++++++++++++++
 .../fbdev/omap2/omapfb/dss/display-sysfs.c    |  7 +++++++
 .../fbdev/omap2/omapfb/dss/manager-sysfs.c    |  8 +++++++
 .../fbdev/omap2/omapfb/dss/overlay-sysfs.c    |  7 +++++++
 fs/erofs/sysfs.c                              | 14 +++++++++++++
 fs/f2fs/sysfs.c                               | 21 +++++++++++++++++++
 fs/ocfs2/cluster/masklog.c                    |  7 +++++++
 include/linux/kobject.h                       |  2 +-
 18 files changed, 166 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/cpuinfo.c b/arch/arm64/kernel/cpuinfo.c
index 94e6cd211d70..7c374b8c25af 100644
--- a/arch/arm64/kernel/cpuinfo.c
+++ b/arch/arm64/kernel/cpuinfo.c
@@ -295,6 +295,13 @@ const struct seq_operations cpuinfo_op = {
 
 
 static const struct kobj_type cpuregs_kobj_type = {
+	/*
+	 * Omitting release() violates the kobject API contract, but lifetime
+	 * is safe: info->kobj is embedded in built-in static per-CPU cpu_data
+	 * that is never freed or passed to kobject_put() (CPU hotplug only
+	 * toggles sysfs visibility via kobject_add() and kobject_del()).
+	 */
+	.release = NULL,
 	.sysfs_ops = &kobj_sysfs_ops,
 };
 
diff --git a/drivers/acpi/sysfs.c b/drivers/acpi/sysfs.c
index a4534b3e3cfb..d435b565ad19 100644
--- a/drivers/acpi/sysfs.c
+++ b/drivers/acpi/sysfs.c
@@ -975,6 +975,13 @@ static struct attribute *hotplug_profile_attrs[] = {
 ATTRIBUTE_GROUPS(hotplug_profile);
 
 static const struct kobj_type acpi_hotplug_profile_ktype = {
+	/*
+	 * Omitting release() violates the kobject API contract, but lifetime
+	 * is safe: hotplug->kobj is only embedded in static built-in
+	 * struct acpi_scan_handler instances that are never unregistered or
+	 * freed.
+	 */
+	.release = NULL,
 	.sysfs_ops = &kobj_sysfs_ops,
 	.default_groups = hotplug_profile_groups,
 };
diff --git a/drivers/dma/ioat/sysfs.c b/drivers/dma/ioat/sysfs.c
index 976134df8108..ec5a90c7aded 100644
--- a/drivers/dma/ioat/sysfs.c
+++ b/drivers/dma/ioat/sysfs.c
@@ -167,6 +167,14 @@ static const struct attribute *const ioat_attrs[] = {
 ATTRIBUTE_GROUPS(ioat);
 
 const struct kobj_type ioat_ktype = {
+	/*
+	 * FIXME: Broken kobject lifetime (needs follow-up fix):
+	 * ioat_kobject_del() calls kobject_put(&ioat_chan->kobj) and
+	 * release_ioatdma() frees ioat_chan via kfree() without waiting for
+	 * final kobject cleanup (use-after-free if a sysfs reference is held
+	 * or under CONFIG_DEBUG_KOBJECT_RELEASE).
+	 */
+	.release = NULL,
 	.sysfs_ops = &ioat_sysfs_ops,
 	.default_groups = ioat_groups,
 };
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c
index d025b4183b29..5aa90f1271e4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c
@@ -892,6 +892,14 @@ static const struct attribute_group ualink_xcp_info_group = {
 };
 
 static const struct kobj_type ualink_xcp_info_ktype = {
+	/*
+	 * FIXME: Broken kobject lifetime (needs follow-up fix):
+	 * xcp->ualink.kobj is embedded in adev->xcp_mgr;
+	 * amdgpu_ualink_xcp_sysfs_remove() calls kobject_put() and
+	 * amdgpu_device_fini_sw() later calls kfree(adev->xcp_mgr) without
+	 * waiting for final kobject cleanup.
+	 */
+	.release = NULL,
 	.sysfs_ops = &kobj_sysfs_ops
 };
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c
index ab14079d1c42..8e21bf57596c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c
@@ -797,6 +797,16 @@ static const struct sysfs_ops xcp_cfg_res_sysfs_ops = {
 };
 
 static const struct kobj_type xcp_cfg_res_sysfs_ktype = {
+	/*
+	 * FIXME: Broken kobject lifetime (needs follow-up fix): xcp_res->kobj
+	 * is embedded in struct amdgpu_xcp_cfg, freed by parent xcp_cfg->kobj's
+	 * xcp_cfg_sysfs_release(). While an added child pins xcp_cfg->kobj
+	 * until kobject_cleanup() finishes, if kobject_init_and_add() fails in
+	 * amdgpu_xcp_cfg_sysfs_init() no parent reference is held and
+	 * kfree(xcp_cfg) can race with delayed cleanup under
+	 * CONFIG_DEBUG_KOBJECT_RELEASE.
+	 */
+	.release = NULL,
 	.sysfs_ops = &xcp_cfg_res_sysfs_ops,
 	.default_groups = xcp_cfg_res_sysfs_groups,
 };
@@ -1061,6 +1071,13 @@ static const struct attribute_group amdgpu_xcp_attrs_group = {
 };
 
 static const struct kobj_type xcp_sysfs_ktype = {
+	/*
+	 * FIXME: Broken kobject lifetime (needs follow-up fix): xcp->kobj is
+	 * embedded in adev->xcp_mgr; amdgpu_xcp_sysfs_entries_fini() calls
+	 * kobject_put() and amdgpu_device_fini_sw() later calls
+	 * kfree(adev->xcp_mgr) without waiting for final kobject cleanup.
+	 */
+	.release = NULL,
 	.sysfs_ops = &kobj_sysfs_ops,
 };
 
diff --git a/drivers/infiniband/hw/hfi1/sysfs.c b/drivers/infiniband/hw/hfi1/sysfs.c
index 372cfd13dc61..dc6693822589 100644
--- a/drivers/infiniband/hw/hfi1/sysfs.c
+++ b/drivers/infiniband/hw/hfi1/sysfs.c
@@ -608,6 +608,13 @@ static const struct sysfs_ops sde_sysfs_ops = {
 };
 
 static struct kobj_type sde_ktype = {
+	/*
+	 * FIXME: Broken kobject lifetime (needs follow-up fix):
+	 * hfi1_verbs_unregister_sysfs() calls kobject_put(&dd->per_sdma[i].kobj)
+	 * and sdma_clean() frees dd->per_sdma via kfree() without waiting for
+	 * final kobject cleanup.
+	 */
+	.release = NULL,
 	.sysfs_ops = &sde_sysfs_ops,
 };
 
diff --git a/drivers/infiniband/hw/usnic/usnic_ib_sysfs.c b/drivers/infiniband/hw/usnic/usnic_ib_sysfs.c
index fdb63a8fb997..f6946524a562 100644
--- a/drivers/infiniband/hw/usnic/usnic_ib_sysfs.c
+++ b/drivers/infiniband/hw/usnic/usnic_ib_sysfs.c
@@ -245,6 +245,13 @@ static struct attribute *usnic_ib_qpn_default_attrs[] = {
 ATTRIBUTE_GROUPS(usnic_ib_qpn_default);
 
 static struct kobj_type usnic_ib_qpn_type = {
+	/*
+	 * FIXME: Broken kobject lifetime (needs follow-up fix):
+	 * usnic_ib_destroy_qp() calls kobject_put(&qp_grp->kobj) via
+	 * usnic_ib_sysfs_qpn_remove() and RDMA core immediately frees qp_grp
+	 * without waiting for final kobject cleanup.
+	 */
+	.release = NULL,
 	.sysfs_ops = &usnic_ib_qpn_sysfs_ops,
 	.default_groups = usnic_ib_qpn_default_groups,
 };
diff --git a/drivers/parisc/pdc_stable.c b/drivers/parisc/pdc_stable.c
index 6b567a74fc2c..1dc7d8ffdc73 100644
--- a/drivers/parisc/pdc_stable.c
+++ b/drivers/parisc/pdc_stable.c
@@ -484,6 +484,14 @@ ATTRIBUTE_GROUPS(paths_subsys);
 
 /* Specific kobject type for our PDC paths */
 static const struct kobj_type ktype_pdcspath = {
+	/*
+	 * FIXME: Broken kobject lifetime (needs follow-up fix): pdcspath_entry
+	 * instances are static in tristate module pdc_stable, and
+	 * pdc_stable_exit() calls kobject_put(&entry->kobj); unloading the
+	 * module unmaps the static storage without waiting for final kobject
+	 * cleanup.
+	 */
+	.release = NULL,
 	.sysfs_ops = &pdcspath_attr_ops,
 	.default_groups = paths_subsys_groups,
 };
diff --git a/drivers/power/supply/ab8500_fg.c b/drivers/power/supply/ab8500_fg.c
index eddd3e853106..f5a0bb821ee8 100644
--- a/drivers/power/supply/ab8500_fg.c
+++ b/drivers/power/supply/ab8500_fg.c
@@ -2539,6 +2539,14 @@ static struct attribute *ab8500_fg_attrs[] = {
 ATTRIBUTE_GROUPS(ab8500_fg);
 
 static const struct kobj_type ab8500_fg_ktype = {
+	/*
+	 * FIXME: Broken kobject lifetime (needs follow-up fix): fg_kobject is
+	 * embedded in devm-allocated struct ab8500_fg; ab8500_fg_sysfs_exit()
+	 * only calls kobject_del() (never kobject_put()) before devm frees the
+	 * struct on unbind, and on ab8500_fg_sysfs_init() failure kobject_put()
+	 * races with devm freeing the struct on probe failure.
+	 */
+	.release = NULL,
 	.sysfs_ops = &ab8500_fg_sysfs_ops,
 	.default_groups = ab8500_fg_groups,
 };
diff --git a/drivers/s390/char/sclp_mem.c b/drivers/s390/char/sclp_mem.c
index 6df1926d4c62..a46d27817281 100644
--- a/drivers/s390/char/sclp_mem.c
+++ b/drivers/s390/char/sclp_mem.c
@@ -305,6 +305,12 @@ static ssize_t sclp_memmap_on_memory_store(struct kobject *kobj, struct kobj_att
 }
 
 static const struct kobj_type ktype = {
+	/*
+	 * Omitting release() violates the kobject API contract, but lifetime
+	 * is safe: built-in sclp_init_mem() allocates sclp_mems once at boot
+	 * and never calls kobject_put() or kfree() on it.
+	 */
+	.release = NULL,
 	.sysfs_ops = &kobj_sysfs_ops,
 };
 
diff --git a/drivers/soc/hisilicon/kunpeng_hccs.c b/drivers/soc/hisilicon/kunpeng_hccs.c
index 3b9fa3a74abd..bccd0ba95073 100644
--- a/drivers/soc/hisilicon/kunpeng_hccs.c
+++ b/drivers/soc/hisilicon/kunpeng_hccs.c
@@ -1038,6 +1038,12 @@ static struct attribute *hccs_port_default_attrs[] = {
 ATTRIBUTE_GROUPS(hccs_port_default);
 
 static const struct kobj_type hccs_port_type = {
+	/*
+	 * FIXME: Broken kobject lifetime (needs follow-up fix): hccs_port_info
+	 * is allocated via devm_kzalloc(), and devm frees it on unbind or probe
+	 * failure without waiting for kobject_put(&port->kobj) final cleanup.
+	 */
+	.release = NULL,
 	.sysfs_ops = &hccs_comm_ops,
 	.default_groups = hccs_port_default_groups,
 };
@@ -1110,6 +1116,12 @@ static struct attribute *hccs_die_default_attrs[] = {
 ATTRIBUTE_GROUPS(hccs_die_default);
 
 static const struct kobj_type hccs_die_type = {
+	/*
+	 * FIXME: Broken kobject lifetime (needs follow-up fix): hccs_die_info
+	 * is allocated via devm_kzalloc(), and devm frees it on unbind or probe
+	 * failure without waiting for kobject_put(&die->kobj) final cleanup.
+	 */
+	.release = NULL,
 	.sysfs_ops = &hccs_comm_ops,
 	.default_groups = hccs_die_default_groups,
 };
@@ -1213,6 +1225,12 @@ static struct attribute *hccs_chip_default_attrs[] = {
 ATTRIBUTE_GROUPS(hccs_chip_default);
 
 static const struct kobj_type hccs_chip_type = {
+	/*
+	 * FIXME: Broken kobject lifetime (needs follow-up fix): hccs_chip_info
+	 * is allocated via devm_kzalloc(), and devm frees it on unbind or probe
+	 * failure without waiting for kobject_put(&chip->kobj) final cleanup.
+	 */
+	.release = NULL,
 	.sysfs_ops = &hccs_comm_ops,
 	.default_groups = hccs_chip_default_groups,
 };
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/display-sysfs.c b/drivers/video/fbdev/omap2/omapfb/dss/display-sysfs.c
index ae937854403b..436ec9c8591b 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/display-sysfs.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/display-sysfs.c
@@ -304,6 +304,13 @@ static const struct sysfs_ops display_sysfs_ops = {
 };
 
 static struct kobj_type display_ktype = {
+	/*
+	 * FIXME: Broken kobject lifetime (needs follow-up fix):
+	 * display_uninit_sysfs() calls kobject_put(&dssdev->kobj) and
+	 * immediately zeroes dssdev->kobj with memset(), corrupting any
+	 * in-flight or delayed (CONFIG_DEBUG_KOBJECT_RELEASE) kobject cleanup.
+	 */
+	.release = NULL,
 	.sysfs_ops = &display_sysfs_ops,
 	.default_groups = display_sysfs_groups,
 };
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/manager-sysfs.c b/drivers/video/fbdev/omap2/omapfb/dss/manager-sysfs.c
index 1b644be5fe2e..e4d61cf7e939 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/manager-sysfs.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/manager-sysfs.c
@@ -496,6 +496,14 @@ static const struct sysfs_ops manager_sysfs_ops = {
 };
 
 static struct kobj_type manager_ktype = {
+	/*
+	 * FIXME: Broken kobject lifetime (needs follow-up fix): mgr->kobj is
+	 * embedded in dynamically allocated managers[], zeroed in
+	 * dss_manager_kobj_uninit() right after kobject_put(), and freed in
+	 * dss_uninit_overlay_managers() without waiting for final kobject
+	 * cleanup.
+	 */
+	.release = NULL,
 	.sysfs_ops = &manager_sysfs_ops,
 	.default_groups = manager_sysfs_groups,
 };
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/overlay-sysfs.c b/drivers/video/fbdev/omap2/omapfb/dss/overlay-sysfs.c
index 1da4fb1c77b4..3960261cada0 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/overlay-sysfs.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/overlay-sysfs.c
@@ -429,6 +429,13 @@ static const struct sysfs_ops overlay_sysfs_ops = {
 };
 
 static struct kobj_type overlay_ktype = {
+	/*
+	 * FIXME: Broken kobject lifetime (needs follow-up fix): ovl->kobj is
+	 * embedded in dynamically allocated overlays[] and freed in
+	 * dss_uninit_overlays() right after dss_overlay_kobj_uninit() calls
+	 * kobject_put(), without waiting for final kobject cleanup.
+	 */
+	.release = NULL,
 	.sysfs_ops = &overlay_sysfs_ops,
 	.default_groups = overlay_sysfs_groups,
 };
diff --git a/fs/erofs/sysfs.c b/fs/erofs/sysfs.c
index dfcec9376cd5..3654a945b299 100644
--- a/fs/erofs/sysfs.c
+++ b/fs/erofs/sysfs.c
@@ -238,6 +238,13 @@ static const struct kobj_type erofs_sb_ktype = {
 static const struct kobj_type erofs_ktype = {
 	.default_groups = erofs_groups,
 	.sysfs_ops	= &erofs_attr_ops,
+	/*
+	 * FIXME: Broken kobject lifetime (needs follow-up fix): erofs_root is
+	 * a static struct kset in tristate module erofs, and erofs_exit_sysfs()
+	 * calls kset_unregister(); unloading the module unmaps the static
+	 * storage without waiting for final kobject cleanup.
+	 */
+	.release	= NULL,
 };
 
 static struct kset erofs_root = {
@@ -247,6 +254,13 @@ static struct kset erofs_root = {
 static const struct kobj_type erofs_feat_ktype = {
 	.default_groups = erofs_feat_groups,
 	.sysfs_ops	= &erofs_attr_ops,
+	/*
+	 * FIXME: Broken kobject lifetime (needs follow-up fix): erofs_feat is
+	 * a static struct kobject in tristate module erofs, and
+	 * erofs_exit_sysfs() calls kobject_put(); unloading the module unmaps
+	 * the static storage without waiting for final kobject cleanup.
+	 */
+	.release	= NULL,
 };
 
 static struct kobject erofs_feat = {
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 430356e500af..770ceb12e178 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -1683,6 +1683,13 @@ static const struct kobj_type f2fs_sb_ktype = {
 
 static const struct kobj_type f2fs_ktype = {
 	.sysfs_ops	= &f2fs_attr_ops,
+	/*
+	 * FIXME: Broken kobject lifetime (needs follow-up fix): f2fs_kset is
+	 * a static struct kset in tristate module f2fs, and f2fs_exit_sysfs()
+	 * calls kset_unregister(); unloading the module unmaps the static
+	 * storage without waiting for final kobject cleanup.
+	 */
+	.release	= NULL,
 };
 
 static struct kset f2fs_kset = {
@@ -1697,6 +1704,13 @@ static const struct sysfs_ops f2fs_feat_attr_ops = {
 static const struct kobj_type f2fs_feat_ktype = {
 	.default_groups = f2fs_feat_groups,
 	.sysfs_ops	= &f2fs_feat_attr_ops,
+	/*
+	 * FIXME: Broken kobject lifetime (needs follow-up fix): f2fs_feat is
+	 * a static struct kobject in tristate module f2fs, and
+	 * f2fs_exit_sysfs() calls kobject_put(); unloading the module unmaps
+	 * the static storage without waiting for final kobject cleanup.
+	 */
+	.release	= NULL,
 };
 
 static struct kobject f2fs_feat = {
@@ -1711,6 +1725,13 @@ static const struct sysfs_ops f2fs_tune_attr_ops = {
 static const struct kobj_type f2fs_tune_ktype = {
 	.default_groups = f2fs_tune_groups,
 	.sysfs_ops	= &f2fs_tune_attr_ops,
+	/*
+	 * FIXME: Broken kobject lifetime (needs follow-up fix): f2fs_tune is
+	 * a static struct kobject in tristate module f2fs, and
+	 * f2fs_exit_sysfs() calls kobject_put(); unloading the module unmaps
+	 * the static storage without waiting for final kobject cleanup.
+	 */
+	.release	= NULL,
 };
 
 static struct kobject f2fs_tune = {
diff --git a/fs/ocfs2/cluster/masklog.c b/fs/ocfs2/cluster/masklog.c
index 563881ddbf00..5a30f73d8d67 100644
--- a/fs/ocfs2/cluster/masklog.c
+++ b/fs/ocfs2/cluster/masklog.c
@@ -147,6 +147,13 @@ static const struct sysfs_ops mlog_attr_ops = {
 static struct kobj_type mlog_ktype = {
 	.default_groups = mlog_default_groups,
 	.sysfs_ops      = &mlog_attr_ops,
+	/*
+	 * FIXME: Broken kobject lifetime (needs follow-up fix): mlog_kset is
+	 * a static struct kset in tristate module ocfs2_nodemanager, and
+	 * mlog_sys_shutdown() calls kset_unregister(); unloading the module
+	 * unmaps the static storage without waiting for final kobject cleanup.
+	 */
+	.release        = NULL,
 };
 
 static struct kset mlog_kset = {
diff --git a/include/linux/kobject.h b/include/linux/kobject.h
index 55e37a5d405e..8a1332030884 100644
--- a/include/linux/kobject.h
+++ b/include/linux/kobject.h
@@ -114,7 +114,7 @@ void kobject_get_ownership(const struct kobject *kobj, kuid_t *uid, kgid_t *gid)
 char *kobject_get_path(const struct kobject *kobj, gfp_t flag);
 
 struct kobj_type {
-	void (*release)(struct kobject *kobj);
+	void (*release)(struct kobject *kobj) __must_init;
 	const struct sysfs_ops *sysfs_ops;
 	const struct attribute_group **default_groups;
 	const struct kobj_ns_type_operations *(*child_ns_type)(const struct kobject *kobj);
-- 
2.56.1.708.g77570a6a1d-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
