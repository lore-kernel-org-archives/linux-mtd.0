Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 589FBC433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Apr 2022 11:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xu820L0UTmX9HsXJL0Y5gWGoP9BLXdBhNjWF1o0z+ak=; b=a4xYMESP5qkJR4
	CGiyM5uU38tAf+6GM4I0RBUZpP3mJhu9JscEBlgwNHKMtzn0bkp366vxbGqK3K1iXubOxSlJ/xWkK
	pxpv30tB9JYFLTMBw5gSefYeXAaUaDlxxmgxL9TcA/twQ4jagllKNN28wY+QQJCJr4uomB9aSoUKl
	XzSjBdNtiiI5k9GIjHb94xAB4PMXaml0wDJhc0uT1X2PdzLlPYYpzkfyec7mMW7nGi5lxWA/Qu0Fb
	LMnCI7+MaGSBZj9BqqWV2R8ewiIlwlwZf0/2rZt2UR8Ucd0tJDOrn9xAn5609cCLG23SUIVgVHMAX
	mmvRm/gB9HROtvvYywEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbhfc-000rWU-Ng; Tue, 05 Apr 2022 11:48:24 +0000
Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbhfT-000rT9-TL; Tue, 05 Apr 2022 11:48:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649159295; x=1680695295;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Lx91HnTsU6TyC6GmdWAsmAGHgR+SGdQHhtVYtI/tJfs=;
 b=LBeEpKI4a2DN7/B8XWDH/L4ELpZXmYiDEBb6+blAnZI4ewEADqzaIHf+
 0S+BfgOBrrj5r3KEZrfx0+pT5edrr51ic42Pd1jTgkkdJKN0+/aMTgJ8X
 RhRTpZJDVF7kmPGHT09hvvFzE04ETpRuZi5OEcDteHMyciZyp8mH9bPTU
 aUUKT3CIiSMS/E2jEPASHRJ2iopavWEhyAlUTXFDXE4dywFOq+JBoZfDn
 ZqGAd7LnGwvHqiyTrMxQ9tKMlXCPoFuyjqFPA6b9wJqS0l+XvvPFAwrW5
 llBEL8g9X1pgCr9Ct8HBW3YZVtyjzhdfY+/maxobYadwhhznT3oo/h4mV g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10307"; a="285687805"
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400"; d="scan'208";a="285687805"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 04:48:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400"; d="scan'208";a="569848681"
Received: from lkp-server02.sh.intel.com (HELO a44fdfb70b94) ([10.239.97.151])
 by orsmga008.jf.intel.com with ESMTP; 05 Apr 2022 04:48:08 -0700
Received: from kbuild by a44fdfb70b94 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nbhfL-0003B9-Dt;
 Tue, 05 Apr 2022 11:48:07 +0000
Date: Tue, 5 Apr 2022 19:48:01 +0800
From: kernel test robot <lkp@intel.com>
To: Liang Yang <liang.yang@amlogic.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: kbuild-all@lists.01.org, Liang Yang <liang.yang@amlogic.com>,
 Rob Herring <robh+dt@kernel.org>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>,
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
Subject: Re: [PATCH v4 1/2] mtd: rawnand: meson: discard the common MMC sub
 clock framework
Message-ID: <202204051917.AuOOMCQd-lkp@intel.com>
References: <20220402074921.13316-2-liang.yang@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220402074921.13316-2-liang.yang@amlogic.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220405_044816_022494_59BC6B43 
X-CRM114-Status: GOOD (  12.48  )
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
[also build test ERROR on mtd/mtd/next mtd/mtd/fixes robh/for-next v5.18-rc1 next-20220405]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Liang-Yang/refine-the-NFC-clock-framework/20220402-155036
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next
config: parisc-randconfig-r001-20220405 (https://download.01.org/0day-ci/archive/20220405/202204051917.AuOOMCQd-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/c34b64ab8005a978739f157a07ed342d247fecac
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Liang-Yang/refine-the-NFC-clock-framework/20220402-155036
        git checkout c34b64ab8005a978739f157a07ed342d247fecac
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=parisc SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "devm_clk_register" [drivers/mtd/nand/raw/meson_nand.ko] undefined!
>> ERROR: modpost: "clk_divider_ops" [drivers/mtd/nand/raw/meson_nand.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
