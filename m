Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C35A6C433EF
	for <linux-mtd@archiver.kernel.org>; Sun,  3 Apr 2022 23:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e9bard0hvb2h52D2lNcKTQnCIEjJ65im5j1V++dvnLE=; b=1gu9u60qwiWluh
	USfhKr4voc6iBj5s9TCLMMeG9Qb0x9LHjc8Bpza4kyNJm/A6wn0kzKgMBxkeXx5bDdfvVwZXXDwHW
	cN8d9YfzFD4lA42MS/d0ZoR01Mw9JFZRtq0PAry3aFHQuBlg+WmKWc8H3iQLnKJOGBTNzznSbYEvH
	dKePdn2duLgzwDC2UMSZ4fanmxpYFtDBEJdQnE8AZIE+uHfh5Uguu9ueCpGldN9tLJUG7VzDlJ3/1
	U1jEtIS9cVtOdVevPoc3BckOX9m0j4LXBn04OTH1WsIAAhY9kKE2cgZ9F1HudQ9BYORUn2MdYykcJ
	EP6JhR++m7BKuV74jUxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nb9o7-00CYTy-Iq; Sun, 03 Apr 2022 23:38:55 +0000
Received: from mga05.intel.com ([192.55.52.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nb9o3-00CYSX-Tx
 for linux-mtd@lists.infradead.org; Sun, 03 Apr 2022 23:38:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649029131; x=1680565131;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=dk8wwoPAa+9gWRt+JbyfUk76inxYSrqYeknZJrDq4/I=;
 b=ASyC30t5VjPgbSGy8mz3ykum4le8K2s4yh03Celm1YBkwmcAAY/gIeXC
 Eqh1QF3Mf6QXCmMMzUTA1LBURZFIdT4KqqxQfxh9kZH6DkhVJSsSkuv+3
 wwCIiipSq1zNxYkO6n+XmFBoKVjPkM6h36GWoU550Zok4ndyZ7umscV8Q
 xEK3gKtAveQswyDFlkwPjabg0/3fARR/IM0mXiHRZ+gFgfF62FUd0Y3bj
 fyVD1Qk+m2OIoqOwA5zfYHSopqGEVdl1lpxugISPbJyKdGkkh3QMtlMn/
 9N7lEC3gkY/6jXnZzyzSo8s6UG8KQ5LMCRvh+cDdlhWYiVZ2lDQEvKpgU w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10306"; a="346853744"
X-IronPort-AV: E=Sophos;i="5.90,233,1643702400"; d="scan'208";a="346853744"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2022 16:38:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,233,1643702400"; d="scan'208";a="548456613"
Received: from lkp-server02.sh.intel.com (HELO a44fdfb70b94) ([10.239.97.151])
 by orsmga007.jf.intel.com with ESMTP; 03 Apr 2022 16:38:48 -0700
Received: from kbuild by a44fdfb70b94 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nb9nz-0001I9-M1;
 Sun, 03 Apr 2022 23:38:47 +0000
Date: Mon, 4 Apr 2022 07:38:23 +0800
From: kernel test robot <lkp@intel.com>
To: Chuanhong Guo <gch981213@gmail.com>, linux-spi@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH resend 1/4] mtd: nand: make mtk_ecc.c a separated module
Message-ID: <202204040718.xQeZrzYD-lkp@intel.com>
References: <20220403131453.1269229-2-gch981213@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220403131453.1269229-2-gch981213@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220403_163852_045542_539A1EA0 
X-CRM114-Status: GOOD (  11.50  )
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

Hi Chuanhong,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on next-20220401]
[cannot apply to mtd/nand/next broonie-spi/for-next robh/for-next v5.17 v5.17-rc8 v5.17-rc7 v5.17]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Chuanhong-Guo/spi-add-support-for-Mediatek-SPI-NAND-controller/20220403-211703
base:    e5071887cd2296a7704dbcd10c1cedf0f11cdbd5
config: alpha-allmodconfig (https://download.01.org/0day-ci/archive/20220404/202204040718.xQeZrzYD-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/48656e578a2cec7121f79d875d14403f5b56096e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Chuanhong-Guo/spi-add-support-for-Mediatek-SPI-NAND-controller/20220403-211703
        git checkout 48656e578a2cec7121f79d875d14403f5b56096e
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=alpha SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   alpha-linux-ld: drivers/mtd/nand/ecc-mtk.o: in function `mtk_ecc_driver_exit':
>> ecc-mtk.o:(.exit.text+0x0): multiple definition of `cleanup_module'; drivers/mtd/nand/ecc-mxic.o:ecc-mxic.o:(.exit.text+0x0): first defined here
   alpha-linux-ld: drivers/mtd/nand/ecc-mtk.o: in function `mtk_ecc_driver_init':
>> ecc-mtk.o:(.init.text+0x0): multiple definition of `init_module'; drivers/mtd/nand/ecc-mxic.o:ecc-mxic.o:(.init.text+0x0): first defined here

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
