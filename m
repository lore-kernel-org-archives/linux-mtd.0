Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E115CC433FE
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Dec 2021 09:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JHhLN2Oy3WZTW7MZqtfKkNZE8qyjVhXXKL+/QYQL20A=; b=t16iXXrdA6GLqq
	yXYc2jzP1RAYxej0dVkLm2jCn3zPsx+v10h5Tlwn6806u2GusT/LnwUH9NE43jPDDZHiWhuY5G9RP
	964kyi5o7jRThcHsC9KtaSeHebX2vslntPiz2ctowoy7wcakONelaCb9FuxZ+ImLaCMEc8LSx2D4I
	HLdfRO+xHojiSs4r/s0MQOA+RRx+CeZIf2nG+M9onu+rOetngSV8mftgRqOJZvivtrXbp4wK08tB5
	6RyKhB7HDP9AI1qX9KyD7oN/oqqiOsHguqdvD85/dox4nyvInZneSPrckqvW2Krn/j4Hx9qWljdGK
	MVc/cWsvo9lllLoy1xTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvc3n-001Jfi-Cx; Fri, 10 Dec 2021 09:19:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvc3k-001JdA-Ii; Fri, 10 Dec 2021 09:19:22 +0000
X-UUID: 16d7d3ff98b649af9efbde79a6b5cad7-20211210
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=6QPjyXKckREV0ued4bLC0mtS11qgzy7OleCm5Yz/Tlg=; 
 b=eiTYAWWNyKYlEST6XRaoGBNKV/l/Nt32OE8FtqiUd37CW7JQoxsC6KdrWlN8gSrSzbfCObxOaA5tC6bXQOijLY75ppwLnab7STpDR/D4dvSyq+ye1nkcRzq1QJCefpQmxm5ZZBstVXpQo3jq/vLCjLnP6NDQhe6WqcW1U1dk4sY=;
X-UUID: 16d7d3ff98b649af9efbde79a6b5cad7-20211210
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <xiangsheng.hou@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1797585839; Fri, 10 Dec 2021 02:19:17 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Dec 2021 01:09:16 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 10 Dec 2021 17:09:14 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 10 Dec 2021 17:09:13 +0800
Message-ID: <c7367dccd7b159ed36fd7d19fef25b0df8c5782d.camel@mediatek.com>
Subject: Re: [RFC,v4,2/5] mtd: nand: ecc: mtk: Convert to the ECC
 infrastructure
From: xiangsheng.hou <xiangsheng.hou@mediatek.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: <broonie@kernel.org>, <benliang.zhao@mediatek.com>,
 <dandan.he@mediatek.com>, <guochun.mao@mediatek.com>,
 <bin.zhang@mediatek.com>, <sanny.chen@mediatek.com>,
 <mao.zhong@mediatek.com>, <yingjoe.chen@mediatek.com>, <donghunt@amazon.com>, 
 <rdlee@amazon.com>, <linux-mtd@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>
Date: Fri, 10 Dec 2021 17:09:14 +0800
In-Reply-To: <20211209113209.71fe8ea7@xps13>
References: <20211130083202.14228-1-xiangsheng.hou@mediatek.com>
 <20211130083202.14228-3-xiangsheng.hou@mediatek.com>
 <20211209113209.71fe8ea7@xps13>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211210_011920_674517_596820B8 
X-CRM114-Status: GOOD (  32.08  )
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

On Thu, 2021-12-09 at 11:32 +0100, Miquel Raynal wrote:
> Hi Xiangsheng,
> 
> xiangsheng.hou@mediatek.com wrote on Tue, 30 Nov 2021 16:31:59 +0800:
> 
> > 
> > +static void mtk_ecc_no_bbm_swap(struct nand_device *a, u8 *b, u8
> > *c)
> > +{
> > +	/* nop */
> 
> Is this really useful?

For 512 bytes page size, it is no need to do BBM swap due to the ECC
engine step size will be 512 bytes.

However, there have 512 bytes SLC NAND page size in history, although
have not seen such SPI/Parallel NAND device for now.

Do you think there no need to consider this small page device?

> 
> > +}
> > +
> > +static void mtk_ecc_bbm_swap(struct nand_device *nand, u8
> > *databuf, u8 *oobbuf)
> > +{
> > +	struct mtk_ecc_engine *eng = nand_to_ecc_ctx(nand);
> > +	int step_size = nand->ecc.ctx.conf.step_size;
> > +	u32 bbm_pos = eng->bbm_ctl.position;
> > +
> > +	bbm_pos += eng->bbm_ctl.section * step_size;
> > +
> > +	swap(oobbuf[0], databuf[bbm_pos]);
> > +}
> > +
> > +static void mtk_ecc_set_bbm_ctl(struct mtk_ecc_bbm_ctl *bbm_ctl,
> > +				struct nand_device *nand)
> > +{
> > +	if (nanddev_page_size(nand) == 512) {
> > +		bbm_ctl->bbm_swap = mtk_ecc_no_bbm_swap;
> > +	} else {
> > +		bbm_ctl->bbm_swap = mtk_ecc_bbm_swap;
> > +		bbm_ctl->section = nanddev_page_size(nand) /
> > +				   mtk_ecc_data_len(nand);
> > +		bbm_ctl->position = nanddev_page_size(nand) %
> > +				    mtk_ecc_data_len(nand);
> > +	}
> > +}
> > 
> > +
> > +static struct device *mtk_ecc_get_engine_dev(struct device *dev)
> > +{
> > +	struct platform_device *eccpdev;
> > +	struct device_node *np;
> > +
> > +	/*
> > +	 * The device node is only the host controller,
> > +	 * not the actual ECC engine when pipelined case.
> > +	 */
> > +	np = of_parse_phandle(dev->of_node, "nand-ecc-engine", 0);
> > +	if (!np)
> > +		return NULL;
> > +
> > +	eccpdev = of_find_device_by_node(np);
> > +	if (!eccpdev) {
> > +		of_node_put(np);
> > +		return NULL;
> > +	}
> > +
> > +	platform_device_put(eccpdev);
> > +	of_node_put(np);
> > +
> > +	return &eccpdev->dev;
> > +}
> 
> As this will be the exact same function for all the pipelined
> engines,
> I am tempted to put this in the core. I'll soon send a iteration,
> stay
> tuned.
> 

Look forward to the function.

> > +/*
> > + * mtk_ecc_data_format() - Convert to/from MTK ECC on-flash data
> > format
> > + *
> > + * MTK ECC engine organize page data by section, the on-flash
> > format as bellow:
> > + * ||          section 0         ||          section 1          ||
> > ...
> > + * || data | OOB free | OOB ECC || data || OOB free | OOB ECC ||
> > ...
> > + *
> > + * Terefore, it`s necessary to convert data when reading/writing
> > in raw mode.
> > + */
> > +static void mtk_ecc_data_format(struct nand_device *nand,
> 
> mtk_ecc_reorganize_data_layout()?

Will be changed.

> 
> > +				struct nand_page_io_req *req)
> > +{
> > +	struct mtk_ecc_engine *eng = nand_to_ecc_ctx(nand);
> > +	int step_size = nand->ecc.ctx.conf.step_size;
> > +	void *databuf, *oobbuf;
> > +	int i;
> > +
> > +	if (req->type == NAND_PAGE_WRITE) {
> > +		databuf = (void *)req->databuf.out;
> > +		oobbuf = (void *)req->oobbuf.out;
> > +
> > +		/*
> > +		 * Convert the source databuf and oobbuf to MTK ECC
> > +		 * on-flash data format.
> > +		 */
> > +		for (i = 0; i < eng->nsteps; i++) {
> > +			if (i == eng->bbm_ctl.section)
> > +				eng->bbm_ctl.bbm_swap(nand,
> > +						      databuf, oobbuf);
> 
> Do you really need this swap? Isn't the overall move enough to put
> the
> BBM at the right place?
> 

For OPS_RAW mode, need organize flash data in the MTK ECC engine data
format. Other operation in this function only organize data by section
and not include BBM swap.

For other mode, this function will not be called.

> > +			memcpy(mtk_ecc_section_ptr(nand, i),
> > +			       databuf + mtk_ecc_data_off(nand, i),
> > +			       step_size);
> > +
> > +			memcpy(mtk_ecc_oob_free_ptr(nand, i),
> > +			       oobbuf + mtk_ecc_oob_free_position(nand,
> > i),
> > +			       eng->oob_free);
> > +
> > +			memcpy(mtk_ecc_oob_free_ptr(nand, i) + eng-
> > >oob_free,
> > +			       oobbuf + eng->oob_free * eng->nsteps +
> > +			       i * eng->oob_ecc,
> > +			       eng->oob_ecc);
> > +		}
> > +
> > +		req->databuf.out = eng->bounce_page_buf;
> > +		req->oobbuf.out = eng->bounce_oob_buf;
> > +	} else {
> > +		databuf = req->databuf.in;
> > +		oobbuf = req->oobbuf.in;
> > +
> > +		/*
> > +		 * Convert the on-flash MTK ECC data format to
> > +		 * destination databuf and oobbuf.
> > +		 */
> > +		memcpy(eng->bounce_page_buf, databuf,
> > +		       nanddev_page_size(nand));
> > +		memcpy(eng->bounce_oob_buf, oobbuf,
> > +		       nanddev_per_page_oobsize(nand));
> > +
> > +		for (i = 0; i < eng->nsteps; i++) {
> > +			memcpy(databuf + mtk_ecc_data_off(nand, i),
> > +			       mtk_ecc_section_ptr(nand, i),
> > step_size);
> > +
> > +			memcpy(oobbuf + mtk_ecc_oob_free_position(nand,
> > i),
> > +			       mtk_ecc_section_ptr(nand, i) +
> > step_size,
> > +			       eng->oob_free);
> > +
> > +			memcpy(oobbuf + eng->oob_free * eng->nsteps +
> > +			       i * eng->oob_ecc,
> > +			       mtk_ecc_section_ptr(nand, i) + step_size
> > +			       + eng->oob_free,
> > +			       eng->oob_ecc);
> > +
> > +			if (i == eng->bbm_ctl.section)
> > +				eng->bbm_ctl.bbm_swap(nand,
> > +						      databuf, oobbuf);
> > +		}
> > +	}
> > +}
> > +
> > 
> > 
> > +/**
> > + * struct mtk_ecc_engine - Information relative to the ECC
> > + * @req_ctx: Save request context and tweak the original request
> > to fit the
> > + *           engine needs
> > + * @oob_per_section: OOB size for each section to store OOB
> > free/ECC bytes
> > + * @oob_per_section_idx: The index for @oob_per_section in spare
> > size array
> > + * @oob_ecc: OOB size for each section to store the ECC parity
> > + * @oob_free: OOB size for each section to store the OOB free
> > bytes
> > + * @oob_free_protected: OOB free bytes will be protected by the
> > ECC engine
> > + * @section_size: The size of each section
> > + * @read_empty: Indicate whether empty page for one read operation
> > + * @nsteps: The number of the sections
> > + * @src_page_buf: Buffer used to store source data buffer when
> > write
> > + * @src_oob_buf: Buffer used to store source OOB buffer when write
> > + * @bounce_page_buf: Data bounce buffer
> > + * @bounce_oob_buf: OOB bounce buffer
> > + * @ecc: The ECC engine private data structure
> > + * @ecc_cfg: The configuration of each ECC operation
> > + * @bbm_ctl: Information relative to the BBM swap
> > + */
> > +struct mtk_ecc_engine {
> > +	struct nand_ecc_req_tweak_ctx req_ctx;
> > +
> > +	u32 oob_per_section;
> > +	u32 oob_per_section_idx;
> > +	u32 oob_ecc;
> > +	u32 oob_free;
> > +	u32 oob_free_protected;
> > +	u32 section_size;
> > +
> > +	bool read_empty;
> > +	u32 nsteps;
> > +
> > +	u8 *src_page_buf;
> > +	u8 *src_oob_buf;
> > +	u8 *bounce_page_buf;
> > +	u8 *bounce_oob_buf;
> > +
> > +	struct mtk_ecc *ecc;
> > +	struct mtk_ecc_config ecc_cfg;
> > +	struct mtk_ecc_bbm_ctl bbm_ctl;
> > +};
> 
> This and above should not be exported and be located in the driver.
> 

I will fix this.

Thanks
Xiangsheng Hou
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
