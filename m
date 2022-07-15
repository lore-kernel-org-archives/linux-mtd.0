Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52619C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Jul 2022 00:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AVlcywJ8Xl6I7glaIfUbR8HiZr9ms6MJfgHKblD6aAQ=; b=FvUE0BONjvBAnf
	EHBc3ClrSKpCz9GmAa5Sm2ZPNgHw+PTsoxiiFosqMvjg7f4OPQvFDI5JYOGEQ/jMoWQjHfAhU0XH5
	usMiqGJeKW7vSrYHMA4OEhkw3GlRsg4Su1WlyTOfK+tg8l2HrYlCVxfM4nVQh0BeVsbPXlhOXi6b2
	TIs1i4u4LXaPaMUUZqHwtbGzMIQaPxMlKGUA6GMk9bMIzeKyty9NH5WUhhCP05mcZmJ9mbAuhRCOW
	TC3BoO2vbUBWdw+YbN3VO881LqaGX1ZdsA0Uggy3uzxrl8O3IVmMFT4fxBMmDCMm8sjhvExsENAM1
	Ka6WOMXiq+v4WeyCUcxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oC9RD-002pIl-CN; Fri, 15 Jul 2022 00:44:11 +0000
Received: from mga18.intel.com ([134.134.136.126])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oC9R2-002pAq-MP; Fri, 15 Jul 2022 00:44:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657845840; x=1689381840;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jJ2QO/k1ABVMsRZgKGsv6X/yHVjuDNgI50HCJWC87kE=;
  b=lr6Xv0ak7W3kesdrER+Uj6CGCOSbnKGzzrwi7KTAvjBpZ1kItdCsRWC/
   oXG0esslhmukQzQPotUZAv1pPva3L+MYyJLbnQ/1UWiHd8mG5qVsngQsr
   RLET4SLhBxmOaDWdR/YiogPa1hZT9lXBug2d9EEZGsLH6cu0d44/YOXZO
   zAw8ewOyYw9Syi/W+O+0Gen7vMObAc3tlBGp2zQ+lbtR7O4aSlR3Ly9Oi
   jKFRwnSd8nBuaa4PACMBfF0vn76pt0UumXdz414iz8VJe3Jj+HFEzsTBH
   aL+uTFnD7u/e4ojhOJ4DRViGbKxRxEq2HkPC859cwZkdbpP7DRrgw1LNE
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10408"; a="268694581"
X-IronPort-AV: E=Sophos;i="5.92,272,1650956400"; 
   d="scan'208";a="268694581"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2022 17:43:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,272,1650956400"; 
   d="scan'208";a="923304559"
Received: from lkp-server01.sh.intel.com (HELO fd2c14d642b4) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 14 Jul 2022 17:43:52 -0700
Received: from kbuild by fd2c14d642b4 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oC9Qu-0001Jm-9b;
	Fri, 15 Jul 2022 00:43:52 +0000
Date: Fri, 15 Jul 2022 08:43:31 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Suchanek <msuchanek@suse.de>, linux-sunxi@lists.linux.dev
Cc: kbuild-all@lists.01.org, Michal Suchanek <msuchanek@suse.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Tudor Ambarus <tudor.ambarus@microchip.com>,
	Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH 1/2] mtd: spi-nor: When a flash memory is missing do not
 report an error
Message-ID: <202207150854.H5k2mIIu-lkp@intel.com>
References: <701967b0c418db333c66b48d225df60aa9d03ead.1657826188.git.msuchanek@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <701967b0c418db333c66b48d225df60aa9d03ead.1657826188.git.msuchanek@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220714_174400_818250_1BF5213E 
X-CRM114-Status: GOOD (  15.91  )
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

Hi Michal,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on mtd/spi-nor/next]
[also build test WARNING on sunxi/sunxi/for-next krzk/for-next krzk-dt/for-next krzk-mem-ctrl/for-next linus/master v5.19-rc6 next-20220714]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Michal-Suchanek/mtd-spi-nor-When-a-flash-memory-is-missing-do-not-report-an-error/20220715-032336
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git spi-nor/next
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20220715/202207150854.H5k2mIIu-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/d747dae258dd8d5220d38fae5fd09be703b0391b
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Michal-Suchanek/mtd-spi-nor-When-a-flash-memory-is-missing-do-not-report-an-error/20220715-032336
        git checkout d747dae258dd8d5220d38fae5fd09be703b0391b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/mtd/spi-nor/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/mtd/spi-nor/core.c:1655:8: warning: type qualifiers ignored on function return type [-Wignored-qualifiers]
    1655 | static const bool buffer_uniform(const u8 *buffer, size_t length)
         |        ^~~~~


vim +1655 drivers/mtd/spi-nor/core.c

  1654	
> 1655	static const bool buffer_uniform(const u8 *buffer, size_t length)
  1656	{
  1657		bool all0;
  1658		size_t i;
  1659	
  1660		for (all0 = true, i = 0; i < length; i++)
  1661			if (buffer[i] != 0) {
  1662				all0 = false;
  1663				break;
  1664			}
  1665		if (all0)
  1666			return true;
  1667		for (i = 0; i < length; i++)
  1668			if (buffer[i] != 0xff)
  1669				return false;
  1670		return true;
  1671	}
  1672	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
