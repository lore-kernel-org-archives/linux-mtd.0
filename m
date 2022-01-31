Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7945BC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Jan 2022 06:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kEzBiT26Ej9ir6rf6hLsIrbjdbCPlqluWclrXUL6R48=; b=vFv0VO8pzODVIb
	LSJSY78yCu01W6esUZkHlKIutoIHvPw8C1fdMgBzId9ZB1b8bpm3HPx4aDa1YMydtvVmGApL9/+ER
	A2aMwi3TxnUDI+5ZUPIggOycyRRLhcNFiSDuaRPDDGv+aOOKh1w+P2RT7ghqELQF5O6b4OphuN6gt
	pEbBm9dMVY4K4tM3+5TK+aEQMhDRUAaKpLXGV0wQ8qHOuUtN/qiHhgf1xUbQfA1F3tRuC+0PVNiao
	HFN8b7xUAi13f7lvcSrgrN3yWvdHr1/drCuc9ouJGs/ghtKGYGA7rcke/WVzBnX/gVs/UzDSUElyP
	qQ8C1vb6DuBTLYfvKKSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEQCj-0088dd-8D; Mon, 31 Jan 2022 06:30:21 +0000
Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEQCd-0088co-O6
 for linux-mtd@lists.infradead.org; Mon, 31 Jan 2022 06:30:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643610615; x=1675146615;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=EUIrJDcJLwZFuPBFdalunEaBk2tXERb7r+beHzV48ms=;
 b=GWFOl0rMg1p+2JsSst50vBsSSX5GYICR8BenRZU5gEact9/iPNoV1Pim
 qJd/DavIymiPmrJXCKvvMXlbnUj/Bt8y95tjub9mUhP2s45Sl32Tvxbq6
 r4eTRGNwzYC0ZMewHk7/OYHob0c8dmodiOPCMOsEaUW3/MjUX4AQIGDrR
 1yWkWKRDz8riX03vfUUurkb6CRnG0MQL0MkHwqLOqZLRnf+XzlWOTyhHc
 3BHLp1cGgDmlmfAvuck5Hb7U1FpDCOHs59xD8SwH/ILb0EcXYuKVUcyee
 AcpngG2kQI+aIBs53U/zKBnVk/aUIUZz5f1chM/tlhZApcK/ZgX6NCAsW A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10243"; a="247625664"
X-IronPort-AV: E=Sophos;i="5.88,330,1635231600"; d="scan'208";a="247625664"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2022 22:30:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,330,1635231600"; d="scan'208";a="478975730"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by orsmga003.jf.intel.com with ESMTP; 30 Jan 2022 22:30:11 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nEQCY-000RYa-NY; Mon, 31 Jan 2022 06:30:10 +0000
Date: Mon, 31 Jan 2022 14:29:35 +0800
From: kernel test robot <lkp@intel.com>
To: Liang Yang <liang.yang@amlogic.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: kbuild-all@lists.01.org, Liang Yang <liang.yang@amlogic.com>,
 Rob Herring <robh+dt@kernel.org>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v2 1/2] mtd: rawnand: meson: discard the common MMC sub
 clock framework
Message-ID: <202201311453.kuT35AF3-lkp@intel.com>
References: <20220128113237.39996-2-liang.yang@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220128113237.39996-2-liang.yang@amlogic.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220130_223015_861119_95F17CF8 
X-CRM114-Status: GOOD (  14.47  )
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
[also build test ERROR on mtd/mtd/next mtd/mtd/fixes robh/for-next v5.17-rc2 next-20220128]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Liang-Yang/refine-the-NFC-clock-framework/20220128-193452
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next
config: ia64-randconfig-r004-20220131 (https://download.01.org/0day-ci/archive/20220131/202201311453.kuT35AF3-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/5fedc0981ac3cbace0b28f834843c3e82dc40602
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Liang-Yang/refine-the-NFC-clock-framework/20220128-193452
        git checkout 5fedc0981ac3cbace0b28f834843c3e82dc40602
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=ia64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   ia64-linux-ld: drivers/mtd/nand/raw/meson_nand.o: in function `meson_nfc_probe':
>> meson_nand.c:(.text+0x2660): undefined reference to `clk_divider_ops'
>> ia64-linux-ld: meson_nand.c:(.text+0x2680): undefined reference to `clk_divider_ops'
>> ia64-linux-ld: meson_nand.c:(.text+0x2692): undefined reference to `__clk_get_name'
>> ia64-linux-ld: meson_nand.c:(.text+0x2722): undefined reference to `devm_clk_register'
   `adc3xxx_i2c_remove' referenced in section `.data' of sound/soc/codecs/tlv320adc3xxx.o: defined in discarded section `.exit.text' of sound/soc/codecs/tlv320adc3xxx.o
   ia64-linux-ld: net/core/sock.o: in function `sk_destruct':
   sock.c:(.text+0x32e2): undefined reference to `__sk_defer_free_flush'

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
