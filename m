Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D563C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Feb 2022 13:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GeeYPQKxEaq8uRd4l+fJl/7vxAs5spxTZCXe1rvIrq0=; b=RSGEGw5FF6R/QH
	aHWuqQ/pd6QHlTWurM/kmtXdedrgYZfr40dtrm84HW6gwmKGCfa7nU4mYXaZpz6J7Vl5laqdsb+nm
	QGL0vPCr5RVzw/Mp4spr9x4Pp66S4qyv63bKBT6KR4tcyb13oKWwcCDDsPXuJ08zeWtGnbIsQ8Hfx
	HxEPPI2QI/IBOf/m6htRjeGoUhsWHhDW+LfQIWjUnroxGfYvycGmfeTzfwaeBjEOf0SrgyuAsWKJs
	mnk2GkEHk1QBI4N9r5UAc2pTSNlYbDyAT6xlzaWamX5KC2McBsXZ5dA6aUsXifzACR9XVORw10rBS
	Zaln7NtgKoI3oxX4rX6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKgTv-00AWWs-00; Thu, 17 Feb 2022 13:05:59 +0000
Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKgTr-00AWW6-Ix; Thu, 17 Feb 2022 13:05:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645103155; x=1676639155;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=y40DBqaIdT6zBhrgCBj8cBu666AKZYDew2yl1iQwfVY=;
 b=IGafNkaSz3Dhhi06l/1LRBQISWYpZWR2qqLyzeoHrFaFLn7vPKAIHCvR
 wFKdF1gHIyYTYtZnF45ObLc8YXUHU4CPIa+yfUtWJ1SkcB+NLHGHAEj9i
 7FuRwmC8HgRQxETHOXy53qUaT76wN5c/zVOWSJjliA5WZmeB1vpTVWVdZ
 Tuog+3D30EKqQx8NobQTnakVq6MVNTb6PdFV8a8iy2+bG/sBZbtMde8bO
 RT43dUid2kup0FpM7sRvAvmBMgCi8Xzi7O41DkTMbVQZZ5jnFtcDh/9/r
 Ln23t2ZdRBcaL2GkIbLPj8jAwDn3GbGtJnnNHBrIrcBTWuNwAJjUHWvZ4 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10260"; a="250604320"
X-IronPort-AV: E=Sophos;i="5.88,375,1635231600"; d="scan'208";a="250604320"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 05:05:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,375,1635231600"; d="scan'208";a="589386402"
Received: from lkp-server01.sh.intel.com (HELO 6f05bf9e3301) ([10.239.97.150])
 by fmsmga008.fm.intel.com with ESMTP; 17 Feb 2022 05:05:50 -0800
Received: from kbuild by 6f05bf9e3301 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nKgTl-0000D7-BO; Thu, 17 Feb 2022 13:05:49 +0000
Date: Thu, 17 Feb 2022 21:05:02 +0800
From: kernel test robot <lkp@intel.com>
To: Liang Yang <liang.yang@amlogic.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
 Liang Yang <liang.yang@amlogic.com>, Rob Herring <robh+dt@kernel.org>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Jianxin Pan <jianxin.pan@amlogic.com>,
 Victor Wan <victor.wan@amlogic.com>,
 XianWei Zhao <xianwei.zhao@amlogic.com>,
 Kelvin Zhang <kelvin.zhang@amlogic.com>,
 BiChao Zheng <bichao.zheng@amlogic.com>,
 YongHui Yu <yonghui.yu@amlogic.com>, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH RESEND v2 1/2] mtd: rawnand: meson: discard the common
 MMC sub clock framework
Message-ID: <202202172131.hVJG538q-lkp@intel.com>
References: <20220217063346.21691-2-liang.yang@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220217063346.21691-2-liang.yang@amlogic.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_050555_695909_0B0F5871 
X-CRM114-Status: GOOD (  12.84  )
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

Hi Liang,

I love your patch! Yet something to improve:

[auto build test ERROR on mtd/nand/next]
[also build test ERROR on mtd/mtd/next mtd/mtd/fixes robh/for-next v5.17-rc4 next-20220217]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Liang-Yang/refine-the-NFC-clock-framework/20220217-145053
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next
config: hexagon-randconfig-r013-20220217 (https://download.01.org/0day-ci/archive/20220217/202202172131.hVJG538q-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0bad7cb56526f2572c74449fcf97c1fcda42b41d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/d3d7ef65145346ff8212125d56afff6290a5ab68
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Liang-Yang/refine-the-NFC-clock-framework/20220217-145053
        git checkout d3d7ef65145346ff8212125d56afff6290a5ab68
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __clk_get_name
   >>> referenced by meson_nand.c
   >>> mtd/nand/raw/meson_nand.o:(meson_nfc_probe) in archive drivers/built-in.a
   >>> referenced by meson_nand.c
   >>> mtd/nand/raw/meson_nand.o:(meson_nfc_probe) in archive drivers/built-in.a
--
>> ld.lld: error: undefined symbol: clk_divider_ops
   >>> referenced by meson_nand.c
   >>> mtd/nand/raw/meson_nand.o:(meson_nfc_probe) in archive drivers/built-in.a
   >>> referenced by meson_nand.c
   >>> mtd/nand/raw/meson_nand.o:(meson_nfc_probe) in archive drivers/built-in.a
--
>> ld.lld: error: undefined symbol: devm_clk_register
   >>> referenced by meson_nand.c
   >>> mtd/nand/raw/meson_nand.o:(meson_nfc_probe) in archive drivers/built-in.a
   >>> referenced by meson_nand.c
   >>> mtd/nand/raw/meson_nand.o:(meson_nfc_probe) in archive drivers/built-in.a

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
