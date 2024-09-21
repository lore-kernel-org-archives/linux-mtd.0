Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B847CF9C5B
	for <linux-mtd@archiver.kernel.org>; Sat, 21 Sep 2024 15:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1ayizVE85P8jsjioDBsbh1WqzThV7KRfOrWuTlnEmw0=; b=CUBd5liqS/zwyt
	R8sH5CwU2PZ/onqkSukLHeRPD+cIY1QTOaV5aI+TiqgFoRcMUrv/SHJYrmjwk8vNTr7kFuFNyMsED
	bXQU8z5rzvGQkXiSlmuuj8IQKf1jiX+GmPaCOYwG9zxPaOOHPt7pmBQmViB9Vzz4I2cfYYftdaufe
	sgzEkAuG9/vXlHIqLnB81n+VjDzYldpDBKj7GPImCgdipB9yL2S01ooCE/esKMyqgpcxWTQ5cijtH
	HMJbHTHujgG5Q1YOgVk1x9D5Zw8veu3JQyhuPqYMVlbFycWtK9m4Wd/9AE0Liu3zcqN8EDm25fzGs
	NsooU1H0j0pe4HCqHvwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ss2Rr-0000000Dr28-0Aeb;
	Sat, 21 Sep 2024 15:55:03 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ss2Rl-0000000Dr1W-2eNp
	for linux-mtd@lists.infradead.org;
	Sat, 21 Sep 2024 15:54:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726934097; x=1758470097;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tw6tzo5a9+JRFVJ/lYK8+VNKmJnbq5STbmmXDFq6vP0=;
  b=k5uyXHKhjKL5o5hkZV7Mmhs2lgL8NUgXBQqoYGKLed4N7TqlqsFyU7xg
   3DPFD/ooNNnff3Y8Dimr+T9eXAIfVwrp9EXUt06zQpxcqQSliMD2NRGOG
   CTL73v2nefFQpXsh7Yz+NoNuOdytumDnygxsqWJcMbxjpM9cRMnR1xs3n
   XFOR8Zt+woc9+B34W/tf22sWFuoq34OzwqxwTZ/L/IUfo8Kb0qbEKEaqP
   7viOrNtC7WVYA5ufBb+f5lsm0WCLFRzypBVqIhRpveCMFHC1XQGGi8fa8
   vSE4v2bQqHagHn/UtYW8gMYb23RWQPI6xacLBdJdAFkPdf9U7E5fampbM
   Q==;
X-CSE-ConnectionGUID: A2iC1ARAT121t3WeMI7HjA==
X-CSE-MsgGUID: OfTmwySkRTm2cFyjKgGPRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="36590249"
X-IronPort-AV: E=Sophos;i="6.10,247,1719903600"; 
   d="scan'208";a="36590249"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2024 08:54:56 -0700
X-CSE-ConnectionGUID: sEEhAk27Qwmt16Tw3vZbmA==
X-CSE-MsgGUID: XFn+9aooS96EHVsxxJPoAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,247,1719903600"; 
   d="scan'208";a="93949341"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 21 Sep 2024 08:54:53 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ss2Rf-000FYR-03;
	Sat, 21 Sep 2024 15:54:51 +0000
Date: Sat, 21 Sep 2024 23:54:24 +0800
From: kernel test robot <lkp@intel.com>
To: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-media@vger.kernel.org,
	Keguang Zhang <keguang.zhang@gmail.com>
Subject: Re: [PATCH v9 2/2] mtd: rawnand: Add Loongson-1 NAND Controller
 Driver
Message-ID: <202409212350.WrZuWTUv-lkp@intel.com>
References: <20240920-loongson1-nand-v9-2-9cc7b9345a03@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240920-loongson1-nand-v9-2-9cc7b9345a03@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240921_085457_747588_DD091FAC 
X-CRM114-Status: GOOD (  12.93  )
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

Hi Keguang,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 62f92d634458a1e308bb699986b9147a6d670457]

url:    https://github.com/intel-lab-lkp/linux/commits/Keguang-Zhang-via-B4-Relay/dt-bindings-mtd-Add-Loongson-1-NAND-Controller/20240920-191936
base:   62f92d634458a1e308bb699986b9147a6d670457
patch link:    https://lore.kernel.org/r/20240920-loongson1-nand-v9-2-9cc7b9345a03%40gmail.com
patch subject: [PATCH v9 2/2] mtd: rawnand: Add Loongson-1 NAND Controller Driver
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20240921/202409212350.WrZuWTUv-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240921/202409212350.WrZuWTUv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409212350.WrZuWTUv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/kernel.h:15,
                    from drivers/mtd/nand/raw/loongson1_nand.c:8:
   drivers/mtd/nand/raw/loongson1_nand.c: In function 'ls1x_nand_dma_transfer':
>> drivers/mtd/nand/raw/loongson1_nand.c:349:24: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     349 |         if (IS_ALIGNED((u32)op->buf, chip->buf_align) &&
         |                        ^
   include/linux/align.h:13:44: note: in definition of macro 'IS_ALIGNED'
      13 | #define IS_ALIGNED(x, a)                (((x) & ((typeof(x))(a) - 1)) == 0)
         |                                            ^
>> drivers/mtd/nand/raw/loongson1_nand.c:349:24: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     349 |         if (IS_ALIGNED((u32)op->buf, chip->buf_align) &&
         |                        ^
   include/linux/align.h:13:58: note: in definition of macro 'IS_ALIGNED'
      13 | #define IS_ALIGNED(x, a)                (((x) & ((typeof(x))(a) - 1)) == 0)
         |                                                          ^

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for OMAP2PLUS_MBOX
   Depends on [n]: MAILBOX [=y] && (ARCH_OMAP2PLUS || ARCH_K3)
   Selected by [m]:
   - TI_K3_M4_REMOTEPROC [=m] && REMOTEPROC [=y] && (ARCH_K3 || COMPILE_TEST [=y])


vim +349 drivers/mtd/nand/raw/loongson1_nand.c

   333	
   334	static int ls1x_nand_dma_transfer(struct ls1x_nfc *nfc,
   335					  struct ls1x_nfc_op *op)
   336	{
   337		struct nand_chip *chip = &nfc->chip;
   338		struct dma_chan *chan = nfc->dma_chan;
   339		struct device *dev = chan->device->dev;
   340		struct dma_async_tx_descriptor *desc;
   341		enum dma_data_direction data_dir =
   342		    op->is_write ? DMA_TO_DEVICE : DMA_FROM_DEVICE;
   343		enum dma_transfer_direction xfer_dir =
   344		    op->is_write ? DMA_MEM_TO_DEV : DMA_DEV_TO_MEM;
   345		char *dma_buf = NULL;
   346		dma_addr_t dma_addr;
   347		int ret;
   348	
 > 349		if (IS_ALIGNED((u32)op->buf, chip->buf_align) &&
   350		    IS_ALIGNED(op->len, chip->buf_align)) {
   351			dma_addr = dma_map_single(dev, op->buf, op->len, data_dir);
   352			if (dma_mapping_error(dev, dma_addr)) {
   353				dev_err(dev, "failed to map DMA buffer\n");
   354				return -ENXIO;
   355			}
   356		} else if (!op->is_write) {
   357			dma_buf = dma_alloc_coherent(dev, op->dma_len, &dma_addr,
   358						     GFP_KERNEL);
   359			if (!dma_buf)
   360				return -ENOMEM;
   361		} else {
   362			dev_err(dev, "subpage writing not supported\n");
   363			return -EOPNOTSUPP;
   364		}
   365	
   366		desc = dmaengine_prep_slave_single(chan, dma_addr, op->dma_len,
   367						   xfer_dir, DMA_PREP_INTERRUPT);
   368		if (!desc) {
   369			dev_err(dev, "failed to prepare DMA descriptor\n");
   370			ret = PTR_ERR(desc);
   371			goto err;
   372		}
   373		desc->callback = ls1x_nand_dma_callback;
   374		desc->callback_param = nfc;
   375	
   376		nfc->dma_cookie = dmaengine_submit(desc);
   377		ret = dma_submit_error(nfc->dma_cookie);
   378		if (ret) {
   379			dev_err(dev, "failed to submit DMA descriptor\n");
   380			goto err;
   381		}
   382	
   383		dev_dbg(dev, "issue DMA with cookie=%d\n", nfc->dma_cookie);
   384		dma_async_issue_pending(chan);
   385	
   386		ret = wait_for_completion_timeout(&nfc->dma_complete,
   387						  msecs_to_jiffies(2000));
   388		if (!ret) {
   389			dmaengine_terminate_sync(chan);
   390			reinit_completion(&nfc->dma_complete);
   391			ret = -ETIMEDOUT;
   392			goto err;
   393		}
   394		ret = 0;
   395	
   396		if (dma_buf)
   397			memcpy(op->buf, dma_buf + op->aligned_offset, op->len);
   398	err:
   399		if (dma_buf)
   400			dma_free_coherent(dev, op->dma_len, dma_buf, dma_addr);
   401		else
   402			dma_unmap_single(dev, dma_addr, op->len, data_dir);
   403	
   404		return ret;
   405	}
   406	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
