Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F578C79F9E
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Sep 2026 01:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ed6n4tPvcTggeNWLkERfO2bI05rwzUXLuJlf0zqFhNs=; b=bd4fRzTywvdJk4
	5h8eWYQ1gCmmMeEFF+N0VyYQGFSlmNaHJC1vbNce/9Fh1l/76BKmhuGcUTYo1fHUfP+yn8dc8dNc2
	CeUi0KZ5JICwWegHjxxivQsyLcVDIqW7qTdPygBu1tVgF3xM/dMML+sjOgNDSlmS/RmmQJLdfzm8H
	POf/OEUwtDldZmgPz8h0qRhMOdYDRKbENuJSLlhXyJUFjqzU+QpLScbme4KFmiQ4G86yzqO7h18Ds
	PnQmr6IUdnEZj+HC5RCdI9RfAKl/IlnV59S61PymYn2nB+1sjdd3lCMyivVnNc/uNDuusZejsqgW8
	LLnXxCKbalemLNy7qSDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3l03-00000007uQ0-3MYT;
	Tue, 08 Sep 2026 01:51:51 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3kzy-00000007uPa-4AI0
	for linux-mtd@lists.infradead.org;
	Tue, 08 Sep 2026 01:51:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788832307; x=1820368307;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=H5KfjH5Ca7rV8DDYGvbef9Ah6ByX8i0DotG6aGor3ag=;
  b=SpkYdIp1cb0gPpUDzSKsz/IA7nxr+DJpRswZu7YHRnVrfro1uMNKuNXS
   rWGtk7GiANT2kl7KlPBTMwmFRhpKQwJAJj+L//+dWVYFUxpVrFp3iKvwU
   1J8cwnJbafeVoLqqEjssdRZ+hCbWWmPXAu1Nv/VIubTaESsdLdwGfBvKU
   3n+zUtlhA+WBsZpylKY35bBxRj+Edu/f1Dl+uRg38SUectxuml7PnCSZh
   EgoWambrCBAtZlo5qkDN/pZn/MNPVnTUiZGAGDOL20BfH8uSOOaCs3R/U
   Uc7E+8Juj9RFAn5TLm68bakNvNjtw+xjLD3UMa9g/VFIWd/Lg4QSDBAnT
   w==;
X-CSE-ConnectionGUID: +JsvL844QLimA7fUsYyAAA==
X-CSE-MsgGUID: p2X4qraJT3yl7c9v6KBqYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="100582950"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="100582950"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 18:51:45 -0700
X-CSE-ConnectionGUID: iQFGaFOTQPS3LPHK/g0vAg==
X-CSE-MsgGUID: midYSC7uQnSHi9LGil7hHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="266503127"
Received: from lkp-server01.sh.intel.com (HELO dff15f1b2031) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 07 Sep 2026 18:51:43 -0700
Received: from kbuild by dff15f1b2031 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3kzs-000000001Wn-39jd;
	Tue, 08 Sep 2026 01:51:40 +0000
Date: Tue, 8 Sep 2026 09:51:29 +0800
From: kernel test robot <lkp@intel.com>
To: fzz <1768315307@qq.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	fzz <1768315307@qq.com>
Subject: Re: [PATCH] mtd: spinand: cache the last read page to avoid
 redundant SPI operations
Message-ID: <202609080921.381EOoBZ-lkp@intel.com>
References: <tencent_219EED44C45D6CEC1D6B6724343E13733005@qq.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <tencent_219EED44C45D6CEC1D6B6724343E13733005@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_185147_078741_28897095 
X-CRM114-Status: GOOD (  14.46  )
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

Hi fzz,

kernel test robot noticed the following build errors:

[auto build test ERROR on mtd/nand/next]
[also build test ERROR on linus/master v7.3-rc2 next-20260907]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/fzz/mtd-spinand-cache-the-last-read-page-to-avoid-redundant-SPI-operations/20260907-191040
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next
patch link:    https://lore.kernel.org/r/tencent_219EED44C45D6CEC1D6B6724343E13733005%40qq.com
patch subject: [PATCH] mtd: spinand: cache the last read page to avoid redundant SPI operations
config: powerpc-randconfig-r072-20260908 (https://download.01.org/0day-ci/archive/20260908/202609080921.381EOoBZ-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 9.5.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260908/202609080921.381EOoBZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609080921.381EOoBZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mtd/nand/spi/core.c: In function 'spinand_read_from_cache_op':
>> drivers/mtd/nand/spi/core.c:563:46: error: 'const struct nand_page_io_req' has no member named 'disable_ecc'
     563 |  if (req->datalen && !req->continuous && !req->disable_ecc) {
         |                                              ^~


vim +563 drivers/mtd/nand/spi/core.c

   474	
   475	static int spinand_read_from_cache_op(struct spinand_device *spinand,
   476					      const struct nand_page_io_req *req)
   477	{
   478		struct nand_device *nand = spinand_to_nand(spinand);
   479		struct mtd_info *mtd = spinand_to_mtd(spinand);
   480		struct spi_mem_dirmap_desc *rdesc;
   481		unsigned int nbytes = 0;
   482		void *buf = NULL;
   483		u16 column = 0;
   484		ssize_t ret;
   485	
   486		if (req->datalen) {
   487			buf = spinand->databuf;
   488			if (!req->continuous)
   489				nbytes = nanddev_page_size(nand);
   490			else
   491				nbytes = round_up(req->dataoffs + req->datalen,
   492						  nanddev_page_size(nand));
   493			column = 0;
   494		}
   495	
   496		if (req->ooblen) {
   497			nbytes += nanddev_per_page_oobsize(nand);
   498			if (!buf) {
   499				buf = spinand->oobbuf;
   500				column = nanddev_page_size(nand);
   501			}
   502		}
   503	
   504		rdesc = spinand->dirmaps[req->pos.plane].rdesc;
   505	
   506		if (spinand->op_templates->cont_read_cache && req->continuous)
   507			rdesc->info.op_tmpl = &rdesc->info.secondary_op_tmpl;
   508		else
   509			rdesc->info.op_tmpl = &rdesc->info.primary_op_tmpl;
   510	
   511		if (nand->ecc.engine->integration == NAND_ECC_ENGINE_INTEGRATION_PIPELINED &&
   512		    req->mode != MTD_OPS_RAW)
   513			rdesc->info.op_tmpl->data.ecc = true;
   514		else
   515			rdesc->info.op_tmpl->data.ecc = false;
   516	
   517		if (spinand->flags & SPINAND_HAS_READ_PLANE_SELECT_BIT)
   518			column |= req->pos.plane << fls(nanddev_page_size(nand));
   519	
   520		while (nbytes) {
   521			ret = spi_mem_dirmap_read(rdesc, column, nbytes, buf);
   522			if (ret < 0)
   523				return ret;
   524	
   525			if (!ret || ret > nbytes)
   526				return -EIO;
   527	
   528			nbytes -= ret;
   529			column += ret;
   530			buf += ret;
   531	
   532			/*
   533			 * Dirmap accesses are allowed to toggle the CS.
   534			 * Toggling the CS during a continuous read is forbidden.
   535			 */
   536			if (nbytes && req->continuous) {
   537				/*
   538				 * Spi controller with broken support of continuous
   539				 * reading was detected. Disable future use of
   540				 * continuous reading and return -EAGAIN to retry
   541				 * reading within regular mode.
   542				 */
   543				spinand->cont_read_possible = false;
   544				return -EAGAIN;
   545			}
   546		}
   547	
   548		if (req->datalen)
   549			memcpy(req->databuf.in, spinand->databuf + req->dataoffs,
   550			       req->datalen);
   551	
   552		if (req->ooblen) {
   553			if (req->mode == MTD_OPS_AUTO_OOB)
   554				mtd_ooblayout_get_databytes(mtd, req->oobbuf.in,
   555							    spinand->oobbuf,
   556							    req->ooboffs,
   557							    req->ooblen);
   558			else
   559				memcpy(req->oobbuf.in, spinand->oobbuf + req->ooboffs,
   560					req->ooblen);
   561		}
   562	
 > 563		if (req->datalen && !req->continuous && !req->disable_ecc) {
   564			spinand->cur_target_cache = req->pos.target;
   565			spinand->cur_block_cache = req->pos.eraseblock;
   566			spinand->cur_page_cache = req->pos.page;
   567			spinand->cache_valid = true;
   568		}
   569	
   570		return 0;
   571	}
   572	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
