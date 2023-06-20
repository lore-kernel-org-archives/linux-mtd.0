Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12E4DEB64D7
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Jun 2023 10:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WMXHHsyHVSiiPXb+I5s3hLZuNeMx7opYOvLU4PVdhN4=; b=cDaCLFER+ZMnwO
	LaicjH+JOKztTw5SG9bMiibjlzKiX5LBqEgAgbx/zFBGF2mPzAz92tzWt9HbWfJTBUl+hUK4RnU71
	c+Tj7rXzSaBS6GzMLNNhdOsut+81AzhqR0fE7Nl6EsS2ltRsiSYFWjqAYv9Fp3jXcyH7vxOU3k9J3
	Me0qjY+1U9XyHq1k5hO/CaQH/pEgdeC+nk86xn9xOi2/EtUXWy6/o/VxNd6W3sLRl5VQxl8/mBeqY
	DRgX5nKcFbar4tbUAuNtKsKTK/vvPho76sJFMFCvDS4D3OLxhEy1BrjjALFye/FC2kg4SusSVaYuY
	ovBbbGdnCWLTyFQ0X9aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBYKw-00Ap0W-2H;
	Tue, 20 Jun 2023 10:11:46 +0000
Received: from mga12.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBYKt-00Aozp-0a
	for linux-mtd@lists.infradead.org;
	Tue, 20 Jun 2023 10:11:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687255903; x=1718791903;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=t6aBv/t9yUrGliuBhpX5NCpuckz6oBkr9Qm3pAgcp78=;
  b=O7OtUtAQNKyo54okGWgHEyS7HY0FfLHQm/ttBZn3Mt4NJZNAgd+gT3aw
   DZ9aZ6SitzQv9KZ1/aMi0AaVJ5s9ZHKALPaCB4wIwjAYkNRIIo0ty0kIA
   ppe3IUfm0Mep+ZW5lrEl12WGAGNNJPYUa87i9x/kaTgrsbgny2W6GwElC
   QfOyKVhApI8hW4zWnVZElavAKvcU1P6IBKvmCwK2aXbLXlDIdTE6e50ed
   sBq9vaG4l9nistvGk+ETv1WAD9HwbMw7Alja1e3+St0i/xmG1zcAkiEx8
   0ZwevqxIRotly4UopszR/i6LXRXmQMLaF2yBlfp6MREA3D/LuJRfxPv0I
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="339431025"
X-IronPort-AV: E=Sophos;i="6.00,256,1681196400"; 
   d="scan'208";a="339431025"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2023 03:11:14 -0700
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="748013955"
X-IronPort-AV: E=Sophos;i="6.00,256,1681196400"; 
   d="scan'208";a="748013955"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 20 Jun 2023 03:11:11 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qBYKM-0005nY-20;
	Tue, 20 Jun 2023 10:11:10 +0000
Date: Tue, 20 Jun 2023 18:10:35 +0800
From: kernel test robot <lkp@intel.com>
To: Md Sadre Alam <quic_mdalam@quicinc.com>, mani@kernel.org,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, quic_srichara@quicinc.com,
	quic_mdalam@quicinc.com
Subject: Re: [PATCH v4 1/5] mtd: rawnand: qcom: Implement exec_op()
Message-ID: <202306201734.SmmrhWYJ-lkp@intel.com>
References: <20230615073143.25079-1-quic_mdalam@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230615073143.25079-1-quic_mdalam@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230620_031143_251231_0CEC9B0E 
X-CRM114-Status: GOOD (  13.56  )
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on mtd/nand/next]
[also build test WARNING on linus/master v6.4-rc7 next-20230620]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Md-Sadre-Alam/mtd-rawnand-qcom-Add-support-for-reset-readid-status-exec_op/20230615-153448
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next
patch link:    https://lore.kernel.org/r/20230615073143.25079-1-quic_mdalam%40quicinc.com
patch subject: [PATCH v4 1/5] mtd: rawnand: qcom: Implement exec_op()
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20230620/202306201734.SmmrhWYJ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230620/202306201734.SmmrhWYJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306201734.SmmrhWYJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/mtd/nand/raw/qcom_nandc.c: In function 'qcom_parse_instructions':
>> drivers/mtd/nand/raw/qcom_nandc.c:2944:38: warning: variable 'naddrs' set but not used [-Wunused-but-set-variable]
    2944 |                 unsigned int offset, naddrs;
         |                                      ^~~~~~
   drivers/mtd/nand/raw/qcom_nandc.c: At top level:
   drivers/mtd/nand/raw/qcom_nandc.c:2932:13: warning: 'qcom_parse_instructions' defined but not used [-Wunused-function]
    2932 | static void qcom_parse_instructions(struct nand_chip *chip,
         |             ^~~~~~~~~~~~~~~~~~~~~~~


vim +/naddrs +2944 drivers/mtd/nand/raw/qcom_nandc.c

  2930	
  2931	/* NAND framework ->exec_op() hooks and related helpers */
  2932	static void qcom_parse_instructions(struct nand_chip *chip,
  2933					    const struct nand_subop *subop,
  2934						struct qcom_op *q_op)
  2935	{
  2936		struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
  2937		const struct nand_op_instr *instr = NULL;
  2938		unsigned int op_id;
  2939		int i;
  2940	
  2941		memset(q_op, 0, sizeof(*q_op));
  2942	
  2943		for (op_id = 0; op_id < subop->ninstrs; op_id++) {
> 2944			unsigned int offset, naddrs;
  2945			const u8 *addrs;
  2946	
  2947			instr = &subop->instrs[op_id];
  2948	
  2949			switch (instr->type) {
  2950			case NAND_OP_CMD_INSTR:
  2951				q_op->cmd_reg = qcom_op_cmd_mapping(nandc, instr->ctx.cmd.opcode, q_op);
  2952				q_op->rdy_delay_ns = instr->delay_ns;
  2953				break;
  2954	
  2955			case NAND_OP_ADDR_INSTR:
  2956				offset = nand_subop_get_addr_start_off(subop, op_id);
  2957				naddrs = nand_subop_get_num_addr_cyc(subop, op_id);
  2958				addrs = &instr->ctx.addr.addrs[offset];
  2959				for (i = 0; i < MAX_ADDRESS_CYCLE; i++) {
  2960					if (i < 4)
  2961						q_op->addr1_reg |= (u32)addrs[i] << i * 8;
  2962					else
  2963						q_op->addr2_reg |= addrs[i];
  2964				}
  2965				q_op->rdy_delay_ns = instr->delay_ns;
  2966				break;
  2967	
  2968			case NAND_OP_DATA_IN_INSTR:
  2969				q_op->data_instr = instr;
  2970				q_op->data_instr_idx = op_id;
  2971				q_op->rdy_delay_ns = instr->delay_ns;
  2972				fallthrough;
  2973			case NAND_OP_DATA_OUT_INSTR:
  2974				q_op->rdy_delay_ns = instr->delay_ns;
  2975				break;
  2976	
  2977			case NAND_OP_WAITRDY_INSTR:
  2978				q_op->rdy_timeout_ms = instr->ctx.waitrdy.timeout_ms;
  2979				q_op->rdy_delay_ns = instr->delay_ns;
  2980				break;
  2981			}
  2982		}
  2983	}
  2984	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
