Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C95BBC433FE
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Dec 2021 18:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YApudAqwqZaQhQQjNyDHIFXQDly/21OPl5EKQrNf1nY=; b=Wqju8vH+17pJoS
	tvIG8ipBmHzAg3+a39hhXbaAw9sXyI1/TP7vJOS5X0/NNmnEA9kZm8lI0TdFsyYiwVFFR2cvEc+CD
	LfrIBzWO/ncBad5/87sh70ROvRcvfwBOwNY3vedfdr4YvZzXMYBWozkYddBjZNerPV5fU/CmZ/Yji
	C7LfqCYvzExwsyCJSnnWGik8EKSHQcKmSK8SA4uzNFtJ2/ACaZP+uxFPj2iEKYG4Jr0btCkkzdZ4e
	eu6rrnS6wcXVYg3mscFkxXm+Ush7NCdmpEugSKKJt0Ob0+v/TcmV34UsZSeFLyleYxjR/Fnf8AOSV
	a8FRu1Ut3FCLjw5K7GSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxv4J-0074Lx-Lv; Thu, 16 Dec 2021 18:01:27 +0000
Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxv4G-0074Ke-PB
 for linux-mtd@lists.infradead.org; Thu, 16 Dec 2021 18:01:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639677684; x=1671213684;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=X4+NkeufLzZHDZfb2hlozCR15SgBlRSKuslkW4zon5E=;
 b=jsQ0XNaqav1yYsXqiUsWfJnsOHMlgqGduLz29Q5/X/ZxtK8q35JNFzzw
 lkPah6KyHl5phMTb1JLClO2wc24m5CDygd6/CO0ijefnaXah+XIFN4WTI
 kUvurGbH5p0XsjnBjx0sXIgp4JGEEg4SJOsUur0l0v6v67rjyACcpaZ6z
 DlS9vfeUd9yqkLRTr8zQTCU3yBcO4uGHy1vMtBBuD93CZuntbO4ut0GIn
 kNQyeCKPjRXIyec0DoFeQ51jQPxHdKqoRT8FjfzeBJth6rXMtQk4TpK7o
 A3ztx5RtFlRchwMeJzrtoQ4f+2GIE5CYzffEuRtlPg+xLTXyIKAuzuNM7 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10199"; a="226843330"
X-IronPort-AV: E=Sophos;i="5.88,211,1635231600"; d="scan'208";a="226843330"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2021 10:01:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,211,1635231600"; d="scan'208";a="662534378"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
 by fmsmga001.fm.intel.com with ESMTP; 16 Dec 2021 10:01:20 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mxv46-0003Zz-G3; Thu, 16 Dec 2021 18:01:14 +0000
Date: Fri, 17 Dec 2021 02:00:45 +0800
From: kernel test robot <lkp@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org
Cc: kbuild-all@lists.01.org
Subject: Re: [PATCH v6 20/28] spi: spi-mem: Fill the spi-mem controller
 capabilities of all the drivers
Message-ID: <202112170120.4tAlxDnn-lkp@intel.com>
References: <20211216111654.238086-21-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211216111654.238086-21-miquel.raynal@bootlin.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_100124_911325_781B4B89 
X-CRM114-Status: GOOD (  14.41  )
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
config: arm-buildonly-randconfig-r006-20211216 (https://download.01.org/0day-ci/archive/20211217/202112170120.4tAlxDnn-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/bf16b56f7a0cc5aa237129a6b8bd216dc2632c8b
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Miquel-Raynal/External-ECC-engines-Macronix-support/20211216-191821
        git checkout bf16b56f7a0cc5aa237129a6b8bd216dc2632c8b
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/mtd/nand/spi/gigadevice.o: in function `.LANCHOR0':
>> gigadevice.c:(.rodata+0x464): multiple definition of `spi_mem_no_caps'; drivers/mtd/nand/spi/core.o:core.c:(.rodata+0x2e8): first defined here
   arm-linux-gnueabi-ld: drivers/mtd/nand/spi/macronix.o: in function `.LANCHOR0':
   macronix.c:(.rodata+0x8d4): multiple definition of `spi_mem_no_caps'; drivers/mtd/nand/spi/core.o:core.c:(.rodata+0x2e8): first defined here
   arm-linux-gnueabi-ld: drivers/mtd/nand/spi/micron.o: in function `.LANCHOR0':
   micron.c:(.rodata+0x4cc): multiple definition of `spi_mem_no_caps'; drivers/mtd/nand/spi/core.o:core.c:(.rodata+0x2e8): first defined here
   arm-linux-gnueabi-ld: drivers/mtd/nand/spi/paragon.o: in function `.LANCHOR0':
   paragon.c:(.rodata+0x144): multiple definition of `spi_mem_no_caps'; drivers/mtd/nand/spi/core.o:core.c:(.rodata+0x2e8): first defined here
   arm-linux-gnueabi-ld: drivers/mtd/nand/spi/toshiba.o: in function `.LANCHOR0':
   toshiba.c:(.rodata+0x664): multiple definition of `spi_mem_no_caps'; drivers/mtd/nand/spi/core.o:core.c:(.rodata+0x2e8): first defined here
   arm-linux-gnueabi-ld: drivers/mtd/nand/spi/winbond.o:(.rodata+0x114): multiple definition of `spi_mem_no_caps'; drivers/mtd/nand/spi/core.o:core.c:(.rodata+0x2e8): first defined here
--
   arm-linux-gnueabi-ld: drivers/mtd/spi-nor/sfdp.o: in function `.LANCHOR0':
>> sfdp.c:(.rodata+0x278): multiple definition of `spi_mem_no_caps'; drivers/mtd/spi-nor/core.o:core.c:(.rodata+0xfbc): first defined here
   arm-linux-gnueabi-ld: drivers/mtd/spi-nor/swp.o: in function `.LANCHOR0':
   swp.c:(.rodata+0x24): multiple definition of `spi_mem_no_caps'; drivers/mtd/spi-nor/core.o:core.c:(.rodata+0xfbc): first defined here
   arm-linux-gnueabi-ld: drivers/mtd/spi-nor/otp.o: in function `.LANCHOR0':
   otp.c:(.rodata+0xc): multiple definition of `spi_mem_no_caps'; drivers/mtd/spi-nor/core.o:core.c:(.rodata+0xfbc): first defined here
   arm-linux-gnueabi-ld: drivers/mtd/spi-nor/sysfs.o:(.rodata+0x14): multiple definition of `spi_mem_no_caps'; drivers/mtd/spi-nor/core.o:core.c:(.rodata+0xfbc): first defined here
   arm-linux-gnueabi-ld: drivers/mtd/spi-nor/atmel.o: in function `.LANCHOR0':
   atmel.c:(.rodata+0x3d0): multiple definition of `spi_mem_no_caps'; drivers/mtd/spi-nor/core.o:core.c:(.rodata+0xfbc): first defined here
   arm-linux-gnueabi-ld: drivers/mtd/spi-nor/catalyst.o:(.rodata+0x178): multiple definition of `spi_mem_no_caps'; drivers/mtd/spi-nor/core.o:core.c:(.rodata+0xfbc): first defined here
   arm-linux-gnueabi-ld: drivers/mtd/spi-nor/eon.o:(.rodata+0x370): multiple definition of `spi_mem_no_caps'; drivers/mtd/spi-nor/core.o:core.c:(.rodata+0xfbc): first defined here
   arm-linux-gnueabi-ld: drivers/mtd/spi-nor/esmt.o:(.rodata+0xe8): multiple definition of `spi_mem_no_caps'; drivers/mtd/spi-nor/core.o:core.c:(.rodata+0xfbc): first defined here
   arm-linux-gnueabi-ld: drivers/mtd/spi-nor/everspin.o:(.rodata+0x130): multiple definition of `spi_mem_no_caps'; drivers/mtd/spi-nor/core.o:core.c:(.rodata+0xfbc): first defined here
   arm-linux-gnueabi-ld: drivers/mtd/spi-nor/fujitsu.o:(.rodata+0x58): multiple definition of `spi_mem_no_caps'; drivers/mtd/spi-nor/core.o:core.c:(.rodata+0xfbc): first defined here
   arm-linux-gnueabi-ld: drivers/mtd/spi-nor/gigadevice.o:(.rodata+0x250): multiple definition of `spi_mem_no_caps'; drivers/mtd/spi-nor/core.o:core.c:(.rodata+0xfbc): first defined here
   arm-linux-gnueabi-ld: drivers/mtd/spi-nor/intel.o:(.rodata+0xe8): multiple definition of `spi_mem_no_caps'; drivers/mtd/spi-nor/core.o:core.c:(.rodata+0xfbc): first defined here
   arm-linux-gnueabi-ld: drivers/mtd/spi-nor/issi.o:(.rodata+0x458): multiple definition of `spi_mem_no_caps'; drivers/mtd/spi-nor/core.o:core.c:(.rodata+0xfbc): first defined here
   arm-linux-gnueabi-ld: drivers/mtd/spi-nor/macronix.o:(.rodata+0x800): multiple definition of `spi_mem_no_caps'; drivers/mtd/spi-nor/core.o:core.c:(.rodata+0xfbc): first defined here
   arm-linux-gnueabi-ld: drivers/mtd/spi-nor/micron-st.o:(.rodata+0xe88): multiple definition of `spi_mem_no_caps'; drivers/mtd/spi-nor/core.o:core.c:(.rodata+0xfbc): first defined here
   arm-linux-gnueabi-ld: drivers/mtd/spi-nor/spansion.o:(.rodata+0x9b0): multiple definition of `spi_mem_no_caps'; drivers/mtd/spi-nor/core.o:core.c:(.rodata+0xfbc): first defined here
   arm-linux-gnueabi-ld: drivers/mtd/spi-nor/sst.o: in function `.LANCHOR0':
   sst.c:(.rodata+0x48c): multiple definition of `spi_mem_no_caps'; drivers/mtd/spi-nor/core.o:core.c:(.rodata+0xfbc): first defined here
   arm-linux-gnueabi-ld: drivers/mtd/spi-nor/winbond.o: in function `.LANCHOR0':
   winbond.c:(.rodata+0x978): multiple definition of `spi_mem_no_caps'; drivers/mtd/spi-nor/core.o:core.c:(.rodata+0xfbc): first defined here
   arm-linux-gnueabi-ld: drivers/mtd/spi-nor/xilinx.o:(.rodata+0x188): multiple definition of `spi_mem_no_caps'; drivers/mtd/spi-nor/core.o:core.c:(.rodata+0xfbc): first defined here
   arm-linux-gnueabi-ld: drivers/mtd/spi-nor/xmc.o:(.rodata+0xa0): multiple definition of `spi_mem_no_caps'; drivers/mtd/spi-nor/core.o:core.c:(.rodata+0xfbc): first defined here

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
