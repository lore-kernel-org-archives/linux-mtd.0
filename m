Return-Path: <SRS0=GAhz=T5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEAADC28CC0
	for <linux-mtd@archiver.kernel.org>; Wed, 29 May 2019 23:24:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F1B424323
	for <linux-mtd@archiver.kernel.org>; Wed, 29 May 2019 23:24:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P4qAhz7H"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F1B424323
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GhbZy/nGbaNrOFVAXOxU9bBd5SKErnj+y2V0QohWj8I=; b=P4qAhz7H7osNyn
	s+RtluEKobQyzqXMI9qOdFSfZrOGVPaFwdx49X3gFV9o/wJf0tGhRbgzwQD4EZKng+bohTlViSCfx
	NYvBOLhjbN2E+eJeoV9DoPFeb/kPzWqmFbJwNmVU87ioVrMXVO7bzPH6kFRmVNh/dhmaKggrf2J/v
	Ou+u40U/Hm3vyhhV9MclR5+x6m6zZpnXru4xt3BxyM0bs/kEwPcTlMPJlypmFaCLOP/i6q6/J0/Ef
	LciRpHik+8Dsg/ddpwVEKsBVolApXnS56RxiPAeFVcMN+FuNRtUt8xArkh1mW0GRoyTULZgsXr9qk
	4Yca/jfpcb65bQsv/rYQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hW7vZ-0005kf-I4; Wed, 29 May 2019 23:24:13 +0000
Received: from 177.132.232.81.dynamic.adsl.gvt.net.br ([177.132.232.81]
 helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hW7vL-0005Rx-II; Wed, 29 May 2019 23:23:59 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
 (envelope-from <mchehab@bombadil.infradead.org>)
 id 1hW7vI-0007wg-Fn; Wed, 29 May 2019 20:23:56 -0300
From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: [PATCH 00/22] Some documentation fixes
Date: Wed, 29 May 2019 20:23:31 -0300
Message-Id: <cover.1559171394.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: alsa-devel@alsa-project.org, kvm@vger.kernel.org, linux-pci@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, keyrings@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-i2c@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, devel@driverdev.osuosl.org,
 Jonathan Corbet <corbet@lwn.net>, x86@kernel.org, linux-acpi@vger.kernel.org,
 xen-devel@lists.xenproject.org, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, Mauro Carvalho Chehab <mchehab@infradead.org>,
 linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org,
 bpf@vger.kernel.org, devel@acpica.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 netdev@vger.kernel.org, linux-integrity@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Fix several warnings and broken links.

This series was generated against linux-next, but was rebased to be applied at
docs-next. It should apply cleanly on either tree.

There's a git tree with all of them applied on the top of docs/docs-next
at:

https://git.linuxtv.org/mchehab/experimental.git/log/?h=fix_doc_links_v2


Mauro Carvalho Chehab (21):
  ABI: sysfs-devices-system-cpu: point to the right docs
  isdn: mISDN: remove a bogus reference to a non-existing doc
  dt: fix broken references to nand.txt
  docs: zh_CN: get rid of basic_profiling.txt
  doc: it_IT: fix reference to magic-number.rst
  docs: mm: numaperf.rst: get rid of a build warning
  docs: bpf: get rid of two warnings
  docs: mark orphan documents as such
  docs: amd-memory-encryption.rst get rid of warnings
  gpu: amdgpu: fix broken amdgpu_dma_buf.c references
  gpu: i915.rst: Fix references to renamed files
  docs: zh_CN: avoid duplicate citation references
  docs: vm: hmm.rst: fix some warnings
  docs: it: license-rules.rst: get rid of warnings
  docs: gpio: driver.rst: fix a bad tag
  docs: soundwire: locking: fix tags for a code-block
  docs: security: trusted-encrypted.rst: fix code-block tag
  docs: security: core.rst: Fix several warnings
  docs: net: dpio-driver.rst: fix two codeblock warnings
  docs: net: sja1105.rst: fix table format
  docs: fix broken documentation links

Otto Sabart (1):
  mfd: madera: Fix bad reference to pinctrl.txt file

 .../ABI/testing/sysfs-devices-system-cpu      |  3 +-
 Documentation/accelerators/ocxl.rst           |  2 +
 Documentation/acpi/dsd/leds.txt               |  2 +-
 .../admin-guide/kernel-parameters.rst         |  6 +-
 .../admin-guide/kernel-parameters.txt         | 16 ++---
 Documentation/admin-guide/mm/numaperf.rst     |  5 +-
 Documentation/admin-guide/ras.rst             |  2 +-
 Documentation/arm/stm32/overview.rst          |  2 +
 .../arm/stm32/stm32f429-overview.rst          |  2 +
 .../arm/stm32/stm32f746-overview.rst          |  2 +
 .../arm/stm32/stm32f769-overview.rst          |  2 +
 .../arm/stm32/stm32h743-overview.rst          |  2 +
 .../arm/stm32/stm32mp157-overview.rst         |  2 +
 Documentation/bpf/btf.rst                     |  2 +
 .../bindings/mtd/amlogic,meson-nand.txt       |  2 +-
 .../devicetree/bindings/mtd/gpmc-nand.txt     |  2 +-
 .../devicetree/bindings/mtd/marvell-nand.txt  |  2 +-
 .../devicetree/bindings/mtd/tango-nand.txt    |  2 +-
 .../devicetree/bindings/net/fsl-enetc.txt     |  7 +-
 .../bindings/pci/amlogic,meson-pcie.txt       |  2 +-
 .../regulator/qcom,rpmh-regulator.txt         |  2 +-
 .../devicetree/booting-without-of.txt         |  2 +-
 Documentation/driver-api/gpio/board.rst       |  2 +-
 Documentation/driver-api/gpio/consumer.rst    |  2 +-
 Documentation/driver-api/gpio/driver.rst      |  2 +-
 .../driver-api/soundwire/locking.rst          |  4 +-
 .../firmware-guide/acpi/enumeration.rst       |  2 +-
 .../firmware-guide/acpi/method-tracing.rst    |  2 +-
 Documentation/gpu/amdgpu.rst                  |  4 +-
 Documentation/gpu/i915.rst                    |  6 +-
 Documentation/gpu/msm-crash-dump.rst          |  2 +
 Documentation/i2c/instantiating-devices       |  2 +-
 Documentation/interconnect/interconnect.rst   |  2 +
 Documentation/laptops/lg-laptop.rst           |  2 +
 .../freescale/dpaa2/dpio-driver.rst           |  4 +-
 Documentation/networking/dsa/sja1105.rst      |  6 +-
 Documentation/powerpc/isa-versions.rst        |  2 +
 Documentation/security/keys/core.rst          | 16 +++--
 .../security/keys/trusted-encrypted.rst       |  4 +-
 Documentation/sysctl/kernel.txt               |  4 +-
 .../translations/it_IT/process/howto.rst      |  2 +-
 .../it_IT/process/license-rules.rst           | 28 ++++----
 .../it_IT/process/magic-number.rst            |  2 +-
 .../it_IT/process/stable-kernel-rules.rst     |  4 +-
 .../translations/zh_CN/basic_profiling.txt    | 71 -------------------
 .../translations/zh_CN/process/4.Coding.rst   |  2 +-
 .../zh_CN/process/management-style.rst        |  4 +-
 .../zh_CN/process/programming-language.rst    | 28 ++++----
 .../virtual/kvm/amd-memory-encryption.rst     |  5 ++
 Documentation/virtual/kvm/vcpu-requests.rst   |  2 +
 Documentation/vm/hmm.rst                      |  9 ++-
 Documentation/x86/x86_64/5level-paging.rst    |  2 +-
 Documentation/x86/x86_64/boot-options.rst     |  4 +-
 .../x86/x86_64/fake-numa-for-cpusets.rst      |  2 +-
 MAINTAINERS                                   |  6 +-
 arch/arm/Kconfig                              |  2 +-
 arch/arm64/kernel/kexec_image.c               |  2 +-
 arch/powerpc/Kconfig                          |  2 +-
 arch/x86/Kconfig                              | 16 ++---
 arch/x86/Kconfig.debug                        |  2 +-
 arch/x86/boot/header.S                        |  2 +-
 arch/x86/entry/entry_64.S                     |  2 +-
 arch/x86/include/asm/bootparam_utils.h        |  2 +-
 arch/x86/include/asm/page_64_types.h          |  2 +-
 arch/x86/include/asm/pgtable_64_types.h       |  2 +-
 arch/x86/kernel/cpu/microcode/amd.c           |  2 +-
 arch/x86/kernel/kexec-bzimage64.c             |  2 +-
 arch/x86/kernel/pci-dma.c                     |  2 +-
 arch/x86/mm/tlb.c                             |  2 +-
 arch/x86/platform/pvh/enlighten.c             |  2 +-
 drivers/acpi/Kconfig                          | 10 +--
 drivers/isdn/mISDN/dsp_core.c                 |  2 -
 drivers/net/ethernet/faraday/ftgmac100.c      |  2 +-
 .../fieldbus/Documentation/fieldbus_dev.txt   |  4 +-
 drivers/vhost/vhost.c                         |  2 +-
 include/acpi/acpi_drivers.h                   |  2 +-
 include/linux/fs_context.h                    |  2 +-
 include/linux/lsm_hooks.h                     |  2 +-
 include/linux/mfd/madera/pdata.h              |  3 +-
 mm/Kconfig                                    |  2 +-
 security/Kconfig                              |  2 +-
 tools/include/linux/err.h                     |  2 +-
 .../Documentation/stack-validation.txt        |  4 +-
 tools/testing/selftests/x86/protection_keys.c |  2 +-
 84 files changed, 183 insertions(+), 212 deletions(-)
 delete mode 100644 Documentation/translations/zh_CN/basic_profiling.txt

-- 
2.21.0



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
