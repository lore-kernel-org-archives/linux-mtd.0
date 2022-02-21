Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D738FC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Feb 2022 13:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5qA2E9xALRnxRoecWychBKWSkhRnh9TfQu/Ka+IBhCw=; b=oA/P343Hz+tsaY
	Vc9acxQfiDRvFifo3OQ7biyOgHixN1pZLAsF8By1yT+/EfN9c+5CSKYdSRWKtmi/ocb2e1eq6b+Mn
	LsfBRyMPdRNOMcNjIJsHbaW5FDKEuSQRpyf+nUOypm4ow3UA3KfReqNUFKBZAYIomb3fKec8G69+l
	taSxC3kQq/qY4XRfHDWQLf/GY26t4IQ2ftpGz+NvaJLzryMss3mzcABp5x0tkch6sMV+23HvPf1GB
	UnIUUXC0mnKd0PnHp2yZz0o9jwJDY530cVrKlhWAQ+2w0llp2P8BlTxIdlAvXY5sSsCrZ29MFifFy
	SOdFcZkaPVKznzGdrOyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM8bE-005rhu-2U; Mon, 21 Feb 2022 13:19:32 +0000
Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM7c4-005bKK-CT
 for linux-mtd@lists.infradead.org; Mon, 21 Feb 2022 12:16:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645445780; x=1676981780;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8hVLrnAnBGBdpP5SQ/9ADmMHt7FI1CBjOU1y3Dq+Z6k=;
 b=nHh0Q6KeV2MU08NDedl96D2m81/0mLDWg65ld94KpyGzw1F0GFXQsKxZ
 yV0EaqCre/lpwjs9qEVPinNaNIX6P4T8gqR4gVY+1NXWTOF5fAa4m8owY
 vMFjzZRcY8XDgCqVVq91HYwFQEgcn0aTbu5rwo/KaVJeXDko7CEqb6eOe
 Ham4UD3yAOFRoOWnCEz8pBnTPHFcNOnlkm7G5sqcTQCnwLxz8S//54kw5
 kBn2iCHUaxo8F9iIC/kLut2kAoVCjoq6fDvv/pu9s5GQovOnSdpP26iI2
 L08hSPabqgoSESN1vo1PEML8XGvW2bRygp0Vr6luwtDDI2bDwM8JfAo8I w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10264"; a="251447286"
X-IronPort-AV: E=Sophos;i="5.88,385,1635231600"; d="scan'208";a="251447286"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2022 04:16:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,385,1635231600"; d="scan'208";a="775981651"
Received: from lkp-server01.sh.intel.com (HELO da3212ac2f54) ([10.239.97.150])
 by fmsmga006.fm.intel.com with ESMTP; 21 Feb 2022 04:16:15 -0800
Received: from kbuild by da3212ac2f54 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nM7by-0001Zy-3Q; Mon, 21 Feb 2022 12:16:14 +0000
Date: Mon, 21 Feb 2022 20:15:44 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: kbuild-all@lists.01.org, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, yaliang.wang@windriver.com,
 Michael Walle <michael@walle.cc>
Subject: Re: [PATCH v3 12/32] mtd: spi-nor: spansion: unify function names
Message-ID: <202202212013.sOSFyoNv-lkp@intel.com>
References: <20220221085236.1452024-13-michael@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220221085236.1452024-13-michael@walle.cc>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_041620_596436_359F6F5C 
X-CRM114-Status: GOOD (  15.38  )
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

I love your patch! Yet something to improve:

[auto build test ERROR on mtd/spi-nor/next]
[also build test ERROR on tip/master linux/master linus/master v5.17-rc5 next-20220217]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Michael-Walle/mtd-spi-nor-move-vendor-specific-code-into-vendor-modules/20220221-165728
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git spi-nor/next
config: x86_64-randconfig-a003-20220221 (https://download.01.org/0day-ci/archive/20220221/202202212013.sOSFyoNv-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build):
        # https://github.com/0day-ci/linux/commit/f8aeae6008aa9a304aacb1914911dcb3a895da53
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Michael-Walle/mtd-spi-nor-move-vendor-specific-code-into-vendor-modules/20220221-165728
        git checkout f8aeae6008aa9a304aacb1914911dcb3a895da53
        # save the config file to linux build tree
        mkdir build_dir
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/mtd/spi-nor/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/mtd/spi-nor/spansion.c:232:14: error: 's25fs_s_fixups' undeclared here (not in a function); did you mean 's25fs_s_nor_fixups'?
     232 |   .fixups = &s25fs_s_fixups, },
         |              ^~~~~~~~~~~~~~
         |              s25fs_s_nor_fixups
   drivers/mtd/spi-nor/spansion.c:201:36: warning: 's25fs_s_nor_fixups' defined but not used [-Wunused-const-variable=]
     201 | static const struct spi_nor_fixups s25fs_s_nor_fixups = {
         |                                    ^~~~~~~~~~~~~~~~~~


vim +232 drivers/mtd/spi-nor/spansion.c

5587fa489747a8 Sergei Shtylyov 2020-04-20  204  
f8aeae6008aa9a Michael Walle   2022-02-21  205  static const struct flash_info spansion_nor_parts[] = {
0173c32a0ebd42 Boris Brezillon 2020-03-13  206  	/* Spansion/Cypress -- single (large) sector size only, at least
0173c32a0ebd42 Boris Brezillon 2020-03-13  207  	 * for the chips listed here (without boot sectors).
0173c32a0ebd42 Boris Brezillon 2020-03-13  208  	 */
ec1c0e996035c8 Tudor Ambarus   2021-12-07  209  	{ "s25sl032p",  INFO(0x010215, 0x4d00,  64 * 1024,  64)
ec1c0e996035c8 Tudor Ambarus   2021-12-07  210  		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
ec1c0e996035c8 Tudor Ambarus   2021-12-07  211  	{ "s25sl064p",  INFO(0x010216, 0x4d00,  64 * 1024, 128)
ec1c0e996035c8 Tudor Ambarus   2021-12-07  212  		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
ec1c0e996035c8 Tudor Ambarus   2021-12-07  213  	{ "s25fl128s0", INFO6(0x012018, 0x4d0080, 256 * 1024, 64)
ec1c0e996035c8 Tudor Ambarus   2021-12-07  214  		FLAGS(USE_CLSR)
ec1c0e996035c8 Tudor Ambarus   2021-12-07  215  		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
ec1c0e996035c8 Tudor Ambarus   2021-12-07  216  	{ "s25fl128s1", INFO6(0x012018, 0x4d0180, 64 * 1024, 256)
ec1c0e996035c8 Tudor Ambarus   2021-12-07  217  		FLAGS(USE_CLSR)
ec1c0e996035c8 Tudor Ambarus   2021-12-07  218  		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
ec1c0e996035c8 Tudor Ambarus   2021-12-07  219  	{ "s25fl256s0", INFO6(0x010219, 0x4d0080, 256 * 1024, 128)
ec1c0e996035c8 Tudor Ambarus   2021-12-07  220  		FLAGS(USE_CLSR)
5eefc2dc03192c Tudor Ambarus   2021-12-07  221  		NO_SFDP_FLAGS(SPI_NOR_SKIP_SFDP | SPI_NOR_DUAL_READ |
5eefc2dc03192c Tudor Ambarus   2021-12-07  222  			      SPI_NOR_QUAD_READ) },
ec1c0e996035c8 Tudor Ambarus   2021-12-07  223  	{ "s25fl256s1", INFO6(0x010219, 0x4d0180, 64 * 1024, 512)
ec1c0e996035c8 Tudor Ambarus   2021-12-07  224  		FLAGS(USE_CLSR)
ec1c0e996035c8 Tudor Ambarus   2021-12-07  225  		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
ec1c0e996035c8 Tudor Ambarus   2021-12-07  226  	{ "s25fl512s",  INFO6(0x010220, 0x4d0080, 256 * 1024, 256)
ec1c0e996035c8 Tudor Ambarus   2021-12-07  227  		FLAGS(SPI_NOR_HAS_LOCK | USE_CLSR)
ec1c0e996035c8 Tudor Ambarus   2021-12-07  228  		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
ec1c0e996035c8 Tudor Ambarus   2021-12-07  229  	{ "s25fs128s1", INFO6(0x012018, 0x4d0181, 64 * 1024, 256)
ec1c0e996035c8 Tudor Ambarus   2021-12-07  230  		FLAGS(USE_CLSR)
ec1c0e996035c8 Tudor Ambarus   2021-12-07  231  		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
c26d0d87f175b8 Yicong Yang     2020-04-22 @232  		.fixups = &s25fs_s_fixups, },
ec1c0e996035c8 Tudor Ambarus   2021-12-07  233  	{ "s25fs256s0", INFO6(0x010219, 0x4d0081, 256 * 1024, 128)
ec1c0e996035c8 Tudor Ambarus   2021-12-07  234  		FLAGS(USE_CLSR)
ec1c0e996035c8 Tudor Ambarus   2021-12-07  235  		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
ec1c0e996035c8 Tudor Ambarus   2021-12-07  236  	{ "s25fs256s1", INFO6(0x010219, 0x4d0181, 64 * 1024, 512)
ec1c0e996035c8 Tudor Ambarus   2021-12-07  237  		FLAGS(USE_CLSR)
ec1c0e996035c8 Tudor Ambarus   2021-12-07  238  		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
ec1c0e996035c8 Tudor Ambarus   2021-12-07  239  	{ "s25fs512s",  INFO6(0x010220, 0x4d0081, 256 * 1024, 256)
ec1c0e996035c8 Tudor Ambarus   2021-12-07  240  		FLAGS(USE_CLSR)
ec1c0e996035c8 Tudor Ambarus   2021-12-07  241  		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
5587fa489747a8 Sergei Shtylyov 2020-04-20  242  		.fixups = &s25fs_s_fixups, },
ec1c0e996035c8 Tudor Ambarus   2021-12-07  243  	{ "s25sl12800", INFO(0x012018, 0x0300, 256 * 1024,  64) },
ec1c0e996035c8 Tudor Ambarus   2021-12-07  244  	{ "s25sl12801", INFO(0x012018, 0x0301,  64 * 1024, 256) },
ec1c0e996035c8 Tudor Ambarus   2021-12-07  245  	{ "s25fl129p0", INFO(0x012018, 0x4d00, 256 * 1024,  64)
ec1c0e996035c8 Tudor Ambarus   2021-12-07  246  		FLAGS(USE_CLSR)
ec1c0e996035c8 Tudor Ambarus   2021-12-07  247  		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
ec1c0e996035c8 Tudor Ambarus   2021-12-07  248  	{ "s25fl129p1", INFO(0x012018, 0x4d01,  64 * 1024, 256)
ec1c0e996035c8 Tudor Ambarus   2021-12-07  249  		FLAGS(USE_CLSR)
ec1c0e996035c8 Tudor Ambarus   2021-12-07  250  		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
ec1c0e996035c8 Tudor Ambarus   2021-12-07  251  	{ "s25sl004a",  INFO(0x010212,      0,  64 * 1024,   8) },
ec1c0e996035c8 Tudor Ambarus   2021-12-07  252  	{ "s25sl008a",  INFO(0x010213,      0,  64 * 1024,  16) },
ec1c0e996035c8 Tudor Ambarus   2021-12-07  253  	{ "s25sl016a",  INFO(0x010214,      0,  64 * 1024,  32) },
ec1c0e996035c8 Tudor Ambarus   2021-12-07  254  	{ "s25sl032a",  INFO(0x010215,      0,  64 * 1024,  64) },
ec1c0e996035c8 Tudor Ambarus   2021-12-07  255  	{ "s25sl064a",  INFO(0x010216,      0,  64 * 1024, 128) },
ec1c0e996035c8 Tudor Ambarus   2021-12-07  256  	{ "s25fl004k",  INFO(0xef4013,      0,  64 * 1024,   8)
ec1c0e996035c8 Tudor Ambarus   2021-12-07  257  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
ec1c0e996035c8 Tudor Ambarus   2021-12-07  258  			      SPI_NOR_QUAD_READ) },
ec1c0e996035c8 Tudor Ambarus   2021-12-07  259  	{ "s25fl008k",  INFO(0xef4014,      0,  64 * 1024,  16)
ec1c0e996035c8 Tudor Ambarus   2021-12-07  260  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
ec1c0e996035c8 Tudor Ambarus   2021-12-07  261  			      SPI_NOR_QUAD_READ) },
ec1c0e996035c8 Tudor Ambarus   2021-12-07  262  	{ "s25fl016k",  INFO(0xef4015,      0,  64 * 1024,  32)
ec1c0e996035c8 Tudor Ambarus   2021-12-07  263  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
ec1c0e996035c8 Tudor Ambarus   2021-12-07  264  			      SPI_NOR_QUAD_READ) },
ec1c0e996035c8 Tudor Ambarus   2021-12-07  265  	{ "s25fl064k",  INFO(0xef4017,      0,  64 * 1024, 128)
ec1c0e996035c8 Tudor Ambarus   2021-12-07  266  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
ec1c0e996035c8 Tudor Ambarus   2021-12-07  267  			      SPI_NOR_QUAD_READ) },
ec1c0e996035c8 Tudor Ambarus   2021-12-07  268  	{ "s25fl116k",  INFO(0x014015,      0,  64 * 1024,  32)
ec1c0e996035c8 Tudor Ambarus   2021-12-07  269  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
ec1c0e996035c8 Tudor Ambarus   2021-12-07  270  			      SPI_NOR_QUAD_READ) },
ec1c0e996035c8 Tudor Ambarus   2021-12-07  271  	{ "s25fl132k",  INFO(0x014016,      0,  64 * 1024,  64)
ec1c0e996035c8 Tudor Ambarus   2021-12-07  272  		NO_SFDP_FLAGS(SECT_4K) },
ec1c0e996035c8 Tudor Ambarus   2021-12-07  273  	{ "s25fl164k",  INFO(0x014017,      0,  64 * 1024, 128)
ec1c0e996035c8 Tudor Ambarus   2021-12-07  274  		NO_SFDP_FLAGS(SECT_4K) },
ec1c0e996035c8 Tudor Ambarus   2021-12-07  275  	{ "s25fl204k",  INFO(0x014013,      0,  64 * 1024,   8)
ec1c0e996035c8 Tudor Ambarus   2021-12-07  276  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ) },
ec1c0e996035c8 Tudor Ambarus   2021-12-07  277  	{ "s25fl208k",  INFO(0x014014,      0,  64 * 1024,  16)
ec1c0e996035c8 Tudor Ambarus   2021-12-07  278  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ) },
ec1c0e996035c8 Tudor Ambarus   2021-12-07  279  	{ "s25fl064l",  INFO(0x016017,      0,  64 * 1024, 128)
ec1c0e996035c8 Tudor Ambarus   2021-12-07  280  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
ec1c0e996035c8 Tudor Ambarus   2021-12-07  281  		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
ec1c0e996035c8 Tudor Ambarus   2021-12-07  282  	{ "s25fl128l",  INFO(0x016018,      0,  64 * 1024, 256)
ec1c0e996035c8 Tudor Ambarus   2021-12-07  283  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
ec1c0e996035c8 Tudor Ambarus   2021-12-07  284  		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
ec1c0e996035c8 Tudor Ambarus   2021-12-07  285  	{ "s25fl256l",  INFO(0x016019,      0,  64 * 1024, 512)
ec1c0e996035c8 Tudor Ambarus   2021-12-07  286  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
ec1c0e996035c8 Tudor Ambarus   2021-12-07  287  		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
ec1c0e996035c8 Tudor Ambarus   2021-12-07  288  	{ "cy15x104q",  INFO6(0x042cc2, 0x7f7f7f, 512 * 1024, 1)
ec1c0e996035c8 Tudor Ambarus   2021-12-07  289  		FLAGS(SPI_NOR_NO_ERASE) },
ec1c0e996035c8 Tudor Ambarus   2021-12-07  290  	{ "s28hs512t",   INFO(0x345b1a,      0, 256 * 1024, 256)
ec1c0e996035c8 Tudor Ambarus   2021-12-07  291  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_OCTAL_DTR_READ |
c3266af101f28e Pratyush Yadav  2020-10-05  292  			      SPI_NOR_OCTAL_DTR_PP)
c3266af101f28e Pratyush Yadav  2020-10-05  293  		.fixups = &s28hs512t_fixups,
c3266af101f28e Pratyush Yadav  2020-10-05  294  	},
0173c32a0ebd42 Boris Brezillon 2020-03-13  295  };
0173c32a0ebd42 Boris Brezillon 2020-03-13  296  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
