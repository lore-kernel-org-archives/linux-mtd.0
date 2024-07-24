Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDEF3C3DA64
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Jul 2024 20:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TLu/Wq3Asy7oj15YPDHHMN+cKC70qXz3dOkYzaOS48M=; b=a2YbRSGbObV9iA
	CU78ZK87vEaGn8xjpZNNqpJWsSxLJ3M1iAr0PuV5jd7/uZct9WUbds8qB1au7Q/5CcVSwoNcOqIUq
	E8hIXpdWxLObA2eFep/TFX8RloAXzkIZVZ0h45Xi2HeVq1mFtiTGz6gde8Y5toUAPTjm2IEMPFRaL
	9wvMhLOfvtnkR1+/Gz5PYoEfXg/nNr4vMFTFHT61GcP3Gf11EuGbn0MvPbGQtT9Q4EbOUUhHN+uD+
	yg4TjMI1X3Acc8qsafGhFlNUaac7SGzxy9e89g7SriWFz2qwTYIPDJEyMYFT/ItW3cYs+1IKrz+Zh
	Rul0PDaVQ2eEbjENLFbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWiOq-0000000GQai-1Ozg;
	Wed, 24 Jul 2024 20:15:48 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWiOm-0000000GQZm-3eXT
	for linux-mtd@lists.infradead.org;
	Wed, 24 Jul 2024 20:15:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721852145; x=1753388145;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7nXzHDV1fxOOOmXNYkOQZk9rfzCSrtSpWQi7+Sgl3yg=;
  b=bd/K2Bpp+19SRMhy1baQKtVL76SSAG7JCaCVpUDJhsfGtECdQtKfNw/h
   6pSU3hBE9tTEkuM1cpB9ptOPhh6MvOP2Oh7xls23+aMS5lG5DKUJV5Ps1
   s5HrBJI4Cc/SIJU8hLF2vcd+SqTlm5OF0qE+GGXvTY37uQzEMR4nW52Gg
   9x4rNgoxASoS5pM3ef0EBaSNrmGtEt8zdlnfKiTdLppmdul/4bWl9zUha
   v3Yb44yKWEJByYy/Cfrw0XxedEb6LpTPUSn+sw7EkyqyL4XGIEoBiKJLJ
   18s6mff8jndd3lYw477xZ2Y/BK134/x4iAYPU7xd1oIHR3trCPfgXTu+s
   Q==;
X-CSE-ConnectionGUID: y7W4cf2iTQqeBQ8OoLCv4Q==
X-CSE-MsgGUID: VvU86j/qRxyaOM5sPKU+pQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="30948631"
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; 
   d="scan'208";a="30948631"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2024 13:15:41 -0700
X-CSE-ConnectionGUID: OIW3Vw1jSh2WDXTU5oqssw==
X-CSE-MsgGUID: QfmoQIcFTyC6ZCHVCEMiZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; 
   d="scan'208";a="75928078"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 24 Jul 2024 13:15:36 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sWiOb-000nOq-2v;
	Wed, 24 Jul 2024 20:15:33 +0000
Date: Thu, 25 Jul 2024 04:15:17 +0800
From: kernel test robot <lkp@intel.com>
To: Md Sadre Alam <quic_mdalam@quicinc.com>, broonie@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	andersson@kernel.org, konrad.dybcio@linaro.org,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	manivannan.sadhasivam@linaro.org, esben@geanix.com,
	linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, quic_mdalam@quicinc.com,
	quic_varada@quicinc.com, quic_srichara@quicinc.com
Subject: Re: [PATCH v7 2/8] mtd: rawnand: qcom: cleanup qcom_nandc driver
Message-ID: <202407250425.0AJoHyHa-lkp@intel.com>
References: <20240724114225.2176448-3-quic_mdalam@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240724114225.2176448-3-quic_mdalam@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240724_131545_011513_0E04E19F 
X-CRM114-Status: GOOD (  12.87  )
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

[auto build test WARNING on mtd/nand/next]
[also build test WARNING on broonie-spi/for-next robh/for-next linus/master v6.10 next-20240724]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Md-Sadre-Alam/spi-dt-bindings-Introduce-qcom-spi-qpic-snand/20240724-195819
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next
patch link:    https://lore.kernel.org/r/20240724114225.2176448-3-quic_mdalam%40quicinc.com
patch subject: [PATCH v7 2/8] mtd: rawnand: qcom: cleanup qcom_nandc driver
config: i386-buildonly-randconfig-004-20240725 (https://download.01.org/0day-ci/archive/20240725/202407250425.0AJoHyHa-lkp@intel.com/config)
compiler: gcc-8 (Ubuntu 8.4.0-3ubuntu2) 8.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240725/202407250425.0AJoHyHa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407250425.0AJoHyHa-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mtd/nand/raw/qcom_nandc.c:682: warning: Function parameter or struct member 'chip' not described in 'nandc_set_read_loc_first'
>> drivers/mtd/nand/raw/qcom_nandc.c:710: warning: Function parameter or struct member 'chip' not described in 'nandc_set_read_loc_last'


vim +682 drivers/mtd/nand/raw/qcom_nandc.c

   669	
   670	/**
   671	 * nandc_set_read_loc_first() - to set read location first register
   672	 * @reg_base:		location register base
   673	 * @cw_offset:		code word offset
   674	 * @read_size:		code word read length
   675	 * @is_last_read_loc:	is this the last read location
   676	 *
   677	 * This function will set location register value
   678	 */
   679	static void nandc_set_read_loc_first(struct nand_chip *chip,
   680					     int reg_base, int cw_offset,
   681					     int read_size, int is_last_read_loc)
 > 682	{
   683		struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
   684		int val = (((cw_offset) << READ_LOCATION_OFFSET) |
   685			  ((read_size) << READ_LOCATION_SIZE) |
   686			  ((is_last_read_loc) << READ_LOCATION_LAST));
   687	
   688		if (reg_base == NAND_READ_LOCATION_0)
   689			nandc->regs->read_location0 = val;
   690		else if (reg_base == NAND_READ_LOCATION_1)
   691			nandc->regs->read_location1 = val;
   692		else if (reg_base == NAND_READ_LOCATION_2)
   693			nandc->regs->read_location2 = val;
   694		else if (reg_base == NAND_READ_LOCATION_3)
   695			nandc->regs->read_location3 = val;
   696	}
   697	
   698	/**
   699	 * nandc_set_read_loc_last - to set read location last register
   700	 * @reg_base:		location register base
   701	 * @cw_offset:		code word offset
   702	 * @read_size:		code word read length
   703	 * @is_last_read_loc:	is this the last read location
   704	 *
   705	 * This function will set location last register value
   706	 */
   707	static void nandc_set_read_loc_last(struct nand_chip *chip,
   708					    int reg_base, int cw_offset,
   709					    int read_size, int is_last_read_loc)
 > 710	{
   711		struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
   712	
   713		int val = (((cw_offset) << READ_LOCATION_OFFSET) |
   714			  ((read_size) << READ_LOCATION_SIZE) |
   715			  ((is_last_read_loc) << READ_LOCATION_LAST));
   716	
   717		if (reg_base == NAND_READ_LOCATION_LAST_CW_0)
   718			nandc->regs->read_location_last0 = val;
   719		else if (reg_base == NAND_READ_LOCATION_LAST_CW_1)
   720			nandc->regs->read_location_last1 = val;
   721		else if (reg_base == NAND_READ_LOCATION_LAST_CW_2)
   722			nandc->regs->read_location_last2 = val;
   723		else if (reg_base == NAND_READ_LOCATION_LAST_CW_3)
   724			nandc->regs->read_location_last3 = val;
   725	}
   726	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
