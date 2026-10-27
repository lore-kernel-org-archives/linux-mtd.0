Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4A760731B3
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Oct 2026 22:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=E3bzrTSp;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=POlL9zXl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=9ShlU2IzZNA2GSgghnDidaRCP7Ghu6KRsQolfgY0MiI=; b=E3bzrTSp6SmIEpD0AbT8c9JR8i
	NwwUpqD+9JNZgvIXMbnh3ZdMoXpNpDGNy4SpxoDOFfTB4O3wRVwilVjTECICI3fjyQtvpbq48iRYp
	7zVS5Irq43Kk/QpLcgt9C/yZ4AmCkmqzdCe89W2d5vB59LewzlVJr1JLS9INaggRuYujRcp3u2EE+
	6TqWzf/xMjCM00cDgMnO7Zg9vjPh3emTK3WNoP9gI3mAX9iu/g+2v/yYncs/fO6UVLiVMekAnEzzJ
	DFqjvUeiHdUhfrMUYtZbh0Q4K0Ixklk2yCh8JrTbpT13hjXr0TJksaRMnGQpBOE6SfVC90MWDvF3r
	oRCx2YMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLppV-00000005rMQ-0o7i;
	Tue, 27 Oct 2026 22:39:41 +0000
Received: from mail-dy1-x1348.google.com ([2607:f8b0:4864:20::1348])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLppR-00000005rFw-3Igl
	for linux-mtd@lists.infradead.org;
	Tue, 27 Oct 2026 22:39:40 +0000
Received: by mail-dy1-x1348.google.com with SMTP id 5a478bee46e88-35cbea41088so456638eec.1
        for <linux-mtd@lists.infradead.org>; Tue, 27 Oct 2026 15:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793140776; x=1793745576; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=36a0/HoL8yXBAoRB1lx62HZinWx8I5wnTQwOiZ4VBGs=;
        b=POlL9zXlBcWNABapAVPjKgCrClhH3UbSB2BYIWUKdM567ypFaoXw6NoAZemqBlsVap
         5aUS9rofxdDHgYGa2G6CW+TKxnPotuFz59FPJR4rfxQY+a+Yg7Hnio798ePdcNEzQWam
         gO7roP+Aou5epFw/FOna32AenG4tZDeoF/8V2GHLf9OV5rs9qpA/HVEHiNFWtc1dWxRX
         ROTlVS+8e/8cDu+IEK0rebYmxtggu4zDW9CKNOlh3jRRl8sfa9zY8TzIFHVzvY/TnORP
         fw8cV4yiyoYO7DH+C4fFnyXGobaAM8EpS0Apiv0jwXCiYJSN57NBhzuY7mdvL9Wi2H6q
         GBvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793140776; x=1793745576;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=36a0/HoL8yXBAoRB1lx62HZinWx8I5wnTQwOiZ4VBGs=;
        b=E5iAVexOIczi2gj34hvB2Ckoczp3NY/gGDTvFNz3GEBGmqvsEdDcoarLXV/wq8Uher
         IjYmH679szat4OpwYFLWliOnO2z4cI9wTlnycgvO/HhDWozvtJAMsLZAiZ0tVNV0sgev
         iEp+Z/CHEGyTkJpX/2Rdmtk05+IPFzKwkiXO6EASRdvzyYbc+dk+lxC/2RVju8yh4Px8
         qmlYNhHi8zLE7ofrxxr5tVa97J8fEQ4KxaAofkuCwDMAN7zr0OV+e/b2JTEY33uuo2oL
         q+E+pAUuAPA9YendjzDhpA5sRqI5ToiuIWH850ibA6aszgLyJ7aNLown9Jo4qx2aKjQM
         4eXg==
X-Forwarded-Encrypted: i=1; AKwUvByqPXQ10lI4qQNxvz2pENufwqoG3xg/7Ul1mAy8VIhZV4zZFVOGsdtNsWv46LxyQmCdE/MW4lzqY4k=@lists.infradead.org
X-Gm-Message-State: AFq9FYJD5ZblfR78JIkFa5EJBLblulWfP+tIA8u9xrm2hS+QR6ZbflXc
	sgnsrfltKnMzeMeJp0ogTIzog1b71g5dVWqRohzANZAnCAP48hWd9Olwfvje2j7FhlMA7Etpom5
	osqj1C2FdAA==
X-Received: from dycna22.prod.google.com ([2002:a05:7300:ea96:b0:369:de3f:acf9])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:d101:b0:369:5583:bf4c
 with SMTP id 5a478bee46e88-36a200c8c63mr1046676eec.28.1793140775931; Tue, 27
 Oct 2026 15:39:35 -0700 (PDT)
Date: Tue, 27 Oct 2026 15:38:44 -0700
In-Reply-To: <20261027223847.652884-1-irogers@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261027223847.652884-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.313.g2479322e68-goog
Message-ID: <20261027223847.652884-10-irogers@google.com>
Subject: [PATCH v2 9/9] kobject: Require explicit initialization of struct kobj_type::release
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
	linux-kernel@vger.kernel.org, Ian Rogers <irogers@google.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Len Brown <lenb@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, Alex Deucher <alexander.deucher@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Leon Romanovsky <leon@kernel.org>, Nelson Escobar <neescoba@cisco.com>, Satish Kharat <satishkh@cisco.com>, 
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, 
	Linus Walleij <linusw@kernel.org>, Sebastian Reichel <sre@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Huisong Li <lihuisong@huawei.com>, Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>, 
	Yue Hu <zbestahu@gmail.com>, Jingbo Xu <jefflexu@163.com>, 
	Sandeep Dhavale <dhavale@google.com>, Hongbo Li <hongbohbli@tencent.com>, 
	Chunhai Guo <guochunhai@vivo.com>, Jaegeuk Kim <jaegeuk@kernel.org>, Mark Fasheh <mark@fasheh.com>, 
	Joel Becker <jlbec@evilplan.org>, Joseph Qi <joseph.qi@linux.alibaba.com>, 
	Heming Zhao <heming.zhao@suse.com>, Johan Hovold <johan@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org, 
	linux-rdma@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	linux-erofs@lists.ozlabs.org, linux-f2fs-devel@lists.sourceforge.net, 
	ocfs2-devel@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_153937_874108_69A9DF29 
X-CRM114-Status: GOOD (  19.17  )
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
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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

Annotate struct kobj_type::release with __must_init
so the compiler diagnoses any struct kobj_type initializer that omits
.release.

For the remaining legacy struct kobj_type definitions where the kobject
is static, per-CPU, permanent firmware structures, or embedded inside a
devm- or parent-managed structure rather than freed by kobject_put(),
explicitly initialize .release = NULL with a comment documenting why no
release callback is provided.

Where the existing teardown is not safe with CONFIG_DEBUG_KOBJECT_RELEASE,
because the kobject's memory can be freed or cleared while the delayed
kobject cleanup is still pending (ioat, kunpeng_hccs and omapfb display),
the comment says so. Fixing those is left to follow-up patches; this
change does not alter their behavior.

Link: https://lpc.events/event/20/contributions/2392/
Signed-off-by: Ian Rogers <irogers@google.com>
---
 arch/arm64/kernel/cpuinfo.c                   |  5 +++++
 drivers/acpi/sysfs.c                          |  2 ++
 drivers/dma/ioat/sysfs.c                      |  7 +++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c    |  5 +++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c       | 10 +++++++++
 drivers/infiniband/hw/hfi1/sysfs.c            |  5 +++++
 drivers/infiniband/hw/usnic/usnic_ib_sysfs.c  |  2 ++
 drivers/parisc/pdc_stable.c                   |  5 +++++
 drivers/power/supply/ab8500_fg.c              |  5 +++++
 drivers/s390/char/sclp_mem.c                  |  2 ++
 drivers/soc/hisilicon/kunpeng_hccs.c          | 21 +++++++++++++++++++
 .../fbdev/omap2/omapfb/dss/display-sysfs.c    |  7 +++++++
 .../fbdev/omap2/omapfb/dss/manager-sysfs.c    |  5 +++++
 .../fbdev/omap2/omapfb/dss/overlay-sysfs.c    |  5 +++++
 fs/erofs/sysfs.c                              | 10 +++++++++
 fs/f2fs/sysfs.c                               | 15 +++++++++++++
 fs/ocfs2/cluster/masklog.c                    |  5 +++++
 include/linux/kobject.h                       |  2 +-
 18 files changed, 117 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/cpuinfo.c b/arch/arm64/kernel/cpuinfo.c
index 94e6cd211d70..7a4ac8dd0b86 100644
--- a/arch/arm64/kernel/cpuinfo.c
+++ b/arch/arm64/kernel/cpuinfo.c
@@ -295,6 +295,11 @@ const struct seq_operations cpuinfo_op = {
 
 
 static const struct kobj_type cpuregs_kobj_type = {
+	/*
+	 * Pre-existing: info->kobj is embedded in per-CPU cpu_data;
+	 * cpuid_cpu_offline() only calls kobject_del().
+	 */
+	.release = NULL,
 	.sysfs_ops = &kobj_sysfs_ops,
 };
 
diff --git a/drivers/acpi/sysfs.c b/drivers/acpi/sysfs.c
index a99373547126..1948b80e8a4a 100644
--- a/drivers/acpi/sysfs.c
+++ b/drivers/acpi/sysfs.c
@@ -973,6 +973,8 @@ static struct attribute *hotplug_profile_attrs[] = {
 ATTRIBUTE_GROUPS(hotplug_profile);
 
 static const struct kobj_type acpi_hotplug_profile_ktype = {
+	/* Pre-existing: hotplug->kobj is embedded in static struct acpi_scan_hotplug objects. */
+	.release = NULL,
 	.sysfs_ops = &kobj_sysfs_ops,
 	.default_groups = hotplug_profile_groups,
 };
diff --git a/drivers/dma/ioat/sysfs.c b/drivers/dma/ioat/sysfs.c
index e796ddb5383f..5ba44876eb96 100644
--- a/drivers/dma/ioat/sysfs.c
+++ b/drivers/dma/ioat/sysfs.c
@@ -167,6 +167,13 @@ static const struct attribute *const ioat_attrs[] = {
 ATTRIBUTE_GROUPS(ioat);
 
 const struct kobj_type ioat_ktype = {
+	/*
+	 * Pre-existing: ioatdma_chan is freed by release_ioatdma(), not
+	 * by kobject_put(). With CONFIG_DEBUG_KOBJECT_RELEASE the delayed
+	 * kobject cleanup queued by ioat_kobject_del() may run after
+	 * that kfree(), a use-after-free.
+	 */
+	.release = NULL,
 	.sysfs_ops = &ioat_sysfs_ops,
 	.default_groups = ioat_groups,
 };
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c
index 17888cf54447..c2cccd924b03 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c
@@ -885,6 +885,11 @@ static const struct attribute_group ualink_xcp_info_group = {
 };
 
 static const struct kobj_type ualink_xcp_info_ktype = {
+	/*
+	 * Pre-existing: xcp->ualink.kobj is embedded in struct amdgpu_xcp_mgr
+	 * rather than freed individually by kobject_put().
+	 */
+	.release = NULL,
 	.sysfs_ops = &kobj_sysfs_ops
 };
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c
index ab14079d1c42..0847134a1391 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c
@@ -797,6 +797,11 @@ static const struct sysfs_ops xcp_cfg_res_sysfs_ops = {
 };
 
 static const struct kobj_type xcp_cfg_res_sysfs_ktype = {
+	/*
+	 * Pre-existing: xcp_res is embedded in struct amdgpu_xcp_cfg
+	 * rather than freed individually by kobject_put().
+	 */
+	.release = NULL,
 	.sysfs_ops = &xcp_cfg_res_sysfs_ops,
 	.default_groups = xcp_cfg_res_sysfs_groups,
 };
@@ -1061,6 +1066,11 @@ static const struct attribute_group amdgpu_xcp_attrs_group = {
 };
 
 static const struct kobj_type xcp_sysfs_ktype = {
+	/*
+	 * Pre-existing: xcp is embedded in struct amdgpu_xcp_mgr
+	 * rather than freed individually by kobject_put().
+	 */
+	.release = NULL,
 	.sysfs_ops = &kobj_sysfs_ops,
 };
 
diff --git a/drivers/infiniband/hw/hfi1/sysfs.c b/drivers/infiniband/hw/hfi1/sysfs.c
index 372cfd13dc61..5a1aca06b542 100644
--- a/drivers/infiniband/hw/hfi1/sysfs.c
+++ b/drivers/infiniband/hw/hfi1/sysfs.c
@@ -608,6 +608,11 @@ static const struct sysfs_ops sde_sysfs_ops = {
 };
 
 static struct kobj_type sde_ktype = {
+	/*
+	 * Pre-existing: sdma_engine is embedded in dd->per_sdma array
+	 * rather than freed by kobject_put().
+	 */
+	.release = NULL,
 	.sysfs_ops = &sde_sysfs_ops,
 };
 
diff --git a/drivers/infiniband/hw/usnic/usnic_ib_sysfs.c b/drivers/infiniband/hw/usnic/usnic_ib_sysfs.c
index fdb63a8fb997..df0e48070c2e 100644
--- a/drivers/infiniband/hw/usnic/usnic_ib_sysfs.c
+++ b/drivers/infiniband/hw/usnic/usnic_ib_sysfs.c
@@ -245,6 +245,8 @@ static struct attribute *usnic_ib_qpn_default_attrs[] = {
 ATTRIBUTE_GROUPS(usnic_ib_qpn_default);
 
 static struct kobj_type usnic_ib_qpn_type = {
+	/* Pre-existing: usnic_ib_qp_grp is embedded in RDMA core-managed struct usnic_ib_qp_grp. */
+	.release = NULL,
 	.sysfs_ops = &usnic_ib_qpn_sysfs_ops,
 	.default_groups = usnic_ib_qpn_default_groups,
 };
diff --git a/drivers/parisc/pdc_stable.c b/drivers/parisc/pdc_stable.c
index 6b567a74fc2c..2f530e8c6757 100644
--- a/drivers/parisc/pdc_stable.c
+++ b/drivers/parisc/pdc_stable.c
@@ -484,6 +484,11 @@ ATTRIBUTE_GROUPS(paths_subsys);
 
 /* Specific kobject type for our PDC paths */
 static const struct kobj_type ktype_pdcspath = {
+	/*
+	 * Pre-existing: pdcspath_entry instances are static; lifetime
+	 * is not controlled by kobject_put().
+	 */
+	.release = NULL,
 	.sysfs_ops = &pdcspath_attr_ops,
 	.default_groups = paths_subsys_groups,
 };
diff --git a/drivers/power/supply/ab8500_fg.c b/drivers/power/supply/ab8500_fg.c
index e6b5efdf5dc9..d62411e4f535 100644
--- a/drivers/power/supply/ab8500_fg.c
+++ b/drivers/power/supply/ab8500_fg.c
@@ -2531,6 +2531,11 @@ static struct attribute *ab8500_fg_attrs[] = {
 ATTRIBUTE_GROUPS(ab8500_fg);
 
 static const struct kobj_type ab8500_fg_ktype = {
+	/*
+	 * Pre-existing: fg_kobject is embedded in devm-allocated struct
+	 * ab8500_fg; ab8500_fg_sysfs_exit() only calls kobject_del().
+	 */
+	.release = NULL,
 	.sysfs_ops = &ab8500_fg_sysfs_ops,
 	.default_groups = ab8500_fg_groups,
 };
diff --git a/drivers/s390/char/sclp_mem.c b/drivers/s390/char/sclp_mem.c
index 6df1926d4c62..2fb7271dce36 100644
--- a/drivers/s390/char/sclp_mem.c
+++ b/drivers/s390/char/sclp_mem.c
@@ -305,6 +305,8 @@ static ssize_t sclp_memmap_on_memory_store(struct kobject *kobj, struct kobj_att
 }
 
 static const struct kobj_type ktype = {
+	/* Pre-existing: permanent firmware kobjects, never freed */
+	.release = NULL,
 	.sysfs_ops = &kobj_sysfs_ops,
 };
 
diff --git a/drivers/soc/hisilicon/kunpeng_hccs.c b/drivers/soc/hisilicon/kunpeng_hccs.c
index 0cc2953d59a5..da7a64c95058 100644
--- a/drivers/soc/hisilicon/kunpeng_hccs.c
+++ b/drivers/soc/hisilicon/kunpeng_hccs.c
@@ -1038,6 +1038,13 @@ static struct attribute *hccs_port_default_attrs[] = {
 ATTRIBUTE_GROUPS(hccs_port_default);
 
 static const struct kobj_type hccs_port_type = {
+	/*
+	 * Pre-existing: hccs_port_info is allocated via devm_kzalloc()
+	 * rather than freed by kobject_put(). With
+	 * CONFIG_DEBUG_KOBJECT_RELEASE the delayed kobject cleanup may run
+	 * after devm frees it on unbind, a use-after-free.
+	 */
+	.release = NULL,
 	.sysfs_ops = &hccs_comm_ops,
 	.default_groups = hccs_port_default_groups,
 };
@@ -1110,6 +1117,13 @@ static struct attribute *hccs_die_default_attrs[] = {
 ATTRIBUTE_GROUPS(hccs_die_default);
 
 static const struct kobj_type hccs_die_type = {
+	/*
+	 * Pre-existing: hccs_die_info is allocated via devm_kzalloc()
+	 * rather than freed by kobject_put(). With
+	 * CONFIG_DEBUG_KOBJECT_RELEASE the delayed kobject cleanup may run
+	 * after devm frees it on unbind, a use-after-free.
+	 */
+	.release = NULL,
 	.sysfs_ops = &hccs_comm_ops,
 	.default_groups = hccs_die_default_groups,
 };
@@ -1213,6 +1227,13 @@ static struct attribute *hccs_chip_default_attrs[] = {
 ATTRIBUTE_GROUPS(hccs_chip_default);
 
 static const struct kobj_type hccs_chip_type = {
+	/*
+	 * Pre-existing: hccs_chip_info is allocated via devm_kzalloc()
+	 * rather than freed by kobject_put(). With
+	 * CONFIG_DEBUG_KOBJECT_RELEASE the delayed kobject cleanup may run
+	 * after devm frees it on unbind, a use-after-free.
+	 */
+	.release = NULL,
 	.sysfs_ops = &hccs_comm_ops,
 	.default_groups = hccs_chip_default_groups,
 };
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/display-sysfs.c b/drivers/video/fbdev/omap2/omapfb/dss/display-sysfs.c
index ae937854403b..452920a4e2a9 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/display-sysfs.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/display-sysfs.c
@@ -304,6 +304,13 @@ static const struct sysfs_ops display_sysfs_ops = {
 };
 
 static struct kobj_type display_ktype = {
+	/*
+	 * Pre-existing: dssdev->kobj is embedded in struct omap_dss_device
+	 * and zeroed in display_uninit_sysfs() right after kobject_put().
+	 * With CONFIG_DEBUG_KOBJECT_RELEASE that memset() clobbers the
+	 * pending delayed kobject cleanup.
+	 */
+	.release = NULL,
 	.sysfs_ops = &display_sysfs_ops,
 	.default_groups = display_sysfs_groups,
 };
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/manager-sysfs.c b/drivers/video/fbdev/omap2/omapfb/dss/manager-sysfs.c
index 1b644be5fe2e..40ec750f4315 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/manager-sysfs.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/manager-sysfs.c
@@ -496,6 +496,11 @@ static const struct sysfs_ops manager_sysfs_ops = {
 };
 
 static struct kobj_type manager_ktype = {
+	/*
+	 * Pre-existing: mgr->kobj is embedded in static managers[] and
+	 * zeroed in dss_manager_kobj_uninit().
+	 */
+	.release = NULL,
 	.sysfs_ops = &manager_sysfs_ops,
 	.default_groups = manager_sysfs_groups,
 };
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/overlay-sysfs.c b/drivers/video/fbdev/omap2/omapfb/dss/overlay-sysfs.c
index 1da4fb1c77b4..4d333031b18d 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/overlay-sysfs.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/overlay-sysfs.c
@@ -429,6 +429,11 @@ static const struct sysfs_ops overlay_sysfs_ops = {
 };
 
 static struct kobj_type overlay_ktype = {
+	/*
+	 * Pre-existing: ovl->kobj is embedded in static overlays[];
+	 * dss_overlay_kobj_uninit() drops the kobject ref.
+	 */
+	.release = NULL,
 	.sysfs_ops = &overlay_sysfs_ops,
 	.default_groups = overlay_sysfs_groups,
 };
diff --git a/fs/erofs/sysfs.c b/fs/erofs/sysfs.c
index dfcec9376cd5..2ea6773cd98f 100644
--- a/fs/erofs/sysfs.c
+++ b/fs/erofs/sysfs.c
@@ -238,6 +238,11 @@ static const struct kobj_type erofs_sb_ktype = {
 static const struct kobj_type erofs_ktype = {
 	.default_groups = erofs_groups,
 	.sysfs_ops	= &erofs_attr_ops,
+	/*
+	 * Pre-existing: erofs_root is a static struct kset; lifetime
+	 * is not controlled by kobject_put().
+	 */
+	.release	= NULL,
 };
 
 static struct kset erofs_root = {
@@ -247,6 +252,11 @@ static struct kset erofs_root = {
 static const struct kobj_type erofs_feat_ktype = {
 	.default_groups = erofs_feat_groups,
 	.sysfs_ops	= &erofs_attr_ops,
+	/*
+	 * Pre-existing: erofs_feat is a static struct kobject; lifetime
+	 * is not controlled by kobject_put().
+	 */
+	.release	= NULL,
 };
 
 static struct kobject erofs_feat = {
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 430356e500af..6e15695cb75f 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -1683,6 +1683,11 @@ static const struct kobj_type f2fs_sb_ktype = {
 
 static const struct kobj_type f2fs_ktype = {
 	.sysfs_ops	= &f2fs_attr_ops,
+	/*
+	 * Pre-existing: f2fs_kset is a static struct kset; lifetime
+	 * is not controlled by kobject_put().
+	 */
+	.release	= NULL,
 };
 
 static struct kset f2fs_kset = {
@@ -1697,6 +1702,11 @@ static const struct sysfs_ops f2fs_feat_attr_ops = {
 static const struct kobj_type f2fs_feat_ktype = {
 	.default_groups = f2fs_feat_groups,
 	.sysfs_ops	= &f2fs_feat_attr_ops,
+	/*
+	 * Pre-existing: f2fs_feat is a static struct kobject; lifetime
+	 * is not controlled by kobject_put().
+	 */
+	.release	= NULL,
 };
 
 static struct kobject f2fs_feat = {
@@ -1711,6 +1721,11 @@ static const struct sysfs_ops f2fs_tune_attr_ops = {
 static const struct kobj_type f2fs_tune_ktype = {
 	.default_groups = f2fs_tune_groups,
 	.sysfs_ops	= &f2fs_tune_attr_ops,
+	/*
+	 * Pre-existing: f2fs_tune is a static struct kobject; lifetime
+	 * is not controlled by kobject_put().
+	 */
+	.release	= NULL,
 };
 
 static struct kobject f2fs_tune = {
diff --git a/fs/ocfs2/cluster/masklog.c b/fs/ocfs2/cluster/masklog.c
index 563881ddbf00..ff8a1cf51e72 100644
--- a/fs/ocfs2/cluster/masklog.c
+++ b/fs/ocfs2/cluster/masklog.c
@@ -147,6 +147,11 @@ static const struct sysfs_ops mlog_attr_ops = {
 static struct kobj_type mlog_ktype = {
 	.default_groups = mlog_default_groups,
 	.sysfs_ops      = &mlog_attr_ops,
+	/*
+	 * Pre-existing: mlog_kset is a static struct kset; lifetime
+	 * is not controlled by kobject_put().
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
2.56.0.313.g2479322e68-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
