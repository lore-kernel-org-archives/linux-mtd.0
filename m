Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9560DC2BD09
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Jul 2024 16:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rwxk4MRXtEhBBWXJ40AmkfiQHNrbAbaVD0EJ/F/wfEo=; b=2SqfBY9CguVdAm
	dCPt3+7y6xW4AJOn2kTE8XSkpSJ3FK6Ioir5fHP44p6cay5Mz9Xuhnmdl6lOWbYLZ1Rt7SFFRo9kg
	90fMctJLQGuj8U25znhqronO+df+YkTUh3vgQfDjRsZFbhU83JKjKkjB6uYWZvaZ+UvJdIQ9P45Ng
	GS9jKL6Ywhea93LwIVZr6QXPyZ13EU6ichkd6NHDAQBqAl04uKZoLYfZaJtB6NFTTcRvRnX27jJOB
	+YtbXa8Fwvs9CsZBdTlc6GE0TooP0A7dL3Tph1GEH7F9NLhiZROqR3+B6qaO/Oe1+okQEV4LBWDxT
	TZg//nctfSDVzbmD5DRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSIlL-00000000cIG-3dDV;
	Fri, 12 Jul 2024 16:04:47 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSIlH-00000000cFu-3xK6;
	Fri, 12 Jul 2024 16:04:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720800284; x=1752336284;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PrS7/hiydmmIrI/4eU8UQmnYT4Fs6FNxX99+1XPQp5g=;
  b=HQj2u4nkWCLecpQ4CwitUkkV4prMCEd4IVZQLjsNBZdUH+LdFWxreYeq
   d+pQaTOx3ottfe0ReDPrZ3MHafDt4jKM7t6CF90H9Hamre/4gYBIow2pd
   xCRArmec33La3fvEQ8JdGb/+pBUL67xpb9sftUveSfpTKiFtYDT8G3x2o
   5ECuojTutXaXCTYJ8+tqezvy2FI9RdE2bwxYqCU0o7IjnSqQT27r79XIe
   NjGm2Q9gl4iozpZmz0gD4XRviNLQ07Nu8vW+96pQ325VvBHgV3bYkWbax
   NkPHCSZk53VYjSlZTcOSputmwYhC6zrFNmjM+grbwWmOmzdxabhbZXVk9
   g==;
X-CSE-ConnectionGUID: Z0gtPnLSSqOOlB8YfWtTzA==
X-CSE-MsgGUID: ThmstuCkS0217qdKMUHyCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="29653989"
X-IronPort-AV: E=Sophos;i="6.09,203,1716274800"; 
   d="scan'208";a="29653989"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2024 09:04:36 -0700
X-CSE-ConnectionGUID: fTm1fZsjS9OPqAi2nNETVg==
X-CSE-MsgGUID: 2/xcHUf6T0ydbDSMfiqbAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,203,1716274800"; 
   d="scan'208";a="48838240"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 12 Jul 2024 09:04:32 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sSIl3-000awc-2n;
	Fri, 12 Jul 2024 16:04:29 +0000
Date: Sat, 13 Jul 2024 00:04:10 +0800
From: kernel test robot <lkp@intel.com>
To: Esben Haabendal <esben@geanix.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: oe-kbuild-all@lists.linux.dev, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
	linux-arm-kernel@lists.infradead.org,
	Esben Haabendal <esben@geanix.com>
Subject: Re: [PATCH v3 14/15] mtd: spi-nor: Drop deprecated mechanism for
 optional SFDP parsing
Message-ID: <202407122344.BP3r1VyN-lkp@intel.com>
References: <20240711-macronix-mx25l3205d-fixups-v3-14-99353461dd2d@geanix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240711-macronix-mx25l3205d-fixups-v3-14-99353461dd2d@geanix.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240712_090444_037084_31E146C2 
X-CRM114-Status: GOOD (  11.10  )
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

Hi Esben,

kernel test robot noticed the following build errors:

[auto build test ERROR on a38297e3fb012ddfa7ce0321a7e5a8daeb1872b6]

url:    https://github.com/intel-lab-lkp/linux/commits/Esben-Haabendal/mtd-spi-nor-core-add-flag-for-doing-optional-SFDP-parsing/20240711-224454
base:   a38297e3fb012ddfa7ce0321a7e5a8daeb1872b6
patch link:    https://lore.kernel.org/r/20240711-macronix-mx25l3205d-fixups-v3-14-99353461dd2d%40geanix.com
patch subject: [PATCH v3 14/15] mtd: spi-nor: Drop deprecated mechanism for optional SFDP parsing
config: arm-randconfig-003-20240712 (https://download.01.org/0day-ci/archive/20240712/202407122344.BP3r1VyN-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240712/202407122344.BP3r1VyN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407122344.BP3r1VyN-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/mtd/spi-nor/atmel.c:9:
   drivers/mtd/spi-nor/core.h: In function 'spi_nor_try_sfdp':
>> drivers/mtd/spi-nor/core.h:722:61: error: expected ';' before '}' token
     722 |         return (nor->info->no_sfdp_flags & SPI_NOR_TRY_SFDP)
         |                                                             ^
         |                                                             ;
     723 | }
         | ~                                                            


vim +722 drivers/mtd/spi-nor/core.h

   712	
   713	/**
   714	 * spi_nor_try_sfdp() - returns true if optional SFDP parsing should be tried
   715	 * for this flash, with fallback to static parameters and settings based on
   716	 * flash ID if SFDP parsing fails.
   717	 *
   718	 * Return: true if optional SFDP parsing should be tried
   719	 */
   720	static inline bool spi_nor_try_sfdp(const struct spi_nor *nor)
   721	{
 > 722		return (nor->info->no_sfdp_flags & SPI_NOR_TRY_SFDP)
   723	}
   724	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
