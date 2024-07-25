Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1F30C3DA5D
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Jul 2024 19:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uh9IXf5KpLpNZD33JDHVHCbFAGfdG2ooj0Opz8dJeQo=; b=1JrFu3Mnfl4ng8
	IbFF5PuMjPmAIy0j7hboUFDgo0ckEAe9IYPCVSPg+tMHjrOIJuY6rgNAh4tlJtqxUi2X7DMmxgbHm
	N4znLIyvtFFX7jPfQD1cBjxUTvnqcJWaJE8P2YYX5E5pUf9uQ033O2R3lboo1Gr5gbfQrW9W7Z375
	gBV4RrWYnGMUaqC3kcVk3wi88p/hj3/6rcwXEmhfj4pKTcFtZrMJzJ48dPzGepGc/gZ1gjqzrhnyy
	2fC4B6xf/IVXtsrYhvoRD41d2dapBXZz19lcQIJsDBaQlvw881srdco+mzAzIREeiDNSXw1lkp25o
	naSgM7EdKx1fqDg9OEKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sX4LD-00000001vU5-3NNp;
	Thu, 25 Jul 2024 19:41:31 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sX4L9-00000001vT7-45kn
	for linux-mtd@lists.infradead.org;
	Thu, 25 Jul 2024 19:41:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721936488; x=1753472488;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KFT8A9cyJFd3Llr7DWfNsA64oWybLNnXui5gHgwBViU=;
  b=MWZz7OvAAgUDNXWemVKOCitZNXC6GuZp/0tvE4tdS1jphi8ffsedgFF8
   GUiw0KqpkMjL0bqsNCfxZT1AiR1H1mW1Rywcc/8xUDIBSKYh4yWnUSGJI
   bYdlrgLqgCXya8nuv7j2NkqnC3aFftMaWp0cO3gHn1groMq4hLDsz/qL9
   svv3N+x61s1XYoq7Ajz1Kc/jJFbG4A+QaJAP/pfSTr0qwuK2VvzEBtkTv
   R06RUUnkVL9wBpLXvfM5tJz9Ak/1K0DwFFJo7LPm4zb0dH6YnA4ToLDhq
   z0jjmimMoCE/ex43B2BCiNeFyVVsD2ud56gIurSPBG2HnewrNwP0iCNcn
   Q==;
X-CSE-ConnectionGUID: 6t4nkMdXQJCffGzO0hesVg==
X-CSE-MsgGUID: f8ptD34XSNmFOpqfyYN2Fg==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="23559776"
X-IronPort-AV: E=Sophos;i="6.09,236,1716274800"; 
   d="scan'208";a="23559776"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2024 12:41:26 -0700
X-CSE-ConnectionGUID: Kq2VXbNZSDGKPfSjRs3pqA==
X-CSE-MsgGUID: 9L5R5dL/TqK8cuM2he9j9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,236,1716274800"; 
   d="scan'208";a="57849925"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 25 Jul 2024 12:41:20 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sX4L0-000oP6-1M;
	Thu, 25 Jul 2024 19:41:18 +0000
Date: Fri, 26 Jul 2024 03:40:50 +0800
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
Subject: Re: [PATCH v7 4/8] mtd: nand: Add qpic_common API file
Message-ID: <202407260302.arL8EqNQ-lkp@intel.com>
References: <20240724114225.2176448-5-quic_mdalam@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240724114225.2176448-5-quic_mdalam@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240725_124128_113512_A3D1F417 
X-CRM114-Status: UNSURE (   9.92  )
X-CRM114-Notice: Please train this message.
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
[also build test WARNING on broonie-spi/for-next robh/for-next linus/master v6.10 next-20240725]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Md-Sadre-Alam/spi-dt-bindings-Introduce-qcom-spi-qpic-snand/20240724-195819
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next
patch link:    https://lore.kernel.org/r/20240724114225.2176448-5-quic_mdalam%40quicinc.com
patch subject: [PATCH v7 4/8] mtd: nand: Add qpic_common API file
config: microblaze-randconfig-r133-20240725 (https://download.01.org/0day-ci/archive/20240726/202407260302.arL8EqNQ-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240726/202407260302.arL8EqNQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407260302.arL8EqNQ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/mtd/nand/raw/qcom_nandc.c:206:50: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] read_location_last3 @@     got int val @@
   drivers/mtd/nand/raw/qcom_nandc.c:206:50: sparse:     expected restricted __le32 [usertype] read_location_last3
   drivers/mtd/nand/raw/qcom_nandc.c:206:50: sparse:     got int val
   drivers/mtd/nand/raw/qcom_nandc.c:239:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] addr0 @@     got int @@
   drivers/mtd/nand/raw/qcom_nandc.c:239:28: sparse:     expected restricted __le32 [usertype] addr0
   drivers/mtd/nand/raw/qcom_nandc.c:239:28: sparse:     got int
   drivers/mtd/nand/raw/qcom_nandc.c:240:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] addr1 @@     got int @@
   drivers/mtd/nand/raw/qcom_nandc.c:240:28: sparse:     expected restricted __le32 [usertype] addr1
   drivers/mtd/nand/raw/qcom_nandc.c:240:28: sparse:     got int
   drivers/mtd/nand/raw/qcom_nandc.c:280:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] cmd @@     got unsigned int [assigned] [usertype] cmd @@
   drivers/mtd/nand/raw/qcom_nandc.c:280:26: sparse:     expected restricted __le32 [usertype] cmd
   drivers/mtd/nand/raw/qcom_nandc.c:280:26: sparse:     got unsigned int [assigned] [usertype] cmd
   drivers/mtd/nand/raw/qcom_nandc.c:281:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] cfg0 @@     got unsigned int [assigned] [usertype] cfg0 @@
   drivers/mtd/nand/raw/qcom_nandc.c:281:27: sparse:     expected restricted __le32 [usertype] cfg0
   drivers/mtd/nand/raw/qcom_nandc.c:281:27: sparse:     got unsigned int [assigned] [usertype] cfg0
   drivers/mtd/nand/raw/qcom_nandc.c:282:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] cfg1 @@     got unsigned int [assigned] [usertype] cfg1 @@
   drivers/mtd/nand/raw/qcom_nandc.c:282:27: sparse:     expected restricted __le32 [usertype] cfg1
   drivers/mtd/nand/raw/qcom_nandc.c:282:27: sparse:     got unsigned int [assigned] [usertype] cfg1
   drivers/mtd/nand/raw/qcom_nandc.c:283:34: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] ecc_bch_cfg @@     got unsigned int [assigned] [usertype] ecc_bch_cfg @@
   drivers/mtd/nand/raw/qcom_nandc.c:283:34: sparse:     expected restricted __le32 [usertype] ecc_bch_cfg
   drivers/mtd/nand/raw/qcom_nandc.c:283:34: sparse:     got unsigned int [assigned] [usertype] ecc_bch_cfg
   drivers/mtd/nand/raw/qcom_nandc.c:286:42: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] ecc_buf_cfg @@     got unsigned int [usertype] ecc_buf_cfg @@
   drivers/mtd/nand/raw/qcom_nandc.c:286:42: sparse:     expected restricted __le32 [usertype] ecc_buf_cfg
   drivers/mtd/nand/raw/qcom_nandc.c:286:42: sparse:     got unsigned int [usertype] ecc_buf_cfg
   drivers/mtd/nand/raw/qcom_nandc.c:288:37: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] clrflashstatus @@     got unsigned int [usertype] clrflashstatus @@
   drivers/mtd/nand/raw/qcom_nandc.c:288:37: sparse:     expected restricted __le32 [usertype] clrflashstatus
   drivers/mtd/nand/raw/qcom_nandc.c:288:37: sparse:     got unsigned int [usertype] clrflashstatus
   drivers/mtd/nand/raw/qcom_nandc.c:289:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] clrreadstatus @@     got unsigned int [usertype] clrreadstatus @@
   drivers/mtd/nand/raw/qcom_nandc.c:289:36: sparse:     expected restricted __le32 [usertype] clrreadstatus
   drivers/mtd/nand/raw/qcom_nandc.c:289:36: sparse:     got unsigned int [usertype] clrreadstatus
   drivers/mtd/nand/raw/qcom_nandc.c:290:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] exec @@     got int @@
   drivers/mtd/nand/raw/qcom_nandc.c:290:27: sparse:     expected restricted __le32 [usertype] exec
   drivers/mtd/nand/raw/qcom_nandc.c:290:27: sparse:     got int
   drivers/mtd/nand/raw/qcom_nandc.c:1709:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] cmd @@     got unsigned int [addressable] [usertype] cmd_reg @@
   drivers/mtd/nand/raw/qcom_nandc.c:1709:26: sparse:     expected restricted __le32 [usertype] cmd
   drivers/mtd/nand/raw/qcom_nandc.c:1709:26: sparse:     got unsigned int [addressable] [usertype] cmd_reg
   drivers/mtd/nand/raw/qcom_nandc.c:1710:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] exec @@     got int @@
   drivers/mtd/nand/raw/qcom_nandc.c:1710:27: sparse:     expected restricted __le32 [usertype] exec
   drivers/mtd/nand/raw/qcom_nandc.c:1710:27: sparse:     got int
   drivers/mtd/nand/raw/qcom_nandc.c:1766:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] cmd @@     got unsigned int [addressable] [usertype] cmd_reg @@
   drivers/mtd/nand/raw/qcom_nandc.c:1766:26: sparse:     expected restricted __le32 [usertype] cmd
   drivers/mtd/nand/raw/qcom_nandc.c:1766:26: sparse:     got unsigned int [addressable] [usertype] cmd_reg
   drivers/mtd/nand/raw/qcom_nandc.c:1767:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] addr0 @@     got unsigned int [addressable] [usertype] addr1_reg @@
   drivers/mtd/nand/raw/qcom_nandc.c:1767:28: sparse:     expected restricted __le32 [usertype] addr0
   drivers/mtd/nand/raw/qcom_nandc.c:1767:28: sparse:     got unsigned int [addressable] [usertype] addr1_reg
   drivers/mtd/nand/raw/qcom_nandc.c:1768:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] addr1 @@     got unsigned int [addressable] [usertype] addr2_reg @@
   drivers/mtd/nand/raw/qcom_nandc.c:1768:28: sparse:     expected restricted __le32 [usertype] addr1
   drivers/mtd/nand/raw/qcom_nandc.c:1768:28: sparse:     got unsigned int [addressable] [usertype] addr2_reg
   drivers/mtd/nand/raw/qcom_nandc.c:1769:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] chip_sel @@     got unsigned long @@
   drivers/mtd/nand/raw/qcom_nandc.c:1769:31: sparse:     expected restricted __le32 [usertype] chip_sel
   drivers/mtd/nand/raw/qcom_nandc.c:1769:31: sparse:     got unsigned long
   drivers/mtd/nand/raw/qcom_nandc.c:1770:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] exec @@     got int @@
   drivers/mtd/nand/raw/qcom_nandc.c:1770:27: sparse:     expected restricted __le32 [usertype] exec
   drivers/mtd/nand/raw/qcom_nandc.c:1770:27: sparse:     got int
   drivers/mtd/nand/raw/qcom_nandc.c:1810:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] addr0 @@     got unsigned int [addressable] [assigned] [usertype] addr1_reg @@
   drivers/mtd/nand/raw/qcom_nandc.c:1810:36: sparse:     expected restricted __le32 [usertype] addr0
   drivers/mtd/nand/raw/qcom_nandc.c:1810:36: sparse:     got unsigned int [addressable] [assigned] [usertype] addr1_reg
   drivers/mtd/nand/raw/qcom_nandc.c:1811:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] addr1 @@     got unsigned int [addressable] [assigned] [usertype] addr2_reg @@
   drivers/mtd/nand/raw/qcom_nandc.c:1811:36: sparse:     expected restricted __le32 [usertype] addr1
   drivers/mtd/nand/raw/qcom_nandc.c:1811:36: sparse:     got unsigned int [addressable] [assigned] [usertype] addr2_reg
   drivers/mtd/nand/raw/qcom_nandc.c:1812:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] cfg0 @@     got unsigned int @@
   drivers/mtd/nand/raw/qcom_nandc.c:1812:35: sparse:     expected restricted __le32 [usertype] cfg0
   drivers/mtd/nand/raw/qcom_nandc.c:1812:35: sparse:     got unsigned int
   drivers/mtd/nand/raw/qcom_nandc.c:1813:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] cfg1 @@     got unsigned int [usertype] cfg1_raw @@
   drivers/mtd/nand/raw/qcom_nandc.c:1813:35: sparse:     expected restricted __le32 [usertype] cfg1
   drivers/mtd/nand/raw/qcom_nandc.c:1813:35: sparse:     got unsigned int [usertype] cfg1_raw
   drivers/mtd/nand/raw/qcom_nandc.c:1826:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] cmd @@     got unsigned int [addressable] [assigned] [usertype] cmd_reg @@
   drivers/mtd/nand/raw/qcom_nandc.c:1826:26: sparse:     expected restricted __le32 [usertype] cmd
   drivers/mtd/nand/raw/qcom_nandc.c:1826:26: sparse:     got unsigned int [addressable] [assigned] [usertype] cmd_reg
   drivers/mtd/nand/raw/qcom_nandc.c:1827:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] exec @@     got int @@
   drivers/mtd/nand/raw/qcom_nandc.c:1827:27: sparse:     expected restricted __le32 [usertype] exec
   drivers/mtd/nand/raw/qcom_nandc.c:1827:27: sparse:     got int
   drivers/mtd/nand/raw/qcom_nandc.c:1873:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] cmd @@     got unsigned int [addressable] [assigned] [usertype] cmd_reg @@
   drivers/mtd/nand/raw/qcom_nandc.c:1873:26: sparse:     expected restricted __le32 [usertype] cmd
   drivers/mtd/nand/raw/qcom_nandc.c:1873:26: sparse:     got unsigned int [addressable] [assigned] [usertype] cmd_reg
   drivers/mtd/nand/raw/qcom_nandc.c:1877:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] cfg0 @@     got int @@
   drivers/mtd/nand/raw/qcom_nandc.c:1877:27: sparse:     expected restricted __le32 [usertype] cfg0
   drivers/mtd/nand/raw/qcom_nandc.c:1877:27: sparse:     got int
   drivers/mtd/nand/raw/qcom_nandc.c:1882:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] cfg1 @@     got int @@
   drivers/mtd/nand/raw/qcom_nandc.c:1882:27: sparse:     expected restricted __le32 [usertype] cfg1
   drivers/mtd/nand/raw/qcom_nandc.c:1882:27: sparse:     got int
   drivers/mtd/nand/raw/qcom_nandc.c:1891:42: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] ecc_buf_cfg @@     got int @@
   drivers/mtd/nand/raw/qcom_nandc.c:1891:42: sparse:     expected restricted __le32 [usertype] ecc_buf_cfg
   drivers/mtd/nand/raw/qcom_nandc.c:1891:42: sparse:     got int
   drivers/mtd/nand/raw/qcom_nandc.c:1895:34: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] vld @@     got unsigned long @@
   drivers/mtd/nand/raw/qcom_nandc.c:1895:34: sparse:     expected restricted __le32 [usertype] vld
   drivers/mtd/nand/raw/qcom_nandc.c:1895:34: sparse:     got unsigned long
   drivers/mtd/nand/raw/qcom_nandc.c:1896:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] cmd1 @@     got unsigned int @@
   drivers/mtd/nand/raw/qcom_nandc.c:1896:35: sparse:     expected restricted __le32 [usertype] cmd1
   drivers/mtd/nand/raw/qcom_nandc.c:1896:35: sparse:     got unsigned int
   drivers/mtd/nand/raw/qcom_nandc.c:1900:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] exec @@     got int @@
   drivers/mtd/nand/raw/qcom_nandc.c:1900:27: sparse:     expected restricted __le32 [usertype] exec
   drivers/mtd/nand/raw/qcom_nandc.c:1900:27: sparse:     got int
   drivers/mtd/nand/raw/qcom_nandc.c:1903:40: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] orig_cmd1 @@     got unsigned int [usertype] cmd1 @@
   drivers/mtd/nand/raw/qcom_nandc.c:1903:40: sparse:     expected restricted __le32 [usertype] orig_cmd1
   drivers/mtd/nand/raw/qcom_nandc.c:1903:40: sparse:     got unsigned int [usertype] cmd1
   drivers/mtd/nand/raw/qcom_nandc.c:1904:39: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] orig_vld @@     got unsigned int [usertype] vld @@
   drivers/mtd/nand/raw/qcom_nandc.c:1904:39: sparse:     expected restricted __le32 [usertype] orig_vld
   drivers/mtd/nand/raw/qcom_nandc.c:1904:39: sparse:     got unsigned int [usertype] vld
   drivers/mtd/nand/raw/qcom_nandc.c: note: in included file:
>> include/linux/mtd/nand-qpic-common.h:446:34: sparse: sparse: marked inline, but without a definition
>> include/linux/mtd/nand-qpic-common.h:446:34: sparse: sparse: marked inline, but without a definition
>> include/linux/mtd/nand-qpic-common.h:446:34: sparse: sparse: marked inline, but without a definition
>> include/linux/mtd/nand-qpic-common.h:446:34: sparse: sparse: marked inline, but without a definition
>> include/linux/mtd/nand-qpic-common.h:446:34: sparse: sparse: marked inline, but without a definition

vim +446 include/linux/mtd/nand-qpic-common.h

   441	
   442	void qcom_free_bam_transaction(struct qcom_nand_controller *nandc);
   443	struct bam_transaction *qcom_alloc_bam_transaction(struct qcom_nand_controller *nandc);
   444	void qcom_clear_bam_transaction(struct qcom_nand_controller *nandc);
   445	void qcom_qpic_bam_dma_done(void *data);
 > 446	inline void qcom_nandc_dev_to_mem(struct qcom_nand_controller *nandc, bool is_cpu);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
