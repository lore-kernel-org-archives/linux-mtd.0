Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 919EDC43334
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jun 2022 14:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DggpHACqb1lreiMS1fHGleDw9XLtepKUQm9lQE4zKYA=; b=36GEQwq9TcckDh
	Np+ZDfY5vBxGsMU8zNJSmTDigZi66LjLLbwrU97TjbAiYF5Y4ZI3UqYn28nXZ0CTnYrx92i9xMXdF
	155W551ApI0olcUcDQBkCfVeqO1Hmxe3wHeafT3Uj5be2X4LcMIaoS2T5uvXs608r42l6Uad8j6lV
	mYaIWqm8wOIU6pHDpweqaTmN/KCAWt2QXkSjErGR15tG59ellCuUorZ9MlOK0b8EWfsaZfQ4jKvFe
	RvlOuYGSHx7gW1yIyMTsOQ4jNmdj/gCfYyxvE2uo3j8mychMxCPw2LDTJ6i+onKCagJY2ZGcJT1B7
	V+gSTyCsLoECVrTflCwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0l3q-004CUz-JH; Mon, 13 Jun 2022 14:28:58 +0000
Received: from mga04.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0l3m-004CTj-Qk
	for linux-mtd@lists.infradead.org; Mon, 13 Jun 2022 14:28:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655130534; x=1686666534;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yo6oWuP1uRTaNxH2baN81HXr0Uua9EFGTDjlZt3dMu8=;
  b=MSDB1Bk7QSdEzskC2t+jrRbz+jzSerpipisIggorOfJB8p/NhEAQNu0F
   vpmf8j3NUBFkBFwugwoG3xnYZvW6QothzhUobOe9X1jfyWZTgLu2364lm
   mBKN9/rFdPaTmOp+0PicaTZ6UjWnaKN0kQZ0+Rd3k1W6naiv9PvOm1DgA
   XNcpjv0jX33PIJOBRwa0SMcMcShTW5+MzqGNDVy4JMr0hd2hY/qQcS6bB
   LtqnccgV6tANdBjXaaaGVsbaTCwmDcvU8H+CNsYORo9iP725EOqJYNVfC
   yEe+duO0cw4w8MHzulv3Oi5XA2rcELm1ImMDh6sxNTZLhWdDb2jXmOjBT
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10377"; a="277076442"
X-IronPort-AV: E=Sophos;i="5.91,297,1647327600"; 
   d="scan'208";a="277076442"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2022 07:28:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,297,1647327600"; 
   d="scan'208";a="611801842"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 13 Jun 2022 07:28:49 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o0l3g-000Ks1-MG;
	Mon, 13 Jun 2022 14:28:48 +0000
Date: Mon, 13 Jun 2022 22:28:39 +0800
From: kernel test robot <lkp@intel.com>
To: Ansuel Smith <ansuelsmth@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Ansuel Smith <ansuelsmth@gmail.com>
Subject: Re: [PATCH v5 1/3] mtd: nand: raw: qcom_nandc: add support for
 unprotected spare data pages
Message-ID: <202206132205.G3tGFPx7-lkp@intel.com>
References: <20220608001030.18813-2-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220608001030.18813-2-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220613_072854_934055_382B8C30 
X-CRM114-Status: GOOD (  15.63  )
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

Hi Ansuel,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on mtd/nand/next]
[also build test WARNING on mtd/mtd/next mtd/mtd/fixes robh/for-next v5.19-rc2 next-20220610]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Ansuel-Smith/Add-support-for-unprotected-spare-data-page/20220608-104834
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next
config: hexagon-randconfig-r041-20220613 (https://download.01.org/0day-ci/archive/20220613/202206132205.G3tGFPx7-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d378268ead93c85803c270277f0243737b536ae7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/5f9263b88e99a6cae44be5e737cb0928ee420e87
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Ansuel-Smith/Add-support-for-unprotected-spare-data-page/20220608-104834
        git checkout 5f9263b88e99a6cae44be5e737cb0928ee420e87
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/mtd/nand/raw/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/mtd/nand/raw/qcom_nandc.c:3020:10: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
                   return ret;
                          ^~~
   drivers/mtd/nand/raw/qcom_nandc.c:3009:33: note: initialize the variable 'ret' to silence this warning
           int partitions_count, i, j, ret;
                                          ^
                                           = 0
   1 warning generated.


vim +/ret +3020 drivers/mtd/nand/raw/qcom_nandc.c

  3000	
  3001	static int qcom_nand_host_parse_boot_partitions(struct qcom_nand_controller *nandc,
  3002							struct qcom_nand_host *host,
  3003							struct device_node *dn)
  3004	{
  3005		struct nand_chip *chip = &host->chip;
  3006		struct mtd_info *mtd = nand_to_mtd(chip);
  3007		struct qcom_nand_boot_partition *boot_partition;
  3008		struct device *dev = nandc->dev;
  3009		int partitions_count, i, j, ret;
  3010	
  3011		if (!nandc->props->use_codeword_fixup)
  3012			return 0;
  3013	
  3014		if (!of_find_property(dn, "qcom,boot-partitions", NULL))
  3015			return 0;
  3016	
  3017		partitions_count = of_property_count_u32_elems(dn, "qcom,boot-partitions");
  3018		if (partitions_count < 0) {
  3019			dev_err(dev, "Error parsing boot partition.");
> 3020			return ret;
  3021		}
  3022	
  3023		host->nr_boot_partitions = partitions_count / 2;
  3024		host->boot_partitions = devm_kcalloc(dev, host->nr_boot_partitions,
  3025						     sizeof(*host->boot_partitions), GFP_KERNEL);
  3026		if (!host->boot_partitions)
  3027			return -ENOMEM;
  3028	
  3029		for (i = 0, j = 0; i < host->nr_boot_partitions; i++, j += 2) {
  3030			boot_partition = &host->boot_partitions[i];
  3031	
  3032			ret = of_property_read_u32_index(dn, "qcom,boot-partitions", j,
  3033							 &boot_partition->page_offset);
  3034			if (ret) {
  3035				dev_err(dev, "Error parsing boot partition offset at index %d", i);
  3036				return ret;
  3037			}
  3038	
  3039			if (boot_partition->page_offset % mtd->writesize) {
  3040				dev_err(dev, "Boot partition offset not multiple of writesize at index %i",
  3041					i);
  3042				return -EINVAL;
  3043			}
  3044			/* Convert offset to nand pages */
  3045			boot_partition->page_offset /= mtd->writesize;
  3046	
  3047			ret = of_property_read_u32_index(dn, "qcom,boot-partitions", j + 1,
  3048							 &boot_partition->page_size);
  3049			if (ret) {
  3050				dev_err(dev, "Error parsing boot partition size at index %d", i);
  3051				return ret;
  3052			}
  3053	
  3054			if (boot_partition->page_size % mtd->writesize) {
  3055				dev_err(dev, "Boot partition size not multiple of writesize at index %i",
  3056					i);
  3057				return -EINVAL;
  3058			}
  3059			/* Convert size to nand pages */
  3060			boot_partition->page_size /= mtd->writesize;
  3061		}
  3062	
  3063		return 0;
  3064	}
  3065	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
