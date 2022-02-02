Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1578DC433FE
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Feb 2022 20:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZMdq+7fUBMYQD0L44FwJ/l+nob+qqvsq0in1INgrt/U=; b=nVtDfJYW7pxMtO
	K+gk+zHJ0jmFeMZaJzvV939OYp6fI+u3rPDe1sTo5551N+Q16k79hZFXFPG6Ki4G05DYVXgwnosst
	VSXAlks+ojuXFITiTrjUYd9a18hAQC9A79A7HKMqWD8oL9Uk7yNq2r/q3sAk1LrXBQqFZ9w8Bt1ko
	LLYS2uwYWtPNXk1Ga9FRJ3dbTybOn0lMXAI8BpOSnS9l+CbLztsIINF9l2FkAIaStuKpnvzZh674Y
	Rw7cOFTke4FMnatKxRnn/lpZT9zTGX0hHDZHFB7n0Le7Q46T32LaeRp/RfZ4c+9Pbi0kcznsbg81L
	DhECqQksrjuoAtwrWxkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFLue-00Glmw-0H; Wed, 02 Feb 2022 20:07:32 +0000
Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFLua-00Glm5-3k
 for linux-mtd@lists.infradead.org; Wed, 02 Feb 2022 20:07:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643832448; x=1675368448;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=zMJkYvzEHpoZwFlSsnpW0On9ckenM6sc8fP13ZFhxYs=;
 b=BCOyLo8gdWYDDlQKyJv412sCRY9kam/2dMNJ9YyJsaz305Zzm3K+lclJ
 vxtepdp/suf9Nx+kN+04SmMrHdSrEgd8KfXdPciaDGctH8MccyIiRH5J0
 lnhQGzFYWrlfNaSe+x8mIQZNH1DMg0TBMPyX9rnViHfgGZzrLQq6ADPi4
 RyFLsagrhrFkU/TwAQn+DVqFy2jBrNSkrBnDVzi7s6Ln7XFJSVxd01zKi
 TGR5YzxfW3lNq51ezjg911ObZZDaTn+1nXDOi6wPzUQINtEA/OusjpqXA
 AAtwWvDz/5pEynm2D+4IWdoO0fxzs9L2uoXltNQIGhznrNeuoJX6VZL2Y g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10246"; a="272499510"
X-IronPort-AV: E=Sophos;i="5.88,337,1635231600"; d="scan'208";a="272499510"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2022 12:07:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,337,1635231600"; d="scan'208";a="480235593"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by orsmga003.jf.intel.com with ESMTP; 02 Feb 2022 12:07:23 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nFLuU-000V40-JG; Wed, 02 Feb 2022 20:07:22 +0000
Date: Thu, 3 Feb 2022 04:07:15 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Michael Walle <michael@walle.cc>
Subject: Re: [PATCH v1 05/14] mtd: spi-nor: xilinx: rename vendor specific
 functions and defines
Message-ID: <202202030313.BlFmGeWH-lkp@intel.com>
References: <20220202145853.4187726-6-michael@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220202145853.4187726-6-michael@walle.cc>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220202_120728_232959_1A7B3350 
X-CRM114-Status: GOOD (  16.98  )
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
config: riscv-randconfig-r042-20220131 (https://download.01.org/0day-ci/archive/20220203/202202030313.BlFmGeWH-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 6b1e844b69f15bb7dffaf9365cd2b355d2eb7579)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/6527d5f32d65d5695ddcc0bcf3ac31928e64a935
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Michael-Walle/mtd-spi-nor-move-vendor-specific-code-into-vendor-modules/20220202-230139
        git checkout 6527d5f32d65d5695ddcc0bcf3ac31928e64a935
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/mtd/spi-nor/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/mtd/spi-nor/xilinx.c:103: warning: expecting prototype for spi_nor_xsr_ready(). Prototype was for xilinx_sr_ready() instead


vim +103 drivers/mtd/spi-nor/xilinx.c

37ccf5a41e1528e Michael Walle 2022-02-02   94  
37ccf5a41e1528e Michael Walle 2022-02-02   95  /**
37ccf5a41e1528e Michael Walle 2022-02-02   96   * spi_nor_xsr_ready() - Query the Status Register of the S3AN flash to see if
37ccf5a41e1528e Michael Walle 2022-02-02   97   * the flash is ready for new commands.
37ccf5a41e1528e Michael Walle 2022-02-02   98   * @nor:	pointer to 'struct spi_nor'.
37ccf5a41e1528e Michael Walle 2022-02-02   99   *
37ccf5a41e1528e Michael Walle 2022-02-02  100   * Return: 1 if ready, 0 if not ready, -errno on errors.
37ccf5a41e1528e Michael Walle 2022-02-02  101   */
6527d5f32d65d56 Michael Walle 2022-02-02  102  static int xilinx_sr_ready(struct spi_nor *nor)
37ccf5a41e1528e Michael Walle 2022-02-02 @103  {
37ccf5a41e1528e Michael Walle 2022-02-02  104  	int ret;
37ccf5a41e1528e Michael Walle 2022-02-02  105  
6527d5f32d65d56 Michael Walle 2022-02-02  106  	ret = xilinx_read_sr(nor, nor->bouncebuf);
37ccf5a41e1528e Michael Walle 2022-02-02  107  	if (ret)
37ccf5a41e1528e Michael Walle 2022-02-02  108  		return ret;
37ccf5a41e1528e Michael Walle 2022-02-02  109  
37ccf5a41e1528e Michael Walle 2022-02-02  110  	return !!(nor->bouncebuf[0] & XSR_RDY);
37ccf5a41e1528e Michael Walle 2022-02-02  111  }
37ccf5a41e1528e Michael Walle 2022-02-02  112  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
