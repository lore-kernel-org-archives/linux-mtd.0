Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B443C0032E
	for <linux-mtd@archiver.kernel.org>; Sun, 22 Oct 2023 08:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LswAD1Z7QESowspjDkTPEBD6MosFiKaawDX+i0QAT14=; b=vz1KrrQhltFdXu
	Tf25xOUMyyhLXl9rnxEaEyjJNK2UBkZrYBbpRKsXdqExsllDg8fGmXP2OEWYNO2HqOiaYIe5aJ9Id
	TB1h5T2Zvyk9DQCY0DVBolaP8m/huMBzxCgciegdGR3jQIrmAGb7+v4EdD5iQKxUeIO1QpFVI9F2b
	MQUbuR0DWlnn3UtqXDQPVQHs8IWs07UUcnXiTH4A2/6J8/qGm/OD4AOXb6a53eUjLJg26iFVl5NLA
	1jxvasTu30wZ6/we6aciBhTOTHO6eVsW0i/jWHjXP0sG/wMYvU7UlsTdA6zzPL5NR/6jyjpA/72r4
	UoQjYHFyn7e1E93OBswQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quTsN-0054ft-37;
	Sun, 22 Oct 2023 08:32:00 +0000
Received: from mgamail.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quTsK-0054fT-2s
	for linux-mtd@lists.infradead.org;
	Sun, 22 Oct 2023 08:31:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697963516; x=1729499516;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=B+LUU+LUPgseHp/T5tWguaCeAhNu1hLovr80ntU32mA=;
  b=Kg4nScdY09yGBy6qDGc7q+rBhyeVkV+ezTGdB8qTIPE2qjCGdcYkM2pN
   eGISZ8nwYGvPhHJzjSro/zqX0QdMuKVnzYYlXmY7j6aVnfg2omPq4qLuU
   z2SmU6nqTCITjYTmZseahUBsycUiKDLwywA39B/j/BpXTtlk/Y1idDosy
   ZRLj2LfChMMOPGNo+5u8RjfcWb9xRqlcmNjxCaKlg6Ori7SVKzWs+RFKY
   pX89yC3cuPamk5L7KxoUa3PGCKiT2TU77WjJrY4aHtQZKzHCGLdTPJJwL
   BQ1oRF2MiiZYSi8R9njpI+pbyiHNRXvJyDS18fbvBzc8S6nyRXXFxMT+v
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="383890153"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="383890153"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2023 01:31:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="734369412"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="734369412"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 22 Oct 2023 01:31:47 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1quTs8-0005jy-2t;
	Sun, 22 Oct 2023 08:31:44 +0000
Date: Sun, 22 Oct 2023 16:31:04 +0800
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
Message-ID: <202310221656.oDdh8ExK-lkp@intel.com>
References: <20231017201417.129872-4-dregan@broadcom.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231017201417.129872-4-dregan@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231022_013156_994092_F706FA3C 
X-CRM114-Status: GOOD (  12.21  )
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
[also build test WARNING on linus/master v6.6-rc6 next-20231020]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/dregan-broadcom-com/mtd-rawnand-NAND-controller-write-protect/20231018-042758
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next
patch link:    https://lore.kernel.org/r/20231017201417.129872-4-dregan%40broadcom.com
patch subject: [PATCH v3 4/4] mtd: rawnand: brcmnand: exec_op implementation
config: i386-buildonly-randconfig-002-20231022 (https://download.01.org/0day-ci/archive/20231022/202310221656.oDdh8ExK-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231022/202310221656.oDdh8ExK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310221656.oDdh8ExK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mtd/nand/raw/brcmnand/brcmnand.c:2393:5: warning: no previous declaration for 'brcmnand_exec_op_is_status' [-Wmissing-declarations]
    int brcmnand_exec_op_is_status(const struct nand_operation *op)
        ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/mtd/nand/raw/brcmnand/brcmnand.c:2404:5: warning: no previous declaration for 'brcmnand_exec_op_is_reset' [-Wmissing-declarations]
    int brcmnand_exec_op_is_reset(const struct nand_operation *op)
        ^~~~~~~~~~~~~~~~~~~~~~~~~


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
