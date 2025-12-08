Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5E49D3B7EA
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Dec 2025 19:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8t1kzfIVDBkO6zDPoGcIeAEXAKSiBAk8yiBteP08tK8=; b=1TLvsENpzX4pjM
	tDCBurZLxBsvWQqE7nncq+2TxQpvaxWHnfgToBGMEAZK6/DhyPrDLM4WVeHBu0I3A601kUxQwD5h1
	uLXTUu2bl+5UyZfdoUqaQTX2UWsBPCo1kIaGYLGmKUyevjYBB8Qc0N0E0rjPFnyhnW0ArPaAp95Cv
	BHJPhJo4cYPuPSC7ixP3ZTqKM+T+dXJGn4cfq9HyP+f5kiQpgjDk+8VF7/68WP0qlWjUFlsE6FpdD
	rv+F2BFb4pgbNh3ftH13Bg4XwtgsQDvxSaFmzgY48kz78o/zBrLXDUhIWXrNjoh4YBvGM28Hn85ib
	K0E0brzUKDYQu/8RDPgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSh9V-0000000DTmq-29S8;
	Mon, 08 Dec 2025 19:44:09 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSh9Q-0000000DTm5-2OWF
	for linux-mtd@lists.infradead.org;
	Mon, 08 Dec 2025 19:44:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765223044; x=1796759044;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wcMnMtK161kIDworbzGp6TgxmSb4xyAnFrgCUDSvOEQ=;
  b=gvUMaBLOXNypz21sGjLnK7A+nFPNVQZG7yRJIY6v2Pb6qEzNC9Py9e1S
   rnezsRuU5ZUUemgzhbQrlxM+4KgSSy9SRkOPiau8JSgCGiVDwISkyezaV
   N65olHeGYw5xhl59g2YWCyBSvr/2Ddppg5gap/2D5T/2Uz08fXSGxNVNN
   zLo0opPGCZ4Wh3D7OJN8y0K+p8o9W5n5jdUTiEanhC1XhfziUsgtlwG7x
   5kSukVagHWxrOGv8VrmhSGU7/F9pOROqANnZPrw2eRa0RIyv1cASuRv3p
   +Yi3fuUqMFWdeT/HLjoeygGt/urHXVMjfdA8bVCVbhgH4+4H0q3Odzv0o
   A==;
X-CSE-ConnectionGUID: O2FavbrUTxm4CPl+SzLoxA==
X-CSE-MsgGUID: 2H6b4KhpS/WH+DOp6oKsRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="54714109"
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; 
   d="scan'208";a="54714109"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 11:44:03 -0800
X-CSE-ConnectionGUID: YIF/7oclRyuxtqCQCitc+g==
X-CSE-MsgGUID: W+YiVbniQH2zNkOY6n5lmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; 
   d="scan'208";a="195921749"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 08 Dec 2025 11:44:01 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSh9K-000000000ml-0vvU;
	Mon, 08 Dec 2025 19:43:58 +0000
Date: Tue, 9 Dec 2025 03:43:41 +0800
From: kernel test robot <lkp@intel.com>
To: Ahmed Naseef <naseefkm@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Ahmed Naseef <naseefkm@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: spinand: add support for Dosilicon DS35Q1GA/DS35M1GA
Message-ID: <202512090327.X5PXotX9-lkp@intel.com>
References: <20251207150923.86328-1-naseefkm@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251207150923.86328-1-naseefkm@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_114404_697907_3ADE2A83 
X-CRM114-Status: GOOD (  13.12  )
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
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20251209/202512090327.X5PXotX9-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251209/202512090327.X5PXotX9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512090327.X5PXotX9-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/mtd/nand/spi/dosilicon.c:8:
   drivers/mtd/nand/spi/dosilicon.c:13:17: error: implicit declaration of function 'SPINAND_PAGE_READ_FROM_CACHE_X4_OP'; did you mean 'SPINAND_PAGE_READ_FROM_CACHE_1S_1D_4D_OP'? [-Werror=implicit-function-declaration]
      13 |                 SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:389:48: note: in definition of macro 'SPINAND_OP_VARIANTS'
     389 |                 .ops = (struct spi_mem_op[]) { __VA_ARGS__ },           \
         |                                                ^~~~~~~~~~~
   drivers/mtd/nand/spi/dosilicon.c:14:17: error: implicit declaration of function 'SPINAND_PAGE_READ_FROM_CACHE_X2_OP'; did you mean 'SPINAND_PAGE_READ_FROM_CACHE_1S_2S_2S_OP'? [-Werror=implicit-function-declaration]
      14 |                 SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:389:48: note: in definition of macro 'SPINAND_OP_VARIANTS'
     389 |                 .ops = (struct spi_mem_op[]) { __VA_ARGS__ },           \
         |                                                ^~~~~~~~~~~
   drivers/mtd/nand/spi/dosilicon.c:15:17: error: implicit declaration of function 'SPINAND_PAGE_READ_FROM_CACHE_OP'; did you mean 'SPINAND_PAGE_READ_FROM_CACHE_1S_1D_4D_OP'? [-Werror=implicit-function-declaration]
      15 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:389:48: note: in definition of macro 'SPINAND_OP_VARIANTS'
     389 |                 .ops = (struct spi_mem_op[]) { __VA_ARGS__ },           \
         |                                                ^~~~~~~~~~~
>> include/linux/mtd/spinand.h:389:24: warning: missing braces around initializer [-Wmissing-braces]
     389 |                 .ops = (struct spi_mem_op[]) { __VA_ARGS__ },           \
         |                        ^
   drivers/mtd/nand/spi/dosilicon.c:12:8: note: in expansion of macro 'SPINAND_OP_VARIANTS'
      12 | static SPINAND_OP_VARIANTS(read_cache_variants,
         |        ^~~~~~~~~~~~~~~~~~~
>> include/linux/mtd/spinand.h:389:46: error: initializer element is not constant
     389 |                 .ops = (struct spi_mem_op[]) { __VA_ARGS__ },           \
         |                                              ^
   drivers/mtd/nand/spi/dosilicon.c:12:8: note: in expansion of macro 'SPINAND_OP_VARIANTS'
      12 | static SPINAND_OP_VARIANTS(read_cache_variants,
         |        ^~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:389:46: note: (near initialization for 'read_cache_variants')
     389 |                 .ops = (struct spi_mem_op[]) { __VA_ARGS__ },           \
         |                                              ^
   drivers/mtd/nand/spi/dosilicon.c:12:8: note: in expansion of macro 'SPINAND_OP_VARIANTS'
      12 | static SPINAND_OP_VARIANTS(read_cache_variants,
         |        ^~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:390:32: warning: missing braces around initializer [-Wmissing-braces]
     390 |                 .nops = sizeof((struct spi_mem_op[]){ __VA_ARGS__ }) /  \
         |                                ^
   drivers/mtd/nand/spi/dosilicon.c:12:8: note: in expansion of macro 'SPINAND_OP_VARIANTS'
      12 | static SPINAND_OP_VARIANTS(read_cache_variants,
         |        ^~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:390:53: error: initializer element is not constant
     390 |                 .nops = sizeof((struct spi_mem_op[]){ __VA_ARGS__ }) /  \
         |                                                     ^
   drivers/mtd/nand/spi/dosilicon.c:12:8: note: in expansion of macro 'SPINAND_OP_VARIANTS'
      12 | static SPINAND_OP_VARIANTS(read_cache_variants,
         |        ^~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:390:53: note: (near initialization for 'read_cache_variants')
     390 |                 .nops = sizeof((struct spi_mem_op[]){ __VA_ARGS__ }) /  \
         |                                                     ^
   drivers/mtd/nand/spi/dosilicon.c:12:8: note: in expansion of macro 'SPINAND_OP_VARIANTS'
      12 | static SPINAND_OP_VARIANTS(read_cache_variants,
         |        ^~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:388:49: warning: missing braces around initializer [-Wmissing-braces]
     388 |         const struct spinand_op_variants name = {                       \
         |                                                 ^
   drivers/mtd/nand/spi/dosilicon.c:12:8: note: in expansion of macro 'SPINAND_OP_VARIANTS'
      12 | static SPINAND_OP_VARIANTS(read_cache_variants,
         |        ^~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/spi/dosilicon.c:19:17: error: implicit declaration of function 'SPINAND_PROG_LOAD_X4'; did you mean 'SPINAND_CMD_PROG_LOAD_X4'? [-Werror=implicit-function-declaration]
      19 |                 SPINAND_PROG_LOAD_X4(true, 0, NULL, 0),
         |                 ^~~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:389:48: note: in definition of macro 'SPINAND_OP_VARIANTS'
     389 |                 .ops = (struct spi_mem_op[]) { __VA_ARGS__ },           \
         |                                                ^~~~~~~~~~~
   drivers/mtd/nand/spi/dosilicon.c:20:17: error: implicit declaration of function 'SPINAND_PROG_LOAD' [-Werror=implicit-function-declaration]
      20 |                 SPINAND_PROG_LOAD(true, 0, NULL, 0));
         |                 ^~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:389:48: note: in definition of macro 'SPINAND_OP_VARIANTS'
     389 |                 .ops = (struct spi_mem_op[]) { __VA_ARGS__ },           \
         |                                                ^~~~~~~~~~~
>> include/linux/mtd/spinand.h:389:24: warning: missing braces around initializer [-Wmissing-braces]
     389 |                 .ops = (struct spi_mem_op[]) { __VA_ARGS__ },           \
         |                        ^
   drivers/mtd/nand/spi/dosilicon.c:18:8: note: in expansion of macro 'SPINAND_OP_VARIANTS'
      18 | static SPINAND_OP_VARIANTS(write_cache_variants,
         |        ^~~~~~~~~~~~~~~~~~~
>> include/linux/mtd/spinand.h:389:46: error: initializer element is not constant
     389 |                 .ops = (struct spi_mem_op[]) { __VA_ARGS__ },           \
         |                                              ^
   drivers/mtd/nand/spi/dosilicon.c:18:8: note: in expansion of macro 'SPINAND_OP_VARIANTS'
      18 | static SPINAND_OP_VARIANTS(write_cache_variants,
         |        ^~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:389:46: note: (near initialization for 'write_cache_variants')
     389 |                 .ops = (struct spi_mem_op[]) { __VA_ARGS__ },           \
         |                                              ^
   drivers/mtd/nand/spi/dosilicon.c:18:8: note: in expansion of macro 'SPINAND_OP_VARIANTS'
      18 | static SPINAND_OP_VARIANTS(write_cache_variants,
         |        ^~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:390:32: warning: missing braces around initializer [-Wmissing-braces]
     390 |                 .nops = sizeof((struct spi_mem_op[]){ __VA_ARGS__ }) /  \
         |                                ^
   drivers/mtd/nand/spi/dosilicon.c:18:8: note: in expansion of macro 'SPINAND_OP_VARIANTS'
      18 | static SPINAND_OP_VARIANTS(write_cache_variants,
         |        ^~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:390:53: error: initializer element is not constant
     390 |                 .nops = sizeof((struct spi_mem_op[]){ __VA_ARGS__ }) /  \
         |                                                     ^
   drivers/mtd/nand/spi/dosilicon.c:18:8: note: in expansion of macro 'SPINAND_OP_VARIANTS'
      18 | static SPINAND_OP_VARIANTS(write_cache_variants,
         |        ^~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:390:53: note: (near initialization for 'write_cache_variants')
     390 |                 .nops = sizeof((struct spi_mem_op[]){ __VA_ARGS__ }) /  \
         |                                                     ^
   drivers/mtd/nand/spi/dosilicon.c:18:8: note: in expansion of macro 'SPINAND_OP_VARIANTS'
      18 | static SPINAND_OP_VARIANTS(write_cache_variants,
         |        ^~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:388:49: warning: missing braces around initializer [-Wmissing-braces]
     388 |         const struct spinand_op_variants name = {                       \
         |                                                 ^
   drivers/mtd/nand/spi/dosilicon.c:18:8: note: in expansion of macro 'SPINAND_OP_VARIANTS'
      18 | static SPINAND_OP_VARIANTS(write_cache_variants,
         |        ^~~~~~~~~~~~~~~~~~~
>> include/linux/mtd/spinand.h:389:24: warning: missing braces around initializer [-Wmissing-braces]
     389 |                 .ops = (struct spi_mem_op[]) { __VA_ARGS__ },           \
         |                        ^
   drivers/mtd/nand/spi/dosilicon.c:22:8: note: in expansion of macro 'SPINAND_OP_VARIANTS'
      22 | static SPINAND_OP_VARIANTS(update_cache_variants,
         |        ^~~~~~~~~~~~~~~~~~~
>> include/linux/mtd/spinand.h:389:46: error: initializer element is not constant
     389 |                 .ops = (struct spi_mem_op[]) { __VA_ARGS__ },           \
         |                                              ^
   drivers/mtd/nand/spi/dosilicon.c:22:8: note: in expansion of macro 'SPINAND_OP_VARIANTS'
      22 | static SPINAND_OP_VARIANTS(update_cache_variants,
         |        ^~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:389:46: note: (near initialization for 'update_cache_variants')
     389 |                 .ops = (struct spi_mem_op[]) { __VA_ARGS__ },           \
         |                                              ^
   drivers/mtd/nand/spi/dosilicon.c:22:8: note: in expansion of macro 'SPINAND_OP_VARIANTS'
      22 | static SPINAND_OP_VARIANTS(update_cache_variants,
         |        ^~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:390:32: warning: missing braces around initializer [-Wmissing-braces]
     390 |                 .nops = sizeof((struct spi_mem_op[]){ __VA_ARGS__ }) /  \
         |                                ^
   drivers/mtd/nand/spi/dosilicon.c:22:8: note: in expansion of macro 'SPINAND_OP_VARIANTS'
      22 | static SPINAND_OP_VARIANTS(update_cache_variants,
         |        ^~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:390:53: error: initializer element is not constant
     390 |                 .nops = sizeof((struct spi_mem_op[]){ __VA_ARGS__ }) /  \
         |                                                     ^
   drivers/mtd/nand/spi/dosilicon.c:22:8: note: in expansion of macro 'SPINAND_OP_VARIANTS'
      22 | static SPINAND_OP_VARIANTS(update_cache_variants,
         |        ^~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:390:53: note: (near initialization for 'update_cache_variants')
     390 |                 .nops = sizeof((struct spi_mem_op[]){ __VA_ARGS__ }) /  \
         |                                                     ^
   drivers/mtd/nand/spi/dosilicon.c:22:8: note: in expansion of macro 'SPINAND_OP_VARIANTS'
      22 | static SPINAND_OP_VARIANTS(update_cache_variants,
         |        ^~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:388:49: warning: missing braces around initializer [-Wmissing-braces]
     388 |         const struct spinand_op_variants name = {                       \
         |                                                 ^
   drivers/mtd/nand/spi/dosilicon.c:22:8: note: in expansion of macro 'SPINAND_OP_VARIANTS'
      22 | static SPINAND_OP_VARIANTS(update_cache_variants,
         |        ^~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from dosilicon.c:8:
   dosilicon.c:13:17: error: implicit declaration of function 'SPINAND_PAGE_READ_FROM_CACHE_X4_OP'; did you mean 'SPINAND_PAGE_READ_FROM_CACHE_1S_1D_4D_OP'? [-Werror=implicit-function-declaration]
      13 |                 SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:389:48: note: in definition of macro 'SPINAND_OP_VARIANTS'
     389 |                 .ops = (struct spi_mem_op[]) { __VA_ARGS__ },           \
         |                                                ^~~~~~~~~~~
   dosilicon.c:14:17: error: implicit declaration of function 'SPINAND_PAGE_READ_FROM_CACHE_X2_OP'; did you mean 'SPINAND_PAGE_READ_FROM_CACHE_1S_2S_2S_OP'? [-Werror=implicit-function-declaration]
      14 |                 SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:389:48: note: in definition of macro 'SPINAND_OP_VARIANTS'
     389 |                 .ops = (struct spi_mem_op[]) { __VA_ARGS__ },           \
         |                                                ^~~~~~~~~~~
   dosilicon.c:15:17: error: implicit declaration of function 'SPINAND_PAGE_READ_FROM_CACHE_OP'; did you mean 'SPINAND_PAGE_READ_FROM_CACHE_1S_1D_4D_OP'? [-Werror=implicit-function-declaration]
      15 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:389:48: note: in definition of macro 'SPINAND_OP_VARIANTS'
     389 |                 .ops = (struct spi_mem_op[]) { __VA_ARGS__ },           \
         |                                                ^~~~~~~~~~~
>> include/linux/mtd/spinand.h:389:24: warning: missing braces around initializer [-Wmissing-braces]
     389 |                 .ops = (struct spi_mem_op[]) { __VA_ARGS__ },           \
         |                        ^
   dosilicon.c:12:8: note: in expansion of macro 'SPINAND_OP_VARIANTS'
      12 | static SPINAND_OP_VARIANTS(read_cache_variants,
         |        ^~~~~~~~~~~~~~~~~~~
>> include/linux/mtd/spinand.h:389:46: error: initializer element is not constant
     389 |                 .ops = (struct spi_mem_op[]) { __VA_ARGS__ },           \
         |                                              ^
   dosilicon.c:12:8: note: in expansion of macro 'SPINAND_OP_VARIANTS'
      12 | static SPINAND_OP_VARIANTS(read_cache_variants,
         |        ^~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:389:46: note: (near initialization for 'read_cache_variants')
     389 |                 .ops = (struct spi_mem_op[]) { __VA_ARGS__ },           \
         |                                              ^
   dosilicon.c:12:8: note: in expansion of macro 'SPINAND_OP_VARIANTS'
      12 | static SPINAND_OP_VARIANTS(read_cache_variants,
         |        ^~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:390:32: warning: missing braces around initializer [-Wmissing-braces]
     390 |                 .nops = sizeof((struct spi_mem_op[]){ __VA_ARGS__ }) /  \
         |                                ^
   dosilicon.c:12:8: note: in expansion of macro 'SPINAND_OP_VARIANTS'
      12 | static SPINAND_OP_VARIANTS(read_cache_variants,
         |        ^~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:390:53: error: initializer element is not constant
     390 |                 .nops = sizeof((struct spi_mem_op[]){ __VA_ARGS__ }) /  \
         |                                                     ^
   dosilicon.c:12:8: note: in expansion of macro 'SPINAND_OP_VARIANTS'
      12 | static SPINAND_OP_VARIANTS(read_cache_variants,
         |        ^~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:390:53: note: (near initialization for 'read_cache_variants')
     390 |                 .nops = sizeof((struct spi_mem_op[]){ __VA_ARGS__ }) /  \
         |                                                     ^
   dosilicon.c:12:8: note: in expansion of macro 'SPINAND_OP_VARIANTS'
      12 | static SPINAND_OP_VARIANTS(read_cache_variants,
         |        ^~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:388:49: warning: missing braces around initializer [-Wmissing-braces]
     388 |         const struct spinand_op_variants name = {                       \
         |                                                 ^
   dosilicon.c:12:8: note: in expansion of macro 'SPINAND_OP_VARIANTS'
      12 | static SPINAND_OP_VARIANTS(read_cache_variants,
         |        ^~~~~~~~~~~~~~~~~~~
   dosilicon.c:19:17: error: implicit declaration of function 'SPINAND_PROG_LOAD_X4'; did you mean 'SPINAND_CMD_PROG_LOAD_X4'? [-Werror=implicit-function-declaration]
      19 |                 SPINAND_PROG_LOAD_X4(true, 0, NULL, 0),
         |                 ^~~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:389:48: note: in definition of macro 'SPINAND_OP_VARIANTS'
     389 |                 .ops = (struct spi_mem_op[]) { __VA_ARGS__ },           \
         |                                                ^~~~~~~~~~~
   dosilicon.c:20:17: error: implicit declaration of function 'SPINAND_PROG_LOAD' [-Werror=implicit-function-declaration]
      20 |                 SPINAND_PROG_LOAD(true, 0, NULL, 0));
         |                 ^~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:389:48: note: in definition of macro 'SPINAND_OP_VARIANTS'
     389 |                 .ops = (struct spi_mem_op[]) { __VA_ARGS__ },           \
         |                                                ^~~~~~~~~~~
>> include/linux/mtd/spinand.h:389:24: warning: missing braces around initializer [-Wmissing-braces]
     389 |                 .ops = (struct spi_mem_op[]) { __VA_ARGS__ },           \
         |                        ^
   dosilicon.c:18:8: note: in expansion of macro 'SPINAND_OP_VARIANTS'
      18 | static SPINAND_OP_VARIANTS(write_cache_variants,
         |        ^~~~~~~~~~~~~~~~~~~
>> include/linux/mtd/spinand.h:389:46: error: initializer element is not constant
     389 |                 .ops = (struct spi_mem_op[]) { __VA_ARGS__ },           \
         |                                              ^
   dosilicon.c:18:8: note: in expansion of macro 'SPINAND_OP_VARIANTS'
      18 | static SPINAND_OP_VARIANTS(write_cache_variants,
         |        ^~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:389:46: note: (near initialization for 'write_cache_variants')
     389 |                 .ops = (struct spi_mem_op[]) { __VA_ARGS__ },           \
         |                                              ^
   dosilicon.c:18:8: note: in expansion of macro 'SPINAND_OP_VARIANTS'
      18 | static SPINAND_OP_VARIANTS(write_cache_variants,
         |        ^~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:390:32: warning: missing braces around initializer [-Wmissing-braces]
     390 |                 .nops = sizeof((struct spi_mem_op[]){ __VA_ARGS__ }) /  \
         |                                ^
   dosilicon.c:18:8: note: in expansion of macro 'SPINAND_OP_VARIANTS'
      18 | static SPINAND_OP_VARIANTS(write_cache_variants,
         |        ^~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:390:53: error: initializer element is not constant
     390 |                 .nops = sizeof((struct spi_mem_op[]){ __VA_ARGS__ }) /  \
         |                                                     ^
   dosilicon.c:18:8: note: in expansion of macro 'SPINAND_OP_VARIANTS'
      18 | static SPINAND_OP_VARIANTS(write_cache_variants,
         |        ^~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:390:53: note: (near initialization for 'write_cache_variants')
     390 |                 .nops = sizeof((struct spi_mem_op[]){ __VA_ARGS__ }) /  \
         |                                                     ^
   dosilicon.c:18:8: note: in expansion of macro 'SPINAND_OP_VARIANTS'
      18 | static SPINAND_OP_VARIANTS(write_cache_variants,
         |        ^~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:388:49: warning: missing braces around initializer [-Wmissing-braces]
     388 |         const struct spinand_op_variants name = {                       \
         |                                                 ^
   dosilicon.c:18:8: note: in expansion of macro 'SPINAND_OP_VARIANTS'
      18 | static SPINAND_OP_VARIANTS(write_cache_variants,
         |        ^~~~~~~~~~~~~~~~~~~
>> include/linux/mtd/spinand.h:389:24: warning: missing braces around initializer [-Wmissing-braces]
     389 |                 .ops = (struct spi_mem_op[]) { __VA_ARGS__ },           \
         |                        ^
   dosilicon.c:22:8: note: in expansion of macro 'SPINAND_OP_VARIANTS'
      22 | static SPINAND_OP_VARIANTS(update_cache_variants,
         |        ^~~~~~~~~~~~~~~~~~~
>> include/linux/mtd/spinand.h:389:46: error: initializer element is not constant
     389 |                 .ops = (struct spi_mem_op[]) { __VA_ARGS__ },           \
         |                                              ^
   dosilicon.c:22:8: note: in expansion of macro 'SPINAND_OP_VARIANTS'
      22 | static SPINAND_OP_VARIANTS(update_cache_variants,
         |        ^~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:389:46: note: (near initialization for 'update_cache_variants')
     389 |                 .ops = (struct spi_mem_op[]) { __VA_ARGS__ },           \
         |                                              ^
   dosilicon.c:22:8: note: in expansion of macro 'SPINAND_OP_VARIANTS'
      22 | static SPINAND_OP_VARIANTS(update_cache_variants,
         |        ^~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:390:32: warning: missing braces around initializer [-Wmissing-braces]
     390 |                 .nops = sizeof((struct spi_mem_op[]){ __VA_ARGS__ }) /  \
         |                                ^
   dosilicon.c:22:8: note: in expansion of macro 'SPINAND_OP_VARIANTS'
      22 | static SPINAND_OP_VARIANTS(update_cache_variants,
         |        ^~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:390:53: error: initializer element is not constant
     390 |                 .nops = sizeof((struct spi_mem_op[]){ __VA_ARGS__ }) /  \
         |                                                     ^
   dosilicon.c:22:8: note: in expansion of macro 'SPINAND_OP_VARIANTS'
      22 | static SPINAND_OP_VARIANTS(update_cache_variants,
         |        ^~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:390:53: note: (near initialization for 'update_cache_variants')
     390 |                 .nops = sizeof((struct spi_mem_op[]){ __VA_ARGS__ }) /  \
         |                                                     ^
   dosilicon.c:22:8: note: in expansion of macro 'SPINAND_OP_VARIANTS'
      22 | static SPINAND_OP_VARIANTS(update_cache_variants,
         |        ^~~~~~~~~~~~~~~~~~~
   include/linux/mtd/spinand.h:388:49: warning: missing braces around initializer [-Wmissing-braces]
     388 |         const struct spinand_op_variants name = {                       \
         |                                                 ^
   dosilicon.c:22:8: note: in expansion of macro 'SPINAND_OP_VARIANTS'
      22 | static SPINAND_OP_VARIANTS(update_cache_variants,
         |        ^~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +389 include/linux/mtd/spinand.h

7529df4652482c Peter Pan 2018-06-22  386  
7529df4652482c Peter Pan 2018-06-22  387  #define SPINAND_OP_VARIANTS(name, ...)					\
7529df4652482c Peter Pan 2018-06-22  388  	const struct spinand_op_variants name = {			\
7529df4652482c Peter Pan 2018-06-22 @389  		.ops = (struct spi_mem_op[]) { __VA_ARGS__ },		\
7529df4652482c Peter Pan 2018-06-22  390  		.nops = sizeof((struct spi_mem_op[]){ __VA_ARGS__ }) /	\
7529df4652482c Peter Pan 2018-06-22  391  			sizeof(struct spi_mem_op),			\
7529df4652482c Peter Pan 2018-06-22  392  	}
7529df4652482c Peter Pan 2018-06-22  393  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
