Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B67EE6BF1F
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Jan 2026 15:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xX/+1e/VUa3KtwQqJexaCsNmc6Yu/mzCEJHqqU79aTA=; b=V+f1LjBIKYI20X
	t5WakNK92fZSDd5wlTgu/9lsoVBIgNuVfDUUHvYRquNVfSxQvXWYTHJawcSDp4G5XxH5EeEhCHe2c
	8bNmEF7dA41V8vLXc59e36BpERDE3qYnYYJuhEZzNAWNPL/oYwW/CjwSPkZ7Q+Ili8fOXCrDA3eCm
	2gdNwv3NFg48SGoaU54/hlVZ/OONMnhp6iQaI8RnsLxvbum/XFdnnoaTvEaI5m24wJc7cnk4mRod5
	2LpCyNiKwZiEB7IaOSoruhb/PMZjwGVKkd987ypGV0TUHOat/eRWk30DICVk5uWkSvJYoAUozrAs4
	mtMsnEY7xP6l9qnYXHMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlqSy-00000001eaE-16O0;
	Fri, 30 Jan 2026 15:31:24 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlqSv-00000001eZk-1XP9
	for linux-mtd@lists.infradead.org;
	Fri, 30 Jan 2026 15:31:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769787081; x=1801323081;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/BTCSIhz5h5AdCXs/IeSYBwPtxUn2keWMYQIsXLWn0k=;
  b=aD3QW4hOTbOaKILTeGKDacMJv5I8dHtXm08baV/onlI2gMrgfJL3ZX+w
   qOTG73lZp2tRLiA7+yzyBubDi3AaSlP1BmZn6UeySvvD0nMPPQ8bcrSE/
   i55oA7ir+loi4/bm789WWAZwx+Ls3fKFmpIbeRi2zEmfoRgOpgaoLrUVf
   Kc4Xry0pE7d2v7HZ2dzBi3NN2JrvwSfz+f7EhHo7+GYOyIL5py2Y6gFfG
   5/OoXKJYQ6ti84ycRJuznsEsn9Jnvguj/jsg4C7kXTqCrLR4XSx2AzAGM
   dAxvqTU42l7X8/bp0ANSmXMIpcC7cKMM5eN7XYOc9taWFEXxeVhB86KLu
   w==;
X-CSE-ConnectionGUID: 79RJPzgZTMKxhTswnW8wEw==
X-CSE-MsgGUID: gp+LkcMIRlC4kihCVW6EKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="73640457"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; 
   d="scan'208";a="73640457"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 07:31:21 -0800
X-CSE-ConnectionGUID: fNx4iWmQSIGDVz/roeT1Gw==
X-CSE-MsgGUID: juT+mXVkQxOVk50BPc/GXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; 
   d="scan'208";a="213774721"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 30 Jan 2026 07:31:18 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlqSp-00000000d5C-1HMn;
	Fri, 30 Jan 2026 15:31:15 +0000
Date: Fri, 30 Jan 2026 23:30:26 +0800
From: kernel test robot <lkp@intel.com>
To: Cheng Ming Lin <linchengming884@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, Richard Weinberger <richard@nod.at>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Martin Kurbanov <mmkurbanov@salutedevices.com>,
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Pratyush Yadav <pratyush@kernel.org>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: Re: [PATCH v3 1/2] mtd: spi-nand: Add support for randomizer
Message-ID: <202601302310.y3KX2o43-lkp@intel.com>
References: <20260130092349.621034-2-linchengming884@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260130092349.621034-2-linchengming884@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_073121_449721_7E4CA336 
X-CRM114-Status: GOOD (  11.61  )
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

kernel test robot noticed the following build errors:

[auto build test ERROR on v6.19-rc7]
[also build test ERROR on linus/master next-20260129]
[cannot apply to mtd/nand/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cheng-Ming-Lin/mtd-spi-nand-Add-support-for-randomizer/20260130-173004
base:   v6.19-rc7
patch link:    https://lore.kernel.org/r/20260130092349.621034-2-linchengming884%40gmail.com
patch subject: [PATCH v3 1/2] mtd: spi-nand: Add support for randomizer
config: i386-buildonly-randconfig-004-20260130 (https://download.01.org/0day-ci/archive/20260130/202601302310.y3KX2o43-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260130/202601302310.y3KX2o43-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601302310.y3KX2o43-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mtd/nand/spi/core.c: In function 'spinand_randomizer_init':
>> drivers/mtd/nand/spi/core.c:1234:32: error: 'return' with a value, in function returning void [-Wreturn-mismatch]
    1234 |                         return ret;
         |                                ^~~
   drivers/mtd/nand/spi/core.c:1227:13: note: declared here
    1227 | static void spinand_randomizer_init(struct spinand_device *spinand)
         |             ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/spi/core.c:1237:16: error: 'return' with a value, in function returning void [-Wreturn-mismatch]
    1237 |         return 0;
         |                ^
   drivers/mtd/nand/spi/core.c:1227:13: note: declared here
    1227 | static void spinand_randomizer_init(struct spinand_device *spinand)
         |             ^~~~~~~~~~~~~~~~~~~~~~~


vim +/return +1234 drivers/mtd/nand/spi/core.c

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
