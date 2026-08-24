Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B7AEC5DF81
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Aug 2026 19:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jS1O/w4f/HaMXe6D+OtAaggLCvTQChJK/mEHPo20NpM=; b=msiPrMJ+WkYakp
	oLE8hygNepC9myIrDHERyfwHeki5j+NqLnmosnDJuOeklUGuETot7HMvxJjxuplm9HzQ9Jtc46dR1
	bnxkzWDSFsmpiBMssdqY92YOnl1hgmue2E98TeWOpTIIafRLdmHIshulUC3zWazrj/9ZS6qhrRt4T
	ZJNcECf/o+bYqd2RkbOV7/elxFU7HTgequA6+RCTGCUaj14/I4Kbih3NjW8EMXtyloyldnEuTEcHU
	rJBG7O8ORVj16f+1smASXgLxMxTxlGV7CuimFnPhTtl29CiMBwDgRkV0rxIPt8aJNz/6qEcKY1D+V
	tMylU2zFVunVRY3j2yaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wya8k-0000000HIcK-1WLO;
	Mon, 24 Aug 2026 19:15:26 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wya8h-0000000HIbi-1HyK
	for linux-mtd@lists.infradead.org;
	Mon, 24 Aug 2026 19:15:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787598923; x=1819134923;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gsekJprGaXKAM7tM8FJNjyQjNV/9Z4HuwtcP34Q5/4s=;
  b=hQECpapcAxqCHtXzzcgjraP0LIv1kneGGbhKh9oHWrcStJgMoXX6nojX
   juZu9IniiKsklureDXd9UvoPMcYlprnH9/+QaZa6gZxjv56mcDW/W1Jh6
   GHhxey7pE+oCI/qNiG7rgVoiEZSj4AsgE7juFVe6PCZWZt97U1HsupsJn
   lzeZJdVAz39ynO2Wt4R5rseB4FZ1ME+dxMC5+1rK8xRIzkEY7GVNMUUkL
   c4EsWuIOVFyGe+BA7+Sz6m8TogtBDJtejUKTqeXwr4pthfrpZq55kDB+6
   TSmP4m958Ey7fKwPnfMD9p9f93XYvZqakxnc1eCVxLKD+JK1hLeqgN4kd
   A==;
X-CSE-ConnectionGUID: xVWxYne4Tw2i58Rez35nlg==
X-CSE-MsgGUID: 1cfaOj2SRd2hk4/jfxzGoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="88073494"
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; 
   d="scan'208";a="88073494"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 12:15:22 -0700
X-CSE-ConnectionGUID: ff27bxXkSEGswYxlha5lvA==
X-CSE-MsgGUID: 7baDVX3rR8q/oa5sf18GTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; 
   d="scan'208";a="265771432"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 24 Aug 2026 12:15:21 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wya8V-000000003rX-1Wm7;
	Mon, 24 Aug 2026 19:15:13 +0000
Date: Tue, 25 Aug 2026 03:12:13 +0800
From: kernel test robot <lkp@intel.com>
To: Rosen Penev <rosenp@gmail.com>, linux-mtd@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: ndfc: use devm_platform_ioremap_resource
Message-ID: <202608250359.cFwVUqgE-lkp@intel.com>
References: <20260822224150.198749-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260822224150.198749-1-rosenp@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_121523_414105_C92DB6EC 
X-CRM114-Status: GOOD (  13.79  )
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

Hi Rosen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v7.2]
[also build test WARNING on linus/master next-20260821]
[cannot apply to mtd/nand/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rosen-Penev/mtd-rawnand-ndfc-use-devm_platform_ioremap_resource/20260822-154150
base:   v7.2
patch link:    https://lore.kernel.org/r/20260822224150.198749-1-rosenp%40gmail.com
patch subject: [PATCH] mtd: rawnand: ndfc: use devm_platform_ioremap_resource
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260825/202608250359.cFwVUqgE-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260825/202608250359.cFwVUqgE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608250359.cFwVUqgE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/mtd/nand/raw/ndfc.c: In function 'ndfc_probe':
>> drivers/mtd/nand/raw/ndfc.c:192:13: warning: unused variable 'err' [-Wunused-variable]
     192 |         int err, len = 0;
         |             ^~~


vim +/err +192 drivers/mtd/nand/raw/ndfc.c

ce4c61f1848649 drivers/mtd/nand/ndfc.c     Thomas Gleixner 2006-05-23  184  
06f25510692385 drivers/mtd/nand/ndfc.c     Bill Pemberton  2012-11-19  185  static int ndfc_probe(struct platform_device *ofdev)
ce4c61f1848649 drivers/mtd/nand/ndfc.c     Thomas Gleixner 2006-05-23  186  {
410fe2f02630fa drivers/mtd/nand/ndfc.c     Felix Radensky  2011-04-26  187  	struct ndfc_controller *ndfc;
dcd80db3efa82b drivers/mtd/nand/raw/ndfc.c Rosen Penev     2026-08-22  188  	void __iomem *ndfcbase;
766f271a63d1ee drivers/mtd/nand/ndfc.c     Ian Munsie      2010-10-01  189  	const __be32 *reg;
a808ad3b0d2841 drivers/mtd/nand/ndfc.c     Sean MacLennan  2008-12-10  190  	u32 ccr;
5828c60826e942 drivers/mtd/nand/ndfc.c     Dan Carpenter   2014-07-31  191  	u32 cs;
cceca8cb776b03 drivers/mtd/nand/raw/ndfc.c Rosen Penev     2026-06-13 @192  	int err, len = 0;
a808ad3b0d2841 drivers/mtd/nand/ndfc.c     Sean MacLennan  2008-12-10  193  
dcd80db3efa82b drivers/mtd/nand/raw/ndfc.c Rosen Penev     2026-08-22  194  	ndfcbase = devm_platform_ioremap_resource(ofdev, 0);
dcd80db3efa82b drivers/mtd/nand/raw/ndfc.c Rosen Penev     2026-08-22  195  	if (IS_ERR(ndfcbase))
dcd80db3efa82b drivers/mtd/nand/raw/ndfc.c Rosen Penev     2026-08-22  196  		return PTR_ERR(ndfcbase);
dcd80db3efa82b drivers/mtd/nand/raw/ndfc.c Rosen Penev     2026-08-22  197  
a808ad3b0d2841 drivers/mtd/nand/ndfc.c     Sean MacLennan  2008-12-10  198  	/* Read the reg property to get the chip select */
61c7a080a5a061 drivers/mtd/nand/ndfc.c     Grant Likely    2010-04-13  199  	reg = of_get_property(ofdev->dev.of_node, "reg", &len);
a808ad3b0d2841 drivers/mtd/nand/ndfc.c     Sean MacLennan  2008-12-10  200  	if (reg == NULL || len != 12) {
a808ad3b0d2841 drivers/mtd/nand/ndfc.c     Sean MacLennan  2008-12-10  201  		dev_err(&ofdev->dev, "unable read reg property (%d)\n", len);
a808ad3b0d2841 drivers/mtd/nand/ndfc.c     Sean MacLennan  2008-12-10  202  		return -ENOENT;
a808ad3b0d2841 drivers/mtd/nand/ndfc.c     Sean MacLennan  2008-12-10  203  	}
410fe2f02630fa drivers/mtd/nand/ndfc.c     Felix Radensky  2011-04-26  204  
410fe2f02630fa drivers/mtd/nand/ndfc.c     Felix Radensky  2011-04-26  205  	cs = be32_to_cpu(reg[0]);
410fe2f02630fa drivers/mtd/nand/ndfc.c     Felix Radensky  2011-04-26  206  	if (cs >= NDFC_MAX_CS) {
410fe2f02630fa drivers/mtd/nand/ndfc.c     Felix Radensky  2011-04-26  207  		dev_err(&ofdev->dev, "invalid CS number (%d)\n", cs);
410fe2f02630fa drivers/mtd/nand/ndfc.c     Felix Radensky  2011-04-26  208  		return -EINVAL;
410fe2f02630fa drivers/mtd/nand/ndfc.c     Felix Radensky  2011-04-26  209  	}
410fe2f02630fa drivers/mtd/nand/ndfc.c     Felix Radensky  2011-04-26  210  
410fe2f02630fa drivers/mtd/nand/ndfc.c     Felix Radensky  2011-04-26  211  	ndfc = &ndfc_ctrl[cs];
410fe2f02630fa drivers/mtd/nand/ndfc.c     Felix Radensky  2011-04-26  212  	ndfc->chip_select = cs;
410fe2f02630fa drivers/mtd/nand/ndfc.c     Felix Radensky  2011-04-26  213  
7da45139d264f3 drivers/mtd/nand/raw/ndfc.c Miquel Raynal   2018-07-17  214  	nand_controller_init(&ndfc->ndfc_control);
410fe2f02630fa drivers/mtd/nand/ndfc.c     Felix Radensky  2011-04-26  215  	ndfc->ofdev = ofdev;
410fe2f02630fa drivers/mtd/nand/ndfc.c     Felix Radensky  2011-04-26  216  	dev_set_drvdata(&ofdev->dev, ndfc);
a808ad3b0d2841 drivers/mtd/nand/ndfc.c     Sean MacLennan  2008-12-10  217  
dcd80db3efa82b drivers/mtd/nand/raw/ndfc.c Rosen Penev     2026-08-22  218  	ndfc->ndfcbase = ndfcbase;
ce4c61f1848649 drivers/mtd/nand/ndfc.c     Thomas Gleixner 2006-05-23  219  
a808ad3b0d2841 drivers/mtd/nand/ndfc.c     Sean MacLennan  2008-12-10  220  	ccr = NDFC_CCR_BS(ndfc->chip_select);
ce4c61f1848649 drivers/mtd/nand/ndfc.c     Thomas Gleixner 2006-05-23  221  
a808ad3b0d2841 drivers/mtd/nand/ndfc.c     Sean MacLennan  2008-12-10  222  	/* It is ok if ccr does not exist - just default to 0 */
61c7a080a5a061 drivers/mtd/nand/ndfc.c     Grant Likely    2010-04-13  223  	reg = of_get_property(ofdev->dev.of_node, "ccr", NULL);
a808ad3b0d2841 drivers/mtd/nand/ndfc.c     Sean MacLennan  2008-12-10  224  	if (reg)
766f271a63d1ee drivers/mtd/nand/ndfc.c     Ian Munsie      2010-10-01  225  		ccr |= be32_to_cpup(reg);
ce4c61f1848649 drivers/mtd/nand/ndfc.c     Thomas Gleixner 2006-05-23  226  
4f2692a5383e4b drivers/mtd/nand/raw/ndfc.c Rosen Penev     2026-06-01  227  	iowrite32be(ccr, ndfc->ndfcbase + NDFC_CCR);
ce4c61f1848649 drivers/mtd/nand/ndfc.c     Thomas Gleixner 2006-05-23  228  
a808ad3b0d2841 drivers/mtd/nand/ndfc.c     Sean MacLennan  2008-12-10  229  	/* Set the bank settings if given */
61c7a080a5a061 drivers/mtd/nand/ndfc.c     Grant Likely    2010-04-13  230  	reg = of_get_property(ofdev->dev.of_node, "bank-settings", NULL);
a808ad3b0d2841 drivers/mtd/nand/ndfc.c     Sean MacLennan  2008-12-10  231  	if (reg) {
a808ad3b0d2841 drivers/mtd/nand/ndfc.c     Sean MacLennan  2008-12-10  232  		int offset = NDFC_BCFG0 + (ndfc->chip_select << 2);
4f2692a5383e4b drivers/mtd/nand/raw/ndfc.c Rosen Penev     2026-06-01  233  		iowrite32be(be32_to_cpup(reg), ndfc->ndfcbase + offset);
a808ad3b0d2841 drivers/mtd/nand/ndfc.c     Sean MacLennan  2008-12-10  234  	}
a808ad3b0d2841 drivers/mtd/nand/ndfc.c     Sean MacLennan  2008-12-10  235  
dcd80db3efa82b drivers/mtd/nand/raw/ndfc.c Rosen Penev     2026-08-22  236  	return ndfc_chip_init(ndfc, ofdev->dev.of_node);
ce4c61f1848649 drivers/mtd/nand/ndfc.c     Thomas Gleixner 2006-05-23  237  }
ce4c61f1848649 drivers/mtd/nand/ndfc.c     Thomas Gleixner 2006-05-23  238  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
