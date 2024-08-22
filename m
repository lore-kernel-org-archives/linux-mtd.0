Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB222C5320E
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Aug 2024 08:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mUNQYcJrR92x8KTj1NTEsHfCs1CWIa9A6jzlE4yMu+s=; b=WdTV4cVZZTyAzO
	5BdutyQV7VAPvmUyLgJuj0ZlWVu6t/8Kzs6EXQFuNkY1wVvEi2h9pcrDDDlXmfaomNn8IWpbi5h0B
	4zjHTTAAk5nxsDZ/8415C1q2ylxxj3V71Y5ZZxUCJ1MJ6sGiF1OzEyawEwAdVX0LOhNd+FPeSZo6n
	67EMdVeKM4acccKHpCF0za+Or/+2rTPchZRk4IuQno+V0FnybRGQUTS47yrx53dP5GGypQVGbE0KD
	BWykd14g5HTQsFyN/zrWb40RuYistk7DWhcMn8VfyiO70oSCtOzArm/MmGUW9Ratp9gE/+L4bIL26
	b0cGWCTAKw95s9QpS+JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh392-0000000C287-0Jkn;
	Thu, 22 Aug 2024 08:26:12 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh38w-0000000C27d-3HeB
	for linux-mtd@lists.infradead.org;
	Thu, 22 Aug 2024 08:26:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724315166; x=1755851166;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dB2KYzLu/Tv5zD99j9Lz99BYHd0f0NKIEZ0d6sfyKKk=;
  b=ac8OWJ5xgVmUVRZElIRwGWlmqBF7ooY2z70RZhgR9A5KWgmclaPWn6a4
   +c1E0dXGZo6d0rI0dCB/XQrROz7mp4+8c8lTvAv64eEKna3axQ80XmbQD
   VUkqAuRf1pU/14kT0kIK+Fbsq+JiMwVyYTvx8Ij7ogkoDKjt/jaXJ/Vgy
   4Y2q6B7Gf5mIp0IuSh3zRQx2dta4FY7rCakyK9iSzFkJrnm+B/xTgKH/T
   a22HL1poeW7tA/Amztjknl02sFy2BT1qeHrIAwKl40ajKBzD0e0ltTQmG
   QIHW3fK3x+ZZLksaSIlS9adcTFcwSH5hkJinBSFvzwCNZm8jr4M4OEnUr
   A==;
X-CSE-ConnectionGUID: HZ40eGhTR8+zGuU3IzMk6w==
X-CSE-MsgGUID: pO59WGfUQu2AiV7NfTv/2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="13148903"
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; 
   d="scan'208";a="13148903"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 01:26:02 -0700
X-CSE-ConnectionGUID: uYXY8uX2SiujYrUUtbnVlQ==
X-CSE-MsgGUID: lBnQwlbcQ2yPb6NGTjducQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; 
   d="scan'208";a="66310543"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 22 Aug 2024 01:25:58 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sh38l-000CZn-1X;
	Thu, 22 Aug 2024 08:25:55 +0000
Date: Thu, 22 Aug 2024 16:25:06 +0800
From: kernel test robot <lkp@intel.com>
To: Md Sadre Alam <quic_mdalam@quicinc.com>, broonie@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	andersson@kernel.org, konradybcio@kernel.org,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	manivannan.sadhasivam@linaro.org, esben@geanix.com,
	linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v8 5/8] mtd: rawnand: qcom: use FIELD_PREP and GENMASK
Message-ID: <202408221634.2JY5J8DX-lkp@intel.com>
References: <20240820104239.1774600-6-quic_mdalam@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240820104239.1774600-6-quic_mdalam@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240822_012606_916338_5931E4AB 
X-CRM114-Status: GOOD (  10.18  )
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
[also build test WARNING on broonie-spi/for-next robh/for-next linus/master v6.11-rc4 next-20240821]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Md-Sadre-Alam/spi-dt-bindings-Introduce-qcom-spi-qpic-snand/20240820-184732
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next
patch link:    https://lore.kernel.org/r/20240820104239.1774600-6-quic_mdalam%40quicinc.com
patch subject: [PATCH v8 5/8] mtd: rawnand: qcom: use FIELD_PREP and GENMASK
config: s390-randconfig-r111-20240821 (https://download.01.org/0day-ci/archive/20240822/202408221634.2JY5J8DX-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240822/202408221634.2JY5J8DX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408221634.2JY5J8DX-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/mtd/nand/raw/qcom_nandc.c:168:55: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le32 [usertype] val @@     got int @@
   drivers/mtd/nand/raw/qcom_nandc.c:168:55: sparse:     expected restricted __le32 [usertype] val
   drivers/mtd/nand/raw/qcom_nandc.c:168:55: sparse:     got int
   drivers/mtd/nand/raw/qcom_nandc.c:198:55: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le32 [usertype] val @@     got int @@
   drivers/mtd/nand/raw/qcom_nandc.c:198:55: sparse:     expected restricted __le32 [usertype] val
   drivers/mtd/nand/raw/qcom_nandc.c:198:55: sparse:     got int
   drivers/mtd/nand/raw/qcom_nandc.c:241:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] addr0 @@     got int @@
   drivers/mtd/nand/raw/qcom_nandc.c:241:28: sparse:     expected restricted __le32 [usertype] addr0
   drivers/mtd/nand/raw/qcom_nandc.c:241:28: sparse:     got int
   drivers/mtd/nand/raw/qcom_nandc.c:242:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] addr1 @@     got int @@
   drivers/mtd/nand/raw/qcom_nandc.c:242:28: sparse:     expected restricted __le32 [usertype] addr1
   drivers/mtd/nand/raw/qcom_nandc.c:242:28: sparse:     got int
   drivers/mtd/nand/raw/qcom_nandc.c:261:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] cmd @@     got unsigned long @@
   drivers/mtd/nand/raw/qcom_nandc.c:261:29: sparse:     expected restricted __le32 [usertype] cmd
   drivers/mtd/nand/raw/qcom_nandc.c:261:29: sparse:     got unsigned long
   drivers/mtd/nand/raw/qcom_nandc.c:263:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] cmd @@     got unsigned long @@
   drivers/mtd/nand/raw/qcom_nandc.c:263:29: sparse:     expected restricted __le32 [usertype] cmd
   drivers/mtd/nand/raw/qcom_nandc.c:263:29: sparse:     got unsigned long
   drivers/mtd/nand/raw/qcom_nandc.c:265:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] cmd @@     got unsigned long @@
   drivers/mtd/nand/raw/qcom_nandc.c:265:21: sparse:     expected restricted __le32 [usertype] cmd
   drivers/mtd/nand/raw/qcom_nandc.c:265:21: sparse:     got unsigned long
   drivers/mtd/nand/raw/qcom_nandc.c:269:29: sparse: sparse: restricted __le32 degrades to integer
   drivers/mtd/nand/raw/qcom_nandc.c:269:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] cfg0 @@     got unsigned int @@
   drivers/mtd/nand/raw/qcom_nandc.c:269:22: sparse:     expected restricted __le32 [usertype] cfg0
   drivers/mtd/nand/raw/qcom_nandc.c:269:22: sparse:     got unsigned int
   drivers/mtd/nand/raw/qcom_nandc.c:275:29: sparse: sparse: restricted __le32 degrades to integer
   drivers/mtd/nand/raw/qcom_nandc.c:275:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] cfg0 @@     got unsigned int @@
   drivers/mtd/nand/raw/qcom_nandc.c:275:22: sparse:     expected restricted __le32 [usertype] cfg0
   drivers/mtd/nand/raw/qcom_nandc.c:275:22: sparse:     got unsigned int
>> drivers/mtd/nand/raw/qcom_nandc.c:279:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [assigned] [usertype] ecc_bch_cfg @@     got unsigned long @@
   drivers/mtd/nand/raw/qcom_nandc.c:279:29: sparse:     expected restricted __le32 [assigned] [usertype] ecc_bch_cfg
   drivers/mtd/nand/raw/qcom_nandc.c:279:29: sparse:     got unsigned long
   drivers/mtd/nand/raw/qcom_nandc.c:292:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] exec @@     got int @@
   drivers/mtd/nand/raw/qcom_nandc.c:292:27: sparse:     expected restricted __le32 [usertype] exec
   drivers/mtd/nand/raw/qcom_nandc.c:292:27: sparse:     got int
   drivers/mtd/nand/raw/qcom_nandc.c:879:20: sparse: sparse: invalid assignment: &=
   drivers/mtd/nand/raw/qcom_nandc.c:879:20: sparse:    left side has type restricted __le32
   drivers/mtd/nand/raw/qcom_nandc.c:879:20: sparse:    right side has type unsigned long
   drivers/mtd/nand/raw/qcom_nandc.c:880:20: sparse: sparse: invalid assignment: |=
   drivers/mtd/nand/raw/qcom_nandc.c:880:20: sparse:    left side has type restricted __le32
   drivers/mtd/nand/raw/qcom_nandc.c:880:20: sparse:    right side has type int
   drivers/mtd/nand/raw/qcom_nandc.c:883:27: sparse: sparse: invalid assignment: &=
   drivers/mtd/nand/raw/qcom_nandc.c:883:27: sparse:    left side has type restricted __le32
   drivers/mtd/nand/raw/qcom_nandc.c:883:27: sparse:    right side has type unsigned long
   drivers/mtd/nand/raw/qcom_nandc.c:884:27: sparse: sparse: invalid assignment: |=
   drivers/mtd/nand/raw/qcom_nandc.c:884:27: sparse:    left side has type restricted __le32
   drivers/mtd/nand/raw/qcom_nandc.c:884:27: sparse:    right side has type int
   drivers/mtd/nand/raw/qcom_nandc.c:885:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] ecc_buf_cfg @@     got int @@
   drivers/mtd/nand/raw/qcom_nandc.c:885:27: sparse:     expected restricted __le32 [usertype] ecc_buf_cfg
   drivers/mtd/nand/raw/qcom_nandc.c:885:27: sparse:     got int
>> drivers/mtd/nand/raw/qcom_nandc.c:1490:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] cfg0 @@     got unsigned long @@
   drivers/mtd/nand/raw/qcom_nandc.c:1490:20: sparse:     expected restricted __le32 [usertype] cfg0
   drivers/mtd/nand/raw/qcom_nandc.c:1490:20: sparse:     got unsigned long
>> drivers/mtd/nand/raw/qcom_nandc.c:1499:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] cfg1 @@     got unsigned long @@
   drivers/mtd/nand/raw/qcom_nandc.c:1499:20: sparse:     expected restricted __le32 [usertype] cfg1
   drivers/mtd/nand/raw/qcom_nandc.c:1499:20: sparse:     got unsigned long
>> drivers/mtd/nand/raw/qcom_nandc.c:1506:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] cfg0_raw @@     got unsigned long @@
   drivers/mtd/nand/raw/qcom_nandc.c:1506:24: sparse:     expected restricted __le32 [usertype] cfg0_raw
   drivers/mtd/nand/raw/qcom_nandc.c:1506:24: sparse:     got unsigned long
>> drivers/mtd/nand/raw/qcom_nandc.c:1511:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] cfg1_raw @@     got unsigned long @@
   drivers/mtd/nand/raw/qcom_nandc.c:1511:24: sparse:     expected restricted __le32 [usertype] cfg1_raw
   drivers/mtd/nand/raw/qcom_nandc.c:1511:24: sparse:     got unsigned long
>> drivers/mtd/nand/raw/qcom_nandc.c:1519:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] ecc_bch_cfg @@     got unsigned long @@
   drivers/mtd/nand/raw/qcom_nandc.c:1519:27: sparse:     expected restricted __le32 [usertype] ecc_bch_cfg
   drivers/mtd/nand/raw/qcom_nandc.c:1519:27: sparse:     got unsigned long
   drivers/mtd/nand/raw/qcom_nandc.c:1527:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] ecc_buf_cfg @@     got int @@
   drivers/mtd/nand/raw/qcom_nandc.c:1527:35: sparse:     expected restricted __le32 [usertype] ecc_buf_cfg
   drivers/mtd/nand/raw/qcom_nandc.c:1527:35: sparse:     got int
   drivers/mtd/nand/raw/qcom_nandc.c:1529:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] clrflashstatus @@     got unsigned long @@
   drivers/mtd/nand/raw/qcom_nandc.c:1529:30: sparse:     expected restricted __le32 [usertype] clrflashstatus
   drivers/mtd/nand/raw/qcom_nandc.c:1529:30: sparse:     got unsigned long
   drivers/mtd/nand/raw/qcom_nandc.c:1530:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] clrreadstatus @@     got int @@
   drivers/mtd/nand/raw/qcom_nandc.c:1530:29: sparse:     expected restricted __le32 [usertype] clrreadstatus
   drivers/mtd/nand/raw/qcom_nandc.c:1530:29: sparse:     got int
   drivers/mtd/nand/raw/qcom_nandc.c:1613:39: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] cmd_reg @@     got int [assigned] ret @@
   drivers/mtd/nand/raw/qcom_nandc.c:1613:39: sparse:     expected restricted __le32 [usertype] cmd_reg
   drivers/mtd/nand/raw/qcom_nandc.c:1613:39: sparse:     got int [assigned] ret
   drivers/mtd/nand/raw/qcom_nandc.c:1623:49: sparse: sparse: invalid assignment: |=
   drivers/mtd/nand/raw/qcom_nandc.c:1623:49: sparse:    left side has type restricted __le32
   drivers/mtd/nand/raw/qcom_nandc.c:1623:49: sparse:    right side has type int
   drivers/mtd/nand/raw/qcom_nandc.c:1626:49: sparse: sparse: invalid assignment: |=
   drivers/mtd/nand/raw/qcom_nandc.c:1626:49: sparse:    left side has type restricted __le32
   drivers/mtd/nand/raw/qcom_nandc.c:1626:49: sparse:    right side has type unsigned char
   drivers/mtd/nand/raw/qcom_nandc.c:1711:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] exec @@     got int @@
   drivers/mtd/nand/raw/qcom_nandc.c:1711:27: sparse:     expected restricted __le32 [usertype] exec
   drivers/mtd/nand/raw/qcom_nandc.c:1711:27: sparse:     got int
   drivers/mtd/nand/raw/qcom_nandc.c:1770:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] chip_sel @@     got unsigned long @@
   drivers/mtd/nand/raw/qcom_nandc.c:1770:31: sparse:     expected restricted __le32 [usertype] chip_sel
   drivers/mtd/nand/raw/qcom_nandc.c:1770:31: sparse:     got unsigned long
   drivers/mtd/nand/raw/qcom_nandc.c:1771:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] exec @@     got int @@
   drivers/mtd/nand/raw/qcom_nandc.c:1771:27: sparse:     expected restricted __le32 [usertype] exec
   drivers/mtd/nand/raw/qcom_nandc.c:1771:27: sparse:     got int
   drivers/mtd/nand/raw/qcom_nandc.c:1809:24: sparse: sparse: restricted __le32 degrades to integer
   drivers/mtd/nand/raw/qcom_nandc.c:1810:30: sparse: sparse: invalid assignment: |=
   drivers/mtd/nand/raw/qcom_nandc.c:1810:30: sparse:    left side has type restricted __le32
   drivers/mtd/nand/raw/qcom_nandc.c:1810:30: sparse:    right side has type unsigned long
   drivers/mtd/nand/raw/qcom_nandc.c:1813:41: sparse: sparse: restricted __le32 degrades to integer
   drivers/mtd/nand/raw/qcom_nandc.c:1813:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] cfg0 @@     got unsigned int @@
   drivers/mtd/nand/raw/qcom_nandc.c:1813:35: sparse:     expected restricted __le32 [usertype] cfg0
   drivers/mtd/nand/raw/qcom_nandc.c:1813:35: sparse:     got unsigned int
   drivers/mtd/nand/raw/qcom_nandc.c:1816:24: sparse: sparse: restricted __le32 degrades to integer
   drivers/mtd/nand/raw/qcom_nandc.c:1828:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] exec @@     got int @@
   drivers/mtd/nand/raw/qcom_nandc.c:1828:27: sparse:     expected restricted __le32 [usertype] exec
   drivers/mtd/nand/raw/qcom_nandc.c:1828:27: sparse:     got int
   drivers/mtd/nand/raw/qcom_nandc.c:1832:17: sparse: sparse: restricted __le32 degrades to integer
   drivers/mtd/nand/raw/qcom_nandc.c:1866:22: sparse: sparse: invalid assignment: |=
   drivers/mtd/nand/raw/qcom_nandc.c:1866:22: sparse:    left side has type restricted __le32
   drivers/mtd/nand/raw/qcom_nandc.c:1866:22: sparse:    right side has type unsigned long
   drivers/mtd/nand/raw/qcom_nandc.c:1878:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] cfg0 @@     got unsigned long @@
   drivers/mtd/nand/raw/qcom_nandc.c:1878:20: sparse:     expected restricted __le32 [usertype] cfg0
   drivers/mtd/nand/raw/qcom_nandc.c:1878:20: sparse:     got unsigned long
   drivers/mtd/nand/raw/qcom_nandc.c:1883:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] cfg1 @@     got unsigned long @@
   drivers/mtd/nand/raw/qcom_nandc.c:1883:20: sparse:     expected restricted __le32 [usertype] cfg1
   drivers/mtd/nand/raw/qcom_nandc.c:1883:20: sparse:     got unsigned long
   drivers/mtd/nand/raw/qcom_nandc.c:1892:42: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] ecc_buf_cfg @@     got unsigned long @@
   drivers/mtd/nand/raw/qcom_nandc.c:1892:42: sparse:     expected restricted __le32 [usertype] ecc_buf_cfg
   drivers/mtd/nand/raw/qcom_nandc.c:1892:42: sparse:     got unsigned long
   drivers/mtd/nand/raw/qcom_nandc.c:1896:34: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] vld @@     got unsigned long @@
   drivers/mtd/nand/raw/qcom_nandc.c:1896:34: sparse:     expected restricted __le32 [usertype] vld
   drivers/mtd/nand/raw/qcom_nandc.c:1896:34: sparse:     got unsigned long
   drivers/mtd/nand/raw/qcom_nandc.c:1897:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] cmd1 @@     got unsigned int @@
   drivers/mtd/nand/raw/qcom_nandc.c:1897:35: sparse:     expected restricted __le32 [usertype] cmd1
   drivers/mtd/nand/raw/qcom_nandc.c:1897:35: sparse:     got unsigned int
   drivers/mtd/nand/raw/qcom_nandc.c:1901:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] exec @@     got int @@
   drivers/mtd/nand/raw/qcom_nandc.c:1901:27: sparse:     expected restricted __le32 [usertype] exec
   drivers/mtd/nand/raw/qcom_nandc.c:1901:27: sparse:     got int
   drivers/mtd/nand/raw/qcom_nandc.c:1904:40: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] orig_cmd1 @@     got unsigned int [usertype] cmd1 @@
   drivers/mtd/nand/raw/qcom_nandc.c:1904:40: sparse:     expected restricted __le32 [usertype] orig_cmd1
   drivers/mtd/nand/raw/qcom_nandc.c:1904:40: sparse:     got unsigned int [usertype] cmd1
   drivers/mtd/nand/raw/qcom_nandc.c:1905:39: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] orig_vld @@     got unsigned int [usertype] vld @@
   drivers/mtd/nand/raw/qcom_nandc.c:1905:39: sparse:     expected restricted __le32 [usertype] orig_vld
   drivers/mtd/nand/raw/qcom_nandc.c:1905:39: sparse:     got unsigned int [usertype] vld

vim +279 drivers/mtd/nand/raw/qcom_nandc.c

   244	
   245	/*
   246	 * update_rw_regs:	set up read/write register values, these will be
   247	 *			written to the NAND controller registers via DMA
   248	 *
   249	 * @num_cw:		number of steps for the read/write operation
   250	 * @read:		read or write operation
   251	 * @cw	:		which code word
   252	 */
   253	static void update_rw_regs(struct qcom_nand_host *host, int num_cw, bool read, int cw)
   254	{
   255		struct nand_chip *chip = &host->chip;
   256		__le32 cmd, cfg0, cfg1, ecc_bch_cfg;
   257		struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
   258	
   259		if (read) {
   260			if (host->use_ecc)
   261				cmd = OP_PAGE_READ_WITH_ECC | PAGE_ACC | LAST_PAGE;
   262			else
   263				cmd = OP_PAGE_READ | PAGE_ACC | LAST_PAGE;
   264		} else {
   265			cmd = OP_PROGRAM_PAGE | PAGE_ACC | LAST_PAGE;
   266		}
   267	
   268		if (host->use_ecc) {
   269			cfg0 = (host->cfg0 & ~(7U << CW_PER_PAGE)) |
   270					(num_cw - 1) << CW_PER_PAGE;
   271	
   272			cfg1 = host->cfg1;
   273			ecc_bch_cfg = host->ecc_bch_cfg;
   274		} else {
   275			cfg0 = (host->cfg0_raw & ~(7U << CW_PER_PAGE)) |
   276					(num_cw - 1) << CW_PER_PAGE;
   277	
   278			cfg1 = host->cfg1_raw;
 > 279			ecc_bch_cfg = ECC_CFG_ECC_DISABLE;
   280		}
   281	
   282		nandc->regs->cmd = cmd;
   283		nandc->regs->cfg0 = cfg0;
   284		nandc->regs->cfg1 = cfg1;
   285		nandc->regs->ecc_bch_cfg = ecc_bch_cfg;
   286	
   287		if (!nandc->props->qpic_version2)
   288			nandc->regs->ecc_buf_cfg = host->ecc_buf_cfg;
   289	
   290		nandc->regs->clrflashstatus = host->clrflashstatus;
   291		nandc->regs->clrreadstatus = host->clrreadstatus;
   292		nandc->regs->exec = 1;
   293	
   294		if (read)
   295			nandc_set_read_loc(chip, cw, 0, 0, host->use_ecc ?
   296					   host->cw_data : host->cw_size, 1);
   297	}
   298	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
