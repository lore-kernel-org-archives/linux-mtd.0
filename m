Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55461C433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Jan 2022 14:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OkRAJ5U5S5zEJp7MZo6fp6UBl+NxYMQePFm+EawlrY0=; b=W7yCKz+gByH60E
	vvf8br/kXnK5Q4qnzczeOVzSLGkTYXu8Q8i2WyDMJdc1VY2iwAIavsGWPMDW/FkoJCHIdI/SY08rM
	oAhFml5U7x1eJDIOkcC196wgqROXeMkUw+3VMhgmH6SSB3RWBp20FAMSvF6spLIflF2QEoTkmEmEM
	1a4SaZRe4cDgbU4Yd+GvS++Cm58wBFAB664WPU2xfSQz0aYPc31Wof7VGdfGJ5ahMoQyjBmeLau3m
	3GmrGCJ6lON9vQUwlWFVRjG7d6GEY9tXoJNALFxr8zQvYZZq7LIQ1csod0tM/HWk1/BWCJtP9JetH
	bzHHkjnuSEnLpgMrpblA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5TO8-000IKj-Vr; Thu, 06 Jan 2022 14:05:09 +0000
Received: from mga17.intel.com ([192.55.52.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5TO6-000IK4-1O
 for linux-mtd@lists.infradead.org; Thu, 06 Jan 2022 14:05:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641477906; x=1673013906;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=txHVbok9WPDWCHdTsFpuNZ0HhBu5l8s6bMFwYY5eatg=;
 b=a2Oac7IbW8Ci/xOnEwWp3bAYxM4vxP30cVKPGNG99A7vhpsU8jAfp8MQ
 7FKZzAGMb5JEx+DF+UXXvDYk9nvwt67xp10JDw2D2BrIOG2TQVo8maRMl
 HbOuwpiJvl6JCYJtitGMxk7pRlE5ldifzZ7qU4en95hYGwubLddxPwA07
 aOzmvyNzNFiJDgHDbN6xObZEm38INWzpPEPlJGaNlTEE9XjlBZ7nY6WJz
 VD/uSNGSbGk7edHBT0DnUR8tqnbtoi2poZpDcj/7D9DprZRLMUICQuBXK
 GDl/7X1ZmoL1zLnrjf0SNzWQv021V8O3GvG7POsxlcPFmXvsZdOdM7uDi Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="223346191"
X-IronPort-AV: E=Sophos;i="5.88,267,1635231600"; d="scan'208";a="223346191"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2022 06:04:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,267,1635231600"; d="scan'208";a="488940186"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
 by orsmga002.jf.intel.com with ESMTP; 06 Jan 2022 06:04:22 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1n5TNN-000Hha-PP; Thu, 06 Jan 2022 14:04:21 +0000
Date: Thu, 6 Jan 2022 22:03:44 +0800
From: kernel test robot <lkp@intel.com>
To: Liang Yang <liang.yang@amlogic.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: kbuild-all@lists.01.org, Liang Yang <liang.yang@amlogic.com>,
 Richard Weinberger <richard@nod.at>, Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Jianxin Pan <jianxin.pan@amlogic.com>,
 Victor Wan <victor.wan@amlogic.com>
Subject: Re: [PATCH] mtd: rawnand: meson: fix the clock after discarding
 sd_emmc_c_clkc
Message-ID: <202201062140.24LB23iM-lkp@intel.com>
References: <20220106032504.23310-1-liang.yang@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220106032504.23310-1-liang.yang@amlogic.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220106_060506_486439_567696BA 
X-CRM114-Status: GOOD (  14.02  )
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
[also build test ERROR on v5.16-rc8 next-20220105]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Liang-Yang/mtd-rawnand-meson-fix-the-clock-after-discarding-sd_emmc_c_clkc/20220106-114103
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next
config: openrisc-randconfig-r012-20220105 (https://download.01.org/0day-ci/archive/20220106/202201062140.24LB23iM-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/a7e02cbd62a38e6fcbdcafe806b129bb287e7cf6
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Liang-Yang/mtd-rawnand-meson-fix-the-clock-after-discarding-sd_emmc_c_clkc/20220106-114103
        git checkout a7e02cbd62a38e6fcbdcafe806b129bb287e7cf6
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=openrisc SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   or1k-linux-ld: drivers/mtd/nand/raw/meson_nand.o: in function `meson_nfc_probe':
>> meson_nand.c:(.text+0x21a0): undefined reference to `clk_divider_ops'
>> or1k-linux-ld: meson_nand.c:(.text+0x21a4): undefined reference to `clk_divider_ops'
>> or1k-linux-ld: meson_nand.c:(.text+0x21b0): undefined reference to `__clk_get_name'
   meson_nand.c:(.text+0x21b0): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `__clk_get_name'
>> or1k-linux-ld: meson_nand.c:(.text+0x21ec): undefined reference to `devm_clk_register'
   meson_nand.c:(.text+0x21ec): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `devm_clk_register'

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
