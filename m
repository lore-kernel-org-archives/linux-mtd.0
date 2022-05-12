Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40409C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 12 May 2022 18:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jAdRiEArhkuYK7Y4HY/MYhudUIhOeJoHM85wv5cQtnw=; b=oxKR2UfB1BzWrA
	TtjiHmL1jh5ff52Bof9YnC8Eh/3HbpuCvyWTl0M6V4hTEs/26NboHBehKlEHovpVuWh9ugJXH/nRm
	uICXdVii0sVUlZfgqhnadHrew2UIYYZPuVj33r7NGcw9/4cKbXcF1+eqBYXp281pDnYZ81uYFbK0z
	EkjfZQs2qedSIAANkgdxOgg3/j9a28usISvqZfcJIjZ5zlxeFbrSJfVuY//uRTHu545S/M999K1jA
	yz8Rnl0gDRI95H2Jf6a6ozJjaDX/xwXfadv674vqjvwVWiGhSizpes07qjynWKPBvakmIgj3BrHta
	COtfzwPCP4pfi7YEkVQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npDSg-00D5KJ-Qs; Thu, 12 May 2022 18:22:54 +0000
Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npDSe-00D5JH-6i
 for linux-mtd@lists.infradead.org; Thu, 12 May 2022 18:22:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652379772; x=1683915772;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/lMp0wN6+3oR5lan9YwIxjQ08ZrF0e3S9TFAB75U+44=;
 b=iSzw/PWZlZZ4EYtXEAukQFmBpJ+MIh5IIBPmcUlPZUd38gRJ9DYEGZkI
 rKVwJagRq2Kklvxr7Gk7yGvLPi3FpE35dyhQyljMNxQPiTNXw6cYDXQkt
 x3oOJv3FiOOBwHI/CnEoiJy2JPGiOMYq424DYIKjuyy6U/XgQgdMvHfgE
 qra7AheRhogEj77JxZG79chxAO83L+eLgIGG46FeRkYmlpUT3QI1ekRWT
 FsloGNJ/sbCmm0xTX7E2zXonjQmLAydhlPtad6bPd7dkOhe5E7gYuMwAA
 z+yWv7hp0DCeUL/qkVhbBedr8veynBy2uslTwMa8YWXdqCNpkONFxanIa g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10345"; a="295355946"
X-IronPort-AV: E=Sophos;i="5.91,220,1647327600"; d="scan'208";a="295355946"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2022 11:22:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,220,1647327600"; d="scan'208";a="566828491"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
 by orsmga007.jf.intel.com with ESMTP; 12 May 2022 11:22:44 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1npDSW-000Knx-80;
 Thu, 12 May 2022 18:22:44 +0000
Date: Fri, 13 May 2022 02:22:03 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Golle <daniel@makrotopia.org>, linux-block@vger.kernel.org,
 linux-efi@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: kbuild-all@lists.01.org, Tom Rini <trini@konsulko.com>,
 Jens Axboe <axboe@kernel.dk>, Davidlohr Bueso <dave@stgolabs.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH v2 2/5] block: add partition parser for U-Boot uImage.FIT
Message-ID: <202205130213.kRDmMP6B-lkp@intel.com>
References: <YnjxXASWU5Ps9ZoA@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YnjxXASWU5Ps9ZoA@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_112252_329261_C0ABB8F2 
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

Hi Daniel,

I love your patch! Yet something to improve:

[auto build test ERROR on axboe-block/for-next]
[also build test ERROR on mtd/mtd/next mtd/mtd/fixes v5.18-rc6 next-20220512]
[cannot apply to rw-ubifs/next rw-ubifs/fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Golle/partition-parser-for-U-Boot-s-uImage-FIT/20220509-185349
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
config: xtensa-buildonly-randconfig-r001-20220512 (https://download.01.org/0day-ci/archive/20220513/202205130213.kRDmMP6B-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/5a69884cfc6091e8d7c5491fbf57dd5e13cd5ee8
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Daniel-Golle/partition-parser-for-U-Boot-s-uImage-FIT/20220509-185349
        git checkout 5a69884cfc6091e8d7c5491fbf57dd5e13cd5ee8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=xtensa SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   xtensa-linux-ld: block/partitions/fit.o: in function `put_page':
>> fit.c:(.text+0x11c): undefined reference to `fdt_check_header'
   xtensa-linux-ld: block/partitions/fit.o: in function `parse_fit_partitions':
   fit.c:(.text+0x262): undefined reference to `fdt_check_header'
   xtensa-linux-ld: block/partitions/fit.o: in function `put_page':
>> fit.c:(.text+0x124): undefined reference to `fdt_path_offset'
   xtensa-linux-ld: block/partitions/fit.o: in function `parse_fit_partitions':
   fit.c:(.text+0x320): undefined reference to `fdt_path_offset'
   xtensa-linux-ld: block/partitions/fit.o: in function `put_page':
>> fit.c:(.text+0x128): undefined reference to `fdt_getprop'
   xtensa-linux-ld: block/partitions/fit.o: in function `parse_fit_partitions':
   fit.c:(.text+0x337): undefined reference to `fdt_getprop'
   xtensa-linux-ld: block/partitions/fit.o: in function `put_page':
>> fit.c:(.text+0x130): undefined reference to `fdt_subnode_offset'
   xtensa-linux-ld: block/partitions/fit.o: in function `parse_fit_partitions':
   fit.c:(.text+0x356): undefined reference to `fdt_subnode_offset'
   xtensa-linux-ld: block/partitions/fit.o: in function `put_page':
   fit.c:(.text+0x138): undefined reference to `fdt_getprop'
   xtensa-linux-ld: block/partitions/fit.o: in function `parse_fit_partitions':
   fit.c:(.text+0x382): undefined reference to `fdt_getprop'
   xtensa-linux-ld: block/partitions/fit.o: in function `put_page':
   fit.c:(.text+0x13c): undefined reference to `fdt_getprop'
   xtensa-linux-ld: block/partitions/fit.o: in function `parse_fit_partitions':
   fit.c:(.text+0x397): undefined reference to `fdt_getprop'
   xtensa-linux-ld: block/partitions/fit.o: in function `put_page':
   fit.c:(.text+0x148): undefined reference to `fdt_path_offset'
   xtensa-linux-ld: block/partitions/fit.o: in function `parse_fit_partitions':
   fit.c:(.text+0x3e3): undefined reference to `fdt_path_offset'
   xtensa-linux-ld: block/partitions/fit.o: in function `put_page':
>> fit.c:(.text+0x150): undefined reference to `fdt_first_subnode'
   xtensa-linux-ld: block/partitions/fit.o: in function `parse_fit_partitions':
   fit.c:(.text+0x412): undefined reference to `fdt_first_subnode'
   xtensa-linux-ld: block/partitions/fit.o: in function `put_page':
>> fit.c:(.text+0x154): undefined reference to `fdt_get_name'
   xtensa-linux-ld: block/partitions/fit.o: in function `parse_fit_partitions':
   fit.c:(.text+0x423): undefined reference to `fdt_get_name'
   xtensa-linux-ld: block/partitions/fit.o: in function `put_page':
   fit.c:(.text+0x158): undefined reference to `fdt_getprop'
   xtensa-linux-ld: block/partitions/fit.o: in function `parse_fit_partitions':
   fit.c:(.text+0x43a): undefined reference to `fdt_getprop'
   xtensa-linux-ld: block/partitions/fit.o: in function `put_page':
   fit.c:(.text+0x15c): undefined reference to `fdt_getprop'
   xtensa-linux-ld: block/partitions/fit.o: in function `parse_fit_partitions':
   fit.c:(.text+0x44b): undefined reference to `fdt_getprop'
   xtensa-linux-ld: block/partitions/fit.o: in function `put_page':
   fit.c:(.text+0x160): undefined reference to `fdt_getprop'
   xtensa-linux-ld: block/partitions/fit.o:fit.c:(.text+0x45f): more undefined references to `fdt_getprop' follow
   xtensa-linux-ld: block/partitions/fit.o: in function `put_page':
>> fit.c:(.text+0x184): undefined reference to `fdt_next_subnode'
   xtensa-linux-ld: block/partitions/fit.o: in function `parse_fit_partitions':
   fit.c:(.text+0x6ae): undefined reference to `fdt_next_subnode'

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
