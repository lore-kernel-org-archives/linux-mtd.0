Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 783DEC433F5
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Feb 2022 21:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q7fsPUtznPxQ1LMGre6hL4kVIjtmW4y81mPgvqKL+hY=; b=iYSPSvhxfk7uug
	8+YfgxpwHKThbjaNMIVwQh4B93I12gN/b54KE4ocQmz13iIUWfDirNY4IZSAfVuYBC0Yagot65dbu
	NRUMUa4d9pbaAfnZBL8tB8HkFu4iBAO313OvFNXQF0f70OOhcAJ0O8+I5uOMfm6pyX4X4+NnOPiOl
	FrRSQo0Dtzmg39vWbZbbf0UVQuu+ENtEy6Uirh5wjwGpB41RjahvC4yR9W939lHtaIzJIRM/DyTnj
	uUrex9OjYbUql7n69qAgAVXTNVdyRTuhkAPTLQoYazuJ8N8XebNtwToPmVSED99VT3TSrXgUE5tgZ
	9+qpiVWgE53nGOArHGLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFNVP-00GxhF-6B; Wed, 02 Feb 2022 21:49:35 +0000
Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFNVL-00Gxgi-R4
 for linux-mtd@lists.infradead.org; Wed, 02 Feb 2022 21:49:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643838571; x=1675374571;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=wPkcJWxCJjFTfO/aC4FZRrAGxyrpHdV+HrMlVt033KM=;
 b=RJeMRojGazOXMK/LebMYxR6Ok2ZiuxC70cZQ2iQiGwSwpqPipznZp8ey
 UJksktMtgstm6NJkfGpkuuWemT1C0Wi6iuR7jJ95YX/eXq4ecuojmQsc0
 OMvYoeAZeThffl7r1EsznQQK+Z4hvwz7reW1eEPT9udmScrHRqgSa/MBl
 Blv7SNEcHWNgkW585vCHRx2D+SYymZSYUl+Fdim0C0ADP4YKVOtx1zNKq
 BaTJhfkf2rtv/tzmqKcZAh+zlM2PwnIw5rlKTAlRUyk0l1buH5dOjLt6x
 YodmQZYTPYwtUGIqw1Kjv+OFYqVVeVUaoYA6d1hR8QcpUh9Mt/bGMPdRP w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10246"; a="247979425"
X-IronPort-AV: E=Sophos;i="5.88,337,1635231600"; d="scan'208";a="247979425"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2022 13:49:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,337,1635231600"; d="scan'208";a="480261715"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by orsmga003.jf.intel.com with ESMTP; 02 Feb 2022 13:49:28 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nFNVH-000VAS-Qv; Wed, 02 Feb 2022 21:49:27 +0000
Date: Thu, 3 Feb 2022 05:48:47 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: kbuild-all@lists.01.org, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Michael Walle <michael@walle.cc>
Subject: Re: [PATCH v1 12/14] mtd: spi-nor: move all spansion specifics into
 spansion.c
Message-ID: <202202030556.9u7o7D18-lkp@intel.com>
References: <20220202145853.4187726-13-michael@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220202145853.4187726-13-michael@walle.cc>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220202_134931_965595_15D8DE0D 
X-CRM114-Status: GOOD (  13.22  )
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
[also build test WARNING on linux/master linus/master v5.17-rc2 next-20220202]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Michael-Walle/mtd-spi-nor-move-vendor-specific-code-into-vendor-modules/20220202-230139
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git spi-nor/next
config: x86_64-randconfig-s021 (https://download.01.org/0day-ci/archive/20220203/202202030556.9u7o7D18-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://github.com/0day-ci/linux/commit/01f9808a20c96553c43f929e10f3fb448cd8bd93
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Michael-Walle/mtd-spi-nor-move-vendor-specific-code-into-vendor-modules/20220202-230139
        git checkout 01f9808a20c96553c43f929e10f3fb448cd8bd93
        # save the config file to linux build tree
        mkdir build_dir
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/mtd/spi-nor/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> drivers/mtd/spi-nor/spansion.c:332:5: sparse: sparse: symbol 'spi_nor_sr_ready_and_clear' was not declared. Should it be static?

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
