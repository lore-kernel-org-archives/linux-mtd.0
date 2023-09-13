Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72181EE0200
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Sep 2023 18:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q4gGSrpWgdOwGyJK8BZ/b7416NiU+qiQkpj3IplJ0EQ=; b=1rXW9hIibsQq4D
	PEa2ZPx2bdZ5nXaac6tj6JjhwTpUnTCIG2NVYAT5dL0Ag4UdOB+xHWdJg7wj6WawpPKU6lfxGOIQE
	X1NI4nPyb9j2DwpQSkAKLElpFQmXyREaZdy98nECrUlewbm6Nm7UVJ+Ux5kMBo+1rb957+97FNqP1
	tKssWuxQ7uozmp4oTZXktanBUdRJyvlI4dSu1kCNVQ8HEBFOnFgPj6wk5PQY2MxRhQQON9xcrkEx1
	zyv/umbU5DObFHS4r0tyQXLDfNz4wBnA0Xcy2z7ZQOP5gRgLMf3HuHzp1zH0PI1eq6GO2vwb9dt/r
	csX8tXZUvBNwtPN9OVhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgUoi-006YSR-39;
	Wed, 13 Sep 2023 18:42:25 +0000
Received: from mgamail.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgUof-006YS6-0y
	for linux-mtd@lists.infradead.org;
	Wed, 13 Sep 2023 18:42:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694630541; x=1726166541;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ySvBneYbyUTIYVjc9ntDNQZxLyrK/wDV6Bnw1fCxoOQ=;
  b=El2t2GHVS2EP2rmuovWdemQuvFbYFd1a3Bobedt2JiFGc0I1bdoWfSV6
   ycIbtdK9uUyq6owzVUPJMOO1x/XFuazR8LzDjfGV2aso7tq52FB6Krw8T
   XnRd3l1LZrWcUxLsTnPdSgz8BCdNzDbgYknnQNXD0O99f0hx1I3uqHBk9
   Zb6LnMrfMZFAKCEBHrQwqd5qnc+U5vLEG6b3SP2wYp0CtVUCXKr2QHbMY
   jlZU8iblPP6CmqR5jQ2dJSHfG47RZkwz7cbMWS7SbcaFCe1ZW9TE/lXws
   /y93T9Lc6NklDWWtE6T1hGaNFtUQ+OH9NcZ+tMlT22P8AiLqbuXVyy8Sn
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="377663172"
X-IronPort-AV: E=Sophos;i="6.02,143,1688454000"; 
   d="scan'208";a="377663172"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 11:42:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="991040387"
X-IronPort-AV: E=Sophos;i="6.02,143,1688454000"; 
   d="scan'208";a="991040387"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 13 Sep 2023 11:41:57 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgUoF-0000T3-0O;
	Wed, 13 Sep 2023 18:41:55 +0000
Date: Thu, 14 Sep 2023 02:41:19 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andy@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Harvey Hunt <harveyhuntnexus@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Daniel Scally <djrscally@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Mark Gross <markgross@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-mtd@lists.infradead.org,
	platform-driver-x86@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 1/5] gpiolib: provide gpiod_set_active_[low/high]()
Message-ID: <202309140219.EH2Y6r52-lkp@intel.com>
References: <20230913115001.23183-2-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230913115001.23183-2-brgl@bgdev.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_114221_352944_900BB9D1 
X-CRM114-Status: GOOD (  14.58  )
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

Hi Bartosz,

kernel test robot noticed the following build warnings:

[auto build test WARNING on brgl/gpio/for-next]
[also build test WARNING on mtd/nand/next linus/master ulf-hansson-mmc-mirror/next v6.6-rc1 next-20230913]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewski/gpiolib-provide-gpiod_set_active_-low-high/20230913-195053
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20230913115001.23183-2-brgl%40bgdev.pl
patch subject: [PATCH 1/5] gpiolib: provide gpiod_set_active_[low/high]()
config: alpha-defconfig (https://download.01.org/0day-ci/archive/20230914/202309140219.EH2Y6r52-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230914/202309140219.EH2Y6r52-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309140219.EH2Y6r52-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/nvmem-provider.h:15,
                    from include/linux/rtc.h:18,
                    from include/linux/mc146818rtc.h:15,
                    from drivers/block/floppy.c:183:
   include/linux/gpio/consumer.h:505:1: error: expected ';', ',' or ')' before '{' token
     505 | {
         | ^
>> drivers/block/floppy.c:165:12: warning: 'print_unex' defined but not used [-Wunused-variable]
     165 | static int print_unex = 1;
         |            ^~~~~~~~~~


vim +/print_unex +165 drivers/block/floppy.c

87f530d8f17336 Joe Perches            2010-03-10  163  
^1da177e4c3f41 Linus Torvalds         2005-04-16  164  /* do print messages for unexpected interrupts */
^1da177e4c3f41 Linus Torvalds         2005-04-16 @165  static int print_unex = 1;
^1da177e4c3f41 Linus Torvalds         2005-04-16  166  #include <linux/module.h>
^1da177e4c3f41 Linus Torvalds         2005-04-16  167  #include <linux/sched.h>
^1da177e4c3f41 Linus Torvalds         2005-04-16  168  #include <linux/fs.h>
^1da177e4c3f41 Linus Torvalds         2005-04-16  169  #include <linux/kernel.h>
^1da177e4c3f41 Linus Torvalds         2005-04-16  170  #include <linux/timer.h>
^1da177e4c3f41 Linus Torvalds         2005-04-16  171  #include <linux/workqueue.h>
^1da177e4c3f41 Linus Torvalds         2005-04-16  172  #include <linux/fdreg.h>
^1da177e4c3f41 Linus Torvalds         2005-04-16  173  #include <linux/fd.h>
^1da177e4c3f41 Linus Torvalds         2005-04-16  174  #include <linux/hdreg.h>
^1da177e4c3f41 Linus Torvalds         2005-04-16  175  #include <linux/errno.h>
^1da177e4c3f41 Linus Torvalds         2005-04-16  176  #include <linux/slab.h>
^1da177e4c3f41 Linus Torvalds         2005-04-16  177  #include <linux/mm.h>
^1da177e4c3f41 Linus Torvalds         2005-04-16  178  #include <linux/bio.h>
^1da177e4c3f41 Linus Torvalds         2005-04-16  179  #include <linux/string.h>
50297cbf07427b Marcelo Feitoza Parisi 2006-03-28  180  #include <linux/jiffies.h>
^1da177e4c3f41 Linus Torvalds         2005-04-16  181  #include <linux/fcntl.h>
^1da177e4c3f41 Linus Torvalds         2005-04-16  182  #include <linux/delay.h>
^1da177e4c3f41 Linus Torvalds         2005-04-16 @183  #include <linux/mc146818rtc.h>	/* CMOS defines */
^1da177e4c3f41 Linus Torvalds         2005-04-16  184  #include <linux/ioport.h>
^1da177e4c3f41 Linus Torvalds         2005-04-16  185  #include <linux/interrupt.h>
^1da177e4c3f41 Linus Torvalds         2005-04-16  186  #include <linux/init.h>
b81e0c2372e65e Christoph Hellwig      2021-09-20  187  #include <linux/major.h>
d052d1beff7069 Russell King           2005-10-29  188  #include <linux/platform_device.h>
83f9ef463bcb4b Scott James Remnant    2009-04-02  189  #include <linux/mod_devicetable.h>
b1c82b5c55851b Jes Sorensen           2006-03-23  190  #include <linux/mutex.h>
d49375434ec011 Joe Perches            2010-03-10  191  #include <linux/io.h>
d49375434ec011 Joe Perches            2010-03-10  192  #include <linux/uaccess.h>
0cc15d03bcccdf Andi Kleen             2012-07-02  193  #include <linux/async.h>
229b53c9bf4e11 Al Viro                2017-06-27  194  #include <linux/compat.h>
^1da177e4c3f41 Linus Torvalds         2005-04-16  195  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
