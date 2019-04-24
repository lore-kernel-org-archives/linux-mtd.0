Return-Path: <SRS0=0gGT=S2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 167CAC10F11
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Apr 2019 08:26:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBDD5218DA
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Apr 2019 08:26:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Qf3uvEmP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DBDD5218DA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/SN+grTC1Qh1F8TYGAqR/1VWaH083MKyOHfqrXt0/w8=; b=Qf3uvEmPKzzceY
	6i96A8hAvVp/bVY8yGA3P1b4NJAQ74e/mCF0vF7gvGXwUGo9Tr5YeojgSyqdLeOlwPG4cbjNIacoP
	/LNIYBx9oilZl974N3SGKYwFC1trtBY8VWDGdVx0WnXVXu6c4XpDZ3y1sDobOHLqZ875FlgWBh8Sm
	YeKQuLqdssO12+oET3Np1VlP102mOpzgjuWhD890fBLAd/Z2qzzELGCQWpOJ/XJqDfNBKu1Cv0Url
	GKGXiDuhL6q5NacjZI2tfTXMSgVsRJVtgaB7imut/2vO8HDqrF62biBPgdjLKPzvTcL9g9cojLQLG
	FQuPwhSjo6AlavkxjJUg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJDE9-0006Ia-V1; Wed, 24 Apr 2019 08:26:01 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJDE7-0006HQ-1Y; Wed, 24 Apr 2019 08:26:00 +0000
X-UUID: cf37fd64f2fc40e09132541a9a69df3d-20190424
X-UUID: cf37fd64f2fc40e09132541a9a69df3d-20190424
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <xiaolei.li@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 63294659; Wed, 24 Apr 2019 00:25:52 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 24 Apr 2019 01:25:50 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by mtkmbs01n1.mediatek.inc
 (172.21.101.68) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Wed, 24 Apr 2019 16:25:48 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 24 Apr 2019 16:25:47 +0800
Message-ID: <1556094347.26455.5.camel@mhfsdcap03>
Subject: Re: [RFC PATCH 1/1] mtd: rawnand: mtk: Re-license MTK NAND driver
 as Dual MIT/GPL
From: xiaolei li <xiaolei.li@mediatek.com>
To: Richard Weinberger <richard@nod.at>
Date: Wed, 24 Apr 2019 16:25:47 +0800
In-Reply-To: <1868653.V2KA8McHNA@blindfold>
References: <20190424064522.33501-1-xiaolei.li@mediatek.com>
 <20190424064522.33501-2-xiaolei.li@mediatek.com>
 <1868653.V2KA8McHNA@blindfold>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190424_012559_109044_816472AC 
X-CRM114-Status: GOOD (  10.06  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: daniel.thompson@linaro.org, srv_heupstream@mediatek.com,
 miquel.raynal@bootlin.com, jorge.ramirez-ortiz@linaro.org,
 boris.brezillon@bootlin.com, linux-mediatek@lists.infradead.org,
 yingjoe.chen@mediatek.com, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Richard,

On Wed, 2019-04-24 at 09:29 +0200, Richard Weinberger wrote:
> Am Mittwoch, 24. April 2019, 08:45:22 CEST schrieb Xiaolei Li:
> > It is allowed to use MTK NAND driver with GPL-2.0 or MIT license.
> > But now it is only licensed as GPL-2.0.
> > So re-license it as dual MIT/GPL.
> 
> I fear this needs ACKs from all authors and major contributors of the driver
> before we can apply such a change.

Yes. MTK wants to solicit ACKs for this change from copyrights holders
here.
I added another driver author Jorge, and let's wait for the response.

Thanks,
Xiaolei
> 
> Thanks,
> //richard
> 
> 



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
