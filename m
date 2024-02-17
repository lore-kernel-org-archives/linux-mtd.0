Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D279FC48BC4
	for <linux-mtd@archiver.kernel.org>; Sat, 17 Feb 2024 18:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZLf2MKEXA+GRTSbIqhhcvwPEhIfi556SnejbrykGQpw=; b=V403+Ck6DxFC2S
	bUl/izqp0TUCAxHQ4rWu1UchTGlRpV+wbMkUJ+Pq0d0ijLP1FK1IltEPeZEOqYZuuWZO6SNjiDt4Q
	WYQXwK/EDDjZGPsOEJrGJmDZv/PG6K6Lgq+mo2K1N6ExikBh3VuYRIPEbkd6f+2kUwIAarsdtDCVR
	ynpFwIu0UHvpZkPldFYnDoUhRc3P5Cxu5r7cwPpBYgChwZfszEbGxRO81u1UP81bkc0Za3GaxMb+0
	ckZci12QFQu8L3tCrzTtFuZUEAnfWyrK0W/WUh/nCNzcmn3JOGwW2YDj3bErnWEnLM40fDjHCywpX
	hlBFw47XtzemDcV8GPjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbPdb-00000006Aqw-2dIe;
	Sat, 17 Feb 2024 18:42:11 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbPdX-00000006AqW-1Snv
	for linux-mtd@lists.infradead.org;
	Sat, 17 Feb 2024 18:42:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708195327; x=1739731327;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HFaE10+pc7A7JXUx+B3rFqJd4LKz+beXrlJW7NA7AJ4=;
  b=jBBzJPbU03OqCS28RrLsJ74j+V7dan5LcvWFd/jsPifwo8gXsvvlcc34
   l9lnCepN/Gvh4W7BYcdot9cllW3bgELkt+aWhBbVReDf7hMOk4dscWMj/
   C+qERvV7jkWuXEjS8u+IDpw1M6hQtEnAM/+0IOfPOn0gksh4y8SwVPPdO
   vlv38PYHHrWAg0qm80Vpx6I1jPAnuM/ZZGqyrk+TnQ1lKm/rCa1eVnYmi
   3nB1KWMfSXYnADuDmGY70ycCuB20IRfPKXad0y/psCoXJ0yts+5Bw55+g
   AyPiHJovC+Q6NNrHAoJtHmpanTpr3/BM+OqvU6sInVpnAbkNK0G1p1x5V
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10987"; a="2186762"
X-IronPort-AV: E=Sophos;i="6.06,167,1705392000"; 
   d="scan'208";a="2186762"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2024 10:42:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,167,1705392000"; 
   d="scan'208";a="8810403"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 17 Feb 2024 10:41:59 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rbPdM-0002Os-1L;
	Sat, 17 Feb 2024 18:41:56 +0000
Date: Sun, 18 Feb 2024 02:41:42 +0800
From: kernel test robot <lkp@intel.com>
To: Md Sadre Alam <quic_mdalam@quicinc.com>, andersson@kernel.org,
	konrad.dybcio@linaro.org, broonie@kernel.org, robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	manivannan.sadhasivam@linaro.org, linux-arm-msm@vger.kernel.org,
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	quic_srichara@quicinc.com, quic_varada@quicinc.com,
	quic_mdalam@quicinc.com
Subject: Re: [PATCH 3/5] spi: spi-qpic: Add qpic spi nand driver support
Message-ID: <202402180238.NhuqK3LQ-lkp@intel.com>
References: <20240215134856.1313239-4-quic_mdalam@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240215134856.1313239-4-quic_mdalam@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240217_104207_461555_200EDE1D 
X-CRM114-Status: GOOD (  13.56  )
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

Hi Md,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20240215]
[also build test WARNING on linus/master v6.8-rc4]
[cannot apply to mtd/nand/next broonie-spi/for-next robh/for-next v6.8-rc4 v6.8-rc3 v6.8-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Md-Sadre-Alam/spi-dt-bindings-add-binding-doc-for-spi-qpic-snand/20240215-215348
base:   next-20240215
patch link:    https://lore.kernel.org/r/20240215134856.1313239-4-quic_mdalam%40quicinc.com
patch subject: [PATCH 3/5] spi: spi-qpic: Add qpic spi nand driver support
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240218/202402180238.NhuqK3LQ-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240218/202402180238.NhuqK3LQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402180238.NhuqK3LQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/spi/spi-qpic-snand.c:161:7: warning: variable 'ecc_user' set but not used [-Wunused-but-set-variable]
           bool ecc_user = false;
                ^
>> drivers/spi/spi-qpic-snand.c:160:35: warning: variable 'desired_correction' set but not used [-Wunused-but-set-variable]
           int step_size = 0, strength = 0, desired_correction = 0, steps;
                                            ^
>> drivers/spi/spi-qpic-snand.c:399:6: warning: variable 'oob_buf' set but not used [-Wunused-but-set-variable]
           u8 *oob_buf;
               ^
>> drivers/spi/spi-qpic-snand.c:452:30: warning: variable 'erased' set but not used [-Wunused-but-set-variable]
           bool serial_op_err = false, erased;
                                       ^
   drivers/spi/spi-qpic-snand.c:682:16: error: assigning to 'u8 *' (aka 'unsigned char *') from 'const void *const' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
                   snandc->wbuf = op->data.buf.out;
                                ^ ~~~~~~~~~~~~~~~~
   4 warnings and 1 error generated.


vim +/ecc_user +161 drivers/spi/spi-qpic-snand.c

   152	
   153	static int qpic_snand_ecc_init_ctx_pipelined(struct nand_device *nand)
   154	{
   155		struct qcom_nand_controller *snandc = nand_to_qcom_snand(nand);
   156		struct nand_ecc_props *conf = &nand->ecc.ctx.conf;
   157		struct nand_ecc_props *reqs = &nand->ecc.requirements;
   158		struct nand_ecc_props *user = &nand->ecc.user_conf;
   159		struct mtd_info *mtd = nanddev_to_mtd(nand);
 > 160		int step_size = 0, strength = 0, desired_correction = 0, steps;
 > 161		bool ecc_user = false;
   162		int cwperpage, bad_block_byte;
   163		struct qpic_ecc *ecc_cfg;
   164	
   165		cwperpage = mtd->writesize / NANDC_STEP_SIZE;
   166	
   167		ecc_cfg = kzalloc(sizeof(*ecc_cfg), GFP_KERNEL);
   168		if (!ecc_cfg)
   169			return -ENOMEM;
   170	
   171		nand->ecc.ctx.priv = ecc_cfg;
   172	
   173		if (user->step_size && user->strength) {
   174			step_size = user->step_size;
   175			strength = user->strength;
   176			ecc_user = true;
   177		} else if (reqs->step_size && reqs->strength) {
   178			step_size = reqs->step_size;
   179			strength = reqs->strength;
   180		}
   181	
   182		if (step_size && strength) {
   183			steps = mtd->writesize / step_size;
   184			desired_correction = steps * strength;
   185		}
   186	
   187		ecc_cfg->ecc_bytes_hw = 7;
   188		ecc_cfg->spare_bytes = 4;
   189		ecc_cfg->bbm_size = 1;
   190		ecc_cfg->bch_enabled = true;
   191		ecc_cfg->bytes = ecc_cfg->ecc_bytes_hw + ecc_cfg->spare_bytes + ecc_cfg->bbm_size;
   192	
   193		ecc_cfg->steps = 4;
   194		ecc_cfg->strength = 4;
   195		ecc_cfg->step_size = 512;
   196	
   197		mtd_set_ooblayout(mtd, &qcom_snand_ooblayout);
   198	
   199		ecc_cfg->cw_data = 516;
   200		ecc_cfg->cw_size = ecc_cfg->cw_data + ecc_cfg->bytes;
   201		bad_block_byte = mtd->writesize - ecc_cfg->cw_size * (cwperpage - 1) + 1;
   202	
   203		ecc_cfg->cfg0 = (cwperpage - 1) << CW_PER_PAGE
   204					| ecc_cfg->cw_data << UD_SIZE_BYTES
   205					| 1 << DISABLE_STATUS_AFTER_WRITE
   206					| 3 << NUM_ADDR_CYCLES
   207					| ecc_cfg->ecc_bytes_hw << ECC_PARITY_SIZE_BYTES_RS
   208					| 0 << STATUS_BFR_READ
   209					| 1 << SET_RD_MODE_AFTER_STATUS
   210					| ecc_cfg->spare_bytes << SPARE_SIZE_BYTES;
   211	
   212		ecc_cfg->cfg1 = 0 << NAND_RECOVERY_CYCLES
   213					| 0 <<  CS_ACTIVE_BSY
   214					| bad_block_byte << BAD_BLOCK_BYTE_NUM
   215					| 0 << BAD_BLOCK_IN_SPARE_AREA
   216					| 20 << WR_RD_BSY_GAP
   217					| 0 << WIDE_FLASH
   218					| ecc_cfg->bch_enabled << ENABLE_BCH_ECC;
   219	
   220		ecc_cfg->cfg0_raw = (cwperpage - 1) << CW_PER_PAGE
   221					| ecc_cfg->cw_size << UD_SIZE_BYTES
   222					| 3 << NUM_ADDR_CYCLES
   223					| 0 << SPARE_SIZE_BYTES;
   224	
   225		ecc_cfg->cfg1_raw = 0 << NAND_RECOVERY_CYCLES
   226					| 0 << CS_ACTIVE_BSY
   227					| 17 << BAD_BLOCK_BYTE_NUM
   228					| 1 << BAD_BLOCK_IN_SPARE_AREA
   229					| 20 << WR_RD_BSY_GAP
   230					| 0 << WIDE_FLASH
   231					| 1 << DEV0_CFG1_ECC_DISABLE;
   232	
   233		ecc_cfg->ecc_bch_cfg = !ecc_cfg->bch_enabled << ECC_CFG_ECC_DISABLE
   234					| 0 << ECC_SW_RESET
   235					| ecc_cfg->cw_data << ECC_NUM_DATA_BYTES
   236					| 1 << ECC_FORCE_CLK_OPEN
   237					| 0 << ECC_MODE
   238					| ecc_cfg->ecc_bytes_hw << ECC_PARITY_SIZE_BYTES_BCH;
   239	
   240		ecc_cfg->ecc_buf_cfg = 0x203 << NUM_STEPS;
   241		ecc_cfg->clrflashstatus = FS_READY_BSY_N;
   242		ecc_cfg->clrreadstatus = 0xc0;
   243	
   244		conf->step_size = ecc_cfg->step_size;
   245		conf->strength = ecc_cfg->strength;
   246	
   247		if (ecc_cfg->strength < strength)
   248			dev_warn(snandc->dev, "Unable to fulfill ECC requirements of %u bits.\n", strength);
   249	
   250		dev_info(snandc->dev, "ECC strength: %u bits per %u bytes\n",
   251			 ecc_cfg->strength, ecc_cfg->step_size);
   252	
   253		return 0;
   254	}
   255	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
