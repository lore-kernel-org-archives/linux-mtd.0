Return-Path: <SRS0=0ANE=S3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EA4FC10F11
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Apr 2019 01:12:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 456A2214C6
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Apr 2019 01:12:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r0S6RbX9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 456A2214C6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hfBa21fpwgXOtfmUUORzHShAjkMoa1KjKRj1r5EfIuQ=; b=r0S6RbX93cPkJ6
	6oUIvjrfJzz1cFS9uSh2LLmdt94BwKw7Mt1Nflk8UhXgeFxFbjoxSrLifInGfSBkuKB62DGq0nS99
	9X0omv1tkHwe814QNPZRCtsEbZ3xjSfRIuwPKDFJH9+xFTQ/uW51xRIrz++ZjrIqfk7gG0XeLY1E/
	RRAN2BFnJ6uWNSWdXfe30+bKBEuFmLqgmzjvigPlFNzkdB8dWYOqm68krFwP9x64ob0zc+T0oJDtn
	DoT5HQ1noGqUeiCVvbdyTA95+phVQt1juL+3SWw9TBFR7V6RjLMN18vaa5bO0U6QJKs6FEFwmS5V4
	nSEOYbKiLfboVwh/qOCw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJSwD-0007Cz-Ut; Thu, 25 Apr 2019 01:12:33 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJSwA-0007Ca-Fn; Thu, 25 Apr 2019 01:12:32 +0000
X-UUID: 4e67411d4aab46d1bd25f9ebb86af33c-20190424
X-UUID: 4e67411d4aab46d1bd25f9ebb86af33c-20190424
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <xiaolei.li@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1086302772; Wed, 24 Apr 2019 17:12:25 -0800
Received: from mtkmbs03n1.mediatek.inc (172.21.101.181) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 24 Apr 2019 18:12:24 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs03n1.mediatek.inc
 (172.21.101.181) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Thu, 25 Apr 2019 09:12:22 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 25 Apr 2019 09:12:21 +0800
Message-ID: <1556154741.26455.23.camel@mhfsdcap03>
Subject: Re: [RFC PATCH 1/1] mtd: rawnand: mtk: Re-license MTK NAND driver
 as Dual MIT/GPL
From: xiaolei li <xiaolei.li@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Date: Thu, 25 Apr 2019 09:12:21 +0800
In-Reply-To: <5c674c6c-7df7-d452-8971-53caeff82a3f@gmail.com>
References: <20190424064522.33501-1-xiaolei.li@mediatek.com>
 <20190424064522.33501-2-xiaolei.li@mediatek.com>
 <1868653.V2KA8McHNA@blindfold> <1556094347.26455.5.camel@mhfsdcap03>
 <5c674c6c-7df7-d452-8971-53caeff82a3f@gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190424_181230_587825_79D56822 
X-CRM114-Status: GOOD (  13.73  )
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
 Richard Weinberger <richard@nod.at>, yingjoe.chen@mediatek.com,
 boris.brezillon@bootlin.com, linux-mediatek@lists.infradead.org,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 jorge.ramirez-ortiz@linaro.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWF0dGhpYXMsCgpPbiBXZWQsIDIwMTktMDQtMjQgYXQgMTU6MTUgKzAyMDAsIE1hdHRoaWFz
IEJydWdnZXIgd3JvdGU6Cj4gCj4gT24gMjQvMDQvMjAxOSAxMDoyNSwgeGlhb2xlaSBsaSB3cm90
ZToKPiA+IEhpIFJpY2hhcmQsCj4gPiAKPiA+IE9uIFdlZCwgMjAxOS0wNC0yNCBhdCAwOToyOSAr
MDIwMCwgUmljaGFyZCBXZWluYmVyZ2VyIHdyb3RlOgo+ID4+IEFtIE1pdHR3b2NoLCAyNC4gQXBy
aWwgMjAxOSwgMDg6NDU6MjIgQ0VTVCBzY2hyaWViIFhpYW9sZWkgTGk6Cj4gPj4+IEl0IGlzIGFs
bG93ZWQgdG8gdXNlIE1USyBOQU5EIGRyaXZlciB3aXRoIEdQTC0yLjAgb3IgTUlUIGxpY2Vuc2Uu
Cj4gPj4+IEJ1dCBub3cgaXQgaXMgb25seSBsaWNlbnNlZCBhcyBHUEwtMi4wLgo+ID4+PiBTbyBy
ZS1saWNlbnNlIGl0IGFzIGR1YWwgTUlUL0dQTC4KPiA+Pgo+ID4+IEkgZmVhciB0aGlzIG5lZWRz
IEFDS3MgZnJvbSBhbGwgYXV0aG9ycyBhbmQgbWFqb3IgY29udHJpYnV0b3JzIG9mIHRoZSBkcml2
ZXIKPiA+PiBiZWZvcmUgd2UgY2FuIGFwcGx5IHN1Y2ggYSBjaGFuZ2UuCj4gPiAKPiA+IFllcy4g
TVRLIHdhbnRzIHRvIHNvbGljaXQgQUNLcyBmb3IgdGhpcyBjaGFuZ2UgZnJvbSBjb3B5cmlnaHRz
IGhvbGRlcnMKPiA+IGhlcmUuCj4gPiBJIGFkZGVkIGFub3RoZXIgZHJpdmVyIGF1dGhvciBKb3Jn
ZSwgYW5kIGxldCdzIHdhaXQgZm9yIHRoZSByZXNwb25zZS4KPiA+IAo+IAo+IFlvdSBhcmUgbWlz
c2luZyBhdCBsZWFzdCBSeWRlciBMZWUsIFJhZmHFgiBNacWCZWNraSBhbmQgV2VuIFlhbmcgaW4g
dGhlIENDIGxpc3QuClRoYW5rcyBmb3IgeW91ciByZW1pbmRpbmcuIEkgd2lsbCBhZGQgdGhlbSBp
biBuZXh0IHBhdGNoIHZlcnNpb24uCgo+IEkgdGhpbmsgaXQgd291bGQgYmUgZ29vZCB0byB1bmRl
cnN0YW5kIHdoeSB5b3Ugd2FudCB0byBkaXN0cmlidXRlIHRoZSBkcml2ZXIKPiB1bmRlciBNSVQg
bGljZW5zZS4KTVRLIHdhbnRzIHRvIG1vZGlmeSBhbmQgcHVibGlzaCB0aGlzIGRyaXZlciB3aXRo
IE1JVCBsaWNlbnNlIGluCmJvb3Rsb2FkZXIuIFNvLCBoZXJlIHdlIGFzayBmb3IgQUNLcyB3aGV0
aGVyIHdlIGNhbiByZS1saWNlbnNlIGl0IGFzCmR1YWwgTUlUL0dQTC4KClRoYW5rcywKWGlhb2xl
aQo+IAo+IFJlZ2FyZHMsCj4gTWF0dGhpYXMKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
