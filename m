Return-Path: <SRS0=tMSz=TG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	T_DKIMWL_WL_HIGH,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA527C004C9
	for <linux-mtd@archiver.kernel.org>; Mon,  6 May 2019 00:56:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9542820675
	for <linux-mtd@archiver.kernel.org>; Mon,  6 May 2019 00:56:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gqCb/629"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9542820675
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lEHe8KbbRCe0HJ+KMkFKIOAArQrdVSGa8GZRGjvb5kA=; b=gqCb/629O872nH
	ZGJrgVAoP0/UTAAN1fIKpgu2Af8PpYjZbK4Q/LPv74KUGktquB4tz+i+gQKNi3kc+S6//OLJP1Wvo
	gNYdlwlja/6klSlAdRPSMiffTspJvupEsYR3bnZgHXUSXD4wb7lUjGXNAamalnGr8KB37VEYP4QCr
	yVp/TToCO4rEpd1mBo6lw4/j1wjdsEKoaX/hhE4JEFGcz+hAzUGJ8p+aJxJiezWbQklrpW0LU5i7w
	2l+J3RKa7Zh2JRYhN9WgFeQa/jG4RPk33vO9UGdTCJmUK7BCuxn/jX7ZUdR6GPH4qvEv6drAUsPvk
	oA2ikQWhjvmdznpI7cpw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hNRvr-0001Ur-09; Mon, 06 May 2019 00:56:39 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hNRvm-0001Tu-NG; Mon, 06 May 2019 00:56:36 +0000
X-UUID: ca3ab7d8f5e04c96b224a30dc74c9ff4-20190505
X-UUID: ca3ab7d8f5e04c96b224a30dc74c9ff4-20190505
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <xiaolei.li@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 522310142; Sun, 05 May 2019 16:56:26 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 5 May 2019 17:56:24 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by mtkmbs01n1.mediatek.inc
 (172.21.101.68) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Mon, 6 May 2019 08:56:22 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 6 May 2019 08:56:20 +0800
Message-ID: <1557104180.26455.89.camel@mhfsdcap03>
Subject: Re: [RFC PATCH v3 1/1] mtd: rawnand: mtk: Re-license MTK NAND
 driver as Dual MIT/GPL
From: xiaolei li <xiaolei.li@mediatek.com>
To: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
Date: Mon, 6 May 2019 08:56:20 +0800
In-Reply-To: <79539034414767c95e456a79391a18e7@milecki.pl>
References: <20190429085116.60081-1-xiaolei.li@mediatek.com>
 <20190429085116.60081-2-xiaolei.li@mediatek.com>
 <82cc648b1e92d5ed6876b025a2da1821@milecki.pl>
 <1557047534.26455.81.camel@mhfsdcap03>
 <79539034414767c95e456a79391a18e7@milecki.pl>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190505_175634_771143_03304D25 
X-CRM114-Status: GOOD (  16.39  )
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
Cc: daniel.thompson@linaro.org, ryder.lee@mediatek.com,
 srv_heupstream@mediatek.com, richard@nod.at, miquel.raynal@bootlin.com,
 jorge.ramirez-ortiz@linaro.org, yingjoe.chen@mediatek.com,
 boris.brezillon@collabora.com, linux-mtd@lists.infradead.org,
 yellowriver2010@hotmail.com, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgUmFmYWwsCgpPbiBTdW4sIDIwMTktMDUtMDUgYXQgMTc6MDYgKzAyMDAsIFJhZmHFgiBNacWC
ZWNraSB3cm90ZToKPiBPbiAyMDE5LTA1LTA1IDExOjEyLCB4aWFvbGVpIGxpIHdyb3RlOgo+ID4g
VXAgdG8gbm93LAo+ID4gWGlhb2xlaSBMaSA8eGlhb2xlaS5saUBtZWRpYXRlay5jb20+ICh0aGUg
YXV0aG9yIGFuZCBtYWpvciAKPiA+IGNvbnRyaWJ1dG9yKSwKPiA+IEpvcmdlIFJhbWlyZXotT3J0
aXogPGpvcmdlLnJhbWlyZXotb3J0aXpAbGluYXJvLm9yZz4gKHRoZSBhdXRob3IgYW5kCj4gPiBt
YWpvciBjb250cmlidXRvciksCj4gPiBSeWRlciBMZWUgPHJ5ZGVyLmxlZUBtZWRpYXRlay5jb20+
IChkZXZlbG9wZXIpLAo+ID4gUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPiAoZGV2
ZWxvcGVyKQo+ID4gc2VudCBBQ0sgZm9yIHRoaXMgUkZDIHBhdGNoLgo+ID4gCj4gPiBNYXkgSSBh
c2sgaWYgaXQgaXMgZW5vdWdoIHRvIGFjY2VwdCB0aGlzIGNoYW5nZT8gT3Igc2hvdWxkIEkgd2Fp
dCBmb3IKPiA+IG90aGVyIGRldmVsb3BlcidzIHJlc3BvbnNlPwo+IAo+IEkgY2FuJ3QgaW1hZ2lu
ZSByZS1saWNlbnNpbmcgc29tZW9uZSdzIHdvcmsgd2l0aG91dCBhIHBlcm1pc3Npb24uCgpJIGhh
dmUgbm8gaW50ZW50aW9uIHRvIG9mZmVuZCBvdGhlcidzIGNvbnRyaWJ1dGlvbi4KVGhhdCBpcyB3
aHkgSSBzZW50IHRoaXMgUkZDIHBhdGNoIHRvIGFzayBmb3IgQUNLcyBmcm9tIGNvbnRyaWJ1dG9y
cy4KCj4gCj4gVGhlIGJlc3QgeW91IGNhbiBkbyBpcyBpZ25vcmluZyBjb250cmlidXRvcnMgdGhh
dCBzdWJtaXR0ZWQgY2hhbmdlcyB0aGF0Cj4gYXJlbid0IHJlYWxseSBjb3B5cmlnaHRhYmxlIChz
b21ldGhpbmcgbGlrZSBmaXhpbmcgYSBjb21tZW50IHR5cG8sIHNvbWUKPiBhdXRvLWdlbmVyYXRl
ZCBkaWZmLXMpLgo+IAo+IEkgdXNlZCBmb2xsb3dpbmcgY29tbWFuZCB0byBjaGVjayBtdGtfbmFu
ZC5jIGZpbGUgaGlzdG9yeToKPiAjIGdpdCBsb2cgLS1mb2xsb3cgZHJpdmVycy9tdGQvbmFuZC9y
YXcvbXRrX25hbmQuYyB8IGdyZXAgCj4gIlNpZ25lZC1vZmYtYnkiIHwgc29ydCB8IHVuaXEgLWMg
fCBzb3J0IC1yIC1uCj4gICAgICAgMTkgICAgIFNpZ25lZC1vZmYtYnk6IE1pcXVlbCBSYXluYWwg
PG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cj4gICAgICAgMTggICAgIFNpZ25lZC1vZmYtYnk6
IEJvcmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJlemlsbG9uQGJvb3RsaW4uY29tPgo+ICAgICAgIDE1
ICAgICBTaWduZWQtb2ZmLWJ5OiBCb3JpcyBCcmV6aWxsb24gCj4gPGJvcmlzLmJyZXppbGxvbkBm
cmVlLWVsZWN0cm9ucy5jb20+Cj4gICAgICAgIDYgICAgIFNpZ25lZC1vZmYtYnk6IFhpYW9sZWkg
TGkgPHhpYW9sZWkubGlAbWVkaWF0ZWsuY29tPgo+ICAgICAgICAzICAgICBTaWduZWQtb2ZmLWJ5
OiBSb2dlckNDIExpbiA8cm9nZXJjYy5saW5AbWVkaWF0ZWsuY29tPgo+ICAgICAgICAyICAgICBT
aWduZWQtb2ZmLWJ5OiBNaXF1ZWwgUmF5bmFsIAo+IDxtaXF1ZWwucmF5bmFsQGZyZWUtZWxlY3Ry
b25zLmNvbT4KPiAgICAgICAgMSAgICAgU2lnbmVkLW9mZi1ieTogV2VpIFlvbmdqdW4gPHdlaXlv
bmdqdW4xQGh1YXdlaS5jb20+Cj4gICAgICAgIDEgICAgIFNpZ25lZC1vZmYtYnk6IFJ5ZGVyIExl
ZSA8cnlkZXIubGVlQG1lZGlhdGVrLmNvbT4KPiAgICAgICAgMSAgICAgU2lnbmVkLW9mZi1ieTog
UmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgo+ICAgICAgICAxICAgICBTaWduZWQt
b2ZmLWJ5OiBQZXRlciBQYW4gPHBldGVycGFuZG9uZ0BtaWNyb24uY29tPgo+ICAgICAgICAxICAg
ICBTaWduZWQtb2ZmLWJ5OiBNYXNhaGlybyBZYW1hZGEgCj4gPHlhbWFkYS5tYXNhaGlyb0Bzb2Np
b25leHQuY29tPgo+ICAgICAgICAxICAgICBTaWduZWQtb2ZmLWJ5OiBKb3JnZSBSYW1pcmV6LU9y
dGl6IAo+IDxqb3JnZS5yYW1pcmV6LW9ydGl6QGxpbmFyby5vcmc+Cj4gCj4gSWRlYWxseSB5b3Ug
c2hvdWxkIHN0aWxsIGdldCBhY2tzIGZyb206Cj4gCj4gMSkgTWlxdWVsCj4gQ29udHJpYnV0b3Ig
b2YgMjEgY2hhbmdlcwo+IAo+IDIpIEJvcmlzCj4gQ29udHJpYnV0b3Igb2YgMzMgY2hhbmdlcwo+
IAo+IDMpIFJvZ2VyQ0MKPiBDb250cmlidXRvciBvZiAzIGNoYW5nZXM6Cj4gOThkZWE4ZDcxOTMx
ICgibXRkOiBuYW5kOiBtdGs6IFN1cHBvcnQgTVQ3NjIyIE5BTkQgZmxhc2ggY29udHJvbGxlci4i
KQo+IGI0NWVlNTUwMWVkZSAoIm10ZDogbmFuZDogbXRrOiBTdXBwb3J0IGRpZmZlcmVudCBNVEsg
TkFORCBmbGFzaCAKPiBjb250cm9sbGVyIElQIikKPiA1NTllNThlN2VkMmQgKCJtdGQ6IG5hbmQ6
IGZpeCBjaGFuY2VzIHRvIGNyZWF0ZSBpbmNvbXBsZXRlIEVDQyBkYXRhIHdoZW4gCj4gd3JpdGlu
ZyIpCj4gCj4gNCkgV2VpCj4gQ29udHJpYnV0b3Igb2YgMSBjaGFuZ2U6Cj4gMDdmNzY0NDNlZjgx
ICgibXRkOiBuYW5kOiBtZWRpYXRlazogcmVtb3ZlIHJlZHVuZGFudCBkZXZfZXJyIGNhbGwgaW4g
Cj4gbXRrX25mY19wcm9iZSgpIikKPiAKPiA1KSBQZXRlcgo+IENvbnRyaWJ1dG9yIG9mIDEgY2hh
bmdlOgo+IGQ0MDkyZDc2YTRhNCAoIm10ZDogbmFuZDogUmVuYW1lIG5hbmQuaCBpbnRvIHJhd25h
bmQuaCIpCj4gCj4gNikgTWFzYWhpcm8KPiBDb250cmlidXRvciBvZiAxIGNoYW5nZToKPiBmMGRi
ZTRhYTM1ZTcgKCJtdGQ6IG5hbmQ6IG1lZGlhdGVrOiByZXR1cm4gZXJyb3IgY29kZSBvZiAKPiBu
YW5kX3NjYW5faWRlbnQvdGFpbCgpIG9uIGVycm9yIikKPiAKPiBJIGd1ZXNzIHdlIGNvdWxkIGFj
Y2VwdCB5b3VyIHBhdGNoIHdpdGhvdXQgYWNrcyBmcm9tIFdlaSwgUGV0ZXIgYW5kIAo+IE1hc2Fo
aXJvLgo+IAo+IFlvdSBkZWZpbml0ZWx5IG5lZWQgYW4gYXBwcm92YWwgZnJvbSBNaXF1ZWwsIEJv
cmlzIGFuZCBSb2dlckNDLgo+IAo+IEl0IGRvZXNuJ3Qgc2VlbSB5b3UgdG9vayB0aGlzIHJlLWxp
Y2Vuc2luZyB0YXNrIHRvbyBzZXJpb3VzbHkuCj4gCj4gUGxlYXNlIHBheSBtb3JlIGF0dGVudGlv
biB0byB0aGlzIGxpY2Vuc2luZyBwcm9ibGVtLCB5b3UgY2FuIHN0YXJ0IHdpdGggCj4gZG9pbmcK
PiBhIHNpbWlsYXIgcmVzZWFyY2ggZm9yIG10a19lY2MuYyBhbmQgbXRrX2VjYy5oLgoKVGhhbmtz
IGZvciB5b3VyIEFDSyBhbmQgZ29vZCBzdWdnZXN0aW9uLiBJdCBpcyByZWFsbHkgaGVscGZ1bCBm
b3IgbWUuCgpUaGFua3MsClhpYW9sZWkKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
