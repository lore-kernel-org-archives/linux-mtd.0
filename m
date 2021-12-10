Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7051C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Dec 2021 09:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jSfov2l9bo0iwMNQf0lEUCRHZUVZEbQXTkGV/HZkQ0k=; b=EXV4Cl4a9HU7Cl
	5MTeQwPmzkjpZlJD844vdz1D/cIVWmj1j9MdcU0zOdk0Zao8f+izG8H9iz6B1HzzPr/R0DkWaYAH4
	TefXPbqC0p/qKgO3Co3FddnhR+OcJZHBLy+3mB5ERf6AmB9bCNhJpQNANWkSqY5yEp2FLsO+trNmr
	HA7Pz77wbAM1LvdAYADZ4AhZoWdfFJ2XYSE6n11IXp1Mu1QQzXEb9CzAs06vg2bIw72r3Y8gFqpFe
	+JoVVoAez/dvJwf3ZcfVFgz7d3lCYjBg1uDg3vNiXfJZ4d9aMqbPnUdhVZJ7may5fiq/1wvDn87Tk
	3rKpNGJbxfTZhn8WPvQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvbuS-001ICi-5P; Fri, 10 Dec 2021 09:09:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvbuO-001ICA-OK; Fri, 10 Dec 2021 09:09:42 +0000
X-UUID: e99bfde9133f4d3aa712d21ebb1cea5d-20211210
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=CjU98ycZMFvnEF82w0kKkH98J8lMsWvawl0iNRUhs7E=; 
 b=fwinEs7kZI5egOftigkaEid8uXIUP+Ftw95O6ScgGbk+2MGGfjJvqo3fXbE7lBEX6xntnutuPDBQ01D3epnNz+zCs47UfoZyzUR5N7kPjXWQZcX8HK8p/j01sSx4Slufw3zYJ4EZc04+yhpsHDCmgBvss1c54R24cYCrYodUblc=;
X-UUID: e99bfde9133f4d3aa712d21ebb1cea5d-20211210
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <xiangsheng.hou@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 271663808; Fri, 10 Dec 2021 02:09:34 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Dec 2021 01:09:33 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 10 Dec 2021 17:09:31 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 10 Dec 2021 17:09:30 +0800
Message-ID: <60212a8cba39939ff2bf48196cc37cb1a2eb20e4.camel@mediatek.com>
Subject: Re: [RFC,v4,3/5] spi: mtk: Add mediatek SPI Nand Flash interface
 driver
From: xiangsheng.hou <xiangsheng.hou@mediatek.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: <broonie@kernel.org>, <benliang.zhao@mediatek.com>,
 <dandan.he@mediatek.com>, <guochun.mao@mediatek.com>,
 <bin.zhang@mediatek.com>, <sanny.chen@mediatek.com>,
 <mao.zhong@mediatek.com>, <yingjoe.chen@mediatek.com>, <donghunt@amazon.com>, 
 <rdlee@amazon.com>, <linux-mtd@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>
Date: Fri, 10 Dec 2021 17:09:31 +0800
In-Reply-To: <20211209112030.5cdcd07c@xps13>
References: <20211130083202.14228-1-xiangsheng.hou@mediatek.com>
 <20211130083202.14228-4-xiangsheng.hou@mediatek.com>
 <20211209112030.5cdcd07c@xps13>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211210_010940_824899_FE73590C 
X-CRM114-Status: GOOD (  13.04  )
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

Hi Miquel,

On Thu, 2021-12-09 at 11:20 +0100, Miquel Raynal wrote:
> Hi Xiangsheng,
> 
> xiangsheng.hou@mediatek.com wrote on Tue, 30 Nov 2021 16:32:00 +0800:
> 
> > 
> > +
> > +static int mtk_snfi_config(struct nand_device *nand,
> > +			   struct mtk_snfi *snfi)
> > +{
> > +	struct mtk_ecc_engine *eng = mtk_snfi_to_ecc_engine(snfi);
> > +	u32 val;
> > +
> > +	switch (nanddev_page_size(nand)) {
> > +	case 512:
> > +		val = PAGEFMT_512_2K | PAGEFMT_SEC_SEL_512;
> > +		break;
> > +	case KB(2):
> > +		if (eng->section_size == 512)
> > +			val = PAGEFMT_2K_4K | PAGEFMT_SEC_SEL_512;
> > +		else
> > +			val = PAGEFMT_512_2K;
> > +		break;
> > +	case KB(4):
> > +		if (eng->section_size == 512)
> > +			val = PAGEFMT_4K_8K | PAGEFMT_SEC_SEL_512;
> > +		else
> > +			val = PAGEFMT_2K_4K;
> > +		break;
> > +	case KB(8):
> > +		if (eng->section_size == 512)
> > +			val = PAGEFMT_8K_16K | PAGEFMT_SEC_SEL_512;
> > +		else
> > +			val = PAGEFMT_4K_8K;
> > +		break;
> > +	case KB(16):
> > +		val = PAGEFMT_8K_16K;
> > +		break;
> > +	default:
> > +		dev_err(snfi->dev, "invalid page len: %d\n",
> > +			nanddev_page_size(nand));
> > +		return -EINVAL;
> > +	}
> > +
> > +	val |= eng->oob_per_section_idx << PAGEFMT_SPARE_SHIFT;
> > +	val |= eng->oob_free << PAGEFMT_FDM_SHIFT;
> > +	val |= eng->oob_free_protected << PAGEFMT_FDM_ECC_SHIFT;
> > +	writel(val, snfi->regs + NFI_PAGEFMT);
> 
> Shouldn't this be calculated only once?

Yes, The mtk_snfi_config function can be only called in prepare_io_req
at the first time. I will add a variable to indicate config done or not
to avoid calculate repeatedly.

> 
> > +
> > +	return 0;
> > +}
> > +
> > +static int mtk_snfi_ecc_init_ctx(struct nand_device *nand)
> > +{
> > +	struct nand_ecc_engine_ops *ops = mtk_ecc_get_pipelined_ops();
> > +
> > +	return ops->init_ctx(nand);
> > +}
> > +
> > +static void mtk_snfi_ecc_cleanup_ctx(struct nand_device *nand)
> > +{
> > +	struct nand_ecc_engine_ops *ops = mtk_ecc_get_pipelined_ops();
> > +
> > +	ops->cleanup_ctx(nand);
> > +}
> > +
> > +static int mtk_snfi_ecc_prepare_io_req(struct nand_device *nand,
> > +				       struct nand_page_io_req *req)
> > +{
> > +	struct nand_ecc_engine_ops *ops = mtk_ecc_get_pipelined_ops();
> > +	struct mtk_snfi *snfi = mtk_nand_to_spi(nand);
> > +	int ret;
> > +
> > +	ret = mtk_snfi_config(nand, snfi);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return ops->prepare_io_req(nand, req);
> > +}
> > +
> > +static int mtk_snfi_ecc_finish_io_req(struct nand_device *nand,
> > +				      struct nand_page_io_req *req)
> > +{
> > +	struct nand_ecc_engine_ops *ops = mtk_ecc_get_pipelined_ops();
> > +	struct mtk_ecc_engine *eng = nand_to_ecc_ctx(nand);
> > +	struct mtk_snfi *snfi = mtk_nand_to_spi(nand);
> > +
> > +	if (req->mode != MTD_OPS_RAW)
> > +		eng->read_empty = readl(snfi->regs + NFI_STA) &
> > STA_EMP_PAGE;
> > +
> > +	return ops->finish_io_req(nand, req);
> > +}
> > +
> > +
> > +MODULE_LICENSE("GPL v2");
> > +MODULE_AUTHOR("Xiangsheng Hou <xiangsheng.hou@mediatek.com>");
> > +MODULE_DESCRIPTION("Mediatek SPI Nand Flash interface driver");
> 
> Otherwise looks good, I believe you can drop the RFC prefix now.
> 

I will prepare the formal patch and send for review after internal
review and test.

Thanks
Xiangsheng Hou
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
