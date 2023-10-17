Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C77FCDB474
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Oct 2023 21:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lX90GjcGyl1qcIKQqef0n91iCumWyoMqsLON3vyYY1g=; b=vVc06wTzBFZjfi
	IR8rA5Qsevyxa8AyWldMU32w2Kjqnj73Ko5++G/eDAXFKsIXfm5vA7bMEg1ITbntrgM2JOxDYCP/5
	byeECJlsBUd8VO04Bg+ak73LTmu73zkLVM9aevhZcyILh7jBD3OkFtfrsG044MjaDJI66xZS48/Zh
	isBy9ey8fEjPJ1/wrye1S5dRuRhXr8PKs1Mf5fkgOCdFSZ0amI9BfoApRP6lDcyDJmkDkidW8iOxa
	Ruut1a0oLvAC8kMm6a1H+Nks9/1HelWCNYb9xzSOjkDuprEy05M7FJk9h3W6TeFcsbPFUhwe+arIR
	u6/gXdNyiCRPhPkxmwtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsrxi-00DKIE-1J;
	Tue, 17 Oct 2023 21:50:50 +0000
Received: from mgamail.intel.com ([192.55.52.88])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsrxe-00DKHU-2J
	for linux-mtd@lists.infradead.org;
	Tue, 17 Oct 2023 21:50:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697579446; x=1729115446;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hUOW2jdFFCD231zLnFnj1kgtb5ru8K9Mpcdi+Gs/Tzs=;
  b=N9GAWDPEWbuTXPjKicXaoYQUcB5Frbev5ks1vqhsoR0Dwy/222tjqZXY
   fIlfgDkugJVfS5dGl7HeAcG8hDg5neZYhzR89JE0vo1BrdqH0u+SAApMG
   H38GQ39jycd3QaxKR9hyFvrucOFOycV8iDOdsNRvnp0GMyheL1XSmuq2f
   v0/vmVniyYA3M9byUbcEvW4ofuWTWKOI23xOchl37wrFXXiIKQOZ+wqUU
   ek8kdzBOy2tFKkjM2lwbmf3syxw/5qGFFy1n+XSD683wHSssseho4dgRf
   bhFgMDP9slMArDptsAT1ZCLyU2tlV6KpQwCqy4J4+YSutaspHCj8N9k0m
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="416985500"
X-IronPort-AV: E=Sophos;i="6.03,233,1694761200"; 
   d="scan'208";a="416985500"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 14:50:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="872757749"
X-IronPort-AV: E=Sophos;i="6.03,233,1694761200"; 
   d="scan'208";a="872757749"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 17 Oct 2023 14:50:35 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsrxQ-000A7r-2K;
	Tue, 17 Oct 2023 21:50:32 +0000
Date: Wed, 18 Oct 2023 05:49:42 +0800
From: kernel test robot <lkp@intel.com>
To: dregan@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
	linux-mtd@lists.infradead.org, f.fainelli@gmail.com,
	rafal@milecki.pl, joel.peshkin@broadcom.com,
	computersforpeace@gmail.com, dan.beygelman@broadcom.com,
	william.zhang@broadcom.com, frieder.schrempf@kontron.de,
	linux-kernel@vger.kernel.org, vigneshr@ti.com, richard@nod.at,
	bbrezillon@kernel.org, kdasu.kdev@gmail.com,
	JaimeLiao <jaimeliao.tw@gmail.com>,
	Arseniy Krasnov <AVKrasnov@sberdevices.ru>,
	Adam Borowski <kilobyte@angband.pl>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 4/4] mtd: rawnand: brcmnand: exec_op implementation
Message-ID: <202310180553.Zfa2ryoa-lkp@intel.com>
References: <20231017201417.129872-4-dregan@broadcom.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231017201417.129872-4-dregan@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_145046_799943_3ED186B3 
X-CRM114-Status: GOOD (  14.32  )
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

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on mtd/nand/next]
[also build test WARNING on linus/master v6.6-rc6 next-20231017]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/dregan-broadcom-com/mtd-rawnand-NAND-controller-write-protect/20231018-042758
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next
patch link:    https://lore.kernel.org/r/20231017201417.129872-4-dregan%40broadcom.com
patch subject: [PATCH v3 4/4] mtd: rawnand: brcmnand: exec_op implementation
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231018/202310180553.Zfa2ryoa-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231018/202310180553.Zfa2ryoa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310180553.Zfa2ryoa-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mtd/nand/raw/brcmnand/brcmnand.c:2393:5: warning: no previous prototype for 'brcmnand_exec_op_is_status' [-Wmissing-prototypes]
    2393 | int brcmnand_exec_op_is_status(const struct nand_operation *op)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/mtd/nand/raw/brcmnand/brcmnand.c:2404:5: warning: no previous prototype for 'brcmnand_exec_op_is_reset' [-Wmissing-prototypes]
    2404 | int brcmnand_exec_op_is_reset(const struct nand_operation *op)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/brcmnand_exec_op_is_status +2393 drivers/mtd/nand/raw/brcmnand/brcmnand.c

  2392	
> 2393	int brcmnand_exec_op_is_status(const struct nand_operation *op)
  2394	{
  2395		if ((op->ninstrs == 2) &&
  2396			(op->instrs[0].type == NAND_OP_CMD_INSTR) &&
  2397			(op->instrs[0].ctx.cmd.opcode == NAND_CMD_STATUS) &&
  2398			(op->instrs[1].type == NAND_OP_DATA_IN_INSTR))
  2399			return 1;
  2400	
  2401		return 0;
  2402	}
  2403	
> 2404	int brcmnand_exec_op_is_reset(const struct nand_operation *op)
  2405	{
  2406		if ((op->ninstrs == 1) &&
  2407			(op->instrs[0].type == NAND_OP_CMD_INSTR) &&
  2408			(op->instrs[0].ctx.cmd.opcode == NAND_CMD_RESET))
  2409			return 1;
  2410	
  2411		return 0;
  2412	}
  2413	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
