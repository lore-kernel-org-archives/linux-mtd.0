Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98574D5CC8A
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Oct 2024 10:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z3cioyjYOF2w6UNCs0T7JVaBe99/RuGxM2Lq3wzwEHk=; b=uIHDTqKDE+WXJQ
	NMpkx/TFOdJg0ytZRkfs/gSdy1QaeHWR4Y0uOxuRVwJiqnuddoOJY45CCwgtTAZHqpqhvMKWw84mQ
	PlduYLGLDIoOLjiyDp8DOwuYdHSwVUJCZ0x4TeL0BlIV1t6ZGnCOgTVuR43bv8VrcfEquyj9+KdpT
	NRo0t6N2dYTaqWGVJbAtGLI0120f2zz4ZHlLorWENbVgH82qyVeO7NO9Kg1njanW4pJtoNGGeur4u
	alkaO/zoyU8EEYl0LjpejqmUV2d4z4Y4rjcjg5yGqqqap379LWhSOa2JmYT7E0Qq083/+mdT/plMq
	8JbJpVkt/i/8D2rNeaXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6615-0000000HZ3I-3g20;
	Wed, 30 Oct 2024 10:33:31 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t65p7-0000000HX5D-0ucz
	for linux-mtd@lists.infradead.org;
	Wed, 30 Oct 2024 10:21:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730283670; x=1761819670;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4LDVm3NeRut3GhjCqQAiKoVs+ZvzfrEbu5XmIdWkQ9Y=;
  b=nJmIU0xi2uGZpDBA7YbX95+4c0NZHm+/qHvBPUBdRGfJ0ZQUDSLrpqsk
   g2xqXG58yCzQUuufpRzXBNC0Xy/2UnD9rCAlBADdLctOKmgnUF0CS6cEw
   V1S/BLKKBRRG79ODxgTyQXpapWKMjAZLeKf+ja5Mp4yPLeltD+2YPiwPB
   9QyeEAcgtUwn13nGK3xaKQPD/yVVXfgh0aJ502xjDd4thwbN59KgfBcSy
   aEgdTWbTjCs1RUFLfTmII4UQ1NEl3iHcC9/gNTAZwDy7EIbvfw44dmrjd
   WF+9viadJ31C6SGanbyV6o0Utu+TKQEgg3p8Rew/O89Iyov8QSEzeuvcg
   w==;
X-CSE-ConnectionGUID: 7rDuAmj6Tx64XUhz4UvQ5g==
X-CSE-MsgGUID: SIsDDjL8R0CDKvM+WR5hcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="47437029"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="47437029"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 03:21:09 -0700
X-CSE-ConnectionGUID: 2dpQz7OCSLGpjTcseFwclg==
X-CSE-MsgGUID: qGv+edTgRe+JIThJlxcdfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,244,1725346800"; 
   d="scan'208";a="82374312"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 30 Oct 2024 03:21:05 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t65p1-000ejq-0J;
	Wed, 30 Oct 2024 10:21:03 +0000
Date: Wed, 30 Oct 2024 18:20:53 +0800
From: kernel test robot <lkp@intel.com>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>, broonie@kernel.org,
	miquel.raynal@bootlin.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: Re: [PATCH] spi: spi-mem: rtl-snand: Correctly handle DMA transfers
Message-ID: <202410301731.MOPjsQ0R-lkp@intel.com>
References: <20241029215159.1975844-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241029215159.1975844-1-chris.packham@alliedtelesis.co.nz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_032109_345835_405102C0 
X-CRM114-Status: GOOD (  13.79  )
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

Hi Chris,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-spi/for-next]
[also build test ERROR on next-20241029]
[cannot apply to linus/master v6.12-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chris-Packham/spi-spi-mem-rtl-snand-Correctly-handle-DMA-transfers/20241030-055313
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
patch link:    https://lore.kernel.org/r/20241029215159.1975844-1-chris.packham%40alliedtelesis.co.nz
patch subject: [PATCH] spi: spi-mem: rtl-snand: Correctly handle DMA transfers
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20241030/202410301731.MOPjsQ0R-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 639a7ac648f1e50ccd2556e17d401c04f9cce625)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241030/202410301731.MOPjsQ0R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410301731.MOPjsQ0R-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/spi/spi-realtek-rtl-snand.c:4:
   In file included from include/linux/dma-mapping.h:8:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:181:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/spi/spi-realtek-rtl-snand.c:4:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from drivers/spi/spi-realtek-rtl-snand.c:4:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from drivers/spi/spi-realtek-rtl-snand.c:4:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     693 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     701 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     709 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     718 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     727 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     736 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> drivers/spi/spi-realtek-rtl-snand.c:252:7: error: assigning to 'void *' from 'const void *const' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     252 |                 buf = op->data.buf.out;
         |                     ^ ~~~~~~~~~~~~~~~~
   16 warnings and 1 error generated.


vim +252 drivers/spi/spi-realtek-rtl-snand.c

   231	
   232	static int rtl_snand_dma_xfer(struct rtl_snand *snand, int cs, const struct spi_mem_op *op)
   233	{
   234		unsigned int pos, nbytes;
   235		int ret;
   236		dma_addr_t buf_dma;
   237		enum dma_data_direction dir;
   238		u32 trig, len, maxlen;
   239		void *buf;
   240	
   241		ret = rtl_snand_xfer_head(snand, cs, op);
   242		if (ret)
   243			goto out_deselect;
   244	
   245		if (op->data.dir == SPI_MEM_DATA_IN) {
   246			maxlen = 2080;
   247			buf = op->data.buf.in;
   248			dir = DMA_FROM_DEVICE;
   249			trig = 0;
   250		} else if (op->data.dir == SPI_MEM_DATA_OUT) {
   251			maxlen = 520;
 > 252			buf = op->data.buf.out;
   253			dir = DMA_TO_DEVICE;
   254			trig = 1;
   255		} else {
   256			ret = -EOPNOTSUPP;
   257			goto out_deselect;
   258		}
   259	
   260		buf_dma = dma_map_single(snand->dev, buf, op->data.nbytes, dir);
   261		ret = dma_mapping_error(snand->dev, buf_dma);
   262		if (ret)
   263			goto out_deselect;
   264	
   265		ret = regmap_write(snand->regmap, SNAFDIR, SNAFDIR_DMA_IP);
   266		if (ret)
   267			goto out_unmap;
   268	
   269		ret = regmap_update_bits(snand->regmap, SNAFCFR, SNAFCFR_DMA_IE, SNAFCFR_DMA_IE);
   270		if (ret)
   271			goto out_unmap;
   272	
   273		pos = 0;
   274		len = op->data.nbytes;
   275	
   276		while (pos < len) {
   277			nbytes = len - pos;
   278			if (nbytes > maxlen)
   279				nbytes = maxlen;
   280	
   281			reinit_completion(&snand->comp);
   282	
   283			ret = regmap_write(snand->regmap, SNAFDRSAR, buf_dma + pos);
   284			if (ret)
   285				goto out_disable_int;
   286	
   287			pos += nbytes;
   288	
   289			ret = regmap_write(snand->regmap, SNAFDLR,
   290					CMR_WID(op->data.buswidth) | nbytes);
   291			if (ret)
   292				goto out_disable_int;
   293	
   294			ret = regmap_write(snand->regmap, SNAFDTR, trig);
   295			if (ret)
   296				goto out_disable_int;
   297	
   298			if (!wait_for_completion_timeout(&snand->comp, usecs_to_jiffies(20000)))
   299				ret = -ETIMEDOUT;
   300	
   301			if (ret)
   302				goto out_disable_int;
   303		}
   304	
   305	out_disable_int:
   306		regmap_update_bits(snand->regmap, SNAFCFR, SNAFCFR_DMA_IE, 0);
   307	out_unmap:
   308		dma_unmap_single(snand->dev, buf_dma, op->data.nbytes, dir);
   309	out_deselect:
   310		rtl_snand_xfer_tail(snand, cs);
   311	
   312		if (ret)
   313			dev_err(snand->dev, "transfer failed %d\n", ret);
   314	
   315		return ret;
   316	}
   317	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
