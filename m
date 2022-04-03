Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58F15C433F5
	for <linux-mtd@archiver.kernel.org>; Sun,  3 Apr 2022 17:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=48tJPp/Q2N4MNfr1AGK+JHitU4eqp9MvLKNN8qWvLZE=; b=4MbhdGcq0HJJ2w
	teqEftwTJIWGWhR1pAiw6BtFFJmEBuYMS8UpHx0Q/LSKTsid2K7dz0m85rQ9XyZA2jgXnOvnlBdUQ
	LV/dSsYOzNjRC4bnKsdZp7/zhRHSRwX5VEQb2dfHklicfJ1oE4p/dbDeYPt6da2NsXYF86/fs2RxY
	AuJ0W/Z83akIjoy9OCRibjlHMQIQC+6jFDQZV3NS049hcfUy0MFp7e8UbusjfRPiNUSD1k+UF9uau
	6R8yEOQ/LjjTxYu+L5sbzRs5d5sHET6H/QkbZxlGxZumR+mzfYnNl/JQFa9N9nrmhoBQgJjv88KUD
	d28tgGCImMxPmnlTYAFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nb3w5-00C05n-Sc; Sun, 03 Apr 2022 17:22:45 +0000
Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nb3w1-00C05B-In
 for linux-mtd@lists.infradead.org; Sun, 03 Apr 2022 17:22:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649006561; x=1680542561;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=SilCYHxevAy4gyqpkXifpwPMYrzpHXKUa6mkQ7VKcBA=;
 b=LEpeJkdoicCS29nVceefPoUjxU6AC7Cm1L/jT8/608PFStiUMv9L0Yxq
 OtFWLlXWJdkJtAmFUCOuhATU7yIt16rVmKhap5rIfOQMCHFhl0UZzJQpZ
 Qmtiur9jdljRMamjc9XwJdIioUfxHlRzaEmLtgoucnt2sPCYk+AeQs4EM
 M5HoLjp/cKM5uWvldVKmD6rOETx/3ig8ARajyJp5dAlCu9uXfcRANUCVT
 /qtS+z9Z+dCwZcJg5tVcD3CEwirCVJINySltGsBuIgca8gcmhwevy46VD
 6/qJr5+WLGQDVZzARod1t7FSNJomSa61Q6elk0zzwxcajb4RuQPICismO w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10306"; a="260096506"
X-IronPort-AV: E=Sophos;i="5.90,231,1643702400"; d="scan'208";a="260096506"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2022 10:22:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,231,1643702400"; d="scan'208";a="569029877"
Received: from lkp-server02.sh.intel.com (HELO a44fdfb70b94) ([10.239.97.151])
 by orsmga008.jf.intel.com with ESMTP; 03 Apr 2022 10:22:37 -0700
Received: from kbuild by a44fdfb70b94 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nb3vx-000189-8y;
 Sun, 03 Apr 2022 17:22:37 +0000
Date: Mon, 4 Apr 2022 01:22:09 +0800
From: kernel test robot <lkp@intel.com>
To: Chuanhong Guo <gch981213@gmail.com>, linux-spi@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH resend 2/4] spi: add driver for MTK SPI NAND Flash
 Interface
Message-ID: <202204040143.fnOgLTp5-lkp@intel.com>
References: <20220403131453.1269229-3-gch981213@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220403131453.1269229-3-gch981213@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220403_102241_746359_D6F3B0D1 
X-CRM114-Status: GOOD (  18.03  )
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

Hi Chuanhong,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on next-20220401]
[cannot apply to mtd/nand/next broonie-spi/for-next robh/for-next v5.17 v5.17-rc8 v5.17-rc7 v5.17]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Chuanhong-Guo/spi-add-support-for-Mediatek-SPI-NAND-controller/20220403-211703
base:    e5071887cd2296a7704dbcd10c1cedf0f11cdbd5
config: mips-allmodconfig (https://download.01.org/0day-ci/archive/20220404/202204040143.fnOgLTp5-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/42beed649ed9c6674bdb176691f10365f093a82d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Chuanhong-Guo/spi-add-support-for-Mediatek-SPI-NAND-controller/20220403-211703
        git checkout 42beed649ed9c6674bdb176691f10365f093a82d
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/printk.h:555,
                    from include/linux/kernel.h:29,
                    from drivers/spi/spi-mtk-snfi.c:70:
   drivers/spi/spi-mtk-snfi.c: In function 'mtk_snand_mac_io':
>> drivers/spi/spi-mtk-snfi.c:499:27: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     499 |         dev_dbg(snf->dev, "SNF TX: %lu RX: %lu", reg_offs, rx_len);
         |                           ^~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:134:29: note: in definition of macro '__dynamic_func_call'
     134 |                 func(&id, ##__VA_ARGS__);               \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:166:9: note: in expansion of macro '_dynamic_func_call'
     166 |         _dynamic_func_call(fmt,__dynamic_dev_dbg,               \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:9: note: in expansion of macro 'dynamic_dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:30: note: in expansion of macro 'dev_fmt'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/spi/spi-mtk-snfi.c:499:9: note: in expansion of macro 'dev_dbg'
     499 |         dev_dbg(snf->dev, "SNF TX: %lu RX: %lu", reg_offs, rx_len);
         |         ^~~~~~~
   drivers/spi/spi-mtk-snfi.c:499:38: note: format string is defined here
     499 |         dev_dbg(snf->dev, "SNF TX: %lu RX: %lu", reg_offs, rx_len);
         |                                    ~~^
         |                                      |
         |                                      long unsigned int
         |                                    %u
   In file included from include/linux/printk.h:555,
                    from include/linux/kernel.h:29,
                    from drivers/spi/spi-mtk-snfi.c:70:
   drivers/spi/spi-mtk-snfi.c:499:27: warning: format '%lu' expects argument of type 'long unsigned int', but argument 5 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     499 |         dev_dbg(snf->dev, "SNF TX: %lu RX: %lu", reg_offs, rx_len);
         |                           ^~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:134:29: note: in definition of macro '__dynamic_func_call'
     134 |                 func(&id, ##__VA_ARGS__);               \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:166:9: note: in expansion of macro '_dynamic_func_call'
     166 |         _dynamic_func_call(fmt,__dynamic_dev_dbg,               \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:9: note: in expansion of macro 'dynamic_dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:30: note: in expansion of macro 'dev_fmt'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/spi/spi-mtk-snfi.c:499:9: note: in expansion of macro 'dev_dbg'
     499 |         dev_dbg(snf->dev, "SNF TX: %lu RX: %lu", reg_offs, rx_len);
         |         ^~~~~~~
   drivers/spi/spi-mtk-snfi.c:499:46: note: format string is defined here
     499 |         dev_dbg(snf->dev, "SNF TX: %lu RX: %lu", reg_offs, rx_len);
         |                                            ~~^
         |                                              |
         |                                              long unsigned int
         |                                            %u
   In file included from include/linux/device.h:15,
                    from drivers/spi/spi-mtk-snfi.c:73:
   drivers/spi/spi-mtk-snfi.c: In function 'mtk_snand_setup_pagefmt':
   drivers/spi/spi-mtk-snfi.c:619:27: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     619 |         dev_err(snf->dev, "page size %lu+%lu is not supported\n", page_size,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/spi/spi-mtk-snfi.c:619:9: note: in expansion of macro 'dev_err'
     619 |         dev_err(snf->dev, "page size %lu+%lu is not supported\n", page_size,
         |         ^~~~~~~
   drivers/spi/spi-mtk-snfi.c:619:40: note: format string is defined here
     619 |         dev_err(snf->dev, "page size %lu+%lu is not supported\n", page_size,
         |                                      ~~^
         |                                        |
         |                                        long unsigned int
         |                                      %u
   In file included from include/linux/device.h:15,
                    from drivers/spi/spi-mtk-snfi.c:73:
   drivers/spi/spi-mtk-snfi.c:619:27: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     619 |         dev_err(snf->dev, "page size %lu+%lu is not supported\n", page_size,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/spi/spi-mtk-snfi.c:619:9: note: in expansion of macro 'dev_err'
     619 |         dev_err(snf->dev, "page size %lu+%lu is not supported\n", page_size,
         |         ^~~~~~~
   drivers/spi/spi-mtk-snfi.c:619:44: note: format string is defined here
     619 |         dev_err(snf->dev, "page size %lu+%lu is not supported\n", page_size,
         |                                          ~~^
         |                                            |
         |                                            long unsigned int
         |                                          %u
--
>> drivers/spi/spi-mtk-snfi.c:728: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * swap [pagesize] byte on nand with the first fdm byte in the last sector.
   drivers/spi/spi-mtk-snfi.c:748: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * swap the first fdm byte in the first and the last sector.
   drivers/spi/spi-mtk-snfi.c:1048: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Check whether op can be executed with read_from_cache or program_load
--
   mips-linux-ld: drivers/mtd/nand/ecc-mtk.o: in function `mtk_ecc_driver_exit':
>> ecc-mtk.c:(.exit.text+0x0): multiple definition of `cleanup_module'; drivers/mtd/nand/ecc-mxic.o:ecc-mxic.c:(.exit.text+0x0): first defined here
   mips-linux-ld: drivers/mtd/nand/ecc-mtk.o: in function `mtk_ecc_driver_init':
>> ecc-mtk.c:(.init.text+0x0): multiple definition of `init_module'; drivers/mtd/nand/ecc-mxic.o:ecc-mxic.c:(.init.text+0x0): first defined here


vim +499 drivers/spi/spi-mtk-snfi.c

   437	
   438	static int mtk_snand_mac_io(struct mtk_snand *snf, const struct spi_mem_op *op)
   439	{
   440		size_t rx_len = 0;
   441		size_t reg_offs = 0;
   442		u32 val = 0;
   443		const u8 *tx_buf = NULL;
   444		u8 *rx_buf = NULL;
   445		int i, ret;
   446		u8 b;
   447	
   448		if (op->data.dir == SPI_MEM_DATA_IN) {
   449			rx_len = op->data.nbytes;
   450			rx_buf = op->data.buf.in;
   451		} else {
   452			tx_buf = op->data.buf.out;
   453		}
   454	
   455		mtk_snand_mac_reset(snf);
   456	
   457		for (i = 0; i < op->cmd.nbytes; i++, reg_offs++) {
   458			b = (op->cmd.opcode >> ((op->cmd.nbytes - i - 1) * 8)) & 0xff;
   459			val |= b << (8 * (reg_offs % 4));
   460			if (reg_offs % 4 == 3) {
   461				nfi_write32(snf, SNF_GPRAM + reg_offs - 3, val);
   462				val = 0;
   463			}
   464		}
   465	
   466		for (i = 0; i < op->addr.nbytes; i++, reg_offs++) {
   467			b = (op->addr.val >> ((op->addr.nbytes - i - 1) * 8)) & 0xff;
   468			val |= b << (8 * (reg_offs % 4));
   469			if (reg_offs % 4 == 3) {
   470				nfi_write32(snf, SNF_GPRAM + reg_offs - 3, val);
   471				val = 0;
   472			}
   473		}
   474	
   475		for (i = 0; i < op->dummy.nbytes; i++, reg_offs++) {
   476			if (reg_offs % 4 == 3) {
   477				nfi_write32(snf, SNF_GPRAM + reg_offs - 3, val);
   478				val = 0;
   479			}
   480		}
   481	
   482		if (op->data.dir == SPI_MEM_DATA_OUT) {
   483			for (i = 0; i < op->data.nbytes; i++, reg_offs++) {
   484				val |= tx_buf[i] << (8 * (reg_offs % 4));
   485				if (reg_offs % 4 == 3) {
   486					nfi_write32(snf, SNF_GPRAM + reg_offs - 3, val);
   487					val = 0;
   488				}
   489			}
   490		}
   491	
   492		if (reg_offs % 4 != 3)
   493			nfi_write32(snf, SNF_GPRAM + (reg_offs & ~3), val);
   494	
   495		for (i = 0; i < reg_offs; i += 4)
   496			dev_dbg(snf->dev, "%d: %08X", i,
   497				nfi_read32(snf, SNF_GPRAM + i));
   498	
 > 499		dev_dbg(snf->dev, "SNF TX: %lu RX: %lu", reg_offs, rx_len);
   500	
   501		ret = mtk_snand_mac_trigger(snf, reg_offs, rx_len);
   502		if (ret)
   503			return ret;
   504	
   505		if (!rx_len)
   506			return 0;
   507	
   508		nfi_read_data(snf, SNF_GPRAM + reg_offs, rx_buf, rx_len);
   509		return 0;
   510	}
   511	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
