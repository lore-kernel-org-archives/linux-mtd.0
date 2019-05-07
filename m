Return-Path: <SRS0=Kxx5=TH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	T_DKIMWL_WL_HIGH,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0915C004C9
	for <linux-mtd@archiver.kernel.org>; Tue,  7 May 2019 10:18:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B142020675
	for <linux-mtd@archiver.kernel.org>; Tue,  7 May 2019 10:18:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tV+GfA2t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B142020675
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hdwyj5bnSZh7TTgtMpdhqQVcAZtxQeYmHP7MGS8e0vQ=; b=tV+GfA2tzXY5Yd
	eBT+LU3x+o1L+yQp5MTvy44/1XmgTNurOGxE+9Hn0/oody6LSd0YWpTViX2UN0m1QCAbRYAcH/wRm
	r1QOFHw17HDy2oMRDONxkPkSJvNvH/I8F9jclmRH8RvgQCyqlrzgKlLsm4sJETkqIuohrBrjQ1Jol
	G+uyzS37Uvy7Ft9OX+w+E9MxftIMjExM6uch1duyZxPfgDyMCTppUsgyaeULuKFMkZVr7aad75L1+
	tQqAYrY1DEZVNb3jICKOcsfxYDfPsGgzAorb/pFA2yUC7Lluw8acn0AT2xAuvZkZ9Kqb35hiACfaW
	lJr1LXkuuSefspruNpVw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hNxBI-0007OL-HN; Tue, 07 May 2019 10:18:40 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hNxBF-0007Ny-Cy; Tue, 07 May 2019 10:18:39 +0000
X-UUID: b842481cbd8d4111a7aeaad989142d70-20190507
X-UUID: b842481cbd8d4111a7aeaad989142d70-20190507
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <xiaolei.li@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1455496154; Tue, 07 May 2019 02:18:33 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 7 May 2019 03:18:31 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by mtkmbs01n1.mediatek.inc
 (172.21.101.68) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Tue, 7 May 2019 18:18:29 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 7 May 2019 18:18:28 +0800
Message-ID: <1557224308.26455.94.camel@mhfsdcap03>
Subject: Re: [RFC PATCH v4 1/1] mtd: rawnand: mtk: Re-license MTK NAND
 driver as Dual MIT/GPL
From: xiaolei li <xiaolei.li@mediatek.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 7 May 2019 18:18:28 +0800
In-Reply-To: <20190507120644.6bd0d118@xps13>
References: <20190507092020.1917-1-xiaolei.li@mediatek.com>
 <20190507092020.1917-2-xiaolei.li@mediatek.com>
 <20190507120644.6bd0d118@xps13>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190507_031837_444963_FE4D84AD 
X-CRM114-Status: GOOD (  10.74  )
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
Cc: daniel.thompson@linaro.org, ryder.lee@mediatek.com, arnd@arndb.de,
 srv_heupstream@mediatek.com, gustavo@embeddedor.com, richard@nod.at,
 yingjoe.chen@mediatek.com, linux-mediatek@lists.infradead.org,
 yamada.masahiro@socionext.com, rafal@milecki.pl, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org, weiyongjun1@huawei.com,
 yellowriver2010@hotmail.com, matthias.bgg@gmail.com,
 jorge.ramirez-ortiz@linaro.org, rogercc.lin@mediatek.com,
 dan.carpenter@oracle.com, peterpandong@micron.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWlxdWVsLAoKT24gVHVlLCAyMDE5LTA1LTA3IGF0IDEyOjA2ICswMjAwLCBNaXF1ZWwgUmF5
bmFsIHdyb3RlOgo+IEhpIFhpYW9sZWksCj4gCj4gWGlhb2xlaSBMaSA8eGlhb2xlaS5saUBtZWRp
YXRlay5jb20+IHdyb3RlIG9uIFR1ZSwgNyBNYXkgMjAxOSAxNzoyMDoyMAo+ICswODAwOgo+IAo+
ID4gSXQgaXMgd2FudGVkIHRvIHVzZSBNVEsgTkFORCBkcml2ZXIgd2l0aCBHUEwtMi4wIG9yIE1J
VCBsaWNlbnNlLgo+ID4gQnV0IG5vdyBpdCBpcyBvbmx5IGxpY2Vuc2VkIGFzIEdQTC0yLjAuCj4g
PiBTbyByZS1saWNlbnNlIGl0IGFzIGR1YWwgTUlUL0dQTCBhbmQgcmVwbGFjZSBsaWNlbnNlIHRl
eHQgd2l0aAo+ID4gU1BEWCB0YWcuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IFhpYW9sZWkgTGkg
PHhpYW9sZWkubGlAbWVkaWF0ZWsuY29tPgo+ID4gQWNrZWQtYnk6IEpvcmdlIFJhbWlyZXotT3J0
aXogPGpvcmdlLnJhbWlyZXotb3J0aXpAbGluYXJvLm9yZz4KPiA+IEFja2VkLWJ5OiBSeWRlciBM
ZWUgPHJ5ZGVyLmxlZUBtZWRpYXRlay5jb20+Cj4gPiBBY2tlZC1ieTogUmFmYcWCIE1pxYJlY2tp
IDxyYWZhbEBtaWxlY2tpLnBsPgo+ID4gQWNrZWQtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5y
YXluYWxAYm9vdGxpbi5jb20+Cj4gPiBBY2tlZC1ieTogQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5i
cmV6aWxsb25AY29sbGFib3JhLmNvbT4KPiA+IEFja2VkLWJ5OiBSb2dlckNDIExpbiA8cm9nZXJj
Yy5saW5AbWVkaWF0ZWsuY29tPgo+ID4gLS0tCj4gCj4gV2hlbiB0aGVyZSBpcyBvbmx5IG9uZSBw
YXRjaCwgbm8gbmVlZCB0byBjcmVhdGUgYSBjb3ZlciBsZXR0ZXIuIFlvdSBjYW4KPiBwdXQgdGhl
IHRleHQgd2hpY2ggaXMgaW4gMC8xIGJlbG93IHRoZSB0aHJlZSBkYXNoZXMgJy0tLScuCj4gCj4g
QWxzbyBubyBuZWVkIHRvIHNlbmQgYSBuZXcgdmVyc2lvbiB3aGlsZSB0aGVyZSBpcyBub3RoaW5n
IGNoYW5nZWQgaW4KPiB0aGUgY29kZS4gUGF0Y2h3b3JrIGF1dG9tYXRpY2FsbHkgY29sbGVjdHMg
dGFncy4KT0tPSy4gVGhhbmtzLgoKWGlhb2xlaQo+IAo+IAo+IFRoYW5rcywKPiBNaXF1w6hsCgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
