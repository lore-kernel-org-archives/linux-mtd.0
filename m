Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 264B6EB64D7
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Jun 2023 06:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k46unzr3CA9tPE9WrFIVosE27WmkKE7U9r4hgcenJRk=; b=kqCHG3dGfFpiZq
	kclzMDtmKm2LpB6JopT+0sHcdGDgxm9a5wZtDLP4c3Wh5f5egSLgpaEb/SHbdmk//sGSnPHxPTnNK
	O4ACnc2g6SQRmmDe9/ZuvO4P14Jg7yJVo+CrvNc5IL5qH6JCN3/F0TyFRBXQQ0IdvYkPgA9KJQ57W
	qu0zt6oaLvcncbZ62NdZ0asGrhwbLDZpHLEWog2STPVilhPiGuO8LyUd87Wjs46qo3YXQUpq/WhVw
	nN36LEliqPzYS5pMQ9s4+a0+0w7Wd9AV3+KAN+FWeUL8QDW4aLF4wgpTNrwoS/tx7cctaGF2EJ8XB
	SfRPeyLAZ9rp5t8WULJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBUWw-00AFHa-1w;
	Tue, 20 Jun 2023 06:07:54 +0000
Received: from mga05.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBUWt-00AFH6-1a
	for linux-mtd@lists.infradead.org;
	Tue, 20 Jun 2023 06:07:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687241271; x=1718777271;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dveNRvgnk0T7wEHMtgIvyEJb90QX++cVm6POy0ZjG+I=;
  b=g0Xc2Pz1jK1rDW4QkNKEhnOYSHc3l3Xkw1uPdOKuy4sNYo/0Dor/Sy+3
   pUzlsrJb9rVlHjQaM0rKer69e4bFiGIdlF/GxI0U1QbJ0dFitj0MFr9DQ
   ZTXzi67WutCKQFC+pSgsCzMh5U8iN26F0fbXZCASe9o8Z6jaGr59TXWdj
   yutsubDVlBU0XnzlvLg7gL1gZ1fF2p6ipGPYctAPNFkOxWeL1G9KucBtx
   zw4ESX46YnqsJXUTW2/myuqed0VmnOR1bRM6SnIudFWYAI6k2pj2A/cuL
   qcamLhk7qiXNSc4v1taYokvWgQW6dwBhg4D8e4JR3oOrK8L8cEXpZJeno
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="446154060"
X-IronPort-AV: E=Sophos;i="6.00,256,1681196400"; 
   d="scan'208";a="446154060"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2023 23:07:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="838092896"
X-IronPort-AV: E=Sophos;i="6.00,256,1681196400"; 
   d="scan'208";a="838092896"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 19 Jun 2023 23:06:58 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qBUW1-0005Zo-1Y;
	Tue, 20 Jun 2023 06:06:57 +0000
Date: Tue, 20 Jun 2023 14:06:22 +0800
From: kernel test robot <lkp@intel.com>
To: William Zhang <william.zhang@broadcom.com>,
	Broadcom Kernel List <bcm-kernel-feedback-list@broadcom.com>,
	Linux MTD List <linux-mtd@lists.infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, f.fainelli@gmail.com, rafal@milecki.pl,
	kursad.oney@broadcom.com, joel.peshkin@broadcom.com,
	computersforpeace@gmail.com, anand.gore@broadcom.com,
	dregan@mail.com, kamal.dasu@broadcom.com, tomer.yacoby@broadcom.com,
	dan.beygelman@broadcom.com,
	William Zhang <william.zhang@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-kernel@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
	Richard Weinberger <richard@nod.at>,
	Kamal Dasu <kdasu.kdev@gmail.com>
Subject: Re: [PATCH v2 4/4] mtd: rawnand: brcmnand: Fix potential
 out-of-bounds access in oob write
Message-ID: <202306201340.C2Y4kmFL-lkp@intel.com>
References: <20230617022920.67173-5-william.zhang@broadcom.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230617022920.67173-5-william.zhang@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_230751_584212_295F9A06 
X-CRM114-Status: GOOD (  13.18  )
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

Hi William,

kernel test robot noticed the following build warnings:

[auto build test WARNING on mtd/nand/next]
[also build test WARNING on linus/master v6.4-rc7 next-20230619]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/William-Zhang/mtd-rawnand-brcmnand-Fix-ECC-level-field-setting-for-v7-2-controller/20230617-103050
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next
patch link:    https://lore.kernel.org/r/20230617022920.67173-5-william.zhang%40broadcom.com
patch subject: [PATCH v2 4/4] mtd: rawnand: brcmnand: Fix potential out-of-bounds access in oob write
config: arm64-randconfig-s043-20230619 (https://download.01.org/0day-ci/archive/20230620/202306201340.C2Y4kmFL-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230620/202306201340.C2Y4kmFL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306201340.C2Y4kmFL-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/mtd/nand/raw/brcmnand/brcmnand.c:1500:54: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned int [usertype] data @@     got restricted __be32 [usertype] @@
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:1500:54: sparse:     expected unsigned int [usertype] data
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:1500:54: sparse:     got restricted __be32 [usertype]
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:1836:42: sparse: sparse: cast to restricted __be32
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:1836:42: sparse: sparse: cast to restricted __be32
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:1836:42: sparse: sparse: cast to restricted __be32
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:1836:42: sparse: sparse: cast to restricted __be32
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:1836:42: sparse: sparse: cast to restricted __be32
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:1836:42: sparse: sparse: cast to restricted __be32
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:2065:41: sparse: sparse: dubious: x | !y

vim +1500 drivers/mtd/nand/raw/brcmnand/brcmnand.c

  1468	
  1469	/*
  1470	 * write_oob_to_regs - write data to OOB registers
  1471	 * @i: sub-page sector index
  1472	 * @oob: buffer to write from
  1473	 * @sas: spare area sector size (i.e., OOB size per FLASH_CACHE)
  1474	 * @sector_1k: 1 for 1KiB sectors, 0 for 512B, other values are illegal
  1475	 */
  1476	static int write_oob_to_regs(struct brcmnand_controller *ctrl, int i,
  1477				     const u8 *oob, int sas, int sector_1k)
  1478	{
  1479		int tbytes = sas << sector_1k;
  1480		int j, k = 0;
  1481		u32 last = 0xffffffff;
  1482		u8 *plast = (u8 *)&last;
  1483	
  1484		/* Adjust OOB values for 1K sector size */
  1485		if (sector_1k && (i & 0x01))
  1486			tbytes = max(0, tbytes - (int)ctrl->max_oob);
  1487		tbytes = min_t(int, tbytes, ctrl->max_oob);
  1488	
  1489		for (j = 0; (j + 3) < tbytes; j += 4)
  1490			oob_reg_write(ctrl, j,
  1491					(oob[j + 0] << 24) |
  1492					(oob[j + 1] << 16) |
  1493					(oob[j + 2] <<  8) |
  1494					(oob[j + 3] <<  0));
  1495	
  1496		while (j < tbytes)
  1497			plast[k++] = oob[j++];
  1498	
  1499		if (tbytes & 0x3)
> 1500			oob_reg_write(ctrl, (tbytes & ~0x3), cpu_to_be32(last));
  1501	
  1502		return tbytes;
  1503	}
  1504	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
