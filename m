Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3528D29DC4
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Jan 2026 03:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=12rx3uk9wPq4aqf+Lc5n39XwxtoMleG9rSmz7d2vVM4=; b=FYAT3WuSAItM4l
	KWT25HKRaIZ//dtU0MSntkypGg1dNf5bqHsGXQI4WJE19r6I/qqNShiXR8mHs/e+GqF50/kWALJS8
	mITBOy6PuwF1ddP7fR/yL54tBhrFQk+hMRD2skqHTQD+Fi29joBl4mLtkF09OKT8OdDZb44wK6oKa
	z9/VG5gxP8jqaMkjV6J5/NGz5l7lqgU1t+lqsb7SvcHix1f0h/lNAXFG9ijxbEdoAeMz/vXqmIXNs
	I9GTHigFnNsAa+5222DY22hQk5lamzq8l+feoGGUj0O106UwdGuz5J1I21cw7+FkJ38rP7Uj51R6h
	LXqFPNJdcHpwOsd9GiUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfUeD-00000006SpV-0WHK;
	Tue, 13 Jan 2026 03:00:45 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfUeA-00000006Sp1-1PjL;
	Tue, 13 Jan 2026 03:00:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768273242; x=1799809242;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FjWx1f6JHEspVaMYRCrMQVGMzin7f6x7Uf6YF1kLDvg=;
  b=atfnxNnEKvz5Rdc6dpFn2hGxFFyL5bRjSHsuUO5u3MR9DUqCsRd3kGLl
   vuMWJ8fQDZvm0cA/PpQndMu7b9aYeEXOT2OUkQTlNE6qSetZC7LKKDEe9
   Aq1AFyh35Vldwc95w4VPm+oh/2sbrOCtwYPw9ihPc7SZjiW49CN4GHZCd
   02jYU7xvgXXaDolyyj0FaqrSLd5E+Yp9lfJ7m1DS697v/93YTAYUCtfgD
   KYMwRG9eqjlHlenApociN38RXGmPBU5QsR4XUst2EJXt6kjkkAHyHieAD
   RV9lRCzz5oh9eeuzX6aJcgmqoQ8Qf9h5dZ0zGampRDW68HaO0ybTXulpG
   g==;
X-CSE-ConnectionGUID: Pip+9wIaSI6klo5uD1CQpg==
X-CSE-MsgGUID: Q2Col/EDSGqT2zUU3Rx8qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="80274053"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="80274053"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 19:00:41 -0800
X-CSE-ConnectionGUID: jmBMIh2ARjqRZQEtGPhxUQ==
X-CSE-MsgGUID: 4eXrquReROuJMAv2LquGeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="203422626"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 12 Jan 2026 19:00:36 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfUe2-00000000E84-0gDE;
	Tue, 13 Jan 2026 03:00:34 +0000
Date: Tue, 13 Jan 2026 10:59:34 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	=?iso-8859-1?Q?Beno=EEt?= Monin <benoit.monin@bootlin.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org,
	Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: Re: [PATCH v3 2/4] of: reserved_mem: Support multiple 'reg' entries
 for memory-region
Message-ID: <202601131045.DOJtnS0c-lkp@intel.com>
References: <20260107-mtd-memregion-v3-2-f9fc9107b992@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260107-mtd-memregion-v3-2-f9fc9107b992@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_190042_410059_4A0403C2 
X-CRM114-Status: GOOD (  10.96  )
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

Hi Gregory,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8f0b4cce4481fb22653697cced8d0d04027cb1e8]

url:    https://github.com/intel-lab-lkp/linux/commits/Gregory-CLEMENT/of-reserved_mem-Fix-placement-of-__free-annotation/20260107-211455
base:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
patch link:    https://lore.kernel.org/r/20260107-mtd-memregion-v3-2-f9fc9107b992%40bootlin.com
patch subject: [PATCH v3 2/4] of: reserved_mem: Support multiple 'reg' entries for memory-region
config: arc-allnoconfig (https://download.01.org/0day-ci/archive/20260113/202601131045.DOJtnS0c-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601131045.DOJtnS0c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601131045.DOJtnS0c-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/of/of_reserved_mem.c:746 function parameter 'rmem' not described in 'of_reserved_mem_array_lookup'
>> Warning: drivers/of/of_reserved_mem.c:902 expecting prototype for of_reserved_mem_region_count(). Prototype was for of_reserved_mem_region_total_count() instead
>> Warning: drivers/of/of_reserved_mem.c:746 function parameter 'rmem' not described in 'of_reserved_mem_array_lookup'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
