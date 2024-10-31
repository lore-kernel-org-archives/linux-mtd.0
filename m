Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC636E68956
	for <linux-mtd@archiver.kernel.org>; Thu, 31 Oct 2024 05:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OQugLBvVAUWJEZGbUEiZEXlMurBOg15Ug/3u5U+mU2k=; b=XlqzSoL6OmUbmE
	eR2NfEqhcv1U32GnWeso4uh1uL/eJ2ccQNi0ChvR0GxkpGtooTa5TwrxcFilFBAZBEeoF3M/bELGF
	PtIv6l0IhfbIH0HiToDTNjMuLlVb/ZWA+2Vd/+s8/338idcLw0+i8VxmFnP2F6wLZ6k3sT4zjHB0L
	sUdFjieoHsAW5VQb4ph8GVl+O6XLbUdEIH/lJKpv8K2btmpe48L8KgDTWa5SKsk/EKkMkZhFc8yY3
	V6f8LfoQnWkdYVpbfJbqdxceE0kFG9vkVAW5Xz0CChUp3R2+ojRhN3Rp92qzAK8xL7IihCB1KSkm/
	uYhSIBy87jRzWMhXQ+5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Nxe-00000002cZQ-1Jsr;
	Thu, 31 Oct 2024 05:43:10 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6NxZ-00000002cYy-2l2r
	for linux-mtd@lists.infradead.org;
	Thu, 31 Oct 2024 05:43:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730353385; x=1761889385;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ac/j4MOgUEPCHxoddjHszNDloaEzY0OScDCcj5Fz9Y4=;
  b=ZoeZIttQpmL9ex+WEN77YlgLfL7Ha5jUabb+IKDrWnpD29ven+3KC8ba
   twF7BNT/5HSQjKcE93VFNl4Y2bdV0v/0cU/r+gdoC4nqQaFdwqGLqRa6l
   +0ukTqKrvVTgK+MDI8JDlr+p+E2aRGl6ZN6GT0MS9jLD5frhpuc9Uagx2
   0DGuqQVhmAnkbR2Qi+m+MyfqZuvVf9AETUQM5bQib5Nqqp2+OwFSMdxSa
   sPskE8S4F7clVG4KFygzOp1lEFVvp3G5iIZMLGCIoXU9EM0Of023J8Oew
   CdTjd3y3jYTjtAew9N+2OvCVlHtxvrxtdAOB/1Z9c3Ht1bnsiy4J+2Y0A
   A==;
X-CSE-ConnectionGUID: tRevuFWsQWaEKRNXhF3AKQ==
X-CSE-MsgGUID: v7/8Apb6SoG0S2Y5UuqD+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11241"; a="30186611"
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="30186611"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 22:42:59 -0700
X-CSE-ConnectionGUID: 3uxnDGihSNiF0PmHsGxmCw==
X-CSE-MsgGUID: x1RbFepxTGaYiezTVuY9Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="82640306"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 30 Oct 2024 22:42:56 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6NxN-000fiI-2U;
	Thu, 31 Oct 2024 05:42:53 +0000
Date: Thu, 31 Oct 2024 13:42:18 +0800
From: kernel test robot <lkp@intel.com>
To: Bastien Curutchet <bastien.curutchet@bootlin.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Christopher Cordahi <christophercordahi@nanometrics.ca>,
	Bastien Curutchet <bastien.curutchet@bootlin.com>
Subject: Re: [PATCH 2/5] memory: ti-aemif: export aemif_set_cs_timing()
Message-ID: <202410311304.0fuqFK2M-lkp@intel.com>
References: <20241030104717.88688-3-bastien.curutchet@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241030104717.88688-3-bastien.curutchet@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_224305_885099_65BA078D 
X-CRM114-Status: GOOD (  12.26  )
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

Hi Bastien,

kernel test robot noticed the following build warnings:

[auto build test WARNING on krzk-mem-ctrl/for-next]
[also build test WARNING on mtd/nand/next linus/master v6.12-rc5 next-20241030]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bastien-Curutchet/memory-ti-aemif-Create-aemif_set_cs_timings/20241030-184949
base:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git for-next
patch link:    https://lore.kernel.org/r/20241030104717.88688-3-bastien.curutchet%40bootlin.com
patch subject: [PATCH 2/5] memory: ti-aemif: export aemif_set_cs_timing()
config: arc-randconfig-001-20241031 (https://download.01.org/0day-ci/archive/20241031/202410311304.0fuqFK2M-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241031/202410311304.0fuqFK2M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410311304.0fuqFK2M-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/memory/ti-aemif.c:130: warning: Function parameter or struct member 'config_cs_lock' not described in 'aemif_device'
>> drivers/memory/ti-aemif.c:130: warning: Excess struct member 'cs_config_lock' description in 'aemif_device'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


vim +130 drivers/memory/ti-aemif.c

5a7c81547c1db75 Ivan Khoronzhuk   2014-02-24  111  
5a7c81547c1db75 Ivan Khoronzhuk   2014-02-24  112  /**
5a7c81547c1db75 Ivan Khoronzhuk   2014-02-24  113   * struct aemif_device: structure to hold device data
5a7c81547c1db75 Ivan Khoronzhuk   2014-02-24  114   * @base: base address of AEMIF registers
5a7c81547c1db75 Ivan Khoronzhuk   2014-02-24  115   * @clk: source clock
5a7c81547c1db75 Ivan Khoronzhuk   2014-02-24  116   * @clk_rate: clock's rate in kHz
5a7c81547c1db75 Ivan Khoronzhuk   2014-02-24  117   * @num_cs: number of assigned chip-selects
5a7c81547c1db75 Ivan Khoronzhuk   2014-02-24  118   * @cs_offset: start number of cs nodes
5a7c81547c1db75 Ivan Khoronzhuk   2014-02-24  119   * @cs_data: array of chip-select settings
0f034c3604121bf Bastien Curutchet 2024-10-30  120   * @cs_config_lock: lock used to access CS configuration
5a7c81547c1db75 Ivan Khoronzhuk   2014-02-24  121   */
5a7c81547c1db75 Ivan Khoronzhuk   2014-02-24  122  struct aemif_device {
5a7c81547c1db75 Ivan Khoronzhuk   2014-02-24  123  	void __iomem *base;
5a7c81547c1db75 Ivan Khoronzhuk   2014-02-24  124  	struct clk *clk;
5a7c81547c1db75 Ivan Khoronzhuk   2014-02-24  125  	unsigned long clk_rate;
5a7c81547c1db75 Ivan Khoronzhuk   2014-02-24  126  	u8 num_cs;
5a7c81547c1db75 Ivan Khoronzhuk   2014-02-24  127  	int cs_offset;
5a7c81547c1db75 Ivan Khoronzhuk   2014-02-24  128  	struct aemif_cs_data cs_data[NUM_CS];
0f034c3604121bf Bastien Curutchet 2024-10-30  129  	spinlock_t config_cs_lock;
5a7c81547c1db75 Ivan Khoronzhuk   2014-02-24 @130  };
5a7c81547c1db75 Ivan Khoronzhuk   2014-02-24  131  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
