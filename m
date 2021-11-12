Return-Path: <SRS0=6Wn1=P7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC92AC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Nov 2021 08:45:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66F4C61002
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Nov 2021 08:45:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 66F4C61002
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QjCIbfpuBwySePk5eKd1YJPkw5YlZR28f7t+imz6uDg=; b=KxlwbseXeYTEm0
	Cb/eiFZ6rRxbOD7eKEGgbPWW1CB8LHXcpJFKqUoszGp/zu0GCcnJgtEmbKGTx40s6oLOStPK4Goyb
	N9wF1l2yrdd99B+G17StQ74Vw3JkmQnXLtSorsWQK9RGpF48TPABIA0cgZ6VJ9Z9+HiCoJx+DcekR
	EUnEyGDWj+39nEcewDUzZPlq4M4vioY1W+z992LD1Pu7/HpjKcW4lhl1ER+1s5zbVyCOMFJxKbb+o
	hto409JmRxAkQO8uMSJX0ERJxtDwVWChWHdJ58qZpGbWNB5z+xwAEuhHCcJ2vNPftvAp9jYJsWEuR
	nA3X3GyOtVyHu+/4itnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlSBc-009l6w-FQ; Fri, 12 Nov 2021 08:45:28 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlSA3-009klB-Es; Fri, 12 Nov 2021 08:43:53 +0000
X-UUID: 7294d6e910ac45d9ae01b3754da15e4c-20211112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Uu6zsuWyCW5aIsE3yll6Z0p3x97ouJTNWDLeZBzwb9o=; 
 b=gUEwgOOGSu9mF1EbNLYE9lASJSo0oezGgGyJYut9LFq0j/PRr0Ex3BvRA2BgzI0RJswY97VR4JMN1PdGjTwrJEGfruHHoM/rxcnGLIroxm9ERDxk8L2gR6lSRt2yeY0U2chXtqkw60+Zn9q44nR64Ks5H+zwcjx/N6T4UGMMWHE=;
X-UUID: 7294d6e910ac45d9ae01b3754da15e4c-20211112
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <xiangsheng.hou@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1065003606; Fri, 12 Nov 2021 01:43:50 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 12 Nov 2021 00:40:06 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 12 Nov 2021 16:40:05 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 12 Nov 2021 16:40:04 +0800
Message-ID: <3cef133445bf7eea64c7e3aea180a28abbaae638.camel@mediatek.com>
Subject: Re: [RFC,v3 2/5] mtd: ecc: realize Mediatek HW ECC driver
From: xiangsheng.hou <xiangsheng.hou@mediatek.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: <broonie@kernel.org>, <benliang.zhao@mediatek.com>,
 <dandan.he@mediatek.com>, <guochun.mao@mediatek.com>,
 <bin.zhang@mediatek.com>, <sanny.chen@mediatek.com>,
 <mao.zhong@mediatek.com>, <yingjoe.chen@mediatek.com>, <donghunt@amazon.com>, 
 <rdlee@amazon.com>, <linux-mtd@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>
Date: Fri, 12 Nov 2021 16:40:04 +0800
In-Reply-To: <20211109131829.30a82ea4@xps13>
References: <20211022024021.14665-1-xiangsheng.hou@mediatek.com>
 <20211022024021.14665-3-xiangsheng.hou@mediatek.com>
 <20211109131829.30a82ea4@xps13>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211112_004351_588484_26D9869A 
X-CRM114-Status: GOOD (  35.81  )
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

On Tue, 2021-11-09 at 13:18 +0100, Miquel Raynal wrote:
> Hi Xiangsheng,
> 
> xiangsheng.hou@mediatek.com wrote on Fri, 22 Oct 2021 10:40:18 +0800:
> 
> > The v3 driver realize Mediatek HW ECC engine with pipelined
> > case.
> 
> v3 driver? I guess you are talking about the hardware?
> 

Just standard for the RFC v3 patch.

> I don't think 'realize' makes much sense here. Perhaps the title
> could
> be:
> "mtd: ecc: mtk: Convert to the ECC infrastructure
> 

I will fix it at next iteration.

> > 
> > Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
> > ---
> >  drivers/mtd/nand/core.c     |  10 +-
> >  drivers/mtd/nand/ecc.c      |  88 +++++++
> >  drivers/mtd/nand/mtk_ecc.c  | 488
> > ++++++++++++++++++++++++++++++++++++
> >  include/linux/mtd/mtk_ecc.h |  38 +++
> >  include/linux/mtd/nand.h    |  11 +
> >  5 files changed, 632 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/mtd/nand/core.c b/drivers/mtd/nand/core.c
> > index 5e13a03d2b32..b228b4d13b7a 100644
> > --- a/drivers/mtd/nand/core.c
> > +++ b/drivers/mtd/nand/core.c
> > @@ -232,7 +232,9 @@ static int nanddev_get_ecc_engine(struct
> > nand_device *nand)
> >  		nand->ecc.engine = nand_ecc_get_on_die_hw_engine(nand);
> >  		break;
> >  	case NAND_ECC_ENGINE_TYPE_ON_HOST:
> > -		pr_err("On-host hardware ECC engines not supported
> > yet\n");
> > +		nand->ecc.engine =
> > nand_ecc_get_on_host_hw_engine(nand);
> > +		if (PTR_ERR(nand->ecc.engine) == -EPROBE_DEFER)
> > +			return -EPROBE_DEFER;
> 
> Please base your series on top of my previous work (even if not 100%
> stable yet) to avoid leaking core changes here. They already exist,
> no
> need to duplicate them.

Will be remoed in next iteration.

> > +static int mt7986_ecc_regs[] = {
> > +	[ECC_ENCPAR00] =        0x300,
> > +	[ECC_ENCIRQ_EN] =       0x80,
> > +	[ECC_ENCIRQ_STA] =      0x84,
> > +	[ECC_DECDONE] =         0x124,
> > +	[ECC_DECIRQ_EN] =       0x200,
> > +	[ECC_DECIRQ_STA] =      0x204,
> > +};
> > +
> >  static inline void mtk_ecc_wait_idle(struct mtk_ecc *ecc,
> >  				     enum mtk_ecc_operation op)
> >  {
> > @@ -447,6 +464,464 @@ unsigned int mtk_ecc_get_parity_bits(struct
> > mtk_ecc *ecc)
> >  }
> >  EXPORT_SYMBOL(mtk_ecc_get_parity_bits);
> >  
> > +static inline int data_off(struct nand_device *nand, int i)
> 
> Please always prefix all your helpers with mtk_ecc_
> 
> > +{
> > +	int eccsize = nand->ecc.ctx.conf.step_size;
> > +
> > +	return i * eccsize;
> > +}
> > +
> > +static inline int fdm_off(struct nand_device *nand, int i)
> 
> What is fdm?

As talked in the set/get OOB bytes series, fdm stand for flash disk
management data. It`s OOB bytes besides the ecc parity in each sector
OOB area. That is free OOB bytes and the BBM.

> 
> > +{
> > +	struct mtk_ecc_engine *eng = nand->ecc.ctx.priv;
> > +	int poi;
> > +
> > +	if (i < eng->bad_mark.sec)
> 
> sec does not mean anything to me

sec standard for sector since mtk ECC engine organize data as sector in
unit. And there have BBM swap operation in ecc driver to ensure BBM
position consistent with nand specification. Please refer to the
set/get oob series.

> 
> > +		poi = (i + 1) * eng->fdm_size;
> > +	else if (i == eng->bad_mark.sec)
> > +		poi = 0;
> > +	else
> > +		poi = i * eng->fdm_size;
> > +
> > +	return poi;
> > +}
> > +
> > +static inline int mtk_ecc_data_len(struct nand_device *nand)
> > +{
> > +	struct mtk_ecc_engine *eng = nand->ecc.ctx.priv;
> > +	int eccsize = nand->ecc.ctx.conf.step_size;
> > +	int eccbytes = eng->oob_ecc;
> > +
> > +	return eccsize + eng->fdm_size + eccbytes;
> > +}
> > +
> > +static inline u8 *mtk_ecc_sec_ptr(struct nand_device *nand,  int
> > i)
> > +{
> > +	struct mtk_ecc_engine *eng = nand->ecc.ctx.priv;
> > +
> > +	return eng->page_buf + i * mtk_ecc_data_len(nand);
> > +}
> > +
> > +static inline u8 *mtk_ecc_fdm_ptr(struct nand_device *nand, int i)
> > +{
> > +	struct mtk_ecc_engine *eng = nand->ecc.ctx.priv;
> > +	int eccsize = nand->ecc.ctx.conf.step_size;
> > +
> > +	return eng->page_buf + i * mtk_ecc_data_len(nand) + eccsize;
> > +}
> > +
> > +static void mtk_ecc_no_bad_mark_swap(struct nand_device *a, u8 *b,
> > +							u8 *c)
> > +{
> > +	/* nop */
> > +}
> > +
> > +static void mtk_ecc_bad_mark_swap(struct nand_device *nand, u8
> > *databuf,
> > +							u8 *oobbuf)
> > +{
> > +	struct mtk_ecc_engine *eng = nand->ecc.ctx.priv;
> > +	int step_size = nand->ecc.ctx.conf.step_size;
> > +	u32 bad_pos = eng->bad_mark.pos;
> > +
> > +	bad_pos += eng->bad_mark.sec * step_size;
> > +
> > +	swap(oobbuf[0], databuf[bad_pos]);
> 
> please change "bad" or "bad mark" by "bbm" which is the name used
> everywhere else in this subsystem.
> 

Will fix these at next iteration.

> > +}
> > +
> > +static void mtk_ecc_set_bad_mark_ctl(struct mtk_ecc_bad_mark_ctl
> > *bm_ctl,
> > +				     struct mtd_info *mtd)
> > +{
> > +	struct nand_device *nand = mtd_to_nanddev(mtd);
> > +
> > +	if (mtd->writesize == 512) {
> > +		bm_ctl->bm_swap = mtk_ecc_no_bad_mark_swap;
> > +	} else {
> > +		bm_ctl->bm_swap = mtk_ecc_bad_mark_swap;
> > +		bm_ctl->sec = mtd->writesize / mtk_ecc_data_len(nand);
> > +		bm_ctl->pos = mtd->writesize % mtk_ecc_data_len(nand);
> 
> sec? pos? what does this mean?

sec stand for sector and pos stand for position.

mtk_ecc_set_bad_mark_ctl function is the logic to calculate the BBM
swap at which sector and the position in the sector.

> > + *
> > + * Mediatek HW ECC engine organize data/oob free/oob ecc by
> > sector,
> > + * the data format for one page as bellow:
> > + * ||          sector 0         ||          sector 1         ||
> > ...
> > + * || data |   fdm    | oob ecc || data ||   fdm   | oob ecc ||
> > ...
> > + *
> > + * Terefore, it`s necessary to covert data when read/write in
> > MTD_OPS_RAW.
> 
> it is ... convert ... reading/writing in raw mode.
> 
> > + * These data include bad mark, sector data, fdm data and oob ecc.
> > + */
> > +static void mtk_ecc_data_format(struct nand_device *nand,
> > +			u8 *databuf, u8 *oobbuf, bool write)
> > +{
> > +	struct mtk_ecc_engine *eng = nand->ecc.ctx.priv;
> > +	int step_size = nand->ecc.ctx.conf.step_size;
> > +	int i;
> > +
> > +	if (write) {
> > +		for (i = 0; i < eng->nsteps; i++) {
> > +			if (i == eng->bad_mark.sec)
> > +				eng->bad_mark.bm_swap(nand,
> > +						databuf, oobbuf);
> > +			memcpy(mtk_ecc_sec_ptr(nand, i),
> > +				   databuf + data_off(nand, i),
> > step_size);
> > +
> > +			memcpy(mtk_ecc_fdm_ptr(nand, i),
> > +				   oobbuf + fdm_off(nand, i),
> > +				   eng->fdm_size);
> > +
> > +			memcpy(mtk_ecc_fdm_ptr(nand, i) + eng-
> > >fdm_size,
> > +				   oobbuf + eng->fdm_size * eng->nsteps 
> > +
> > +				   i * eng->oob_ecc,
> > +				   eng->oob_ecc);
> > +
> > +			/* swap back when write */
> > +			if (i == eng->bad_mark.sec)
> > +				eng->bad_mark.bm_swap(nand,
> > +						databuf, oobbuf);
> > +		}
> > +	} else {
> > +		for (i = 0; i < eng->nsteps; i++) {
> > +			memcpy(databuf + data_off(nand, i),
> > +				   mtk_ecc_sec_ptr(nand, i),
> > step_size);
> > +
> > +			memcpy(oobbuf + fdm_off(nand, i),
> > +				   mtk_ecc_sec_ptr(nand, i) +
> > step_size,
> > +				   eng->fdm_size);
> > +
> > +			memcpy(oobbuf + eng->fdm_size * eng->nsteps +
> > +				   i * eng->oob_ecc,
> > +				   mtk_ecc_sec_ptr(nand, i) + step_size
> > +				   + eng->fdm_size,
> > +				   eng->oob_ecc);
> > +
> > +			if (i == eng->bad_mark.sec)
> > +				eng->bad_mark.bm_swap(nand,
> > +						databuf, oobbuf);
> > +		}
> > +	}
> > +}
> > +
> > +static void mtk_ecc_fdm_shift(struct nand_device *nand,
> > +				u8 *dst_buf, u8 *src_buf)
> > +{
> > +	struct mtk_ecc_engine *eng = nand->ecc.ctx.priv;
> > +	u8 *poi;
> > +	int i;
> > +
> > +	for (i = 0; i < eng->nsteps; i++) {
> > +		if (i < eng->bad_mark.sec)
> > +			poi = src_buf + (i + 1) * eng->fdm_size;
> > +		else if (i == eng->bad_mark.sec)
> > +			poi = src_buf;
> > +		else
> > +			poi = src_buf + i * eng->fdm_size;
> > +
> > +		memcpy(dst_buf + i * eng->fdm_size, poi, eng-
> > >fdm_size);
> > +	}
> > +}
> > +
> > +int mtk_ecc_prepare_io_req_pipelined(struct nand_device *nand,
> > +					  struct nand_page_io_req *req)
> > +{
> > +	struct mtk_ecc_engine *eng = nand->ecc.ctx.priv;
> > +	struct mtd_info *mtd = nanddev_to_mtd(nand);
> > +	u8 *buf = eng->page_buf;
> > +
> > +	nand_ecc_tweak_req(&eng->req_ctx, req);
> > +
> > +	if (req->mode == MTD_OPS_RAW) {
> > +		if (req->type == NAND_PAGE_WRITE) {
> > +			/* change data/oob buf to MTK HW ECC data
> > format */
> > +			mtk_ecc_data_format(nand, req->databuf.in,
> > +					req->oobbuf.in, true);
> > +			req->databuf.out = buf;
> > +			req->oobbuf.out = buf + nand->memorg.pagesize;
> > +		}
> > +	} else {
> > +		eng->ecc_cfg.op = ECC_DECODE;
> > +		if (req->type == NAND_PAGE_WRITE) {
> > +			memset(eng->oob_buf, 0xff, nand-
> > >memorg.oobsize);
> > +			mtd_ooblayout_set_databytes(mtd, req-
> > >oobbuf.out,
> > +							eng->oob_buf,
> > +							req->ooboffs,
> > +							mtd->oobavail);
> > +			eng->bad_mark.bm_swap(nand,
> > +						req->databuf.in, eng-
> > >oob_buf);
> > +			mtk_ecc_fdm_shift(nand, req->oobbuf.in,
> > +						eng->oob_buf);
> > +
> > +			eng->ecc_cfg.op = ECC_ENCODE;
> > +		}
> > +
> > +		eng->ecc_cfg.mode = ECC_NFI_MODE;
> > +		eng->ecc_cfg.sectors = eng->nsteps;
> > +		return mtk_ecc_enable(eng->ecc, &eng->ecc_cfg);
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +int mtk_ecc_finish_io_req_pipelined(struct nand_device *nand,
> > +					  struct nand_page_io_req *req)
> > +{
> > +	struct mtk_ecc_engine *eng = nand->ecc.ctx.priv;
> > +	struct mtd_info *mtd = nanddev_to_mtd(nand);
> > +	struct mtk_ecc_stats stats;
> > +	u8 *buf = eng->page_buf;
> > +	int ret;
> > +
> > +	if (req->type == NAND_PAGE_WRITE) {
> > +		if (req->mode != MTD_OPS_RAW) {
> > +			mtk_ecc_disable(eng->ecc);
> > +			mtk_ecc_fdm_shift(nand, eng->oob_buf,
> > +					req->oobbuf.in);
> > +			eng->bad_mark.bm_swap(nand,
> > +					req->databuf.in, eng->oob_buf);
> > +		}
> > +		nand_ecc_restore_req(&eng->req_ctx, req);
> > +
> > +		return 0;
> > +	}
> > +
> > +	if (req->mode == MTD_OPS_RAW) {
> > +		memcpy(buf, req->databuf.in,
> > +			   nand->memorg.pagesize);
> > +		memcpy(buf + nand->memorg.pagesize,
> > +			   req->oobbuf.in, nand->memorg.oobsize);
> > +
> > +		/* change MTK HW ECC data format to data/oob buf */
> > +		mtk_ecc_data_format(nand, req->databuf.in,
> > +				req->oobbuf.in, false);
> > +		nand_ecc_restore_req(&eng->req_ctx, req);
> > +
> > +		return 0;
> > +	}
> > +
> > +	ret = mtk_ecc_wait_done(eng->ecc, ECC_DECODE);
> > +	if (ret)
> > +		return -ETIMEDOUT;
> 
>  You should go to an error path and disable the engine.
> > 

I Will fix this and other coding style issue at next iteration.

Thanks
Xiangsheng Hou
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
