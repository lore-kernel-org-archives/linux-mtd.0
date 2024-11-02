Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D14FE6F07E
	for <linux-mtd@archiver.kernel.org>; Sat,  2 Nov 2024 02:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0kw6Ugn7l5m1vCjXqjRdMDO/+BxNoiUwBAQBTYiOPa4=; b=0yC427Zc3ptDKD
	65T/vRHbWJrhk66/ijV7hS0fBZT05fgB5HHG2tNWAMkgqQk0rytjed7LUXXP6pMGX5ztDh6Rze+k0
	T19qM5d2YEee2kmtvpMxu+4apYz+6gBoV2hnc5aKwzRmA1XsHhWDyE4lVYLfOuySzDLb5EgmQUN/Z
	0ztvgW2kmLJErLLiSBsNDjHzac2LNYJ+zwp35ZlMgnIrNh8ch9BICFXxmTnQ7GjRZTwiF9gn5c4bF
	rJcec/v0P1jIjyVi5YonuqHHtmE4ceIOFxoe7l3W2lLb3GdaTOWX24beyVlecsApGVIEQ7UkHEq+o
	Br9vuRSQHRiwKF8dQrrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t73Vv-00000008rIy-2zkZ;
	Sat, 02 Nov 2024 02:05:19 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t73Vr-00000008rIE-3b5I
	for linux-mtd@lists.infradead.org;
	Sat, 02 Nov 2024 02:05:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730513116; x=1762049116;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=izP0oBk62DXJy2OJ2RXIbSqrKdSfg33H0k6pVd8XtiY=;
  b=D/4Uk55qrzQ2wl5rKS1ys4ZRqCaIGkUcFMKLU6b8FGO+f1JN1HFkZ5ml
   0wXIa0D41ReDIJKzef/eYwQsCT8zQMB2X9TQQKUimKSwyZ6DoDRd8G25Z
   FssVeM1647o7878UKr0m9DHGUuX0ZHs35+HhKyxzYZhmUor/6H5SF3VMy
   UfVvUTKMvOSgipU2Z9PgA/D2+D/wMt+4i/GznvcEa8t2Vozx7Dba4bkxa
   nOUOuTE0kf1/A86lxEgujU1CDKeNW6PjGkTHvY7YR6c1uOUbpGp7cdwXn
   iw7Am70ExkEFtw3Ok9UHfAZwmbH7F2seViCIG8u98Qb/k/gnrewPTxI/G
   g==;
X-CSE-ConnectionGUID: GPqPkxEaRL2uvfRUzrhWkQ==
X-CSE-MsgGUID: Y8RJbj+US9e5Ti4XVkVwew==
X-IronPort-AV: E=McAfee;i="6700,10204,11243"; a="33127557"
X-IronPort-AV: E=Sophos;i="6.11,251,1725346800"; 
   d="scan'208";a="33127557"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 19:05:14 -0700
X-CSE-ConnectionGUID: VddqJ4heQIa+829KwFr0Lg==
X-CSE-MsgGUID: dQJrE7jnTseocIkYwXM+TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,251,1725346800"; 
   d="scan'208";a="87941872"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 01 Nov 2024 19:05:11 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t73Vk-000iIn-0R;
	Sat, 02 Nov 2024 02:05:08 +0000
Date: Sat, 2 Nov 2024 10:04:58 +0800
From: kernel test robot <lkp@intel.com>
To: Bastien Curutchet <bastien.curutchet@bootlin.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Christopher Cordahi <christophercordahi@nanometrics.ca>,
	Bastien Curutchet <bastien.curutchet@bootlin.com>
Subject: Re: [PATCH 5/5] mtd: rawnand: davinci: Implement setup_interface()
 operation
Message-ID: <202411020957.X1T8T9ZR-lkp@intel.com>
References: <20241030104717.88688-6-bastien.curutchet@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241030104717.88688-6-bastien.curutchet@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_190515_963393_B0D3D61F 
X-CRM114-Status: GOOD (  11.66  )
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

Hi Bastien,

kernel test robot noticed the following build errors:

[auto build test ERROR on krzk-mem-ctrl/for-next]
[also build test ERROR on linus/master v6.12-rc5]
[cannot apply to mtd/nand/next next-20241101]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bastien-Curutchet/memory-ti-aemif-Create-aemif_set_cs_timings/20241030-184949
base:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git for-next
patch link:    https://lore.kernel.org/r/20241030104717.88688-6-bastien.curutchet%40bootlin.com
patch subject: [PATCH 5/5] mtd: rawnand: davinci: Implement setup_interface() operation
config: arm-randconfig-003-20241101 (https://download.01.org/0day-ci/archive/20241102/202411020957.X1T8T9ZR-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241102/202411020957.X1T8T9ZR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411020957.X1T8T9ZR-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/mtd/nand/raw/davinci_nand.o: in function `davinci_nand_setup_interface':
>> davinci_nand.c:(.text+0x688): undefined reference to `aemif_set_cs_timings'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
