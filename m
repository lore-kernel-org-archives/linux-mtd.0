Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDA31C77B61
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Apr 2023 07:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uxbngHtPsy/WSuvbWuU1KUPwuWzArH/LtEdMCJJreyg=; b=pUIOAyZaRHAHvQ
	tjXY/Vxb9Ba9CeG6CAfbzikJ4b68aqXNn8JNGuhZjshdx4Ie9heoFWuC/e34zzWU+ilxnawUaf8fs
	yYV76WItpG909x2WinUZjh7GrzzxgXiI4pxG6NxxpSbo0eu+uaes1nVAQRzp+bV2lqLNZ19hnHkFu
	pn74N5pue+ILWXbSmAFNOZjXhUFmR+gnG/tb47D6sKTqIzgyJ5CyKuZajQBjQ7ROBIlXoCvjI+P5H
	yTCRQXEaTHJona9b6cxyJsOaWtbE1aEhe4kWdaVw7Wo2JkMeJ4LeqQtf+Bbd1b38ny2CScuOWbwty
	RYwc6UE7Zhc63GhSNSBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pqqjn-00Fah7-0y;
	Mon, 24 Apr 2023 07:35:51 +0000
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pqqjk-00Fafk-0a
	for linux-mtd@lists.infradead.org;
	Mon, 24 Apr 2023 07:35:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682321748; x=1713857748;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1AZevgGbr+OhBwy7Vz/7+7ZqgeucWBUr7uEJu+d9I1k=;
  b=B1++P+GsWLlcWqO4fVC9lAhKywnR48BjKqo3PsiFisPdQA5ObDxMA1W1
   gvb/uxwrj8jRjVFAx4IfuKxT08oGhlKGvcQ685MQT1oPC14jsbwXfvaYq
   v4rwRxDDQ1e24H6BrIZJy31SM2M9vz2d4qboUm1hRYqVkG8aLuWhINIWy
   EGsSi/yJptN/rpCkHJg4hjvmy6iF6o67kbrMW7upBMg/AdGpMAmorW9rB
   NHB+/2I2r+VpMFqOGu5q2y9AO2y0Eo5pKJ8zMPUtpGiYopRQllEiWU3w/
   UOre3IxElFo6BpbQhfQuhVPSgx+lFn6aHieLlHqpapzFWKHvqn5f7IqB5
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="409318152"
X-IronPort-AV: E=Sophos;i="5.99,222,1677571200"; 
   d="scan'208";a="409318152"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2023 00:35:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="836859965"
X-IronPort-AV: E=Sophos;i="5.99,222,1677571200"; 
   d="scan'208";a="836859965"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 24 Apr 2023 00:35:42 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pqqjd-000iJs-1a;
	Mon, 24 Apr 2023 07:35:41 +0000
Date: Mon, 24 Apr 2023 15:35:35 +0800
From: kernel test robot <lkp@intel.com>
To: Md Sadre Alam <quic_mdalam@quicinc.com>, mani@kernel.org,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, quic_srichara@quicinc.com,
	quic_mdalam@quicinc.com
Subject: Re: [PATCH V2] mtd: rawnand: qcom: Implement exec_op()
Message-ID: <202304241556.fafzkLLk-lkp@intel.com>
References: <20230419093617.27134-1-quic_mdalam@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230419093617.27134-1-quic_mdalam@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230424_003548_258845_0513F562 
X-CRM114-Status: GOOD (  11.35  )
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
[also build test WARNING on linus/master v6.3 next-20230421]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Md-Sadre-Alam/mtd-rawnand-qcom-Implement-exec_op/20230419-173849
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next
patch link:    https://lore.kernel.org/r/20230419093617.27134-1-quic_mdalam%40quicinc.com
patch subject: [PATCH V2] mtd: rawnand: qcom: Implement exec_op()
config: nios2-randconfig-m041-20230423 (https://download.01.org/0day-ci/archive/20230424/202304241556.fafzkLLk-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304241556.fafzkLLk-lkp@intel.com/

smatch warnings:
drivers/mtd/nand/raw/qcom_nandc.c:2751 qcom_read_status_exec() warn: inconsistent indenting

vim +2751 drivers/mtd/nand/raw/qcom_nandc.c

  2708	
  2709	static int qcom_read_status_exec(struct nand_chip *chip,
  2710					 const struct nand_subop *subop)
  2711	{
  2712		struct qcom_nand_host *host = to_qcom_nand_host(chip);
  2713		struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
  2714		struct nand_ecc_ctrl *ecc = &chip->ecc;
  2715		struct qcom_op q_op;
  2716		const struct nand_op_instr *instr = NULL;
  2717		unsigned int op_id = 0;
  2718		unsigned int len = 0;
  2719		int ret = 0, num_cw = 1, i;
  2720		u32 flash_status;
  2721	
  2722		host->status = NAND_STATUS_READY | NAND_STATUS_WP;
  2723	
  2724		qcom_parse_instructions(chip, subop, &q_op);
  2725	
  2726		if (nandc->exec_opwrite) {
  2727			num_cw = ecc->steps;
  2728			nandc->exec_opwrite = false;
  2729		}
  2730	
  2731		pre_command(host, NAND_CMD_STATUS);
  2732	
  2733		nandc_set_reg(chip, NAND_FLASH_CMD, q_op.cmd_reg);
  2734		nandc_set_reg(chip, NAND_EXEC_CMD, 1);
  2735	
  2736		write_reg_dma(nandc, NAND_FLASH_CMD, 1, NAND_BAM_NEXT_SGL);
  2737		write_reg_dma(nandc, NAND_EXEC_CMD, 1, NAND_BAM_NEXT_SGL);
  2738	
  2739		read_reg_dma(nandc, NAND_FLASH_STATUS, 1, NAND_BAM_NEXT_SGL);
  2740	
  2741		ret = submit_descs(nandc);
  2742		if (ret)
  2743			dev_err(nandc->dev, "failure in sbumitting status descriptor\n");
  2744	
  2745		free_descs(nandc);
  2746	
  2747		nandc_read_buffer_sync(nandc, true);
  2748		for (i = 0; i < num_cw; i++) {
  2749			flash_status = le32_to_cpu(nandc->reg_read_buf[i]);
  2750	
> 2751		if (flash_status & FS_MPU_ERR)
  2752			host->status &= ~NAND_STATUS_WP;
  2753	
  2754		if (flash_status & FS_OP_ERR || (i == (num_cw - 1) &&
  2755						 (flash_status & FS_DEVICE_STS_ERR)))
  2756			host->status |= NAND_STATUS_FAIL;
  2757		}
  2758	
  2759		flash_status = host->status;
  2760	
  2761		instr = q_op.data_instr;
  2762		op_id = q_op.data_instr_idx;
  2763		len = nand_subop_get_data_len(subop, op_id);
  2764		memcpy(instr->ctx.data.buf.in, &flash_status, len);
  2765	
  2766		return ret;
  2767	}
  2768	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
