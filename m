Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A19B7C2BD09
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Jul 2024 08:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4HbM0ooYQ/LEMjQwb9OZubPMjsWtpc0bMi6VjTczKr4=; b=qjWEVt8zJIjqg3
	NmuQqxjdqtnyODMscLXzJ1QtFrv7WmDFE+KKmMOUU1rX6PYjzMKJyq3q0/pg1CJv7f6xd8S+5+UG1
	/eUnrd5gV78DWcQrrOMP4tuy8SUiRRG9rn8aVaGtB8oWhPTReP/QXadva3kkSaDQswsHyj5GcCfRB
	cUFgnVYY3d6GuflzzpFaDChuHCam9ZMX7yOUWrD/RobublrM4G7Q1b8hF4xSw1I/QiC6Q5II4ud2T
	U6t4urxPDUv9L9WLZpYfVfoSUk2Y2kWxKHSubyN50GI+uanSHJz66cpHWShCnX5n1w8Qo/+YP+9kE
	u+iOdiWu+5ybJrlcwlsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSBjV-0000000GueR-3QRk;
	Fri, 12 Jul 2024 08:34:25 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSBjR-0000000Gudt-2a8f;
	Fri, 12 Jul 2024 08:34:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720773262; x=1752309262;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pq5PExVlhukFj3U0b+zsykWbjKB4zXqVv9oUhe4GayI=;
  b=AMdXqh2kAzOVGAdIKBJeVBJTQ0Vngm3IoOubG9IXYN8ikGMv9mNVili7
   yvcn0O9r26DD9TXDqM0z1/2jpn8fvq8uONNUNBMBXEtDdTZOvLjN7etAW
   VcFk1eN5vj7zvS4wrhhCm96TTEHrVUDjHsL5GCcQcaqzngqTVEha8CFzT
   Ijx2C3Tb6wEXIvAFiU0RCkCa8KyCzWi8Jpv3vP8Nu60VHnQjVfmG6OqmX
   M8DRYYnuEVpl0bwnff3DuptoanvinK3Cc7ZJROI4J+Um2kKMTGNDHvWsf
   NF53IZFm6HDb1o7hZKrSxWlRd/ZAStSCK+0JgvKRt+buTBQ4uAdf5XwTo
   Q==;
X-CSE-ConnectionGUID: N2TMSNdkT7eUfKLJC4MGoQ==
X-CSE-MsgGUID: RNQUFbxHQgmEAg89mGvsmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="29611213"
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; 
   d="scan'208";a="29611213"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2024 01:34:21 -0700
X-CSE-ConnectionGUID: ixOa7lDgSiKEeMgMv0eYSg==
X-CSE-MsgGUID: AQs+thZ5SKmeKy6XedTRjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; 
   d="scan'208";a="53774969"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 12 Jul 2024 01:34:16 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sSBjJ-000aYE-1K;
	Fri, 12 Jul 2024 08:34:13 +0000
Date: Fri, 12 Jul 2024 16:33:17 +0800
From: kernel test robot <lkp@intel.com>
To: Esben Haabendal <esben@geanix.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
	linux-arm-kernel@lists.infradead.org,
	Esben Haabendal <esben@geanix.com>
Subject: Re: [PATCH v3 14/15] mtd: spi-nor: Drop deprecated mechanism for
 optional SFDP parsing
Message-ID: <202407121629.O2ykn94e-lkp@intel.com>
References: <20240711-macronix-mx25l3205d-fixups-v3-14-99353461dd2d@geanix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240711-macronix-mx25l3205d-fixups-v3-14-99353461dd2d@geanix.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240712_013421_918772_EE1DDC31 
X-CRM114-Status: GOOD (  12.78  )
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

Hi Esben,

kernel test robot noticed the following build errors:

[auto build test ERROR on a38297e3fb012ddfa7ce0321a7e5a8daeb1872b6]

url:    https://github.com/intel-lab-lkp/linux/commits/Esben-Haabendal/mtd-spi-nor-core-add-flag-for-doing-optional-SFDP-parsing/20240711-224454
base:   a38297e3fb012ddfa7ce0321a7e5a8daeb1872b6
patch link:    https://lore.kernel.org/r/20240711-macronix-mx25l3205d-fixups-v3-14-99353461dd2d%40geanix.com
patch subject: [PATCH v3 14/15] mtd: spi-nor: Drop deprecated mechanism for optional SFDP parsing
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20240712/202407121629.O2ykn94e-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240712/202407121629.O2ykn94e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407121629.O2ykn94e-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/mtd/spi-nor/core.c:13:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:173:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2210:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/mtd/spi-nor/core.c:17:
   In file included from include/linux/mtd/spi-nor.h:11:
   In file included from include/linux/spi/spi-mem.h:14:
   In file included from include/linux/spi/spi.h:17:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from drivers/mtd/spi-nor/core.c:17:
   In file included from include/linux/mtd/spi-nor.h:11:
   In file included from include/linux/spi/spi-mem.h:14:
   In file included from include/linux/spi/spi.h:17:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from drivers/mtd/spi-nor/core.c:17:
   In file included from include/linux/mtd/spi-nor.h:11:
   In file included from include/linux/spi/spi-mem.h:14:
   In file included from include/linux/spi/spi.h:17:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   In file included from drivers/mtd/spi-nor/core.c:25:
>> drivers/mtd/spi-nor/core.h:722:54: error: expected ';' after return statement
     722 |         return (nor->info->no_sfdp_flags & SPI_NOR_TRY_SFDP)
         |                                                             ^
         |                                                             ;
   17 warnings and 1 error generated.


vim +722 drivers/mtd/spi-nor/core.h

   712	
   713	/**
   714	 * spi_nor_try_sfdp() - returns true if optional SFDP parsing should be tried
   715	 * for this flash, with fallback to static parameters and settings based on
   716	 * flash ID if SFDP parsing fails.
   717	 *
   718	 * Return: true if optional SFDP parsing should be tried
   719	 */
   720	static inline bool spi_nor_try_sfdp(const struct spi_nor *nor)
   721	{
 > 722		return (nor->info->no_sfdp_flags & SPI_NOR_TRY_SFDP)
   723	}
   724	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
