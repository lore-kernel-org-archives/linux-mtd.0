Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8FCBC433F5
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Feb 2022 18:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4jconZA52L/M5JAwcSl8TNr72fpkj2fkvlQLjkoW6/8=; b=qjbuqDDBPi9bwQ
	VkvntpGDeXTYwTQF/g5nTGGDnsvjJ8n/zna7wiOMRDqVAF+BWGZ8G8fDu+4zSZnhE10FJW9ex7G3y
	5NJv3bX6PUe1/TvvLRLw7KM3GICztvMwLlQLZmp0+pmyggqBSuRrCkDvO7Lu4jRH/EpW5vFUxkpFj
	nFnQqu1UnOHBgVafnpqCU6/PDV4DuW6xrxKKTMwIIIH4+H9m0L7lnuwy2DECdQ/sUT5bfyRwGl6Ni
	noMTYLsISSeoT8S3UZGieyE8Wzh2TAoajnXTO9IBnhYnmPUyPL2lUq1AH1aPOfcoXe//k/e0n3eaF
	vxlJi5T2C+/EU963tT6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFKA6-00GY0o-W9; Wed, 02 Feb 2022 18:15:23 +0000
Received: from mga12.intel.com ([192.55.52.136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFKA3-00GY0R-9c
 for linux-mtd@lists.infradead.org; Wed, 02 Feb 2022 18:15:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643825719; x=1675361719;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5L2IGhFElsUioIEHW2pw7wMqbxrTXBoGVWymIBIhZSQ=;
 b=Jh5qy+RVk4F8z00nNdNJHbWAfQ7nUPghLmyC4F1kAsbDV+uzyKQ5piMU
 3ckx/wSfHxtSdAh0lH/pREA7/gT+JSa3fHSCn/Mx234znJxasUwN1/gaw
 SCFUf/e1WFlQSTgDvp0QsMNTb7xNyEVktjqXEUV/ncRM4QZQIWXMv3JHl
 YhdkBy0ZYu3A2XV0DaPkM1Ex1gIZ11u9mZzUiSrKRT2CwGHUEWKP4RW8a
 Trw7BGYrqOccaa11/fsZnFN4HrQqkMbrTcegET/Hv6dKrS9HWkffr6c1p
 U5fAWBQ+LfNgBAHj0wCnihBX0pFGUNOBldbDL9fc/V1WJCZmHUiZi47wC Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10246"; a="227959393"
X-IronPort-AV: E=Sophos;i="5.88,337,1635231600"; d="scan'208";a="227959393"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2022 10:15:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,337,1635231600"; d="scan'208";a="676528121"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by fmsmga001.fm.intel.com with ESMTP; 02 Feb 2022 10:15:15 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nFK9z-000Uwe-A4; Wed, 02 Feb 2022 18:15:15 +0000
Date: Thu, 3 Feb 2022 02:15:12 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: kbuild-all@lists.01.org, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Michael Walle <michael@walle.cc>
Subject: Re: [PATCH v1 12/14] mtd: spi-nor: move all spansion specifics into
 spansion.c
Message-ID: <202202030228.8WUETAc8-lkp@intel.com>
References: <20220202145853.4187726-13-michael@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220202145853.4187726-13-michael@walle.cc>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220202_101519_426698_C7179E10 
X-CRM114-Status: GOOD (  15.93  )
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
config: alpha-allmodconfig (https://download.01.org/0day-ci/archive/20220203/202202030228.8WUETAc8-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/01f9808a20c96553c43f929e10f3fb448cd8bd93
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Michael-Walle/mtd-spi-nor-move-vendor-specific-code-into-vendor-modules/20220202-230139
        git checkout 01f9808a20c96553c43f929e10f3fb448cd8bd93
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=alpha SHELL=/bin/bash drivers/mtd/spi-nor/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/mtd/spi-nor/spansion.c:332:5: warning: no previous prototype for 'spi_nor_sr_ready_and_clear' [-Wmissing-prototypes]
     332 | int spi_nor_sr_ready_and_clear(struct spi_nor *nor)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~


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
