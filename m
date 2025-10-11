Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59984CCD187
	for <linux-mtd@archiver.kernel.org>; Sat, 11 Oct 2025 01:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UbIAIhN7BiiCnDoM97pwYiXP/ILKi2+rvjG+gCkrOpY=; b=i3xmgaBr/Yvp/Z
	iiIFnlWNvKn8H0wRv1fWk6V90R3jAAvXrmLV7cPFG/SB/QwhB+uQrzeU6Bu2ObSC7oSntUusEqD7c
	HERYUxAgACKGBulk/jUJlimbiT4rs7rlo4NQXtNdDybKlLaMFwcKsOQm7vvJtcjiVRYghCUijY6u5
	D6R9UvCWafbpEM5LifMYp7R9Ppm590CcKm5yaEjsEcNccb+dhr+FPrmizjTPvkqXullb5Ml0CstkF
	hZcsbDZaQJ1/X13y56WrsY68Tymw2cWqqkbAwxW1Wg5WIIXsN1FBS3Ivb0+9LXfA4yj68JPptec1i
	nFxQNLJXkMFCAdzvVkKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Nzl-00000009cDi-2dHX;
	Sat, 11 Oct 2025 01:02:01 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Nzf-00000009cDH-1J9v;
	Sat, 11 Oct 2025 01:01:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760144516; x=1791680516;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=p7fX/+rgWeulRXhHhTpwOa6jJqqMEZgpg+PPc1ne51Y=;
  b=kyWlouqw6ebz0lyUPkhJT+tuip0AEl4AJQLW/cRuPKhoRVRqK4192f4A
   XOPYuVOWR+elNuosyBpP1Hj9G6LvjA0bFgZQhf3LZlfPbsouit2NRLGA8
   VPqdUJQbCpE+7Ypg6l6Uf8LWJy8xp9q6DdGvaUmosxAXfTuM+xkvg06tY
   NV8SF0KploN6gObwsLOBf41/8UkA/qRkpMcU4VrRcR0nVraRedU0wIO0z
   Yqoft8obAGP4mPu7FnINVKxCsaeh1752V6lQANIffqXCWDHuOBbCa1/8G
   whcW0gsSlQZQweqHtg+KLmSB+y2qwARZ+kjyo12QLeKTB8bFEXOTntTNR
   w==;
X-CSE-ConnectionGUID: fOpw2t7IRjWHsZn5r/43Rg==
X-CSE-MsgGUID: N9G6hplWQlyzOE7qYulKrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="66195395"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="66195395"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2025 18:01:54 -0700
X-CSE-ConnectionGUID: YYXD5VaDQ4OSv0yvz6dJvg==
X-CSE-MsgGUID: HyLT0645TUShK87mEYH45g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; 
   d="scan'208";a="186222886"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 10 Oct 2025 18:01:49 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7NzW-0003M3-13;
	Sat, 11 Oct 2025 01:01:46 +0000
Date: Sat, 11 Oct 2025 09:00:59 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Genoud <richard.genoud@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Wentao Liang <vulab@iscas.ac.cn>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Genoud <richard.genoud@bootlin.com>
Subject: Re: [PATCH 15/15] mtd: rawnand: sunxi: Add support for H616 nand
 controller
Message-ID: <202510110828.Xb6hqQvx-lkp@intel.com>
References: <20251010084042.341224-16-richard.genoud@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251010084042.341224-16-richard.genoud@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_180155_450196_84714461 
X-CRM114-Status: GOOD (  12.37  )
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

Hi Richard,

kernel test robot noticed the following build warnings:

[auto build test WARNING on mtd/nand/next]
[also build test WARNING on mtd/mtd/next mtd/mtd/fixes sunxi/sunxi/for-next robh/for-next linus/master v6.17 next-20251010]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Richard-Genoud/mtd-rawnand-sunxi-Remove-superfluous-register-readings/20251010-164637
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next
patch link:    https://lore.kernel.org/r/20251010084042.341224-16-richard.genoud%40bootlin.com
patch subject: [PATCH 15/15] mtd: rawnand: sunxi: Add support for H616 nand controller
config: riscv-randconfig-002-20251011 (https://download.01.org/0day-ci/archive/20251011/202510110828.Xb6hqQvx-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 39f292ffa13d7ca0d1edff27ac8fd55024bb4d19)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251011/202510110828.Xb6hqQvx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510110828.Xb6hqQvx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/mtd/nand/raw/sunxi_nand.c:351 struct member 'mbus_clk' not described in 'sunxi_nfc'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
