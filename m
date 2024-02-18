Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E10EC4829E
	for <linux-mtd@archiver.kernel.org>; Sun, 18 Feb 2024 08:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AeIuRBlj2FsCDaSA1LsULrr4rAwYGDlUO9gLSPZ1X5s=; b=HGBKmXdjj2bbx6
	ONVJQGJT3ggt1/5HK8RDQFfimSWHBJI8Kkq1TIbtZo3bCC4T83BH2K7mbiOAvwigfMizQ9dNedt2y
	2Oqnh7sd47TqcteU+kjMeObUPWQyuWTINmsBlHysnfKkkak/3SpynMyCI0mdVvYJIaXbHE3i4Z5U4
	oTYW5cqGv9Ep0pYOigLmei3ydV0Wqo4i9ulWr6f07ooGtFdXocWuIsIWl+CqUlp7Dfq2/KhbHCEls
	VxD/V9nJaflO6jJxrzHp57g98jjPyoCC9PDjJ1bQtFNMBs1iMWJYsIcBi4e8QeVXWQB2mcASBreE1
	IIFKYFgWBnepQDn71HZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbcKd-00000007I4i-03vL;
	Sun, 18 Feb 2024 08:15:27 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbcKZ-00000007I3z-3Vgr
	for linux-mtd@lists.infradead.org;
	Sun, 18 Feb 2024 08:15:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708244124; x=1739780124;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nIUi3+5qE2Fu+BpbvRSLMr1JZHmcSqsOnohOrMctUSA=;
  b=e0q2WsUMnMpsT8ZRkKNNfpe/cP8B2Ynvtxsj25mCfoDv9qXrLFNJkFxQ
   qW47CJXfL6HlHrL5zJEjg5ypI+NVXu4UsfvdoJ/rGbBTfVODEXN0Oxk9q
   i56H9Jodie6W5wv4iv3K5cTOlUj5FniNmGtHNYe2pg8usELz+7LcwmDFc
   8DWHTvjgLqMoVgolQbn4WY5vnMgbLmYbEH9OYD02rOGhFkFJCBo4/kzKY
   8z6Wl0D8ee+axhBTq7LUxUy6TkNzEKfPgnvntCKM6tVH/GJ5Bq+kEebwT
   dJ0r+uegW8kwh1NIRpgDBn00o4iYlQI/YQoLBLN32voEkqZGLV/Y1SxN1
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10987"; a="2199074"
X-IronPort-AV: E=Sophos;i="6.06,168,1705392000"; 
   d="scan'208";a="2199074"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2024 00:15:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,168,1705392000"; 
   d="scan'208";a="35259770"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 18 Feb 2024 00:15:18 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rbcKR-0002tA-2n;
	Sun, 18 Feb 2024 08:15:15 +0000
Date: Sun, 18 Feb 2024 16:14:38 +0800
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
Message-ID: <202402181614.N6WuWtRU-lkp@intel.com>
References: <20240215134856.1313239-4-quic_mdalam@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240215134856.1313239-4-quic_mdalam@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240218_001523_949311_1D08768A 
X-CRM114-Status: GOOD (  11.53  )
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

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20240215]
[also build test ERROR on linus/master v6.8-rc4]
[cannot apply to mtd/nand/next broonie-spi/for-next robh/for-next v6.8-rc4 v6.8-rc3 v6.8-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Md-Sadre-Alam/spi-dt-bindings-add-binding-doc-for-spi-qpic-snand/20240215-215348
base:   next-20240215
patch link:    https://lore.kernel.org/r/20240215134856.1313239-4-quic_mdalam%40quicinc.com
patch subject: [PATCH 3/5] spi: spi-qpic: Add qpic spi nand driver support
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240218/202402181614.N6WuWtRU-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240218/202402181614.N6WuWtRU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402181614.N6WuWtRU-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/spi/spi-qpic-snand.c:161:7: warning: variable 'ecc_user' set but not used [-Wunused-but-set-variable]
           bool ecc_user = false;
                ^
   drivers/spi/spi-qpic-snand.c:160:35: warning: variable 'desired_correction' set but not used [-Wunused-but-set-variable]
           int step_size = 0, strength = 0, desired_correction = 0, steps;
                                            ^
   drivers/spi/spi-qpic-snand.c:399:6: warning: variable 'oob_buf' set but not used [-Wunused-but-set-variable]
           u8 *oob_buf;
               ^
   drivers/spi/spi-qpic-snand.c:452:30: warning: variable 'erased' set but not used [-Wunused-but-set-variable]
           bool serial_op_err = false, erased;
                                       ^
>> drivers/spi/spi-qpic-snand.c:682:16: error: assigning to 'u8 *' (aka 'unsigned char *') from 'const void *const' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
                   snandc->wbuf = op->data.buf.out;
                                ^ ~~~~~~~~~~~~~~~~
   4 warnings and 1 error generated.


vim +682 drivers/spi/spi-qpic-snand.c

   671	
   672	static int qpic_snand_write_page_cache(struct qcom_nand_controller *snandc,
   673					       const struct spi_mem_op *op)
   674	{
   675		struct qpic_snand_op s_op = {};
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
