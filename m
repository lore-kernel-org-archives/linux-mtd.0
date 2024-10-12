Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A8E2CF2572
	for <linux-mtd@archiver.kernel.org>; Sat, 12 Oct 2024 18:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OpigMKzVyD0/TwbXfmU8NaEfEPdoXH9VrENnva7E93s=; b=XehUoCrQujA2fs
	kw+Hb7h3U2/JvH5nbs0asf2e+XxzJ9BcMjxPCi8LH/oLjl3koBqfG4UuZ9JtxcnA4poJLHPGmXgiM
	cUM5uREH+AOR/dre19XvWcKmZsx9KxxeTyuMXna28bQ/r8WxMjXXukNe5lE5cJYhjZlgqjjx3E4Zn
	4nOJ8uas8yOx0OgQ+BN6rZJzNeFX1llLMxIlOC9gTLXFYPh/mfjLrSDiC+tfYgvS4X1Zvr71r1xDW
	odXoLFHJnKcDW77kq/ib05zD5jlBUp2erRXtSgbvpdvQgnhlNpVFjUdl9j/9U+Os/UY7QGH/Bo8Dg
	w4pq2A44iBOM5J/e7yBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szgPi-00000001bU3-3vdv;
	Sat, 12 Oct 2024 18:00:26 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szgPf-00000001bT5-2Fyf
	for linux-mtd@lists.infradead.org;
	Sat, 12 Oct 2024 18:00:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728756024; x=1760292024;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=QZbghKMG5mddRcnYL0oUUjDtFdAbMtMB+WmbxAp1KO4=;
  b=jvkzbq+M+n1cPQmMnVwu4pQvDLFpl1Zcpisj9rcuMXCdYVtx244ufqb2
   HF8cXKktFKGl1cpk6xfYYoABvqZWR0UjWkwd0EmwXLFpT2k43vDCYBKKJ
   KcYa9Dfhe8/spMBrQsHSgcR9+b8v+AXWmM10qWHDMitE8GbWScvlHrZyS
   QFQqi66/QupT+kUZFZFT/S8+D9IZNfVX8PPkM3eIT1b+i0w7gyQDRspP5
   8ie0P4FxjactRVZuY9lHJR+FdWcJ17R4ZCNTbMu3UMTRilUUpdYXzxRB8
   pSMVPOdSsS6i6OUxR20gJ1/mBO/q8VzY4yd/g0fmQtk4YXFNTLwFPySQY
   w==;
X-CSE-ConnectionGUID: U0XYt0KsQNa547bPRpCgyg==
X-CSE-MsgGUID: 8zFXP3JwSG2TtATlfey5Gw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28315441"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28315441"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2024 11:00:18 -0700
X-CSE-ConnectionGUID: 2TXqMIK5QayDULncJRh8vA==
X-CSE-MsgGUID: 9KGUO9srSdGv0XhB8YEqRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="81974009"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 12 Oct 2024 10:58:12 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szgNV-000DaJ-2b;
	Sat, 12 Oct 2024 17:58:09 +0000
Date: Sun, 13 Oct 2024 01:57:12 +0800
From: kernel test robot <lkp@intel.com>
To: Md Sadre Alam <quic_mdalam@quicinc.com>, broonie@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	andersson@kernel.org, konradybcio@kernel.org,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	manivannan.sadhasivam@linaro.org, arnd@arndb.de, esben@geanix.com,
	nikita.shubin@maquefel.me, linux-arm-msm@vger.kernel.org,
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, quic_srichara@quicinc.com,
	quic_varada@quicinc.com
Subject: Re: [PATCH v11 4/8] mtd: nand: Add qpic_common API file
Message-ID: <202410130129.M8J7VJoG-lkp@intel.com>
References: <20241010070510.1504250-5-quic_mdalam@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241010070510.1504250-5-quic_mdalam@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241012_110023_622632_BC66EE65 
X-CRM114-Status: GOOD (  10.60  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Md,

kernel test robot noticed the following build errors:

[auto build test ERROR on mtd/nand/next]
[also build test ERROR on broonie-spi/for-next robh/for-next linus/master v=
6.12-rc2 next-20241011]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Md-Sadre-Alam/spi-dt=
-bindings-Introduce-qcom-spi-qpic-snand/20241010-161236
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/=
next
patch link:    https://lore.kernel.org/r/20241010070510.1504250-5-quic_mdal=
am%40quicinc.com
patch subject: [PATCH v11 4/8] mtd: nand: Add qpic_common API file
config: csky-randconfig-r123-20241012 (https://download.01.org/0day-ci/arch=
ive/20241013/202410130129.M8J7VJoG-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20241013/202410130129.M=
8J7VJoG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410130129.M8J7VJoG-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

   csky-linux-ld: drivers/mtd/nand/raw/qcom_nandc.o: in function `qcom_nand=
c_remove':
>> drivers/mtd/nand/raw/qcom_nandc.c:2347:(.text+0x3ce): undefined referenc=
e to `nand_cleanup'
   csky-linux-ld: drivers/mtd/nand/raw/qcom_nandc.o: in function `config_na=
nd_page_write':
   drivers/mtd/nand/raw/qcom_nandc.c:377:(.text+0x538): undefined reference=
 to `nand_cleanup'
   csky-linux-ld: drivers/mtd/nand/raw/qcom_nandc.o: in function `qcom_pars=
e_instructions':
>> drivers/mtd/nand/raw/qcom_nandc.c:1626:(.text+0x756): undefined referenc=
e to `nand_subop_get_addr_start_off'
>> csky-linux-ld: drivers/mtd/nand/raw/qcom_nandc.c:1627:(.text+0x766): und=
efined reference to `nand_subop_get_num_addr_cyc'
   csky-linux-ld: drivers/mtd/nand/raw/qcom_nandc.o: in function `qcom_misc=
_cmd_type_exec':
   drivers/mtd/nand/raw/qcom_nandc.c:1823:(.text+0x8a8): undefined referenc=
e to `nand_subop_get_addr_start_off'
   csky-linux-ld: drivers/mtd/nand/raw/qcom_nandc.c:1823:(.text+0x8ac): und=
efined reference to `nand_subop_get_num_addr_cyc'
   csky-linux-ld: drivers/mtd/nand/raw/qcom_nandc.o: in function `qcom_para=
m_page_type_exec':
>> drivers/mtd/nand/raw/qcom_nandc.c:1917:(.text+0xa3e): undefined referenc=
e to `nand_subop_get_data_len'
>> csky-linux-ld: drivers/mtd/nand/raw/qcom_nandc.c:1951:(.text+0xb64): und=
efined reference to `nand_subop_get_data_len'
   csky-linux-ld: drivers/mtd/nand/raw/qcom_nandc.o: in function `qcom_read=
_status_exec':
   drivers/mtd/nand/raw/qcom_nandc.c:1747:(.text+0xcc6): undefined referenc=
e to `nand_subop_get_data_len'
   csky-linux-ld: drivers/mtd/nand/raw/qcom_nandc.c:1752:(.text+0xd14): und=
efined reference to `nand_subop_get_data_len'
   csky-linux-ld: drivers/mtd/nand/raw/qcom_nandc.o: in function `qcom_read=
_id_type_exec':
   drivers/mtd/nand/raw/qcom_nandc.c:1794:(.text+0xdee): undefined referenc=
e to `nand_subop_get_data_len'
   csky-linux-ld: drivers/mtd/nand/raw/qcom_nandc.o: in function `qcom_nand=
_attach_chip':
>> drivers/mtd/nand/raw/qcom_nandc.c:1393:(.text+0xe4c): undefined referenc=
e to `nand_ecc_choose_conf'
   csky-linux-ld: drivers/mtd/nand/raw/qcom_nandc.c:1403:(.text+0xed8): und=
efined reference to `nand_subop_get_data_len'
>> csky-linux-ld: drivers/mtd/nand/raw/qcom_nandc.c:1403:(.text+0xee8): und=
efined reference to `nand_ecc_choose_conf'
   csky-linux-ld: drivers/mtd/nand/raw/qcom_nandc.o: in function `qcom_nand=
c_write_page_raw':
>> drivers/mtd/nand/raw/qcom_nandc.c:1054:(.text+0x10cc): undefined referen=
ce to `nand_prog_page_begin_op'
>> csky-linux-ld: drivers/mtd/nand/raw/qcom_nandc.c:1109:(.text+0x11fe): un=
defined reference to `nand_prog_page_end_op'
>> csky-linux-ld: drivers/mtd/nand/raw/qcom_nandc.c:1110:(.text+0x1218): un=
defined reference to `nand_prog_page_begin_op'
   csky-linux-ld: drivers/mtd/nand/raw/qcom_nandc.c:1110:(.text+0x1238): un=
defined reference to `nand_prog_page_end_op'
   csky-linux-ld: drivers/mtd/nand/raw/qcom_nandc.o: in function `qcom_nand=
c_read_cw_raw':
>> drivers/mtd/nand/raw/qcom_nandc.c:482:(.text+0x1266): undefined referenc=
e to `nand_read_page_op'
>> csky-linux-ld: drivers/mtd/nand/raw/qcom_nandc.c:542:(.text+0x1468): und=
efined reference to `nand_read_page_op'
   csky-linux-ld: drivers/mtd/nand/raw/qcom_nandc.o: in function `check_for=
_erased_page':
>> drivers/mtd/nand/raw/qcom_nandc.c:600:(.text+0x15bc): undefined referenc=
e to `nand_check_erased_ecc_chunk'
>> csky-linux-ld: drivers/mtd/nand/raw/qcom_nandc.c:613:(.text+0x1618): und=
efined reference to `nand_check_erased_ecc_chunk'
   csky-linux-ld: drivers/mtd/nand/raw/qcom_nandc.o: in function `nand_scan=
':
>> include/linux/mtd/rawnand.h:1592:(.text+0x1af6): undefined reference to =
`nand_scan_with_ids'
   csky-linux-ld: drivers/mtd/nand/raw/qcom_nandc.o: in function `qcom_nand=
_host_parse_boot_partitions':
>> drivers/mtd/nand/raw/qcom_nandc.c:2091:(.text+0x1bb0): undefined referen=
ce to `nand_scan_with_ids'
   csky-linux-ld: drivers/mtd/nand/raw/qcom_nandc.o: in function `qcom_nand=
_host_init_and_register':
   drivers/mtd/nand/raw/qcom_nandc.c:2195:(.text+0x1c88): undefined referen=
ce to `nand_cleanup'
   csky-linux-ld: drivers/mtd/nand/raw/qcom_nandc.o: in function `qcom_chec=
k_op':
   drivers/mtd/nand/raw/qcom_nandc.c:2008:(.text+0x1d4c): undefined referen=
ce to `nand_cleanup'
   csky-linux-ld: drivers/mtd/nand/raw/qcom_nandc.o: in function `qcom_nand=
_exec_op':
>> drivers/mtd/nand/raw/qcom_nandc.c:2017:(.text+0x1d60): undefined referen=
ce to `nand_op_parser_exec_op'
>> csky-linux-ld: drivers/mtd/nand/raw/qcom_nandc.c:2018:(.text+0x1d94): un=
defined reference to `nand_op_parser_exec_op'
   csky-linux-ld: drivers/mtd/nand/raw/qcom_nandc.o: in function `qcom_nand=
c_read_page':
   drivers/mtd/nand/raw/qcom_nandc.c:905:(.text+0x20fe): undefined referenc=
e to `nand_read_page_op'
   csky-linux-ld: drivers/mtd/nand/raw/qcom_nandc.c:919:(.text+0x2198): und=
efined reference to `nand_read_page_op'
   csky-linux-ld: drivers/mtd/nand/raw/qcom_nandc.o: in function `qcom_nand=
c_block_markbad':
>> drivers/mtd/nand/raw/qcom_nandc.c:1234:(.text+0x228c): undefined referen=
ce to `nand_prog_page_end_op'
   csky-linux-ld: drivers/mtd/nand/raw/qcom_nandc.o: in function `qcom_nand=
c_write_oob':
   drivers/mtd/nand/raw/qcom_nandc.c:1158:(.text+0x239a): undefined referen=
ce to `nand_prog_page_end_op'
   csky-linux-ld: drivers/mtd/nand/raw/qcom_nandc.c:1159:(.text+0x23cc): un=
defined reference to `nand_prog_page_end_op'
   csky-linux-ld: drivers/mtd/nand/raw/qcom_nandc.o: in function `qcom_nand=
c_write_page':
   drivers/mtd/nand/raw/qcom_nandc.c:980:(.text+0x2410): undefined referenc=
e to `nand_prog_page_begin_op'
   csky-linux-ld: drivers/mtd/nand/raw/qcom_nandc.c:1036:(.text+0x2524): un=
defined reference to `nand_prog_page_end_op'
   csky-linux-ld: drivers/mtd/nand/raw/qcom_nandc.o: in function `qcom_nand=
c_block_bad':
   drivers/mtd/nand/raw/qcom_nandc.c:1167:(.text+0x2648): undefined referen=
ce to `nand_prog_page_begin_op'
   csky-linux-ld: drivers/mtd/nand/raw/qcom_nandc.c:1167:(.text+0x2668): un=
defined reference to `nand_prog_page_end_op'


vim +2347 drivers/mtd/nand/raw/qcom_nandc.c

c76b78d8ec05a2 drivers/mtd/nand/qcom_nandc.c     Archit Taneja    2016-02-0=
3  2334  =

ec185b18c22323 drivers/mtd/nand/raw/qcom_nandc.c Uwe Kleine-K=F6nig 2023-04=
-11  2335  static void qcom_nandc_remove(struct platform_device *pdev)
c76b78d8ec05a2 drivers/mtd/nand/qcom_nandc.c     Archit Taneja    2016-02-0=
3  2336  {
c76b78d8ec05a2 drivers/mtd/nand/qcom_nandc.c     Archit Taneja    2016-02-0=
3  2337  	struct qcom_nand_controller *nandc =3D platform_get_drvdata(pdev);
7330fc505af4af drivers/mtd/nand/raw/qcom_nandc.c Arnd Bergmann    2018-07-1=
7  2338  	struct resource *res =3D platform_get_resource(pdev, IORESOURCE_M=
EM, 0);
c76b78d8ec05a2 drivers/mtd/nand/qcom_nandc.c     Archit Taneja    2016-02-0=
3  2339  	struct qcom_nand_host *host;
0a2bc9919cf74e drivers/mtd/nand/raw/qcom_nandc.c Miquel Raynal    2020-05-1=
9  2340  	struct nand_chip *chip;
0a2bc9919cf74e drivers/mtd/nand/raw/qcom_nandc.c Miquel Raynal    2020-05-1=
9  2341  	int ret;
c76b78d8ec05a2 drivers/mtd/nand/qcom_nandc.c     Archit Taneja    2016-02-0=
3  2342  =

0a2bc9919cf74e drivers/mtd/nand/raw/qcom_nandc.c Miquel Raynal    2020-05-1=
9  2343  	list_for_each_entry(host, &nandc->host_list, node) {
0a2bc9919cf74e drivers/mtd/nand/raw/qcom_nandc.c Miquel Raynal    2020-05-1=
9  2344  		chip =3D &host->chip;
0a2bc9919cf74e drivers/mtd/nand/raw/qcom_nandc.c Miquel Raynal    2020-05-1=
9  2345  		ret =3D mtd_device_unregister(nand_to_mtd(chip));
0a2bc9919cf74e drivers/mtd/nand/raw/qcom_nandc.c Miquel Raynal    2020-05-1=
9  2346  		WARN_ON(ret);
0a2bc9919cf74e drivers/mtd/nand/raw/qcom_nandc.c Miquel Raynal    2020-05-1=
9 @2347  		nand_cleanup(chip);
0a2bc9919cf74e drivers/mtd/nand/raw/qcom_nandc.c Miquel Raynal    2020-05-1=
9  2348  	}
7330fc505af4af drivers/mtd/nand/raw/qcom_nandc.c Arnd Bergmann    2018-07-1=
7  2349  =

c76b78d8ec05a2 drivers/mtd/nand/qcom_nandc.c     Archit Taneja    2016-02-0=
3  2350  	qcom_nandc_unalloc(nandc);
c76b78d8ec05a2 drivers/mtd/nand/qcom_nandc.c     Archit Taneja    2016-02-0=
3  2351  =

c76b78d8ec05a2 drivers/mtd/nand/qcom_nandc.c     Archit Taneja    2016-02-0=
3  2352  	clk_disable_unprepare(nandc->aon_clk);
c76b78d8ec05a2 drivers/mtd/nand/qcom_nandc.c     Archit Taneja    2016-02-0=
3  2353  	clk_disable_unprepare(nandc->core_clk);
c76b78d8ec05a2 drivers/mtd/nand/qcom_nandc.c     Archit Taneja    2016-02-0=
3  2354  =

7330fc505af4af drivers/mtd/nand/raw/qcom_nandc.c Arnd Bergmann    2018-07-1=
7  2355  	dma_unmap_resource(&pdev->dev, nandc->base_dma, resource_size(res=
),
7330fc505af4af drivers/mtd/nand/raw/qcom_nandc.c Arnd Bergmann    2018-07-1=
7  2356  			   DMA_BIDIRECTIONAL, 0);
c76b78d8ec05a2 drivers/mtd/nand/qcom_nandc.c     Archit Taneja    2016-02-0=
3  2357  }
c76b78d8ec05a2 drivers/mtd/nand/qcom_nandc.c     Archit Taneja    2016-02-0=
3  2358  =


-- =

0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
