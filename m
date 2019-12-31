Return-Path: <SRS0=9+2p=2V=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 411E9C2D0C3
	for <linux-mtd@archiver.kernel.org>; Tue, 31 Dec 2019 02:01:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F96E20722
	for <linux-mtd@archiver.kernel.org>; Tue, 31 Dec 2019 02:01:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KudYYyFF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F96E20722
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pGDJ/akhC++76W5G1HNCL6D3yvjJ9CFz3ZQz7NfNiQ8=; b=KudYYyFFKdNM4I
	51VVDoFTOT4kansD++vlmr1ZR2XQJcsJXl0yUonLHc3dqzktZ+abVonF6C+1VMB1vT75rVJ0XBOie
	ON5dMaI9EzigGjhS19PwLDJYHf8gao+tDl84BZ5fZWm1bmZnQtVne2wAtcdbqeBN+erfn/bYEscBJ
	FYt2jOVIkRTeCNI2Wy73JAAiiZ5LX6ZnsBL9nEJcA8CgwD+6z3vORhhd2Ik9yVe18+cgVL6nrNGwV
	JTXcQopMFhqXf4FDezL4ED5iZfBvJorDSReCnWqaBt8+nrnIQLkDauY+h/Hq5AKELt10pHcFB7cdM
	yx1Ws8u5uVE7EwdzVHCg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1im6qe-0006CQ-N9; Tue, 31 Dec 2019 02:01:28 +0000
Received: from mga12.intel.com ([192.55.52.136])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1im6qa-0006Bh-L2; Tue, 31 Dec 2019 02:01:26 +0000
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Dec 2019 18:01:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,377,1571727600"; d="scan'208";a="244016589"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by fmsmga004.fm.intel.com with ESMTP; 30 Dec 2019 18:01:18 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1im6qU-000HId-8e; Tue, 31 Dec 2019 10:01:18 +0800
Date: Tue, 31 Dec 2019 10:00:48 +0800
From: kbuild test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 3/3] mtd: onenand: Enable compile testing of OMAP and
 Samsung drivers
Message-ID: <201912310904.9iM6MaFr%lkp@intel.com>
References: <20191229183612.22133-3-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191229183612.22133-3-krzk@kernel.org>
User-Agent: NeoMutt/20170113 (1.7.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191230_180124_746511_5F167509 
X-CRM114-Status: GOOD (  16.58  )
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
Cc: linux-samsung-soc@vger.kernel.org, kbuild-all@lists.01.org,
 Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Krzysztof,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v5.5-rc4 next-20191220]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Krzysztof-Kozlowski/mtd-onenand-samsung-Fix-pointer-cast-Wpointer-to-int-cast-warnings-on-64-bit/20191230-030838
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git bf8d1cd4386535004c4afe7f03d37f9864c9940e
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-129-g341daf20-dirty
        make ARCH=x86_64 allmodconfig
        make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/mtd/nand/onenand/samsung_mtd.c:678:17: sparse: sparse: incorrect type in argument 2 (different address spaces)
>> drivers/mtd/nand/onenand/samsung_mtd.c:678:17: sparse:    expected void const *from
>> drivers/mtd/nand/onenand/samsung_mtd.c:678:17: sparse:    got void [noderef] <asn:2> *[assigned] p
>> drivers/mtd/nand/onenand/samsung_mtd.c:679:19: sparse: sparse: incorrect type in assignment (different address spaces)
>> drivers/mtd/nand/onenand/samsung_mtd.c:679:19: sparse:    expected void [noderef] <asn:2> *[assigned] p
>> drivers/mtd/nand/onenand/samsung_mtd.c:679:19: sparse:    got unsigned char *
   drivers/mtd/nand/onenand/samsung_mtd.c:682:9: sparse: sparse: incorrect type in argument 2 (different address spaces)
   drivers/mtd/nand/onenand/samsung_mtd.c:682:9: sparse:    expected void const *from
   drivers/mtd/nand/onenand/samsung_mtd.c:682:9: sparse:    got void [noderef] <asn:2> *[assigned] p

vim +678 drivers/mtd/nand/onenand/samsung_mtd.c

e23abf4b774322 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-09-28  614  
46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  615  static int s5pc110_read_bufferram(struct mtd_info *mtd, int area,
46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  616  		unsigned char *buffer, int offset, size_t count)
46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  617  {
46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  618  	struct onenand_chip *this = mtd->priv;
46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  619  	void __iomem *p;
46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  620  	void *buf = (void *) buffer;
46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  621  	dma_addr_t dma_src, dma_dst;
08b3af3092bb2c drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-11-02  622  	int err, ofs, page_dma = 0;
dcf08227e964a5 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-09-28  623  	struct device *dev = &onenand->pdev->dev;
46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  624  
9aba97ad004ed0 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-08-27  625  	p = this->base + area;
46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  626  	if (ONENAND_CURRENT_BUFFERRAM(this)) {
46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  627  		if (area == ONENAND_DATARAM)
46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  628  			p += this->writesize;
46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  629  		else
46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  630  			p += mtd->oobsize;
46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  631  	}
46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  632  
46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  633  	if (offset & 3 || (size_t) buf & 3 ||
46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  634  		!onenand->dma_addr || count != mtd->writesize)
46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  635  		goto normal;
46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  636  
46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  637  	/* Handle vmalloc address */
46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  638  	if (buf >= high_memory) {
46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  639  		struct page *page;
46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  640  
46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  641  		if (((size_t) buf & PAGE_MASK) !=
46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  642  		    ((size_t) (buf + count - 1) & PAGE_MASK))
46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  643  			goto normal;
46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  644  		page = vmalloc_to_page(buf);
46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  645  		if (!page)
46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  646  			goto normal;
46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  647  
08b3af3092bb2c drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-11-02  648  		/* Page offset */
08b3af3092bb2c drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-11-02  649  		ofs = ((size_t) buf & ~PAGE_MASK);
dcf08227e964a5 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-09-28  650  		page_dma = 1;
08b3af3092bb2c drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-11-02  651  
dcf08227e964a5 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-09-28  652  		/* DMA routine */
dcf08227e964a5 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-09-28  653  		dma_src = onenand->phys_base + (p - this->base);
08b3af3092bb2c drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-11-02  654  		dma_dst = dma_map_page(dev, page, ofs, count, DMA_FROM_DEVICE);
dcf08227e964a5 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-09-28  655  	} else {
46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  656  		/* DMA routine */
46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  657  		dma_src = onenand->phys_base + (p - this->base);
dcf08227e964a5 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-09-28  658  		dma_dst = dma_map_single(dev, buf, count, DMA_FROM_DEVICE);
dcf08227e964a5 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-09-28  659  	}
dcf08227e964a5 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-09-28  660  	if (dma_mapping_error(dev, dma_dst)) {
102f66a740cfbe drivers/mtd/nand/onenand/samsung_mtd.c Krzysztof Kozlowski 2019-12-29  661  		dev_err(dev, "Couldn't map a %zu byte buffer for DMA\n", count);
46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  662  		goto normal;
46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  663  	}
81d46c59550997 drivers/mtd/onenand/samsung.c          Arnd Bergmann       2014-05-08  664  	err = s5pc110_dma_ops(dma_dst, dma_src,
46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  665  			count, S5PC110_DMA_DIR_READ);
dcf08227e964a5 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-09-28  666  
dcf08227e964a5 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-09-28  667  	if (page_dma)
dcf08227e964a5 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-09-28  668  		dma_unmap_page(dev, dma_dst, count, DMA_FROM_DEVICE);
dcf08227e964a5 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-09-28  669  	else
dcf08227e964a5 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-09-28  670  		dma_unmap_single(dev, dma_dst, count, DMA_FROM_DEVICE);
46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  671  
46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  672  	if (!err)
46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  673  		return 0;
46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  674  
46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  675  normal:
46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  676  	if (count != mtd->writesize) {
46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  677  		/* Copy the bufferram to memory to prevent unaligned access */
9aba97ad004ed0 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-08-27 @678  		memcpy(this->page_buf, p, mtd->writesize);
46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28 @679  		p = this->page_buf + offset;
46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  680  	}
46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  681  
46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  682  	memcpy(buffer, p, count);
46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  683  
46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  684  	return 0;
46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  685  }
46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  686  

:::::: The code at line 678 was first introduced by commit
:::::: 9aba97ad004ed0cde9747a9daf5b1484edb746cd mtd: OneNAND: Fix 2KiB pagesize handling at Samsung SoCs

:::::: TO: Kyungmin Park <kyungmin.park@samsung.com>
:::::: CC: David Woodhouse <David.Woodhouse@intel.com>

---
0-DAY kernel test infrastructure                 Open Source Technology Center
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org Intel Corporation

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
