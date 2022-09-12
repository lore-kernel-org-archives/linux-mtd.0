Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A394C6FA83
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Sep 2022 23:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GlBgXxe/msrwXgMJ/lUnzcgyj763IgG6URf2VDwoTdE=; b=MoNPpsE07s3A92
	EyoXG5DCjHsAdn/7VULbiS/9/jOlvEw9V/tLPbQ/s+fnykTN7R740mBtU/riQVKSuxj76no4uyLTE
	L6USQlToAz605Cd+uGslQqNnpOgBwhxhcqYdMPhXGnCGg1nU+TqcSQv7JM6IS3NFvAVdganiIYoGk
	ep8BZctc3Mv+UPZQdCdbU2ob6JXG0nYSfvR1eJ/VoJplfH916aiesM3g7N5wYh+L6fB2JMWYAT+R6
	1mPd4YiC7dHc3GBaUJu0Q4Wr6kg9kO1++2QfUggaigWCsIn14/f+ETYp6SRkyE3GVL0RgRiW77WOK
	leoX30RV8f/PoHpuWKWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXsiL-00FQU0-2I; Mon, 12 Sep 2022 23:19:41 +0000
Received: from mga14.intel.com ([192.55.52.115])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXsiH-00FQSD-Eu
	for linux-mtd@lists.infradead.org; Mon, 12 Sep 2022 23:19:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663024777; x=1694560777;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=q93oBTx3u5LUtVhSCEgNEkmMyo9rEmqCpu5xieHetws=;
  b=A0fRLrnaPbaLtgh8LbNFMzxFnJTBQtoQIwEe3NFGF5Mzx2x3O2AkGojS
   VZXmcAa3DQTfjHeKxnuGEFsEC3vOWcVn2VK4GVqhsL993iuuDe4ODoXt+
   UDRvWhPuiytoxZNc+qIRY6zETPn+4gPzBq0KVUvkYcaAUhGyhjH839Bnh
   WbtA4xT/5E9+i48xcHRzbX8stJK3vHOzXB6t3TJHYAgxvUTbHuRa8daMK
   ZTCd/3L0+zECXiL+JLcRY7rdjnfm2Ee1hGquDe7HuTnOdhTQvJ9JrNSB8
   tP3VHU+8qXNou1EoBWvLqMPsDO2ew6Ju2Z/hEfneGVl9nfCuwYVy799h0
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10468"; a="297995396"
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; 
   d="scan'208";a="297995396"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2022 16:19:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; 
   d="scan'208";a="705329009"
Received: from lkp-server02.sh.intel.com (HELO 4011df4f4fd3) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 12 Sep 2022 16:19:34 -0700
Received: from kbuild by 4011df4f4fd3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oXsiD-0002xx-30;
	Mon, 12 Sep 2022 23:19:33 +0000
Date: Tue, 13 Sep 2022 07:18:44 +0800
From: kernel test robot <lkp@intel.com>
To: yaliang.wang@windriver.com, tudor.ambarus@microchip.com,
	pratyush@kernel.org, michael@walle.cc, miquel.raynal@bootlin.com,
	richard@nod.at, vigneshr@ti.com
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: spi-nor: gigadevice: gd25q256: replace
 gd25q256_default_init with gd25q256_post_bfpt
Message-ID: <202209130732.cQpPG34i-lkp@intel.com>
References: <20220912142833.1739547-1-yaliang.wang@windriver.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220912142833.1739547-1-yaliang.wang@windriver.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220912_161937_578886_EBD4507C 
X-CRM114-Status: GOOD (  14.86  )
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

Hi,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.0-rc5 next-20220912]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/yaliang-wang-windriver-com/mtd-spi-nor-gigadevice-gd25q256-replace-gd25q256_default_init-with-gd25q256_post_bfpt/20220912-223028
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 80e78fcce86de0288793a0ef0f6acf37656ee4cf
config: i386-randconfig-a016-20220912 (https://download.01.org/0day-ci/archive/20220913/202209130732.cQpPG34i-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/0238f8172a76ee5a84dda79b45911a2b63d59721
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review yaliang-wang-windriver-com/mtd-spi-nor-gigadevice-gd25q256-replace-gd25q256_default_init-with-gd25q256_post_bfpt/20220912-223028
        git checkout 0238f8172a76ee5a84dda79b45911a2b63d59721
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/mtd/spi-nor/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/mtd/spi-nor/gigadevice.c:23:1: error: non-void function does not return a value [-Werror,-Wreturn-type]
   }
   ^
   1 error generated.


vim +23 drivers/mtd/spi-nor/gigadevice.c

acb96ecd59f7fd Boris Brezillon 2020-03-13  10  
0238f8172a76ee Yaliang Wang    2022-09-12  11  static int
0238f8172a76ee Yaliang Wang    2022-09-12  12  gd25q256_post_bfpt(struct spi_nor *nor,
0238f8172a76ee Yaliang Wang    2022-09-12  13  			    const struct sfdp_parameter_header *bfpt_header,
0238f8172a76ee Yaliang Wang    2022-09-12  14  			    const struct sfdp_bfpt *bfpt)
acb96ecd59f7fd Boris Brezillon 2020-03-13  15  {
acb96ecd59f7fd Boris Brezillon 2020-03-13  16  	/*
acb96ecd59f7fd Boris Brezillon 2020-03-13  17  	 * Some manufacturer like GigaDevice may use different
acb96ecd59f7fd Boris Brezillon 2020-03-13  18  	 * bit to set QE on different memories, so the MFR can't
acb96ecd59f7fd Boris Brezillon 2020-03-13  19  	 * indicate the quad_enable method for this case, we need
0238f8172a76ee Yaliang Wang    2022-09-12  20  	 * to set it in the post_bfpt fixup hook.
acb96ecd59f7fd Boris Brezillon 2020-03-13  21  	 */
829ec6408dc58d Tudor Ambarus   2020-03-13  22  	nor->params->quad_enable = spi_nor_sr1_bit6_quad_enable;
acb96ecd59f7fd Boris Brezillon 2020-03-13 @23  }
acb96ecd59f7fd Boris Brezillon 2020-03-13  24  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
