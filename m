Return-Path: <SRS0=nQMH=S7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0256C43219
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Apr 2019 06:25:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65AD32087B
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Apr 2019 06:25:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="c9PbUjnu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65AD32087B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HNqQhuF3ErqXMzAscERrV3ZI9YF8BwMo8eI8chRh/Ws=; b=c9PbUjnuSWDeYx
	5qIbDRXijKGA62S5pXT9Pugm6ZWTOi9O6M3nVzxp9ZpN1qc9SWlTJPRCypxj/xU8h9zzrn7xS8IDk
	E6PdYDpq0UbmqzuGiBdLTblu+V753c3xTOc/MhNU6BA4UC4fJiKaTQyr+4rRc8maZfZiDUj+y0TtN
	Own/GUH19D4/aj1ZM5+yQVUcr/xFWWtacvgzIUpdsljmIf6aPy4qM3OXivmvg1F2iZbQAuYwgoaaG
	3IRRQm6ukLsSbrbhOwOo8T93dB55HtolkrpqBizSNChYLXL0ZTQxgKhoyHVralGKG52qniAF7cKWq
	sqDMWTZ4OsOTUvb4+0nA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hKziu-00014G-Ac; Mon, 29 Apr 2019 06:25:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hKzir-0000CK-AE; Mon, 29 Apr 2019 06:25:06 +0000
X-UUID: 62ede6e90d3e4917a6a22fed5f102837-20190428
X-UUID: 62ede6e90d3e4917a6a22fed5f102837-20190428
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1308972020; Sun, 28 Apr 2019 22:24:59 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 28 Apr 2019 23:24:58 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 29 Apr 2019 14:24:50 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 29 Apr 2019 14:24:49 +0800
Message-ID: <1556519089.21280.0.camel@mtkswgap22>
Subject: Re: [RFC PATCH v2 1/1] mtd: rawnand: mtk: Re-license MTK NAND
 driver as Dual MIT/GPL
From: Ryder Lee <ryder.lee@mediatek.com>
To: Xiaolei Li <xiaolei.li@mediatek.com>
Date: Mon, 29 Apr 2019 14:24:49 +0800
In-Reply-To: <20190425015552.42638-2-xiaolei.li@mediatek.com>
References: <20190425015552.42638-1-xiaolei.li@mediatek.com>
 <20190425015552.42638-2-xiaolei.li@mediatek.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 48BEF3448F577F6EDEDD363442C780537FA24398AAA0D472F71CE8C52AD3CC632000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190428_232505_361419_31475AA6 
X-CRM114-Status: UNSURE (   6.31  )
X-CRM114-Notice: Please train this message.
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
Cc: daniel.thompson@linaro.org, srv_heupstream@mediatek.com, richard@nod.at,
 miquel.raynal@bootlin.com, yingjoe.chen@mediatek.com,
 jorge.ramirez-ortiz@linaro.org, boris.brezillon@bootlin.com,
 linux-mtd@lists.infradead.org, yellowriver2010@hotmail.com, rafal@milecki.pl,
 linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 2019-04-25 at 09:55 +0800, Xiaolei Li wrote:
> It is allowed to use MTK NAND driver with GPL-2.0 or MIT license.
> But now it is only licensed as GPL-2.0.
> So re-license it as dual MIT/GPL.
> 
> Signed-off-by: Xiaolei Li <xiaolei.li@mediatek.com>
> Acked-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>

Acked-by: Ryder Lee <ryder.lee@mediatek.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
