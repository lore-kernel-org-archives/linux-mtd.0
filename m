Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33CAEC48BC4
	for <linux-mtd@archiver.kernel.org>; Sat, 17 Feb 2024 13:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d1etdVcOWSmqHWPnnjtG01kV9T0AdrT5mpxUhaG/YhY=; b=U6VTf0W9+BdTkJ
	C8mbQpAs1gXdlKbsCe9P51DQwtIt35FjFdvLTI3Sc5EqAe4q0uz5OzgK/2DcQjnKGi0Yrnu3dJCfX
	R4lZYjfb4ynhVPElq7R1KH5vp2PEowBnaZKdhBUe9nI6L5M0eqLw1lEUHAUxgCJBvdAX/njFhPqCX
	brTstRvO4qO1Ma7JjPZQb4WWeoY3cVq0cDULcjWrWWIzg0F0stXGVanH5P1uaVPx1V1TG2gVyx9Ut
	CARpLIgpx+TIXyPFqlKaVeB4f0aB0BwomAJQ9WlIfb/VicIyc4RpnLC5/7wQ5ls3S6epShBtoizfI
	13xcTkIWmEBc5RKLe/xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbL41-00000005lqN-10Fw;
	Sat, 17 Feb 2024 13:49:09 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbL3y-00000005lpa-2zia
	for linux-mtd@lists.infradead.org;
	Sat, 17 Feb 2024 13:49:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708177746; x=1739713746;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Sy3rNKIx5Ui639NRais+KmPpwAJj9NL8Ysw1j/NJYXI=;
  b=YxKK0AfeMyLYhD4UH480fz8NuuRX0BJcbDgAX0xeyNgShBrLvhWl32u2
   Cw2AEMOXG8WnUzvnbkyGEk//KGw6iB9cp1GpkQGqS6z/EYalM/6qK60FY
   26xvXfT4QWf6GpvNRGFpzG5VDd6878zJatMgA2zgF+J6AUZfKtlIuhG/+
   WD6Q+0obMCiDCa04tjhRfM/EElpATHBrX/A8xb+b9xr4K65Rz2emvr+JA
   gC+ovszMAq2fBJBBjY2ZyWRFnQuqV1nT5efXy8i+gvUAAG7aRZ3iC2ui+
   tk330rM6XfHIwDTZuYpL51hTNBN9HGGS6cjrR/JkJ7Lk4UF8alwshWdnt
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10986"; a="2428386"
X-IronPort-AV: E=Sophos;i="6.06,166,1705392000"; 
   d="scan'208";a="2428386"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2024 05:49:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,166,1705392000"; 
   d="scan'208";a="8700226"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 17 Feb 2024 05:49:01 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rbL3i-00029c-0q;
	Sat, 17 Feb 2024 13:48:55 +0000
Date: Sat, 17 Feb 2024 21:48:09 +0800
From: kernel test robot <lkp@intel.com>
To: Md Sadre Alam <quic_mdalam@quicinc.com>, andersson@kernel.org,
	konrad.dybcio@linaro.org, broonie@kernel.org, robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	manivannan.sadhasivam@linaro.org, linux-arm-msm@vger.kernel.org,
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, quic_srichara@quicinc.com,
	quic_varada@quicinc.com, quic_mdalam@quicinc.com
Subject: Re: [PATCH 3/5] spi: spi-qpic: Add qpic spi nand driver support
Message-ID: <202402172116.yfeRMLEF-lkp@intel.com>
References: <20240215134856.1313239-4-quic_mdalam@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240215134856.1313239-4-quic_mdalam@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240217_054906_825843_4ACEA454 
X-CRM114-Status: GOOD (  12.27  )
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
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240217/202402172116.yfeRMLEF-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240217/202402172116.yfeRMLEF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402172116.yfeRMLEF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/spi/spi-qpic-snand.c: In function 'qpic_snand_ecc_init_ctx_pipelined':
   drivers/spi/spi-qpic-snand.c:161:14: warning: variable 'ecc_user' set but not used [-Wunused-but-set-variable]
     161 |         bool ecc_user = false;
         |              ^~~~~~~~
   drivers/spi/spi-qpic-snand.c:160:42: warning: variable 'desired_correction' set but not used [-Wunused-but-set-variable]
     160 |         int step_size = 0, strength = 0, desired_correction = 0, steps;
         |                                          ^~~~~~~~~~~~~~~~~~
   drivers/spi/spi-qpic-snand.c: In function 'qpic_snand_read_oob':
   drivers/spi/spi-qpic-snand.c:399:13: warning: variable 'oob_buf' set but not used [-Wunused-but-set-variable]
     399 |         u8 *oob_buf;
         |             ^~~~~~~
   drivers/spi/spi-qpic-snand.c: In function 'snandc_check_error':
   drivers/spi/spi-qpic-snand.c:452:37: warning: variable 'erased' set but not used [-Wunused-but-set-variable]
     452 |         bool serial_op_err = false, erased;
         |                                     ^~~~~~
   drivers/spi/spi-qpic-snand.c: In function 'qpic_snand_write_page_cache':
>> drivers/spi/spi-qpic-snand.c:682:30: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     682 |                 snandc->wbuf = op->data.buf.out;
         |                              ^
>> drivers/spi/spi-qpic-snand.c:675:30: warning: variable 's_op' set but not used [-Wunused-but-set-variable]
     675 |         struct qpic_snand_op s_op = {};
         |                              ^~~~


vim +/const +682 drivers/spi/spi-qpic-snand.c

   671	
   672	static int qpic_snand_write_page_cache(struct qcom_nand_controller *snandc,
   673					       const struct spi_mem_op *op)
   674	{
 > 675		struct qpic_snand_op s_op = {};
   676		u32 cmd;
   677	
   678		cmd = qpic_snand_cmd_mapping(snandc, op->cmd.opcode);
   679		s_op.cmd_reg = cmd;
   680	
   681		if (op->cmd.opcode == SPINAND_PROGRAM_LOAD) {
 > 682			snandc->wbuf = op->data.buf.out;
   683			snandc->wlen = op->data.nbytes;
   684		}
   685	
   686		return 0;
   687	}
   688	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
