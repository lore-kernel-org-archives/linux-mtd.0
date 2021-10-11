Return-Path: <SRS0=sMU9=O7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3074C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Oct 2021 11:43:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53B1A60F21
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Oct 2021 11:43:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 53B1A60F21
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vYFt4jxjsVB1VnJpmQmad7WMspPk+LBneBDzbGndTdM=; b=y2/fo2TrW9Aa1K
	UwhCTFXXrJNv2f0dp11TQrYdIoFpQe8xV58SJHbQybsLQfs4+pFOB4xGl6N5LqFnL/vOtARQ5D81A
	HGEif6NolZ8EL/GFXmDDG/bc2stTAkJcccO9ORPRttlsGM5kcNMnsDzrd+CukmNjZeHhIOfBdC4Nn
	M91AGy/FX8d8l/SQH7rosJvYoC2iJCAXHZ78JI2NYZeimLj70GIx0jfGdZbhePSAKV7LTOLC1glow
	bSTeskt8DkGdPLHJiZxASHNB/Vpzj9dwoTBooXPVqiY9b73htt1WaLd7Awzrb5XusaBcmciaSUujl
	wEhxGpxm/3aXXPZcrS4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZthE-0099Nd-2q; Mon, 11 Oct 2021 11:42:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZtWp-0095Kc-Dt; Mon, 11 Oct 2021 11:31:38 +0000
X-UUID: 21f388f8d5cf4898897496b2343afc0d-20211011
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=bIy5c9xV7EHZtVKmnOhK+ZxQ+MVAnoFanpY5LNLZGpY=; 
 b=i8FQGws4ldDfnK7jemZb2mTTiaD7H55Wm5fOBA8NhDMlnfbeo2Ay5iP1elazqfM+Rbecl++5P6YyyOVsfk7CcRc1VbZza7/WEdWBbU5w7Bjb86hXYAVS9IjjN6h+jMKozZZVi1e7ZxOUwrfWphzGEZxGSa7V1EVReF1wOFxet4Q=;
X-UUID: 21f388f8d5cf4898897496b2343afc0d-20211011
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <xiangsheng.hou@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1411249357; Mon, 11 Oct 2021 04:31:29 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 11 Oct 2021 04:31:27 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 11 Oct 2021 19:31:26 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 11 Oct 2021 19:31:25 +0800
Message-ID: <cb200da61b942d93a272f3391f756c493cb5a342.camel@mediatek.com>
Subject: Re: [RFC,v1 0/4] Add a driver for Mediatek SPI Nand controller
From: xiangsheng.hou <xiangsheng.hou@mediatek.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: <broonie@kernel.org>, <benliang.zhao@mediatek.com>,
 <dandan.he@mediatek.com>, <guochun.mao@mediatek.com>,
 <bin.zhang@mediatek.com>, <sanny.chen@mediatek.com>,
 <mao.zhong@mediatek.com>, <yingjoe.chen@mediatek.com>, <donghunt@amazon.com>, 
 <rdlee@amazon.com>, <linux-mtd@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>
Date: Mon, 11 Oct 2021 19:31:28 +0800
In-Reply-To: <20211008112045.11e8d148@xps13>
References: <20210927053629.17847-1-xiangsheng.hou@mediatek.com>
 <20211008112045.11e8d148@xps13>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_043136_924133_993A1DA5 
X-CRM114-Status: GOOD (  26.53  )
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

On Fri, 2021-10-08 at 11:20 +0200, Miquel Raynal wrote:
> Hello,
> 
> xiangsheng.hou@mediatek.com wrote on Mon, 27 Sep 2021 13:36:25 +0800:
> 
> > Add a driver for Mediatek SPI Nand controller
> > 
> > Mediatek SPI Nand controller cosists of two parts: on-host HW ECC
> > and
> > snfi(stand for spi nand flash interface). They can cowork with high
> > performance which called ECC nfi mode. The nfi stand for nand flash
> > interfacei(snfi a one part of nfi) which can support SPI Nand flash
> > and raw nand flash.
> > 
> > However, the snfi driver in spi subsytem need to be aware of nand
> > parameter(page/spare size) and ecc status(enable/disable) when work
> > at ECC nfi mode. The snfi driver in spi subsystem seems difficult
> > to
> > know these.
> > 
> > Therefore, consider two ways to let snfi can get these information.
> > The RFC patch send to review whether they are suitable and which
> > solution maybe better.
> > 
> 
> I've looked at both versions that you provided and I thought about a
> number of things that cannot be done like this:
> - I believe the snfi is a regular SPI controller. I will let Mark
>   confirm but I do not think we want to start writing SPI-NAND
>   controllers. Instead we write SPI controllers and we provide SPI-
> mem
>   operations (we've explained this in a previous ELC, the video is
>   available on YouTube).

The snfi controller can support multiple SPI protocols, which can
support other SPI device in theory. However, the snfi need to know nand
parameter and ecc status(enable/disable) when work with MTK on-host HW
BCH ECC engine for nand flash.

Therefore, the RFC patch v1/v2 is try the way to get these information.

> - You cannot add an MTK ECC algorithm. This is dedicated for sofware
>   solutions only and as far as I understand your engine uses the BCH
>   algorithm.
> - When the ECC engine is pipelined, there is an additional complexity
>   in interfacing it with a SPI controller (that's your case I
> believe).
>   I have an example tintendhat is not yet upstream but I think worth
> looking
>   at that I will send very soon (I will Cc: you on it).

Thanks for your patch.

MTK HW ECC(bch) algorithm can work in pipelined and external.
However, the performance worse when work at ecternal which realize and
verify in local. Therefore, try the pipelined in RFC patch v1/v2.

And also realize the mtd/nand info can be get in spi driver which the
spi-mxic driver in your patch. This may solve most of difficulty that
encountered in the snfi driver that the RFC patch v1/v2 try to resolve.

I will prepare the RFC patch v3 with correct pipelined ecc engine
realization for your review.

Thanks
Xiangsheng Hou
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
