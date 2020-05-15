Return-Path: <SRS0=xunr=65=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA1F2C433E0
	for <linux-mtd@archiver.kernel.org>; Fri, 15 May 2020 13:44:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95C9820657
	for <linux-mtd@archiver.kernel.org>; Fri, 15 May 2020 13:44:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BwjZoncH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95C9820657
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1nURjXLbmg32OCun1jZrD9u/TBJkLkMf+dfb3vr99Lw=; b=BwjZoncHDOIKOO
	NBhC59xv1sMR6YzCNcOxAdr+Zv3NU568gLxB8Jcg0gkB3IfxkASu3aJlCot8qRZYI/aVmPuPIbbKp
	vydZBg/T1ohaYSWYW71N1Ft0dBONBUPJOLYxVjrLXQiVTXNwqlziMfClVDE7QEwiVXzddD9izax+h
	TqMQ0FRIiC5F97hXcijHMPWXbYfhX0fQQGZS1wgNrPYywDb6ySyw7AIggJpJ6nWQoOfLFbBidizoB
	ZjQjFBb6LQI3NHfaRzGrvX8gU0O3JbXoYsKQLn58q/04X/GI2fqS4g8h5y/lE4g4YWHu0qCT8gzfp
	aJd9NKPwEOZozv+ITnSw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZadK-0006xw-NW; Fri, 15 May 2020 13:44:14 +0000
Received: from mga12.intel.com ([192.55.52.136])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZadE-0006x6-VG
 for linux-mtd@lists.infradead.org; Fri, 15 May 2020 13:44:13 +0000
IronPort-SDR: 9BEOWdxyfgeuKjURJkV8G87ZmNsaN3Il4tazgJmoBam+EjHYnbab5jF4tfHwLWSFJh3NiMvMrh
 z/Wnn53sMwGw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2020 06:44:06 -0700
IronPort-SDR: XUuWNIa/68RF2TL7GYDZ0s/YCiuLMpru58HLd5CXgkXXhAEkeWFMozt3KinDZ4zrLhmR6Dbdkm
 2j14CFRSWdTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,395,1583222400"; d="scan'208";a="464907167"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by fmsmga006.fm.intel.com with ESMTP; 15 May 2020 06:44:03 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1jZad9-00018C-6A; Fri, 15 May 2020 21:44:03 +0800
Date: Fri, 15 May 2020 21:43:26 +0800
From: kbuild test robot <lkp@intel.com>
To: "Ramuthevar,
 Vadivel MuruganX" <vadivel.muruganx.ramuthevar@linux.intel.com>, 
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v7 2/2] mtd: rawnand: Add NAND controller support on
 Intel LGM SoC
Message-ID: <202005152142.AWvx4xc5%lkp@intel.com>
References: <20200515105537.4876-3-vadivel.muruganx.ramuthevar@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200515105537.4876-3-vadivel.muruganx.ramuthevar@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200515_064409_031003_B091FA24 
X-CRM114-Status: GOOD (  10.19  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: kbuild-all@lists.01.org, vigneshr@ti.com, arnd@arndb.de, richard@nod.at,
 brendanhiggins@google.com, boris.brezillon@collabora.com,
 miquel.raynal@bootlin.com, anders.roxell@linaro.org, tglx@linutronix.de,
 masonccyang@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi "Ramuthevar,Vadivel,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on robh/for-next]
[also build test WARNING on arm-soc/for-next linus/master linux/master v5.7-rc5 next-20200514]
[cannot apply to mtd/master]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Ramuthevar-Vadivel-MuruganX/mtd-rawnand-Add-NAND-controller-support-on-Intel-LGM-SoC/20200515-185904
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-193-gb8fad4bc-dirty
        make ARCH=x86_64 allmodconfig
        make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/mtd/nand/raw/intel-nand-controller.c:441:24: sparse: sparse: incorrect type in argument 1 (different base types) @@    expected unsigned int val @@    got restricted __be32 [assignedunsigned int val @@
>> drivers/mtd/nand/raw/intel-nand-controller.c:441:24: sparse:    expected unsigned int val
>> drivers/mtd/nand/raw/intel-nand-controller.c:441:24: sparse:    got restricted __be32 [assigned] [usertype] reg
   drivers/mtd/nand/raw/intel-nand-controller.c:444:24: sparse: sparse: incorrect type in argument 1 (different base types) @@    expected unsigned int val @@    got restricted __be32 [assignedunsigned int val @@
   drivers/mtd/nand/raw/intel-nand-controller.c:444:24: sparse:    expected unsigned int val
   drivers/mtd/nand/raw/intel-nand-controller.c:444:24: sparse:    got restricted __be32 [assigned] [usertype] reg

vim +441 drivers/mtd/nand/raw/intel-nand-controller.c

   420	
   421	static int ebu_nand_write_page_hwecc(struct nand_chip *chip, const u8 *buf,
   422					     int oob_required, int page)
   423	{
   424		struct mtd_info *mtd = nand_to_mtd(chip);
   425		struct ebu_nand_controller *ebu_host = nand_get_controller_data(chip);
   426		void __iomem *int_sta = ebu_host->hsnand + HSNAND_INT_STA;
   427		int ret, val, x;
   428		__be32 reg;
   429	
   430		ebu_nand_trigger(ebu_host, page, NAND_CMD_SEQIN);
   431	
   432		ret = ebu_dma_start(ebu_host, DMA_MEM_TO_DEV, buf, mtd->writesize);
   433		if (ret)
   434			return ret;
   435	
   436		if (oob_required) {
   437			const u8 *pdata;
   438	
   439			pdata = chip->oob_poi;
   440			reg = cpu_to_be32(*pdata++);
 > 441			writel(reg, ebu_host->hsnand + HSNAND_CMSG_0);
   442	
   443			reg = cpu_to_be32(*pdata);
   444			writel(reg, ebu_host->hsnand + HSNAND_CMSG_1);
   445		}
   446	
   447		ret = readl_poll_timeout_atomic(int_sta, val,
   448						!(val & HSNAND_INT_STA_WR_C), 10, 1000);
   449		if (ret)
   450			return -EIO;
   451	
   452		x = readl(ebu_host->hsnand + HSNAND_CTL);
   453		x &= ~HSNAND_CTL_GO;
   454		writel(x, ebu_host->hsnand + HSNAND_CTL);
   455	
   456		return 0;
   457	}
   458	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
