Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A18CCCA476
	for <linux-mtd@archiver.kernel.org>; Sat, 11 Oct 2025 20:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T5tw2BA8HPp2QQYB8Mf9H1jwz3u8fIYIOIygvWZuFaQ=; b=C0lPollRB5xK2V
	cvsZHf5xiWWTamnWmUgKEJLIAmB6VlKU59BrnvTIHB10ApIcSq/pKtaMeCkdL42jQE/5ssYduQ2mv
	SY6VOHG8nTsmAWizq8GYtk8MEUBCuD6dxh1jB1fjNL1TPIY9edtvWNmzosRQprWWLttgd6X3ul6YY
	+1hkEU/gyrj1RF+o32GRcgSpxRb3Rvy3I5FODDxBV52L/7snoowm5WhlslFmxt4KzTrODrUbHB9oj
	BwanskajTpOWGHLeeIUhG2Dd1ROlVCWqWV5rGUB69cD/XVEnS+D2g9D8muS994+46LUkj3jNK/9Q+
	ODZ8KV5oZBL6oRdX6xgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7foW-0000000AkOA-04Eo;
	Sat, 11 Oct 2025 20:03:36 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7foT-0000000AkNH-2Cuj
	for linux-mtd@lists.infradead.org;
	Sat, 11 Oct 2025 20:03:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760213014; x=1791749014;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sXduRfgN8QZmJb/jAmwsjJjU3f1IeTvflTj6WHXOhwQ=;
  b=i/7I7mmbYPxty3tcxnOwBYqnDyRsT+n2fEUz+qbXH5hAOZqxMatQ9kbh
   fiM90ihQw1fMYQHZIiJtOtQbL1i6Lvpevj003HnjCwA90tlZfXTYZNsAH
   jQefb9A6hUM0zvSt51zMKWhxZ8sPe4Ns8J0yNxMQAXzarcf+BxKWhDrY0
   QG0SBPPiNndeN6Ac99soa6TsyDH9W5GZlm5jEEeMX8yAkZKMp/VE8khZw
   QWxY3+oU8vRonxcw7RP4kduEOmKGN6jVPOgl0sECt/To7ezM137EkTGqc
   Qj6MiyjkJTW5uchsInpH7mXY8qkBqTI+/oKm45mQ2y6x+xGWLAeCEZJKY
   Q==;
X-CSE-ConnectionGUID: WdzQ3RLJRLarzN/n6ZLVgw==
X-CSE-MsgGUID: hJT5b8ZNTeaEmh7E3isBgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11579"; a="62283139"
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; 
   d="scan'208";a="62283139"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2025 13:03:32 -0700
X-CSE-ConnectionGUID: E0auJUmHRtKjkKJAS1drpQ==
X-CSE-MsgGUID: 5leZJdpdQdGk8tquT9KLog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; 
   d="scan'208";a="218347965"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 11 Oct 2025 13:03:29 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7foN-0003xb-0M;
	Sat, 11 Oct 2025 20:03:27 +0000
Date: Sun, 12 Oct 2025 04:03:15 +0800
From: kernel test robot <lkp@intel.com>
To: jayxu1990@gmail.com, Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	avnerkhan@utexas.edu, rdlee.upstream@gmail.com,
	Jay Xu <jayxu1990@gmail.com>
Subject: Re: [PATCH] mtd: core: Add nand_id sysfs attribute for NAND devices
Message-ID: <202510120356.STGKDkA5-lkp@intel.com>
References: <20251007224049.2798233-1-jayxu1990@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251007224049.2798233-1-jayxu1990@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251011_130333_633874_C2F53E10 
X-CRM114-Status: GOOD (  10.32  )
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

kernel test robot noticed the following build errors:

[auto build test ERROR on mtd/mtd/next]
[also build test ERROR on mtd/mtd/fixes linus/master v6.17 next-20251010]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/jayxu1990-gmail-com/mtd-core-Add-nand_id-sysfs-attribute-for-NAND-devices/20251010-092101
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next
patch link:    https://lore.kernel.org/r/20251007224049.2798233-1-jayxu1990%40gmail.com
patch subject: [PATCH] mtd: core: Add nand_id sysfs attribute for NAND devices
config: i386-buildonly-randconfig-002-20251011 (https://download.01.org/0day-ci/archive/20251012/202510120356.STGKDkA5-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251012/202510120356.STGKDkA5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510120356.STGKDkA5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: nand_readid_op
   >>> referenced by mtdcore.c:359 (drivers/mtd/mtdcore.c:359)
   >>>               drivers/mtd/mtdcore.o:(mtd_nand_id_show) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
