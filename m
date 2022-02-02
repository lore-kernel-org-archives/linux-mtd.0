Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A749C433F5
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Feb 2022 17:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4BeMNomoBHQaB4Gt1tUlWiXsiXynNbkNs6WeQ6JTAjw=; b=yPEFzKHHTlrpTX
	Hx3vkhP8r789nS+5X/g5pE/KRBrscHql2TlwNDXXYkze3f/wkfwM5BjCa9sgLY+Irb2JRQmcLMn8Q
	wd1b2uKY/4rN0fcwqjKKbdafaZMpu4fBDbq7auT0iE04VvPw6yjH+HXwF4w7H02avPFBY1vfTWnFZ
	M3PIUYb5evLYAoWKiU1p1P+1JfbecicQcbZgZPtCvchJ0L8DaJStzVA8OUAHBdGTJpJd2mVcX4YQl
	etfK2m6lbcv+hhb+wfTZjj45MhfGy+aN3KzDV+Y3bBSrxhiAdvGDOKUrBW+b2HtJJAJy5G9+R0Sk1
	n+K4Wz3Yd/Zi0ye3BYcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFJM6-00GOAV-Hq; Wed, 02 Feb 2022 17:23:42 +0000
Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFJM3-00GO8p-Ir
 for linux-mtd@lists.infradead.org; Wed, 02 Feb 2022 17:23:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643822619; x=1675358619;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=FfQwTJzWKATT32F4p5gOzN+KE1zPEG9JU+pMAd3OQ4A=;
 b=WVhATh2C0dVgoGoP3YIU4cw+Zam+w72ZIKMtl/wwhNaGf+UA/cjovq6m
 REJmUDLyJA1dDgAJAq4af4u8E5ykIlGDYojWGMXa1qDreJrE9DYDJCuFC
 JHNmO9QUS1g07yGnZTY2kH03Gjm84Lo4P6y39pI1fOK8C1j2fmcDZznxI
 64/vrCZ+BhhbvjGbcVbMBKgh2ApmfjJdqHv9WWOfjQ+FOcA9JfkojGRgf
 8KRZ0OrvNHN0OOgoq3SfES88FC7Y8gbwdW0RrIQgocOM1lnsjAL21CPqO
 5LGgq6j4QTI4StYeDhquAH9rvm2bpcwd+quNKiPlPjcsUNUceW76failt g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10246"; a="247744501"
X-IronPort-AV: E=Sophos;i="5.88,337,1635231600"; d="scan'208";a="247744501"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2022 09:14:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,337,1635231600"; d="scan'208";a="698967422"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by orsmga005.jf.intel.com with ESMTP; 02 Feb 2022 09:14:10 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nFJCr-000UsG-Ma; Wed, 02 Feb 2022 17:14:09 +0000
Date: Thu, 3 Feb 2022 01:14:04 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: kbuild-all@lists.01.org, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Michael Walle <michael@walle.cc>
Subject: Re: [PATCH v1 05/14] mtd: spi-nor: xilinx: rename vendor specific
 functions and defines
Message-ID: <202202030130.meVKrEGw-lkp@intel.com>
References: <20220202145853.4187726-6-michael@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220202145853.4187726-6-michael@walle.cc>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220202_092339_685049_339171C6 
X-CRM114-Status: GOOD (  14.97  )
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
config: alpha-allmodconfig (https://download.01.org/0day-ci/archive/20220203/202202030130.meVKrEGw-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/6527d5f32d65d5695ddcc0bcf3ac31928e64a935
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Michael-Walle/mtd-spi-nor-move-vendor-specific-code-into-vendor-modules/20220202-230139
        git checkout 6527d5f32d65d5695ddcc0bcf3ac31928e64a935
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=alpha SHELL=/bin/bash drivers/mtd/spi-nor/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/mtd/spi-nor/xilinx.c:103: warning: expecting prototype for spi_nor_xsr_ready(). Prototype was for xilinx_sr_ready() instead


vim +103 drivers/mtd/spi-nor/xilinx.c

37ccf5a41e1528 Michael Walle 2022-02-02   94  
37ccf5a41e1528 Michael Walle 2022-02-02   95  /**
37ccf5a41e1528 Michael Walle 2022-02-02   96   * spi_nor_xsr_ready() - Query the Status Register of the S3AN flash to see if
37ccf5a41e1528 Michael Walle 2022-02-02   97   * the flash is ready for new commands.
37ccf5a41e1528 Michael Walle 2022-02-02   98   * @nor:	pointer to 'struct spi_nor'.
37ccf5a41e1528 Michael Walle 2022-02-02   99   *
37ccf5a41e1528 Michael Walle 2022-02-02  100   * Return: 1 if ready, 0 if not ready, -errno on errors.
37ccf5a41e1528 Michael Walle 2022-02-02  101   */
6527d5f32d65d5 Michael Walle 2022-02-02  102  static int xilinx_sr_ready(struct spi_nor *nor)
37ccf5a41e1528 Michael Walle 2022-02-02 @103  {
37ccf5a41e1528 Michael Walle 2022-02-02  104  	int ret;
37ccf5a41e1528 Michael Walle 2022-02-02  105  
6527d5f32d65d5 Michael Walle 2022-02-02  106  	ret = xilinx_read_sr(nor, nor->bouncebuf);
37ccf5a41e1528 Michael Walle 2022-02-02  107  	if (ret)
37ccf5a41e1528 Michael Walle 2022-02-02  108  		return ret;
37ccf5a41e1528 Michael Walle 2022-02-02  109  
37ccf5a41e1528 Michael Walle 2022-02-02  110  	return !!(nor->bouncebuf[0] & XSR_RDY);
37ccf5a41e1528 Michael Walle 2022-02-02  111  }
37ccf5a41e1528 Michael Walle 2022-02-02  112  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
