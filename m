Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5292AC43334
	for <linux-mtd@archiver.kernel.org>; Sun,  5 Jun 2022 23:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RpVTuH1XhRRB9bHz/VR3mlaIDqRKVPdHCZmEi1TFFdg=; b=1g+CtmPQh2Relt
	GuIK37OtwGc3e8NCTfeEXdnFA2JdGIoQURdX17FZ3dNcN9RZCH+pFk0arvUWlcKj7+7JI9lWnm5mu
	CroJvj1mSYiYPCjE1mrAnPKxyW1itEwOyD6E+XR30Co8XKIrXJpVH9B9Ow0ppM6Y9iyDmG3o8tsEm
	WHzphl/8LF/zrpqqrT5xgIdVIujI8IvCHbFQnQybeu4k7IFOnzck38lhOYOFPQ8ir9+t7SLyBXChC
	dOp6PTMJXKq5XQBdXUC4+9fsjzYusTpO9j+zSpKRAjCpoTdeqAYkOJaVE2q7BCANXL1Tzp+zlUKop
	Bsvh9dt5ufkl5+mbio2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxzxw-00Fga9-Vg; Sun, 05 Jun 2022 23:47:29 +0000
Received: from mga03.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxzxt-00FgZf-Ke
	for linux-mtd@lists.infradead.org; Sun, 05 Jun 2022 23:47:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654472845; x=1686008845;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=n/CPBD9mjhSpvD3GBbfLc0rRsVqgVN0gzOX/Kll/qEY=;
  b=m4KHsr1KY52qilqrWH7QkAvQh+d+ooUc5iK+Z0ZshnQncv7+H1W2cLYb
   EfWewPwT5D5FcmHHrPQJssqGHdOP/wFEfDEGuvHd8Dua0ES/wMLVufegU
   4Qcj7k61W0sXAfJp4YgxLaI24iITzITsxDEUINnfRGhCLMRke9RjGO92S
   lQtp52CeXYwVjBWxSo396fPkh5PgUY6EljLA1aJF9vywe4WM11W4VRiPy
   N36YYnl1HUKN/RNrIo9DFKHHGHc0EArz5xStJCDQkkIQ+nFH1gZEY/Bld
   uxvrX6LXpKW7tiRIMz1iQocvT2+B4vbPdqahnWNAHFJ/Uz5gfvxJl/zrw
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10369"; a="276704266"
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; 
   d="scan'208";a="276704266"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2022 16:46:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; 
   d="scan'208";a="708839521"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 05 Jun 2022 16:46:01 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nxzwW-000CKp-IR;
	Sun, 05 Jun 2022 23:46:00 +0000
Date: Mon, 6 Jun 2022 07:45:08 +0800
From: kernel test robot <lkp@intel.com>
To: Md Sadre Alam <quic_mdalam@quicinc.com>, mani@kernel.org,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	quic_srichara@quicinc.com, quic_mdalam@quicinc.com
Subject: Re: [PATCH] mtd: rawnand: qcom: Implement exec_op()
Message-ID: <202206060716.xdJ89V2D-lkp@intel.com>
References: <1654273498-31998-1-git-send-email-quic_mdalam@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1654273498-31998-1-git-send-email-quic_mdalam@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220605_164725_766201_DD7BB7EC 
X-CRM114-Status: GOOD (  12.90  )
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

Hi Md,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on mtd/nand/next]
[also build test WARNING on v5.18 next-20220603]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Md-Sadre-Alam/mtd-rawnand-qcom-Implement-exec_op/20220605-235824
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next
config: arm64-randconfig-r021-20220605 (https://download.01.org/0day-ci/archive/20220606/202206060716.xdJ89V2D-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 416a5080d89066029f9889dc23f94de47c2fa895)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/5ab4409034966f5503f62ef2df59408762a9e872
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Md-Sadre-Alam/mtd-rawnand-qcom-Implement-exec_op/20220605-235824
        git checkout 5ab4409034966f5503f62ef2df59408762a9e872
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/mtd/nand/raw/ drivers/nfc/nfcmrvl/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/mtd/nand/raw/qcom_nandc.c:2727:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
           default:
           ^
   drivers/mtd/nand/raw/qcom_nandc.c:2727:2: note: insert 'break;' to avoid fall-through
           default:
           ^
           break; 
   1 warning generated.


vim +2727 drivers/mtd/nand/raw/qcom_nandc.c

  2691	
  2692	static int qcom_nand_exec_instr(struct nand_chip *chip,
  2693					const struct nand_op_instr *instr)
  2694	{
  2695		struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
  2696		struct qcom_nand_host *host = to_qcom_nand_host(chip);
  2697		u32 status;
  2698		int ret = 0;
  2699		bool wait = false;
  2700		static int opcode;
  2701	
  2702		switch (instr->type) {
  2703		case NAND_OP_CMD_INSTR:
  2704			ret = qcom_nand_send_command(chip, instr->ctx.cmd.opcode);
  2705			if (instr->ctx.cmd.opcode == NAND_CMD_RESET)
  2706				wait = true;
  2707			opcode = instr->ctx.cmd.opcode;
  2708			break;
  2709		case NAND_OP_ADDR_INSTR:
  2710			qcom_nand_send_address(chip, instr, opcode);
  2711			if (opcode != NAND_CMD_READ0 && opcode != NAND_CMD_READSTART &&
  2712			    opcode != NAND_CMD_PARAM && opcode != NAND_CMD_SEQIN)
  2713				wait = true;
  2714			break;
  2715		case NAND_OP_DATA_IN_INSTR:
  2716			qcom_nand_read_buf(chip, instr->ctx.data.buf.in, instr->ctx.data.len);
  2717			break;
  2718		case NAND_OP_DATA_OUT_INSTR:
  2719			wait = false;
  2720			break;
  2721		case NAND_OP_WAITRDY_INSTR:
  2722			ret = readl_poll_timeout(nandc->base + NAND_FLASH_STATUS, status,
  2723						 (status & FS_READY_BSY_N), 20,
  2724						 instr->ctx.waitrdy.timeout_ms * 1000);
  2725			if (opcode == NAND_CMD_PARAM)
  2726				wait = true;
> 2727		default:
  2728			break;
  2729		}
  2730	
  2731		if (wait) {
  2732			if (opcode != NAND_CMD_PARAM)
  2733				write_reg_dma(nandc, NAND_EXEC_CMD, 1, NAND_BAM_NEXT_SGL);
  2734	
  2735			if (opcode == NAND_CMD_READID)
  2736				read_reg_dma(nandc, NAND_READ_ID, 1, NAND_BAM_NEXT_SGL);
  2737	
  2738			if (opcode == NAND_CMD_ERASE1) {
  2739				read_reg_dma(nandc, NAND_FLASH_STATUS, 1, NAND_BAM_NEXT_SGL);
  2740				write_reg_dma(nandc, NAND_FLASH_STATUS, 1, 0);
  2741				write_reg_dma(nandc, NAND_READ_STATUS, 1, NAND_BAM_NEXT_SGL);
  2742			}
  2743	
  2744			ret = submit_descs(nandc);
  2745			if (ret)
  2746				dev_err(nandc->dev, "failure submitting descs for command 0x%02x\n",
  2747					opcode);
  2748	
  2749			free_descs(nandc);
  2750			post_command(host, opcode);
  2751		}
  2752	
  2753		return ret;
  2754	}
  2755	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
