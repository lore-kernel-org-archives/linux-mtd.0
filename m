Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F40E3C43334
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Jun 2022 19:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JjMOryuAVhvIDYG9NK9/J35YoifJtd57iD4H0Zo0kwM=; b=JHD02FoSnIsV0o
	LPq7ymK9tMgX9JE+vLYRJZ8SKEDVG9vMmel3dvXVEFQzEw35LAoC4HjJPxXliIgtANz6j5N1YyUVj
	hgGFJLWH8O+kEoq1w9bMDXn7o73dmOGXGtSekT+4OClBYple12B+AIxh6eB8dvT7FqxImQTbV9VOJ
	mLLeNfjHDqa+rlTO3S9eh6HY96eEyaA/7K0CB+6jhVuk03LksrDDdO2hIZN4epUeiAlPpY3AUlt6R
	9V8NCCx5H0f6WopiLZh1L6+kbU8TOmbZuhLxOC6i/ZqCIvcde0KCv3m2tr89B2RA39rKyGOxnz3IA
	dufPfXVHWqhKTAQ7Iv7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nz1KP-00EnLz-Pe; Wed, 08 Jun 2022 19:26:53 +0000
Received: from mga01.intel.com ([192.55.52.88])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nz1KM-00EnLL-DC
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2022 19:26:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654716410; x=1686252410;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Uy0NJ8HqhtZ8h5uZtYMnISXssK4l/TvtOa+ng9NUjPA=;
  b=HASSr/AICKEyboo4crTn07LmFyQWiIQSuYYaLWFBeFawym5D2XSX2Wk3
   wJiNyLSWGUmFD4Kr3wNk9IRL6l29P6OmG56p5l1uu3JN0tcwqxbGo84v1
   kcthwEVz6AgC/RuhOZoC0sJKOTcuDetJp+4Drd3Upx4d6MMABy6HPdc+J
   0b9G37PuihB/dgseGYeLJBMcH0cv7xkjrSQcig5U1XsHgmwMdurdlquIm
   uZDRx9ba7b62AwhRP8zsInD2a1TZXg8V7MKRQeRlqfy3fWQAUd4HeMxsU
   qvIuJr7BVfxRqyXWpt5Fv8/8bnV7usQIcQeBpNJ3JotIIXneNZ/oz3Xpz
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10372"; a="302375320"
X-IronPort-AV: E=Sophos;i="5.91,286,1647327600"; 
   d="scan'208";a="302375320"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2022 12:26:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,286,1647327600"; 
   d="scan'208";a="609807458"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 08 Jun 2022 12:26:45 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nz1KG-000EwD-MG;
	Wed, 08 Jun 2022 19:26:44 +0000
Date: Thu, 9 Jun 2022 03:26:04 +0800
From: kernel test robot <lkp@intel.com>
To: Tom Fitzhenry <tom@tom-fitzhenry.me.uk>,
	Tudor Ambarus <tudor.ambarus@microchip.com>,
	Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Tom Fitzhenry <tom@tom-fitzhenry.me.uk>,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: spi-nor: siliconkaiser: add support for sk25lp128
Message-ID: <202206090308.3aMXmhee-lkp@intel.com>
References: <20220603135933.143372-1-tom@tom-fitzhenry.me.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220603135933.143372-1-tom@tom-fitzhenry.me.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220608_122650_502218_058BAFC5 
X-CRM114-Status: GOOD (  14.72  )
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

Hi Tom,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on mtd/spi-nor/next]
[also build test WARNING on v5.19-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Tom-Fitzhenry/mtd-spi-nor-siliconkaiser-add-support-for-sk25lp128/20220605-163120
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git spi-nor/next
config: arm-randconfig-c002-20220607 (https://download.01.org/0day-ci/archive/20220609/202206090308.3aMXmhee-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project b92436efcb7813fc481b30f2593a4907568d917a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/9ee4927880d43f8611d371e7cc7d8854a927de66
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Tom-Fitzhenry/mtd-spi-nor-siliconkaiser-add-support-for-sk25lp128/20220605-163120
        git checkout 9ee4927880d43f8611d371e7cc7d8854a927de66
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/mtd/spi-nor/ drivers/nfc/nfcmrvl/ fs/quota/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/mtd/spi-nor/siliconkaiser.c:8:18: error: call to undeclared function 'SNOR_ID3'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     { "sk25lp128", SNOR_ID3(0x257018) },
                    ^
>> drivers/mtd/spi-nor/siliconkaiser.c:8:18: warning: suggest braces around initialization of subobject [-Wmissing-braces]
     { "sk25lp128", SNOR_ID3(0x257018) },
                    ^~~~~~~~~~~~~~~~~~
                    {                 }
   drivers/mtd/spi-nor/siliconkaiser.c:8:18: error: initializer element is not a compile-time constant
     { "sk25lp128", SNOR_ID3(0x257018) },
                    ^~~~~~~~~~~~~~~~~~
   1 warning and 2 errors generated.


vim +8 drivers/mtd/spi-nor/siliconkaiser.c

     6	
     7	static const struct flash_info siliconkaiser_nor_parts[] = {
   > 8	  { "sk25lp128", SNOR_ID3(0x257018) },
     9	};
    10	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
