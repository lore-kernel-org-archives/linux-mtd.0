Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63990C282D1
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Mar 2025 04:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=muCH3oqBu0S7I9huVAyulzBCHNVv+l6ak40sNlLeEgY=; b=UVEEdNCYRqG9Xk
	dOu3xv0dEia/Gg6c8niz/czV34E34o0ZNaADkOy5EIrr5g15OjlegWUb+FzFypsUa3I+I73iiMcUn
	awYpvu3cd+/09huwjauS9uCsxtO4QYm1n8QBSFDYvUwIuAl0f64YeKaAjk/E3PCGDv36GIvJw9pfK
	8l6QX65cNb81mhrXvgrqwePQpUQYiiQ+UK/izedXp1sihp8hgH9n75hsQ94t8d1x1mUNhlJywb7Ac
	Z+1o4SxIo3DgxedbMDoVJcHDrJQufPZX1ou32LW6NKoXZxNEdPKiZS9qQLrUkm3BCi5zGEnzni8LV
	zw+SwKN4MdfMnI6ufatA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq2pk-00000009zAt-3uTn;
	Thu, 06 Mar 2025 04:27:44 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq2o5-00000009z2f-28Rp;
	Thu, 06 Mar 2025 04:26:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741235161; x=1772771161;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NJCVt2+YUa5c5YJ95PV1i2GlvWFyPhsZJ0jvLUACEOY=;
  b=Sr67g3dwGjC7npAIfDwmSLNd5SS0qeikz2HabGSols+FRvcwyxRdaMWG
   nd/gbnJjlD5lqZltbwOTHA+Q0rYuH1Okki/nitHw6uAf7UxqA4E0IY/0I
   +76NJf8lv5HIdrwVij7WcIf1c4dbNPhpghRZh6DI/ssn4SngTNVVQTuHP
   Exkarop9dalnY+t6xQ0QYj7ilX1Uki148ZJmM0zHAFwQuo+/XftPehKLw
   yEHjeIUUwGkrKIGHAuhjGCBiNTsW5LtJ+2ElpLC3NQfol6TI12K3uCEsM
   FoBWQ4wg1OG40ci1cl+CAiotREC2daU2qWj93ysEctx115ekwBB8Z/ppH
   A==;
X-CSE-ConnectionGUID: eGEsYc1DSB6qfMAZzj4ncw==
X-CSE-MsgGUID: 2dcgLPZZTFeA516DTixBCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="46003571"
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; 
   d="scan'208";a="46003571"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 20:25:56 -0800
X-CSE-ConnectionGUID: Wox4vV5jSb64q56XBB+2rg==
X-CSE-MsgGUID: BmO2x536SbCjV5jLKsr7Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; 
   d="scan'208";a="119075926"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 05 Mar 2025 20:25:51 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tq2ns-000MWc-2Z;
	Thu, 06 Mar 2025 04:25:49 +0000
Date: Thu, 6 Mar 2025 12:24:46 +0800
From: kernel test robot <lkp@intel.com>
To: Manikandan Muralidharan <manikandan.m@microchip.com>, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, tudor.ambarus@linaro.org,
	pratyush@kernel.org, mwalle@kernel.org, miquel.raynal@bootlin.com,
	richard@nod.at, vigneshr@ti.com, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, manikandan.m@microchip.com,
	Varshini Rajendran <varshini.rajendran@microchip.com>
Subject: Re: [PATCH 1/2] mtd: spi-nor: sst: register SFDP region into NVMEM
 framework to read MAC Address
Message-ID: <202503061244.wH2sylN8-lkp@intel.com>
References: <20250305100134.1171124-1-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250305100134.1171124-1-manikandan.m@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_202601_632115_138A97AD 
X-CRM114-Status: GOOD (  13.59  )
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

Hi Manikandan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on mtd/spi-nor/next]
[also build test WARNING on robh/for-next abelloni/rtc-next linus/master v6.14-rc5 next-20250305]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Manikandan-Muralidharan/ARM-dts-microchip-sama5d29_curiosity-Add-nvmem-layout-in-QSPI-to-describe-EUI48-MAC-address-region/20250305-180433
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git spi-nor/next
patch link:    https://lore.kernel.org/r/20250305100134.1171124-1-manikandan.m%40microchip.com
patch subject: [PATCH 1/2] mtd: spi-nor: sst: register SFDP region into NVMEM framework to read MAC Address
config: m68k-stmark2_defconfig (https://download.01.org/0day-ci/archive/20250306/202503061244.wH2sylN8-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250306/202503061244.wH2sylN8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503061244.wH2sylN8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mtd/spi-nor/sst.c:75: warning: Function parameter or struct member 'off' not described in 'sst26vf_sfdp_mac_addr_read'
>> drivers/mtd/spi-nor/sst.c:75: warning: Excess function parameter 'offset' description in 'sst26vf_sfdp_mac_addr_read'


vim +75 drivers/mtd/spi-nor/sst.c

    61	
    62	/**
    63	 * sst26vf_sfdp_mac_addr_read() - check if the EUI-48 MAC Address is programmed
    64	 * and read the data from the prestored SFDP data
    65	 *
    66	 * @priv: User context passed to read callbacks.
    67	 * @offset: Offset within the NVMEM device.
    68	 * @val: pointer where to fill the ethernet address
    69	 * @bytes: Length of the NVMEM cell
    70	 *
    71	 * Return: 0 on success, -EINVAL  otherwise.
    72	 */
    73	static int sst26vf_sfdp_mac_addr_read(void *priv, unsigned int off,
    74					      void *val, size_t bytes)
  > 75	{
    76		struct spi_nor *nor = priv;
    77		struct sfdp *sfdp = nor->sfdp;
    78		loff_t offset = off;
    79		size_t sfdp_size;
    80	
    81		/*
    82		 * Check if the EUI-48 MAC address is programmed in the next six address
    83		 * locations.
    84		 * @off is programmed in the DT and stores the start of MAC Address
    85		 * byte, (off - 1) stores the bit length of the Extended Unique
    86		 * Identifier
    87		 */
    88		if (SST26VF_SFDP_EUI48 != *((u8 *)sfdp->dwords + (offset - 1)))
    89			return -EINVAL;
    90	
    91		sfdp_size = sfdp->num_dwords * sizeof(*sfdp->dwords);
    92		memory_read_from_buffer(val, bytes, &offset, sfdp->dwords,
    93					sfdp_size);
    94		return 0;
    95	}
    96	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
