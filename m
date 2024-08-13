Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4419BC52D7C
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Aug 2024 22:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tjy7C5//brZhWhylQsCVLvNNa1hji4+eJ8zuMIzHOSE=; b=GYnOJNGvR5j1BA
	DuKpZohoSple2mRWJAYaNM+TRr/e3f6kJGlZQHBfj/AxVXjbbe5Bgjtgdyb4OM9kqGxspvZwJNglP
	hLRYQKWkxyr7Ra/S9Tlpc5MoQoIza3jlXp8sw0ueVsXTcJ/4f4UAGwAxYxnu56ImOdjPbyDy8p7yb
	3IoLxiMOsl4CiXPrMcyoETVNYRcvzljxqM8k1brJDbu3rpW/YP3XWOOUzR+AuDKo70cKlG6NRPpCx
	8wlJPDbjr9QOc5AwWC9zrmhSYMy+hjeG59aac03UzhU/neqEPhVySqOzQauXRKj+OS8MhrdtZcWG+
	TR48uouXMYiWTyzA6GDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdzZ6-000000052to-0KAN;
	Tue, 13 Aug 2024 22:00:28 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdzYR-000000052mN-2vjo;
	Tue, 13 Aug 2024 21:59:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723586387; x=1755122387;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=smDF0r7mvpJmOBP+6nWfU55YrbMwWFuJ1tY+3DSe/84=;
  b=E8xQ4shyj7NL+BBl8WJtqf+9qVUMAmwTcfBoPk70Xy+sgYpefWqMUtOA
   7JMQR7saidqXBbgAN9vohQV13A23u/K1Ef5n4uH1kxgUoUWrSWHknYWCM
   o9knAHlQaIQPobh7GCjdV/47K9SeTY7JSSztq1ldU/u3wYlo5yXT/fTmP
   XgyVu06u0Nnan8fvh4CChqqgL+5IPxztgBAjKP+Nu1YVjpIJZHLH/HYi2
   EkYaYR1od9g5jFnf7HyXjvaPBhl/KubOqCZaZ2UwFHgWeiIzlpawcP8b4
   6ogIEoiTycLYBcsNIU4RmaEAiw/nf6JxzcHYsFgnvGn6BeN5gSrbTgwkf
   Q==;
X-CSE-ConnectionGUID: c00XcYb0Qma/hAMguZsTOw==
X-CSE-MsgGUID: /ZphQ4G8RqCLUOR8iD1EDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="33185783"
X-IronPort-AV: E=Sophos;i="6.09,287,1716274800"; 
   d="scan'208";a="33185783"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2024 14:59:44 -0700
X-CSE-ConnectionGUID: czxnPOqVQaaAwqDB554ucw==
X-CSE-MsgGUID: ho2IFztlTnWPog2fiZlSQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,287,1716274800"; 
   d="scan'208";a="58737265"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 13 Aug 2024 14:59:40 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sdzYH-0000kA-2n;
	Tue, 13 Aug 2024 21:59:37 +0000
Date: Wed, 14 Aug 2024 05:59:05 +0800
From: kernel test robot <lkp@intel.com>
To: Hui-Ping Chen <hpchen0nvt@gmail.com>, miquel.raynal@bootlin.com,
	richard@nod.at, vigneshr@ti.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, sumit.semwal@linaro.org,
	christian.koenig@amd.com, esben@geanix.com
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	Hui-Ping Chen <hpchen0nvt@gmail.com>
Subject: Re: [PATCH 2/2] mtd: rawnand: nuvoton: add new driver for the
 Nuvoton MA35 SoC
Message-ID: <202408140515.pbHkvxZD-lkp@intel.com>
References: <20240812030045.20831-3-hpchen0nvt@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240812030045.20831-3-hpchen0nvt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240813_145947_801944_AD3DE674 
X-CRM114-Status: GOOD (  10.16  )
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

Hi Hui-Ping,

kernel test robot noticed the following build warnings:

[auto build test WARNING on mtd/nand/next]
[also build test WARNING on linus/master v6.11-rc3 next-20240813]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hui-Ping-Chen/dt-bindings-mtd-nuvoton-ma35d1-nand-add-new-bindings/20240812-110259
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next
patch link:    https://lore.kernel.org/r/20240812030045.20831-3-hpchen0nvt%40gmail.com
patch subject: [PATCH 2/2] mtd: rawnand: nuvoton: add new driver for the Nuvoton MA35 SoC
config: arc-randconfig-r133-20240813 (https://download.01.org/0day-ci/archive/20240814/202408140515.pbHkvxZD-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240814/202408140515.pbHkvxZD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408140515.pbHkvxZD-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:119:3: sparse: sparse: symbol 'E_BCHALGORITHM' was not declared. Should it be static?
>> drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:333:28: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:348:39: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:746:41: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected char *register ptr @@     got void [noderef] __iomem * @@
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:746:41: sparse:     expected char *register ptr
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:746:41: sparse:     got void [noderef] __iomem *
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:760:18: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:774:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected char *ptr @@     got void [noderef] __iomem * @@
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:774:32: sparse:     expected char *ptr
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:774:32: sparse:     got void [noderef] __iomem *
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:813:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected char *ptr @@     got void [noderef] __iomem * @@
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:813:32: sparse:     expected char *ptr
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:813:32: sparse:     got void [noderef] __iomem *
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:516:49: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected char *register ptr @@     got void [noderef] __iomem * @@
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:516:49: sparse:     expected char *register ptr
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:516:49: sparse:     got void [noderef] __iomem *
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:516:49: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected char *register ptr @@     got void [noderef] __iomem * @@
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:516:49: sparse:     expected char *register ptr
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:516:49: sparse:     got void [noderef] __iomem *
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:516:49: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected char *register ptr @@     got void [noderef] __iomem * @@
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:516:49: sparse:     expected char *register ptr
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:516:49: sparse:     got void [noderef] __iomem *
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:516:49: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected char *register ptr @@     got void [noderef] __iomem * @@
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:516:49: sparse:     expected char *register ptr
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:516:49: sparse:     got void [noderef] __iomem *

vim +/E_BCHALGORITHM +119 drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c

   111	
   112	/* BCH algorithm related constants and variables */
   113	enum {
   114		eBCH_NONE = 0,
   115		eBCH_T8,
   116		eBCH_T12,
   117		eBCH_T24,
   118		eBCH_CNT
 > 119	} E_BCHALGORITHM;
   120	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
