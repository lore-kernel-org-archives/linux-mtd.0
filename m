Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FEDFC36010
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Apr 2025 05:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jf2d6eT/TUFX1p5nKdgXPZ++Q1BysN3tE9ddCOOJCng=; b=MmUF7OXIzBQSF2
	x3nU2tDCvbDfgnEM0oZWLWQtQQJpKNfMrGfOpU4xtkZD3I38JgaWkK7nlWFLTPfPhwg0UAzZOGnwH
	H4qMsDLsMsGN2RzvpT/DddqoCMhaj2v2w+pGW3SDyExrd3BEC0xeO4vz4YwTHnxt4jI1lxLQjA/EL
	hxxY0dFfPiLCNopHbrrlQnyi9K/uUAfCUsZXCqGKK5Qv0CoUi4f8/awWjbUMy+LhTPA95Wytqn54o
	BoROK08jgB6QpOo+oOwlfQnQXqB89N4d6MqM6VB5zfwnzikEfaxPndMguCmVr3M9tV0I8tVLRohde
	ZQim1Q+V67LGIfc8fW4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1fMi-0000000GUs7-0LhA;
	Mon, 07 Apr 2025 05:49:48 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1fMf-0000000GUrc-0V02
	for linux-mtd@lists.infradead.org;
	Mon, 07 Apr 2025 05:49:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744004985; x=1775540985;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+FuZ4lXffAc4LJv48Whc6SuLpxUH2pc87Bs1zC2YhxU=;
  b=HeT7lEbZbFCx2/Nx1xkbdZgt2x1Gu22cmykx0q1XlAwmUFZa90zNDlTm
   mDRRGpBx0z0/zebh7aDphMYM1cB7gjUoAGei/9GS/gquAxrkq9/zNPPNd
   0SaQHbDvVQ1UhLZ9yPu0Ju+8mbxze1uW5iXPZ3PSDHCfhmSAbkyfJLp5E
   G+4V8FQ1WDAbhM+THAxp7dxZrdLoz+NBxWO/AaOrXM3aPbc9wpOC6TaHW
   PkEnChLcSYTVm1orzVmo/xaH7Ol3Xp02U/7tQO92uqDH5NalfZMyvDf8y
   QPdrwoSWgxZzaS3Wns2Frf3kU1leEv7Y+gwUm/rjfvUxGUImsbRnl2F+d
   Q==;
X-CSE-ConnectionGUID: zg2pHpceSY+WZGNRs48LfQ==
X-CSE-MsgGUID: 0QxlbW2ZSbqAsFkE5Q4e7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="56741277"
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="56741277"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2025 22:49:44 -0700
X-CSE-ConnectionGUID: oxpQGkiUSNmubfhycnIP7A==
X-CSE-MsgGUID: f2t+c7CFRi+XVxpyWiuDlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="151043199"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 06 Apr 2025 22:49:42 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u1fMZ-00031b-32;
	Mon, 07 Apr 2025 05:49:39 +0000
Date: Mon, 7 Apr 2025 13:49:17 +0800
From: kernel test robot <lkp@intel.com>
To: Wentao Liang <vulab@iscas.ac.cn>, miquel.raynal@bootlin.com,
	richard@nod.at, vigneshr@ti.com
Cc: oe-kbuild-all@lists.linux.dev, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, Wentao Liang <vulab@iscas.ac.cn>
Subject: Re: [PATCH] mtd: nand: Add error log for marvell_nfc_end_cmd()
Message-ID: <202504071218.tZSv0K1o-lkp@intel.com>
References: <20250407020917.1242-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250407020917.1242-1-vulab@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_224945_200000_E26EAE3D 
X-CRM114-Status: GOOD (  19.02  )
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

Hi Wentao,

kernel test robot noticed the following build errors:

[auto build test ERROR on mtd/nand/next]
[also build test ERROR on linus/master v6.15-rc1 next-20250407]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wentao-Liang/mtd-nand-Add-error-log-for-marvell_nfc_end_cmd/20250407-101213
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next
patch link:    https://lore.kernel.org/r/20250407020917.1242-1-vulab%40iscas.ac.cn
patch subject: [PATCH] mtd: nand: Add error log for marvell_nfc_end_cmd()
config: arm64-randconfig-003-20250407 (https://download.01.org/0day-ci/archive/20250407/202504071218.tZSv0K1o-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250407/202504071218.tZSv0K1o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504071218.tZSv0K1o-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mtd/nand/raw/marvell_nand.c: In function 'marvell_nfc_hw_ecc_bch_read_chunk':
>> drivers/mtd/nand/raw/marvell_nand.c:1354:3: error: 'err' undeclared (first use in this function)
      err = marvell_nfc_end_cmd(chip, NDSR_RDDREQ,
      ^~~
   drivers/mtd/nand/raw/marvell_nand.c:1354:3: note: each undeclared identifier is reported only once for each function it appears in


vim +/err +1354 drivers/mtd/nand/raw/marvell_nand.c

  1302	
  1303	static void marvell_nfc_hw_ecc_bch_read_chunk(struct nand_chip *chip, int chunk,
  1304						      u8 *data, unsigned int data_len,
  1305						      u8 *spare, unsigned int spare_len,
  1306						      int page)
  1307	{
  1308		struct marvell_nand_chip *marvell_nand = to_marvell_nand(chip);
  1309		struct marvell_nfc *nfc = to_marvell_nfc(chip->controller);
  1310		const struct marvell_hw_ecc_layout *lt = to_marvell_nand(chip)->layout;
  1311		int i, ret;
  1312		struct marvell_nfc_op nfc_op = {
  1313			.ndcb[0] = NDCB0_CMD_TYPE(TYPE_READ) |
  1314				   NDCB0_ADDR_CYC(marvell_nand->addr_cyc) |
  1315				   NDCB0_LEN_OVRD,
  1316			.ndcb[1] = NDCB1_ADDRS_PAGE(page),
  1317			.ndcb[2] = NDCB2_ADDR5_PAGE(page),
  1318			.ndcb[3] = data_len + spare_len,
  1319		};
  1320	
  1321		ret = marvell_nfc_prepare_cmd(chip);
  1322		if (ret)
  1323			return;
  1324	
  1325		if (chunk == 0)
  1326			nfc_op.ndcb[0] |= NDCB0_DBC |
  1327					  NDCB0_CMD1(NAND_CMD_READ0) |
  1328					  NDCB0_CMD2(NAND_CMD_READSTART);
  1329	
  1330		/*
  1331		 * Trigger the monolithic read on the first chunk, then naked read on
  1332		 * intermediate chunks and finally a last naked read on the last chunk.
  1333		 */
  1334		if (chunk == 0)
  1335			nfc_op.ndcb[0] |= NDCB0_CMD_XTYPE(XTYPE_MONOLITHIC_RW);
  1336		else if (chunk < lt->nchunks - 1)
  1337			nfc_op.ndcb[0] |= NDCB0_CMD_XTYPE(XTYPE_NAKED_RW);
  1338		else
  1339			nfc_op.ndcb[0] |= NDCB0_CMD_XTYPE(XTYPE_LAST_NAKED_RW);
  1340	
  1341		marvell_nfc_send_cmd(chip, &nfc_op);
  1342	
  1343		/*
  1344		 * According to the datasheet, when reading from NDDB
  1345		 * with BCH enabled, after each 32 bytes reads, we
  1346		 * have to make sure that the NDSR.RDDREQ bit is set.
  1347		 *
  1348		 * Drain the FIFO, 8 32-bit reads at a time, and skip
  1349		 * the polling on the last read.
  1350		 *
  1351		 * Length is a multiple of 32 bytes, hence it is a multiple of 8 too.
  1352		 */
  1353		for (i = 0; i < data_len; i += FIFO_DEPTH * BCH_SEQ_READS) {
> 1354			err = marvell_nfc_end_cmd(chip, NDSR_RDDREQ,
  1355						  "RDDREQ while draining FIFO (data)");
  1356			if (err)
  1357				dev_err(nfc->dev, "Fail to confirm the NDSR.RDDREQ");
  1358			marvell_nfc_xfer_data_in_pio(nfc, data,
  1359						     FIFO_DEPTH * BCH_SEQ_READS);
  1360			data += FIFO_DEPTH * BCH_SEQ_READS;
  1361		}
  1362	
  1363		for (i = 0; i < spare_len; i += FIFO_DEPTH * BCH_SEQ_READS) {
  1364			err = marvell_nfc_end_cmd(chip, NDSR_RDDREQ,
  1365						  "RDDREQ while draining FIFO (OOB)");
  1366			if (err)
  1367				dev_err(nfc->dev, "Fail to confirm the NDSR.RDDREQ");
  1368			marvell_nfc_xfer_data_in_pio(nfc, spare,
  1369						     FIFO_DEPTH * BCH_SEQ_READS);
  1370			spare += FIFO_DEPTH * BCH_SEQ_READS;
  1371		}
  1372	}
  1373	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
