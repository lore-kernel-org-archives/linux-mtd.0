Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 233ABC3ABC3
	for <linux-mtd@archiver.kernel.org>; Fri,  9 May 2025 05:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t7EIuWGpCI/INlNSij9Wndw0887nmQ51Jr7xB/urhbA=; b=LaR4vS2VKs/pCI
	c8CyWur4GD4XPKaUmU6P486tTnKAYjRma4l2BZBpqFSDY6m+XHZErpqyZGMVCEHhmAW0DRohxV939
	1fcE6EeCGeF7KqDccQcYFQGq8tykSXKhOSYHfxsZWyH81AoiCfqXWbdvoscnq5Hd7Tl/T9CW9OCkU
	SxR/0H0WPD7lKRu32seonecBNdfKu2UZQIRNdmBQjZKKcR9/NH6T02kqHbQRz4qqo7XAcdyOZY1AC
	tu++cNZL3TxC+F3jjCSlhlcT9UUCTFsAqCrCxfyuxRbp0HFGFRDKLsT6QyuhrRz7Z9oC4MCDyUrQ4
	ecBL1SN8XVUyrM5zNPuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDGIe-00000002WEx-2lS6;
	Fri, 09 May 2025 05:29:32 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDGIc-00000002WEd-1HTj
	for linux-mtd@lists.infradead.org;
	Fri, 09 May 2025 05:29:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746768570; x=1778304570;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=L4UUaVG5X3LUiYHS/5N1PoJuNArLa1EF6Sqthuav9h4=;
  b=G0pNiRdRKaZP6sqxEWwi/t8CMSMXTigAAntkChfq+CI1KbA3XQUE/K57
   yrba45Fswt+nbRNgos/6SYW3qh1iY96rnAiZmP1Z+dQX03qssAo6qem7F
   NZmLiEKo6fVo9KUTCs01hVRdY1acygF3ZYxq738Lnu2iHck7KGvXnNfTh
   2EqesmyasUBOFRHgA8Z/QHp1uIbd4jXIXeMcvkgar/QUPrcmEhlCEjoxV
   b+o+kW5oaouHODJVgU+XkaXwj+DNf61B455wd5dJ7K2aV2vavLJPtC+hs
   g5rbyGTMK2CgUOsvJ6gBsmMCGHw2mudTnuOcrlDyffR0orbeWL5Yc1n9p
   A==;
X-CSE-ConnectionGUID: bhY+5wK/T/esR9bIGkSh4Q==
X-CSE-MsgGUID: HeqmUnOQRxmJbECx34vRaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="59985873"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="59985873"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 22:29:30 -0700
X-CSE-ConnectionGUID: jWPSW1eRRrS74AaaPw5jUw==
X-CSE-MsgGUID: K/jORPu1QKquHkt7pL4iTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="136472312"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 08 May 2025 22:29:28 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDGIX-000Bgd-1V;
	Fri, 09 May 2025 05:29:25 +0000
Date: Fri, 9 May 2025 13:28:38 +0800
From: kernel test robot <lkp@intel.com>
To: Bence =?iso-8859-1?B?Q3Pza+Fz?= <csokas.bence@prolan.hu>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	=?iso-8859-1?B?Q3Pza+FzLA==?= Bence <csokas.bence@prolan.hu>,
	Michael Walle <mwalle@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v2] mtd: Verify written data in paranoid mode
Message-ID: <202505091318.0QvCicb9-lkp@intel.com>
References: <20250508183733.514124-3-csokas.bence@prolan.hu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250508183733.514124-3-csokas.bence@prolan.hu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_222930_382408_0128469B 
X-CRM114-Status: GOOD (  12.23  )
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

Hi Bence,

kernel test robot noticed the following build warnings:

[auto build test WARNING on d76bb1ebb5587f66b0f8b8099bfbb44722bc08b3]

url:    https://github.com/intel-lab-lkp/linux/commits/Bence-Cs-k-s/mtd-Verify-written-data-in-paranoid-mode/20250509-024044
base:   d76bb1ebb5587f66b0f8b8099bfbb44722bc08b3
patch link:    https://lore.kernel.org/r/20250508183733.514124-3-csokas.bence%40prolan.hu
patch subject: [PATCH v2] mtd: Verify written data in paranoid mode
config: i386-buildonly-randconfig-002-20250509 (https://download.01.org/0day-ci/archive/20250509/202505091318.0QvCicb9-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250509/202505091318.0QvCicb9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505091318.0QvCicb9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mtd/mtdcore.c:1775:12: warning: '_mtd_verify' defined but not used [-Wunused-function]
    1775 | static int _mtd_verify(struct mtd_info *mtd, loff_t to, size_t len, const u8 *buf)
         |            ^~~~~~~~~~~


vim +/_mtd_verify +1775 drivers/mtd/mtdcore.c

  1774	
> 1775	static int _mtd_verify(struct mtd_info *mtd, loff_t to, size_t len, const u8 *buf)
  1776	{
  1777		struct device *dev = &mtd->dev;
  1778		u_char *verify_buf;
  1779		size_t r_retlen;
  1780		int ret;
  1781	
  1782		verify_buf = devm_kmalloc(dev, len, GFP_KERNEL);
  1783		if (!verify_buf)
  1784			return -ENOMEM;
  1785	
  1786		ret = mtd_read(mtd, to, len, &r_retlen, verify_buf);
  1787		if (ret < 0)
  1788			goto err;
  1789	
  1790		if (len != r_retlen) {
  1791			/* We shouldn't see short reads */
  1792			dev_err(dev, "Verify failed, written %zd but only read %zd",
  1793				len, r_retlen);
  1794			ret = -EIO;
  1795			goto err;
  1796		}
  1797	
  1798		if (memcmp(verify_buf, buf, len)) {
  1799			dev_err(dev, "Verify failed, compare mismatch!");
  1800			ret = -EIO;
  1801		}
  1802	
  1803	err:
  1804		devm_kfree(dev, verify_buf);
  1805		return ret;
  1806	}
  1807	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
