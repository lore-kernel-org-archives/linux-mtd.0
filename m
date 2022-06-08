Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F8DC43334
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Jun 2022 03:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yLxhduzMTNcFyE2fNn7hfNJ0e8uXb6Yr/ZHC1MnQvXk=; b=0Ss4pVtVTdXq8R
	x8MJuFbMu2MvQSK0/H8gafmIvT5hEvAfSFOZ9FX3lAtYocc/Ux9GBAAfEcSxmlTWTRFGNBsYM4A1Z
	0aSO4FYjVosHKOa4UgpdkLmQNtuLTG4nQN32idOQZHUvGi+N77tou3cnUT575PT/tygI19JHz1VQF
	xHPf4YhNhOiEofa1DfgtHmVt6mVzgnBle1P7qwf9P34gE0pbxCJkyHEsAkH8EaYP5RmH1mItIx4KP
	yg2KnMtsZ16+AcnUQ9ilWfdzHKrOmg3dpjRMdG9s3sj7jXMQA2bFLzNsoRhwi48vuvyIxluueLITe
	84cA2fk3DqGGYuzv8dkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nylvk-00AT7k-5D; Wed, 08 Jun 2022 03:00:24 +0000
Received: from mga18.intel.com ([134.134.136.126])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nylvh-00AT5b-QU
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2022 03:00:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654657221; x=1686193221;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ckah9uOFCDFUelCaEvV/+QIv1I4STuicWWUVywSxw9Y=;
  b=R8r4M53nLQQR1RFkElniRsLh0CX9wuCFMEdowGEJavdP8sY+ivkhe9bg
   YhHsqyiVD9TGiklxkxguIfiwHrZFveW2LIKmKZAPIc0UD+2LQ5FY8gN9m
   qXFI4zPpwQpOpc9hU1eMOfhKTw+gICqt1ZyCQjrqFb0OSkQT/Cr9cagy9
   1h7TX53nVYGL6nFCT3rw/mhT3/EWVNKBGMmDz36TVbatFwRrDbahdmb37
   GFxsrmB7k/hZEN7S9FWm4K64LXHevagznyOsxd8TC1hCecY4oC+8meARG
   pkbIoeOsLCypkPduxSswe/wWpi8i1wo6V9nFTFGfHxUZ5w+WiPA2Gx3gq
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10371"; a="259867033"
X-IronPort-AV: E=Sophos;i="5.91,285,1647327600"; 
   d="scan'208";a="259867033"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2022 20:00:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,285,1647327600"; 
   d="scan'208";a="555210754"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 07 Jun 2022 20:00:15 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nylva-000ECJ-Nl;
	Wed, 08 Jun 2022 03:00:14 +0000
Date: Wed, 8 Jun 2022 10:59:50 +0800
From: kernel test robot <lkp@intel.com>
To: Tom Fitzhenry <tom@tom-fitzhenry.me.uk>,
	Tudor Ambarus <tudor.ambarus@microchip.com>,
	Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: kbuild-all@lists.01.org, Tom Fitzhenry <tom@tom-fitzhenry.me.uk>,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: spi-nor: siliconkaiser: add support for sk25lp128
Message-ID: <202206081011.jPVWbSvo-lkp@intel.com>
References: <20220603135933.143372-1-tom@tom-fitzhenry.me.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220603135933.143372-1-tom@tom-fitzhenry.me.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_200021_964503_8F6E790E 
X-CRM114-Status: GOOD (  15.57  )
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

Hi Tom,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on mtd/spi-nor/next]
[also build test ERROR on v5.19-rc1 next-20220607]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Tom-Fitzhenry/mtd-spi-nor-siliconkaiser-add-support-for-sk25lp128/20220605-163120
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git spi-nor/next
config: csky-randconfig-r024-20220607 (https://download.01.org/0day-ci/archive/20220608/202206081011.jPVWbSvo-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/9ee4927880d43f8611d371e7cc7d8854a927de66
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Tom-Fitzhenry/mtd-spi-nor-siliconkaiser-add-support-for-sk25lp128/20220605-163120
        git checkout 9ee4927880d43f8611d371e7cc7d8854a927de66
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=csky SHELL=/bin/bash drivers/mtd/spi-nor/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/mtd/spi-nor/siliconkaiser.c:8:18: error: implicit declaration of function 'SNOR_ID3' [-Werror=implicit-function-declaration]
       8 |   { "sk25lp128", SNOR_ID3(0x257018) },
         |                  ^~~~~~~~
>> drivers/mtd/spi-nor/siliconkaiser.c:8:18: error: initializer element is not constant
   drivers/mtd/spi-nor/siliconkaiser.c:8:18: note: (near initialization for 'siliconkaiser_nor_parts[0].id[0]')
   cc1: some warnings being treated as errors


vim +/SNOR_ID3 +8 drivers/mtd/spi-nor/siliconkaiser.c

     6	
     7	static const struct flash_info siliconkaiser_nor_parts[] = {
   > 8	  { "sk25lp128", SNOR_ID3(0x257018) },
     9	};
    10	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
