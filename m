Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6054D29DC7
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Jan 2026 03:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HUF7obRw476kXmP5XrsKtIWSznaLGHs65kcTR5SyvSQ=; b=YalHWFYKSS/MHe
	08n0kTPCaDX1KCY54TkGKZLR1wfL8xW/ijU310woNXcacNwmpAPrus0DyTD8eptEeymDi7Un9GvGj
	/0Ht54HLJATUtAJ43SgcUyZgcXELqXxAIInHns0TrQrVu7dSN4sP9VQXEpdjFGaQJRNfKgxMeqgMk
	5Xd0l5eu/SrVN1KX1rGTWX+r7CDl+wtck1zkmbGziUNMF8XOF4WC/Qg+SrV5tSb2uWZvszY9RLboB
	A68EPvdiz46HlWVZ6i0hyK0c+5jyDL5KenGKbXQb1EOsbS55DlJZuzMqQIcI+RaW/JbuQ1edaRLAI
	71aX0OjKHBCsXpCYtBkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfVIW-00000006Ure-31WS;
	Tue, 13 Jan 2026 03:42:24 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfVIS-00000006UqZ-3VOA;
	Tue, 13 Jan 2026 03:42:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768275741; x=1799811741;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=a189GyiyLwJgfD4HhPrDhWNPYwV0vohFYoQElg4PC7Y=;
  b=hkK4luOhE2DrvOPTqJmQsRtJqQOUkXc3JXQqGCIouR3IuKJlIySKwFvp
   HkrcoLnJRpCzBYpKawAGfZRJfsrWoUbGcmeB/HcU+K8yXD2G016AcByqU
   ikoto4iYPjcq8mqJbiZtbJQ1NsAjWVP06Yt5w5GduFaHflFMWF7CeAK4Q
   +6d71qC2/cKjZoSWbRLlAmsyKtQVADzv9NU9g1X3nrKqlr97N4fvlCWt/
   8lpnoGDyWyNJ5OSH/kpUvtzeJJLDQMedQbT167ApE4fpsxF+zRTmEBNQ8
   12o50PRfSk8uZFgKizARcqs8zed22eJ0XNPd5ILrp2NGbsLMZQNc7O4v3
   w==;
X-CSE-ConnectionGUID: HDvnUt1KRCiyqh7JVjm3OA==
X-CSE-MsgGUID: rDpRywGRSsuo7UEr3hQfEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="73189397"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="73189397"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 19:42:18 -0800
X-CSE-ConnectionGUID: P0cr0bG/S/qezmCmaThNYA==
X-CSE-MsgGUID: ts13jOezTKKjb3EQe9wSoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="204078696"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 12 Jan 2026 19:42:13 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfVII-00000000EAy-3c1r;
	Tue, 13 Jan 2026 03:42:10 +0000
Date: Tue, 13 Jan 2026 11:41:38 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	=?iso-8859-1?Q?Beno=EEt?= Monin <benoit.monin@bootlin.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org,
	Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: Re: [PATCH v3 2/4] of: reserved_mem: Support multiple 'reg' entries
 for memory-region
Message-ID: <202601131101.q65jw7p0-lkp@intel.com>
References: <20260107-mtd-memregion-v3-2-f9fc9107b992@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260107-mtd-memregion-v3-2-f9fc9107b992@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_194220_953568_245595FF 
X-CRM114-Status: GOOD (  14.66  )
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

Hi Gregory,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8f0b4cce4481fb22653697cced8d0d04027cb1e8]

url:    https://github.com/intel-lab-lkp/linux/commits/Gregory-CLEMENT/of-reserved_mem-Fix-placement-of-__free-annotation/20260107-211455
base:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
patch link:    https://lore.kernel.org/r/20260107-mtd-memregion-v3-2-f9fc9107b992%40bootlin.com
patch subject: [PATCH v3 2/4] of: reserved_mem: Support multiple 'reg' entries for memory-region
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20260113/202601131101.q65jw7p0-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601131101.q65jw7p0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601131101.q65jw7p0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/of/of_reserved_mem.c:317:7: warning: variable 'err' is uninitialized when used here [-Wuninitialized]
     317 |                 if (err == -ENOENT && of_get_flat_dt_prop(child, "size", NULL)) {
         |                     ^~~
   drivers/of/of_reserved_mem.c:300:10: note: initialize the variable 'err' to silence this warning
     300 |                 int err, ret;
         |                        ^
         |                         = 0
   1 warning generated.


vim +/err +317 drivers/of/of_reserved_mem.c

8a6e02d0c00e7b Oreoluwa Babatunde 2024-10-08  278  
54c180e73ffa3e Rob Herring        2024-03-11  279  /*
54c180e73ffa3e Rob Herring        2024-03-11  280   * fdt_scan_reserved_mem() - scan a single FDT node for reserved memory
54c180e73ffa3e Rob Herring        2024-03-11  281   */
54c180e73ffa3e Rob Herring        2024-03-11  282  int __init fdt_scan_reserved_mem(void)
54c180e73ffa3e Rob Herring        2024-03-11  283  {
54c180e73ffa3e Rob Herring        2024-03-11  284  	int node, child;
00c9a452a235c6 Oreoluwa Babatunde 2024-10-08  285  	int dynamic_nodes_cnt = 0, count = 0;
8a6e02d0c00e7b Oreoluwa Babatunde 2024-10-08  286  	int dynamic_nodes[MAX_RESERVED_REGIONS];
54c180e73ffa3e Rob Herring        2024-03-11  287  	const void *fdt = initial_boot_params;
54c180e73ffa3e Rob Herring        2024-03-11  288  
54c180e73ffa3e Rob Herring        2024-03-11  289  	node = fdt_path_offset(fdt, "/reserved-memory");
54c180e73ffa3e Rob Herring        2024-03-11  290  	if (node < 0)
54c180e73ffa3e Rob Herring        2024-03-11  291  		return -ENODEV;
54c180e73ffa3e Rob Herring        2024-03-11  292  
54c180e73ffa3e Rob Herring        2024-03-11  293  	if (__reserved_mem_check_root(node) != 0) {
54c180e73ffa3e Rob Herring        2024-03-11  294  		pr_err("Reserved memory: unsupported node format, ignoring\n");
54c180e73ffa3e Rob Herring        2024-03-11  295  		return -EINVAL;
54c180e73ffa3e Rob Herring        2024-03-11  296  	}
54c180e73ffa3e Rob Herring        2024-03-11  297  
54c180e73ffa3e Rob Herring        2024-03-11  298  	fdt_for_each_subnode(child, fdt, node) {
54c180e73ffa3e Rob Herring        2024-03-11  299  		const char *uname;
8be14ac8dccc70 Gregory CLEMENT    2026-01-07  300  		int err, ret;
54c180e73ffa3e Rob Herring        2024-03-11  301  
54c180e73ffa3e Rob Herring        2024-03-11  302  		if (!of_fdt_device_is_available(fdt, child))
54c180e73ffa3e Rob Herring        2024-03-11  303  			continue;
54c180e73ffa3e Rob Herring        2024-03-11  304  
54c180e73ffa3e Rob Herring        2024-03-11  305  		uname = fdt_get_name(fdt, child, NULL);
54c180e73ffa3e Rob Herring        2024-03-11  306  
8be14ac8dccc70 Gregory CLEMENT    2026-01-07  307  		ret = __reserved_mem_reserve_reg(child, uname);
8be14ac8dccc70 Gregory CLEMENT    2026-01-07  308  		if (ret > 0)
8be14ac8dccc70 Gregory CLEMENT    2026-01-07  309  			count += ret;
8a6e02d0c00e7b Oreoluwa Babatunde 2024-10-08  310  		/*
8a6e02d0c00e7b Oreoluwa Babatunde 2024-10-08  311  		 * Save the nodes for the dynamically-placed regions
8a6e02d0c00e7b Oreoluwa Babatunde 2024-10-08  312  		 * into an array which will be used for allocation right
8a6e02d0c00e7b Oreoluwa Babatunde 2024-10-08  313  		 * after all the statically-placed regions are reserved
8a6e02d0c00e7b Oreoluwa Babatunde 2024-10-08  314  		 * or marked as no-map. This is done to avoid dynamically
8a6e02d0c00e7b Oreoluwa Babatunde 2024-10-08  315  		 * allocating from one of the statically-placed regions.
8a6e02d0c00e7b Oreoluwa Babatunde 2024-10-08  316  		 */
8a6e02d0c00e7b Oreoluwa Babatunde 2024-10-08 @317  		if (err == -ENOENT && of_get_flat_dt_prop(child, "size", NULL)) {
8a6e02d0c00e7b Oreoluwa Babatunde 2024-10-08  318  			dynamic_nodes[dynamic_nodes_cnt] = child;
8a6e02d0c00e7b Oreoluwa Babatunde 2024-10-08  319  			dynamic_nodes_cnt++;
8a6e02d0c00e7b Oreoluwa Babatunde 2024-10-08  320  		}
8a6e02d0c00e7b Oreoluwa Babatunde 2024-10-08  321  	}
8a6e02d0c00e7b Oreoluwa Babatunde 2024-10-08  322  	for (int i = 0; i < dynamic_nodes_cnt; i++) {
8a6e02d0c00e7b Oreoluwa Babatunde 2024-10-08  323  		const char *uname;
00c9a452a235c6 Oreoluwa Babatunde 2024-10-08  324  		int err;
8a6e02d0c00e7b Oreoluwa Babatunde 2024-10-08  325  
8a6e02d0c00e7b Oreoluwa Babatunde 2024-10-08  326  		child = dynamic_nodes[i];
8a6e02d0c00e7b Oreoluwa Babatunde 2024-10-08  327  		uname = fdt_get_name(fdt, child, NULL);
00c9a452a235c6 Oreoluwa Babatunde 2024-10-08  328  		err = __reserved_mem_alloc_size(child, uname);
00c9a452a235c6 Oreoluwa Babatunde 2024-10-08  329  		if (!err)
00c9a452a235c6 Oreoluwa Babatunde 2024-10-08  330  			count++;
54c180e73ffa3e Rob Herring        2024-03-11  331  	}
00c9a452a235c6 Oreoluwa Babatunde 2024-10-08  332  	total_reserved_mem_cnt = count;
54c180e73ffa3e Rob Herring        2024-03-11  333  	return 0;
54c180e73ffa3e Rob Herring        2024-03-11  334  }
54c180e73ffa3e Rob Herring        2024-03-11  335  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
