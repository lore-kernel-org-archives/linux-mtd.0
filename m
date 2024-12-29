Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5637E77188
	for <linux-mtd@archiver.kernel.org>; Sun, 29 Dec 2024 01:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yDx3+RQ1FmbkpXM6swMWkRkQ6rXLsBniSWw88A1JKdY=; b=m8TT9BMGG313OO
	B1iOlXIhWZxaqvfy5i3E+6IOokLlsMIopvr6prrO1DVNsj2JeBbJoxoxN1epikU+1fs4vp6x65LJs
	X7+YLQKao/ogtGRg7lnwzxTvOLXUxPc+LpE2vR9XevqLVbAsQVmYzPw1e64f2NrAtIbxbyf9oYqcQ
	SxxdpOSLVR9nfv9FXLK5rH1qP7tuojvgI52ZpNZSwpUUOzk0TpbsSQ4SZeqAOaxvHUIqbPgb0vWZZ
	nSRRzsA9gNP7S6lAVTcLxlwVgmkR+nl7j/XKveu/DTr7MXCZP/K51P+9nEDs5CJCDU33RcAJo6E9D
	cPJVCBtCXiVpTEXApPeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRi7x-00000002gSt-0npv;
	Sun, 29 Dec 2024 01:29:57 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRi6k-00000002gLC-0Ibc;
	Sun, 29 Dec 2024 01:28:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735435722; x=1766971722;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=I7rXsmUoa6ixHAofeE9KHj410C9nn2O2m/lr/aX7Ty4=;
  b=nQDmietHSNdt3mDa69nKp/PTpwPG6IzM+bRxX9TCstH1XtdY5t6H5YiO
   ILM1z08L9sPSqC1L1sJ2OImwB49v1WBufCc5D3H7srqe6dz5iO+I9ebc5
   mIoR1vmbjePD58dV6rwwjA0M0Ea3i+LrTng3z5aAXOx0/erv166nVlfta
   kxmHaSCTNLNXcnSpQVG+R73gThMN6oBeOidotZrOHf/vUfXszElgCnJuv
   t1nRpJqq2f3sEFsILuDFRBV5mB9kG8x3zEXiHO7Oq+/eiC0XZnXvwtxpc
   1mhnv9tU6J9oBETDEOFWnD3Jn818AKvf6qJwwbVmel+z2yH+6uaA5KaT+
   g==;
X-CSE-ConnectionGUID: U7nDPC3+StSrzajHzVOvmw==
X-CSE-MsgGUID: LPdB5rDiTDGaOaRjd7aqMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="58237971"
X-IronPort-AV: E=Sophos;i="6.12,273,1728975600"; 
   d="scan'208";a="58237971"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2024 17:28:35 -0800
X-CSE-ConnectionGUID: UtSp2+6xTi6Ye3XqQpKEYQ==
X-CSE-MsgGUID: VJly6oYLR4iFsqiALXM9fA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,273,1728975600"; 
   d="scan'208";a="100840450"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 28 Dec 2024 17:28:29 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRi6V-0004Pw-0a;
	Sun, 29 Dec 2024 01:28:27 +0000
Date: Sun, 29 Dec 2024 09:28:17 +0800
From: kernel test robot <lkp@intel.com>
To: Raphael Gallais-Pou <rgallaispou@gmail.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-ide@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com, linux-spi@vger.kernel.org
Subject: Re: [PATCH 6/6] spi: st: Switch from CONFIG_PM_SLEEP guards to
 pm_sleep_ptr()
Message-ID: <202412290921.tY3nJMjm-lkp@intel.com>
References: <20241229-update_pm_macro-v1-6-c7d4c4856336@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241229-update_pm_macro-v1-6-c7d4c4856336@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241228_172842_197580_FD09263A 
X-CRM114-Status: GOOD (  10.36  )
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

Hi Raphael,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2]

url:    https://github.com/intel-lab-lkp/linux/commits/Raphael-Gallais-Pou/usb-dwc3-st-Switch-from-CONFIG_PM_SLEEP-guards-to-pm_sleep_ptr/20241229-073700
base:   8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
patch link:    https://lore.kernel.org/r/20241229-update_pm_macro-v1-6-c7d4c4856336%40gmail.com
patch subject: [PATCH 6/6] spi: st: Switch from CONFIG_PM_SLEEP guards to pm_sleep_ptr()
config: arm-randconfig-002-20241229 (https://download.01.org/0day-ci/archive/20241229/202412290921.tY3nJMjm-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241229/202412290921.tY3nJMjm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412290921.tY3nJMjm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/spi/spi-st-ssc4.c:418:12: warning: 'spi_st_resume' defined but not used [-Wunused-function]
     418 | static int spi_st_resume(struct device *dev)
         |            ^~~~~~~~~~~~~
>> drivers/spi/spi-st-ssc4.c:406:12: warning: 'spi_st_suspend' defined but not used [-Wunused-function]
     406 | static int spi_st_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~


vim +/spi_st_resume +418 drivers/spi/spi-st-ssc4.c

9e862375c5420a Lee Jones      2014-12-09  405  
9e862375c5420a Lee Jones      2014-12-09 @406  static int spi_st_suspend(struct device *dev)
9e862375c5420a Lee Jones      2014-12-09  407  {
e6b7e64cb11966 Yang Yingliang 2023-11-28  408  	struct spi_controller *host = dev_get_drvdata(dev);
9e862375c5420a Lee Jones      2014-12-09  409  	int ret;
9e862375c5420a Lee Jones      2014-12-09  410  
e6b7e64cb11966 Yang Yingliang 2023-11-28  411  	ret = spi_controller_suspend(host);
9e862375c5420a Lee Jones      2014-12-09  412  	if (ret)
9e862375c5420a Lee Jones      2014-12-09  413  		return ret;
9e862375c5420a Lee Jones      2014-12-09  414  
9e862375c5420a Lee Jones      2014-12-09  415  	return pm_runtime_force_suspend(dev);
9e862375c5420a Lee Jones      2014-12-09  416  }
9e862375c5420a Lee Jones      2014-12-09  417  
9e862375c5420a Lee Jones      2014-12-09 @418  static int spi_st_resume(struct device *dev)
9e862375c5420a Lee Jones      2014-12-09  419  {
e6b7e64cb11966 Yang Yingliang 2023-11-28  420  	struct spi_controller *host = dev_get_drvdata(dev);
9e862375c5420a Lee Jones      2014-12-09  421  	int ret;
9e862375c5420a Lee Jones      2014-12-09  422  
e6b7e64cb11966 Yang Yingliang 2023-11-28  423  	ret = spi_controller_resume(host);
9e862375c5420a Lee Jones      2014-12-09  424  	if (ret)
9e862375c5420a Lee Jones      2014-12-09  425  		return ret;
9e862375c5420a Lee Jones      2014-12-09  426  
9e862375c5420a Lee Jones      2014-12-09  427  	return pm_runtime_force_resume(dev);
9e862375c5420a Lee Jones      2014-12-09  428  }
9e862375c5420a Lee Jones      2014-12-09  429  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
