Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16A4DC2BD09
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jun 2024 14:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t9IxRY1BdPNwpLN3b6F8zPPpDzJPxVZkaTaguNiw3t4=; b=eTu2l++Y4cFe3l
	IM0FoKTF8pTrf3yETRXK71UPm5BNosvZK6eA2z7hO1GdAB/4MSI3IB9JTb3Q0oyzTggHMSJlTUo3B
	UGAC9vPFcM70AZCf4cFp9TxT2RWbrFJulQCARt+eP/XicX6CqyqjjzO8agdC0eTzXM8icj1oSTerc
	MKArHPt79cgcU4lBZNl0cFjZIdGnqq3z+sUHGJZwuamAGkqwKM0IDiZmM+HqxQM5kpftImBx5ozDW
	g4XC42Oyt50Sadf7McBTIgQkF5Lfy8jNp6yHZ1bBnEk5d9w+03aH1m+RCjpCSWOC5s4MQkbx7J0um
	TIRs6TZ8RVG1zrKIyZLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMpfe-0000000AYKu-1Fc2;
	Thu, 27 Jun 2024 14:00:18 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMpfW-0000000AYJa-2oNY
	for linux-mtd@lists.infradead.org;
	Thu, 27 Jun 2024 14:00:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719496810; x=1751032810;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LgBGKtBwZfpMFDGPGG2/N4d17mEMbtxMcO4dCLtOSEE=;
  b=QYo7o9H6njLhtw+pG2Kvwl7DEbJ9xgSANNBQzb4MYg+rXurmKI3d3Kyf
   TYNgXf2iExW4dbED31XdriWb4reJcQbM6edqpWpQ0Ja/SCQ1V894n3oct
   Qq+hP/tPuPtgU9k38Na8oY+sq/p/0ADMM6Jeq7KCcQVFdE1xs2hOG3fTR
   sxTsbdNVr3hYpO1VY4/FmblKckXS87P6oCmjih5WGD6znMZFK3Y4Euw17
   WsIgRq4BZv70vBrlc6pcFzkIhpFyPpnfM91Fi6UX/0WBpt+qrlOtqrtpT
   yVF0QsUoHwKzLs3151zXYk9yr4DcNWdCNH5Wa9aTjtRsU85e16v0rjLTg
   w==;
X-CSE-ConnectionGUID: ZoVyK70kRuGGlYYQeHTEJA==
X-CSE-MsgGUID: w3BecWCGS+amOgZNC6v+Yg==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="27311572"
X-IronPort-AV: E=Sophos;i="6.09,166,1716274800"; 
   d="scan'208";a="27311572"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2024 07:00:10 -0700
X-CSE-ConnectionGUID: LTr6F1fYT9yQlGDVhYBTqw==
X-CSE-MsgGUID: /muBcJOpTIuJq4B1D1IPIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,166,1716274800"; 
   d="scan'208";a="48739501"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 27 Jun 2024 07:00:07 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMpfR-000GG5-1J;
	Thu, 27 Jun 2024 14:00:05 +0000
Date: Thu, 27 Jun 2024 21:59:05 +0800
From: kernel test robot <lkp@intel.com>
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Stefan Agner <stefan@agner.ch>
Cc: oe-kbuild-all@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Subject: Re: [PATCH] mtd: nand: Add support for M5441x NFC
Message-ID: <202406272154.v694SvQb-lkp@intel.com>
References: <20240620-upstream-nfc-mcf5441x-v1-1-69b64807d7a6@yoseli.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240620-upstream-nfc-mcf5441x-v1-1-69b64807d7a6@yoseli.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_070010_828556_58E8B423 
X-CRM114-Status: GOOD (  12.53  )
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

Hi Jean-Michel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on e5b3efbe1ab1793bb49ae07d56d0973267e65112]

url:    https://github.com/intel-lab-lkp/linux/commits/Jean-Michel-Hautbois/mtd-nand-Add-support-for-M5441x-NFC/20240625-144333
base:   e5b3efbe1ab1793bb49ae07d56d0973267e65112
patch link:    https://lore.kernel.org/r/20240620-upstream-nfc-mcf5441x-v1-1-69b64807d7a6%40yoseli.org
patch subject: [PATCH] mtd: nand: Add support for M5441x NFC
config: sh-randconfig-001-20240627 (https://download.01.org/0day-ci/archive/20240627/202406272154.v694SvQb-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240627/202406272154.v694SvQb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406272154.v694SvQb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/mtd/nand/raw/vf610_nfc.c: In function 'vf610_nfc_probe':
>> drivers/mtd/nand/raw/vf610_nfc.c:844:29: warning: unused variable 'child' [-Wunused-variable]
     844 |         struct device_node *child;
         |                             ^~~~~


vim +/child +844 drivers/mtd/nand/raw/vf610_nfc.c

962c35ef1e6834 drivers/mtd/nand/raw/vf610_nfc.c Miquel Raynal        2018-07-20  837  
456930d80a2da1 drivers/mtd/nand/vf610_nfc.c     Stefan Agner         2015-09-02  838  static int vf610_nfc_probe(struct platform_device *pdev)
456930d80a2da1 drivers/mtd/nand/vf610_nfc.c     Stefan Agner         2015-09-02  839  {
456930d80a2da1 drivers/mtd/nand/vf610_nfc.c     Stefan Agner         2015-09-02  840  	struct vf610_nfc *nfc;
456930d80a2da1 drivers/mtd/nand/vf610_nfc.c     Stefan Agner         2015-09-02  841  	struct mtd_info *mtd;
456930d80a2da1 drivers/mtd/nand/vf610_nfc.c     Stefan Agner         2015-09-02  842  	struct nand_chip *chip;
8e5473c07a181c drivers/mtd/nand/raw/vf610_nfc.c Jean-Michel Hautbois 2024-06-20  843  	struct nand_chip *pdata;
456930d80a2da1 drivers/mtd/nand/vf610_nfc.c     Stefan Agner         2015-09-02 @844  	struct device_node *child;
456930d80a2da1 drivers/mtd/nand/vf610_nfc.c     Stefan Agner         2015-09-02  845  	int err;
456930d80a2da1 drivers/mtd/nand/vf610_nfc.c     Stefan Agner         2015-09-02  846  	int irq;
456930d80a2da1 drivers/mtd/nand/vf610_nfc.c     Stefan Agner         2015-09-02  847  
456930d80a2da1 drivers/mtd/nand/vf610_nfc.c     Stefan Agner         2015-09-02  848  	nfc = devm_kzalloc(&pdev->dev, sizeof(*nfc), GFP_KERNEL);
456930d80a2da1 drivers/mtd/nand/vf610_nfc.c     Stefan Agner         2015-09-02  849  	if (!nfc)
456930d80a2da1 drivers/mtd/nand/vf610_nfc.c     Stefan Agner         2015-09-02  850  		return -ENOMEM;
456930d80a2da1 drivers/mtd/nand/vf610_nfc.c     Stefan Agner         2015-09-02  851  
456930d80a2da1 drivers/mtd/nand/vf610_nfc.c     Stefan Agner         2015-09-02  852  	nfc->dev = &pdev->dev;
456930d80a2da1 drivers/mtd/nand/vf610_nfc.c     Stefan Agner         2015-09-02  853  	chip = &nfc->chip;
8e5473c07a181c drivers/mtd/nand/raw/vf610_nfc.c Jean-Michel Hautbois 2024-06-20  854  	pdata = dev_get_platdata(&pdev->dev);
8e5473c07a181c drivers/mtd/nand/raw/vf610_nfc.c Jean-Michel Hautbois 2024-06-20  855  	if (pdata)
8e5473c07a181c drivers/mtd/nand/raw/vf610_nfc.c Jean-Michel Hautbois 2024-06-20  856  		*chip = *pdata;
8e5473c07a181c drivers/mtd/nand/raw/vf610_nfc.c Jean-Michel Hautbois 2024-06-20  857  
960823a226b37e drivers/mtd/nand/vf610_nfc.c     Boris Brezillon      2015-12-10  858  	mtd = nand_to_mtd(chip);
456930d80a2da1 drivers/mtd/nand/vf610_nfc.c     Stefan Agner         2015-09-02  859  
456930d80a2da1 drivers/mtd/nand/vf610_nfc.c     Stefan Agner         2015-09-02  860  	mtd->owner = THIS_MODULE;
456930d80a2da1 drivers/mtd/nand/vf610_nfc.c     Stefan Agner         2015-09-02  861  	mtd->dev.parent = nfc->dev;
8e5473c07a181c drivers/mtd/nand/raw/vf610_nfc.c Jean-Michel Hautbois 2024-06-20  862  
8e5473c07a181c drivers/mtd/nand/raw/vf610_nfc.c Jean-Michel Hautbois 2024-06-20  863  	/*
8e5473c07a181c drivers/mtd/nand/raw/vf610_nfc.c Jean-Michel Hautbois 2024-06-20  864  	 * We keep the MTD name unchanged to avoid breaking platforms
8e5473c07a181c drivers/mtd/nand/raw/vf610_nfc.c Jean-Michel Hautbois 2024-06-20  865  	 * where the MTD cmdline parser is used and the bootloader
8e5473c07a181c drivers/mtd/nand/raw/vf610_nfc.c Jean-Michel Hautbois 2024-06-20  866  	 * has not been updated to use the new naming scheme.
8e5473c07a181c drivers/mtd/nand/raw/vf610_nfc.c Jean-Michel Hautbois 2024-06-20  867  	 */
8e5473c07a181c drivers/mtd/nand/raw/vf610_nfc.c Jean-Michel Hautbois 2024-06-20  868  	if (!nfc->dev->of_node)
8e5473c07a181c drivers/mtd/nand/raw/vf610_nfc.c Jean-Michel Hautbois 2024-06-20  869  		mtd->name = "NAND";
8e5473c07a181c drivers/mtd/nand/raw/vf610_nfc.c Jean-Michel Hautbois 2024-06-20  870  	else
456930d80a2da1 drivers/mtd/nand/vf610_nfc.c     Stefan Agner         2015-09-02  871  		mtd->name = DRV_NAME;
456930d80a2da1 drivers/mtd/nand/vf610_nfc.c     Stefan Agner         2015-09-02  872  
456930d80a2da1 drivers/mtd/nand/vf610_nfc.c     Stefan Agner         2015-09-02  873  	irq = platform_get_irq(pdev, 0);
3549fecd10d24b drivers/mtd/nand/raw/vf610_nfc.c Zhu Wang             2023-08-03  874  	if (irq < 0)
3549fecd10d24b drivers/mtd/nand/raw/vf610_nfc.c Zhu Wang             2023-08-03  875  		return irq;
456930d80a2da1 drivers/mtd/nand/vf610_nfc.c     Stefan Agner         2015-09-02  876  
2d77b08eaf0b2f drivers/mtd/nand/raw/vf610_nfc.c Cai Huoqing          2021-09-01  877  	nfc->regs = devm_platform_ioremap_resource(pdev, 0);
8e5473c07a181c drivers/mtd/nand/raw/vf610_nfc.c Jean-Michel Hautbois 2024-06-20  878  	if (IS_ERR(nfc->regs)) {
8e5473c07a181c drivers/mtd/nand/raw/vf610_nfc.c Jean-Michel Hautbois 2024-06-20  879  		dev_err(nfc->dev, "Unable to map registers!\n");
456930d80a2da1 drivers/mtd/nand/vf610_nfc.c     Stefan Agner         2015-09-02  880  		return PTR_ERR(nfc->regs);
8e5473c07a181c drivers/mtd/nand/raw/vf610_nfc.c Jean-Michel Hautbois 2024-06-20  881  	}
456930d80a2da1 drivers/mtd/nand/vf610_nfc.c     Stefan Agner         2015-09-02  882  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
