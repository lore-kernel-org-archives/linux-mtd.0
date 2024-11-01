Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A1FBE6F07D
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Nov 2024 18:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9MJBGow+jane2V3DMVXJNRtMu5FpP6wNThXZQCGvxXU=; b=MUAqi/WzL08nPF
	MvQZ1ufWc4AYkTldSyAdwgutYzOspNjCDIQeCJWPCVGi8prJBVkgxMLfcqR47d2upnUMBFjTPiG38
	Vel8Hy0bvdVbxEvi8yIW/6MVBLOJIvScclPS/lAmJjxHIgAp5RbdTmz6CnpL1k7tkIdNGACu6LrtZ
	pi6/da6rXQorUAcgW6DfwHDnFI0Zf30RrHtC8tEuIJ9pmBM4PWoKMdrvBwLR3IQJETVRtQmXCuzIh
	CHKP60OJAa0CJYGff5Ajql+qrY2y15ThbWRbaxG5Q7N8YcIHOnts2P/jgaink5+Mskk+QmO6Jfn7K
	0wFh70xv1sJSpa20/3rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6w9G-00000007wfX-0eNe;
	Fri, 01 Nov 2024 18:13:26 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6w8m-00000007wZP-2Fz9
	for linux-mtd@lists.infradead.org;
	Fri, 01 Nov 2024 18:12:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730484776; x=1762020776;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JTIvPX1NvVPfItgnj8kH7ERUhn0by7vrtZ82ymU8O0g=;
  b=O6H1zDNJeXU32V+yPf8m88w45Jdjp/0VSCz99PM5pMMEmmru/XpB54Kn
   c1HQcU0758lcwbEXE8N9LaYGccENnwp9Y9zrFyJfA7AtCBrriL59jqNr9
   XeoW61xQAopMltyNo9V8wlW5/gTpEYAluitkPQHptEBcLKxk14CIjEXBK
   MrQmFtYjHXGmmzXLd67RhwMa2mnVfrskTyzuQnPCybsIFBJ6vwalKB0qd
   P7tlIrwl97YO5+I/yCKQnL9dGNIXsJfm+EahlgvQmPP03HtLxl/0b+S6u
   uPEb7O4lQLa0ikxhFl3SZbpxuj6zi1Tj2oaalubnGw+WCy/jwWVGlTSkp
   Q==;
X-CSE-ConnectionGUID: hwebKD0aRTe6KK+bqa4L+A==
X-CSE-MsgGUID: r7tiPYWLRRCaTm+Jg4QCQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11243"; a="40839079"
X-IronPort-AV: E=Sophos;i="6.11,250,1725346800"; 
   d="scan'208";a="40839079"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 11:12:55 -0700
X-CSE-ConnectionGUID: QLidAFfLSBSu9CkIPxAn5A==
X-CSE-MsgGUID: N0LO0lsDRZKVfrRVPCsi4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,250,1725346800"; 
   d="scan'208";a="82560470"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 01 Nov 2024 11:12:53 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6w8g-000hrd-2L;
	Fri, 01 Nov 2024 18:12:50 +0000
Date: Sat, 2 Nov 2024 02:11:51 +0800
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
Subject: Re: [PATCH 5/5] mtd: rawnand: davinci: Implement setup_interface()
 operation
Message-ID: <202411020140.3wsKJOSB-lkp@intel.com>
References: <20241030104717.88688-6-bastien.curutchet@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241030104717.88688-6-bastien.curutchet@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_111256_612694_102506E1 
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

Hi Bastien,

kernel test robot noticed the following build errors:

[auto build test ERROR on krzk-mem-ctrl/for-next]
[also build test ERROR on linus/master v6.12-rc5]
[cannot apply to mtd/nand/next next-20241101]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bastien-Curutchet/memory-ti-aemif-Create-aemif_set_cs_timings/20241030-184949
base:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git for-next
patch link:    https://lore.kernel.org/r/20241030104717.88688-6-bastien.curutchet%40bootlin.com
patch subject: [PATCH 5/5] mtd: rawnand: davinci: Implement setup_interface() operation
config: arc-randconfig-001-20241101 (https://download.01.org/0day-ci/archive/20241102/202411020140.3wsKJOSB-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241102/202411020140.3wsKJOSB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411020140.3wsKJOSB-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in lib/zlib_inflate/zlib_inflate.o
>> ERROR: modpost: "aemif_set_cs_timings" [drivers/mtd/nand/raw/davinci_nand.ko] undefined!

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
