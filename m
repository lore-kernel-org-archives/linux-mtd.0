Return-Path: <SRS0=9+2p=2V=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79EDDC2D0CE
	for <linux-mtd@archiver.kernel.org>; Tue, 31 Dec 2019 07:34:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C05B206DA
	for <linux-mtd@archiver.kernel.org>; Tue, 31 Dec 2019 07:34:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KO9HlAUx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C05B206DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b+CA7ZFZtE2q8ieB0oJFCxVdesb0GSDgR1jUuaIOewg=; b=KO9HlAUxbIu+vo
	ZDp5O2u4cOMMAWC86442Fo8K7WLm7JOXLGDfRLFSot71erV+Vm07/Sp10eqYb7+lxdqpv2b4Gt4YE
	8zcC6Dk3jzhhNeBwmY7OB0PbpePXUZed8H8FH7elVXb+dyYpVZq2u69Uje/9jm4pUMDRTM/QHo55q
	prrITk6S/hgLROd+EBgWQjoCOP6z6qQ+4U2De5XAMm7V73bQ/fIfTT3ZV8H65Abxe0Hdegb9qs9c8
	UZKJ/MDDF3uQ+88/dVHJBr8AcPE3zXHXLN3zYC04TruCEcs+LpT9m9enQBE5NI3DJ+Nywshc8LBjV
	VptKCe68ID5rk0Dwzrww==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1imC2I-0001ND-Fy; Tue, 31 Dec 2019 07:33:50 +0000
Received: from mail-ed1-f65.google.com ([209.85.208.65])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1imC2F-0001Mh-0D; Tue, 31 Dec 2019 07:33:49 +0000
Received: by mail-ed1-f65.google.com with SMTP id i16so34663715edr.5;
 Mon, 30 Dec 2019 23:33:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CSBc4qS53J+lRZg5w7KXUGNuv3VGsAFByvWkMrjeDpo=;
 b=mZt7Wd5LNGDBSpBOQg9b6CmeHUaoK+RMxswXCy1Td+EvzQ5bzDBILOZOS6sx23a6IP
 CscUIPGwYs23mU4RWGAlUzFnGqv8CDB1l3OnTdMEknSBej8kUecyu1o9ZBg6ki2aHL7Z
 swg21Q3vnlwa5SAnr39wZd6FiOxi1JKuO3dPbsZIsFXl1KZV7ySmT91lF78ViODlc2Ku
 cYxRenEm0uTzK0O06OKlgF2CjFQijJfYVDvv9iiF4SLqDw9dwPx6e3CCdXtrjTmJiGj+
 yMm9GV+JtByA/NXNWHRyCMUXud3lN6qif5rsmqNDTR4Mfuf6yEp2UXmRPNZvkENnXAKU
 GIAg==
X-Gm-Message-State: APjAAAVf9SxCrkPgPRoW/N5GchZZp9RWU+WUnnr2DslSJLV1JaAFl52Z
 rLRN7F7ms8AsuS8i1OfgsXw=
X-Google-Smtp-Source: APXvYqxMofKUDqCew+FL9Zuc0mUQOhD1ebHisnFabz5QKmd1eWIJZsZZNqrtOE1XBrdPlrOaE6v4fg==
X-Received: by 2002:a17:906:1b07:: with SMTP id
 o7mr76289121ejg.131.1577777622485; 
 Mon, 30 Dec 2019 23:33:42 -0800 (PST)
Received: from pi3 ([194.230.155.138])
 by smtp.googlemail.com with ESMTPSA id o7sm5685770edv.71.2019.12.30.23.33.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Dec 2019 23:33:41 -0800 (PST)
Date: Tue, 31 Dec 2019 08:33:39 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH 3/3] mtd: onenand: Enable compile testing of OMAP and
 Samsung drivers
Message-ID: <20191231073339.GA6747@pi3>
References: <20191229183612.22133-3-krzk@kernel.org>
 <201912310904.9iM6MaFr%lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <201912310904.9iM6MaFr%lkp@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191230_233347_048155_B92189A1 
X-CRM114-Status: GOOD (  20.52  )
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
 linux-kernel@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Dec 31, 2019 at 10:00:48AM +0800, kbuild test robot wrote:
> Hi Krzysztof,
> 
> I love your patch! Perhaps something to improve:
> 
> [auto build test WARNING on linus/master]
> [also build test WARNING on v5.5-rc4 next-20191220]
> [if your patch is applied to the wrong git tree, please drop us a note to help
> improve the system. BTW, we also suggest to use '--base' option to specify the
> base tree in git format-patch, please see https://stackoverflow.com/a/37406982]
> 
> url:    https://github.com/0day-ci/linux/commits/Krzysztof-Kozlowski/mtd-onenand-samsung-Fix-pointer-cast-Wpointer-to-int-cast-warnings-on-64-bit/20191230-030838
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git bf8d1cd4386535004c4afe7f03d37f9864c9940e
> reproduce:
>         # apt-get install sparse
>         # sparse version: v0.6.1-129-g341daf20-dirty
>         make ARCH=x86_64 allmodconfig
>         make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'
> 
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
> 

It is not related to my patch. I'll fix it up soon.

Best regards,
Krzysztof

> 
> sparse warnings: (new ones prefixed by >>)
> 
> >> drivers/mtd/nand/onenand/samsung_mtd.c:678:17: sparse: sparse: incorrect type in argument 2 (different address spaces)
> >> drivers/mtd/nand/onenand/samsung_mtd.c:678:17: sparse:    expected void const *from
> >> drivers/mtd/nand/onenand/samsung_mtd.c:678:17: sparse:    got void [noderef] <asn:2> *[assigned] p
> >> drivers/mtd/nand/onenand/samsung_mtd.c:679:19: sparse: sparse: incorrect type in assignment (different address spaces)
> >> drivers/mtd/nand/onenand/samsung_mtd.c:679:19: sparse:    expected void [noderef] <asn:2> *[assigned] p
> >> drivers/mtd/nand/onenand/samsung_mtd.c:679:19: sparse:    got unsigned char *
>    drivers/mtd/nand/onenand/samsung_mtd.c:682:9: sparse: sparse: incorrect type in argument 2 (different address spaces)
>    drivers/mtd/nand/onenand/samsung_mtd.c:682:9: sparse:    expected void const *from
>    drivers/mtd/nand/onenand/samsung_mtd.c:682:9: sparse:    got void [noderef] <asn:2> *[assigned] p
> 
> vim +678 drivers/mtd/nand/onenand/samsung_mtd.c
> 
> e23abf4b774322 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-09-28  614  
> 46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  615  static int s5pc110_read_bufferram(struct mtd_info *mtd, int area,
> 46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  616  		unsigned char *buffer, int offset, size_t count)
> 46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  617  {
> 46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  618  	struct onenand_chip *this = mtd->priv;
> 46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  619  	void __iomem *p;
> 46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  620  	void *buf = (void *) buffer;
> 46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  621  	dma_addr_t dma_src, dma_dst;
> 08b3af3092bb2c drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-11-02  622  	int err, ofs, page_dma = 0;
> dcf08227e964a5 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-09-28  623  	struct device *dev = &onenand->pdev->dev;
> 46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  624  
> 9aba97ad004ed0 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-08-27  625  	p = this->base + area;
> 46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  626  	if (ONENAND_CURRENT_BUFFERRAM(this)) {
> 46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  627  		if (area == ONENAND_DATARAM)
> 46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  628  			p += this->writesize;
> 46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  629  		else
> 46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  630  			p += mtd->oobsize;
> 46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  631  	}
> 46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  632  
> 46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  633  	if (offset & 3 || (size_t) buf & 3 ||
> 46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  634  		!onenand->dma_addr || count != mtd->writesize)
> 46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  635  		goto normal;
> 46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  636  
> 46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  637  	/* Handle vmalloc address */
> 46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  638  	if (buf >= high_memory) {
> 46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  639  		struct page *page;
> 46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  640  
> 46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  641  		if (((size_t) buf & PAGE_MASK) !=
> 46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  642  		    ((size_t) (buf + count - 1) & PAGE_MASK))
> 46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  643  			goto normal;
> 46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  644  		page = vmalloc_to_page(buf);
> 46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  645  		if (!page)
> 46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  646  			goto normal;
> 46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  647  
> 08b3af3092bb2c drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-11-02  648  		/* Page offset */
> 08b3af3092bb2c drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-11-02  649  		ofs = ((size_t) buf & ~PAGE_MASK);
> dcf08227e964a5 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-09-28  650  		page_dma = 1;
> 08b3af3092bb2c drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-11-02  651  
> dcf08227e964a5 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-09-28  652  		/* DMA routine */
> dcf08227e964a5 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-09-28  653  		dma_src = onenand->phys_base + (p - this->base);
> 08b3af3092bb2c drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-11-02  654  		dma_dst = dma_map_page(dev, page, ofs, count, DMA_FROM_DEVICE);
> dcf08227e964a5 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-09-28  655  	} else {
> 46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  656  		/* DMA routine */
> 46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  657  		dma_src = onenand->phys_base + (p - this->base);
> dcf08227e964a5 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-09-28  658  		dma_dst = dma_map_single(dev, buf, count, DMA_FROM_DEVICE);
> dcf08227e964a5 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-09-28  659  	}
> dcf08227e964a5 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-09-28  660  	if (dma_mapping_error(dev, dma_dst)) {
> 102f66a740cfbe drivers/mtd/nand/onenand/samsung_mtd.c Krzysztof Kozlowski 2019-12-29  661  		dev_err(dev, "Couldn't map a %zu byte buffer for DMA\n", count);
> 46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  662  		goto normal;
> 46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  663  	}
> 81d46c59550997 drivers/mtd/onenand/samsung.c          Arnd Bergmann       2014-05-08  664  	err = s5pc110_dma_ops(dma_dst, dma_src,
> 46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  665  			count, S5PC110_DMA_DIR_READ);
> dcf08227e964a5 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-09-28  666  
> dcf08227e964a5 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-09-28  667  	if (page_dma)
> dcf08227e964a5 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-09-28  668  		dma_unmap_page(dev, dma_dst, count, DMA_FROM_DEVICE);
> dcf08227e964a5 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-09-28  669  	else
> dcf08227e964a5 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-09-28  670  		dma_unmap_single(dev, dma_dst, count, DMA_FROM_DEVICE);
> 46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  671  
> 46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  672  	if (!err)
> 46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  673  		return 0;
> 46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  674  
> 46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  675  normal:
> 46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  676  	if (count != mtd->writesize) {
> 46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  677  		/* Copy the bufferram to memory to prevent unaligned access */
> 9aba97ad004ed0 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-08-27 @678  		memcpy(this->page_buf, p, mtd->writesize);
> 46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28 @679  		p = this->page_buf + offset;
> 46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  680  	}
> 46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  681  
> 46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  682  	memcpy(buffer, p, count);
> 46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  683  
> 46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  684  	return 0;
> 46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  685  }
> 46f3e88bd9da01 drivers/mtd/onenand/samsung.c          Kyungmin Park       2010-04-28  686  
> 
> :::::: The code at line 678 was first introduced by commit
> :::::: 9aba97ad004ed0cde9747a9daf5b1484edb746cd mtd: OneNAND: Fix 2KiB pagesize handling at Samsung SoCs
> 
> :::::: TO: Kyungmin Park <kyungmin.park@samsung.com>
> :::::: CC: David Woodhouse <David.Woodhouse@intel.com>
> 
> ---
> 0-DAY kernel test infrastructure                 Open Source Technology Center
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org Intel Corporation

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
