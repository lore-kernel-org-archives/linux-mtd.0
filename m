Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F33F3C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Dec 2021 07:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HQMZKKOa1kXhcIUSapxmF8OQyxLxM58naAOGFas9riY=; b=ctKW8ikg1L1FF2
	8Izi8AOLs1Ea3n5xsaB4OXknJyZFlxIldI2n/yBTJMwzXXDx3Lh+jERqS8XdPw/zRYPGYygL+W60c
	Bl4XXP4SIr6+uMNmbhrDaSOaV77qAJXSPqPthMfyeDoOaofuBUAk3THvSfEif3ZUQDdpnDyj+4x3S
	Md5tidcO/4UYvb/wtKaGwW1mYCSovArSM9cwSjUgKACGZXuNwI6L/IUXm89qNax/mihclu3zRnwFV
	BCXGuGops6eYFCvYuVi2ly/p5SAji60Lj1F+2lIiahhdIQxxEDeZ2B+ZP0DTrh8qg6Vp457ekpzlK
	VwRoCq+WV5n4GLA9bQUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzDOQ-0014sp-DQ; Mon, 20 Dec 2021 07:47:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzDOL-0014r7-Bs; Mon, 20 Dec 2021 07:47:32 +0000
X-UUID: 79fdbd418beb4bb4bd98b2e588046b50-20211220
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=t0B8By882gK+w6ltMCRFD4rdCroKZjb1bCIoXpRpAng=; 
 b=ZPDH69e6RZD7O0s3M+oPHWumPukVZg5oPqU5wDrHHXv+cMi/xE6R6Um45QZCh0KqopRCAcrZOO9y+sA+1/it1tl1atdGYkxWdpTkw5/FJE6nAQiItqkzFQFXkmLdmLAMgAUmPFCnjIYIV/q8sEJXbKcvTjCXDXe5uO8pI6DheKM=;
X-UUID: 79fdbd418beb4bb4bd98b2e588046b50-20211220
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <xiangsheng.hou@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 757420622; Mon, 20 Dec 2021 00:47:26 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 19 Dec 2021 23:37:25 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 20 Dec 2021 15:37:23 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 20 Dec 2021 15:37:22 +0800
Message-ID: <1bf2dbbdf63fdfa3d8cea9afeee83ce11996f42a.camel@mediatek.com>
Subject: Re: [RFC,v4,4/5] mtd: spinand: Move set/get OOB databytes to each
 ECC engines
From: xiangsheng.hou <xiangsheng.hou@mediatek.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: <broonie@kernel.org>, <benliang.zhao@mediatek.com>,
 <dandan.he@mediatek.com>, <guochun.mao@mediatek.com>,
 <bin.zhang@mediatek.com>, <sanny.chen@mediatek.com>,
 <mao.zhong@mediatek.com>, <yingjoe.chen@mediatek.com>, <donghunt@amazon.com>, 
 <rdlee@amazon.com>, <linux-mtd@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>
Date: Mon, 20 Dec 2021 15:37:23 +0800
In-Reply-To: <20211214124111.3bd39e74@xps13>
References: <20211130083202.14228-1-xiangsheng.hou@mediatek.com>
 <20211130083202.14228-5-xiangsheng.hou@mediatek.com>
 <20211214124111.3bd39e74@xps13>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211219_234730_854609_57D99682 
X-CRM114-Status: GOOD (  22.37  )
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

On Tue, 2021-12-14 at 12:41 +0100, Miquel Raynal wrote:
> 
> > 
> > @@ -299,22 +303,42 @@ static int
> > nand_ecc_sw_bch_prepare_io_req(struct nand_device *nand,
> >  	int total = nand->ecc.ctx.total;
> >  	u8 *ecccalc = engine_conf->calc_buf;
> >  	const u8 *data;
> > -	int i;
> > +	int i, ret = 0;
> 
> int i, ret;
> 
> >  
> >  	/* Nothing to do for a raw operation */
> >  	if (req->mode == MTD_OPS_RAW)
> >  		return 0;
> >  
> > -	/* This engine does not provide BBM/free OOB bytes protection
> > */
> > -	if (!req->datalen)
> > -		return 0;
> > -
> 
> Why? Please drop this removal here and below, it has nothing to do
> with
> the current fix, right?
> 

For req->datalen == 0 and req->ooblen !=0 when write operation in
OPS_AUTO mode, it`s also need to set OOB databytes. So I remove this to
the back.

However, for OPS_RAW and OPS_PLACE_OOB mode, it`s unnecessary.

I will try to fix this.

> >  	nand_ecc_tweak_req(&engine_conf->req_ctx, req);
> >  
> >  	/* No more preparation for page read */
> >  	if (req->type == NAND_PAGE_READ)
> >  		return 0;
> >  
> > +	if (req->ooblen) {
> > +		memset(engine_conf->oob_buf, 0xff,
> > +		       nanddev_per_page_oobsize(nand));
> 
> I think this is only needed in the AUTO case.
> 
> > +
> > +		if (req->mode == MTD_OPS_AUTO_OOB) {
> > +			ret = mtd_ooblayout_set_databytes(mtd, req-
> > >oobbuf.out,
> > +							  engine_conf-
> > >oob_buf,
> > +							  req->ooboffs,
> > +							  mtd-
> > >oobavail);
> > +			if (ret)
> > +				return ret;
> > +		} else {
> > +			memcpy(engine_conf->oob_buf + req->ooboffs,
> > +			       req->oobbuf.out, req->ooblen);
> > +		}
> > +
> > +		engine_conf->src_oob_buf = (void *)req->oobbuf.out;
> > +		req->oobbuf.out = engine_conf->oob_buf;
> > +	}
> > +
> > +	/* This engine does not provide BBM/free OOB bytes protection
> > */
> > +	if (!req->datalen)
> > +		return 0;
> > +
> 
> I believe we can do something simpler:
> 
> if (req->ooblen && req->mode == AUTO) {
> 	memcpy(oobbuf, req->oobbuf.out...
> 	mtd_ooblayout_set_databytes(using oobbuf)
> }
> 
> But I believe this should be done before tweaking the request so that
> you can avoid messing with src_oob_buf, right?

Yes, you are right. For OPS_AUTO mode, the maximal request OOB len is
mtd->oobavail which smaller than nand->memorg.oobsize.

Therefore, this will use bounce oob buffer when tweaking the request.

> 
> Same applies to the two other engines.

I will.

Thanks
Xiangsheng Hou
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
