Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB917C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Dec 2021 18:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LgYhGegPzgLzjdr0FCbS8C1Uc8FopLCTgYQllUxQEbk=; b=Sdcp2obrNH3lw3
	/tWkHdrE4mAYb1WoZ/TxzeuAfyhFtebVTuDjZrDSjMrTFUAaZGcHyymZ/2hk2gnjGBfcl/MRgotxT
	E72YC2HBldHrveFBBUy0dHMQCLeta389MVIluCZUZL9Rk/joyvcMwP+Td2rIK9df748E+SaRrPaJs
	/7l0yqJVO820jp0ZDsq/W9j7rM/AnXQXlyLW6GZUB4/pn/DNP1GQozPbPwQ142TIGCU0ff0GWygX7
	h8mU7/5Iq57TjI+KmAaiSq4cAdsiSfJktPH5CobsBz1pmqB2h9a6sHRmuUYPz1u7ExHtkGqzG0awj
	SdmNF1QRnK7iHhB30wlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzNoj-003vs5-0i; Mon, 20 Dec 2021 18:55:25 +0000
Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzNoe-003vqT-Ac
 for linux-mtd@lists.infradead.org; Mon, 20 Dec 2021 18:55:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640026520; x=1671562520;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=TmqgGeucLGZnyhqVlqCwWmUp6vjmwJf9wJg2gbgOpjI=;
 b=F1bkAeUl7hyR6TCscbYOS4jnf7IdWWaKoBETmjZho5QtpDfkmmbwk91T
 b7WJnhQLI5FLCvGqQ/GgXlyozbQDaGuYH1IlmfkQ1ydCLpNIxw7JpyxSf
 dNKKvyivOLX40YWeImY77t4Bk+T249/AnKrYSrcJlv6yty7PX/Z3N/ijN
 a81onVft3vSJDLn4A+iZ6LtOHpEoojmK8/WdOLQn52l7aCc2LO75HTqlY
 dy17HpxI8ewYksiJFxODlnTS+8frDrmwUeXa6zfrdDB5YXB1GIRZ3hTB6
 AVO4eZfJ08TznI/MZNFQ2sVDs0ki9jQ+ufH4GU109uYYvSXF2651uM4Jz g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10204"; a="227541589"
X-IronPort-AV: E=Sophos;i="5.88,221,1635231600"; d="scan'208";a="227541589"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2021 10:55:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,221,1635231600"; d="scan'208";a="467503582"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
 by orsmga006.jf.intel.com with ESMTP; 20 Dec 2021 10:55:16 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mzNoa-00087P-0h; Mon, 20 Dec 2021 18:55:16 +0000
Date: Tue, 21 Dec 2021 02:54:45 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Nyekjaer <sean@geanix.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
 Sean Nyekjaer <sean@geanix.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: protect access to rawnand devices while in
 suspend
Message-ID: <202112210255.fmm6tiKT-lkp@intel.com>
References: <20211220130015.3630975-1-sean@geanix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211220130015.3630975-1-sean@geanix.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211220_105520_446580_BF6A1445 
X-CRM114-Status: GOOD (  16.97  )
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

Hi Sean,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on mtd/nand/next]
[also build test WARNING on linux/master linus/master v5.16-rc6 next-20211220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Sean-Nyekjaer/mtd-rawnand-protect-access-to-rawnand-devices-while-in-suspend/20211220-210300
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next
config: mips-randconfig-r002-20211220 (https://download.01.org/0day-ci/archive/20211221/202112210255.fmm6tiKT-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 555eacf75f21cd1dfc6363d73ad187b730349543)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://github.com/0day-ci/linux/commit/4820bae9bf9bca82933f29066b18ea85f8c06178
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Sean-Nyekjaer/mtd-rawnand-protect-access-to-rawnand-devices-while-in-suspend/20211220-210300
        git checkout 4820bae9bf9bca82933f29066b18ea85f8c06178
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/mtd/nand/raw/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/mtd/nand/raw/nand_base.c:4426:2: warning: variable 'ret' is used uninitialized whenever switch default is taken [-Wsometimes-uninitialized]
           default:
           ^~~~~~~
   drivers/mtd/nand/raw/nand_base.c:4437:9: note: uninitialized use occurs here
           return ret;
                  ^~~
   drivers/mtd/nand/raw/nand_base.c:4414:9: note: initialize the variable 'ret' to silence this warning
           int ret;
                  ^
                   = 0
   1 warning generated.


vim +/ret +4426 drivers/mtd/nand/raw/nand_base.c

2af7c653993199 drivers/mtd/nand/nand_base.c     Simon Kagstrom  2009-10-05  4403  
8593fbc68b0df1 drivers/mtd/nand/nand_base.c     Thomas Gleixner 2006-05-29  4404  /**
8593fbc68b0df1 drivers/mtd/nand/nand_base.c     Thomas Gleixner 2006-05-29  4405   * nand_write_oob - [MTD Interface] NAND write data and/or out-of-band
8593fbc68b0df1 drivers/mtd/nand/nand_base.c     Thomas Gleixner 2006-05-29  4406   * @mtd: MTD device structure
844d3b427ef1a4 drivers/mtd/nand/nand_base.c     Randy Dunlap    2006-06-28  4407   * @to: offset to write to
8593fbc68b0df1 drivers/mtd/nand/nand_base.c     Thomas Gleixner 2006-05-29  4408   * @ops: oob operation description structure
8593fbc68b0df1 drivers/mtd/nand/nand_base.c     Thomas Gleixner 2006-05-29  4409   */
8593fbc68b0df1 drivers/mtd/nand/nand_base.c     Thomas Gleixner 2006-05-29  4410  static int nand_write_oob(struct mtd_info *mtd, loff_t to,
8593fbc68b0df1 drivers/mtd/nand/nand_base.c     Thomas Gleixner 2006-05-29  4411  			  struct mtd_oob_ops *ops)
8593fbc68b0df1 drivers/mtd/nand/nand_base.c     Thomas Gleixner 2006-05-29  4412  {
0813621ba898aa drivers/mtd/nand/raw/nand_base.c Boris Brezillon 2018-11-11  4413  	struct nand_chip *chip = mtd_to_nand(mtd);
80107e764846a6 drivers/mtd/nand/raw/nand_base.c Colin Ian King  2019-07-31  4414  	int ret;
8593fbc68b0df1 drivers/mtd/nand/nand_base.c     Thomas Gleixner 2006-05-29  4415  
8593fbc68b0df1 drivers/mtd/nand/nand_base.c     Thomas Gleixner 2006-05-29  4416  	ops->retlen = 0;
8593fbc68b0df1 drivers/mtd/nand/nand_base.c     Thomas Gleixner 2006-05-29  4417  
4820bae9bf9bca drivers/mtd/nand/raw/nand_base.c Sean Nyekjaer   2021-12-20  4418  	nand_get_device(chip);
8593fbc68b0df1 drivers/mtd/nand/nand_base.c     Thomas Gleixner 2006-05-29  4419  
8593fbc68b0df1 drivers/mtd/nand/nand_base.c     Thomas Gleixner 2006-05-29  4420  	switch (ops->mode) {
0612b9ddc2eeda drivers/mtd/nand/nand_base.c     Brian Norris    2011-08-30  4421  	case MTD_OPS_PLACE_OOB:
0612b9ddc2eeda drivers/mtd/nand/nand_base.c     Brian Norris    2011-08-30  4422  	case MTD_OPS_AUTO_OOB:
0612b9ddc2eeda drivers/mtd/nand/nand_base.c     Brian Norris    2011-08-30  4423  	case MTD_OPS_RAW:
8593fbc68b0df1 drivers/mtd/nand/nand_base.c     Thomas Gleixner 2006-05-29  4424  		break;
8593fbc68b0df1 drivers/mtd/nand/nand_base.c     Thomas Gleixner 2006-05-29  4425  
8593fbc68b0df1 drivers/mtd/nand/nand_base.c     Thomas Gleixner 2006-05-29 @4426  	default:
8593fbc68b0df1 drivers/mtd/nand/nand_base.c     Thomas Gleixner 2006-05-29  4427  		goto out;
8593fbc68b0df1 drivers/mtd/nand/nand_base.c     Thomas Gleixner 2006-05-29  4428  	}
8593fbc68b0df1 drivers/mtd/nand/nand_base.c     Thomas Gleixner 2006-05-29  4429  
8593fbc68b0df1 drivers/mtd/nand/nand_base.c     Thomas Gleixner 2006-05-29  4430  	if (!ops->datbuf)
0813621ba898aa drivers/mtd/nand/raw/nand_base.c Boris Brezillon 2018-11-11  4431  		ret = nand_do_write_oob(chip, to, ops);
8593fbc68b0df1 drivers/mtd/nand/nand_base.c     Thomas Gleixner 2006-05-29  4432  	else
0813621ba898aa drivers/mtd/nand/raw/nand_base.c Boris Brezillon 2018-11-11  4433  		ret = nand_do_write_ops(chip, to, ops);
8593fbc68b0df1 drivers/mtd/nand/nand_base.c     Thomas Gleixner 2006-05-29  4434  
^1da177e4c3f41 drivers/mtd/nand/nand_base.c     Linus Torvalds  2005-04-16  4435  out:
0813621ba898aa drivers/mtd/nand/raw/nand_base.c Boris Brezillon 2018-11-11  4436  	nand_release_device(chip);
^1da177e4c3f41 drivers/mtd/nand/nand_base.c     Linus Torvalds  2005-04-16  4437  	return ret;
^1da177e4c3f41 drivers/mtd/nand/nand_base.c     Linus Torvalds  2005-04-16  4438  }
^1da177e4c3f41 drivers/mtd/nand/nand_base.c     Linus Torvalds  2005-04-16  4439  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
