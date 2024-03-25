Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7223C54E58
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Mar 2024 15:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3S+n0JhA6cyOtfsq1V0vZ+6/We6SQgUtM3N/kiGQTuQ=; b=0ab5ugUMQ6Z4ML
	7A7YoGXbUsOJyBex0FXKxnRzgKLMxbTGUUWgIzQxQvgH/ljAQNHJXjYaWERpM7Ckb6FS4Q3J1ZVLM
	0ilxKWfjc/w+zBBJ9l1jZApSX2O26kOZ6CVdBHI+OJVOudmQSAbQIQiRznZUVh9u5INwE7dxz3U2c
	MijnBHS/xLeMLoXTmzfFN+rRdhK+Zm2aoMfBfoGfWC6qnPNoyvGV1eawXC9mKadsAGJdLzLg/kBFB
	3mTAhWxqlaeKtYCMLqAYVeKhMLb9OWpD03yvNGTffC1bS8+wNUW2Ic0+nD1YKmpu9n4VTkcIKERYQ
	663e53zPF1Pc5HWnaGOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rolsi-00000000O19-1lvF;
	Mon, 25 Mar 2024 15:05:00 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rolse-00000000Nza-2vt5
	for linux-mtd@lists.infradead.org;
	Mon, 25 Mar 2024 15:04:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711379096; x=1742915096;
  h=date:from:to:cc:subject:message-id;
  bh=llbW1zEuQ8ZP6tzdb+lMBFGFfOB7sgRP8pFPM8tlm4k=;
  b=g42jksREazu734g7FOMPcOcLgDPfeJsh8mII/9D8A5RXK8jxNxZMgwPN
   cdXWTCPB3ZErRnoqsjr1J/pDZHbsW3hSECPycYAkx0EdPHp3nOKcEBuSr
   r62Y5pt5Q7WYiAwGmNFmttbF0ab777NT+T+QJE09auKQt+emYcYvStw4m
   UA4nKcYN3ymhJbG+BSK8JmcB6KhkKPhOKsQu2AjEoiWc5k/qqBXFk8PHz
   BHFamu1pEZow4ftqdAQayq2zeozPqINMv47PghuiUwelXinexsWpvi4i3
   lD6hEr7OaaY1N/hEqwxJcloQ8iXOCIm2mkFELuLUG9oRoNXEP0VctLUDC
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="6250709"
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; 
   d="scan'208";a="6250709"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 08:04:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; 
   d="scan'208";a="16043244"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 25 Mar 2024 08:04:51 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rolsX-000MeA-1I;
	Mon, 25 Mar 2024 15:04:49 +0000
Date: Mon, 25 Mar 2024 23:04:19 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Memory Management List <linux-mm@kvack.org>,
 bpf@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-usb@vger.kernel.org,
 netdev@vger.kernel.org
Subject: [linux-next:master] BUILD REGRESSION
 1fdad13606e104ff103ca19d2d660830cb36d43e
Message-ID: <202403252312.IByykxpw-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_080457_022122_48EDC585 
X-CRM114-Status: UNSURE (   4.70  )
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
branch HEAD: 1fdad13606e104ff103ca19d2d660830cb36d43e  Add linux-next specific files for 20240325

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202403252127.967BczRr-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

ERROR: modpost: "memcpy" [crypto/cmac.ko] undefined!
ERROR: modpost: "memcpy" [crypto/rsa_generic.ko] undefined!
ERROR: modpost: "memcpy" [fs/ext4/ext4.ko] undefined!
ERROR: modpost: "memcpy" [fs/f2fs/f2fs.ko] undefined!
ERROR: modpost: "memcpy" [fs/isofs/isofs.ko] undefined!
ERROR: modpost: "memcpy" [fs/jbd2/jbd2.ko] undefined!
ERROR: modpost: "memcpy" [fs/nls/nls_euc-jp.ko] undefined!
ERROR: modpost: "memcpy" [fs/xfs/xfs.ko] undefined!
ERROR: modpost: "memcpy" [mm/zsmalloc.ko] undefined!

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- alpha-randconfig-r022-20221031
|   |-- ERROR:memcpy-crypto-cmac.ko-undefined
|   |-- ERROR:memcpy-crypto-rsa_generic.ko-undefined
|   |-- ERROR:memcpy-fs-ext4-ext4.ko-undefined
|   |-- ERROR:memcpy-fs-f2fs-f2fs.ko-undefined
|   |-- ERROR:memcpy-fs-isofs-isofs.ko-undefined
|   |-- ERROR:memcpy-fs-jbd2-jbd2.ko-undefined
|   |-- ERROR:memcpy-fs-nls-nls_euc-jp.ko-undefined
|   |-- ERROR:memcpy-fs-xfs-xfs.ko-undefined
|   `-- ERROR:memcpy-mm-zsmalloc.ko-undefined
|-- arc-allmodconfig
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- arc-allyesconfig
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- arc-randconfig-002-20240325
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- arm-allmodconfig
|   |-- arch-arm-mach-omap2-prm33xx.c:warning:expecting-prototype-for-am33xx_prm_global_warm_sw_reset().-Prototype-was-for-am33xx_prm_global_sw_reset()-instead
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- arm-allyesconfig
|   |-- arch-arm-mach-omap2-prm33xx.c:warning:expecting-prototype-for-am33xx_prm_global_warm_sw_reset().-Prototype-was-for-am33xx_prm_global_sw_reset()-instead
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- arm-vexpress_defconfig
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- arm64-defconfig
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- csky-allmodconfig
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- csky-allyesconfig
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- i386-allmodconfig
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- i386-allyesconfig
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- i386-randconfig-002-20240325
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- i386-randconfig-011-20240325
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- i386-randconfig-141-20240325
|   `-- drivers-usb-typec-tcpm-tcpm.c-tcpm_pd_svdm()-error:uninitialized-symbol-modep_prime-.
|-- loongarch-allmodconfig
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- loongarch-defconfig
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- loongarch-randconfig-002-20240325
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- m68k-allmodconfig
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- m68k-allyesconfig
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- microblaze-allmodconfig
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- microblaze-allyesconfig
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
|   |-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|   `-- main.c:(.text):relocation-truncated-to-fit:R_OR1K_INSN_REL_26-against-symbol-__muldi3-defined-in-.text-section-in-..-lib-gcc-or1k-linux-..-libgcc.a(_muldi3.o)
|-- parisc-allmodconfig
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- parisc-allyesconfig
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- powerpc-allmodconfig
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- s390-allyesconfig
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- sh-allmodconfig
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- sh-allyesconfig
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- sparc-allmodconfig
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- sparc64-allmodconfig
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- sparc64-allyesconfig
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- um-allyesconfig
|   |-- collect2:error:ld-returned-exit-status
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- um-i386_defconfig
|   `-- collect2:error:ld-returned-exit-status
|-- um-randconfig-001-20240325
|   `-- collect2:error:ld-returned-exit-status
|-- x86_64-buildonly-randconfig-004-20240325
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
`-- xtensa-randconfig-001-20240325
    `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
clang_recent_errors
|-- arm-qcom_defconfig
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- arm-randconfig-003-20240325
|   `-- kernel-bpf-bpf_struct_ops.c:warning:bitwise-operation-between-different-enumeration-types-(-enum-bpf_type_flag-and-enum-bpf_reg_type-)
|-- arm64-allmodconfig
|   |-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|   `-- kernel-bpf-bpf_struct_ops.c:warning:bitwise-operation-between-different-enumeration-types-(-enum-bpf_type_flag-and-enum-bpf_reg_type-)
|-- hexagon-allmodconfig
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- hexagon-allyesconfig
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- mips-loongson1b_defconfig
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- powerpc-allyesconfig
|   |-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|   `-- kernel-bpf-bpf_struct_ops.c:warning:bitwise-operation-between-different-enumeration-types-(-enum-bpf_type_flag-and-enum-bpf_reg_type-)
|-- riscv-allmodconfig
|   |-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|   `-- kernel-bpf-bpf_struct_ops.c:warning:bitwise-operation-between-different-enumeration-types-(-enum-bpf_type_flag-and-enum-bpf_reg_type-)
|-- riscv-allyesconfig
|   |-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|   `-- kernel-bpf-bpf_struct_ops.c:warning:bitwise-operation-between-different-enumeration-types-(-enum-bpf_type_flag-and-enum-bpf_reg_type-)
|-- s390-allmodconfig
|   |-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|   `-- kernel-bpf-bpf_struct_ops.c:warning:bitwise-operation-between-different-enumeration-types-(-enum-bpf_type_flag-and-enum-bpf_reg_type-)
|-- s390-defconfig
|   `-- kernel-bpf-bpf_struct_ops.c:warning:bitwise-operation-between-different-enumeration-types-(-enum-bpf_type_flag-and-enum-bpf_reg_type-)
|-- s390-randconfig-002-20240325
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- x86_64-allyesconfig
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
`-- x86_64-buildonly-randconfig-001-20240325
    `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead

elapsed time: 729m

configs tested: 164
configs skipped: 19

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240325   gcc  
arc                   randconfig-002-20240325   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                         axm55xx_defconfig   clang
arm                            mps2_defconfig   clang
arm                            qcom_defconfig   clang
arm                   randconfig-001-20240325   clang
arm                   randconfig-002-20240325   gcc  
arm                   randconfig-003-20240325   clang
arm                        realview_defconfig   clang
arm                        vexpress_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-004-20240325   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240325   gcc  
csky                  randconfig-002-20240325   gcc  
hexagon                          allmodconfig   clang
hexagon                          allyesconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240325   clang
i386         buildonly-randconfig-002-20240325   gcc  
i386         buildonly-randconfig-003-20240325   gcc  
i386         buildonly-randconfig-004-20240325   gcc  
i386         buildonly-randconfig-005-20240325   clang
i386         buildonly-randconfig-006-20240325   clang
i386                                defconfig   clang
i386                  randconfig-001-20240325   gcc  
i386                  randconfig-002-20240325   gcc  
i386                  randconfig-003-20240325   clang
i386                  randconfig-004-20240325   gcc  
i386                  randconfig-005-20240325   gcc  
i386                  randconfig-006-20240325   clang
i386                  randconfig-011-20240325   gcc  
i386                  randconfig-012-20240325   clang
i386                  randconfig-013-20240325   clang
i386                  randconfig-014-20240325   clang
i386                  randconfig-015-20240325   gcc  
i386                  randconfig-016-20240325   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240325   gcc  
loongarch             randconfig-002-20240325   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                     loongson1b_defconfig   clang
nios2                         10m50_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240325   gcc  
nios2                 randconfig-002-20240325   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240325   gcc  
parisc                randconfig-002-20240325   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                       ebony_defconfig   clang
powerpc                   lite5200b_defconfig   clang
powerpc               mpc834x_itxgp_defconfig   clang
powerpc                     taishan_defconfig   clang
powerpc                     tqm8541_defconfig   clang
powerpc                      walnut_defconfig   gcc  
powerpc                 xes_mpc85xx_defconfig   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-002-20240325   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240325   gcc  
s390                  randconfig-002-20240325   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                               j2_defconfig   gcc  
sh                 kfr2r09-romimage_defconfig   gcc  
sh                          lboxre2_defconfig   gcc  
sh                    randconfig-001-20240325   gcc  
sh                    randconfig-002-20240325   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240325   gcc  
sparc64               randconfig-002-20240325   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240325   gcc  
um                    randconfig-002-20240325   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240325   clang
x86_64       buildonly-randconfig-002-20240325   clang
x86_64       buildonly-randconfig-003-20240325   clang
x86_64       buildonly-randconfig-004-20240325   gcc  
x86_64       buildonly-randconfig-005-20240325   clang
x86_64       buildonly-randconfig-006-20240325   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240325   clang
x86_64                randconfig-002-20240325   gcc  
x86_64                randconfig-003-20240325   gcc  
x86_64                randconfig-004-20240325   gcc  
x86_64                randconfig-005-20240325   gcc  
x86_64                randconfig-006-20240325   clang
x86_64                randconfig-011-20240325   clang
x86_64                randconfig-012-20240325   clang
x86_64                randconfig-013-20240325   gcc  
x86_64                randconfig-014-20240325   gcc  
x86_64                randconfig-015-20240325   clang
x86_64                randconfig-016-20240325   gcc  
x86_64                randconfig-071-20240325   clang
x86_64                randconfig-072-20240325   clang
x86_64                randconfig-073-20240325   gcc  
x86_64                randconfig-074-20240325   clang
x86_64                randconfig-075-20240325   clang
x86_64                randconfig-076-20240325   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240325   gcc  
xtensa                randconfig-002-20240325   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
