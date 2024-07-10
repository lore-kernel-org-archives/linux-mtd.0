Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 126D6C3DA41
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Jul 2024 22:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oKB44e+3YVMeYDTIRQDijuTMeZcIVPqDNUCN36VNeZ8=; b=O1FNdaraAAcCyy
	hMH6RiLyqchmGnkP+FmiuLV4mTaJq1ig+mpvI6ow8dRfnr2T5gtx5/RnjWnL/qdWUTFEwmz8sO2gG
	BJaFQsEGuSW6Hmw3t1fVqt8ZRvgdnYHEeHwrnKNLDbx3wRBngw1oMSXm9F75mCDqAmIi4K69xu1fy
	sbcOskSPgSdSIYRrOUlqP1hVftyvfzt2yi4VgDjeCSKekTHpUka8ixaB9tuHtPQMRXAg1kycezeHA
	F6eSHOhsrsSchEB7MEySfCOOQl17BG6k2ef07/5XCl8gvcnqkK8MFLxkKYGOTukHG3zU9Xsl5V16m
	BDwLbSeH/lh/fH9jzyzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRfVa-0000000Bssb-3ZHk;
	Wed, 10 Jul 2024 22:09:54 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRfVY-0000000BssA-1ee9
	for linux-mtd@lists.infradead.org;
	Wed, 10 Jul 2024 22:09:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720649392; x=1752185392;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wSMLdOaAIyfeMlYDPE9ykwDaq14eIz1cba3/eVSQBdo=;
  b=CLou8rv+TW6JB+pKAO687vVTgiUldAdEGYMJw/UpZMnN6EWfwH+Tmydy
   0RNNhpVj+bix3DSgWhH8KA9J3qP1+LFgOca361GI6M92y5TSbHuScg1iI
   0p3JUOKh88siyI6b8NkjJMf9Xctv9FXMBHSWaDlVueTBK3Bi+jF3Uz8h0
   ZakaffyEzRanbsZcoTRuYFO1WqcBGaYunQD8o1r7T34+LuS6yCYER7bPW
   HnsKZhKYrzRI/n4Kov1y5lYdZBlUMHrsgpL8cqApnLNBuswV/cBTrsqQd
   HyQKvQ8tWgUzi+SzJzZt+v+JMr5qFtkjC2wp0+wzWIyUMawP0CCo6lBhP
   g==;
X-CSE-ConnectionGUID: EWckwlyQSTurRH0dCDrv6A==
X-CSE-MsgGUID: pcejwnOlQxSjoKEQWUBc1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="20911553"
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; 
   d="scan'208";a="20911553"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 15:09:51 -0700
X-CSE-ConnectionGUID: eaqdFRdISdqNQ+NTKGO1yw==
X-CSE-MsgGUID: hl/y1xj5Q2GJi/ICes6TNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; 
   d="scan'208";a="48440999"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 10 Jul 2024 15:09:48 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRfVS-000YLq-1N;
	Wed, 10 Jul 2024 22:09:46 +0000
Date: Thu, 11 Jul 2024 06:09:02 +0800
From: kernel test robot <lkp@intel.com>
To: Cheng Ming Lin <linchengming884@gmail.com>, miquel.raynal@bootlin.com,
	vigneshr@ti.com, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, richard@nod.at,
	alvinzhou@mxic.com.tw, leoyu@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: Re: [PATCH 2/3] mtd: spinand: macronix: Fixups for PLANE_SELECT_BIT
Message-ID: <202407110520.pbPnrOlM-lkp@intel.com>
References: <20240710011541.342682-3-linchengming884@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240710011541.342682-3-linchengming884@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_150952_467202_03FEF998 
X-CRM114-Status: GOOD (  12.25  )
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

Hi Cheng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on mtd/nand/next]
[also build test WARNING on next-20240710]
[cannot apply to linus/master v6.10-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cheng-Ming-Lin/include-linux-mtd-spinand-h-Add-fixups-for-spinand/20240710-184654
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next
patch link:    https://lore.kernel.org/r/20240710011541.342682-3-linchengming884%40gmail.com
patch subject: [PATCH 2/3] mtd: spinand: macronix: Fixups for PLANE_SELECT_BIT
config: i386-randconfig-014-20240711 (https://download.01.org/0day-ci/archive/20240711/202407110520.pbPnrOlM-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240711/202407110520.pbPnrOlM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407110520.pbPnrOlM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mtd/nand/spi/macronix.c:113: warning: Function parameter or struct member 'spinand' not described in 'write_Plane_Select_bit_in_cadd'
>> drivers/mtd/nand/spi/macronix.c:113: warning: Function parameter or struct member 'req' not described in 'write_Plane_Select_bit_in_cadd'
>> drivers/mtd/nand/spi/macronix.c:113: warning: Function parameter or struct member 'column' not described in 'write_Plane_Select_bit_in_cadd'
>> drivers/mtd/nand/spi/macronix.c:113: warning: expecting prototype for Macronix serial NAND flash with a two(). Prototype was for write_Plane_Select_bit_in_cadd() instead


vim +113 drivers/mtd/nand/spi/macronix.c

   102	
   103	/**
   104	 * Macronix serial NAND flash with a two-plane structure
   105	 * should insert Plane Select bit into the column address
   106	 * during the write_to_cache operation.
   107	 * Additionally, MX35{U,F}2G14AC also need to insert Plane
   108	 * Select bit into the column address during the read_from_cache
   109	 * operation.
   110	 */
   111	static unsigned int write_Plane_Select_bit_in_cadd(struct spinand_device *spinand,
   112				const struct nand_page_io_req *req, unsigned int column)
 > 113	{
   114		struct nand_device *nand = spinand_to_nand(spinand);
   115	
   116		return column | (req->pos.plane << fls(nanddev_page_size(nand)));
   117	}
   118	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
