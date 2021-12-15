Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74790C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Dec 2021 20:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TSuG0pR5r5C7dk01jWtLCKDD8b1PKMKrnNvFXEnPKCk=; b=bYuMq+W7iX/F84
	l1p3WH+tzbl0CFtmjD8pWjRYTHS/KwqOPr3EbuqrO8qgoxoaLqJKQnYyy6vBoZK+Y8goD4TRzGTj3
	4up5Z+Jxq6C8K1eamjfGGnRXenT9EJ50JavevO3r0luDuAZacQzBErDpHRTwc2gSRC5rF4KfU7RFG
	BmKq0BL3Mf2cd17oISxdmOk9+2Mc285K4OGE6/ycVpoCrJEijmoj1iEx4QPvAeVEioQ0ALhKxripy
	o450x6+HJj1gGToiyrM+FACScb/6L0dQMN+4vb3OTlT65+7/2evEQcYYNfqf/MU7B4rMD0OcxK1/z
	NOBcjvS+GAzQtfIWbxvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxb0l-002eD2-MT; Wed, 15 Dec 2021 20:36:27 +0000
Received: from mga05.intel.com ([192.55.52.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxb0e-002eBa-Ov
 for linux-mtd@lists.infradead.org; Wed, 15 Dec 2021 20:36:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639600580; x=1671136580;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=NaX2LedrarFz0khULM+i3GiuzFS47CD+xm6gGAWsNJc=;
 b=S3koJ2gLgmziwP6JHp2J+ejhD7fMVmXyzwybmbKXrTa3QUAMGoWOV+2N
 x7A6Wg+lZ1oB0uU8ICmxN/otT1FHOlTXIkutaYBXwXz5BaXpsoyl22SA4
 YXjPhMGRpN5sqyqd7Lhh3lJX+5fBcSYdIJHHK4HDLtnL4DihUrwxGzDU+
 IRE4OQJePCPtGu8FmLNeaZsA53Dj4Soi14Rp/JfK0swRNy/4JW4ZADG8f
 R4KEBL4w47jvw/Kx3Z1UshAQNhGk1qdRkUqhkyR0yoLmdiux2laRUgyCx
 ytdOLykFLgCuChp7Z943r4B2Pa88EmbXqYH/WMSgXPqwUYUJL9N4Txh/f w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10199"; a="325611230"
X-IronPort-AV: E=Sophos;i="5.88,209,1635231600"; d="scan'208";a="325611230"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 12:36:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,209,1635231600"; d="scan'208";a="662061279"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
 by fmsmga001.fm.intel.com with ESMTP; 15 Dec 2021 12:36:17 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mxb0a-0002Ic-QY; Wed, 15 Dec 2021 20:36:16 +0000
Date: Thu, 16 Dec 2021 04:35:35 +0800
From: kernel test robot <lkp@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org
Cc: kbuild-all@lists.01.org, linux-renesas-soc@vger.kernel.org,
 Magnus Damm <magnus.damm@gmail.com>,
 Gareth Williams <gareth.williams.jx@renesas.com>,
 Phil Edworthy <phil.edworthy@renesas.com>
Subject: Re: [PATCH v4 2/4] mtd: rawnand: rzn1: Add new NAND controller driver
Message-ID: <202112160417.TvfPZeKJ-lkp@intel.com>
References: <20211215154619.166360-3-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211215154619.166360-3-miquel.raynal@bootlin.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211215_123620_860511_51CAF313 
X-CRM114-Status: GOOD (  14.55  )
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

I love your patch! Yet something to improve:

[auto build test ERROR on mtd/nand/next]
[also build test ERROR on geert-renesas-devel/next mtd/mtd/next mtd/mtd/fixes linus/master v5.16-rc5 next-20211214]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Miquel-Raynal/Renesas-RZ-N1-NAND-controller-support/20211215-234825
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20211216/202112160417.TvfPZeKJ-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/4899a382aebedd2033aba1a8c662767c86c8d74d
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Miquel-Raynal/Renesas-RZ-N1-NAND-controller-support/20211215-234825
        git checkout 4899a382aebedd2033aba1a8c662767c86c8d74d
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=sh SHELL=/bin/bash drivers/mtd/nand/raw/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from drivers/mtd/nand/raw/rzn1-nand-controller.c:14:
>> drivers/mtd/nand/raw/rzn1-nand-controller.c:1408:25: error: 'nandc_id_table' undeclared here (not in a function); did you mean 'rzn1_nandc_id_table'?
    1408 | MODULE_DEVICE_TABLE(of, nandc_id_table);
         |                         ^~~~~~~~~~~~~~
   include/linux/module.h:244:15: note: in definition of macro 'MODULE_DEVICE_TABLE'
     244 | extern typeof(name) __mod_##type##__##name##_device_table               \
         |               ^~~~
>> include/linux/module.h:244:21: error: '__mod_of__nandc_id_table_device_table' aliased to undefined symbol 'nandc_id_table'
     244 | extern typeof(name) __mod_##type##__##name##_device_table               \
         |                     ^~~~~~
   drivers/mtd/nand/raw/rzn1-nand-controller.c:1408:1: note: in expansion of macro 'MODULE_DEVICE_TABLE'
    1408 | MODULE_DEVICE_TABLE(of, nandc_id_table);
         | ^~~~~~~~~~~~~~~~~~~


vim +1408 drivers/mtd/nand/raw/rzn1-nand-controller.c

  1403	
  1404	static const struct of_device_id rzn1_nandc_id_table[] = {
  1405		{ .compatible = "renesas,rzn1-nand-controller" },
  1406		{} /* sentinel */
  1407	};
> 1408	MODULE_DEVICE_TABLE(of, nandc_id_table);
  1409	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
