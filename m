Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C5E5C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Dec 2021 18:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zb8vcRu3H7Qplg9Z/hheeVwRENcpbnNBzxk3ArbzUBo=; b=2j7oiTjZ5kV8s4
	D0C+a8pkWhEPyM+4RNhT/aDztWf+3q0yz1UnWDRiqmO1/yD8saamFExKuARsm9DULWPqBhXvYE93n
	cyC4cftRJy+LS7gtbw0W1YhBtrnXXJX250gwiVbkKOEJWVuPsXsjQf7yAezqP6W/73xegNBGS2Lw9
	Bm5xaEc9OwGdKnMmN3hGM/100pzwrcRghRWBpcCsO64JsEWGMCDZq0IE4B44sy3nYjG7MSGsCDfuG
	jkHTxgN8wHrvCc12dSpsxFjCNXv+MrzGy2ooKeIWaYj2z0mZp5vJ/fOxLen7/GBfyxLyJijAlhh/p
	wCO/2LbtLrWlwB721HAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxvOc-0076Tf-Tv; Thu, 16 Dec 2021 18:22:26 +0000
Received: from mga04.intel.com ([192.55.52.120])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxvOa-0076SL-Dj
 for linux-mtd@lists.infradead.org; Thu, 16 Dec 2021 18:22:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639678944; x=1671214944;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=bWpZ4y9aJXzVUaCFf9SWhCRFb9c6jHouDwtiP8EaPgY=;
 b=jpdaYYbyqWGqqqyB26wjVfHt23xqsWEQ12gUM6B2T8kKqXaciZsswLqq
 fyDnGfSLeL6umtgXulSjo6N9JGvMHn80jiB7EMcod4yQaBWLvQ6c/j7Ib
 TRyuiynPnNq91PRpDFE3BkyJkLxTdjUNmcwZWGYC5bUNDeWFNpa10wA9E
 PqNlJpeXeCrsUv71xZBD0UUv3RbSzctCNyv4G68r3U4AY5jYZXSZoc6T1
 NAFA35+eOlxV0QIKl+a9N1ygo8OPPtd/+05q1IvXTWyHcebQChQ9rnI/T
 P1vKUIxWLOAjAs0Jr5APOXwSMQ1WqiuZNPeRUbnG333Eod9vjSh0P8nwD g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10200"; a="238305375"
X-IronPort-AV: E=Sophos;i="5.88,212,1635231600"; d="scan'208";a="238305375"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2021 10:22:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,212,1635231600"; d="scan'208";a="754225259"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
 by fmsmga006.fm.intel.com with ESMTP; 16 Dec 2021 10:22:17 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mxvOT-0003e5-5x; Thu, 16 Dec 2021 18:22:17 +0000
Date: Fri, 17 Dec 2021 02:21:32 +0800
From: kernel test robot <lkp@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v6 20/28] spi: spi-mem: Fill the spi-mem controller
 capabilities of all the drivers
Message-ID: <202112170259.JPoGT6na-lkp@intel.com>
References: <20211216111654.238086-21-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211216111654.238086-21-miquel.raynal@bootlin.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_102224_525720_FD6AE05B 
X-CRM114-Status: GOOD (  12.91  )
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

I love your patch! Yet something to improve:

[auto build test ERROR on broonie-spi/for-next]
[also build test ERROR on mtd/nand/next mtd/mtd/next mtd/mtd/fixes v5.16-rc5 next-20211215]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Miquel-Raynal/External-ECC-engines-Macronix-support/20211216-191821
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
config: hexagon-randconfig-r045-20211216 (https://download.01.org/0day-ci/archive/20211217/202112170259.JPoGT6na-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project dd245bab9fbb364faa1581e4f92ba3119a872fba)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/bf16b56f7a0cc5aa237129a6b8bd216dc2632c8b
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Miquel-Raynal/External-ECC-engines-Macronix-support/20211216-191821
        git checkout bf16b56f7a0cc5aa237129a6b8bd216dc2632c8b
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: duplicate symbol: spi_mem_no_caps
   >>> defined at core.c
   >>> mtd/nand/spi/core.o:(spi_mem_no_caps) in archive drivers/built-in.a
   >>> defined at gigadevice.c
   >>> mtd/nand/spi/gigadevice.o:(.rodata+0x35C) in archive drivers/built-in.a
--
>> ld.lld: error: duplicate symbol: spi_mem_no_caps
   >>> defined at core.c
   >>> mtd/nand/spi/core.o:(spi_mem_no_caps) in archive drivers/built-in.a
   >>> defined at macronix.c
   >>> mtd/nand/spi/macronix.o:(.rodata+0x83C) in archive drivers/built-in.a
--
>> ld.lld: error: duplicate symbol: spi_mem_no_caps
   >>> defined at core.c
   >>> mtd/nand/spi/core.o:(spi_mem_no_caps) in archive drivers/built-in.a
   >>> defined at sysfs.c
   >>> mtd/spi-nor/sysfs.o:(.rodata+0x14) in archive drivers/built-in.a
--
>> ld.lld: error: duplicate symbol: spi_mem_no_caps
   >>> defined at core.c
   >>> mtd/nand/spi/core.o:(spi_mem_no_caps) in archive drivers/built-in.a
   >>> defined at atmel.c
   >>> mtd/spi-nor/atmel.o:(.rodata+0x370) in archive drivers/built-in.a
--
>> ld.lld: error: duplicate symbol: spi_mem_no_caps
   >>> defined at core.c
   >>> mtd/nand/spi/core.o:(spi_mem_no_caps) in archive drivers/built-in.a
   >>> defined at catalyst.c
   >>> mtd/spi-nor/catalyst.o:(.rodata+0x178) in archive drivers/built-in.a
--
>> ld.lld: error: duplicate symbol: spi_mem_no_caps
   >>> defined at core.c
   >>> mtd/nand/spi/core.o:(spi_mem_no_caps) in archive drivers/built-in.a
   >>> defined at eon.c
   >>> mtd/spi-nor/eon.o:(.rodata+0x370) in archive drivers/built-in.a
--
>> ld.lld: error: duplicate symbol: spi_mem_no_caps
   >>> defined at core.c
   >>> mtd/nand/spi/core.o:(spi_mem_no_caps) in archive drivers/built-in.a
   >>> defined at esmt.c
   >>> mtd/spi-nor/esmt.o:(.rodata+0xE8) in archive drivers/built-in.a
--
>> ld.lld: error: duplicate symbol: spi_mem_no_caps
   >>> defined at core.c
   >>> mtd/nand/spi/core.o:(spi_mem_no_caps) in archive drivers/built-in.a
   >>> defined at everspin.c
   >>> mtd/spi-nor/everspin.o:(.rodata+0x130) in archive drivers/built-in.a
--
>> ld.lld: error: duplicate symbol: spi_mem_no_caps
   >>> defined at core.c
   >>> mtd/nand/spi/core.o:(spi_mem_no_caps) in archive drivers/built-in.a
   >>> defined at fujitsu.c
   >>> mtd/spi-nor/fujitsu.o:(.rodata+0x58) in archive drivers/built-in.a
--
>> ld.lld: error: duplicate symbol: spi_mem_no_caps
   >>> defined at core.c
   >>> mtd/nand/spi/core.o:(spi_mem_no_caps) in archive drivers/built-in.a
   >>> defined at gigadevice.c
   >>> mtd/spi-nor/gigadevice.o:(.rodata+0x250) in archive drivers/built-in.a
--
>> ld.lld: error: duplicate symbol: spi_mem_no_caps
   >>> defined at core.c
   >>> mtd/nand/spi/core.o:(spi_mem_no_caps) in archive drivers/built-in.a
   >>> defined at intel.c
   >>> mtd/spi-nor/intel.o:(.rodata+0xE8) in archive drivers/built-in.a
..

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
