Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A569C001DB
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Aug 2023 09:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h+YHYKotAwKxXRBCD2Bzaa7JuileyuRkoGEUsReJchQ=; b=FFtFwHzWHzRndh
	kIVP2uuziBoG7GgpAPfbm5FjLEAUBXgcxRgecs7Xyl/Gm4eNOF4+9dUmjL78B5ZbjTx3IJL+s9S1t
	S4Qlhc/w2SVZr7eJ3xbMWP98kB3BjHCOCxGF96z0iijla677s6ZteZVO1ZP9ZUc8Eq5T0MCR2My0W
	+Ka/Q1Z98olUW/IEMdKSIWOu1O1M/8Hp0bu6gJq40uGQsNSdt1KQuhIUtxSjdaTgi+wRvDAhGRqR9
	iM3qoZmu7G91fjwereN6OAjCZOadeHVLgat0vrzfF7euUZ77VjkewBqwYkZCiVF6h5ulyt9ZPThXU
	9i6K/gyIjVMY+1AxFbBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTIeE-0026EH-1V;
	Tue, 08 Aug 2023 09:05:02 +0000
Received: from mgamail.intel.com ([192.55.52.115])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTIeC-0026Dg-1B
	for linux-mtd@lists.infradead.org;
	Tue, 08 Aug 2023 09:05:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691485500; x=1723021500;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dRwKRnc0pAlIZ3Hy9o9z180pyWvTYpsms8EmAZLR4Bo=;
  b=Fbh7a71l8D0ovAInx64Bs/Q+Z+v3xROHpfdLAOqig6lcs0978Xlm5avu
   ZGrMnus4Fx19yCXT+DTmOn0goKDeA/ahuD50qTrsGGaeqTJXxOHezQMdD
   gx1FLJj63l2aFPgh6YUZhkiQTdvvNwK1zICJbTX2jTWUlwcwVVgReSeuS
   UPKBlUDmxQlEXNKwrKXNfJ0Z+HiYeIDPh7fk8tgnqHM5JP6HiXLtc5RHJ
   or+uIW6GIoSqHfK3d0KCvIcsxw0AMyA85f10Nl8f+1jjBgXIEWK7oGieZ
   xa7DkgDJnkDDDF4hxRq6pWU9WP4ElE7MMcfawK7pJ7FI/0jG67lCIgi0B
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="370757093"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; 
   d="scan'208";a="370757093"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2023 02:04:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="766300747"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; 
   d="scan'208";a="766300747"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 08 Aug 2023 02:04:54 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTIe5-0005FI-1h;
	Tue, 08 Aug 2023 09:04:53 +0000
Date: Tue, 8 Aug 2023 17:04:45 +0800
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
Subject: Re: [PATCH 02/41] mtd: spi-nor: remove Fujitsu MB85RS1MT support
Message-ID: <202308081613.cFbUU2bQ-lkp@intel.com>
References: <20230807-mtd-flash-info-db-rework-v1-2-3d3d5bef4ba4@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230807-mtd-flash-info-db-rework-v1-2-3d3d5bef4ba4@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_020500_433216_691F1240 
X-CRM114-Status: GOOD (  11.00  )
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
patch link:    https://lore.kernel.org/r/20230807-mtd-flash-info-db-rework-v1-2-3d3d5bef4ba4%40kernel.org
patch subject: [PATCH 02/41] mtd: spi-nor: remove Fujitsu MB85RS1MT support
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230808/202308081613.cFbUU2bQ-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230808/202308081613.cFbUU2bQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308081613.cFbUU2bQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[6]: *** No rule to make target 'drivers/mtd/spi-nor/fujitsu.o', needed by 'drivers/mtd/spi-nor/spi-nor.o'.
   make[6]: Target 'drivers/mtd/spi-nor/' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
