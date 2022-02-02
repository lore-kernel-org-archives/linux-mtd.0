Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AE17C433F5
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Feb 2022 20:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tug9JyGmWC41AB5GB3sbzyumlixNn+BwdnXIB9lfjeg=; b=KMs6KhU8wG0K4X
	PIe6oUA6n/6bKSMwvufVkx519ua09jIYCqu5Q6n+REvHFKNCo+A6Tzr5hBS/SwMgHkQKuIY3Kne6K
	lLQ8tvyYWppFrXzBPluZxxskAQqgCtyonSyPxi5l1JUplqD2FMEv/p4HohdCOBLp/BcbWZFCgxuuR
	tQdRfkmlXaHSF2IZSfx+MkmDJ4loVOM1b0bs7QUqzbmrvgC4sFcWu7k0c14tZFnpDO/3yG4pEdWqH
	TIjZdM24nujfmPWpF1grycmcduBNzC/hrMOUHXDB/QKQUVsEYxGsNvrPDWBHRfr1QU0xDenIaDMRo
	UpATGICCgvxQD1Mi67Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFLup-00Glnn-U7; Wed, 02 Feb 2022 20:07:43 +0000
Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFLue-00Glmv-3j
 for linux-mtd@lists.infradead.org; Wed, 02 Feb 2022 20:07:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643832452; x=1675368452;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=OKoapjEKq1E7eFux5LUXJp/W1HMiW7UHxnLJfV3whXI=;
 b=UTaT4JEG68QO4sbuqgk4OKTbtAEpdvH4NbWoaxKmwCU5z4F6zb1ZO21o
 +hc3K6BoR9ZabmTCz4DcSOGiQ1Tb/rn9Zm51MjwYnS4epuUho+bhD1QcC
 aesp9Lijts3/0FgkCk5OgZGSaQgYiEQizqng5l49bBYBzJ80lmUjrR8uy
 MeYSEzbgHFoLG797Rf6nEI/St5dj7YwgCSB+rMPDJ9s25AMy2q7/frOOl
 RC8n9T62Rk9nGrohgF38EA7/r2/xAdGEIv6vkXzmNJbkzJxCeNSTeXhF/
 ntKF0Up0sAbxf8SDNxRwCHaCfzQFRLjj7ShLa0Ia0njDJNhU47OPHJQuD w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10246"; a="247963577"
X-IronPort-AV: E=Sophos;i="5.88,337,1635231600"; d="scan'208";a="247963577"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2022 12:07:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,337,1635231600"; d="scan'208";a="771555789"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by fmsmga005.fm.intel.com with ESMTP; 02 Feb 2022 12:07:23 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nFLuU-000V43-LN; Wed, 02 Feb 2022 20:07:22 +0000
Date: Thu, 3 Feb 2022 04:07:18 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Michael Walle <michael@walle.cc>
Subject: Re: [PATCH v1 12/14] mtd: spi-nor: move all spansion specifics into
 spansion.c
Message-ID: <202202030449.IQfj2Y5O-lkp@intel.com>
References: <20220202145853.4187726-13-michael@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220202145853.4187726-13-michael@walle.cc>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220202_120732_238080_D613527B 
X-CRM114-Status: GOOD (  15.85  )
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

Hi Michael,

I love your patch! Perhaps something to improve:

[auto build test WARNING on mtd/spi-nor/next]
[also build test WARNING on linux/master linus/master v5.17-rc2 next-20220202]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Michael-Walle/mtd-spi-nor-move-vendor-specific-code-into-vendor-modules/20220202-230139
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git spi-nor/next
config: x86_64-randconfig-a001 (https://download.01.org/0day-ci/archive/20220203/202202030449.IQfj2Y5O-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 6b1e844b69f15bb7dffaf9365cd2b355d2eb7579)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/01f9808a20c96553c43f929e10f3fb448cd8bd93
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Michael-Walle/mtd-spi-nor-move-vendor-specific-code-into-vendor-modules/20220202-230139
        git checkout 01f9808a20c96553c43f929e10f3fb448cd8bd93
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/mtd/spi-nor/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/mtd/spi-nor/spansion.c:332:5: warning: no previous prototype for function 'spi_nor_sr_ready_and_clear' [-Wmissing-prototypes]
   int spi_nor_sr_ready_and_clear(struct spi_nor *nor)
       ^
   drivers/mtd/spi-nor/spansion.c:332:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int spi_nor_sr_ready_and_clear(struct spi_nor *nor)
   ^
   static 
   1 warning generated.


vim +/spi_nor_sr_ready_and_clear +332 drivers/mtd/spi-nor/spansion.c

   324	
   325	/**
   326	 * spi_nor_sr_ready_and_clear() - Query the Status Register to see if the flash
   327	 * is ready for new commands and clear it.
   328	 * @nor:	pointer to 'struct spi_nor'.
   329	 *
   330	 * Return: 1 if ready, 0 if not ready, -errno on errors.
   331	 */
 > 332	int spi_nor_sr_ready_and_clear(struct spi_nor *nor)
   333	{
   334		int ret;
   335	
   336		ret = spi_nor_read_sr(nor, nor->bouncebuf);
   337		if (ret)
   338			return ret;
   339	
   340		if (nor->bouncebuf[0] & (SR_E_ERR | SR_P_ERR)) {
   341			if (nor->bouncebuf[0] & SR_E_ERR)
   342				dev_err(nor->dev, "Erase Error occurred\n");
   343			else
   344				dev_err(nor->dev, "Programming Error occurred\n");
   345	
   346			spi_nor_clear_sr(nor);
   347	
   348			/*
   349			 * WEL bit remains set to one when an erase or page program
   350			 * error occurs. Issue a Write Disable command to protect
   351			 * against inadvertent writes that can possibly corrupt the
   352			 * contents of the memory.
   353			 */
   354			ret = spi_nor_write_disable(nor);
   355			if (ret)
   356				return ret;
   357	
   358			return -EIO;
   359		}
   360	
   361		return !(nor->bouncebuf[0] & SR_WIP);
   362	}
   363	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
