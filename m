Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 397FBC433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 13 May 2022 14:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g75yPoQhB4mrs6wzXBn2fjNBpjPZ9JkNPwT3VxKnzkI=; b=EEjmlLAR+iEVfQ
	CJCW6D16i9vkjgXMmfjJkFZl4RWtVOxTAf111koy2LACL7gj5E9B4JzYOFbe2c8wxKWvEzd7zv5TS
	YbmDCYQqx32GA5C+NXLTk2paZDjQn4AJK4SW0IV5a/3RSAqyrb6EqgdKqmWaXLzdoc/DQ8SlaQEyr
	ohx3ntsVQ50IUHTJcSy56J/RwgtX/4rtJmcyIHC5btuq4epyUGhcZZZSAekM5FbRVbK8H9IsZF/xp
	C7KDRNqMFX7n7b+lwbU10HeGkBh0oALTqC7qD2/caM2/wsQkhocbn+RcfolxbGYuTNbRubE+Nr1hS
	Be1buP/26EFfOku/73SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npWaC-00GVkF-Rb; Fri, 13 May 2022 14:47:56 +0000
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npWa8-00GViO-Td
 for linux-mtd@lists.infradead.org; Fri, 13 May 2022 14:47:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652453272; x=1683989272;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=HbRDZLon2bEfMnJ+egiJaqJDquML3EXNdRnTwZASpHY=;
 b=W2sKSdadY3ZIPV5vSayHY7bzNkI34NLFsKCAZgT+adf8S2peAz89GE6M
 WcxeVryt7IswY5dZhlwC9w1s+4WfvjZ+CfNF+Ter2oOo+4uKEH2XcLUD1
 jFF+LMis0Fd0NqPeBxBhB7craOqIJBKxoB864aDyT6y2YFeL3QuKGzC8/
 x5UeMnL6YWbSpTXKUChKPyrPHLlUsTXGQwhMNzc2wms2jE5e/e7d7Ckon
 v/Ct+A+b5qITmmof4/GSgkzJCk29AgiUPEtYp4Z9/qBQ+xESZatv/X6Xa
 8qpBXiFeIn0pcTidXjcLoTpPwR3yqeLISsXY4BRUMydnZJ1n64IQl/xcM w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10346"; a="330918412"
X-IronPort-AV: E=Sophos;i="5.91,223,1647327600"; d="scan'208";a="330918412"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2022 07:47:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,223,1647327600"; d="scan'208";a="896251999"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
 by fmsmga005.fm.intel.com with ESMTP; 13 May 2022 07:47:48 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1npWa4-000LqE-80;
 Fri, 13 May 2022 14:47:48 +0000
Date: Fri, 13 May 2022 22:47:10 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Walle <michael@walle.cc>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH 5/6] mtd: spi-nor: add generic flash driver
Message-ID: <202205132220.uRTFaqNA-lkp@intel.com>
References: <20220513133520.3945820-6-michael@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220513133520.3945820-6-michael@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220513_074753_038649_5B06E7CC 
X-CRM114-Status: GOOD (  13.76  )
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

Hi Michael,

I love your patch! Perhaps something to improve:

[auto build test WARNING on mtd/spi-nor/next]
[also build test WARNING on next-20220513]
[cannot apply to linux/master linus/master v5.18-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Michael-Walle/mtd-spi-nor-generic-flash-driver/20220513-214238
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git spi-nor/next
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20220513/202205132220.uRTFaqNA-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/d38c0ac1528d85bea65fc5a9e7f61a10dbc051fb
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Michael-Walle/mtd-spi-nor-generic-flash-driver/20220513-214238
        git checkout d38c0ac1528d85bea65fc5a9e7f61a10dbc051fb
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/mtd/spi-nor/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/mtd/spi-nor/sfdp.c:1260: warning: expecting prototype for spi_nor_check_sfdp_header(). Prototype was for spi_nor_check_sfdp_signature() instead


vim +1260 drivers/mtd/spi-nor/sfdp.c

  1249	
  1250	/**
  1251	 * spi_nor_check_sfdp_header() - check for a valid SFDP header
  1252	 * @nor:		pointer to a 'struct spi_nor'
  1253	 *
  1254	 * Used to detect if the flash supports the RDSFDP command as well as the
  1255	 * presence of a valid SFDP table.
  1256	 *
  1257	 * Return: 0 on success, -errno otherwise.
  1258	 */
  1259	int spi_nor_check_sfdp_signature(struct spi_nor *nor)
> 1260	{
  1261		u32 signature;
  1262		int err;
  1263	
  1264		/* Get the SFDP header. */
  1265		err = spi_nor_read_sfdp_dma_unsafe(nor, 0, sizeof(signature),
  1266						   &signature);
  1267		if (err < 0)
  1268			return err;
  1269	
  1270		/* Check the SFDP signature. */
  1271		if (le32_to_cpu(signature) != SFDP_SIGNATURE)
  1272			return -EINVAL;
  1273	
  1274		return 0;
  1275	}
  1276	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
