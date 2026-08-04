Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D385C55172
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Aug 2026 06:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0A7tJw7RRCHjoEjojlNa3+92F7dMR9fXwfiYYFU5aNM=; b=ZiirmYlg7d9XNM
	jjFNnhxuRtngmb+TEaUgKLXc5wtNGuf9eooPweKsZw1Tn8ixMBke+9q67MF5frTpn72zHF1JIssbs
	Ajs53h0adYg/ltAD3fGo/M4cdl2Zeg77goQvMwJlRFvBniOKA9WTBo2I2UpTgM+BFDEQkhSG7ZM2Q
	RGAEGfTW82SVbzeFe5WqyjaiNR16MkDq3TcR6a7KZxUvgMV0HuZkO9GPHIH3Yx2fljeo3o1crbpMc
	y9rVMGnBSTugnmiK4dyLd56poQwa7mkWDEDPLpgO/XJQYKQI8uJ53e9hgv5GA0aL65V/qfZrlN2ry
	dYwHg83ho2zOFqlqvhCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr8KH-000000015br-1m87;
	Tue, 04 Aug 2026 06:08:33 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr8KD-000000015bL-3R1N
	for linux-mtd@lists.infradead.org;
	Tue, 04 Aug 2026 06:08:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785823710; x=1817359710;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zEQrHaytG+OaqSmPeDLKgFjHXDyJddLm/aWsMgJLT4c=;
  b=BDM0MR3HmfpCHVGoFJyDi5mN8Eg7sH1B0IEmHDJYlXF0sW/KJpIFhyni
   OeLd5qrFiiaG44bI+J7KuW889XrSiIFfJb5+CPBX5cFdGvx5KoBQcR0Bu
   FzYp5X7GOkREBGsOOR9jPxZeHNVWEN2CYn2HzBzr3s4lKMr3yUsF1xq5E
   FWrlcHsl2eyKbK8AIHyuScrEug4AsMuXhv9Vwx9xtPD6HUsTf0tlPVkI8
   8WcwMYttbb1O2xWHLzER7FZm96o6X3ftvrC7/z4QW5k4lXHAUnulaYfy9
   1P7UvlJtdCHBK/YqtGJuK8yu53Msp16AlYyGiQ3X6M5cq3ddQvCnS2Qvs
   g==;
X-CSE-ConnectionGUID: dj2PWr7ARZWtbArqt3LUTg==
X-CSE-MsgGUID: vx9hC1pASzS7FuW7UnKpog==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="86242892"
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; 
   d="scan'208";a="86242892"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2026 23:08:28 -0700
X-CSE-ConnectionGUID: BBMrOBYrQdif5Qof2Sy1pg==
X-CSE-MsgGUID: oTFjm2/LQMy8dOR8h8/XXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; 
   d="scan'208";a="260174308"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 03 Aug 2026 23:08:26 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wr8K7-0000000095R-1LCR;
	Tue, 04 Aug 2026 06:08:23 +0000
Date: Tue, 4 Aug 2026 14:08:12 +0800
From: kernel test robot <lkp@intel.com>
To: Jeffrey Yu <jeyu@issi.com>,
	"marek.vasut@gmail.com" <marek.vasut@gmail.com>,
	"tudor.ambarus@microchip.com" <tudor.ambarus@microchip.com>
Cc: oe-kbuild-all@lists.linux.dev,
	"dwmw2@infradead.org" <dwmw2@infradead.org>,
	"computersforpeace@gmail.com" <computersforpeace@gmail.com>,
	"bbrezillon@kernel.org" <bbrezillon@kernel.org>,
	"richard@nod.at" <richard@nod.at>,
	open list <linux-kernel@vger.kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] Add JEDEC ID table entries for additional ISSI SPI-NOR
   devices. Additionally added several structs to support ISSI octal flash
  functionality. (Octal SPI 2026 revised)
Message-ID: <202608041352.DkGtf1aE-lkp@intel.com>
References: <LV8PR19MB85976C665A59A0DEBAF4F285B6EF2@LV8PR19MB8597.namprd19.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <LV8PR19MB85976C665A59A0DEBAF4F285B6EF2@LV8PR19MB8597.namprd19.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_230829_882598_6D2896A0 
X-CRM114-Status: GOOD (  19.26  )
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
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20260804/202608041352.DkGtf1aE-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260804/202608041352.DkGtf1aE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608041352.DkGtf1aE-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mtd/spi-nor/issi.c: In function 'spi_nor_issi_phy_enable':
>> drivers/mtd/spi-nor/issi.c:22:26: error: 'SPINOR_IS_EXSPI' undeclared (first use in this function); did you mean 'SPINOR_OP_EX4B'?
      22 |                 buf[0] = SPINOR_IS_EXSPI;
         |                          ^~~~~~~~~~~~~~~
         |                          SPINOR_OP_EX4B
   drivers/mtd/spi-nor/issi.c:22:26: note: each undeclared identifier is reported only once for each function it appears in
   In file included from include/linux/mtd/spi-nor.h:11,
                    from drivers/mtd/spi-nor/issi.c:7:
>> drivers/mtd/spi-nor/issi.c:25:59: error: 'SPINOR_OP_IS_WR_ANY_REG' undeclared (first use in this function)
      25 |                                 SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_IS_WR_ANY_REG, 1),
         |                                                           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spi/spi-mem.h:219:24: note: in definition of macro 'SPI_MEM_OP'
     219 |                 .cmd = __cmd,                                   \
         |                        ^~~~~
   drivers/mtd/spi-nor/issi.c:25:44: note: in expansion of macro 'SPI_MEM_OP_CMD'
      25 |                                 SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_IS_WR_ANY_REG, 1),
         |                                            ^~~~~~~~~~~~~~
>> drivers/mtd/spi-nor/issi.c:26:52: error: 'SPINOR_REG_IS_CFR0V' undeclared (first use in this function)
      26 |                                 SPI_MEM_OP_ADDR(4, SPINOR_REG_IS_CFR0V, 1),
         |                                                    ^~~~~~~~~~~~~~~~~~~
   include/linux/spi/spi-mem.h:220:25: note: in definition of macro 'SPI_MEM_OP'
     220 |                 .addr = __addr,                                 \
         |                         ^~~~~~
   drivers/mtd/spi-nor/issi.c:26:33: note: in expansion of macro 'SPI_MEM_OP_ADDR'
      26 |                                 SPI_MEM_OP_ADDR(4, SPINOR_REG_IS_CFR0V, 1),
         |                                 ^~~~~~~~~~~~~~~
>> drivers/mtd/spi-nor/issi.c:36:56: error: 'SPI_CONTROLLER_SDR_PHY' undeclared (first use in this function); did you mean 'SPI_CONTROLLER_NO_TX'?
      36 |                 nor->spimem->spi->controller->flags |= SPI_CONTROLLER_SDR_PHY;
         |                                                        ^~~~~~~~~~~~~~~~~~~~~~
         |                                                        SPI_CONTROLLER_NO_TX
   drivers/mtd/spi-nor/issi.c: In function 'spi_nor_issi_octal_dtr_enable':
   drivers/mtd/spi-nor/issi.c:73:59: error: 'SPINOR_OP_IS_WR_ANY_REG' undeclared (first use in this function)
      73 |                                 SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_IS_WR_ANY_REG, 1),
         |                                                           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spi/spi-mem.h:219:24: note: in definition of macro 'SPI_MEM_OP'
     219 |                 .cmd = __cmd,                                   \
         |                        ^~~~~
   drivers/mtd/spi-nor/issi.c:73:44: note: in expansion of macro 'SPI_MEM_OP_CMD'
      73 |                                 SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_IS_WR_ANY_REG, 1),
         |                                            ^~~~~~~~~~~~~~
>> drivers/mtd/spi-nor/issi.c:74:60: error: 'SPINOR_REG_IS_CFR1V' undeclared (first use in this function)
      74 |                                         SPI_MEM_OP_ADDR(3, SPINOR_REG_IS_CFR1V, 1),
         |                                                            ^~~~~~~~~~~~~~~~~~~
   include/linux/spi/spi-mem.h:220:25: note: in definition of macro 'SPI_MEM_OP'
     220 |                 .addr = __addr,                                 \
         |                         ^~~~~~
   drivers/mtd/spi-nor/issi.c:74:41: note: in expansion of macro 'SPI_MEM_OP_ADDR'
      74 |                                         SPI_MEM_OP_ADDR(3, SPINOR_REG_IS_CFR1V, 1),
         |                                         ^~~~~~~~~~~~~~~
>> drivers/mtd/spi-nor/issi.c:92:32: error: 'SPINOR_IS_OCT_DTR' undeclared (first use in this function)
      92 |                         *buf = SPINOR_IS_OCT_DTR;
         |                                ^~~~~~~~~~~~~~~~~
   drivers/mtd/spi-nor/issi.c:94:32: error: 'SPINOR_IS_EXSPI' undeclared (first use in this function); did you mean 'SPINOR_OP_EX4B'?
      94 |                         *buf = SPINOR_IS_EXSPI;
         |                                ^~~~~~~~~~~~~~~
         |                                SPINOR_OP_EX4B
   drivers/mtd/spi-nor/issi.c:99:57: error: 'SPINOR_REG_IS_CFR0V' undeclared (first use in this function)
      99 |                                                         SPINOR_REG_IS_CFR0V, 1),
         |                                                         ^~~~~~~~~~~~~~~~~~~
   include/linux/spi/spi-mem.h:220:25: note: in definition of macro 'SPI_MEM_OP'
     220 |                 .addr = __addr,                                 \
         |                         ^~~~~~
   drivers/mtd/spi-nor/issi.c:98:41: note: in expansion of macro 'SPI_MEM_OP_ADDR'
      98 |                                         SPI_MEM_OP_ADDR(enable ? 3 : 4,
         |                                         ^~~~~~~~~~~~~~~
>> drivers/mtd/spi-nor/issi.c:110:35: error: 'SNOR_F_HAS_STACKED' undeclared (first use in this function); did you mean 'SNOR_F_HAS_LOCK'?
     110 |                 if ((nor->flags & SNOR_F_HAS_STACKED) && nor->spimem->spi->cs_index_mask == 1)
         |                                   ^~~~~~~~~~~~~~~~~~
         |                                   SNOR_F_HAS_LOCK
   drivers/mtd/spi-nor/issi.c: In function 'is25wx256_default_init':
>> drivers/mtd/spi-nor/issi.c:151:58: error: implicit declaration of function 'spi_nor_get_params' [-Wimplicit-function-declaration]
     151 |                 struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
         |                                                          ^~~~~~~~~~~~~~~~~~
>> drivers/mtd/spi-nor/issi.c:151:58: error: initialization of 'struct spi_nor_flash_parameter *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>> drivers/mtd/spi-nor/issi.c:155:23: error: 'struct spi_nor_flash_parameter' has no member named 'phy_enable'
     155 |                 params->phy_enable = spi_nor_issi_phy_enable;
         |                       ^~
   drivers/mtd/spi-nor/issi.c: In function 'is25wx256_post_sfdp_fixup':
   drivers/mtd/spi-nor/issi.c:160:58: error: initialization of 'struct spi_nor_flash_parameter *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     160 |                 struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
         |                                                          ^~~~~~~~~~~~~~~~~~
>> drivers/mtd/spi-nor/issi.c:165:72: error: 'SPINOR_OP_IS_DTR_RD' undeclared (first use in this function); did you mean 'SPINOR_OP_ESECR'?
     165 |                                                                 0, 20, SPINOR_OP_IS_DTR_RD,
         |                                                                        ^~~~~~~~~~~~~~~~~~~
         |                                                                        SPINOR_OP_ESECR
   drivers/mtd/spi-nor/issi.c: At top level:
>> drivers/mtd/spi-nor/issi.c:314:30: error: 'USE_FSR' undeclared here (not in a function)
     314 |                 .mfr_flags = USE_FSR,
         |                              ^~~~~~~


vim +22 drivers/mtd/spi-nor/issi.c

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
