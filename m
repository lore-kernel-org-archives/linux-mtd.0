Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9332C433EF
	for <linux-mtd@archiver.kernel.org>; Sat, 11 Dec 2021 03:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X56ij/RRN9qOo9wiKjD90H7JIYA4jRhTVlnJP1n0NCo=; b=kMdorGDSORJctB
	Nei3JiLiHHeI/BytXzzpWfDRy++jPaV5FyJcAano990sxHCK81jUKi1sc449uZdEkG34/6D/IPeHb
	pzt7erj0Keg29H1aBxs67p7YMLxysbfajzWDunuPun/5HvjCBnwNL2uofYDelfvonqf5wzx7U66qG
	51wUuw2Pgnx/AfWQZkuJs7W1IWonjiuc6nCBhLuGa4A68CEtjtg92eTlcNNRM+CD8FhpXKhtPWqTl
	hbwNOgwFCOcAKafBoKiLvo/2Pck1gPmu+VXa4AzyhOZ1RR2G9Mh7icZ0iVCrPNAfAP8qYO1pqnnZx
	24Y29yX5ekzwA/6CiI8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvt1K-004TqW-CA; Sat, 11 Dec 2021 03:25:58 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvt1F-004Tq0-34; Sat, 11 Dec 2021 03:25:56 +0000
X-UUID: 6310b6c423bc472e83d27e49a683ac1f-20211210
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=iOelVhCAc1UskNgsRqIsf7l1j9lvXLW9YXbQRHqI+Bc=; 
 b=CZ10CCCCrfi63nD6lajV7o/Q4//dSuDa/IoxNGJheRvIHfPkz7rRY+NyiKF12mOUWpRLwaOGWJw+gS7AfS4oA6c/LHDyqNsldR/vq+U4j1psVHrMvJxolVJBH5RIAP/PdLe4HAaoVjEL07+1vfuxsUywNoesziWp6FNlc1Ft5zg=;
X-UUID: 6310b6c423bc472e83d27e49a683ac1f-20211210
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <xiangsheng.hou@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2102472032; Fri, 10 Dec 2021 20:25:49 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Dec 2021 19:25:47 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Sat, 11 Dec 2021 11:25:45 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 11 Dec 2021 11:25:45 +0800
Message-ID: <4debdf60521d13a2ee54e65fa2f545040e74fed7.camel@mediatek.com>
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
Date: Sat, 11 Dec 2021 11:25:46 +0800
In-Reply-To: <20211210103426.0850d8d5@xps13>
References: <20211130083202.14228-1-xiangsheng.hou@mediatek.com>
 <20211130083202.14228-3-xiangsheng.hou@mediatek.com>
 <20211209113209.71fe8ea7@xps13>
 <c7367dccd7b159ed36fd7d19fef25b0df8c5782d.camel@mediatek.com>
 <20211210103426.0850d8d5@xps13>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211210_192554_574377_E2DD2975 
X-CRM114-Status: GOOD (  31.03  )
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

On Fri, 2021-12-10 at 10:34 +0100, Miquel Raynal wrote:
> Hello,
> 
> xiangsheng.hou@mediatek.com wrote on Fri, 10 Dec 2021 17:09:14 +0800:
> > 
> > > As this will be the exact same function for all the pipelined
> > > engines,
> > > I am tempted to put this in the core. I'll soon send a iteration,
> > > stay
> > > tuned.
> > >   
> > 
> > Look forward to the function.
> 
> I sent the new version yesterday but I
> * forgot to CC: you
> * forgot about that function as well
> 
> Let's ignore this comment for now, send your driver with the same
> function in it and I'll clean that up later.
> 
> Here is the new iteration, sorry for forgetting to send it to you as
> well:
> 
https://lore.kernel.org/linux-mtd/20211209174046.535229-1-miquel.raynal@bootlin.com/T/
> And here is a Github branch as well:
> https://github.com/miquelraynal/linux/tree/ecc-engine

Got it, Thanks.

> 
> > > > +				struct nand_page_io_req *req)
> > > > +{
> > > > +	struct mtk_ecc_engine *eng = nand_to_ecc_ctx(nand);
> > > > +	int step_size = nand->ecc.ctx.conf.step_size;
> > > > +	void *databuf, *oobbuf;
> > > > +	int i;
> > > > +
> > > > +	if (req->type == NAND_PAGE_WRITE) {
> > > > +		databuf = (void *)req->databuf.out;
> > > > +		oobbuf = (void *)req->oobbuf.out;
> > > > +
> > > > +		/*
> > > > +		 * Convert the source databuf and oobbuf to MTK
> > > > ECC
> > > > +		 * on-flash data format.
> > > > +		 */
> > > > +		for (i = 0; i < eng->nsteps; i++) {
> > > > +			if (i == eng->bbm_ctl.section)
> > > > +				eng->bbm_ctl.bbm_swap(nand,
> > > > +						      databuf,
> > > > oobbuf);  
> > > 
> > > Do you really need this swap? Isn't the overall move enough to
> > > put
> > > the
> > > BBM at the right place?
> > >   
> > 
> > For OPS_RAW mode, need organize flash data in the MTK ECC engine
> > data
> > format. Other operation in this function only organize data by
> > section
> > and not include BBM swap.
> > 
> > For other mode, this function will not be called.
> 
> Can you try to explain this with an ascii schema again? I'm sorry but
> I
> don't follow it. Is the BBM placed in the first bytes of the first
> oob
> area by the engine? Or is it place somewhere else?
> 

Yes, the BBM will at the first OOB area in NAND standard layout after
BBM swap.

0. Differential on-flash data layout

NAND standard page layout
+------------------------------+------------+
|                              |            |
|            main area         |   OOB area |
|                              |            |
+------------------------------+------------+

MTK ECC on-flash page layout (2 section for example)
+------------+--------+------------+--------+
|            |        |            |        |    
| section(0) | OOB(0) | section(1) | OOB(1) |
|            |        |            |        | 
+------------+--------+------------+--------+

The standard BBM position will be section(1) main data,
need do the BBM swap operation.

request buffer include req->databuf and req->oobbuf.
+----------------------------+
|                            |
|     req->databuf           |
|                            |
+----------------------------+

+-------------+
|             |
| req->oobbuf |
|             |
+-------------+

1. For the OPS_RAW mode

Expect the on-flash data format is like MTK ECC layout.
The snfi controller will put the on-flash data as is
spi_mem_op->data.buf.out.

Therefore, the ECC engine have to reorganize the request
data and OOB buffer in 4 part for each section in
OPS_RAW mode.

1) BBM swap, only for the section need do the swap
2) section main data
3) OOB free data
4) OOB ECC data

The BBM swap will ensure the BBM position in MTK ECC
on-flash layout is same as NAND standard layout in
OPS_RAW mode.

for (i = 0; i < eng->nsteps; i++) {

        /* part 1: BBM swap */
        if (i == eng->bbm_ctl.section)
                eng->bbm_ctl.bbm_swap(nand,
                                      databuf, oobbuf);

	/* part 2: main data in this section */
        memcpy(mtk_ecc_section_ptr(nand, i),
               databuf + mtk_ecc_data_off(nand, i),
               step_size);

        /* part 3: OOB free data */
        memcpy(mtk_ecc_oob_free_ptr(nand, i),
               oobbuf + mtk_ecc_oob_free_position(nand, i),
               eng->oob_free);

        /* part 4: OOB ECC data */
        memcpy(mtk_ecc_oob_free_ptr(nand, i) + eng->oob_free,
               oobbuf + eng->oob_free * eng->nsteps +
               i * eng->oob_ecc,
               eng->oob_ecc);
}

2. For non OPS_RAW mode

The snfi have a function called auto format with ECC enable.
This will auto reorganize the request data and oob data in
MTK ECC page layout by the snfi controller except the BBM position.

Therefore, the ECC engine only need do the BBM swap after set OOB data
bytes in OPS_AUTO or after memcpy oob data in OPS_PLACE_OOB for write
operation.

The BBM swap also ensure the BBM position in MTK ECC on-flash
layout is
same as NAND standard layout in non OPS_RAW mode.

if (req->ooblen) {
        if (req->mode == MTD_OPS_AUTO_OOB) {
                ret = mtd_ooblayout_set_databytes(mtd,
                                                  req->oobbuf.out,
                                                  eng->bounce_oob_buf,
                                                  req->ooboffs,
                                                  mtd->oobavail);
                if (ret)
                        return ret;
        } else {
                memcpy(eng->bounce_oob_buf + req->ooboffs,
                       req->oobbuf.out,
                       req->ooblen);
        }
}

eng->bbm_ctl.bbm_swap(nand, (void *)req->databuf.out,
                      eng->bounce_oob_buf);

Thanks
Xiangsheng Hou
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
