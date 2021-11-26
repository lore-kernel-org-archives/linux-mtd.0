Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66BFBC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Nov 2021 08:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5FDA7qYwlRLfCjBY92tztG+qVzfsvSlvl4qmxTnzFlQ=; b=4nyjfOvWLH4rA2
	Inv0N1iiPFiuAxYLuHhdQsqGeCw7y7FrdJE6bNJGU76vW66A6P1DjXv3iGU37QoSzUSCnRDSiHO1l
	c/3x9u0ggnZkGDcrEh1lJ+2BrpjA9jVkhlRcsmLYhDyjlUDPUp8dM5SXZFxpjSs1aDn/jlSumd9gF
	MJgAiZ9919YSk7hP9DIHBVx4QzgF6KeJc0QuQomCbK6GZkGoWXvhmzL3m7LZSqQd9EB821iYJktyo
	3ECSu+/z6abtd9JVdwOpT5UNhTs4HDIlHtDUZ5wy5OBsPCJmvotlBxcY2WmZIjLzGsH8SIJSPptzo
	UvHaCthUXvSNqTW1Taog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqWxl-009f4p-MG; Fri, 26 Nov 2021 08:52:09 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqWxf-009f3l-Pp; Fri, 26 Nov 2021 08:52:05 +0000
X-UUID: 9673069c19234ed6902b1a6b44c75fc0-20211126
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=yW+mMWs04bgPIIBXTP+t3hvfP5DAW2oMOrvW1CRSJM4=; 
 b=O25btT9i7NQ55cVtyx5Lnpc4hLZ7Zece5ijYYV+JJrLb3KGUTXgU7NLJAkBKqzaIhN+/zrks6HFBZ6FrS6A4fgpU8zvF6wHBkedStn1N8fcHFCpnsumgA2ih8zKP0mvVS64FkKW1+OTFJF6Yy5ClwHAGoLeQrWegDJNrBpQzFLs=;
X-UUID: 9673069c19234ed6902b1a6b44c75fc0-20211126
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <xiangsheng.hou@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1671808883; Fri, 26 Nov 2021 01:51:55 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 26 Nov 2021 00:51:53 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 26 Nov 2021 16:51:52 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 26 Nov 2021 16:51:51 +0800
Message-ID: <16790c5f8bfb49014d3fc24a39e14e5a6afb4734.camel@mediatek.com>
Subject: Re: [RFC,v3 5/5] mtd: spinand: skip set/get oob data bytes when
 interleaved case
From: xiangsheng.hou <xiangsheng.hou@mediatek.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: <broonie@kernel.org>, <benliang.zhao@mediatek.com>,
 <dandan.he@mediatek.com>, <guochun.mao@mediatek.com>,
 <bin.zhang@mediatek.com>, <sanny.chen@mediatek.com>,
 <mao.zhong@mediatek.com>, <yingjoe.chen@mediatek.com>, <donghunt@amazon.com>, 
 <rdlee@amazon.com>, <linux-mtd@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>
Date: Fri, 26 Nov 2021 16:51:51 +0800
In-Reply-To: <20211122100144.492115df@xps13>
References: <20211022024021.14665-1-xiangsheng.hou@mediatek.com>
 <20211022024021.14665-6-xiangsheng.hou@mediatek.com>
 <20211109130518.70db0d5d@xps13>
 <4e23bb7db6b3868531752efe644833f5817e9660.camel@mediatek.com>
 <20211122100144.492115df@xps13>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_005203_869365_DA282E63 
X-CRM114-Status: GOOD (  16.04  )
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

On Mon, 2021-11-22 at 10:01 +0100, Miquel Raynal wrote:
> Hi xiangsheng,
> 
> Thanks for the figures, they are useful too understand better your
> situation.
> 
> xiangsheng.hou@mediatek.com wrote on Fri, 12 Nov 2021 16:33:34
> +0800:
> > 
> > part1 and part2 called FDM(flash disk manage data) which can be
> > used to
> > store BBM or filesystem manage data(like jffs2).
> > 
> > The FDM and FDM ECC can be configurable,
> > FDM number of bytes: 0 ~ 8 bytes
> > FDM ECC number of byte: 0 ~ FDM size 
> > 
> > Therefore, the mtk ecc driver need to handle BBM swap and OOB shift
> > operation before/after the write/read operation in
> > ecc_finish/prepare_io_req.
> 
> Not necessarily. What if you just provide a translation in
> prepare/finish which basically switches from one representation to
> the
> other?
> 

For current design which mtd_ooblayout_set_databytes in
spinand_write_to_cache_op when MTD_AUTO_OOB_MODE can not work for BBM
swap situation.

In mtk nand_ecc_prepare_io_req, there have BBM swap lead to the
oobbuf[0] have one byte main data. The expected OOB data bytes will be
OOB availabe + 1 more byte. The mtd_ooblayout_set_databytes only set
OOB available bytes (will skip the reserve byte for BBM), lead to one
byte OOB data byte lost.

+-----------------------------+-----------+
|                             |           |
|                    *        |#@@@@@     |
|                             |           |
+-----------------------------+-----------+
(#): stand for one byte main data
(*): stand for the BBM
(@): the free OOB data byte

I will send next interation in the next few days, adjust set/get OOB
data byte operation in each ECC engine and only memcpy OOB buf in
write/read cache when AUTO OOB mode, which can both solve the this
situation and the AUTO OOB issue.

> Whatever operation you try to do, we don't really care where all
> these
> sections will be located once in memory, do we?

Yes, all the divergence need be handled at each ECC engine.

Thanks
Xiangsheng Hou
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
