Return-Path: <SRS0=6Wn1=P7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CECE8C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Nov 2021 08:44:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9619860FE7
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Nov 2021 08:44:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9619860FE7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z5cBe5pLt5LjWuMdTi+h14F2Rky4kCNZ5bshPPmJaac=; b=ulsz3O7VsLDY61
	u6oGv4zksrE2n4lXWKuM9Dgp8vmRN0sow+wG4NXa6bq2DgCk3OsYMl+B7KGor33s2Xwutrxk0w3JM
	wlq5LZ0bVEso4/jThzdZEQMaRBbsRBnpUR4xv+cng6poOmUifdvmL0ORvsY6U77NoP628dAoAUFYD
	jIpVO9DYfbOPFlHk2D/Bo9kWxDcFhrYNBVRmkfBsPX8jFzbhp5HGHx/IphJ1P0kZNM/2VbytOPPhT
	SyyYlVaE+N8dh8iUrBkYPCBKLkJP88I4wNq+PCxClVy9io/x9imIJpRL56Igo6SHsuwlL3QbR+651
	En3WDZEqYTlLbGguAprw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlSA0-009kkT-Sq; Fri, 12 Nov 2021 08:43:49 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlS9m-009khC-G7; Fri, 12 Nov 2021 08:43:36 +0000
X-UUID: 52106f2083a547f8a50f9dfb1282e0f4-20211112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=yKk7AU8Gefzovt6NdRBl98meIGyYqg2+rYjVjuowu/Q=; 
 b=miRQibFEh+uze/JvFxpHQwfVDRACqMUJQsA6OVWkTJy6OvQ06CzVzCfGZ0uj7sX77t+/DCtze0ZN3nbD+NSFZCHeCRAKsa1lUT0dLk74kapPlnd+VcZqwXI0qO4WGYnr7BHyAvtB87pVTa6U6eNRxcQrUUSOGnqj+AAMZBbRK6o=;
X-UUID: 52106f2083a547f8a50f9dfb1282e0f4-20211112
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <xiangsheng.hou@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1834580409; Fri, 12 Nov 2021 01:43:31 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 12 Nov 2021 00:40:27 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 12 Nov 2021 16:40:26 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 12 Nov 2021 16:40:25 +0800
Message-ID: <078bc8609bed11cc886178115fcd71ecb52518c7.camel@mediatek.com>
Subject: Re: [RFC,v3 3/5] spi: add Mediatek SPI Nand controller driver
From: xiangsheng.hou <xiangsheng.hou@mediatek.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: <broonie@kernel.org>, <benliang.zhao@mediatek.com>,
 <dandan.he@mediatek.com>, <guochun.mao@mediatek.com>,
 <bin.zhang@mediatek.com>, <sanny.chen@mediatek.com>,
 <mao.zhong@mediatek.com>, <yingjoe.chen@mediatek.com>, <donghunt@amazon.com>, 
 <rdlee@amazon.com>, <linux-mtd@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>
Date: Fri, 12 Nov 2021 16:40:24 +0800
In-Reply-To: <20211109124647.0a831b1e@xps13>
References: <20211022024021.14665-1-xiangsheng.hou@mediatek.com>
 <20211022024021.14665-4-xiangsheng.hou@mediatek.com>
 <20211109124647.0a831b1e@xps13>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211112_004334_580634_B446B705 
X-CRM114-Status: GOOD (  27.49  )
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

On Tue, 2021-11-09 at 12:46 +0100, Miquel Raynal wrote:
> Hi Xiangsheng,
> 
> xiangsheng.hou@mediatek.com wrote on Fri, 22 Oct 2021 10:40:19 +0800:
> 
> > This version the SPI driver cowork with MTK pipelined
> > HW ECC engine.
> > 
> > Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
> > ---
> > +
> > +static int mtk_snfi_ecc_init(struct nand_device *nand)
> > +{
> > +	struct nand_ecc_props *reqs = &nand->ecc.requirements;
> > +	struct nand_ecc_props *user = &nand->ecc.user_conf;
> > +	struct nand_ecc_props *conf = &nand->ecc.ctx.conf;
> > +	struct mtk_snfi *snfi = mtk_nand_to_spi(nand);
> > +	struct mtk_ecc_engine *eng;
> > +	u32 spare, idx;
> > +	int ret;
> > +
> > +	eng = kzalloc(sizeof(*eng), GFP_KERNEL);
> > +	if (!eng)
> > +		return -ENOMEM;
> > +
> > +	nand->ecc.ctx.priv = eng;
> > +	nand->ecc.engine->priv = eng;
> > +
> > +	/* Configure the correction depending on the NAND device
> > topology */
> > +	if (user->step_size && user->strength) {
> > +		conf->step_size = user->step_size;
> > +		conf->strength = user->strength;
> > +	} else if (reqs->step_size && reqs->strength) {
> > +		conf->step_size = reqs->step_size;
> > +		conf->strength = reqs->strength;
> > +	}
> > +
> > +	/*
> > +	 * align eccstrength and eccsize.
> > +	 * The MTK HW ECC engine only support 512 and 1024 eccsize.
> > +	 */
> > +	if (conf->step_size < 1024) {
> > +		if (nand->memorg.pagesize > 512 &&
> > +			    snfi->caps->max_sector_size > 512) {
> > +			conf->step_size = 1024;
> > +			conf->strength <<= 1;
> > +		} else {
> > +			conf->step_size = 512;
> > +		}
> > +	} else {
> > +		conf->step_size = 1024;
> > +	}
> > +
> > +	ret = mtk_snfi_set_spare_per_sector(nand, snfi, &spare, &idx);
> > +
> > +	/* These will be used by the snfi driver */
> > +	snfi->ecc.page_size = nand->memorg.pagesize;
> > +	snfi->ecc.spare_per_sector = spare;
> > +	snfi->ecc.spare_idx = idx;
> > +	snfi->ecc.sectors = nand->memorg.pagesize / conf->step_size;
> > +
> > +	/* These will be used by HW ECC engine */
> > +	eng->oob_per_sector = spare;
> > +	eng->nsteps = snfi->ecc.sectors;
> 
> I believe most of this function should move into mtk_ecc.c.

I'm also confused about this when coding.
Obviously, most of the code logic belong to the ecc driver.

However, some ecc related parameter have to config at the snfi
controller register, such as sector size, available oob bytes for each
sector used to calculate ecc level. The are all attribute defined at
the snfi controller register.

How about I move these code logic, sector size and useable spare size
for each sector which belog to the snfi controller attribute to the ecc
driver, parse and config when mtk_snfi_ecc_prepare_io_req in the snfi
driver?

> 
> > +
> > +	return ret;
> > +}
> > +
> > +static int mtk_snfi_ecc_init_ctx(struct nand_device *nand)
> > +{
> > +	struct nand_ecc_engine_ops *ops = mtk_ecc_get_pipelined_ops();
> > +	int ret;
> > +
> > +	ret = mtk_snfi_ecc_init(nand);
> > +	if (ret) {
> > +		pr_info("mtk snfi ecc init fail!\n");
> > +		return ret;
> > +	}
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
> > +static int mtk_snfi_prepare_for_ecc(struct nand_device *nand,
> > +					struct mtk_snfi *snfi)
> > +{
> > +	struct nand_ecc_props *conf = &nand->ecc.ctx.conf;
> > +	struct mtk_ecc_engine *eng = nand->ecc.ctx.priv;
> > +	u32 val;
> > +
> > +	switch (nand->memorg.pagesize) {
> > +	case 512:
> > +		val = PAGEFMT_512_2K | PAGEFMT_SEC_SEL_512;
> > +		break;
> > +	case KB(2):
> > +		if (conf->step_size == 512)
> > +			val = PAGEFMT_2K_4K | PAGEFMT_SEC_SEL_512;
> > +		else
> > +			val = PAGEFMT_512_2K;
> > +		break;
> > +	case KB(4):
> > +		if (conf->step_size == 512)
> > +			val = PAGEFMT_4K_8K | PAGEFMT_SEC_SEL_512;
> > +		else
> > +			val = PAGEFMT_2K_4K;
> > +		break;
> > +	case KB(8):
> > +		if (conf->step_size == 512)
> > +			val = PAGEFMT_8K_16K | PAGEFMT_SEC_SEL_512;
> > +		else
> > +			val = PAGEFMT_4K_8K;
> > +		break;
> > +	case KB(16):
> > +		val = PAGEFMT_8K_16K;
> > +		break;
> > +	default:
> > +		dev_err(snfi->dev, "invalid page len: %d\n",
> > +				nand->memorg.pagesize);
> > +		return -EINVAL;
> > +	}
> > +
> > +	snfi->fdm_size = eng->fdm_size;
> > +	snfi->fdm_ecc_size = eng->fdm_ecc_size;
> > +
> > +	val |= snfi->ecc.spare_idx << PAGEFMT_SPARE_SHIFT;
> > +	val |= snfi->fdm_size << PAGEFMT_FDM_SHIFT;
> > +	val |= snfi->fdm_ecc_size << PAGEFMT_FDM_ECC_SHIFT;
> > +	writel(val, snfi->regs + NFI_PAGEFMT);
> > +
> > +	return 0;
> > +}
> > +
> > +static int mtk_snfi_ecc_prepare_io_req(struct nand_device *nand,
> > +						struct nand_page_io_req
> > *req)
> > +{
> > +	struct nand_ecc_engine_ops *ops = mtk_ecc_get_pipelined_ops();
> > +	struct mtk_snfi *snfi = mtk_nand_to_spi(nand);
> > +	int ret;
> > +
> > +	snfi->ecc.enabled = (req->mode != MTD_OPS_RAW);
> 
> Shouldn't you check ecc.enabled before calling prepare_for_ecc ?

The funcion name may make you confused.
Actually, the prepare_for_ecc function did not include any logic about
ecc enable or not.Only config pagesize/sparesize/sector size to snfi
controller register.

I will modify the function name mtk_snfi_prepare_for_ecc,
mtk_snfi_config for example.

> 
> > +	ret = mtk_snfi_prepare_for_ecc(nand, snfi);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return ops->prepare_io_req(nand, req);
> > +}
> > +
> > +static int mtk_snfi_ecc_finish_io_req(struct nand_device *nand,
> > +						struct nand_page_io_req
> > *req)
> > +{
> > +	struct nand_ecc_engine_ops *ops = mtk_ecc_get_pipelined_ops();
> > +	struct mtk_ecc_engine *eng = nand->ecc.ctx.priv;
> > +	struct mtk_snfi *snfi = mtk_nand_to_spi(nand);
> > +
> > +	if (snfi->ecc.enabled) {
> 
> I am currently looking at a better way of keeping this
> information, while being safer against concurrent accesses. So
> far parallel operations are not supported so this is safe, but
> we might improve the core in a little while and I don't want
> this to be an issue. My next iteration on the Macronix engine will
> solve this.
> 
Look forward to the next interation.

Thanks
Xiangsheng Hou
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
