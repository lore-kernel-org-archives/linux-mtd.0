Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 281C2C433EF
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Feb 2022 19:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OJmKQGSkm0urmoYIKDZadXL9pd15rAnuVbZjtN+b4UU=; b=esO1ZFhUq9ieTO
	LBcdoh+e8iz7Gu3NGCm8Z9W0ZmC45Km89dFmWk25QR+yE70mFlM/LYDUwysxJbniG+wpEsw/8Bu64
	+m6xONSAvN9szesXz+GKxhPrFP8jKMOQS77vg5JvHOR1r6DK4tz3wnqxJYrEWI0osnNAzvtr6z1YT
	jmmuHMgwU8Z16FMM+XRHlu5yG9wTLeTPb/KyCsjHQzJL+kaj6yWkWnc3V0w0wg+tFWtqMQSOV9G2t
	7bUDObKxYkGfu6iESKrsAlPhC25Dw0kkNHXb8Tksod71DN51ABeV0MV874tUc9wkfnKosYrF6Ak1V
	EZjS68ZjMcdKo/TgiKCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nLrYp-0028TL-9Y; Sun, 20 Feb 2022 19:07:55 +0000
Received: from mga04.intel.com ([192.55.52.120])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nLrYm-0028SG-2U
 for linux-mtd@lists.infradead.org; Sun, 20 Feb 2022 19:07:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645384072; x=1676920072;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=auI5Fq22qc3D50WuT2ArLDDWErR8+vHT2yG2YDFqlE4=;
 b=NIrKbNRV0Fl2KiDgWNEJ4s/Dns5D/rJRdQivdhkQR2igAFu/qx5DvO7Y
 fsermXza/26GIA/FzYH3JLg1lo8kstP+jV4QMQUfevBA3XOnXFy4MUUgv
 mzmUgRzYb+pQMHXFrFrkvhmBO6gywNH/GGxRinrg7Id1DjefBUTpk6r6Z
 okYiCByhT3LykDqtoAaIA96vQ/biaTmuccSFaVfxwxDhZNbpQyXUhswbc
 E2s26NbbYrXffr/HtIGB3jEyufBN7MJhmziLp76wH2SEWqxUyJ/prVbBN
 V0NagmnoRpF/A6OBX/QLBEvpky4YifSvpkR9i4ZIPjppX+PfSCDuQQeSW Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10264"; a="250215035"
X-IronPort-AV: E=Sophos;i="5.88,384,1635231600"; d="scan'208";a="250215035"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2022 11:07:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,384,1635231600"; d="scan'208";a="606181950"
Received: from lkp-server01.sh.intel.com (HELO da3212ac2f54) ([10.239.97.150])
 by fmsmga004.fm.intel.com with ESMTP; 20 Feb 2022 11:07:47 -0800
Received: from kbuild by da3212ac2f54 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nLrYh-0000cR-3x; Sun, 20 Feb 2022 19:07:47 +0000
Date: Mon, 21 Feb 2022 03:07:42 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: kbuild-all@lists.01.org, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, yaliang.wang@windriver.com,
 Michael Walle <michael@walle.cc>
Subject: Re: [PATCH v2 14/32] mtd: spi-nor: winbond: unify function names
Message-ID: <202202210301.BeYSA7Ny-lkp@intel.com>
References: <20220218113607.1360020-15-michael@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220218113607.1360020-15-michael@walle.cc>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220220_110752_166561_1A2C9342 
X-CRM114-Status: GOOD (  14.52  )
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
[also build test WARNING on tip/master linux/master linus/master v5.17-rc4 next-20220217]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Michael-Walle/mtd-spi-nor-move-vendor-specific-code-into-vendor-modules/20220220-192832
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git spi-nor/next
config: alpha-randconfig-r034-20220220 (https://download.01.org/0day-ci/archive/20220221/202202210301.BeYSA7Ny-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/c09cbfe090ed6015773211aad1bd2387dd958b7a
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Michael-Walle/mtd-spi-nor-move-vendor-specific-code-into-vendor-modules/20220220-192832
        git checkout c09cbfe090ed6015773211aad1bd2387dd958b7a
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=alpha SHELL=/bin/bash drivers/mtd/spi-nor/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/mtd/spi-nor/winbond.c:141: warning: expecting prototype for winbond_set_4byte_addr_mode(). Prototype was for winbond_nor_set_4byte_addr_mode() instead


vim +141 drivers/mtd/spi-nor/winbond.c

7b8b22010af95f Boris Brezillon 2020-03-13  131  
7b8b22010af95f Boris Brezillon 2020-03-13  132  /**
7b8b22010af95f Boris Brezillon 2020-03-13  133   * winbond_set_4byte_addr_mode() - Set 4-byte address mode for Winbond flashes.
7b8b22010af95f Boris Brezillon 2020-03-13  134   * @nor:	pointer to 'struct spi_nor'.
7b8b22010af95f Boris Brezillon 2020-03-13  135   * @enable:	true to enter the 4-byte address mode, false to exit the 4-byte
7b8b22010af95f Boris Brezillon 2020-03-13  136   *		address mode.
7b8b22010af95f Boris Brezillon 2020-03-13  137   *
7b8b22010af95f Boris Brezillon 2020-03-13  138   * Return: 0 on success, -errno otherwise.
7b8b22010af95f Boris Brezillon 2020-03-13  139   */
c09cbfe090ed60 Michael Walle   2022-02-18  140  static int winbond_nor_set_4byte_addr_mode(struct spi_nor *nor, bool enable)
7b8b22010af95f Boris Brezillon 2020-03-13 @141  {
7b8b22010af95f Boris Brezillon 2020-03-13  142  	int ret;
7b8b22010af95f Boris Brezillon 2020-03-13  143  
7b8b22010af95f Boris Brezillon 2020-03-13  144  	ret = spi_nor_set_4byte_addr_mode(nor, enable);
7b8b22010af95f Boris Brezillon 2020-03-13  145  	if (ret || enable)
7b8b22010af95f Boris Brezillon 2020-03-13  146  		return ret;
7b8b22010af95f Boris Brezillon 2020-03-13  147  
7b8b22010af95f Boris Brezillon 2020-03-13  148  	/*
7b8b22010af95f Boris Brezillon 2020-03-13  149  	 * On Winbond W25Q256FV, leaving 4byte mode causes the Extended Address
7b8b22010af95f Boris Brezillon 2020-03-13  150  	 * Register to be set to 1, so all 3-byte-address reads come from the
7b8b22010af95f Boris Brezillon 2020-03-13  151  	 * second 16M. We must clear the register to enable normal behavior.
7b8b22010af95f Boris Brezillon 2020-03-13  152  	 */
7b8b22010af95f Boris Brezillon 2020-03-13  153  	ret = spi_nor_write_enable(nor);
7b8b22010af95f Boris Brezillon 2020-03-13  154  	if (ret)
7b8b22010af95f Boris Brezillon 2020-03-13  155  		return ret;
7b8b22010af95f Boris Brezillon 2020-03-13  156  
7b8b22010af95f Boris Brezillon 2020-03-13  157  	ret = spi_nor_write_ear(nor, 0);
7b8b22010af95f Boris Brezillon 2020-03-13  158  	if (ret)
7b8b22010af95f Boris Brezillon 2020-03-13  159  		return ret;
7b8b22010af95f Boris Brezillon 2020-03-13  160  
7b8b22010af95f Boris Brezillon 2020-03-13  161  	return spi_nor_write_disable(nor);
7b8b22010af95f Boris Brezillon 2020-03-13  162  }
7b8b22010af95f Boris Brezillon 2020-03-13  163  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
