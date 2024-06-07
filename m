Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 816F1C27C53
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jun 2024 17:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ILc0lqRAvq/mWtFY0jJ984j/VzRGzkoJQq3zs0o6VF4=; b=c16mmqkOp1G3Ub
	FyOOdUfZ+XCO9GBjXtuIoIaSytoujGUfvGV9RnGnftNefKxIVhM9jb6/pcOf+ECwJaqRB05n9d799
	PtW9VVZemlVf6cn0zDACw0sAlh+hZLXMiipVw/UCQhxTbLBHFxlOCrUROIiISZlh3tXK/qATFKBtJ
	TpiXFOMApzRVulAibCjwoWqHlSMMVzo2ajxq4RD5hlsVy6dMoGQHyOyUGjwjGEPV4VzArPXzDjZFV
	FYqGlggkePN8+m9YyJgcnCPIxphrGJNBLXZikq4pylnGeFtE6Ev+R3hvLIyqIxIAnpdJ8hqRwX0Cf
	vmBilC3rdJ3Nkhv3hxfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFd7m-0000000F2UI-14sB;
	Fri, 07 Jun 2024 17:11:34 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFd7i-0000000F2TP-2ytO
	for linux-mtd@lists.infradead.org;
	Fri, 07 Jun 2024 17:11:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717780291; x=1749316291;
  h=date:from:to:cc:subject:message-id;
  bh=0atbEib8jggjVoNOJeZLkHRB29d07ESMfM1kYkJSA2E=;
  b=VwrQTgw3x2pB5qit/AxgU5+kQUCss20P85tjz1aLosbXjk2LZwRDF7Ig
   BciN/RSZg7OlOGT4CwV22UdiHdJKAfU+ObvM/wSQtdyURQPheiUfc1nVc
   ycjXP3yV1USqz24GpXGLpDv0JJfUI4+IUima+fMiHnACH86ebLwj1n+SX
   4LD/bHmPLw7GQViK5y+r3iCKo2g2r/IqPFUkFhQZx3GwaK6CYwx+gOJm3
   YnQh6F+01qURfLMmszel3NjLh+AswyOLJmLVg3h4uaF2mAZtlm2v1qCCZ
   4nVVGtnHNJL7mO47y3jtDHHDuVIcg5lpGVu3rlxdMpRJhEWYlyTqwPg9e
   w==;
X-CSE-ConnectionGUID: mfg+aW9hTBqUEF8IZE2Cng==
X-CSE-MsgGUID: hx3vGMYBTdyxRGykzpMAvw==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="25085263"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="25085263"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 10:11:26 -0700
X-CSE-ConnectionGUID: DdJMks8UTbeojCtA2cQ2kQ==
X-CSE-MsgGUID: I4mpLO82Tt+W36pAVdWw9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="43308590"
Received: from lkp-server01.sh.intel.com (HELO 472b94a103a1) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 07 Jun 2024 10:11:23 -0700
Received: from kbuild by 472b94a103a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFd7Y-0000B1-1r;
	Fri, 07 Jun 2024 17:11:20 +0000
Date: Sat, 08 Jun 2024 01:10:42 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Memory Management List <linux-mm@kvack.org>,
 amd-gfx@lists.freedesktop.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-pm@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Subject: [linux-next:master] BUILD REGRESSION
 d35b2284e966c0bef3e2182a5c5ea02177dd32e4
Message-ID: <202406080138.Fk0ftkDF-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240607_101130_944409_5C8D5500 
X-CRM114-Status: UNSURE (   4.77  )
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
branch HEAD: d35b2284e966c0bef3e2182a5c5ea02177dd32e4  Add linux-next specific files for 20240607

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202406071624.o81nLJmG-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202406071658.Sq9UXHmz-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202406071806.BRjaC5FF-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202406072132.gK2rPSm1-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

drivers/hwmon/pmbus/mp2975.c:1069:34: warning: 'mp2975_of_match' defined but not used [-Wunused-const-variable=]
drivers/hwmon/pmbus/mp2975.c:1069:34: warning: unused variable 'mp2975_of_match' [-Wunused-const-variable]
kernel/trace/fgraph.c:1154:12: warning: 'fgraph_pid_func' defined but not used [-Wunused-function]
kernel/trace/fgraph.c:1174:28: warning: unused variable 'gops' [-Wunused-variable]
kernel/trace/fgraph.c:1175:28: warning: unused variable 'op' [-Wunused-variable]

Unverified Error/Warning (likely false positive, please contact us if interested):

{standard input}:1233: Warning: overflow in branch to .L144; converted into longer instruction sequence
{standard input}:1244: Warning: overflow in branch to .L146; converted into longer instruction sequence
{standard input}:1247: Warning: overflow in branch to .L147; converted into longer instruction sequence

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- csky-randconfig-001-20240607
|   |-- kernel-trace-fgraph.c:warning:fgraph_pid_func-defined-but-not-used
|   |-- kernel-trace-fgraph.c:warning:unused-variable-gops
|   `-- kernel-trace-fgraph.c:warning:unused-variable-op
|-- i386-randconfig-062-20240607
|   `-- drivers-hwmon-pmbus-mp2975.c:warning:mp2975_of_match-defined-but-not-used
|-- loongarch-defconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-hubbub-dcn401-dcn401_hubbub.o:warning:objtool:unexpected-relocation-symbol-type-in-.rela.discard.reachable
|   `-- drivers-thermal-thermal_trip.o:warning:objtool:unexpected-relocation-symbol-type-in-.rela.discard.reachable
|-- loongarch-randconfig-002-20240607
|   |-- kernel-trace-fgraph.c:warning:fgraph_pid_func-defined-but-not-used
|   |-- kernel-trace-fgraph.c:warning:unused-variable-gops
|   `-- kernel-trace-fgraph.c:warning:unused-variable-op
|-- microblaze-allmodconfig
|   |-- arch-microblaze-boot-dts-system.dts.-.:Warning-(simple_bus_reg):amba_pl-gpio-restart:missing-or-empty-reg-ranges-property
|   |-- arch-microblaze-boot-dts-system.dts.-.:Warning-(unit_address_format):amba_pl-flash-partition:unit-name-should-not-have-leading
|   |-- arch-microblaze-boot-dts-system.dts.-.:Warning-(unit_address_format):amba_pl-flash-partition:unit-name-should-not-have-leading-0s
|   |-- arch-microblaze-boot-dts-system.dts.-.:Warning-(unit_address_vs_reg):memory:node-has-a-reg-or-ranges-property-but-no-unit-name
|   |-- arch-microblaze-boot-dts-system.dts.:Warning-(clocks_property):amba_pl-dma-41e00000:clocks:cell-is-not-a-phandle-reference
|   |-- arch-microblaze-boot-dts-system.dts.:Warning-(clocks_property):amba_pl-i2c:clocks:cell-is-not-a-phandle-reference
|   |-- arch-microblaze-boot-dts-system.dts.:Warning-(clocks_property):amba_pl-serial-44a00000:clocks:cell-is-not-a-phandle-reference
|   |-- arch-microblaze-boot-dts-system.dts.:Warning-(clocks_property):amba_pl-timer-41c00000:clocks:cell-is-not-a-phandle-reference
|   `-- arch-microblaze-boot-dts-system.dts.:Warning-(clocks_property):cpus-cpu:clocks:cell-is-not-a-phandle-reference
|-- microblaze-allnoconfig
|   |-- arch-microblaze-boot-dts-system.dts.-.:Warning-(simple_bus_reg):amba_pl-gpio-restart:missing-or-empty-reg-ranges-property
|   |-- arch-microblaze-boot-dts-system.dts.-.:Warning-(unit_address_format):amba_pl-flash-partition:unit-name-should-not-have-leading
|   |-- arch-microblaze-boot-dts-system.dts.-.:Warning-(unit_address_format):amba_pl-flash-partition:unit-name-should-not-have-leading-0s
|   |-- arch-microblaze-boot-dts-system.dts.-.:Warning-(unit_address_vs_reg):memory:node-has-a-reg-or-ranges-property-but-no-unit-name
|   |-- arch-microblaze-boot-dts-system.dts.:Warning-(clocks_property):amba_pl-dma-41e00000:clocks:cell-is-not-a-phandle-reference
|   |-- arch-microblaze-boot-dts-system.dts.:Warning-(clocks_property):amba_pl-i2c:clocks:cell-is-not-a-phandle-reference
|   |-- arch-microblaze-boot-dts-system.dts.:Warning-(clocks_property):amba_pl-serial-44a00000:clocks:cell-is-not-a-phandle-reference
|   |-- arch-microblaze-boot-dts-system.dts.:Warning-(clocks_property):amba_pl-timer-41c00000:clocks:cell-is-not-a-phandle-reference
|   `-- arch-microblaze-boot-dts-system.dts.:Warning-(clocks_property):cpus-cpu:clocks:cell-is-not-a-phandle-reference
|-- microblaze-allyesconfig
|   |-- arch-microblaze-boot-dts-system.dts.-.:Warning-(simple_bus_reg):amba_pl-gpio-restart:missing-or-empty-reg-ranges-property
|   |-- arch-microblaze-boot-dts-system.dts.-.:Warning-(unit_address_format):amba_pl-flash-partition:unit-name-should-not-have-leading
|   |-- arch-microblaze-boot-dts-system.dts.-.:Warning-(unit_address_format):amba_pl-flash-partition:unit-name-should-not-have-leading-0s
|   |-- arch-microblaze-boot-dts-system.dts.-.:Warning-(unit_address_vs_reg):memory:node-has-a-reg-or-ranges-property-but-no-unit-name
|   |-- arch-microblaze-boot-dts-system.dts.:Warning-(clocks_property):amba_pl-dma-41e00000:clocks:cell-is-not-a-phandle-reference
|   |-- arch-microblaze-boot-dts-system.dts.:Warning-(clocks_property):amba_pl-i2c:clocks:cell-is-not-a-phandle-reference
|   |-- arch-microblaze-boot-dts-system.dts.:Warning-(clocks_property):amba_pl-serial-44a00000:clocks:cell-is-not-a-phandle-reference
|   |-- arch-microblaze-boot-dts-system.dts.:Warning-(clocks_property):amba_pl-timer-41c00000:clocks:cell-is-not-a-phandle-reference
|   `-- arch-microblaze-boot-dts-system.dts.:Warning-(clocks_property):cpus-cpu:clocks:cell-is-not-a-phandle-reference
|-- microblaze-defconfig
|   |-- arch-microblaze-boot-dts-system.dts.-.:Warning-(simple_bus_reg):amba_pl-gpio-restart:missing-or-empty-reg-ranges-property
|   |-- arch-microblaze-boot-dts-system.dts.-.:Warning-(unit_address_format):amba_pl-flash-partition:unit-name-should-not-have-leading
|   |-- arch-microblaze-boot-dts-system.dts.-.:Warning-(unit_address_format):amba_pl-flash-partition:unit-name-should-not-have-leading-0s
|   |-- arch-microblaze-boot-dts-system.dts.-.:Warning-(unit_address_vs_reg):memory:node-has-a-reg-or-ranges-property-but-no-unit-name
|   |-- arch-microblaze-boot-dts-system.dts.:Warning-(clocks_property):amba_pl-dma-41e00000:clocks:cell-is-not-a-phandle-reference
|   |-- arch-microblaze-boot-dts-system.dts.:Warning-(clocks_property):amba_pl-i2c:clocks:cell-is-not-a-phandle-reference
|   |-- arch-microblaze-boot-dts-system.dts.:Warning-(clocks_property):amba_pl-serial-44a00000:clocks:cell-is-not-a-phandle-reference
|   |-- arch-microblaze-boot-dts-system.dts.:Warning-(clocks_property):amba_pl-timer-41c00000:clocks:cell-is-not-a-phandle-reference
|   `-- arch-microblaze-boot-dts-system.dts.:Warning-(clocks_property):cpus-cpu:clocks:cell-is-not-a-phandle-reference
|-- mips-randconfig-r121-20240607
|   |-- drivers-mtd-nand-raw-mxc_nand.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-void-buf-got-void-noderef-__iomem
|   `-- drivers-mtd-nand-raw-mxc_nand.c:sparse:sparse:incorrect-type-in-initializer-(different-address-spaces)-expected-unsigned-short-noderef-usertype-__iomem-t-got-void-buf
|-- nios2-randconfig-r111-20240607
|   |-- drivers-hwmon-cros_ec_hwmon.c:sparse:sparse:cast-to-restricted-__le16
|   |-- drivers-mtd-nand-raw-mxc_nand.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-void-buf-got-void-noderef-__iomem
|   `-- drivers-mtd-nand-raw-mxc_nand.c:sparse:sparse:incorrect-type-in-initializer-(different-address-spaces)-expected-unsigned-short-noderef-usertype-__iomem-t-got-void-buf
|-- nios2-randconfig-r133-20240607
|   `-- drivers-clk-qcom-camcc-sm7150.c:sparse:sparse:symbol-camcc_sm7150_hws-was-not-declared.-Should-it-be-static
|-- parisc-randconfig-002-20240607
|   `-- drivers-hwmon-pmbus-mp2975.c:warning:mp2975_of_match-defined-but-not-used
|-- s390-randconfig-r113-20240607
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-B-got-struct-ftrace_hash-noderef-__rcu-filter_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-B-got-struct-ftrace_hash-noderef-__rcu-notrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-new_hash-got-struct-ftrace_hash-noderef-__rcu-filter_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-new_hash1-got-struct-ftrace_hash-noderef-__rcu-filter_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-new_hash2-got-struct-ftrace_hash-noderef-__rcu-filter_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-new_hash2-got-struct-ftrace_hash-noderef-__rcu-notrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-orig_hash-got-struct-ftrace_hash-noderef-__rcu
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-src-got-struct-ftrace_hash-noderef-__rcu-filter_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-src-got-struct-ftrace_hash-noderef-__rcu-notrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-filter_hash-got-struct-ftrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-filter_hash-got-struct-ftrace_hash-assigned-filter_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-filter_hash-got-struct-ftrace_hash-save_filter_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-notrace_hash-got-struct-ftrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-notrace_hash-got-struct-ftrace_hash-assigned-notrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-notrace_hash-got-struct-ftrace_hash-save_notrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-notrace_hash-got-struct-ftrace_hash-noderef-__rcu-notrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-save_filter_hash-got-struct-ftrace_hash-noderef-__rcu-filter_hash
|   `-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-save_notrace_hash-got-struct-ftrace_hash-noderef-__rcu-notrace_hash
|-- sh-randconfig-r011-20220321
|   |-- standard-input:Warning:overflow-in-branch-to-.L144-converted-into-longer-instruction-sequence
|   |-- standard-input:Warning:overflow-in-branch-to-.L146-converted-into-longer-instruction-sequence
|   `-- standard-input:Warning:overflow-in-branch-to-.L147-converted-into-longer-instruction-sequence
|-- x86_64-buildonly-randconfig-002-20240607
|   `-- drivers-hwmon-pmbus-mp2975.c:warning:mp2975_of_match-defined-but-not-used
`-- x86_64-randconfig-161-20240607
    `-- drivers-hwmon-pmbus-mp2975.c:warning:mp2975_of_match-defined-but-not-used
clang_recent_errors
|-- x86_64-buildonly-randconfig-003-20240607
|   |-- drivers-gpu-drm-drm_mm.c:error:function-drm_mm_node_scanned_block-is-not-needed-and-will-not-be-emitted-Werror-Wunneeded-internal-declaration
|   `-- drivers-hwmon-pmbus-mp2975.c:warning:unused-variable-mp2975_of_match
|-- x86_64-randconfig-012-20240607
|   `-- drivers-hwmon-pmbus-mp2975.c:warning:unused-variable-mp2975_of_match
`-- x86_64-randconfig-r051-20240607
    `-- drivers-gpu-drm-drm_mm.c:error:function-drm_mm_node_scanned_block-is-not-needed-and-will-not-be-emitted-Werror-Wunneeded-internal-declaration

elapsed time: 739m

configs tested: 188
configs skipped: 3

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                         haps_hs_defconfig   gcc  
arc                     nsimosci_hs_defconfig   gcc  
arc                   randconfig-001-20240607   gcc  
arc                   randconfig-002-20240607   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                       aspeed_g5_defconfig   gcc  
arm                                 defconfig   clang
arm                          moxart_defconfig   gcc  
arm                        multi_v7_defconfig   gcc  
arm                           omap1_defconfig   gcc  
arm                          pxa168_defconfig   clang
arm                   randconfig-001-20240607   gcc  
arm                   randconfig-002-20240607   clang
arm                   randconfig-003-20240607   clang
arm                   randconfig-004-20240607   gcc  
arm                       spear13xx_defconfig   gcc  
arm                           stm32_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240607   gcc  
arm64                 randconfig-002-20240607   clang
arm64                 randconfig-003-20240607   clang
arm64                 randconfig-004-20240607   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240607   gcc  
csky                  randconfig-002-20240607   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240607   clang
hexagon               randconfig-002-20240607   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240607   clang
i386         buildonly-randconfig-002-20240607   clang
i386         buildonly-randconfig-003-20240607   clang
i386         buildonly-randconfig-004-20240607   clang
i386         buildonly-randconfig-005-20240607   clang
i386         buildonly-randconfig-006-20240607   clang
i386                                defconfig   clang
i386                  randconfig-001-20240607   gcc  
i386                  randconfig-002-20240607   gcc  
i386                  randconfig-003-20240607   gcc  
i386                  randconfig-004-20240607   gcc  
i386                  randconfig-005-20240607   gcc  
i386                  randconfig-006-20240607   gcc  
i386                  randconfig-011-20240607   clang
i386                  randconfig-012-20240607   gcc  
i386                  randconfig-013-20240607   clang
i386                  randconfig-014-20240607   clang
i386                  randconfig-015-20240607   clang
i386                  randconfig-016-20240607   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240607   gcc  
loongarch             randconfig-002-20240607   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                          amiga_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                        mvme16x_defconfig   gcc  
m68k                           sun3_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                         db1xxx_defconfig   clang
mips                           gcw0_defconfig   clang
mips                           ip28_defconfig   gcc  
mips                       lemote2f_defconfig   gcc  
mips                     loongson1c_defconfig   gcc  
mips                        qi_lb60_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240607   gcc  
nios2                 randconfig-002-20240607   gcc  
openrisc                         alldefconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240607   gcc  
parisc                randconfig-002-20240607   gcc  
parisc64                         alldefconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                        icon_defconfig   gcc  
powerpc               randconfig-001-20240607   gcc  
powerpc               randconfig-002-20240607   gcc  
powerpc               randconfig-003-20240607   gcc  
powerpc                      walnut_defconfig   gcc  
powerpc64             randconfig-001-20240607   gcc  
powerpc64             randconfig-002-20240607   clang
powerpc64             randconfig-003-20240607   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                    nommu_virt_defconfig   clang
riscv                 randconfig-001-20240607   gcc  
riscv                 randconfig-002-20240607   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240607   clang
s390                  randconfig-002-20240607   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                          r7780mp_defconfig   gcc  
sh                    randconfig-001-20240607   gcc  
sh                    randconfig-002-20240607   gcc  
sh                           se7780_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240607   gcc  
sparc64               randconfig-002-20240607   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240607   clang
um                    randconfig-002-20240607   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240607   gcc  
x86_64       buildonly-randconfig-002-20240607   gcc  
x86_64       buildonly-randconfig-003-20240607   clang
x86_64       buildonly-randconfig-004-20240607   gcc  
x86_64       buildonly-randconfig-005-20240607   gcc  
x86_64       buildonly-randconfig-006-20240607   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240607   gcc  
x86_64                randconfig-002-20240607   gcc  
x86_64                randconfig-003-20240607   clang
x86_64                randconfig-004-20240607   clang
x86_64                randconfig-005-20240607   clang
x86_64                randconfig-006-20240607   gcc  
x86_64                randconfig-011-20240607   gcc  
x86_64                randconfig-012-20240607   clang
x86_64                randconfig-013-20240607   gcc  
x86_64                randconfig-014-20240607   gcc  
x86_64                randconfig-015-20240607   clang
x86_64                randconfig-016-20240607   clang
x86_64                randconfig-071-20240607   gcc  
x86_64                randconfig-072-20240607   clang
x86_64                randconfig-073-20240607   gcc  
x86_64                randconfig-074-20240607   clang
x86_64                randconfig-075-20240607   gcc  
x86_64                randconfig-076-20240607   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240607   gcc  
xtensa                randconfig-002-20240607   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
