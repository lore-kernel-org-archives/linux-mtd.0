Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BCCAEDEC71
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Sep 2023 15:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PJLe63oN8DDv2IrLswOCC8V2JqpaZC+ewYRgfEkTDns=; b=cefYsWUbFQJy7T
	haZEhZhFL8tvFhyuPJx7eVwcSfPGxBFKR4X7Dyez6ugk5U/q5XtuCJTyE7KSMH3UdEF3SJLRadJuy
	29+gHDV0T0Nf4qB3uV3vOvjmyQNxtw80eiT3RsgpMGHVAQ9nRWPVCCA+fl6gRaDXrnDCEHLWSSWbu
	lH7smSQE3XZP+VN3O8rqXLvLF5nJlSCge+Gl4a9seaEfeMUA8i+NyxHbI68+qk0VzflAJmMs1fdi3
	oeEa53xo3GRS+W8j+WgMTgn49RM82u1i6wQs788jF8Zxh6iNsvnkpxYXg+Vn+OhRZUTochzGF3y6X
	iToe/3+xSbHiy3dOuhiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgRfd-006CxV-32;
	Wed, 13 Sep 2023 15:20:49 +0000
Received: from mgamail.intel.com ([134.134.136.126])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgRfb-006CwF-0W
	for linux-mtd@lists.infradead.org;
	Wed, 13 Sep 2023 15:20:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694618447; x=1726154447;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1LTANdPAE8m2PHoe4hG/3j6oI5p3jyUM3ew3Mdwah6w=;
  b=YqlblyD6VoaA4e/klVTEHIVZRbeJyyJMsWnulUVOzg0Tboh0k3KJZt3g
   xwzM2vtDTDXJV5Is9L8KdnZi3EjHp+7DKWGKvLXupqu63OuQE7UgwXocA
   GyaMjzEzXbIacWiqT7gRWLhNn+Y4Hk7HRcfOgcVBF+67pQnerxiz6oteo
   ClNuvoXAp7FFzNLa+jpyNSaEbIxTT7EtnkQQSuCeYLCtMiUgTVPMzRwDx
   8pKXsqgMfc72uux4uAaFMMv70YeX10/2XuS91Iq0R2xINZuoECNm/ccM2
   zHRz5HZb7bwMPz4oZJIMM3U6Sy+B9Gaj0daiOADqx0NEwbk3hWUTjUgOd
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="363723867"
X-IronPort-AV: E=Sophos;i="6.02,143,1688454000"; 
   d="scan'208";a="363723867"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 08:20:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="814249794"
X-IronPort-AV: E=Sophos;i="6.02,143,1688454000"; 
   d="scan'208";a="814249794"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 13 Sep 2023 08:20:11 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgRez-0000E4-0J;
	Wed, 13 Sep 2023 15:20:09 +0000
Date: Wed, 13 Sep 2023 23:19:47 +0800
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
Message-ID: <202309132304.Uw3cYH9C-lkp@intel.com>
References: <20230913115001.23183-2-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230913115001.23183-2-brgl@bgdev.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_082047_248291_6F7F209B 
X-CRM114-Status: GOOD (  14.16  )
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

kernel test robot noticed the following build errors:

[auto build test ERROR on brgl/gpio/for-next]
[also build test ERROR on mtd/nand/next linus/master ulf-hansson-mmc-mirror/next v6.6-rc1 next-20230913]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewski/gpiolib-provide-gpiod_set_active_-low-high/20230913-195053
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20230913115001.23183-2-brgl%40bgdev.pl
patch subject: [PATCH 1/5] gpiolib: provide gpiod_set_active_[low/high]()
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20230913/202309132304.Uw3cYH9C-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230913/202309132304.Uw3cYH9C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309132304.Uw3cYH9C-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/nvmem-provider.h:15,
                    from include/linux/rtc.h:18,
                    from include/linux/efi.h:20,
                    from block/partitions/efi.h:19,
                    from block/partitions/msdos.c:32:
>> include/linux/gpio/consumer.h:505:1: error: expected ';', ',' or ')' before '{' token
     505 | {
         | ^


vim +505 include/linux/gpio/consumer.h

   503	
   504	static inline void gpiod_set_active_low(struct gpio_desc *desc
 > 505	{
   506		/* GPIO can never have been requested */
   507		WARN_ON(desc);
   508	}
   509	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
