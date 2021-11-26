Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16D5CC433FE
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Nov 2021 21:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dzCe8LYDDeKb74Wtg06ckYG1hFVq6HFyKAeQzjBZ88A=; b=oFUdoQTPbt54Uw
	/Fc9S1tLGTf06ACtNVLiW+KftX7oJF1Z+QcqLTVXiPETO9bIyBnTw5FwCgJwBZNEjtJd6LLbd+/XR
	vgOP+duEHWh41ZQZKNv5hYegXlsnVOJ21rIx9aO2bpDfXmEL2YvuiXOYtp+Na0O4yG9ZQWXqYHn5i
	uOAuTvBgNH6lXw1pyGIaDBK/fLB8e5NV6FiwM0utriFm6EGOrr4OleDZx5qpu6Q8quFIWHYyuPYut
	u4zyW/mzBZEqytm49dwYBfgALhi8vjAUHEPhFxY9g7j8dVFrufUOj0r9tKTNmt8r74b6RG+uR36Ss
	w67d2DxUOMerjYKbuwJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqia5-00Bny3-Bf; Fri, 26 Nov 2021 21:16:29 +0000
Received: from mga12.intel.com ([192.55.52.136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqia2-00Bnwb-E9
 for linux-mtd@lists.infradead.org; Fri, 26 Nov 2021 21:16:28 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10180"; a="215742110"
X-IronPort-AV: E=Sophos;i="5.87,266,1631602800"; d="scan'208";a="215742110"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2021 13:16:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,266,1631602800"; d="scan'208";a="498561992"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
 by orsmga007.jf.intel.com with ESMTP; 26 Nov 2021 13:16:17 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mqiZs-0008cJ-82; Fri, 26 Nov 2021 21:16:16 +0000
Date: Sat, 27 Nov 2021 05:15:59 +0800
From: kernel test robot <lkp@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org
Cc: kbuild-all@lists.01.org, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-spi@vger.kernel.org
Subject: Re: [PATCH v2 20/20] spi: mxic: Add support for pipelined ECC
 operations
Message-ID: <202111270526.T8x5Nyq1-lkp@intel.com>
References: <20211126113924.310459-21-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211126113924.310459-21-miquel.raynal@bootlin.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_131626_522658_3C07F3E9 
X-CRM114-Status: GOOD (  14.09  )
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

Hi Miquel,

I love your patch! Perhaps something to improve:

[auto build test WARNING on mtd/nand/next]
[also build test WARNING on broonie-spi/for-next mtd/mtd/next mtd/mtd/fixes v5.16-rc2 next-20211126]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Miquel-Raynal/External-ECC-engines-Macronix-support/20211126-195956
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next
config: xtensa-buildonly-randconfig-r006-20211125 (https://download.01.org/0day-ci/archive/20211127/202111270526.T8x5Nyq1-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/0804d6ccdf15e7a65743d048d01d876a54070b6b
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Miquel-Raynal/External-ECC-engines-Macronix-support/20211126-195956
        git checkout 0804d6ccdf15e7a65743d048d01d876a54070b6b
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=xtensa SHELL=/bin/bash drivers/spi/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/spi/spi-mxic.c:16:
>> include/linux/mtd/nand-ecc-mxic.h:34:1: warning: no previous prototype for 'mxic_ecc_get_pipelined_engine' [-Wmissing-prototypes]
      34 | mxic_ecc_get_pipelined_engine(struct platform_device *spi_pdev)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/mtd/nand-ecc-mxic.h:39:6: warning: no previous prototype for 'mxic_ecc_put_pipelined_engine' [-Wmissing-prototypes]
      39 | void mxic_ecc_put_pipelined_engine(struct nand_ecc_engine *eng) {}
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/mxic_ecc_get_pipelined_engine +34 include/linux/mtd/nand-ecc-mxic.h

a19f28121341b52 Miquel Raynal 2021-11-26  32  
a19f28121341b52 Miquel Raynal 2021-11-26  33  struct nand_ecc_engine *
a19f28121341b52 Miquel Raynal 2021-11-26 @34  mxic_ecc_get_pipelined_engine(struct platform_device *spi_pdev)
a19f28121341b52 Miquel Raynal 2021-11-26  35  {
a19f28121341b52 Miquel Raynal 2021-11-26  36  	return ERR_PTR(-EOPNOTSUPP);
a19f28121341b52 Miquel Raynal 2021-11-26  37  }
a19f28121341b52 Miquel Raynal 2021-11-26  38  
a19f28121341b52 Miquel Raynal 2021-11-26 @39  void mxic_ecc_put_pipelined_engine(struct nand_ecc_engine *eng) {}
a19f28121341b52 Miquel Raynal 2021-11-26  40  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
