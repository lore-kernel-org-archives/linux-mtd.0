Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34F35C433EF
	for <linux-mtd@archiver.kernel.org>; Sat, 14 May 2022 01:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lkzl+v+tWktguR+1rUAmkX699V2NPGDjWhwY+DA1lWg=; b=3diRJLofmbw3Ad
	k6UGLfdjkoAkxgbOFUSXhvkil4SrzfoAFF5lIDgIeuq0I+JtC1u0jr+ZdmlWNseajwV8IaRnxfZ3p
	Olo7WB/7ewJBVE/c8zrwjWuwmMT6R1QWnVjic7gLhrubF078T3R7hQXZHOmvdsqJHwtAyDKsudHaf
	v0C911PkmQU5Gc2OW/qmOXSAU1Cs27wifi1QzqcN7e9rBx+8zpDBUbwXcO0Yfv+Wp2AHdzyhxbEBa
	5W3Ba2wl+KCl1wXFi7DEVLiMSHfH9Ms5/cGEebmlHCKEwMpT1dqVIMUzDm6HUj4DiMnwGDKlTN4LH
	2LLmQh6WJrLYVB6gBaOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npgxg-000WgS-Fu; Sat, 14 May 2022 01:52:52 +0000
Received: from mga04.intel.com ([192.55.52.120])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npgxR-000Wfi-GW; Sat, 14 May 2022 01:52:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652493157; x=1684029157;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=RcLuLGGwbVePLOb+KFTMTX4VKymqOx1Gc+kdRlxjhqc=;
 b=h9pmVTIk7vgx4Opviq0YH8impYetjeo9xjbqjR3ggaOrQuUYYSyaoGAL
 j4AnjaUMph2jpxA6v6icPfuFWryqO9ZlvXYe9J5RimghNsWA4Mnw/jcrA
 W4qeAIPn950FIg7wzeYqUY/axWKmk+myzcI2GXZ/RQQ4s4oMxLLYzUaFX
 Vh2jnf1s/moIVQD2C2rlKHHIOmmBP23JfdBsEV6Sbmg0Sbwf0+AF7Cpnt
 3RqP5YAR07KP5cC5tM+CeL4PzEmxiv6MS9pMSx90XUxS/kzl8AKjp5hhq
 TPk8RnsTEQpdmoxEqIcnavTZEONTJzrVvwc+Eg03b3ksx6bx5XYWy4YaE w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10346"; a="269289081"
X-IronPort-AV: E=Sophos;i="5.91,223,1647327600"; d="scan'208";a="269289081"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2022 18:52:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,223,1647327600"; d="scan'208";a="712631468"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
 by fmsmga001.fm.intel.com with ESMTP; 13 May 2022 18:52:30 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1npgxJ-000MIi-SJ;
 Sat, 14 May 2022 01:52:29 +0000
Date: Sat, 14 May 2022 09:51:32 +0800
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
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/4] mtd: rawnand: meson: fix the clock
Message-ID: <202205140935.9YRSlRhB-lkp@intel.com>
References: <20220513123404.48513-3-liang.yang@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220513123404.48513-3-liang.yang@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220513_185237_604510_F299EC1D 
X-CRM114-Status: GOOD (  12.13  )
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

[auto build test ERROR on mtd/mtd/next]
[also build test ERROR on mtd/mtd/fixes mtd/nand/next v5.18-rc6 next-20220513]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Liang-Yang/fix-the-meson-NFC-clock/20220513-203700
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next
config: m68k-buildonly-randconfig-r001-20220512 (https://download.01.org/0day-ci/archive/20220514/202205140935.9YRSlRhB-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/2a8371d672486fa71241af04615efeff5efed94b
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Liang-Yang/fix-the-meson-NFC-clock/20220513-203700
        git checkout 2a8371d672486fa71241af04615efeff5efed94b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   m68k-linux-ld: drivers/mtd/nand/raw/meson_nand.o: in function `meson_nfc_probe':
>> meson_nand.c:(.text+0xcf8): undefined reference to `clk_divider_ops'
>> m68k-linux-ld: meson_nand.c:(.text+0xd38): undefined reference to `devm_clk_register'

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
