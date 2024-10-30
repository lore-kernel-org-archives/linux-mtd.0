Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9C23D6B6C4
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Oct 2024 19:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I3/t4PqFHPMh/7E7K5TbAoHuzvuODaTjXnSDZENVMs4=; b=vzZObt2ZmwQy/V
	oDgzxJ0V5WzHZEDFuj95ja/mA0i6MESmMlG/bX/bPLWdGn5TaVZc0KkYlSqxaKdFi8aoWeszFqlbx
	b07AKYcGo6AvNcxrM0/NntqitjYdAI4U7ITF9vDzYbKkXGeacDIluxw4taIoaaZL4WkSLiWWmJ28M
	PEKivFjb30Af3KCC9oPoPK2Zf8Dmr9zIrhaeF7sT497AVdpMUxadQcoeUQJZCzDMR2/b0uohL9G8i
	+t+D4X3I1HsBdsOS/oE+6i2Gh4cCwsGzYH+oBqngF2x/+sxbXph7fqglFo7jVicj8d9KYq0opH40e
	/CNgncihNBNwz8p6YKKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6El8-00000001aGD-0GK2;
	Wed, 30 Oct 2024 19:53:38 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6El5-00000001aFq-1cI4
	for linux-mtd@lists.infradead.org;
	Wed, 30 Oct 2024 19:53:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730318016; x=1761854016;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wyt0dBMKgnMl5ZM1MfC4za/eAJFFeRWrQfZ8t4y/fYM=;
  b=II7mMiTte6V+W8Dq3LvesVGTOz6zyFlwK1gQdC4VSEia1CX2g8a7Xdgd
   HRskcgsDgiHmqpbVnm9jgeKrQ9M442ndFDcwAn+oMLosW69NU/o4JnHOU
   u/qNkgh4QtBc2EwgPElemUB9OHPN4gDZYYnhErUHPSteAwSTT7xiv43a7
   FrLXOPf9fbj7H9Ii1YnIDXk4Rhsoof2qsFxRNJwSh1k5lpCt5xPImOu4Z
   9M0dZHcpI2e4V/NpQD/suOyO1lflnxXBfO/fJm+vVRW9XGX/CJ9BBgHcO
   dQuvYvGYC3Mf6LlWWcsDowD10+aLmP1EsCEEgdWlev/EiF78lxi0xpOag
   Q==;
X-CSE-ConnectionGUID: ux6rjpY1TIi3C/FIp82O3w==
X-CSE-MsgGUID: 9tuJJ4HxTO+1XgRzxqY0TQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30232631"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30232631"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 12:53:34 -0700
X-CSE-ConnectionGUID: vSzTMaDxR56N3mVuaCpRoA==
X-CSE-MsgGUID: I+tDLQUZRwSJNEDQJmbdSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,245,1725346800"; 
   d="scan'208";a="86358492"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 30 Oct 2024 12:53:31 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6Ekz-000fFo-1b;
	Wed, 30 Oct 2024 19:53:29 +0000
Date: Thu, 31 Oct 2024 03:53:02 +0800
From: kernel test robot <lkp@intel.com>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>, broonie@kernel.org,
	miquel.raynal@bootlin.com
Cc: oe-kbuild-all@lists.linux.dev, linux-spi@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: Re: [PATCH] spi: spi-mem: rtl-snand: Correctly handle DMA transfers
Message-ID: <202410310358.GyKQwhxO-lkp@intel.com>
References: <20241029215159.1975844-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241029215159.1975844-1-chris.packham@alliedtelesis.co.nz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_125335_530516_EC246E5A 
X-CRM114-Status: GOOD (  11.95  )
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
[also build test WARNING on next-20241030]
[cannot apply to linus/master v6.12-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chris-Packham/spi-spi-mem-rtl-snand-Correctly-handle-DMA-transfers/20241030-055313
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
patch link:    https://lore.kernel.org/r/20241029215159.1975844-1-chris.packham%40alliedtelesis.co.nz
patch subject: [PATCH] spi: spi-mem: rtl-snand: Correctly handle DMA transfers
config: nios2-randconfig-r131-20241030 (https://download.01.org/0day-ci/archive/20241031/202410310358.GyKQwhxO-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20241031/202410310358.GyKQwhxO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410310358.GyKQwhxO-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/spi/spi-realtek-rtl-snand.c:252:21: sparse: sparse: incorrect type in assignment (different modifiers) @@     expected void *[assigned] buf @@     got void const *const out @@
   drivers/spi/spi-realtek-rtl-snand.c:252:21: sparse:     expected void *[assigned] buf
   drivers/spi/spi-realtek-rtl-snand.c:252:21: sparse:     got void const *const out

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
