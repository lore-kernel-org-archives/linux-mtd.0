Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27C45C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Mar 2022 05:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q0Pg4E0lXneDPR9EbFPurXX+3WcLdkw2hhbxpaxszT4=; b=lwd2QK3HBIU15H
	FkJ6xGk9af3gmSSLuvaWHHykL0oud+oN/mKNxKRqoQks2dftjCGfuyz27dWNpFPm0nF2z+IvnO/Z5
	xngN3sd4IpgoBRvwTVK+OguG6cHTpSO+a6nsZ8pxNiRFf+m+4a0VfD4/eiObtx+1OCPNErQx1AvuG
	2rnzRnu9vobnfCVUl/12SpXVvixcsCpuhaGBbf1c6Mk5RNM4U7FNxsUdssRFL6fO66RQ39gbLjF1z
	jwUpi4FYCx17JqOHqNKGY9oWxiaBf+VPSW+EGUxYlcewikeKbZrjJE9Vc9Cki7eSPAkIcSk/rJzHZ
	1pZFCGHyC15eGS37DkcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWAOs-006YZw-0f; Mon, 21 Mar 2022 05:16:14 +0000
Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWAOl-006YUY-U6; Mon, 21 Mar 2022 05:16:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647839767; x=1679375767;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ZSklBNTsSIb9u8Zs+cghnGiUg/0nwYn/5hxrTKgdUw0=;
 b=jl9iTZUe+3kcFgm8dNNOPxBroOPhOJEN6DCZa5FS+GHKa0zjRbOusQnm
 SSngKC5zOF5K8/QI8O83xLAItcbnseY+yfkmUWHCjjT84bkTT/feT/Gzj
 R4amunVD0Fz84Fl0wD+mTmYdsq1azSxhIZhCDQ1f67y/bgStU5WnOzcI/
 Io/q8ncc/AzUFVwCK9MSmnvny4hadXrFKmfXQGbNTCCbtrP0CBX241iZb
 UZj7YaaYCVLddZAIE1ay3JhM0olkVDeEh0J28TBUU2BvhTnU1piCkDUmU
 hp6527A01v7+DOfYnxA6vwugHFgVrUe+wi5PIbXFFm/V2xCpC972Fx5eO g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10292"; a="244942593"
X-IronPort-AV: E=Sophos;i="5.90,197,1643702400"; d="scan'208";a="244942593"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2022 22:16:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,197,1643702400"; d="scan'208";a="692058812"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by fmsmga001.fm.intel.com with ESMTP; 20 Mar 2022 22:16:00 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nWAOd-000HVG-PW; Mon, 21 Mar 2022 05:15:59 +0000
Date: Mon, 21 Mar 2022 13:15:18 +0800
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
Subject: Re: [PATCH v3 1/2] mtd: rawnand: meson: discard the common MMC sub
 clock framework
Message-ID: <202203211339.6SuyU3aA-lkp@intel.com>
References: <20220318124121.26117-2-liang.yang@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220318124121.26117-2-liang.yang@amlogic.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220320_221608_062238_4EB5FBF0 
X-CRM114-Status: GOOD (  14.39  )
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
[also build test ERROR on mtd/mtd/next mtd/mtd/fixes robh/for-next v5.17 next-20220318]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Liang-Yang/refine-the-NFC-clock-framework/20220318-204307
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next
config: m68k-randconfig-r015-20220320 (https://download.01.org/0day-ci/archive/20220321/202203211339.6SuyU3aA-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/8722c778a1a81891f7362662caf9d166442d5990
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Liang-Yang/refine-the-NFC-clock-framework/20220318-204307
        git checkout 8722c778a1a81891f7362662caf9d166442d5990
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=m68k SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   m68k-linux-ld: drivers/mtd/nand/raw/meson_nand.o: in function `meson_nfc_probe':
>> meson_nand.c:(.text+0xaae): undefined reference to `clk_divider_ops'
>> m68k-linux-ld: meson_nand.c:(.text+0xaf0): undefined reference to `devm_clk_register'

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
