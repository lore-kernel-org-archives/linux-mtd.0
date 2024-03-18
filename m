Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FF49C54E58
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Mar 2024 14:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=g28DIw+NvXl3J4gZWmc7/GHYjxs0qiECwdnIsuMBOLY=; b=T0fo+V0MeQvNLr
	+qOYrs8HA3SGiGc6Clk9rgPp2KK4o4cntLTGbv8r7PgPl1irxhhsD3iDHtGlGX3pt5ZSt0AQGoK+w
	JzrquXF/VzeOxyOKT7W16nCGrtLY7+a8oEMHy39Mpw9A8SuGkumDQ2/LIoZaSBlU4LQsdeUhtAYqk
	Oa49qpxHJrEdY6RVCS3/V41yEwDPasrfr3zKbaxqYfQFZ4StD2q+uSMNaIoscVwRzn7/HfzTrLSJB
	2NTjiOtQ+64d/lE23eQHhSdawyaoF7CD9qi4pfyfVAzPBGrxcAddraiNNI+zBiShNpznvJixEuLOj
	cyCgwAMswdQZk1dbb0Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmE4C-00000008pO3-0Ebl;
	Mon, 18 Mar 2024 14:34:20 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmE47-00000008pJa-2cRx
	for linux-mtd@lists.infradead.org;
	Mon, 18 Mar 2024 14:34:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710772455; x=1742308455;
  h=date:from:to:cc:subject:message-id;
  bh=MOxrcp8dNBjE239ED4v6NC3w2CWiNwiSbQh9zF+bW5g=;
  b=lgX2iH2LD0K4XqKJ/mcPRR4oGosDtbksu09e+NiWKPo/47yZjHHNtwqu
   XbaOrvct2XUe98BvDcGm/u2XN1r84TeaeVXnRVDRw4D/ickQ2QqtXaig9
   Cr+T1rmCoThdy520pPzSc+Y/s4NYyp0MQLRhffo5LuGHtLEitdmy5aKWS
   yBoy2slQzAjz9Z6PL9+RUTSarR/7VCKc7RpuYMkUyjuukVFDgqcEv44dN
   lXtiyAPeyK4gBUCqTChVZi3+n59jDqle0zxz8FXGyl+WQ7y7kgZbzs1GZ
   J4u0EVF8UsCY66nEHFvjUnCEpOyxLkSzqZKDbA4gs4fOnTyNFj6lrZTRp
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="9360741"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="9360741"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2024 07:34:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="13960516"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 18 Mar 2024 07:34:05 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rmE3u-000H1A-16;
	Mon, 18 Mar 2024 14:34:02 +0000
Date: Mon, 18 Mar 2024 22:33:25 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Memory Management List <linux-mm@kvack.org>,
 amd-gfx@lists.freedesktop.org, bpf@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org,
 netdev@vger.kernel.org
Subject: [linux-next:master] BUILD REGRESSION
 2e93f143ca010a5013528e1cfdc895f024fe8c21
Message-ID: <202403182219.XrvfZx4s-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_073415_915454_F413BC84 
X-CRM114-Status: UNSURE (   4.64  )
X-CRM114-Notice: Please train this message.
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: 2e93f143ca010a5013528e1cfdc895f024fe8c21  Add linux-next specific files for 20240318

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- arc-allmodconfig
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- arc-allyesconfig
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- arm-allmodconfig
|   |-- arch-arm-mach-omap2-prm33xx.c:warning:expecting-prototype-for-am33xx_prm_global_warm_sw_reset().-Prototype-was-for-am33xx_prm_global_sw_reset()-instead
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vcn.c:warning:.bin-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- arm-allyesconfig
|   |-- arch-arm-mach-omap2-prm33xx.c:warning:expecting-prototype-for-am33xx_prm_global_warm_sw_reset().-Prototype-was-for-am33xx_prm_global_sw_reset()-instead
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vcn.c:warning:.bin-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- arm64-defconfig
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- csky-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vcn.c:warning:.bin-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- csky-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vcn.c:warning:.bin-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- i386-allyesconfig
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- i386-randconfig-001-20240318
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- i386-randconfig-004-20240318
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- i386-randconfig-011-20240318
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- i386-randconfig-141-20240318
|   `-- fs-exfat-dir.c-__exfat_get_dentry_set()-warn:missing-unwind-goto
|-- loongarch-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vcn.c:warning:.bin-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- m68k-allmodconfig
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- m68k-allyesconfig
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- microblaze-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vcn.c:warning:.bin-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- microblaze-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vcn.c:warning:.bin-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- mips-allyesconfig
|   |-- (.ref.text):relocation-truncated-to-fit:R_MIPS_26-against-start_secondary
|   |-- (.text):relocation-truncated-to-fit:R_MIPS_26-against-kernel_entry
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- nios2-allmodconfig
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- nios2-allyesconfig
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- openrisc-allyesconfig
|   |-- (.head.text):relocation-truncated-to-fit:R_OR1K_INSN_REL_26-against-no-symbol
|   |-- (.text):relocation-truncated-to-fit:R_OR1K_INSN_REL_26-against-no-symbol
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vcn.c:warning:.bin-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
|   |-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|   `-- main.c:(.text):relocation-truncated-to-fit:R_OR1K_INSN_REL_26-against-symbol-__muldi3-defined-in-.text-section-in-..-lib-gcc-or1k-linux-..-libgcc.a(_muldi3.o)
|-- parisc-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vcn.c:warning:.bin-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- parisc-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vcn.c:warning:.bin-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- parisc-randconfig-001-20240318
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_vcn.c:warning:.bin-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
|-- parisc-randconfig-r113-20240318
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_vcn.c:warning:.bin-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
|-- powerpc-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vcn.c:warning:.bin-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- powerpc-randconfig-002-20240318
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_vcn.c:warning:.bin-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
|-- powerpc64-randconfig-002-20240318
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_vcn.c:warning:.bin-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
|-- powerpc64-randconfig-003-20240318
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_vcn.c:warning:.bin-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
|-- riscv-randconfig-001-20240318
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- sh-sdk7786_defconfig
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- sparc-randconfig-001-20240318
|   |-- (.head.text):relocation-truncated-to-fit:R_SPARC_WDISP22-against-init.text
|   `-- (.init.text):relocation-truncated-to-fit:R_SPARC_WDISP22-against-symbol-leon_smp_cpu_startup-defined-in-.text-section-in-arch-sparc-kernel-trampoline_32.o
|-- sparc-randconfig-002-20240318
|   |-- (.head.text):relocation-truncated-to-fit:R_SPARC_WDISP22-against-init.text
|   `-- (.init.text):relocation-truncated-to-fit:R_SPARC_WDISP22-against-symbol-leon_smp_cpu_startup-defined-in-.text-section-in-arch-sparc-kernel-trampoline_32.o
|-- sparc64-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vcn.c:warning:.bin-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- sparc64-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vcn.c:warning:.bin-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- sparc64-randconfig-001-20240318
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_vcn.c:warning:.bin-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
|-- sparc64-randconfig-002-20240318
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vcn.c:warning:.bin-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- sparc64-randconfig-r131-20240318
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_vcn.c:warning:.bin-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
|-- x86_64-buildonly-randconfig-002-20240318
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- x86_64-buildonly-randconfig-003-20240318
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- x86_64-buildonly-randconfig-005-20240318
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_vcn.c:warning:.bin-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
|-- x86_64-randconfig-072-20240318
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- x86_64-randconfig-073-20240318
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- x86_64-randconfig-076-20240318
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_vcn.c:warning:.bin-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
`-- x86_64-randconfig-161-20240318
    |-- drivers-pinctrl-pinctrl-aw9523.c-aw9523_gpio_get_multiple()-error:uninitialized-symbol-ret-.
    `-- drivers-pinctrl-pinctrl-aw9523.c-aw9523_pconf_set()-error:uninitialized-symbol-rc-.
clang_recent_errors
|-- arm-defconfig
|   |-- arch-arm-mach-omap2-prm33xx.c:warning:expecting-prototype-for-am33xx_prm_global_warm_sw_reset().-Prototype-was-for-am33xx_prm_global_sw_reset()-instead
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- arm-randconfig-002-20240318
|   `-- arch-arm-mach-omap2-prm33xx.c:warning:expecting-prototype-for-am33xx_prm_global_warm_sw_reset().-Prototype-was-for-am33xx_prm_global_sw_reset()-instead
|-- arm-randconfig-003-20240318
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- hexagon-randconfig-r121-20240318
|   |-- fs-libfs.c:sparse:sparse:Using-plain-integer-as-NULL-pointer
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- mips-randconfig-r111-20240318
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- powerpc-allyesconfig
|   |-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|   `-- kernel-bpf-bpf_struct_ops.c:warning:bitwise-operation-between-different-enumeration-types-(-enum-bpf_type_flag-and-enum-bpf_reg_type-)
|-- powerpc-randconfig-001-20240318
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- riscv-allmodconfig
|   |-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|   `-- kernel-bpf-bpf_struct_ops.c:warning:bitwise-operation-between-different-enumeration-types-(-enum-bpf_type_flag-and-enum-bpf_reg_type-)
|-- riscv-allyesconfig
|   |-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|   `-- kernel-bpf-bpf_struct_ops.c:warning:bitwise-operation-between-different-enumeration-types-(-enum-bpf_type_flag-and-enum-bpf_reg_type-)
|-- s390-defconfig
|   `-- kernel-bpf-bpf_struct_ops.c:warning:bitwise-operation-between-different-enumeration-types-(-enum-bpf_type_flag-and-enum-bpf_reg_type-)
|-- x86_64-randconfig-002-20240318
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
`-- x86_64-randconfig-074-20240318
    `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead

elapsed time: 729m

configs tested: 179
configs skipped: 4

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240318   gcc  
arc                   randconfig-002-20240318   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                           omap1_defconfig   gcc  
arm                   randconfig-001-20240318   clang
arm                   randconfig-002-20240318   clang
arm                   randconfig-003-20240318   clang
arm                   randconfig-004-20240318   gcc  
arm                         s5pv210_defconfig   gcc  
arm                        shmobile_defconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240318   gcc  
arm64                 randconfig-002-20240318   gcc  
arm64                 randconfig-003-20240318   clang
arm64                 randconfig-004-20240318   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240318   gcc  
csky                  randconfig-002-20240318   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240318   clang
hexagon               randconfig-002-20240318   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240318   gcc  
i386         buildonly-randconfig-002-20240318   clang
i386         buildonly-randconfig-003-20240318   clang
i386         buildonly-randconfig-004-20240318   clang
i386         buildonly-randconfig-005-20240318   gcc  
i386         buildonly-randconfig-006-20240318   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240318   gcc  
i386                  randconfig-002-20240318   clang
i386                  randconfig-003-20240318   gcc  
i386                  randconfig-004-20240318   gcc  
i386                  randconfig-005-20240318   gcc  
i386                  randconfig-006-20240318   gcc  
i386                  randconfig-011-20240318   gcc  
i386                  randconfig-012-20240318   clang
i386                  randconfig-013-20240318   clang
i386                  randconfig-014-20240318   clang
i386                  randconfig-015-20240318   clang
i386                  randconfig-016-20240318   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240318   gcc  
loongarch             randconfig-002-20240318   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5208evb_defconfig   gcc  
m68k                       m5249evb_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                        bcm47xx_defconfig   clang
mips                       bmips_be_defconfig   gcc  
mips                       lemote2f_defconfig   gcc  
mips                         rt305x_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240318   gcc  
nios2                 randconfig-002-20240318   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240318   gcc  
parisc                randconfig-002-20240318   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                   motionpro_defconfig   clang
powerpc                         ps3_defconfig   gcc  
powerpc               randconfig-001-20240318   clang
powerpc               randconfig-002-20240318   gcc  
powerpc               randconfig-003-20240318   clang
powerpc                     redwood_defconfig   clang
powerpc                         wii_defconfig   gcc  
powerpc64             randconfig-001-20240318   clang
powerpc64             randconfig-002-20240318   gcc  
powerpc64             randconfig-003-20240318   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240318   gcc  
riscv                 randconfig-002-20240318   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240318   clang
s390                  randconfig-002-20240318   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                        edosk7760_defconfig   gcc  
sh                    randconfig-001-20240318   gcc  
sh                    randconfig-002-20240318   gcc  
sh                          sdk7786_defconfig   gcc  
sh                        sh7757lcr_defconfig   gcc  
sparc                            alldefconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240318   gcc  
sparc64               randconfig-002-20240318   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240318   gcc  
um                    randconfig-002-20240318   clang
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240318   gcc  
x86_64       buildonly-randconfig-002-20240318   gcc  
x86_64       buildonly-randconfig-003-20240318   gcc  
x86_64       buildonly-randconfig-004-20240318   gcc  
x86_64       buildonly-randconfig-005-20240318   gcc  
x86_64       buildonly-randconfig-006-20240318   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240318   gcc  
x86_64                randconfig-002-20240318   clang
x86_64                randconfig-003-20240318   clang
x86_64                randconfig-004-20240318   clang
x86_64                randconfig-005-20240318   clang
x86_64                randconfig-006-20240318   gcc  
x86_64                randconfig-011-20240318   clang
x86_64                randconfig-012-20240318   clang
x86_64                randconfig-013-20240318   gcc  
x86_64                randconfig-014-20240318   gcc  
x86_64                randconfig-015-20240318   clang
x86_64                randconfig-016-20240318   gcc  
x86_64                randconfig-071-20240318   gcc  
x86_64                randconfig-072-20240318   gcc  
x86_64                randconfig-073-20240318   gcc  
x86_64                randconfig-074-20240318   clang
x86_64                randconfig-075-20240318   gcc  
x86_64                randconfig-076-20240318   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240318   gcc  
xtensa                randconfig-002-20240318   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
