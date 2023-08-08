Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5110EC001B0
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Aug 2023 18:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v1dhRYdGP21k3x4YNDLwLI6XAulRFVi8nhGbrB0As2Y=; b=xC2EuSkfbh5XUa
	kFVGSxrCxcYv41knaHQOVF5yXkNiiXzVGM1J8Q85OLqUDdIOZEWLsVJRxyOciOi+NYIieSZ4vp116
	671jAGRPoyswx7OYoGGQhWQe6NFc6ErK+inFiwNABI5I3N9hBBXrGTwYN7VAoNOG4ZVbvl3b9iOB4
	0LmVi4dbCTLgsmvgDFfVMhusBP2BCycDKUiD8qERNgHTFcJCqChORfe6DvU8gg1Y80MJof3b509nP
	J6sm4pd86m5pmVfvUnphUEqq5y0zPtrKSprWLU7WoazPWY9iIpGCxa+2QYXvMOyOlTuvBLCRcBFT0
	NKb5o902FuB2xcQTXcJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTRY4-003Ea3-2t;
	Tue, 08 Aug 2023 18:35:16 +0000
Received: from mgamail.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTRY1-003EZQ-2L
	for linux-mtd@lists.infradead.org;
	Tue, 08 Aug 2023 18:35:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691519713; x=1723055713;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BuaT2/ImKU0LR1ovRnINUVS5qWtOBhmIP+p3v/iplT0=;
  b=Dn4mjCpy8XIjViWKESpVx/LCIKkWYAKxPFn/Hm8j4wnD90r2IeZ2KMdW
   hjmhB31GO9O9Nz9+R1IWB7q3iJ+vMsImdJ8TuIWoOMBWSpQtNFGtS2O6z
   3lmE+Mc8LkApfWDb3Y6Qclw12DpCjjxcemc6D7u1loTiiBIWq3gBneOZc
   Zn9MeJwR45q02YKZMy4uTjUTL3tnPphxcawOXi41ZN58rMwpve0/vOl6s
   EVnn9kXsLYoLeOO+wuRnA4Ma5k3brszIEhaa0ThNcI6MlyFxM5+Z6BqQI
   YKv+fPoQPwL0fJIktVXj/vQos1IPrX93Re90wPt7BERm7cGPWv2yC/TZ/
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="369815572"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; 
   d="scan'208";a="369815572"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2023 11:35:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="978016740"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; 
   d="scan'208";a="978016740"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 08 Aug 2023 11:35:08 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTRXv-0005XQ-0y;
	Tue, 08 Aug 2023 18:35:07 +0000
Date: Wed, 9 Aug 2023 02:34:12 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Walle <mwalle@kernel.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH 01/41] mtd: spi-nor: remove catalyst 'flashes'
Message-ID: <202308090236.poj47Yz8-lkp@intel.com>
References: <20230807-mtd-flash-info-db-rework-v1-1-3d3d5bef4ba4@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230807-mtd-flash-info-db-rework-v1-1-3d3d5bef4ba4@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_113513_782126_0DF191BF 
X-CRM114-Status: UNSURE (   9.69  )
X-CRM114-Notice: Please train this message.
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

kernel test robot noticed the following build errors:

[auto build test ERROR on f7dc24b3413851109c4047b22997bd0d95ed52a2]

url:    https://github.com/intel-lab-lkp/linux/commits/Michael-Walle/mtd-spi-nor-remove-catalyst-flashes/20230807-213321
base:   f7dc24b3413851109c4047b22997bd0d95ed52a2
patch link:    https://lore.kernel.org/r/20230807-mtd-flash-info-db-rework-v1-1-3d3d5bef4ba4%40kernel.org
patch subject: [PATCH 01/41] mtd: spi-nor: remove catalyst 'flashes'
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20230809/202308090236.poj47Yz8-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230809/202308090236.poj47Yz8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308090236.poj47Yz8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[6]: *** No rule to make target 'drivers/mtd/spi-nor/catalyst.o', needed by 'drivers/mtd/spi-nor/built-in.a'.
   make[6]: Target 'drivers/mtd/spi-nor/' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
