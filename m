Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B20DCD6E6B
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Jun 2026 08:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I3whNdjJczTZZwLPqz/keG9gwXWuViK7EESEMdMfjp8=; b=xGu7tGA1gCbatN
	45lEBtqbxiTReqMKtZl761vmQ7tv3/ofHN0KdvG4hI6ln2yC2FH2GnlkE0gDSCEGYoy4RQLPlcH5Q
	gZ3Vh49gzGOZHWwzvqEnPltMGA3LEBJcguTuARrTqz/akkoA1LcLcgYeWWuzHEryabL7VVdKCQ53+
	wjl8t43UZI3CQdBxfApnItHMJNMB8x+5hahaXNGxwUzFO7b3PvJAZviFk30rMP7TSuyocvZYqY3Bc
	CHrl6kHmqnkEkZ0knUqTJpaXPIPZvLjXMcwjiqcc2avgKL5kImG45kUmX8Cygiu0zIV4Sggh7zVrs
	lZ1HZpA3lVo6+Wjn2u2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVPbF-00000000Hrr-2Txr;
	Fri, 05 Jun 2026 08:08:17 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVPbD-00000000HrM-0omy
	for linux-mtd@lists.infradead.org;
	Fri, 05 Jun 2026 08:08:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780646896; x=1812182896;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0CCvZFCoz8MQYHFETcZzaIs2wCrCUe0u91eQVSo2Cv8=;
  b=jnvi+S5ilVMrt+8dt+QchPL4rBAhdJYKEfR428e4jq5zDVvDD6G2lhX5
   3UAN4sVv2IH8aOfGdDYkF8i2GWTQNiznnc3y0rbLuOc2piRGe68DytK4e
   He4Xit6sCWF/8Fh2vf9tloUHS+0Rw6KhEA/IBUISPWW+64hsoUeKRiOif
   7lMjmBy11XISVWP72C/HkwXXMBIIOszFMCuqlhjqFo9PBdoiQqvviZueR
   rgQiE7JpYAIQYvdnurnAalbPvxLi+vjMIR1/0AGqKOf5dWF72FlHtoylW
   YgsNVfro/esqZwFA1OwpUHiEO6CQNAzIf0YJVlwlynN378yqCvMn7oYCk
   g==;
X-CSE-ConnectionGUID: uX8nGrIzSOiU8lm9Z/vwMw==
X-CSE-MsgGUID: dOuiFkqjQfuTBjz8+4mv5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="92965798"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="92965798"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 01:08:15 -0700
X-CSE-ConnectionGUID: Nl+72zvvSDGF2AEiyZlixQ==
X-CSE-MsgGUID: aZH4O/5ZS+KMnMhXfE5Jag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="282867931"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 05 Jun 2026 01:08:11 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVPb7-000000002Vt-0A7U;
	Fri, 05 Jun 2026 08:08:09 +0000
Date: Fri, 5 Jun 2026 10:07:10 +0200
From: kernel test robot <lkp@intel.com>
To: Cheng Ming Lin <linchengming884@gmail.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, alvinzhou@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>, stable@vger.kernel.org
Subject: Re: [PATCH v2 2/2] mtd: spi-nor: macronix: Restore fallback
 parameters for MX25L12805D
Message-ID: <202606051000.gRYPMoXy-lkp@intel.com>
References: <20260605005720.1857413-3-linchengming884@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260605005720.1857413-3-linchengming884@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_010815_273541_7C1E2159 
X-CRM114-Status: GOOD (  12.26  )
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

kernel test robot noticed the following build errors:

[auto build test ERROR on mtd/spi-nor/next]
[also build test ERROR on linus/master v7.1-rc6 next-20260604]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cheng-Ming-Lin/mtd-spi-nor-Add-support-for-MX25L12833F-and-MX25L12845G/20260605-090612
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git spi-nor/next
patch link:    https://lore.kernel.org/r/20260605005720.1857413-3-linchengming884%40gmail.com
patch subject: [PATCH v2 2/2] mtd: spi-nor: macronix: Restore fallback parameters for MX25L12805D
config: x86_64-rhel-9.4-func (https://download.01.org/0day-ci/archive/20260605/202606051000.gRYPMoXy-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260605/202606051000.gRYPMoXy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606051000.gRYPMoXy-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/mtd/spi-nor/macronix.c:119:22: error: initialization of 'int (*)(struct spi_nor *, const struct sfdp_parameter_header *, const struct sfdp_bfpt *)' from incompatible pointer type 'int (*)(struct spi_nor *)' [-Wincompatible-pointer-types]
     119 |         .post_bfpt = mx25l12805d_4pp3b_post_bfpt_fixups,
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/spi-nor/macronix.c:119:22: note: (near initialization for 'mx25l12805d_4pp3b_fixups.post_bfpt')


vim +119 drivers/mtd/spi-nor/macronix.c

   117	
   118	static const struct spi_nor_fixups mx25l12805d_4pp3b_fixups = {
 > 119		.post_bfpt = mx25l12805d_4pp3b_post_bfpt_fixups,
   120	};
   121	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
