Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FC48C433EF
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Jan 2022 20:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yWeLtxqqAolvIIhtMaOSTiGfR7UtfkmRcVPH9XSjAFM=; b=VTX4Y8S/6gpMya
	Oy45AVUvdQcjTsG/VQImvNxdWQuS2X9Mtk+80j6psUJk11+ZNnoVzur3p8wZ1pKAcQ3VX1pgDWCA4
	iyqAkjlTmnWsI0ZO/LGGaOut/18VHteFcnv8eUZWxfNB8K+lgBA0oiEAVh9RZmlAQiRkai8YpDsRG
	XjVt4M4fJquZHbbCzLiLXeLp6zqV5SnxTezGXdrniESlygJ5fBFN1vXIqstajLYCp8oZmZeQQewT1
	1lIEAnwMzIH0i+FAexKTEm+srFZRREYagdzC6UYEU+kDzR2tzK+xmEzSA6cX6diGCi5ZYtnUgaebF
	Y8NpGr88k7ft8+ffg8zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5ZZt-001MEA-Q6; Thu, 06 Jan 2022 20:41:41 +0000
Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5ZZq-001MDK-JA
 for linux-mtd@lists.infradead.org; Thu, 06 Jan 2022 20:41:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641501698; x=1673037698;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=GVQVui8sx4WukJ6YIYlSQWZS6cdWl9ZfkzVAP2hn6qE=;
 b=EqMysSOnFLTUTMwa1nc1m4w7g9vhqu0vd9sTl49Mb7+UZ3c5Kdgxz1ww
 xkpyVkJfLT8Ty1Ho4LfrbVQVEvYC71SSnP76uSewkTty9gLcp+moz+0S6
 rV5nqrFa7zYp7trPopZYQuzQv8bYI/rypMKQscM0SkF33wJwfsdQqZ3eg
 flfDhCH5HtPB+2t6qpyR0IGMtBmXGh+0OeyQBZF8LYK9vSYsYccDGcTSa
 4HetVEsTs38v9NpjqhkYp+VLHea26WVOVtwGRuU95o1J8ycK/9Bzzi2Tl
 hCvtnCHwUNTmpi9DkkebDUYU8bSLLYO0x1z/51zb6ktLEckz6vtR7ciNG A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="240286709"
X-IronPort-AV: E=Sophos;i="5.88,267,1635231600"; d="scan'208";a="240286709"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2022 12:41:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,267,1635231600"; d="scan'208";a="489058794"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
 by orsmga002.jf.intel.com with ESMTP; 06 Jan 2022 12:41:29 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1n5ZZg-000HwV-VA; Thu, 06 Jan 2022 20:41:28 +0000
Date: Fri, 7 Jan 2022 04:40:35 +0800
From: kernel test robot <lkp@intel.com>
To: Liang Yang <liang.yang@amlogic.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
 Liang Yang <liang.yang@amlogic.com>, Richard Weinberger <richard@nod.at>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Jianxin Pan <jianxin.pan@amlogic.com>,
 Victor Wan <victor.wan@amlogic.com>
Subject: Re: [PATCH] mtd: rawnand: meson: fix the clock after discarding
 sd_emmc_c_clkc
Message-ID: <202201070440.ncSR3Xpb-lkp@intel.com>
References: <20220106032504.23310-1-liang.yang@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220106032504.23310-1-liang.yang@amlogic.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220106_124138_731449_A34F8661 
X-CRM114-Status: GOOD (  15.54  )
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
config: hexagon-randconfig-r045-20220106 (https://download.01.org/0day-ci/archive/20220107/202201070440.ncSR3Xpb-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project ca7ffe09dc6e525109e3cd570cc5182ce568be13)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/a7e02cbd62a38e6fcbdcafe806b129bb287e7cf6
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Liang-Yang/mtd-rawnand-meson-fix-the-clock-after-discarding-sd_emmc_c_clkc/20220106-114103
        git checkout a7e02cbd62a38e6fcbdcafe806b129bb287e7cf6
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
