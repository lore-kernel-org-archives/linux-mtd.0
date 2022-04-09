Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DFDFC433F5
	for <linux-mtd@archiver.kernel.org>; Sat,  9 Apr 2022 08:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aImn8gupjhq7gmy1tqvO2elqdeqzMGuDQ7K465rhvLI=; b=shUP+5bTPbTsvk
	+rYc4acJQ/KHvy2DXezz2Ef72UGFG/k9WqEzOdqlIZtM19Vzs9HFJwF7y2ATOTqcoNJc2QdFLF9gl
	S5PYSY9x7mbqPN5hZ4aiY/1TUPTGLITY7OVj0myjqUnIFadFew2NdNbYX0Vk/n0kU6SqIyAViA+QI
	mBWXhd+R0yxIygFYFsbj+MZ/9XiC5dpeEQL6XFOUGbIm60k5J84oR0KquC0+hSks76eSWGA0syFsl
	zegCWSH5lsDVv5Vwc+pJVxxP9wNExktUlNUsxaLRXo1wtKA8WimStElxC3Qyup1Umuq3Dkw49Rc3n
	ml4N/blGo9wP0dlBgFIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nd6Q6-002b2t-CK; Sat, 09 Apr 2022 08:26:10 +0000
Received: from mga04.intel.com ([192.55.52.120])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nd6Q0-002b17-DF
 for linux-mtd@lists.infradead.org; Sat, 09 Apr 2022 08:26:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649492764; x=1681028764;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Z89rAS6nK8vPE6PqwXyApxLr8DEMMn6pGUFoYLv0L8I=;
 b=X1yvVpveYHeOELYP1clJnm32VyOucDO/PVJZIv62ci4RGTOzQekhXQwO
 0mh5Bk1NmwXEfo9HvtU4VubrNdIyV4Hbc8AUJ1aZM4kwYYiuIZ+jk+NCa
 ZMkkY2CK9scjaH9u/SvyBpKbhnzTl+dWoLuCeuQTpJsQD7kyFqxpkJsuE
 eBC4AkZC4TZN+x0Aiv+W9H+BpPT6jZshO/maHTtJLPe457NXZIL7E5Qn1
 4/L7CfuXaGkXbLXDnZtuYwpZur7PVsqt0wJ+VTTBN+qw9Aqk7mhyaHELh
 BdBZlJ13v8N98KSoJ6ghDkJO8KdLSVH2R0NED1J8eF8PZ4Bl6siWqlDYe w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10311"; a="260621696"
X-IronPort-AV: E=Sophos;i="5.90,247,1643702400"; d="scan'208";a="260621696"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2022 01:26:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,247,1643702400"; d="scan'208";a="622019793"
Received: from lkp-server02.sh.intel.com (HELO 7e80bc2a00a0) ([10.239.97.151])
 by fmsmga004.fm.intel.com with ESMTP; 09 Apr 2022 01:25:59 -0700
Received: from kbuild by 7e80bc2a00a0 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nd6Pv-00010d-9g;
 Sat, 09 Apr 2022 08:25:59 +0000
Date: Sat, 9 Apr 2022 16:25:15 +0800
From: kernel test robot <lkp@intel.com>
To: Chuanhong Guo <gch981213@gmail.com>, linux-mtd@lists.infradead.org
Cc: kbuild-all@lists.01.org, Chuanhong Guo <gch981213@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: nand: separate ecc-mxic from nandcore
Message-ID: <202204091647.rave7jtW-lkp@intel.com>
References: <20220409052148.2159196-1-gch981213@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220409052148.2159196-1-gch981213@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220409_012604_536745_A7FEC4F4 
X-CRM114-Status: GOOD (  13.22  )
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

[auto build test ERROR on mtd/nand/next]
[also build test ERROR on v5.18-rc1 next-20220408]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Chuanhong-Guo/mtd-nand-separate-ecc-mxic-from-nandcore/20220409-132331
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next
config: sh-randconfig-r013-20220408 (https://download.01.org/0day-ci/archive/20220409/202204091647.rave7jtW-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/a96780fbe6f7bc76d07fd5a4ccc390e7fedcc8b5
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Chuanhong-Guo/mtd-nand-separate-ecc-mxic-from-nandcore/20220409-132331
        git checkout a96780fbe6f7bc76d07fd5a4ccc390e7fedcc8b5
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=sh SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "mxic_ecc_process_data_pipelined" [drivers/spi/spi-mxic.ko] undefined!
>> ERROR: modpost: "mxic_ecc_get_pipelined_engine" [drivers/spi/spi-mxic.ko] undefined!
>> ERROR: modpost: "mxic_ecc_get_pipelined_ops" [drivers/spi/spi-mxic.ko] undefined!
>> ERROR: modpost: "mxic_ecc_put_pipelined_engine" [drivers/spi/spi-mxic.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
