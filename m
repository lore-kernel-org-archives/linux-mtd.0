Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D1A2C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Dec 2021 18:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+EBqdYO+SSnu8EReoJDJl8oJ3JOmEumHdonGoi/67sU=; b=IHuqvhOgCkl+FW
	tLsTvhpN0NEnUx4KBOXarB5py/giRTbQvBQ0Y3pgUx7PbIRDnujHUqJDCAAAuZYbPIJMgqPGF3DXN
	cKYi62pd1cWgo2jJoxyz8MF2i7oO33JCxiJXFkiRh145UPdeFppFiL3e/rz7QnBSHjEKxzVE+bnzh
	4IhMVnvcbav/FI0e03Mca++Hfj9wqH7YzaveY9KcYNIHiZooj/S4L2C/s+Pckh9gyawPIbwgUKxBc
	eYa6umNPhbjyai1J6/T8TZsp02sSVzf7kpwkxsCAZjdtf42EPwWlirLgQdgl9d3hbJvilMilptRw+
	7gYLJ52GsqwUu8dGxyAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxvu2-007Duj-Cf; Thu, 16 Dec 2021 18:54:54 +0000
Received: from mga17.intel.com ([192.55.52.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxvsm-007DFR-UU
 for linux-mtd@lists.infradead.org; Thu, 16 Dec 2021 18:53:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639680816; x=1671216816;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8MSCgFidKirbyqnLCDSCpxGAW0z3HoFpW9DqxP4Tj8A=;
 b=S434J49B+4q267tfoZKUKDQA7A+qe790Ezhx4evFtIA7pfKlyHeHJC17
 fsgBvgkuJlkDqYHgR9sEKfCUX+nPioVC2unA7+Hm9dAoLxIVSwhWrzMs7
 4EJr1zydoxFi6wZiThhAwm/nPD+eolDfrN/8u+uUH1FkT/q2KlXrTuqZ3
 oUkMWMXSlUTFnCoxVDzZMpstgqscc+3Wt1Xjj99iFMHPlYIWkEIrY0WVi
 pA7yO3vxhIm7/5HXbW8yQQX4yPgDmKXuaugW6MnY2pohdSQdqTbTplUFc
 LsBFcr0pMu/+1VnnuCZfe5wdUMM5WRTWaxSSXuB/QSJD7qKkA72XCp0sU w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10200"; a="220250468"
X-IronPort-AV: E=Sophos;i="5.88,212,1635231600"; d="scan'208";a="220250468"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2021 10:53:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,212,1635231600"; d="scan'208";a="464797597"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
 by orsmga003.jf.intel.com with ESMTP; 16 Dec 2021 10:53:18 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mxvsT-0003ga-VS; Thu, 16 Dec 2021 18:53:17 +0000
Date: Fri, 17 Dec 2021 02:52:25 +0800
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
Message-ID: <202112170204.FjtWNBvt-lkp@intel.com>
References: <20211216111654.238086-21-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211216111654.238086-21-miquel.raynal@bootlin.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_105337_050970_2AEB4554 
X-CRM114-Status: GOOD (  12.79  )
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
config: openrisc-randconfig-r036-20211216 (https://download.01.org/0day-ci/archive/20211217/202112170204.FjtWNBvt-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/bf16b56f7a0cc5aa237129a6b8bd216dc2632c8b
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Miquel-Raynal/External-ECC-engines-Macronix-support/20211216-191821
        git checkout bf16b56f7a0cc5aa237129a6b8bd216dc2632c8b
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=openrisc SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> or1k-linux-ld: drivers/spi/spi-dw-core.o:(.rodata+0x0): multiple definition of `spi_mem_no_caps'; drivers/spi/spi.o:(.rodata+0x40): first defined here
   or1k-linux-ld: drivers/spi/spi-dw-dma.o:(.rodata+0x30): multiple definition of `spi_mem_no_caps'; drivers/spi/spi.o:(.rodata+0x40): first defined here
   or1k-linux-ld: drivers/spi/spi-nxp-fspi.o:(.rodata+0x51c): multiple definition of `spi_mem_no_caps'; drivers/spi/spi.o:(.rodata+0x40): first defined here
   or1k-linux-ld: drivers/spi/spi-zynqmp-gqspi.o:(.rodata+0x20c): multiple definition of `spi_mem_no_caps'; drivers/spi/spi.o:(.rodata+0x40): first defined here

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
