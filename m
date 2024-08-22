Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77A62C52D7C
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Aug 2024 03:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oxas6vicKfN03WmEfjfv5DW1llWgjx++hNJxO2cyzqA=; b=uMO0GYQmrEqn5n
	sAvpTno+cZgLSTBRtD7nEFPNIt3RqjKLtJ6kmX5OND5JQLQ1PuDFhjA+88o0idIvyI+ntAf/pKcwB
	LrFJp/OvGSNS237dfQjuMZ4pQ/voKoby4B6ka6DMBZLIub+/Sf3fUbkGNxLps4brkDkSAycuP5HXd
	leiITqY7K92exSNbYu0amBaM9NDzfYAvSwY0GVJHa5In1stt3XCd8kSF6mdkE1Gfa8VvSA4e2GebO
	hLccqi7z9nRggagHv9jxtVjkXPc055wYlMq2KV9Ya4lvdsZSw+6Wc/5zwQIiq8ZGD5PE9zF+nVHXm
	gUrY7J+Dtlk/GAuXzX+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgyIh-0000000BB9o-20Jr;
	Thu, 22 Aug 2024 03:15:51 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgxIG-0000000B2Xd-2nh8
	for linux-mtd@lists.infradead.org;
	Thu, 22 Aug 2024 02:11:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724292680; x=1755828680;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=w5uMEogYpplN4by93eWNVQKeSGT8msr3ehWaH+2WMZc=;
  b=RzAClh664rpXsAzbTvK7Q84qZTpqsH+JjvXMf6zYsepfZ/2hWBfuogBc
   rUJrzS2vypS0+fBB6jauD1KiI9ZyhVX6eHhS2SkxbgtIdg6wbHi7OU7KI
   qBhjuqallUVUtqYiyLc4CqfaSUfO2DnjmPOsGl4k3taYPgMmOlxL3eYBW
   O/qWvwscb7pvcqUNfCsdZ77L5iiX+sYEaAw+YkKSWolXO/G1L971AQWnK
   Npkp30ZO7it3VHMCS1n9pCahF7hB9WHFunl2NyjGpgcMsdXmvYRdVZOs9
   SauUfuNVpNHckoRVG9M07CJaZSOx0Q61YszAXZ5D9AnrIjxW6ZLIZO5xY
   g==;
X-CSE-ConnectionGUID: BavW5gHWS66VngsyaYwTnQ==
X-CSE-MsgGUID: qpLSWaamSESOcvTeByo2ZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="22567166"
X-IronPort-AV: E=Sophos;i="6.10,165,1719903600"; 
   d="scan'208";a="22567166"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 19:11:18 -0700
X-CSE-ConnectionGUID: lTWV99rDScG7CaNq18m0HA==
X-CSE-MsgGUID: zjJGtEdeQSuE19YuaEnKvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,165,1719903600"; 
   d="scan'208";a="92028649"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 21 Aug 2024 19:11:13 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgxI6-000CAN-28;
	Thu, 22 Aug 2024 02:11:10 +0000
Date: Thu, 22 Aug 2024 10:10:50 +0800
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
Subject: Re: [PATCH v8 2/8] mtd: rawnand: qcom: cleanup qcom_nandc driver
Message-ID: <202408220948.977WwzTe-lkp@intel.com>
References: <20240820104239.1774600-3-quic_mdalam@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240820104239.1774600-3-quic_mdalam@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_191120_766479_DA7B4F4D 
X-CRM114-Status: GOOD (  10.45  )
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
patch link:    https://lore.kernel.org/r/20240820104239.1774600-3-quic_mdalam%40quicinc.com
patch subject: [PATCH v8 2/8] mtd: rawnand: qcom: cleanup qcom_nandc driver
config: s390-randconfig-r111-20240821 (https://download.01.org/0day-ci/archive/20240822/202408220948.977WwzTe-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240822/202408220948.977WwzTe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408220948.977WwzTe-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/mtd/nand/raw/qcom_nandc.c:686:55: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le32 [usertype] val @@     got int @@
   drivers/mtd/nand/raw/qcom_nandc.c:686:55: sparse:     expected restricted __le32 [usertype] val
   drivers/mtd/nand/raw/qcom_nandc.c:686:55: sparse:     got int
   drivers/mtd/nand/raw/qcom_nandc.c:716:55: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le32 [usertype] val @@     got int @@
   drivers/mtd/nand/raw/qcom_nandc.c:716:55: sparse:     expected restricted __le32 [usertype] val
   drivers/mtd/nand/raw/qcom_nandc.c:716:55: sparse:     got int
   drivers/mtd/nand/raw/qcom_nandc.c:759:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] addr0 @@     got int @@
   drivers/mtd/nand/raw/qcom_nandc.c:759:28: sparse:     expected restricted __le32 [usertype] addr0
   drivers/mtd/nand/raw/qcom_nandc.c:759:28: sparse:     got int
   drivers/mtd/nand/raw/qcom_nandc.c:760:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] addr1 @@     got int @@
   drivers/mtd/nand/raw/qcom_nandc.c:760:28: sparse:     expected restricted __le32 [usertype] addr1
   drivers/mtd/nand/raw/qcom_nandc.c:760:28: sparse:     got int
>> drivers/mtd/nand/raw/qcom_nandc.c:779:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] cmd @@     got unsigned long @@
   drivers/mtd/nand/raw/qcom_nandc.c:779:29: sparse:     expected restricted __le32 [usertype] cmd
   drivers/mtd/nand/raw/qcom_nandc.c:779:29: sparse:     got unsigned long
   drivers/mtd/nand/raw/qcom_nandc.c:781:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] cmd @@     got unsigned long @@
   drivers/mtd/nand/raw/qcom_nandc.c:781:29: sparse:     expected restricted __le32 [usertype] cmd
   drivers/mtd/nand/raw/qcom_nandc.c:781:29: sparse:     got unsigned long
   drivers/mtd/nand/raw/qcom_nandc.c:783:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] cmd @@     got unsigned long @@
   drivers/mtd/nand/raw/qcom_nandc.c:783:21: sparse:     expected restricted __le32 [usertype] cmd
   drivers/mtd/nand/raw/qcom_nandc.c:783:21: sparse:     got unsigned long
>> drivers/mtd/nand/raw/qcom_nandc.c:787:29: sparse: sparse: restricted __le32 degrades to integer
   drivers/mtd/nand/raw/qcom_nandc.c:787:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] cfg0 @@     got unsigned int @@
   drivers/mtd/nand/raw/qcom_nandc.c:787:22: sparse:     expected restricted __le32 [usertype] cfg0
   drivers/mtd/nand/raw/qcom_nandc.c:787:22: sparse:     got unsigned int
   drivers/mtd/nand/raw/qcom_nandc.c:793:29: sparse: sparse: restricted __le32 degrades to integer
   drivers/mtd/nand/raw/qcom_nandc.c:793:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] cfg0 @@     got unsigned int @@
   drivers/mtd/nand/raw/qcom_nandc.c:793:22: sparse:     expected restricted __le32 [usertype] cfg0
   drivers/mtd/nand/raw/qcom_nandc.c:793:22: sparse:     got unsigned int
   drivers/mtd/nand/raw/qcom_nandc.c:797:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [assigned] [usertype] ecc_bch_cfg @@     got int @@
   drivers/mtd/nand/raw/qcom_nandc.c:797:29: sparse:     expected restricted __le32 [assigned] [usertype] ecc_bch_cfg
   drivers/mtd/nand/raw/qcom_nandc.c:797:29: sparse:     got int
   drivers/mtd/nand/raw/qcom_nandc.c:810:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] exec @@     got int @@
   drivers/mtd/nand/raw/qcom_nandc.c:810:27: sparse:     expected restricted __le32 [usertype] exec
   drivers/mtd/nand/raw/qcom_nandc.c:810:27: sparse:     got int
>> drivers/mtd/nand/raw/qcom_nandc.c:1824:20: sparse: sparse: invalid assignment: &=
   drivers/mtd/nand/raw/qcom_nandc.c:1824:20: sparse:    left side has type restricted __le32
   drivers/mtd/nand/raw/qcom_nandc.c:1824:20: sparse:    right side has type unsigned long
   drivers/mtd/nand/raw/qcom_nandc.c:1825:20: sparse: sparse: invalid assignment: |=
   drivers/mtd/nand/raw/qcom_nandc.c:1825:20: sparse:    left side has type restricted __le32
   drivers/mtd/nand/raw/qcom_nandc.c:1825:20: sparse:    right side has type int
   drivers/mtd/nand/raw/qcom_nandc.c:1828:27: sparse: sparse: invalid assignment: &=
   drivers/mtd/nand/raw/qcom_nandc.c:1828:27: sparse:    left side has type restricted __le32
   drivers/mtd/nand/raw/qcom_nandc.c:1828:27: sparse:    right side has type unsigned long
   drivers/mtd/nand/raw/qcom_nandc.c:1829:27: sparse: sparse: invalid assignment: |=
   drivers/mtd/nand/raw/qcom_nandc.c:1829:27: sparse:    left side has type restricted __le32
   drivers/mtd/nand/raw/qcom_nandc.c:1829:27: sparse:    right side has type int
>> drivers/mtd/nand/raw/qcom_nandc.c:1830:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] ecc_buf_cfg @@     got int @@
   drivers/mtd/nand/raw/qcom_nandc.c:1830:27: sparse:     expected restricted __le32 [usertype] ecc_buf_cfg
   drivers/mtd/nand/raw/qcom_nandc.c:1830:27: sparse:     got int
   drivers/mtd/nand/raw/qcom_nandc.c:2437:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] cfg0 @@     got int @@
   drivers/mtd/nand/raw/qcom_nandc.c:2437:20: sparse:     expected restricted __le32 [usertype] cfg0
   drivers/mtd/nand/raw/qcom_nandc.c:2437:20: sparse:     got int
   drivers/mtd/nand/raw/qcom_nandc.c:2446:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] cfg1 @@     got int @@
   drivers/mtd/nand/raw/qcom_nandc.c:2446:20: sparse:     expected restricted __le32 [usertype] cfg1
   drivers/mtd/nand/raw/qcom_nandc.c:2446:20: sparse:     got int
   drivers/mtd/nand/raw/qcom_nandc.c:2454:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] cfg0_raw @@     got int @@
   drivers/mtd/nand/raw/qcom_nandc.c:2454:24: sparse:     expected restricted __le32 [usertype] cfg0_raw
   drivers/mtd/nand/raw/qcom_nandc.c:2454:24: sparse:     got int
   drivers/mtd/nand/raw/qcom_nandc.c:2459:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] cfg1_raw @@     got int @@
   drivers/mtd/nand/raw/qcom_nandc.c:2459:24: sparse:     expected restricted __le32 [usertype] cfg1_raw
   drivers/mtd/nand/raw/qcom_nandc.c:2459:24: sparse:     got int
   drivers/mtd/nand/raw/qcom_nandc.c:2467:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] ecc_bch_cfg @@     got int @@
   drivers/mtd/nand/raw/qcom_nandc.c:2467:27: sparse:     expected restricted __le32 [usertype] ecc_bch_cfg
   drivers/mtd/nand/raw/qcom_nandc.c:2467:27: sparse:     got int
   drivers/mtd/nand/raw/qcom_nandc.c:2475:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] ecc_buf_cfg @@     got int @@
   drivers/mtd/nand/raw/qcom_nandc.c:2475:35: sparse:     expected restricted __le32 [usertype] ecc_buf_cfg
   drivers/mtd/nand/raw/qcom_nandc.c:2475:35: sparse:     got int
>> drivers/mtd/nand/raw/qcom_nandc.c:2477:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] clrflashstatus @@     got unsigned long @@
   drivers/mtd/nand/raw/qcom_nandc.c:2477:30: sparse:     expected restricted __le32 [usertype] clrflashstatus
   drivers/mtd/nand/raw/qcom_nandc.c:2477:30: sparse:     got unsigned long
>> drivers/mtd/nand/raw/qcom_nandc.c:2478:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] clrreadstatus @@     got int @@
   drivers/mtd/nand/raw/qcom_nandc.c:2478:29: sparse:     expected restricted __le32 [usertype] clrreadstatus
   drivers/mtd/nand/raw/qcom_nandc.c:2478:29: sparse:     got int
>> drivers/mtd/nand/raw/qcom_nandc.c:2561:39: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] cmd_reg @@     got int [assigned] ret @@
   drivers/mtd/nand/raw/qcom_nandc.c:2561:39: sparse:     expected restricted __le32 [usertype] cmd_reg
   drivers/mtd/nand/raw/qcom_nandc.c:2561:39: sparse:     got int [assigned] ret
   drivers/mtd/nand/raw/qcom_nandc.c:2571:49: sparse: sparse: invalid assignment: |=
   drivers/mtd/nand/raw/qcom_nandc.c:2571:49: sparse:    left side has type restricted __le32
   drivers/mtd/nand/raw/qcom_nandc.c:2571:49: sparse:    right side has type int
   drivers/mtd/nand/raw/qcom_nandc.c:2574:49: sparse: sparse: invalid assignment: |=
   drivers/mtd/nand/raw/qcom_nandc.c:2574:49: sparse:    left side has type restricted __le32
   drivers/mtd/nand/raw/qcom_nandc.c:2574:49: sparse:    right side has type unsigned char
   drivers/mtd/nand/raw/qcom_nandc.c:2659:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] exec @@     got int @@
   drivers/mtd/nand/raw/qcom_nandc.c:2659:27: sparse:     expected restricted __le32 [usertype] exec
   drivers/mtd/nand/raw/qcom_nandc.c:2659:27: sparse:     got int
   drivers/mtd/nand/raw/qcom_nandc.c:2718:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] chip_sel @@     got unsigned long @@
   drivers/mtd/nand/raw/qcom_nandc.c:2718:31: sparse:     expected restricted __le32 [usertype] chip_sel
   drivers/mtd/nand/raw/qcom_nandc.c:2718:31: sparse:     got unsigned long
   drivers/mtd/nand/raw/qcom_nandc.c:2719:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] exec @@     got int @@
   drivers/mtd/nand/raw/qcom_nandc.c:2719:27: sparse:     expected restricted __le32 [usertype] exec
   drivers/mtd/nand/raw/qcom_nandc.c:2719:27: sparse:     got int
   drivers/mtd/nand/raw/qcom_nandc.c:2757:24: sparse: sparse: restricted __le32 degrades to integer
   drivers/mtd/nand/raw/qcom_nandc.c:2758:30: sparse: sparse: invalid assignment: |=
   drivers/mtd/nand/raw/qcom_nandc.c:2758:30: sparse:    left side has type restricted __le32
   drivers/mtd/nand/raw/qcom_nandc.c:2758:30: sparse:    right side has type unsigned long
   drivers/mtd/nand/raw/qcom_nandc.c:2761:41: sparse: sparse: restricted __le32 degrades to integer
   drivers/mtd/nand/raw/qcom_nandc.c:2761:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] cfg0 @@     got unsigned int @@
   drivers/mtd/nand/raw/qcom_nandc.c:2761:35: sparse:     expected restricted __le32 [usertype] cfg0
   drivers/mtd/nand/raw/qcom_nandc.c:2761:35: sparse:     got unsigned int
   drivers/mtd/nand/raw/qcom_nandc.c:2764:24: sparse: sparse: restricted __le32 degrades to integer
   drivers/mtd/nand/raw/qcom_nandc.c:2776:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] exec @@     got int @@
   drivers/mtd/nand/raw/qcom_nandc.c:2776:27: sparse:     expected restricted __le32 [usertype] exec
   drivers/mtd/nand/raw/qcom_nandc.c:2776:27: sparse:     got int
   drivers/mtd/nand/raw/qcom_nandc.c:2779:17: sparse: sparse: restricted __le32 degrades to integer
   drivers/mtd/nand/raw/qcom_nandc.c:2813:22: sparse: sparse: invalid assignment: |=
   drivers/mtd/nand/raw/qcom_nandc.c:2813:22: sparse:    left side has type restricted __le32
   drivers/mtd/nand/raw/qcom_nandc.c:2813:22: sparse:    right side has type unsigned long
   drivers/mtd/nand/raw/qcom_nandc.c:2825:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] cfg0 @@     got int @@
   drivers/mtd/nand/raw/qcom_nandc.c:2825:27: sparse:     expected restricted __le32 [usertype] cfg0
   drivers/mtd/nand/raw/qcom_nandc.c:2825:27: sparse:     got int
   drivers/mtd/nand/raw/qcom_nandc.c:2830:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] cfg1 @@     got int @@
   drivers/mtd/nand/raw/qcom_nandc.c:2830:27: sparse:     expected restricted __le32 [usertype] cfg1
   drivers/mtd/nand/raw/qcom_nandc.c:2830:27: sparse:     got int
   drivers/mtd/nand/raw/qcom_nandc.c:2839:42: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] ecc_buf_cfg @@     got int @@
   drivers/mtd/nand/raw/qcom_nandc.c:2839:42: sparse:     expected restricted __le32 [usertype] ecc_buf_cfg
   drivers/mtd/nand/raw/qcom_nandc.c:2839:42: sparse:     got int
   drivers/mtd/nand/raw/qcom_nandc.c:2843:42: sparse: sparse: restricted __le32 degrades to integer
   drivers/mtd/nand/raw/qcom_nandc.c:2843:34: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] vld @@     got unsigned long @@
   drivers/mtd/nand/raw/qcom_nandc.c:2843:34: sparse:     expected restricted __le32 [usertype] vld
   drivers/mtd/nand/raw/qcom_nandc.c:2843:34: sparse:     got unsigned long
   drivers/mtd/nand/raw/qcom_nandc.c:2844:43: sparse: sparse: restricted __le32 degrades to integer
   drivers/mtd/nand/raw/qcom_nandc.c:2844:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] cmd1 @@     got unsigned int @@
   drivers/mtd/nand/raw/qcom_nandc.c:2844:35: sparse:     expected restricted __le32 [usertype] cmd1
   drivers/mtd/nand/raw/qcom_nandc.c:2844:35: sparse:     got unsigned int
   drivers/mtd/nand/raw/qcom_nandc.c:2848:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] exec @@     got int @@
   drivers/mtd/nand/raw/qcom_nandc.c:2848:27: sparse:     expected restricted __le32 [usertype] exec
   drivers/mtd/nand/raw/qcom_nandc.c:2848:27: sparse:     got int
   drivers/mtd/nand/raw/qcom_nandc.c:3127:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] cmd1 @@     got unsigned int @@
   drivers/mtd/nand/raw/qcom_nandc.c:3127:29: sparse:     expected restricted __le32 [usertype] cmd1
   drivers/mtd/nand/raw/qcom_nandc.c:3127:29: sparse:     got unsigned int
   drivers/mtd/nand/raw/qcom_nandc.c:3128:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] vld @@     got unsigned long @@
   drivers/mtd/nand/raw/qcom_nandc.c:3128:28: sparse:     expected restricted __le32 [usertype] vld
   drivers/mtd/nand/raw/qcom_nandc.c:3128:28: sparse:     got unsigned long
   drivers/mtd/nand/raw/qcom_nandc.c: note: in included file (through include/linux/gfp.h, include/linux/xarray.h, include/linux/radix-tree.h, ...):
   include/linux/mmzone.h:2016:40: sparse: sparse: self-comparison always evaluates to false
   include/linux/mmzone.h:2016:40: sparse: sparse: self-comparison always evaluates to false
   include/linux/mmzone.h:2016:40: sparse: sparse: self-comparison always evaluates to false

vim +686 drivers/mtd/nand/raw/qcom_nandc.c

   669	
   670	/**
   671	 * nandc_set_read_loc_first() - to set read location first register
   672	 * @chip:		NAND Private Flash Chip Data
   673	 * @reg_base:		location register base
   674	 * @cw_offset:		code word offset
   675	 * @read_size:		code word read length
   676	 * @is_last_read_loc:	is this the last read location
   677	 *
   678	 * This function will set location register value
   679	 */
   680	static void nandc_set_read_loc_first(struct nand_chip *chip,
   681					     int reg_base, int cw_offset,
   682					     int read_size, int is_last_read_loc)
   683	{
   684		struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
   685		__le32 val = (((cw_offset) << READ_LOCATION_OFFSET) |
 > 686			  ((read_size) << READ_LOCATION_SIZE) |
   687			  ((is_last_read_loc) << READ_LOCATION_LAST));
   688	
   689		if (reg_base == NAND_READ_LOCATION_0)
   690			nandc->regs->read_location0 = val;
   691		else if (reg_base == NAND_READ_LOCATION_1)
   692			nandc->regs->read_location1 = val;
   693		else if (reg_base == NAND_READ_LOCATION_2)
   694			nandc->regs->read_location2 = val;
   695		else if (reg_base == NAND_READ_LOCATION_3)
   696			nandc->regs->read_location3 = val;
   697	}
   698	
   699	/**
   700	 * nandc_set_read_loc_last - to set read location last register
   701	 * @chip:		NAND Private Flash Chip Data
   702	 * @reg_base:		location register base
   703	 * @cw_offset:		code word offset
   704	 * @read_size:		code word read length
   705	 * @is_last_read_loc:	is this the last read location
   706	 *
   707	 * This function will set location last register value
   708	 */
   709	static void nandc_set_read_loc_last(struct nand_chip *chip,
   710					    int reg_base, int cw_offset,
   711					    int read_size, int is_last_read_loc)
   712	{
   713		struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
   714	
   715		__le32 val = (((cw_offset) << READ_LOCATION_OFFSET) |
   716			  ((read_size) << READ_LOCATION_SIZE) |
   717			  ((is_last_read_loc) << READ_LOCATION_LAST));
   718	
   719		if (reg_base == NAND_READ_LOCATION_LAST_CW_0)
   720			nandc->regs->read_location_last0 = val;
   721		else if (reg_base == NAND_READ_LOCATION_LAST_CW_1)
   722			nandc->regs->read_location_last1 = val;
   723		else if (reg_base == NAND_READ_LOCATION_LAST_CW_2)
   724			nandc->regs->read_location_last2 = val;
   725		else if (reg_base == NAND_READ_LOCATION_LAST_CW_3)
   726			nandc->regs->read_location_last3 = val;
   727	}
   728	
   729	/* helper to configure location register values */
   730	static void nandc_set_read_loc(struct nand_chip *chip, int cw, int reg,
   731				       int cw_offset, int read_size, int is_last_read_loc)
   732	{
   733		struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
   734		struct nand_ecc_ctrl *ecc = &chip->ecc;
   735		int reg_base = NAND_READ_LOCATION_0;
   736	
   737		if (nandc->props->qpic_version2 && qcom_nandc_is_last_cw(ecc, cw))
   738			reg_base = NAND_READ_LOCATION_LAST_CW_0;
   739	
   740		reg_base += reg * 4;
   741	
   742		if (nandc->props->qpic_version2 && qcom_nandc_is_last_cw(ecc, cw))
   743			return nandc_set_read_loc_last(chip, reg_base, cw_offset,
   744					read_size, is_last_read_loc);
   745		else
   746			return nandc_set_read_loc_first(chip, reg_base, cw_offset,
   747					read_size, is_last_read_loc);
   748	}
   749	
   750	/* helper to configure address register values */
   751	static void set_address(struct qcom_nand_host *host, u16 column, int page)
   752	{
   753		struct nand_chip *chip = &host->chip;
   754		struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
   755	
   756		if (chip->options & NAND_BUSWIDTH_16)
   757			column >>= 1;
   758	
   759		nandc->regs->addr0 = page << 16 | column;
   760		nandc->regs->addr1 = page >> 16 & 0xff;
   761	}
   762	
   763	/*
   764	 * update_rw_regs:	set up read/write register values, these will be
   765	 *			written to the NAND controller registers via DMA
   766	 *
   767	 * @num_cw:		number of steps for the read/write operation
   768	 * @read:		read or write operation
   769	 * @cw	:		which code word
   770	 */
   771	static void update_rw_regs(struct qcom_nand_host *host, int num_cw, bool read, int cw)
   772	{
   773		struct nand_chip *chip = &host->chip;
   774		__le32 cmd, cfg0, cfg1, ecc_bch_cfg;
   775		struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
   776	
   777		if (read) {
   778			if (host->use_ecc)
 > 779				cmd = OP_PAGE_READ_WITH_ECC | PAGE_ACC | LAST_PAGE;
   780			else
   781				cmd = OP_PAGE_READ | PAGE_ACC | LAST_PAGE;
   782		} else {
   783			cmd = OP_PROGRAM_PAGE | PAGE_ACC | LAST_PAGE;
   784		}
   785	
   786		if (host->use_ecc) {
 > 787			cfg0 = (host->cfg0 & ~(7U << CW_PER_PAGE)) |
   788					(num_cw - 1) << CW_PER_PAGE;
   789	
   790			cfg1 = host->cfg1;
   791			ecc_bch_cfg = host->ecc_bch_cfg;
   792		} else {
   793			cfg0 = (host->cfg0_raw & ~(7U << CW_PER_PAGE)) |
   794					(num_cw - 1) << CW_PER_PAGE;
   795	
   796			cfg1 = host->cfg1_raw;
   797			ecc_bch_cfg = 1 << ECC_CFG_ECC_DISABLE;
   798		}
   799	
   800		nandc->regs->cmd = cmd;
   801		nandc->regs->cfg0 = cfg0;
   802		nandc->regs->cfg1 = cfg1;
   803		nandc->regs->ecc_bch_cfg = ecc_bch_cfg;
   804	
   805		if (!nandc->props->qpic_version2)
   806			nandc->regs->ecc_buf_cfg = host->ecc_buf_cfg;
   807	
   808		nandc->regs->clrflashstatus = host->clrflashstatus;
   809		nandc->regs->clrreadstatus = host->clrreadstatus;
   810		nandc->regs->exec = 1;
   811	
   812		if (read)
   813			nandc_set_read_loc(chip, cw, 0, 0, host->use_ecc ?
   814					   host->cw_data : host->cw_size, 1);
   815	}
   816	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
