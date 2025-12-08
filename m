Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59EBAD3B7E7
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Dec 2025 13:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=co6DFodqfum7lj5o2YwNs0m/656RVgvm1tAHaoz/AuY=; b=En56P7mrK3A9Gu
	CvoiO61jURRB788vugjWcyUeaTofJvnnffMKZP7yIf9rqPvfH+MA1RTwHiQl2p3KA8r6jyVEs3xNP
	+nbkFJXUe5Dfx/ZfIDGjxY0PVFsbWacHKEd5YttIiwn+3R6mu7kv9uSRGbr8ucU8LIU+4Qr2C7D1e
	qlIsLhNITxrK6GhTVN0+mw4FHNH7ppimafxzWH3QVV2xQmwk0HeSxdVv4eacZ/G42ihXzqNmhGdXm
	Ge13p8cMDB/+0VOX1iG5R4lSoRIpX9bO4gIQs85o6YbV0GfO/MfvbwSoE2X+wPyDNlwEGps8ulYqN
	sW9Y+EpNoCp1N11HFjSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSbhD-0000000D9Ve-0fLM;
	Mon, 08 Dec 2025 13:54:35 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSbhA-0000000D9VA-0b2T
	for linux-mtd@lists.infradead.org;
	Mon, 08 Dec 2025 13:54:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765202072; x=1796738072;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gpglD6pwxNu2akfLdmVhQJU7XaTR8DVY8V/sajvWksw=;
  b=Pu/LYC+zfMm0VOHZgzjTSjvn2JA+RnVmXMVL/eiyMuTwJHE6vjnriq1r
   FFtpP9p3UZH7guEVFzeDRU4BVIk07D3cTEA1BU4LRoOGxWE7NNVt2BJMa
   PdpPl9VkaJoKu76CMPqLbOdeVTJjVexBCxIsCDnEpCPNDRkvqyxRDisLB
   vaukkveXW5dkkIkEuuaCwiNgNHSKLsSShOUvL0Yhcp5mueG9ceSCi+nhN
   ZFDdPUSSDBTnnMhYx2fK6jgTowjxlHM0dwmyUm33alkRZ517YkauKpGY7
   dBczQILMvzH4BOdf0oitmM0UeZ7vrmroYHJj+OUKVkCk8OEAJREulrTVJ
   A==;
X-CSE-ConnectionGUID: tZayu0bhQE+YMK13eIbPug==
X-CSE-MsgGUID: EEvVjOGJT4W8D7snw2Px1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="84548631"
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; 
   d="scan'208";a="84548631"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 05:54:31 -0800
X-CSE-ConnectionGUID: //x4GBVaTYiWensoVAbQhA==
X-CSE-MsgGUID: NwMv2bIYRbmaWx0JFUuaaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; 
   d="scan'208";a="200108361"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 08 Dec 2025 05:54:29 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSbh3-000000000RR-3z8V;
	Mon, 08 Dec 2025 13:54:25 +0000
Date: Mon, 8 Dec 2025 21:53:50 +0800
From: kernel test robot <lkp@intel.com>
To: Ahmed Naseef <naseefkm@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ahmed Naseef <naseefkm@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: spinand: add support for Dosilicon DS35Q1GA/DS35M1GA
Message-ID: <202512082140.yQUnjGPP-lkp@intel.com>
References: <20251207150923.86328-1-naseefkm@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251207150923.86328-1-naseefkm@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_055432_284709_DF0421EE 
X-CRM114-Status: GOOD (  11.96  )
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

Hi Ahmed,

kernel test robot noticed the following build errors:

[auto build test ERROR on mtd/nand/next]
[also build test ERROR on linus/master next-20251208]
[cannot apply to v6.18]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ahmed-Naseef/mtd-spinand-add-support-for-Dosilicon-DS35Q1GA-DS35M1GA/20251207-232019
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next
patch link:    https://lore.kernel.org/r/20251207150923.86328-1-naseefkm%40gmail.com
patch subject: [PATCH] mtd: spinand: add support for Dosilicon DS35Q1GA/DS35M1GA
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20251208/202512082140.yQUnjGPP-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251208/202512082140.yQUnjGPP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512082140.yQUnjGPP-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/mtd/nand/spi/dosilicon.c:8:
   In file included from include/linux/mtd/spinand.h:16:
   In file included from include/linux/spi/spi.h:17:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> drivers/mtd/nand/spi/dosilicon.c:13:3: error: call to undeclared function 'SPINAND_PAGE_READ_FROM_CACHE_X4_OP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      13 |                 SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
         |                 ^
>> drivers/mtd/nand/spi/dosilicon.c:14:3: error: call to undeclared function 'SPINAND_PAGE_READ_FROM_CACHE_X2_OP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      14 |                 SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
         |                 ^
>> drivers/mtd/nand/spi/dosilicon.c:15:3: error: call to undeclared function 'SPINAND_PAGE_READ_FROM_CACHE_OP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      15 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0),
         |                 ^
>> drivers/mtd/nand/spi/dosilicon.c:13:3: warning: suggest braces around initialization of subobject [-Wmissing-braces]
      12 | static SPINAND_OP_VARIANTS(read_cache_variants,
         |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      13 |                 SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 {
      14 |                 SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      15 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0),
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      16 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, 0));
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:389:34: note: expanded from macro 'SPINAND_OP_VARIANTS'
     389 |                 .ops = (struct spi_mem_op[]) { __VA_ARGS__ },           \
         |                                                ^~~~~~~~~~~
>> drivers/mtd/nand/spi/dosilicon.c:13:3: warning: suggest braces around initialization of subobject [-Wmissing-braces]
      12 | static SPINAND_OP_VARIANTS(read_cache_variants,
         |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      13 |                 SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 {
      14 |                 SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      15 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0),
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      16 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, 0));
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:389:34: note: expanded from macro 'SPINAND_OP_VARIANTS'
     389 |                 .ops = (struct spi_mem_op[]) { __VA_ARGS__ },           \
         |                                                ^~~~~~~~~~~
>> drivers/mtd/nand/spi/dosilicon.c:13:3: error: initializer element is not a compile-time constant
      12 | static SPINAND_OP_VARIANTS(read_cache_variants,
         |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      13 |                 SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      14 |                 SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      15 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0),
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      16 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, 0));
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:389:34: note: expanded from macro 'SPINAND_OP_VARIANTS'
     389 |                 .ops = (struct spi_mem_op[]) { __VA_ARGS__ },           \
         |                                                ^~~~~~~~~~~
>> drivers/mtd/nand/spi/dosilicon.c:13:3: warning: suggest braces around initialization of subobject [-Wmissing-braces]
      12 | static SPINAND_OP_VARIANTS(read_cache_variants,
         |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      13 |                 SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 {
      14 |                 SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      15 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0),
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      16 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, 0));
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:390:41: note: expanded from macro 'SPINAND_OP_VARIANTS'
     390 |                 .nops = sizeof((struct spi_mem_op[]){ __VA_ARGS__ }) /  \
         |                                                       ^~~~~~~~~~~
>> drivers/mtd/nand/spi/dosilicon.c:13:3: warning: suggest braces around initialization of subobject [-Wmissing-braces]
      12 | static SPINAND_OP_VARIANTS(read_cache_variants,
         |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      13 |                 SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 {
      14 |                 SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      15 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0),
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      16 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, 0));
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:390:41: note: expanded from macro 'SPINAND_OP_VARIANTS'
     390 |                 .nops = sizeof((struct spi_mem_op[]){ __VA_ARGS__ }) /  \
         |                                                       ^~~~~~~~~~~
>> drivers/mtd/nand/spi/dosilicon.c:13:3: error: initializer element is not a compile-time constant
      12 | static SPINAND_OP_VARIANTS(read_cache_variants,
         |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      13 |                 SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      14 |                 SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      15 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0),
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      16 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, 0));
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:390:41: note: expanded from macro 'SPINAND_OP_VARIANTS'
     390 |                 .nops = sizeof((struct spi_mem_op[]){ __VA_ARGS__ }) /  \
         |                                                       ^~~~~~~~~~~
>> drivers/mtd/nand/spi/dosilicon.c:19:3: error: call to undeclared function 'SPINAND_PROG_LOAD_X4'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      19 |                 SPINAND_PROG_LOAD_X4(true, 0, NULL, 0),
         |                 ^
>> drivers/mtd/nand/spi/dosilicon.c:20:3: error: call to undeclared function 'SPINAND_PROG_LOAD'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      20 |                 SPINAND_PROG_LOAD(true, 0, NULL, 0));
         |                 ^
   drivers/mtd/nand/spi/dosilicon.c:19:3: warning: suggest braces around initialization of subobject [-Wmissing-braces]
      18 | static SPINAND_OP_VARIANTS(write_cache_variants,
         |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      19 |                 SPINAND_PROG_LOAD_X4(true, 0, NULL, 0),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 {
      20 |                 SPINAND_PROG_LOAD(true, 0, NULL, 0));
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:389:34: note: expanded from macro 'SPINAND_OP_VARIANTS'
     389 |                 .ops = (struct spi_mem_op[]) { __VA_ARGS__ },           \
         |                                                ^~~~~~~~~~~
   drivers/mtd/nand/spi/dosilicon.c:19:3: warning: suggest braces around initialization of subobject [-Wmissing-braces]
      18 | static SPINAND_OP_VARIANTS(write_cache_variants,
         |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      19 |                 SPINAND_PROG_LOAD_X4(true, 0, NULL, 0),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 {
      20 |                 SPINAND_PROG_LOAD(true, 0, NULL, 0));
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:389:34: note: expanded from macro 'SPINAND_OP_VARIANTS'
     389 |                 .ops = (struct spi_mem_op[]) { __VA_ARGS__ },           \
         |                                                ^~~~~~~~~~~
   drivers/mtd/nand/spi/dosilicon.c:19:3: error: initializer element is not a compile-time constant
      18 | static SPINAND_OP_VARIANTS(write_cache_variants,
         |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      19 |                 SPINAND_PROG_LOAD_X4(true, 0, NULL, 0),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      20 |                 SPINAND_PROG_LOAD(true, 0, NULL, 0));
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:389:34: note: expanded from macro 'SPINAND_OP_VARIANTS'
     389 |                 .ops = (struct spi_mem_op[]) { __VA_ARGS__ },           \
         |                                                ^~~~~~~~~~~
   drivers/mtd/nand/spi/dosilicon.c:19:3: warning: suggest braces around initialization of subobject [-Wmissing-braces]
      18 | static SPINAND_OP_VARIANTS(write_cache_variants,
         |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      19 |                 SPINAND_PROG_LOAD_X4(true, 0, NULL, 0),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 {
      20 |                 SPINAND_PROG_LOAD(true, 0, NULL, 0));
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:390:41: note: expanded from macro 'SPINAND_OP_VARIANTS'
     390 |                 .nops = sizeof((struct spi_mem_op[]){ __VA_ARGS__ }) /  \
         |                                                       ^~~~~~~~~~~
   drivers/mtd/nand/spi/dosilicon.c:19:3: warning: suggest braces around initialization of subobject [-Wmissing-braces]
      18 | static SPINAND_OP_VARIANTS(write_cache_variants,
         |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      19 |                 SPINAND_PROG_LOAD_X4(true, 0, NULL, 0),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 {
      20 |                 SPINAND_PROG_LOAD(true, 0, NULL, 0));
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:390:41: note: expanded from macro 'SPINAND_OP_VARIANTS'
     390 |                 .nops = sizeof((struct spi_mem_op[]){ __VA_ARGS__ }) /  \
         |                                                       ^~~~~~~~~~~
   drivers/mtd/nand/spi/dosilicon.c:19:3: error: initializer element is not a compile-time constant
      18 | static SPINAND_OP_VARIANTS(write_cache_variants,
         |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      19 |                 SPINAND_PROG_LOAD_X4(true, 0, NULL, 0),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      20 |                 SPINAND_PROG_LOAD(true, 0, NULL, 0));
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:390:41: note: expanded from macro 'SPINAND_OP_VARIANTS'
     390 |                 .nops = sizeof((struct spi_mem_op[]){ __VA_ARGS__ }) /  \
         |                                                       ^~~~~~~~~~~
   drivers/mtd/nand/spi/dosilicon.c:23:3: warning: suggest braces around initialization of subobject [-Wmissing-braces]
      22 | static SPINAND_OP_VARIANTS(update_cache_variants,
         |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      23 |                 SPINAND_PROG_LOAD_X4(false, 0, NULL, 0),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 {
      24 |                 SPINAND_PROG_LOAD(false, 0, NULL, 0));
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:389:34: note: expanded from macro 'SPINAND_OP_VARIANTS'
     389 |                 .ops = (struct spi_mem_op[]) { __VA_ARGS__ },           \
         |                                                ^~~~~~~~~~~
   drivers/mtd/nand/spi/dosilicon.c:23:3: warning: suggest braces around initialization of subobject [-Wmissing-braces]
      22 | static SPINAND_OP_VARIANTS(update_cache_variants,
         |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      23 |                 SPINAND_PROG_LOAD_X4(false, 0, NULL, 0),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 {
      24 |                 SPINAND_PROG_LOAD(false, 0, NULL, 0));
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:389:34: note: expanded from macro 'SPINAND_OP_VARIANTS'
     389 |                 .ops = (struct spi_mem_op[]) { __VA_ARGS__ },           \
         |                                                ^~~~~~~~~~~
   drivers/mtd/nand/spi/dosilicon.c:23:3: error: initializer element is not a compile-time constant
      22 | static SPINAND_OP_VARIANTS(update_cache_variants,
         |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      23 |                 SPINAND_PROG_LOAD_X4(false, 0, NULL, 0),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      24 |                 SPINAND_PROG_LOAD(false, 0, NULL, 0));
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:389:34: note: expanded from macro 'SPINAND_OP_VARIANTS'
     389 |                 .ops = (struct spi_mem_op[]) { __VA_ARGS__ },           \
         |                                                ^~~~~~~~~~~
   drivers/mtd/nand/spi/dosilicon.c:23:3: warning: suggest braces around initialization of subobject [-Wmissing-braces]
      22 | static SPINAND_OP_VARIANTS(update_cache_variants,


vim +/SPINAND_PAGE_READ_FROM_CACHE_X4_OP +13 drivers/mtd/nand/spi/dosilicon.c

   > 8	#include <linux/mtd/spinand.h>
     9	
    10	#define SPINAND_MFR_DOSILICON        0xE5
    11	
    12	static SPINAND_OP_VARIANTS(read_cache_variants,
  > 13			SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
  > 14			SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
  > 15			SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0),
    16			SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, 0));
    17	
    18	static SPINAND_OP_VARIANTS(write_cache_variants,
  > 19			SPINAND_PROG_LOAD_X4(true, 0, NULL, 0),
  > 20			SPINAND_PROG_LOAD(true, 0, NULL, 0));
    21	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
