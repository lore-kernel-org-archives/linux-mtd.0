Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B32CBE6BF30
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Jan 2026 17:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T3JgZC8I2d8Ie95Y1tYFYtIL4laPPcCZqTPo3u/TcXI=; b=qq4DaKx07H9HSd
	khE1MZCpz3CY9NCqIk9UQD/goYGlj27FKRBQyUHCdTIReYl8sATCUP9SyVAHNnurGAM+tZ4xpr2PI
	S5T5Zkv8barZp7z7Y7axH7qMEl38Ef8DO7N9dKOf/3r7uRZ0jeg9r4HMBnXexHXyRN6woJC5la1dS
	oFrQ3XCY7ukQ1l1cuA3DTeeyb49eFzqOjaJfQOhVGElOKQOoOsOaMP2AB3ehU4/Axc4d02VQiUu3l
	bQ2T5PQowUi1nYaC2T12DY71RTDhnwNgLX28DxFIlCFhBGAgw3Whupt0YpTqAlT64nJlrfzn6BZfR
	y5mVYw6xhEpBfjQIGuzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlsEO-00000001lCp-1ejT;
	Fri, 30 Jan 2026 17:24:28 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlsEL-00000001lCT-3BZB
	for linux-mtd@lists.infradead.org;
	Fri, 30 Jan 2026 17:24:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769793865; x=1801329865;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=e6hmICO2VlcP+zkBJoaMKam9Q9hrVAfIz9xCLVD1C1M=;
  b=Eu+xUyJkcxPKBIZXQtgbsURbi6y9lKqszkQdE2kuO++Xi1+FOkyj2iMQ
   xyjK4NL4N/uhLW8/suUQnKFrL471+Yax6rMh+tyynq2X7gtcPCpxb1DK1
   YxfbanfTl7EdC4OQLUl9px4i9kg2rRySH5qM8t6XpYkr9Sp+b92CcVxi4
   ErIUKjUpWS6scovNnyabGLwmKiGRdLh5Jcp+g22Bjm55yolLpRAJYtPq4
   UGTp3apYKq0cGJsGliSdMlHxyaSxUad7s9BtCfekmOis+uSihxFSgExpK
   4FBLyE386F9kG+BPtLeCAfQlBP6gDiMj3j0jgu/BYE7KEl4k8b00pUYve
   Q==;
X-CSE-ConnectionGUID: Dy4Vq9OASMagkw/v0B+Lhw==
X-CSE-MsgGUID: QqnczSwdSTeC5mROlOpZcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="71104143"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; 
   d="scan'208";a="71104143"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 09:24:25 -0800
X-CSE-ConnectionGUID: OKw7QJFyS6SqqgVK4Ipw5g==
X-CSE-MsgGUID: LWZcdTZ9ST2Kx7Dxw9RveA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 30 Jan 2026 09:24:22 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlsEF-00000000dBI-3cmj;
	Fri, 30 Jan 2026 17:24:19 +0000
Date: Sat, 31 Jan 2026 01:24:14 +0800
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
Message-ID: <202601310149.HWa5PpbD-lkp@intel.com>
References: <20260130092349.621034-2-linchengming884@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260130092349.621034-2-linchengming884@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_092425_865175_6A43A974 
X-CRM114-Status: GOOD (  11.95  )
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
config: sh-randconfig-001-20260130 (https://download.01.org/0day-ci/archive/20260131/202601310149.HWa5PpbD-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260131/202601310149.HWa5PpbD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601310149.HWa5PpbD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/mtd/nand/spi/core.c: In function 'spinand_randomizer_init':
>> drivers/mtd/nand/spi/core.c:1234:11: warning: 'return' with a value, in function returning void [-Wreturn-type]
    1234 |    return ret;
         |           ^~~
   drivers/mtd/nand/spi/core.c:1227:13: note: declared here
    1227 | static void spinand_randomizer_init(struct spinand_device *spinand)
         |             ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/spi/core.c:1237:9: warning: 'return' with a value, in function returning void [-Wreturn-type]
    1237 |  return 0;
         |         ^
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
