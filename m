Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 269DCC433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Dec 2021 20:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lRJiTcVEDyYn0Wx19TdYhK2UmQL+/IrtBG8EIMTZC9Y=; b=JOlXT64FciB9JQ
	O++bpOqqNh2kvCwzIOhfP0t1ixRamlN5cd9DWZC0HweC/SuvKZOsrPIwZJKJ2cun8YM8x1kFtlM+F
	zif/3+ytOMRQcSJGqR6gy0TEJReM6HdShMsiJQiUq719zYolLMLhSHQCB7qUfc0yeT/f8Cp0JvVBN
	gs5fzvxNeco3WoDrXk2zy0L1DyOFbJaJNhqx+VYA+GRj6kcvrrzXW1hfJhQoQeFToGLUEMbEGFHoj
	ULS8uF3KhzMBGVv+t3H5JnoYMzdkc5zZQaZrtj88huQ9HJTbr3Ce6Pn3aYLWYZv+LebHZPpYM4jJH
	U0A/eVRrN7Y7RmsE7AdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxx97-007Sir-9g; Thu, 16 Dec 2021 20:14:33 +0000
Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxx94-007SiC-8e
 for linux-mtd@lists.infradead.org; Thu, 16 Dec 2021 20:14:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639685670; x=1671221670;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=swA2B6MCWVmOpC9fnzvUkHxpMoIIBvJg2JcRkGrKd3Y=;
 b=iSOA5MmPvvAdGHTCYF6EJXzRAeYUiQdjsfxXFbzaBBZteNsdkRU3ngRp
 sm8wihSAG705BA69CnilacRb7pxssfSUNexR5dRHkJzy3X2u9Ot2XcLSC
 +Dqnc8T47VTA0cDeq8QwoNGOnoV1w46/VEELdm12go3NZT5GxjvqF1CIR
 UvwvFzSaez2o1r7PHrJiJ/XJUl9QwHwbiSB9jpjuMMrvgCzNSDQpw5q4Z
 mznR3Rj5dPO4F3Vq3/XDvGAupMQC7xThOpfYcUlc/wYZxGtmA/OsjRfLf
 a1gJHAGwhMoNfp9atx4w7YRYimwbZV6gCBKPcAvopJYJoGwT9CqrRkj/6 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10200"; a="263755821"
X-IronPort-AV: E=Sophos;i="5.88,212,1635231600"; d="scan'208";a="263755821"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2021 12:14:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,212,1635231600"; d="scan'208";a="546130562"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
 by orsmga001.jf.intel.com with ESMTP; 16 Dec 2021 12:14:26 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mxx8u-0003ku-UH; Thu, 16 Dec 2021 20:14:20 +0000
Date: Fri, 17 Dec 2021 04:14:18 +0800
From: kernel test robot <lkp@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org
Cc: kbuild-all@lists.01.org
Subject: Re: [PATCH v6 20/28] spi: spi-mem: Fill the spi-mem controller
 capabilities of all the drivers
Message-ID: <202112170416.Ew8eShY1-lkp@intel.com>
References: <20211216111654.238086-21-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211216111654.238086-21-miquel.raynal@bootlin.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_121430_359232_8A72B831 
X-CRM114-Status: GOOD (  15.12  )
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

Hi Miquel,

I love your patch! Perhaps something to improve:

[auto build test WARNING on broonie-spi/for-next]
[also build test WARNING on mtd/nand/next mtd/mtd/next mtd/mtd/fixes v5.16-rc5 next-20211215]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Miquel-Raynal/External-ECC-engines-Macronix-support/20211216-191821
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
config: i386-randconfig-s031-20211216 (https://download.01.org/0day-ci/archive/20211217/202112170416.Ew8eShY1-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://github.com/0day-ci/linux/commit/bf16b56f7a0cc5aa237129a6b8bd216dc2632c8b
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Miquel-Raynal/External-ECC-engines-Macronix-support/20211216-191821
        git checkout bf16b56f7a0cc5aa237129a6b8bd216dc2632c8b
        # save the config file to linux build tree
        mkdir build_dir
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash drivers/spi/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
   drivers/spi/spi-mxic.c: note: in included file:
   include/linux/spi/spi-mem.h:369:38: sparse: sparse: symbol 'spi_mem_no_caps' was not declared. Should it be static?
>> drivers/spi/spi-mxic.c:446:38: sparse: sparse: symbol 'mxic_spi_mem_caps' was not declared. Should it be static?

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
