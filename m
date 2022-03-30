Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D922C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Mar 2022 22:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r08YXwx6TtxxAww8XsgKKIWmH/cLT57WsCjeSEfh1ps=; b=iMMc7zwqRGA0oA
	g/f9WClO8Djc9sqANZyZMcO05vgP3jNxGDAqGUt83NPtyU4sGR8mV5hPJA0z0qh4c52MElK5g/WXK
	W5kkmr46y8v5shls68u7nuR1o2Z5J0g66b6Va/Jmhx3MwhUIJYxzIKOJg1ZIWB0cjDQWelWnsfcvM
	vk1XqQxSNZlfsxCXDUYcrg45EY4UDmADD4RKvdWvMmxi2+pAyRWv+yxIqUFSs21lcAt5QNF9oYjAz
	I/bFVApk4o/sbSdcXQoWGdScLFpy3y1T3rXvzV4+J5JkrT6Yyj/pCYKFIkx+0ELF9ZAsZvLQxa2Z8
	ISwujTCfZ4Czr8q44NSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZgjI-0000Zf-HQ; Wed, 30 Mar 2022 22:23:52 +0000
Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZgjE-0000Yq-UX
 for linux-mtd@lists.infradead.org; Wed, 30 Mar 2022 22:23:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648679028; x=1680215028;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=g6pU881YWAtrpzuqnzwzRx2JwUavPzlXZa030gwZJrE=;
 b=hyln3q1Rxs9hWXtSdzH6MkNebXueeq9RN/5E8+GCGv7Q2kFY1nxO6JWH
 DpagKvAzSddjDy+3cAKwlKh2+bBRoSQIDr3A59mkfGOzaHryGeoMZPoDh
 7TK8rjIVv31hwE8ctcRJ5n/7t2oTDAnxqvLGmK0v3KrmNLo+h4W4skpRM
 HTiZ7nxDimQobOks9ou9ivLsWlSFAgn94jmDbasqg7bozDXyEz1h9lcWb
 4wA/s8BWCI+Zu1q5pVmI8vnZsZLzzAgdWaHfNLLbMTtBCPDcL83/Ga7fo
 m+jkk4vRJsA9ZE+5yTzXUNfW3QqXLcPP8BhEMDGyTXhwKsT4PMFbz9Ga8 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="259373306"
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; d="scan'208";a="259373306"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 15:23:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; d="scan'208";a="503483636"
Received: from lkp-server02.sh.intel.com (HELO 56431612eabd) ([10.239.97.151])
 by orsmga003.jf.intel.com with ESMTP; 30 Mar 2022 15:23:44 -0700
Received: from kbuild by 56431612eabd with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nZgj9-0000Zm-L8;
 Wed, 30 Mar 2022 22:23:43 +0000
Date: Thu, 31 Mar 2022 06:23:07 +0800
From: kernel test robot <lkp@intel.com>
To: Jean-Marc Eurin <jmeurin@google.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: kbuild-all@lists.01.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jean-Marc Eurin <jmeurin@google.com>
Subject: Re: [PATCH v2 2/2] mtd: mtdoops: Create a header structure for the
 saved mtdoops.
Message-ID: <202203310648.it4f2xXD-lkp@intel.com>
References: <20220330182816.1177341-4-jmeurin@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220330182816.1177341-4-jmeurin@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_152349_061434_04682896 
X-CRM114-Status: GOOD (  16.01  )
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
config: x86_64-randconfig-a015 (https://download.01.org/0day-ci/archive/20220331/202203310648.it4f2xXD-lkp@intel.com/config)
compiler: gcc-9 (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/0d39801219fd826554caf69402424346799810d5
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jean-Marc-Eurin/mtd-mtdoops-Structure-the-header-of-the-dumped-oops/20220331-023808
        git checkout 0d39801219fd826554caf69402424346799810d5
        # save the config file to linux build tree
        mkdir build_dir
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/mtd/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from include/linux/kernel.h:29,
                    from drivers/mtd/mtdoops.c:10:
   drivers/mtd/mtdoops.c: In function 'find_next_position':
>> include/linux/kern_levels.h:5:18: warning: format '%d' expects argument of type 'int', but argument 4 has type 'long unsigned int' [-Wformat=]
       5 | #define KERN_SOH "\001"  /* ASCII Start Of Header */
         |                  ^~~~~~
   include/linux/printk.h:418:11: note: in definition of macro 'printk_index_wrap'
     418 |   _p_func(_fmt, ##__VA_ARGS__);    \
         |           ^~~~
   drivers/mtd/mtdoops.c:243:4: note: in expansion of macro 'printk'
     243 |    printk(KERN_ERR "mtdoops: read failure at %ld (%td of %d read), err %d\n",
         |    ^~~~~~
   include/linux/kern_levels.h:11:18: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR KERN_SOH "3" /* error conditions */
         |                  ^~~~~~~~
   drivers/mtd/mtdoops.c:243:11: note: in expansion of macro 'KERN_ERR'
     243 |    printk(KERN_ERR "mtdoops: read failure at %ld (%td of %d read), err %d\n",
         |           ^~~~~~~~
   drivers/mtd/mtdoops.c:243:59: note: format string is defined here
     243 |    printk(KERN_ERR "mtdoops: read failure at %ld (%td of %d read), err %d\n",
         |                                                          ~^
         |                                                           |
         |                                                           int
         |                                                          %ld


vim +5 include/linux/kern_levels.h

314ba3520e513a Joe Perches 2012-07-30  4  
04d2c8c83d0e3a Joe Perches 2012-07-30 @5  #define KERN_SOH	"\001"		/* ASCII Start Of Header */
04d2c8c83d0e3a Joe Perches 2012-07-30  6  #define KERN_SOH_ASCII	'\001'
04d2c8c83d0e3a Joe Perches 2012-07-30  7  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
