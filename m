Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50D37C433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Jan 2022 21:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kzo4P7LqKk0GfNEHC5h6KpxjhJTEYM17h4qmCFoZIZo=; b=x8aR1WJkmWQmzC
	6MbLTbkGKTSnrJw5ZVBPEQO7p5ZLoj30IWML5MHNk5dTHmE/2LlWEAuU3sts7soKU10GzbBurSV+E
	tE90H+0ZpkQv8sKJrWGTZ4PFRhnplti0Y/4IXtKmC4kneuWMNv1+pGdu9/UXjsxp8/H6nYMzzA2l3
	vgLoSx3bFbdwEpLnjDLpzPJCh91xhnIGbnNj0OtYQv1W3yYRNgYNiC0KaeVHQi9RIU+tOqEE+e+N3
	iCyyotOjitKPQtu/b2JvKaCH0Ua/RjYHbDkcLlYTGhJzhA6iZkui2vfj9Z5KDWSd+XRccSoNt9TGY
	qc606adObB7tjiHyoP/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5aCb-001Oeq-Rr; Thu, 06 Jan 2022 21:21:41 +0000
Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5aCZ-001OeF-Gz
 for linux-mtd@lists.infradead.org; Thu, 06 Jan 2022 21:21:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641504099; x=1673040099;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=WsRvHTzmFoZ0lh24gUliSwEMS0Yrmf1aS8DVg4F1m4g=;
 b=ath2kgVUNwUMv1PsMD1zkRtcj43jcJP/7WVk/Q/e0GpZ5LrdLAwEv0EE
 pg4jOO2StIh4iHiURtB5NkUinP7MxMuyjae31xaNGC9W9U+vk4kowpGNf
 AHSY7QSY3UArzNuZUDebVi99suw43fkXApqao9p1yWpKwnMjJvCiJ5JZ5
 96VzA/L//i1yhvvmzja2xlWVvDtZB622EtF5VmJReakEwUV8A0RGgWEb7
 /PLj0dPGIjZrns377Ne2CfP57+NXx+Y4ni+i5yifnmWXJntUq7TKgPxZ8
 VVOmPwQyfpwrjIKbdMLthF23VYjnDLUVF5BHX/jX3rp/VcmDLOdKjR2L9 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="242531515"
X-IronPort-AV: E=Sophos;i="5.88,267,1635231600"; d="scan'208";a="242531515"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2022 13:21:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,267,1635231600"; d="scan'208";a="689548828"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
 by orsmga005.jf.intel.com with ESMTP; 06 Jan 2022 13:21:30 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1n5aCQ-000HzB-6o; Thu, 06 Jan 2022 21:21:30 +0000
Date: Fri, 7 Jan 2022 05:21:19 +0800
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
Message-ID: <202201070543.goUXCEdh-lkp@intel.com>
References: <20220106032504.23310-1-liang.yang@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220106032504.23310-1-liang.yang@amlogic.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220106_132139_668753_CD573896 
X-CRM114-Status: GOOD (  13.35  )
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
[also build test ERROR on v5.16-rc8 next-20220106]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Liang-Yang/mtd-rawnand-meson-fix-the-clock-after-discarding-sd_emmc_c_clkc/20220106-114103
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next
config: ia64-randconfig-r035-20220106 (https://download.01.org/0day-ci/archive/20220107/202201070543.goUXCEdh-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/a7e02cbd62a38e6fcbdcafe806b129bb287e7cf6
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Liang-Yang/mtd-rawnand-meson-fix-the-clock-after-discarding-sd_emmc_c_clkc/20220106-114103
        git checkout a7e02cbd62a38e6fcbdcafe806b129bb287e7cf6
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=ia64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   ia64-linux-ld: drivers/mtd/nand/raw/meson_nand.o: in function `meson_nfc_probe':
   meson_nand.c:(.text+0x3410): undefined reference to `clk_divider_ops'
>> ia64-linux-ld: meson_nand.c:(.text+0x3430): undefined reference to `clk_divider_ops'
>> ia64-linux-ld: meson_nand.c:(.text+0x3442): undefined reference to `__clk_get_name'
>> ia64-linux-ld: meson_nand.c:(.text+0x34d2): undefined reference to `devm_clk_register'

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
