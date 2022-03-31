Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 625EDC433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 31 Mar 2022 00:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XcPEoGZ8JtcLoAwXXty4C+PAApAM3P8jSDHNXXKbe4U=; b=d3urJLThne4Icq
	HHEZPwlGuCNRqqKmnjDtT3PfWLYnZYSz+VoUisUj6+kpgsqh47C14BzuWpElX8mQnZwPGUpb6pSEj
	zBG4sMoHoFs2WoqQl1OB3qbR/cpkSHo8GYJnr0Mia7NN5Ti0GPZuDQqb4sfvvNtkHqi8AzyvY6GgG
	6utTGqgQ+H9oobNotP4agULohnwIZ91LqKTrsqKeLnFmMNh/90+q7E+ma9KU2cvltyTpBIp9pPv9l
	mQQrPRehPLXMKQW5VaUh/zL9XnEjFEazEfkI3vToABLNt6FitZDJHlgnWN7wHoEyTt2PsXrCuzSDE
	2mprbslqNQuPW6ACmp3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZiT9-000BSX-ME; Thu, 31 Mar 2022 00:15:19 +0000
Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZiT6-000BS2-JH
 for linux-mtd@lists.infradead.org; Thu, 31 Mar 2022 00:15:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648685716; x=1680221716;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6sTWKjK3HZDhhjYP5GjlhZRnGY31f0fAoCQWWzN3SAE=;
 b=ASqiYwgaOaNg7AlS4vTHjXpLpE8FpXx91vWmmu7fSLitdb3Ugq54EHXA
 2kEbCCtrTTT4+QSGYX/JUFbCTdnkrdbzvavP8YKa7qcshn8fk45DNQzQn
 Bvph5HIzL4AXYPXgFwda8s/qN+Lw0Av/cl2TChn8YlTUDMD8wyQio9VBu
 wEetgAlJoRQ9zknqtobM82fpFrsKwKlSpxF5sKpoUcjdOPRfKvxTe1eGp
 iXhA7nhsKkXyThT/HFr01GNTwVjIo2mq+ZqADlX0icAt078iRklY0eOQk
 iTWRylAU15wScJJUdV1ER4H6OIP/nBHuJoSx60sDl9e6rlqmgf6wtivkv Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="257256376"
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; d="scan'208";a="257256376"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 17:15:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; d="scan'208";a="605734246"
Received: from lkp-server02.sh.intel.com (HELO 56431612eabd) ([10.239.97.151])
 by fmsmga008.fm.intel.com with ESMTP; 30 Mar 2022 17:15:11 -0700
Received: from kbuild by 56431612eabd with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nZiT1-0000gi-60;
 Thu, 31 Mar 2022 00:15:11 +0000
Date: Thu, 31 Mar 2022 08:14:53 +0800
From: kernel test robot <lkp@intel.com>
To: Jean-Marc Eurin <jmeurin@google.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jean-Marc Eurin <jmeurin@google.com>
Subject: Re: [PATCH v2 2/2] mtd: mtdoops: Create a header structure for the
 saved mtdoops.
Message-ID: <202203310819.kOiVSg8W-lkp@intel.com>
References: <20220330182816.1177341-4-jmeurin@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220330182816.1177341-4-jmeurin@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_171516_681855_42A88873 
X-CRM114-Status: GOOD (  18.33  )
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

Hi Jean-Marc,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on mtd/mtd/next]
[also build test WARNING on mtd/mtd/fixes linux/master linus/master v5.17 next-20220330]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Jean-Marc-Eurin/mtd-mtdoops-Structure-the-header-of-the-dumped-oops/20220331-023808
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next
config: x86_64-randconfig-a014 (https://download.01.org/0day-ci/archive/20220331/202203310819.kOiVSg8W-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d9501cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/0d39801219fd826554caf69402424346799810d5
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jean-Marc-Eurin/mtd-mtdoops-Structure-the-header-of-the-dumped-oops/20220331-023808
        git checkout 0d39801219fd826554caf69402424346799810d5
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/mtd/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/mtd/mtdoops.c:244:39: warning: format specifies type 'int' but the argument has type 'unsigned long' [-Wformat]
                                  page * record_size, retlen, sizeof(hdr), ret);
                                                              ^~~~~~~~~~~
   include/linux/printk.h:446:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                       ~~~    ^~~~~~~~~~~
   include/linux/printk.h:418:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                           ~~~~    ^~~~~~~~~~~
   1 warning generated.


vim +244 drivers/mtd/mtdoops.c

   225	
   226	static void find_next_position(struct mtdoops_context *cxt)
   227	{
   228		struct mtd_info *mtd = cxt->mtd;
   229		struct mtdoops_hdr hdr;
   230		int ret, page, maxpos = 0;
   231		u32 maxcount = 0xffffffff;
   232		size_t retlen;
   233	
   234		for (page = 0; page < cxt->oops_pages; page++) {
   235			if (mtd_block_isbad(mtd, page * record_size))
   236				continue;
   237			/* Assume the page is used */
   238			mark_page_used(cxt, page);
   239			ret = mtd_read(mtd, page * record_size, sizeof(hdr),
   240				       &retlen, (u_char *)&hdr);
   241			if (retlen != sizeof(hdr) ||
   242					(ret < 0 && !mtd_is_bitflip(ret))) {
   243				printk(KERN_ERR "mtdoops: read failure at %ld (%td of %d read), err %d\n",
 > 244				       page * record_size, retlen, sizeof(hdr), ret);
   245				continue;
   246			}
   247	
   248			if (hdr.seq == 0xffffffff && hdr.magic == 0xffffffff)
   249				mark_page_unused(cxt, page);
   250			if (hdr.seq == 0xffffffff || hdr.magic != MTDOOPS_KERNMSG_MAGIC)
   251				continue;
   252			if (maxcount == 0xffffffff) {
   253				maxcount = hdr.seq;
   254				maxpos = page;
   255			} else if (hdr.seq < 0x40000000 && maxcount > 0xc0000000) {
   256				maxcount = hdr.seq;
   257				maxpos = page;
   258			} else if (hdr.seq > maxcount && hdr.seq < 0xc0000000) {
   259				maxcount = hdr.seq;
   260				maxpos = page;
   261			} else if (hdr.seq > maxcount && hdr.seq > 0xc0000000
   262						&& maxcount > 0x80000000) {
   263				maxcount = hdr.seq;
   264				maxpos = page;
   265			}
   266		}
   267		if (maxcount == 0xffffffff) {
   268			cxt->nextpage = cxt->oops_pages - 1;
   269			cxt->nextcount = 0;
   270		}
   271		else {
   272			cxt->nextpage = maxpos;
   273			cxt->nextcount = maxcount;
   274		}
   275	
   276		mtdoops_inc_counter(cxt);
   277	}
   278	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
