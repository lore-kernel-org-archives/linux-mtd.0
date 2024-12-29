Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B71AE7718B
	for <linux-mtd@archiver.kernel.org>; Sun, 29 Dec 2024 05:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0L7xz4YqBdnQRYv87ejPQ9o4VovRU3O0acTE99DIPR0=; b=zZilTO/pncjfAw
	LKDo8o/4CoAQl3M5vljoNyfLuZm8QXTWTLBDXGjMoOncdGANfvqvBXqBkSLEzbb7kKpN/rFUvkX0d
	bxK0FyEUQcyjpo3MpbiiVI1JiUlxAvQ89o/W8YauDjfk2/UMg7SLAM5urNOklDv3G49Z434vh0RLT
	DjOGM4qk6XUlCmriNRt8QaHz+lMWRLxl/9NOjNslQin2pRM9sQ18l+EWwjYEfNHh9ORSR6DecBWAR
	gozIJ4+LCGBRr/dTtNMzS4un3kcOpgwPYGWnkdv0ZAmfldCkx0eND1tITFf75ePpB7q5Z4kllMtXE
	YO1a3UhAZH75OdXGEncw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRm2B-00000002u2i-18OP;
	Sun, 29 Dec 2024 05:40:15 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRm0x-00000002tuO-3S47;
	Sun, 29 Dec 2024 05:39:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735450740; x=1766986740;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2ZAfvEapeqlQxdPGabGekF/vOEsQwkH6pIqCbZL1qVs=;
  b=mUvnwlaggRfTc95W7yKFLzQKxE29GER6KpWL/ILbstVU2AtuA6OQqQ+L
   3tL0LCjdELjIbc01ZI/hQ8Cr1orwrbqnI70lcvRPxENagndH+A7RrLg3X
   +UP3CHsbnE7TGKZP/LL5MRAy9S8xdXEJXDcZjL2iuMKgURQPzSuokeZvp
   vCyK5NjbonL4VtPosKYjiilbO7lUbAHsprAb2Tto8SWDkT6OX2tZfDHG3
   MlcVxEJ6yrFiTaxRCGV+9QUEs2KgfTu2yLDV0rZy0OyoIWxY5WiQHPdt1
   ahOcXLSluFpupl3sIohLge6codWv5/zyHi402S6woQRU92VKDyn6ka//Q
   Q==;
X-CSE-ConnectionGUID: 6stngB92Q6i/88r8U4IUtQ==
X-CSE-MsgGUID: Zig//sx7TLC0pG/9V+q4EA==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="39714090"
X-IronPort-AV: E=Sophos;i="6.12,273,1728975600"; 
   d="scan'208";a="39714090"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2024 21:38:57 -0800
X-CSE-ConnectionGUID: 3s/MFmMNTKGc/r/0Xdc6Eg==
X-CSE-MsgGUID: pWJT/xodQjqlIGcz6VIFSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,273,1728975600"; 
   d="scan'208";a="100868774"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 28 Dec 2024 21:38:51 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRm0m-0004V6-2X;
	Sun, 29 Dec 2024 05:38:48 +0000
Date: Sun, 29 Dec 2024 13:38:40 +0800
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
Subject: Re: [PATCH 2/6] mmc: sdhci-st: Switch from CONFIG_PM_SLEEP guards to
 pm_sleep_ptr()
Message-ID: <202412291320.lZkWz3Yv-lkp@intel.com>
References: <20241229-update_pm_macro-v1-2-c7d4c4856336@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241229-update_pm_macro-v1-2-c7d4c4856336@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241228_213859_881862_D071F659 
X-CRM114-Status: GOOD (  10.15  )
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

kernel test robot noticed the following build errors:

[auto build test ERROR on 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2]

url:    https://github.com/intel-lab-lkp/linux/commits/Raphael-Gallais-Pou/usb-dwc3-st-Switch-from-CONFIG_PM_SLEEP-guards-to-pm_sleep_ptr/20241229-073700
base:   8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
patch link:    https://lore.kernel.org/r/20241229-update_pm_macro-v1-2-c7d4c4856336%40gmail.com
patch subject: [PATCH 2/6] mmc: sdhci-st: Switch from CONFIG_PM_SLEEP guards to pm_sleep_ptr()
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20241229/202412291320.lZkWz3Yv-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241229/202412291320.lZkWz3Yv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412291320.lZkWz3Yv-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mmc/host/sdhci-st.c: In function 'sdhci_st_suspend':
>> drivers/mmc/host/sdhci-st.c:460:15: error: implicit declaration of function 'sdhci_suspend_host'; did you mean 'sdhci_add_host'? [-Wimplicit-function-declaration]
     460 |         ret = sdhci_suspend_host(host);
         |               ^~~~~~~~~~~~~~~~~~
         |               sdhci_add_host
   drivers/mmc/host/sdhci-st.c: In function 'sdhci_st_resume':
>> drivers/mmc/host/sdhci-st.c:494:16: error: implicit declaration of function 'sdhci_resume_host'; did you mean 'sdhci_remove_host'? [-Wimplicit-function-declaration]
     494 |         return sdhci_resume_host(host);
         |                ^~~~~~~~~~~~~~~~~
         |                sdhci_remove_host


vim +460 drivers/mmc/host/sdhci-st.c

f52d9c4f459bda Peter Griffin 2014-07-09  449  
f52d9c4f459bda Peter Griffin 2014-07-09  450  static int sdhci_st_suspend(struct device *dev)
f52d9c4f459bda Peter Griffin 2014-07-09  451  {
f52d9c4f459bda Peter Griffin 2014-07-09  452  	struct sdhci_host *host = dev_get_drvdata(dev);
f52d9c4f459bda Peter Griffin 2014-07-09  453  	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
1531675269c833 Jisheng Zhang 2016-02-16  454  	struct st_mmc_platform_data *pdata = sdhci_pltfm_priv(pltfm_host);
d38dcad4e7b48f Adrian Hunter 2017-03-20  455  	int ret;
d38dcad4e7b48f Adrian Hunter 2017-03-20  456  
d38dcad4e7b48f Adrian Hunter 2017-03-20  457  	if (host->tuning_mode != SDHCI_TUNING_MODE_3)
d38dcad4e7b48f Adrian Hunter 2017-03-20  458  		mmc_retune_needed(host->mmc);
f52d9c4f459bda Peter Griffin 2014-07-09  459  
d38dcad4e7b48f Adrian Hunter 2017-03-20 @460  	ret = sdhci_suspend_host(host);
f52d9c4f459bda Peter Griffin 2014-07-09  461  	if (ret)
f52d9c4f459bda Peter Griffin 2014-07-09  462  		goto out;
f52d9c4f459bda Peter Griffin 2014-07-09  463  
406c24310a7bd7 Peter Griffin 2015-04-10  464  	reset_control_assert(pdata->rstc);
406c24310a7bd7 Peter Griffin 2015-04-10  465  
3ae50f4512ce83 Lee Jones     2016-09-08  466  	clk_disable_unprepare(pdata->icnclk);
f52d9c4f459bda Peter Griffin 2014-07-09  467  	clk_disable_unprepare(pltfm_host->clk);
f52d9c4f459bda Peter Griffin 2014-07-09  468  out:
f52d9c4f459bda Peter Griffin 2014-07-09  469  	return ret;
f52d9c4f459bda Peter Griffin 2014-07-09  470  }
f52d9c4f459bda Peter Griffin 2014-07-09  471  
f52d9c4f459bda Peter Griffin 2014-07-09  472  static int sdhci_st_resume(struct device *dev)
f52d9c4f459bda Peter Griffin 2014-07-09  473  {
f52d9c4f459bda Peter Griffin 2014-07-09  474  	struct sdhci_host *host = dev_get_drvdata(dev);
f52d9c4f459bda Peter Griffin 2014-07-09  475  	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
1531675269c833 Jisheng Zhang 2016-02-16  476  	struct st_mmc_platform_data *pdata = sdhci_pltfm_priv(pltfm_host);
2053812f6e1af0 Peter Griffin 2015-04-10  477  	struct device_node *np = dev->of_node;
7f55eb101d4a75 Arvind Yadav  2017-06-20  478  	int ret;
f52d9c4f459bda Peter Griffin 2014-07-09  479  
7f55eb101d4a75 Arvind Yadav  2017-06-20  480  	ret = clk_prepare_enable(pltfm_host->clk);
7f55eb101d4a75 Arvind Yadav  2017-06-20  481  	if (ret)
7f55eb101d4a75 Arvind Yadav  2017-06-20  482  		return ret;
7f55eb101d4a75 Arvind Yadav  2017-06-20  483  
7f55eb101d4a75 Arvind Yadav  2017-06-20  484  	ret = clk_prepare_enable(pdata->icnclk);
7f55eb101d4a75 Arvind Yadav  2017-06-20  485  	if (ret) {
7f55eb101d4a75 Arvind Yadav  2017-06-20  486  		clk_disable_unprepare(pltfm_host->clk);
7f55eb101d4a75 Arvind Yadav  2017-06-20  487  		return ret;
7f55eb101d4a75 Arvind Yadav  2017-06-20  488  	}
f52d9c4f459bda Peter Griffin 2014-07-09  489  
406c24310a7bd7 Peter Griffin 2015-04-10  490  	reset_control_deassert(pdata->rstc);
406c24310a7bd7 Peter Griffin 2015-04-10  491  
2053812f6e1af0 Peter Griffin 2015-04-10  492  	st_mmcss_cconfig(np, host);
2053812f6e1af0 Peter Griffin 2015-04-10  493  
f52d9c4f459bda Peter Griffin 2014-07-09 @494  	return sdhci_resume_host(host);
f52d9c4f459bda Peter Griffin 2014-07-09  495  }
f52d9c4f459bda Peter Griffin 2014-07-09  496  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
