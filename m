Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C79CDD74977
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Oct 2024 06:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ziIglym/h8jHKtGG3fHNHI4Khs3LO8ZqN207vh3p5E0=; b=0IEjN/ZrObV6qi
	1MG8bPY/0YTIIOMn+zh8ImwEwN1QIJPM8ECoOhX3ic2QkSVQOkZIneRn6yIxu/9RR5I8KdRJ7kp0b
	ksC42uTW4mmfGtqfTga0v1WopFNTlRdP7uaJ+6nPD13X3oTVpO1oRaXH3MTsyXxv32KV5FUsKAXlZ
	jXake7YicknSQ3kKiLrrTbw1aNQxH4P3EL35wBZdBCdTb60ExL5hiDLCfF81h+lC56mAe5gE3ukGZ
	CckZ7xjNBq4eUdfs5mm1B9/jmRfK1Z8FFICbQ6hpOULQTewiNWO5lIRZySjwss76v4sWxVyFyjs8W
	gWPiobn4WOWb+D+a0H4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t62R4-0000000H0aB-0dYx;
	Wed, 30 Oct 2024 06:44:06 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t62R1-0000000H0Zf-0ZbG
	for linux-mtd@lists.infradead.org;
	Wed, 30 Oct 2024 06:44:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730270643; x=1761806643;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0T+E7OV6n+a0eK67ylsHRGryyoU3pd01WCTFw4Kmrz4=;
  b=ePcDxxBP0CmN7ZUy7PZwxL3U4mULF9G1Cpq5m7IjN+rlD18NmCyuNbwp
   Gt+iAOteRFXbXUTJ/DcYw0ALZTZ9iCw2IKoiJ4jp1EcmtGBZQco4q6au7
   XjUSYAHPaI0rZUFZz7mLI6A2Ua+D7voGr1T8I0Um2YpEfMSUwUZN+hGno
   wYMfEW8XexZDtZPW4GyIhdnOO4+UvzHdZ8QyHnx/8o5N37chd6G7dlIqY
   koLqFi/sLOd6TWI5+RBmo+FIOb5mIzbjl8mJhHllcX0nLhYR/7GJAtteB
   IMbkNopI+1Mb6jKzrmstuDixyLzndOW+JZT4QcL5iVOcz612xN4TNbGxs
   Q==;
X-CSE-ConnectionGUID: 3JiYf0muQAyLHttuBH0jjg==
X-CSE-MsgGUID: RtPAz0d3SgKrR5WzxEh03Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="40532739"
X-IronPort-AV: E=Sophos;i="6.11,244,1725346800"; 
   d="scan'208";a="40532739"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 23:43:59 -0700
X-CSE-ConnectionGUID: Z1UfAt+GTX+2holsnhEt0Q==
X-CSE-MsgGUID: lyQQ4C04RD6jJ07K55ldXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,244,1725346800"; 
   d="scan'208";a="82298268"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 29 Oct 2024 23:43:57 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t62Qs-000eb2-1u;
	Wed, 30 Oct 2024 06:43:54 +0000
Date: Wed, 30 Oct 2024 14:42:59 +0800
From: kernel test robot <lkp@intel.com>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>, broonie@kernel.org,
	miquel.raynal@bootlin.com
Cc: oe-kbuild-all@lists.linux.dev, linux-spi@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: Re: [PATCH] spi: spi-mem: rtl-snand: Correctly handle DMA transfers
Message-ID: <202410301452.7koB3V8S-lkp@intel.com>
References: <20241029215159.1975844-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241029215159.1975844-1-chris.packham@alliedtelesis.co.nz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_234403_216572_51399E84 
X-CRM114-Status: GOOD (  12.70  )
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-spi/for-next]
[also build test WARNING on next-20241029]
[cannot apply to linus/master v6.12-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chris-Packham/spi-spi-mem-rtl-snand-Correctly-handle-DMA-transfers/20241030-055313
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
patch link:    https://lore.kernel.org/r/20241029215159.1975844-1-chris.packham%40alliedtelesis.co.nz
patch subject: [PATCH] spi: spi-mem: rtl-snand: Correctly handle DMA transfers
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20241030/202410301452.7koB3V8S-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241030/202410301452.7koB3V8S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410301452.7koB3V8S-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/spi/spi-realtek-rtl-snand.c: In function 'rtl_snand_dma_xfer':
>> drivers/spi/spi-realtek-rtl-snand.c:252:21: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     252 |                 buf = op->data.buf.out;
         |                     ^

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


vim +/const +252 drivers/spi/spi-realtek-rtl-snand.c

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
