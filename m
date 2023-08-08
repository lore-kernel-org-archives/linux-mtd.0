Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D591DC001DB
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Aug 2023 07:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nxRmy4v9GM/e6NqvgVLlGaO7cEYInVcHOZVvyflkmA4=; b=hOhrNP/tmfTqIL
	lpIaD/cPac/p2LyOcESQJ4nVx5dwy1q0ImczbHEdU5I1d1h1FCSewj0/eESlW3Ds+QSplFvzaWG18
	wDVpcH4xwWqSD1gSC3o7lyfhOf3F17VgsgBEPU5R0kHc6hfJ9bs6ggsi8xCXg5eqUsrdbKLb0dMeY
	hE+jXjn7QHiZTSWn7mBwwynQzVRiC+9EmkL9lWVL8RT8/QpYLuId+BJkAyLFDh3ILopUlC04r940q
	bqtX6Sk4fVbW+pvYZqU48HUYdOJElvy3sg0koNBE89mRLxCWudEuzDnlg6KUr5+GCI7X6qcqCWXqz
	y1wIrxXULssoOBpqaUwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTH2e-001sR7-2U;
	Tue, 08 Aug 2023 07:22:08 +0000
Received: from mgamail.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTH2b-001sQV-2f
	for linux-mtd@lists.infradead.org;
	Tue, 08 Aug 2023 07:22:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691479325; x=1723015325;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SdSpbmHPdrm055MWG/kqx48iO85LrvM6GgzHFX9aRDc=;
  b=RXsxaAGvESKntvHcS9ehxhUIZCIFGK897jXjgevqAVwnQEURtFhO7sj9
   5D7Vqg74CToiC0lQ30YxmmrsKleUu7G9meZ+mhjxx05kuwX+YfeRkoX2q
   x/PhKZFPpXGN+tKORdoKVfSdBCPa61SERmD1HFQi9BUNuqoMaTkw9xc/r
   x7hWEfemU+dXefqgAOd/d5rK/1J56oIyyTTOty+9dkqSZn0uJzHeSMKOy
   1xONuTE3AApWFkusIZy5E4IYxPJ91jlmiQm5Wo6SikWzuQ9eaex1XjnYf
   6VnMUGzDx/3hdLNwtfQrn6mUqCL0MlzDSQVXR/qv0xBEWIZDUYJaPbkG+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="360834615"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; 
   d="scan'208";a="360834615"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2023 00:21:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="681140892"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; 
   d="scan'208";a="681140892"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 08 Aug 2023 00:21:51 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTH2M-0005CU-2H;
	Tue, 08 Aug 2023 07:21:50 +0000
Date: Tue, 8 Aug 2023 15:21:30 +0800
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
Message-ID: <202308081547.u3Nmtq1F-lkp@intel.com>
References: <20230807-mtd-flash-info-db-rework-v1-1-3d3d5bef4ba4@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230807-mtd-flash-info-db-rework-v1-1-3d3d5bef4ba4@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_002205_954097_C6D6FAA8 
X-CRM114-Status: GOOD (  11.37  )
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
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230808/202308081547.u3Nmtq1F-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230808/202308081547.u3Nmtq1F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308081547.u3Nmtq1F-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[6]: *** No rule to make target 'drivers/mtd/spi-nor/catalyst.o', needed by 'drivers/mtd/spi-nor/spi-nor.o'.
   make[6]: Target 'drivers/mtd/spi-nor/' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
