Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 795C2C55838
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Aug 2026 12:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8R2Ujgo1tC4EU58BPYxAuY266Upg12D61QVq9BSRs0w=; b=jfKbo5fAaKFCkd
	XbLKvuItwZR5ndZjag7dJg1jDjRyFMqiQlFQZ4ke8meIyZ7s7fFAZ/C0sLxVbmJZDOSrKHpGfm/Wl
	QLABkfz8EQBj8ma/zQWSXtQ2xG6EPHJJi5kdAwWm4BYyJuCCT9Wb60irtUq5E4lomEP0hfNbXoBir
	Ny8t5tse8HDHucbzwJlC8naKjxGi3pUU7TJSTF/CuwfobcLdtYQaf+lORjeLxYr4fNA6l4MUvnBFq
	pguBwSzPXV4YplridA4hhxq0G99FfRbpUgVQAkSXzs8HamTy+2VoPXVEZbUCSrLX/mqnEU2kIOcGQ
	5EX8Ve4MCtbDXOOMeufg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrDxe-00000001lrt-0gB8;
	Tue, 04 Aug 2026 12:09:34 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrDxb-00000001lrD-0uUg
	for linux-mtd@lists.infradead.org;
	Tue, 04 Aug 2026 12:09:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785845372; x=1817381372;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rtf8eOvMTeEuXHCn6euqEu9sv+RpPXAaVU3t/v7ajfA=;
  b=TkxU/xFbIo8JtfslyI9ExJwhzYc2kASxBmlwIA6K3690+9+afOtgtVCd
   QnzAAkGO5TDgg1TpPppbN9qLm8pQSfQwPjKHboIpbt6lPpfRX2NvUgldH
   AJhBp/FLPXF9aJplWdu2IxmZIJ2pJvJGUOgoMhdRUcqkf8jyaAMi3cpyH
   VXuPt2yMEEb0MOXEny0BHTFKwmhg3fNdVFxsNmxJ4q3cLcZwklVktGpK1
   xtu6EVw1e9rRVFV777mUpw3q/Ccz735e603x6zQehajA9bIwDQNTKxS7C
   qekMDX5TwTqwhmbJ4k3YmfvSocJj7vibSq9KhzjDEXiQZpdUTkROYxd7C
   g==;
X-CSE-ConnectionGUID: keEdpjiwQ2yG9SkBAtPETw==
X-CSE-MsgGUID: okkXB7nXTT25z/nDFz5zIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="86473203"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="86473203"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 05:09:29 -0700
X-CSE-ConnectionGUID: DzESDmdjRqualZ63CWDICw==
X-CSE-MsgGUID: j+glKxV4RuqTXi106Zq07Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="284871641"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 04 Aug 2026 05:07:38 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrDvi-000000009pl-3tN2;
	Tue, 04 Aug 2026 12:07:34 +0000
Date: Tue, 4 Aug 2026 20:06:57 +0800
From: kernel test robot <lkp@intel.com>
To: Jeffrey Yu <jeyu@issi.com>,
	"marek.vasut@gmail.com" <marek.vasut@gmail.com>,
	"tudor.ambarus@microchip.com" <tudor.ambarus@microchip.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"dwmw2@infradead.org" <dwmw2@infradead.org>,
	"computersforpeace@gmail.com" <computersforpeace@gmail.com>,
	"bbrezillon@kernel.org" <bbrezillon@kernel.org>,
	"richard@nod.at" <richard@nod.at>,
	open list <linux-kernel@vger.kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] Add JEDEC ID table entries for additional ISSI SPI-NOR
   devices. Additionally added several structs to support ISSI octal flash
  functionality. (Octal SPI 2026 revised)
Message-ID: <202608041903.oQQ0fMx3-lkp@intel.com>
References: <LV8PR19MB85976C665A59A0DEBAF4F285B6EF2@LV8PR19MB8597.namprd19.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <LV8PR19MB85976C665A59A0DEBAF4F285B6EF2@LV8PR19MB8597.namprd19.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_050931_339410_5CC4E231 
X-CRM114-Status: GOOD (  15.94  )
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

Hi Jeffrey,

kernel test robot noticed the following build errors:

[auto build test ERROR on mtd/spi-nor/next]
[also build test ERROR on linus/master v7.2-rc6 next-20260803]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jeffrey-Yu/Add-JEDEC-ID-table-entries-for-additional-ISSI-SPI-NOR-devices-Additionally-added-several-structs-to-support-ISSI-octal-/20260804-122036
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git spi-nor/next
patch link:    https://lore.kernel.org/r/LV8PR19MB85976C665A59A0DEBAF4F285B6EF2%40LV8PR19MB8597.namprd19.prod.outlook.com
patch subject: [PATCH] Add JEDEC ID table entries for additional ISSI SPI-NOR   devices. Additionally added several structs to support ISSI octal flash  functionality. (Octal SPI 2026 revised)
config: hexagon-randconfig-002-20260804 (https://download.01.org/0day-ci/archive/20260804/202608041903.oQQ0fMx3-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project bacfe2950f8218268fcc0a8765644ea0c15f0360)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260804/202608041903.oQQ0fMx3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608041903.oQQ0fMx3-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/mtd/spi-nor/issi.c:22:12: error: use of undeclared identifier 'SPINOR_IS_EXSPI'
      22 |                 buf[0] = SPINOR_IS_EXSPI;
         |                          ^~~~~~~~~~~~~~~
>> drivers/mtd/spi-nor/issi.c:25:31: error: use of undeclared identifier 'SPINOR_OP_IS_WR_ANY_REG'
      25 |                                 SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_IS_WR_ANY_REG, 1),
         |                                                           ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/mtd/spi-nor/issi.c:26:24: error: use of undeclared identifier 'SPINOR_REG_IS_CFR0V'
      26 |                                 SPI_MEM_OP_ADDR(4, SPINOR_REG_IS_CFR0V, 1),
         |                                                    ^~~~~~~~~~~~~~~~~~~
>> drivers/mtd/spi-nor/issi.c:36:42: error: use of undeclared identifier 'SPI_CONTROLLER_SDR_PHY'
      36 |                 nor->spimem->spi->controller->flags |= SPI_CONTROLLER_SDR_PHY;
         |                                                        ^~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/spi-nor/issi.c:55:43: error: use of undeclared identifier 'SPI_CONTROLLER_SDR_PHY'
      55 |                 nor->spimem->spi->controller->flags &= ~SPI_CONTROLLER_SDR_PHY;
         |                                                         ^~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/spi-nor/issi.c:73:31: error: use of undeclared identifier 'SPINOR_OP_IS_WR_ANY_REG'
      73 |                                 SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_IS_WR_ANY_REG, 1),
         |                                                           ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/mtd/spi-nor/issi.c:74:25: error: use of undeclared identifier 'SPINOR_REG_IS_CFR1V'
      74 |                                         SPI_MEM_OP_ADDR(3, SPINOR_REG_IS_CFR1V, 1),
         |                                                            ^~~~~~~~~~~~~~~~~~~
>> drivers/mtd/spi-nor/issi.c:92:11: error: use of undeclared identifier 'SPINOR_IS_OCT_DTR'
      92 |                         *buf = SPINOR_IS_OCT_DTR;
         |                                ^~~~~~~~~~~~~~~~~
   drivers/mtd/spi-nor/issi.c:94:11: error: use of undeclared identifier 'SPINOR_IS_EXSPI'
      94 |                         *buf = SPINOR_IS_EXSPI;
         |                                ^~~~~~~~~~~~~~~
   drivers/mtd/spi-nor/issi.c:97:30: error: use of undeclared identifier 'SPINOR_OP_IS_WR_ANY_REG'
      97 |                         SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_IS_WR_ANY_REG, 1),
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/spi-nor/issi.c:99:8: error: use of undeclared identifier 'SPINOR_REG_IS_CFR0V'
      99 |                                                         SPINOR_REG_IS_CFR0V, 1),
         |                                                         ^~~~~~~~~~~~~~~~~~~
>> drivers/mtd/spi-nor/issi.c:110:21: error: use of undeclared identifier 'SNOR_F_HAS_STACKED'; did you mean 'SNOR_F_HAS_LOCK'?
     110 |                 if ((nor->flags & SNOR_F_HAS_STACKED) && nor->spimem->spi->cs_index_mask == 1)
         |                                   ^~~~~~~~~~~~~~~~~~
         |                                   SNOR_F_HAS_LOCK
   drivers/mtd/spi-nor/core.h:131:2: note: 'SNOR_F_HAS_LOCK' declared here
     131 |         SNOR_F_HAS_LOCK         = BIT(5),
         |         ^
>> drivers/mtd/spi-nor/issi.c:151:44: error: call to undeclared function 'spi_nor_get_params'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     151 |                 struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
         |                                                          ^
>> drivers/mtd/spi-nor/issi.c:151:35: error: incompatible integer to pointer conversion initializing 'struct spi_nor_flash_parameter *' with an expression of type 'int' [-Wint-conversion]
     151 |                 struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
         |                                                 ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/mtd/spi-nor/issi.c:155:11: error: no member named 'phy_enable' in 'struct spi_nor_flash_parameter'
     155 |                 params->phy_enable = spi_nor_issi_phy_enable;
         |                 ~~~~~~  ^
   drivers/mtd/spi-nor/issi.c:160:44: error: call to undeclared function 'spi_nor_get_params'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     160 |                 struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
         |                                                          ^
   drivers/mtd/spi-nor/issi.c:160:35: error: incompatible integer to pointer conversion initializing 'struct spi_nor_flash_parameter *' with an expression of type 'int' [-Wint-conversion]
     160 |                 struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
         |                                                 ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/mtd/spi-nor/issi.c:165:16: error: use of undeclared identifier 'SPINOR_OP_IS_DTR_RD'
     165 |                                                                 0, 20, SPINOR_OP_IS_DTR_RD,
         |                                                                        ^~~~~~~~~~~~~~~~~~~
>> drivers/mtd/spi-nor/issi.c:314:16: error: use of undeclared identifier 'USE_FSR'
     314 |                 .mfr_flags = USE_FSR,
         |                              ^~~~~~~
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.


vim +/SPINOR_IS_EXSPI +22 drivers/mtd/spi-nor/issi.c

    10	
    11	
    12	static int spi_nor_issi_phy_enable(struct spi_nor *nor)
    13	{
    14			struct spi_mem_op op;
    15			u8 *buf = nor->bouncebuf;
    16			int ret;
    17	
    18			ret = spi_nor_write_enable(nor);
    19			if (ret)
    20				goto ret;
    21	
  > 22			buf[0] = SPINOR_IS_EXSPI;
    23	
    24			op = (struct spi_mem_op)
  > 25					SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_IS_WR_ANY_REG, 1),
  > 26					SPI_MEM_OP_ADDR(4, SPINOR_REG_IS_CFR0V, 1),
    27					SPI_MEM_OP_NO_DUMMY,
    28					SPI_MEM_OP_DATA_OUT(1, buf, 1));
    29	
    30			spi_nor_spimem_setup_op(nor, &op, SNOR_PROTO_1_1_1);
    31	
    32			ret = spi_mem_exec_op(nor->spimem, &op);
    33			if (ret)
    34				goto ret;
    35	
  > 36			nor->spimem->spi->controller->flags |= SPI_CONTROLLER_SDR_PHY;
    37			/* Read flash ID to make sure the switch was successful. */
    38			op = (struct spi_mem_op)
    39					SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RDID, 1),
    40							SPI_MEM_OP_NO_ADDR,
    41							SPI_MEM_OP_DUMMY(0, 1),
    42							SPI_MEM_OP_DATA_IN(nor->info->id->len, buf, 1));
    43	
    44			spi_nor_spimem_setup_op(nor, &op, SNOR_PROTO_1_1_1);
    45	
    46			ret = spi_mem_exec_op(nor->spimem, &op);
    47			if (ret)
    48				goto ret;
    49	
    50			if (memcmp(buf, nor->info->id->bytes, nor->info->id->len))
    51				goto ret;
    52	
    53			return 0;
    54	ret:
    55			nor->spimem->spi->controller->flags &= ~SPI_CONTROLLER_SDR_PHY;
    56			return 0;
    57	}
    58	
    59	static int spi_nor_issi_octal_dtr_enable(struct spi_nor *nor, bool enable)
    60	{
    61			struct spi_mem_op op;
    62			u8 *buf = nor->bouncebuf;
    63			int ret;
    64	
    65			if (enable) {
    66				/* Use 20 dummy cycles for memory array reads. */
    67				ret = spi_nor_write_enable(nor);
    68				if (ret)
    69					return ret;
    70	
    71				*buf = 20;
    72				op = (struct spi_mem_op)
    73					SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_IS_WR_ANY_REG, 1),
  > 74						SPI_MEM_OP_ADDR(3, SPINOR_REG_IS_CFR1V, 1),
    75						SPI_MEM_OP_NO_DUMMY,
    76						SPI_MEM_OP_DATA_OUT(1, buf, 1));
    77	
    78				ret = spi_mem_exec_op(nor->spimem, &op);
    79				if (ret)
    80					return ret;
    81	
    82				ret = spi_nor_wait_till_ready(nor);
    83				if (ret)
    84					return ret;
    85			}
    86	
    87			ret = spi_nor_write_enable(nor);
    88			if (ret)
    89				return ret;
    90	
    91			if (enable)
  > 92				*buf = SPINOR_IS_OCT_DTR;
    93			else
    94				*buf = SPINOR_IS_EXSPI;
    95	
    96			op = (struct spi_mem_op)
    97				SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_IS_WR_ANY_REG, 1),
    98						SPI_MEM_OP_ADDR(enable ? 3 : 4,
    99								SPINOR_REG_IS_CFR0V, 1),
   100						SPI_MEM_OP_NO_DUMMY,
   101						SPI_MEM_OP_DATA_OUT(1, buf, 1));
   102	
   103			if (!enable)
   104				spi_nor_spimem_setup_op(nor, &op, SNOR_PROTO_8_8_8_DTR);
   105	
   106			ret = spi_mem_exec_op(nor->spimem, &op);
   107			if (ret)
   108				return ret;
   109	
 > 110			if ((nor->flags & SNOR_F_HAS_STACKED) && nor->spimem->spi->cs_index_mask == 1)
   111				return 0;
   112	
   113			/* Read flash ID to make sure the switch was successful. */
   114			op = (struct spi_mem_op)
   115				SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RDID, 1),
   116						SPI_MEM_OP_NO_ADDR,
   117						SPI_MEM_OP_DUMMY(enable ? 8 : 0, 1),
   118						SPI_MEM_OP_DATA_IN(round_up(nor->info->id->len, 2),
   119										buf, 1));
   120	
   121			if (enable)
   122				spi_nor_spimem_setup_op(nor, &op, SNOR_PROTO_8_8_8_DTR);
   123	
   124			ret = spi_mem_exec_op(nor->spimem, &op);
   125			if (ret)
   126				return ret;
   127	
   128			if (memcmp(buf, nor->info->id->bytes, nor->info->id->len))
   129				return -EINVAL;
   130	
   131			return 0;
   132	}
   133	
   134	static int is25wx256_set_4byte_addr_mode(struct spi_nor *nor, bool enable)
   135	{
   136			int ret;
   137	
   138			ret = spi_nor_write_enable(nor);
   139			if (ret)
   140				return ret;
   141	
   142			ret = spi_nor_set_4byte_addr_mode(nor, enable);
   143			if (ret)
   144				return ret;
   145	
   146			return spi_nor_write_disable(nor);
   147	}
   148	
   149	static void is25wx256_default_init(struct spi_nor *nor)
   150	{
 > 151			struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
   152	
   153			params->set_octal_dtr = spi_nor_issi_octal_dtr_enable;
   154			params->set_4byte_addr_mode = is25wx256_set_4byte_addr_mode;
 > 155			params->phy_enable = spi_nor_issi_phy_enable;
   156	}
   157	
   158	static int is25wx256_post_sfdp_fixup(struct spi_nor *nor)
   159	{
   160			struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
   161	
   162			/* Set the Fast Read settings. */
   163			params->hwcaps.mask |= SNOR_HWCAPS_READ_8_8_8_DTR;
   164			spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_8_8_8_DTR],
 > 165									0, 20, SPINOR_OP_IS_DTR_RD,
   166									SNOR_PROTO_8_8_8_DTR);
   167	
   168			nor->cmd_ext_type = SPI_NOR_EXT_REPEAT;
   169			params->rdsr_dummy = 8;
   170			params->rdsr_addr_nbytes = 0;
   171	
   172			/*
   173			 * The BFPT quad enable field is set to a reserved value so the quad
   174			 * enable function is ignored by spi_nor_parse_bfpt(). Make sure we
   175			 * disable it.
   176			 */
   177			params->quad_enable = NULL;
   178	
   179			return 0;
   180	}
   181	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
