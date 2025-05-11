Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC406C3ABC3
	for <linux-mtd@archiver.kernel.org>; Sun, 11 May 2025 11:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QkpezSJWjpZ/7QSbV9Ha+RLNjZT/6q41J1pKXnH0sNM=; b=s/xw/s3KGzGtmL
	BT8aU6B/zteWypu0mz/EFpeQY8Rh71vQ+veVuKYhjIbgID9bIx0zZCLcImxx3N9aWwrHmoAlcED7a
	bk8kb23cAX2SEwhouOve0lI/6XD0zNyFz5KNjpaUHX5ZYoGRQNg0DkjTCnGzy92FljWJtQmW5ZuuM
	38IDbFKWSwshbKYvTXLOLjsXVhh+1o+ABvkPH476kcL6sNgTNYWeIj5cgDcFAFsIZ10F50UF/2jLa
	6LZpJ9oExXjySQmmsjli+fdVosBSXrt6MgYoOgcJyiDWyBpQ7Sz+uASL2fbvBEGT3bMOT5l/TMtox
	C8vtGNAfm/uv2NwiyzOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE4cl-000000078lF-1TCI;
	Sun, 11 May 2025 11:13:39 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE4cj-000000078kq-1ECJ;
	Sun, 11 May 2025 11:13:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746962017; x=1778498017;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1rAsgwZYIQE6e6R96BL5uR52KMCv8+3yF9wTwCO3IdI=;
  b=UhjUUKWP/iwtAZ4qKI3Gi+3TflP3EjeJ1gKhvrL+IreFhg7hqbqint2m
   hyNSHcc0s9TBs/Cd+vr1vNDJPnHX+jtmQqdCje7D2q0rI78CsmfM9shS3
   axkd/HoAB9cEPgdcS+811+l4VUuaeVYm5vPd+gD7/DHtnOdwnnzrwS1w8
   /A/pmD4F+ptZ7pE0K8lvPYZaIFj8D+2JQGl64lx05q7encGEz0xQ7xnK1
   B7cfjFR1D7rK6O7E17JEgSmB2soWG5xoejtkivCHwzrc+EVdziyg5snfx
   ESJSX9z8zZSBWmiCq+Faeqx0e30aimhTTMd45/zXEzE6Log2DyD1WYm36
   g==;
X-CSE-ConnectionGUID: XK5ecwsyRYOxXMccgBjdKQ==
X-CSE-MsgGUID: x/uX8+RwQfahqyOCu5VkCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11429"; a="47873556"
X-IronPort-AV: E=Sophos;i="6.15,280,1739865600"; 
   d="scan'208";a="47873556"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2025 04:13:37 -0700
X-CSE-ConnectionGUID: kXTEaESAQbGa6BLvEcG9BA==
X-CSE-MsgGUID: cG3jbXnLQ2qq1JMScR/teQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,280,1739865600"; 
   d="scan'208";a="137603556"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 11 May 2025 04:13:34 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uE4cc-000Djb-1r;
	Sun, 11 May 2025 11:13:30 +0000
Date: Sun, 11 May 2025 19:13:00 +0800
From: kernel test robot <lkp@intel.com>
To: Alexey Charkov <alchark@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	Alexey Charkov <alchark@gmail.com>
Subject: Re: [PATCH 2/3] mtd: spi-nor: Add a driver for the VIA/WonderMedia
 serial flash controller
Message-ID: <202505111905.tlinDurh-lkp@intel.com>
References: <20250510-wmt-sflash-v1-2-02a1ac6adf12@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250510-wmt-sflash-v1-2-02a1ac6adf12@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_041337_345494_85517380 
X-CRM114-Status: GOOD (  11.21  )
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

Hi Alexey,

kernel test robot noticed the following build errors:

[auto build test ERROR on ed61cb3d78d585209ec775933078e268544fe9a4]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexey-Charkov/dt-bindings-spi-Add-VIA-WonderMedia-serial-flash-controller/20250511-034459
base:   ed61cb3d78d585209ec775933078e268544fe9a4
patch link:    https://lore.kernel.org/r/20250510-wmt-sflash-v1-2-02a1ac6adf12%40gmail.com
patch subject: [PATCH 2/3] mtd: spi-nor: Add a driver for the VIA/WonderMedia serial flash controller
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250511/202505111905.tlinDurh-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250511/202505111905.tlinDurh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505111905.tlinDurh-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mtd/spi-nor/controllers/wmt-sflash.c: In function 'wmt_sflash_pcmd_mode':
>> drivers/mtd/spi-nor/controllers/wmt-sflash.c:132:16: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
     132 |         reg |= FIELD_PREP(SF_PROG_CMD_MOD, enable);
         |                ^~~~~~~~~~


vim +/FIELD_PREP +132 drivers/mtd/spi-nor/controllers/wmt-sflash.c

   126	
   127	static void wmt_sflash_pcmd_mode(struct wmt_sflash_host *host, bool enable)
   128	{
   129		u32 reg = readl(host->regbase + SF_SPI_INTF_CFG);
   130	
   131		reg &= ~SF_PROG_CMD_MOD;
 > 132		reg |= FIELD_PREP(SF_PROG_CMD_MOD, enable);
   133		writel(reg, host->regbase + SF_SPI_INTF_CFG);
   134	}
   135	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
