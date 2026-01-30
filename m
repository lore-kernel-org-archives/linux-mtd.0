Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F228E6BF1B
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Jan 2026 15:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=54R6VQygXHf1oRtkU1F8M2dZAwTRCIV+w16Wd8YYW8M=; b=Reip7DplcXBKxi
	8h8haoqF/NDslq/ZY17G9tHMBIFcAb+izl+HU7yx6eoTgZ2AtLTG9isljJVbF+FEYQTQ4QjNU1lJC
	fMCL5nyPA4u1W2L86vFyi1fv7MYoQ9J5mOo3bFtixZtyH7KcgTUDc81gkOUE9tQdvX+Pgdyzyc7Og
	GURUJ+Ibpipm8/ZwPXb4qSz3teyA498/+OMp3Z3a0DmLyD8y3uj3VcMpl8HEEnUr6FMh5L4CkjjKb
	iMn3sshrAf6NxQI3BilQvFOycwcF1Bhpyf8dm9OQ/vdu0yCDO9c7pmdcV1atOSApxhAJZeP2PF5sf
	GirvCKH7fPE6Grv7p3QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlqcf-00000001fbP-3c70;
	Fri, 30 Jan 2026 15:41:25 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlqcd-00000001fao-2A1L
	for linux-mtd@lists.infradead.org;
	Fri, 30 Jan 2026 15:41:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769787683; x=1801323683;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0fUdsb6jhco8U17L+sRji5MQQAjibveGNe+u+9iEdOI=;
  b=Noaq9QwNO4TJAdNlcyndvIpF0iL9I/Qqu135Mfo905zz/ydSsFNIFC8K
   QwtESX9VWMHsx6+qPmP7Zb5XmqQ5GkKlNW14d0AGs4yNTRkGHKe4cFfir
   vBDUp06qb18mz0j/VKqly+0MoP0AuFL6Y+BRSHnB+8ckZ0AcHhmR1E23L
   xAMmnE3Vs6l+3WuSGJsHamKY1uSkHmTn8uzDItd5A0bdHZ0vmeFM3kiAu
   VjpspQ1pVE/NEP5zg+oLeoIPB5CPQv3n7v+0VlsxrUTjsBdg4+HyX8Qbc
   uKeJRxGGcchIepshNA+gaQLG0yb4gS7yZ2A9HpbYsqkRSZp48FcW9DFmt
   Q==;
X-CSE-ConnectionGUID: lQ3nXEqxTiWX3Td4GEfGaA==
X-CSE-MsgGUID: reytV3jBR46aS1Xet6z4mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="71125045"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; 
   d="scan'208";a="71125045"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 07:41:21 -0800
X-CSE-ConnectionGUID: noZ1Jk5fQzSqQ6+IGSaHug==
X-CSE-MsgGUID: Rj9qDFhgQE2Yha4/nq5xzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; 
   d="scan'208";a="208989560"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 30 Jan 2026 07:41:19 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlqcV-00000000d5k-2BNW;
	Fri, 30 Jan 2026 15:41:15 +0000
Date: Fri, 30 Jan 2026 23:40:54 +0800
From: kernel test robot <lkp@intel.com>
To: Cheng Ming Lin <linchengming884@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Richard Weinberger <richard@nod.at>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Martin Kurbanov <mmkurbanov@salutedevices.com>,
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Pratyush Yadav <pratyush@kernel.org>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: Re: [PATCH v3 1/2] mtd: spi-nand: Add support for randomizer
Message-ID: <202601302312.JXeQH3ao-lkp@intel.com>
References: <20260130092349.621034-2-linchengming884@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260130092349.621034-2-linchengming884@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_074123_572025_49C519F8 
X-CRM114-Status: GOOD (  12.44  )
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

Hi Cheng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.19-rc7]
[also build test WARNING on linus/master next-20260129]
[cannot apply to mtd/nand/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cheng-Ming-Lin/mtd-spi-nand-Add-support-for-randomizer/20260130-173004
base:   v6.19-rc7
patch link:    https://lore.kernel.org/r/20260130092349.621034-2-linchengming884%40gmail.com
patch subject: [PATCH v3 1/2] mtd: spi-nand: Add support for randomizer
config: s390-randconfig-002-20260130 (https://download.01.org/0day-ci/archive/20260130/202601302312.JXeQH3ao-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260130/202601302312.JXeQH3ao-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601302312.JXeQH3ao-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mtd/nand/spi/core.c:1234:4: warning: void function 'spinand_randomizer_init' should not return a value [-Wreturn-mismatch]
    1234 |                         return ret;
         |                         ^      ~~~
   drivers/mtd/nand/spi/core.c:1237:2: warning: void function 'spinand_randomizer_init' should not return a value [-Wreturn-mismatch]
    1237 |         return 0;
         |         ^      ~
   2 warnings generated.


vim +/spinand_randomizer_init +1234 drivers/mtd/nand/spi/core.c

  1226	
  1227	static void spinand_randomizer_init(struct spinand_device *spinand)
  1228	{
  1229		int ret;
  1230	
  1231		if (spinand->set_randomizer) {
  1232			ret = spinand_randomizer_enable(spinand, true);
  1233			if (ret)
> 1234				return ret;
  1235		}
  1236	
  1237		return 0;
  1238	}
  1239	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
