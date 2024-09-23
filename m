Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22F30CF9C71
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Sep 2024 23:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IvdjbPnNsABT0bZhxb0pcMdYMr/ve7eIFLSknfLWQWQ=; b=ZmYgXRLQlhu+cG
	Rdb3W8bP3fZP/w6xWAJn9GFEla+NgW/syKPQ+1AjzaW1m5LxTQ1FRlpo5q75YN7nv5TexAvfterjj
	kjSJ98Zpfoy59iGXmeDX5n6oS/uIOfoFzu4kgCs5+dk3xTcr6DS8MovSn41WLmAUJhEEQCGWMJY9r
	yoRLrsgRVjTNI3XJaiMK2S0zYZI8wePWcxLYkR8KJj9xcwJna5KSiTVRQ7ghee0OEvx9Ix7SSJxfi
	1jtUKXSfTCP4A8vGvgyWn2TUbRWE2OPtxyrysi3SxX0DPPPQbMBp+Pmc6eh6C+x8JGR1cJBix25Ub
	wFqLWa8XaQR1G+oJw7sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sss57-00000000ehd-2zty;
	Mon, 23 Sep 2024 23:03:01 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sss54-00000000egC-3CIl
	for linux-mtd@lists.infradead.org;
	Mon, 23 Sep 2024 23:03:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727132578; x=1758668578;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sT2ERJf1IiiQr2+SWze8EkX9mc+I3GG3PKU3JCCVBjY=;
  b=k8TfEv5G1FmBSvKm/5JwkTLgAy8vR+KMx2acxrYJ7NyyNv3ML+IYmgo6
   hnDyvOr3zoCXd7q+0Y3Lvul4gyoaklkwvZEJJvH4u4y874mbKj5XDjYC6
   nNHLrwX59CkdwwIkWKrZGoXbnJtsPy7OU5AwsNmPWFWvBAF2onOt50BRH
   FST67rt2haErqOJUkuUkvUW9u2hCaZaLP92FqPS87Ad+DazrEcE9QKw+E
   TvPHgfHYnyOh//zsmdBaQTJQMYGGSnaokdX2P4IsNrn0PHw9k/sPvfFUn
   p0z/ukP56Abtd1c7jdr4Zyr90Paz/kw1dhSLBazSGHkMBYf48I2PbNqMp
   w==;
X-CSE-ConnectionGUID: FvSgCUSYRhOCsifaXEVvBw==
X-CSE-MsgGUID: CQq21QBXRzGFpzsqk0SwvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="43619920"
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; 
   d="scan'208";a="43619920"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 16:02:54 -0700
X-CSE-ConnectionGUID: j7WMgWH0REWhb6PcC1xKjw==
X-CSE-MsgGUID: pjBFfilMSHiuQui1WsfUtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; 
   d="scan'208";a="76138059"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 23 Sep 2024 16:02:49 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sss4s-000Hfb-0R;
	Mon, 23 Sep 2024 23:02:46 +0000
Date: Tue, 24 Sep 2024 07:02:45 +0800
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
Message-ID: <202409240634.CH4E22kp-lkp@intel.com>
References: <20240922113351.2390195-7-quic_mdalam@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240922113351.2390195-7-quic_mdalam@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_160258_876376_BC39EC14 
X-CRM114-Status: GOOD (  10.40  )
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
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20240924/202409240634.CH4E22kp-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240924/202409240634.CH4E22kp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409240634.CH4E22kp-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: drivers/spi/spi-qpic-snand.o: in function `qcom_spi_remove':
>> spi-qpic-snand.c:(.text+0x3e8): undefined reference to `qcom_nandc_unalloc'
   loongarch64-linux-ld: drivers/spi/spi-qpic-snand.o: in function `qcom_spi_probe':
>> spi-qpic-snand.c:(.text+0xb48): undefined reference to `qcom_nandc_alloc'
>> loongarch64-linux-ld: spi-qpic-snand.c:(.text+0xbe4): undefined reference to `qcom_write_reg_dma'
   loongarch64-linux-ld: spi-qpic-snand.c:(.text+0xc08): undefined reference to `qcom_write_reg_dma'
   loongarch64-linux-ld: spi-qpic-snand.c:(.text+0xc24): undefined reference to `qcom_write_reg_dma'
   loongarch64-linux-ld: spi-qpic-snand.c:(.text+0xc40): undefined reference to `qcom_write_reg_dma'
>> loongarch64-linux-ld: spi-qpic-snand.c:(.text+0xc48): undefined reference to `qcom_submit_descs'
>> loongarch64-linux-ld: spi-qpic-snand.c:(.text+0xc7c): undefined reference to `qcom_nandc_unalloc'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
