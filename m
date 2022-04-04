Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 403C6C433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Apr 2022 14:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uv3pIHJG00J5goXX3XyZubqAqGkUbaqgzXCLxtjHhHk=; b=UFzpXXpmysZj4j
	bWYUBQUWRYCBh5pWX0Rj2r6GYdm6ePzuShZSR/Qsupz+iP38SPJ1faHa+gjBA9+7Ofk9Js/8tf3k7
	tF1odYpoBRSzfRhkQyixfsx9XRKam0NN3dBq/YEMGnhBnGgmMOiaCGhjpS5t2GldtFvkIhoyJ5Pk8
	FFyaNb42yQsKoH4cS198McfyVg2za8OH8yvFQ4Add9jHxCkt7zpqQzTy5eTIQ+wuXaR5RUbC6BvQe
	WPglAQwKCB3cKkk1zzEXOMxah1A3wvTJFjmAxtZcbYNic1Q2uvC7IoQPjgTZVEdHK3TozAWzxhMbO
	Oacyxo1W/62jEoFV0KXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbNf6-00FK3g-Qg; Mon, 04 Apr 2022 14:26:32 +0000
Received: from mga05.intel.com ([192.55.52.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbNf4-00FK2j-0v; Mon, 04 Apr 2022 14:26:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649082390; x=1680618390;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=YFMFyz8A4KQU+l3+HDFx/zBlfNq5vKwG+g4aU+dWt+M=;
 b=Z3oa0hPRiWEhbS7Q9O9PvJv1uog26i3Ak/K5MQIgEKcl2ZfpzCtTUzvp
 DtjJmZ2rNdhStg0UX4YuFXtKVhPu8AH0F+d9ge4D1VNulhB0zBkLM01R4
 zGrs9GNmOCafDQ7uShzhxAREguekPVoKbmlVcDNgsn970GyPIUo6U0frH
 cXaO5mR5PJhEHG1gQRv6gXHrt7wh3RXtkIqK/oIAUUmoh5E4foMMcjX0y
 mqyDmO7/8/cm7G+YGrHBSXC++HmBoVxz0Bb9NECaxSjdXrx1qgv4XgfLU
 lMbknO/xdw0wxm6kwr28g1LhZtBqM0Pwt0AfY02ynD0BXtphso/pXy48/ Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10307"; a="346963709"
X-IronPort-AV: E=Sophos;i="5.90,234,1643702400"; d="scan'208";a="346963709"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2022 07:26:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,234,1643702400"; d="scan'208";a="657518638"
Received: from lkp-server02.sh.intel.com (HELO a44fdfb70b94) ([10.239.97.151])
 by orsmga004.jf.intel.com with ESMTP; 04 Apr 2022 07:26:16 -0700
Received: from kbuild by a44fdfb70b94 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nbNep-00027d-VP;
 Mon, 04 Apr 2022 14:26:15 +0000
Date: Mon, 4 Apr 2022 22:26:08 +0800
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
Message-ID: <202204042238.eZq8bjau-lkp@intel.com>
References: <20220402074921.13316-2-liang.yang@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220402074921.13316-2-liang.yang@amlogic.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_072630_151977_8709E6CD 
X-CRM114-Status: GOOD (  11.96  )
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
[also build test ERROR on mtd/mtd/next mtd/mtd/fixes robh/for-next v5.18-rc1 next-20220404]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Liang-Yang/refine-the-NFC-clock-framework/20220402-155036
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next
config: s390-randconfig-r002-20220403 (https://download.01.org/0day-ci/archive/20220404/202204042238.eZq8bjau-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/c34b64ab8005a978739f157a07ed342d247fecac
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Liang-Yang/refine-the-NFC-clock-framework/20220402-155036
        git checkout c34b64ab8005a978739f157a07ed342d247fecac
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   s390-linux-ld: drivers/mtd/nand/raw/meson_nand.o: in function `meson_nfc_probe':
   meson_nand.c:(.text+0xd9e): undefined reference to `clk_divider_ops'
>> s390-linux-ld: meson_nand.c:(.text+0xe34): undefined reference to `devm_clk_register'
   s390-linux-ld: net/core/sock.o: in function `sk_destruct':
   sock.c:(.text+0x373e): undefined reference to `__sk_defer_free_flush'

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
