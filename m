Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB4F0C3DA7F
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Aug 2024 12:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MTh/Yzo2xj/fXZbbqkQGkyoh+bBSX6XPmImYLm2riTI=; b=qZmOr6lEjeseRL
	0V3cT6Bsu9OWk3SQyPe0Rfk7BIJ3BG5NaEFkCl7AGSvLnD5mLihWYXRojbGCf5JhfjVCVcuxMHT2w
	+IW0PLUVcEDzaEWRdeHH3IVtNejJwBIZROiVVilZpqMGdfTmNpUqN3mHvN1yoxe2ghN2u+b17IFwb
	DN/I8/TQXlPmft+uKJgPemzditNtyWFX5aH3Tp5CDRaRtnfjRujBSKykUSWILwfO21LtftzOU5+Ij
	BvfD6xdkRkr2ldYUEMYO60OelUwOj+lVj47mG6G8W6nvx4hq5anHpF4dTq7v2YE17/EXDntaX2e0T
	0V7B/8UXPAHALFZHgi6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdUYU-00000000KRd-2WHW;
	Mon, 12 Aug 2024 12:53:46 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdUXr-00000000KHl-2qRv;
	Mon, 12 Aug 2024 12:53:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723467188; x=1755003188;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Sf7fii3Uk5dXCYdQrY2jiMwoeseQxuJiZtqIZOoSKZ4=;
  b=PWfsWDBfJbjy0oUuum6dngv9MxDNOECu/YwdCjuE9UmhasTMplMiarev
   ROpDRJlLRB4kou6+sS0BIYhIVCUQ5H6FHsz1PptWi9rM9THYI62aAspQV
   Y+GD5HmP6KzF4/3THDt73Rc15pf/eZkyIzGlZ5Tn3bMVudAUOmxr3uv6O
   LUZPtjXlDIhPLHz+gyeGZoclneT8EBK9O+B68jjG/Fa1wmApZlkm1V7kO
   D/D0TFEhDlFwzkwPvkyCV/lFDzojUkbZmrM5LX1u737hDFRt6UuhnghNb
   bJDhkyrVgO9ZJSgDGBY+JwIbjIDK8uoKDf6IVtLoIDh3aQsG+zUxa/hvE
   w==;
X-CSE-ConnectionGUID: NUD+OLXwTW2/pp/yI7m17g==
X-CSE-MsgGUID: uYGlQfkgTNumtKXmdK7Ezg==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="21426110"
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; 
   d="scan'208";a="21426110"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2024 05:53:07 -0700
X-CSE-ConnectionGUID: orTAER7nTNqDVXXYoMVpUA==
X-CSE-MsgGUID: PxMXHWnoT4aGV9ihNublwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; 
   d="scan'208";a="63089626"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 12 Aug 2024 05:53:02 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sdUXk-000Bo3-0Q;
	Mon, 12 Aug 2024 12:53:00 +0000
Date: Mon, 12 Aug 2024 20:52:33 +0800
From: kernel test robot <lkp@intel.com>
To: Hui-Ping Chen <hpchen0nvt@gmail.com>, miquel.raynal@bootlin.com,
	richard@nod.at, vigneshr@ti.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, sumit.semwal@linaro.org,
	christian.koenig@amd.com, esben@geanix.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	Hui-Ping Chen <hpchen0nvt@gmail.com>
Subject: Re: [PATCH 2/2] mtd: rawnand: nuvoton: add new driver for the
 Nuvoton MA35 SoC
Message-ID: <202408122007.quTiDXPR-lkp@intel.com>
References: <20240812030045.20831-3-hpchen0nvt@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240812030045.20831-3-hpchen0nvt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240812_055307_788908_4641D22B 
X-CRM114-Status: GOOD (  13.81  )
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
[also build test WARNING on linus/master v6.11-rc3 next-20240812]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hui-Ping-Chen/dt-bindings-mtd-nuvoton-ma35d1-nand-add-new-bindings/20240812-110259
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next
patch link:    https://lore.kernel.org/r/20240812030045.20831-3-hpchen0nvt%40gmail.com
patch subject: [PATCH 2/2] mtd: rawnand: nuvoton: add new driver for the Nuvoton MA35 SoC
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240812/202408122007.quTiDXPR-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240812/202408122007.quTiDXPR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408122007.quTiDXPR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:991:29: warning: cast from 'irqreturn_t (*)(int, struct ma35_nand_info *)' (aka 'enum irqreturn (*)(int, struct ma35_nand_info *)') to 'irq_handler_t' (aka 'enum irqreturn (*)(int, void *)') converts to incompatible function type [-Wcast-function-type-strict]
     991 |         if (request_irq(nand->irq, (irq_handler_t)&ma35_nand_irq,
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +991 drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c

   921	
   922	static int ma35_nand_probe(struct platform_device *pdev)
   923	{
   924		struct ma35_nand_info *nand;
   925		struct nand_chip *chip;
   926		struct mtd_info *mtd;
   927		int retval = 0;
   928	
   929		nand = devm_kzalloc(&pdev->dev, sizeof(struct ma35_nand_info), GFP_KERNEL);
   930		if (!nand)
   931			return -ENOMEM;
   932	
   933		nand_controller_init(&nand->controller);
   934	
   935		nand->regs = devm_platform_ioremap_resource(pdev, 0);
   936		if (IS_ERR(nand->regs))
   937			return PTR_ERR(nand->regs);
   938	
   939		nand->dev = &pdev->dev;
   940		chip = &nand->chip;
   941		mtd = nand_to_mtd(chip);
   942		nand_set_controller_data(chip, nand);
   943		nand_set_flash_node(chip, pdev->dev.of_node);
   944	
   945		mtd->priv = chip;
   946		mtd->owner = THIS_MODULE;
   947		mtd->dev.parent = &pdev->dev;
   948	
   949		nand->clk = of_clk_get(pdev->dev.of_node, 0);
   950		if (IS_ERR(nand->clk))
   951			return dev_err_probe(&pdev->dev, PTR_ERR(nand->clk),
   952					     "failed to find nand clock\n");
   953	
   954		retval = clk_prepare_enable(nand->clk);
   955		if (retval < 0) {
   956			dev_err(&pdev->dev, "Failed to enable clock\n");
   957			return -ENXIO;
   958		}
   959	
   960		nand->chip.controller    = &nand->controller;
   961	
   962		chip->legacy.cmdfunc     = ma35_nand_command;
   963		chip->legacy.waitfunc    = ma35_waitfunc;
   964		chip->legacy.read_byte   = ma35_nand_read_byte;
   965		chip->legacy.select_chip = ma35_nand_select_chip;
   966		chip->legacy.read_buf    = ma35_read_buf_dma;
   967		chip->legacy.write_buf   = ma35_write_buf_dma;
   968		chip->legacy.dev_ready   = ma35_nand_devready;
   969		chip->legacy.chip_delay  = 25; /* us */
   970	
   971		/* Read OOB data first, then HW read page */
   972		chip->ecc.hwctl      = ma35_nand_enable_hwecc;
   973		chip->ecc.calculate  = ma35_nand_calculate_ecc;
   974		chip->ecc.correct    = ma35_nand_correct_data;
   975		chip->ecc.write_page = ma35_nand_write_page_hwecc;
   976		chip->ecc.read_page  = ma35_nand_read_page_hwecc_oob_first;
   977		chip->ecc.read_oob   = ma35_nand_read_oob_hwecc;
   978		chip->options |= (NAND_NO_SUBPAGE_WRITE | NAND_USES_DMA);
   979	
   980		ma35_nand_initialize(nand);
   981		platform_set_drvdata(pdev, nand);
   982	
   983		nand->controller.ops = &ma35_nand_controller_ops;
   984	
   985		nand->irq = platform_get_irq(pdev, 0);
   986		if (nand->irq < 0) {
   987			dev_err(&pdev->dev, "failed to get platform irq\n");
   988			return -EINVAL;
   989		}
   990	
 > 991		if (request_irq(nand->irq, (irq_handler_t)&ma35_nand_irq,
   992				IRQF_TRIGGER_HIGH, "ma35d1-nand", nand)) {
   993			dev_err(&pdev->dev, "Error requesting NAND IRQ\n");
   994			return -ENXIO;
   995		}
   996	
   997		retval = nand_scan(chip, 1);
   998		if (retval)
   999			return retval;
  1000	
  1001		if (mtd_device_register(mtd, nand->parts, nand->nr_parts)) {
  1002			nand_cleanup(chip);
  1003			devm_kfree(&pdev->dev, nand);
  1004			return retval;
  1005		}
  1006	
  1007		pr_info("ma35-nfi: registered successfully! mtdid=%s\n", mtd->name);
  1008	
  1009		return retval;
  1010	}
  1011	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
