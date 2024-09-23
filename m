Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D34A8CF9C71
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Sep 2024 18:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=03bIhwSRvWtqOVRNG96Vuk2/lbAINTObg6qZjxZ07pU=; b=TxhOgD4hw9DcVo
	uCArmRDtaPdRh/PaS0JLO6omh8fvTE0neRWhGPgD6/HCJJ4G+EZDsFicxv3W571AV/lW/oCfvLEHI
	rUE8Y0rWw+rKT+m/czKE2/NBiRG6aKvnS/XZpAz6WaFa3zlWTo5Jl0ttooBR84jG5NONsRgkhXp2D
	FagpBhsxq0eaod99sZanOXBiCE13YS0aLe1VJsonRirS0u16qxN6jlXKa1Q3HVMRMiiGKs9AvrcBJ
	X/aQDvLSgsnQqMuBPqtYbO7injjdq6zJqQYZGycve9fC8jnCRD9p+/5yIPYh0DDuaLORme+hQc1jJ
	rEp0o1bUYXgAs1lHqp2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ssoC3-00000000Ig4-20s3;
	Mon, 23 Sep 2024 18:53:55 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ssoC0-00000000Ifh-3MLh
	for linux-mtd@lists.infradead.org;
	Mon, 23 Sep 2024 18:53:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727117633; x=1758653633;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wSTLsA5Ybe2xoc8o3MD/A/8FFyISsRuVdTmpWvRDFYM=;
  b=SgtRxTM2CbTo/euskbwoquiVvO/ZsjLUl0PpWqTSMvspR2i1KNfsK1hJ
   zmlxPbNIG3ip57kxQIfT43lVQpVDgNEatK/0e96hBZrogeR06qY9eIuwi
   qRECdeZ9rHBdvqdWD5E7aFzSj8naL2U9hWMJ9i6mDC+8hRVumYkTocVEr
   iGClwG8KkE2A5ioYrs7sX1xm302aLKPatfiixfmTt2SqQCp2/3uvh4YYW
   /VCg5YcQn8ZeVnmDpI6NmxkYcVoKd5tTvM0cii4AjSYZzybLWBWNXM10c
   /D4dJZ+2ru4r8ZF/HWT33Ljpc6BebB0pr2wS0qptOz9do/Y39+dx6JDxB
   Q==;
X-CSE-ConnectionGUID: Y+7xeJTcSZKE486r56AS4w==
X-CSE-MsgGUID: eZaZOltsTkmYQ2usOrx9Aw==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="37448291"
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; 
   d="scan'208";a="37448291"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 11:53:46 -0700
X-CSE-ConnectionGUID: qfKhphN1R4KM0lwsB9zRjA==
X-CSE-MsgGUID: v/ZMOK7mTO6D5F7Mfz+4Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; 
   d="scan'208";a="71155818"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 23 Sep 2024 11:53:41 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssoBm-000HWI-2t;
	Mon, 23 Sep 2024 18:53:38 +0000
Date: Tue, 24 Sep 2024 02:52:43 +0800
From: kernel test robot <lkp@intel.com>
To: Md Sadre Alam <quic_mdalam@quicinc.com>, broonie@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	andersson@kernel.org, konradybcio@kernel.org,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	manivannan.sadhasivam@linaro.org, vkoul@kernel.org,
	nikita.shubin@maquefel.me, esben@geanix.com,
	linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, quic_srichara@quicinc.com,
	quic_varada@quicinc.com, quic_mdalam@quicinc.com
Subject: Re: [PATCH v10 6/8] spi: spi-qpic: add driver for QCOM SPI NAND
 flash Interface
Message-ID: <202409240205.8sGdi5dZ-lkp@intel.com>
References: <20240922113351.2390195-7-quic_mdalam@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240922113351.2390195-7-quic_mdalam@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_115352_876399_885BA44C 
X-CRM114-Status: GOOD (  10.58  )
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

[auto build test ERROR on mtd/nand/next]
[also build test ERROR on broonie-spi/for-next robh/for-next linus/master v6.11 next-20240923]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Md-Sadre-Alam/spi-dt-bindings-Introduce-qcom-spi-qpic-snand/20240922-193748
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next
patch link:    https://lore.kernel.org/r/20240922113351.2390195-7-quic_mdalam%40quicinc.com
patch subject: [PATCH v10 6/8] spi: spi-qpic: add driver for QCOM SPI NAND flash Interface
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240924/202409240205.8sGdi5dZ-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240924/202409240205.8sGdi5dZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409240205.8sGdi5dZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: drivers/spi/spi-qpic-snand.o: in function `qcom_spi_remove':
   spi-qpic-snand.c:(.text+0x19e): undefined reference to `qcom_nandc_unalloc'
   m68k-linux-ld: drivers/spi/spi-qpic-snand.o: in function `qcom_spi_probe':
   spi-qpic-snand.c:(.text+0x5da): undefined reference to `qcom_nandc_alloc'
>> m68k-linux-ld: spi-qpic-snand.c:(.text+0x638): undefined reference to `qcom_write_reg_dma'
>> m68k-linux-ld: spi-qpic-snand.c:(.text+0x69a): undefined reference to `qcom_submit_descs'
>> m68k-linux-ld: spi-qpic-snand.c:(.text+0x6ba): undefined reference to `qcom_nandc_unalloc'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
