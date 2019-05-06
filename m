Return-Path: <SRS0=tMSz=TG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	T_DKIMWL_WL_HIGH,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5E2DC04AAA
	for <linux-mtd@archiver.kernel.org>; Mon,  6 May 2019 09:12:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A1392082F
	for <linux-mtd@archiver.kernel.org>; Mon,  6 May 2019 09:12:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uEzK0YwX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A1392082F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jVwX3WLdfMLSZyEHaNGE70aSKj1IN8HaBVNk3o0ha+k=; b=uEzK0YwXsnkRtW
	K02KdGsMF5HZjoCmZnht3X25h/shfTWynI64p7h0WgLNKizNHTWMkStp2kapO4SvhyDtm+i23Cu76
	cnh38PQ1lm1Bam/xOCZFw33MTp6lT6bvgWVHJfNMdQyTMF2kwAXBk0Xg6C+jJ7OPLtwPQlQ6RvTUO
	vnDklFDchJMfFP162twaCOLGTACir7IAQe27tURBN+aQcD+lVSezq9kdpzHbq589WKL2DDHrcu7SU
	H+Umdt9NmZTbtdImbSpT/0SHTcibr+oUHXNZkmrzgYSyjXmntIypk5joF3ejflHgCFXRoAY5COo9E
	n+npX+UWFbxktz67LaUQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hNZfn-00016x-Om; Mon, 06 May 2019 09:12:35 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hNZfE-0000Jz-Nr; Mon, 06 May 2019 09:12:05 +0000
X-UUID: d94e2251fdb9490ea1992510584632c0-20190506
X-UUID: d94e2251fdb9490ea1992510584632c0-20190506
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <xiaolei.li@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 541514160; Mon, 06 May 2019 01:11:56 -0800
Received: from mtkmbs03n2.mediatek.inc (172.21.101.182) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 6 May 2019 02:11:54 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by mtkmbs03n2.mediatek.inc
 (172.21.101.182) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Mon, 6 May 2019 17:11:47 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 6 May 2019 17:11:46 +0800
Message-ID: <1557133906.26455.91.camel@mhfsdcap03>
Subject: Re: [RFC PATCH v3 1/1] mtd: rawnand: mtk: Re-license MTK NAND
 driver as Dual MIT/GPL
From: xiaolei li <xiaolei.li@mediatek.com>
To: <miquel.raynal@bootlin.com>, Boris Brezillon
 <boris.brezillon@collabora.com>
Date: Mon, 6 May 2019 17:11:46 +0800
In-Reply-To: <20190506101819.28cff338@collabora.com>
References: <20190429085116.60081-1-xiaolei.li@mediatek.com>
 <20190429085116.60081-2-xiaolei.li@mediatek.com>
 <82cc648b1e92d5ed6876b025a2da1821@milecki.pl>
 <1557047534.26455.81.camel@mhfsdcap03>
 <79539034414767c95e456a79391a18e7@milecki.pl>
 <1557104180.26455.89.camel@mhfsdcap03>
 <20190506101819.28cff338@collabora.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: BCEDC6313F34BCB9C87DE69EDA14142CF76B4FD9055E00C67B8B0453C6D6005C2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190506_021200_938483_96287ED9 
X-CRM114-Status: GOOD (  21.54  )
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
 srv_heupstream@mediatek.com, richard@nod.at, jorge.ramirez-ortiz@linaro.org,
 yingjoe.chen@mediatek.com, linux-mtd@lists.infradead.org,
 yellowriver2010@hotmail.com,
 =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>,
 linux-mediatek@lists.infradead.org, rogercc.lin@mediatek.com,
 matthias.bgg@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

TWlxdWVsLCBCb3JpcywgdGhhbmtzIGZvciB5b3VyIEFDSy4KCk9uIE1vbiwgMjAxOS0wNS0wNiBh
dCAxMDoxOCArMDIwMCwgQm9yaXMgQnJlemlsbG9uIHdyb3RlOgo+IE9uIE1vbiwgNiBNYXkgMjAx
OSAwODo1NjoyMCArMDgwMAo+IHhpYW9sZWkgbGkgPHhpYW9sZWkubGlAbWVkaWF0ZWsuY29tPiB3
cm90ZToKPiAKPiA+IEhpIFJhZmFsLAo+ID4gCj4gPiBPbiBTdW4sIDIwMTktMDUtMDUgYXQgMTc6
MDYgKzAyMDAsIFJhZmHFgiBNacWCZWNraSB3cm90ZToKPiA+ID4gT24gMjAxOS0wNS0wNSAxMTox
MiwgeGlhb2xlaSBsaSB3cm90ZTogIAo+ID4gPiA+IFVwIHRvIG5vdywKPiA+ID4gPiBYaWFvbGVp
IExpIDx4aWFvbGVpLmxpQG1lZGlhdGVrLmNvbT4gKHRoZSBhdXRob3IgYW5kIG1ham9yIAo+ID4g
PiA+IGNvbnRyaWJ1dG9yKSwKPiA+ID4gPiBKb3JnZSBSYW1pcmV6LU9ydGl6IDxqb3JnZS5yYW1p
cmV6LW9ydGl6QGxpbmFyby5vcmc+ICh0aGUgYXV0aG9yIGFuZAo+ID4gPiA+IG1ham9yIGNvbnRy
aWJ1dG9yKSwKPiA+ID4gPiBSeWRlciBMZWUgPHJ5ZGVyLmxlZUBtZWRpYXRlay5jb20+IChkZXZl
bG9wZXIpLAo+ID4gPiA+IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4gKGRldmVs
b3BlcikKPiA+ID4gPiBzZW50IEFDSyBmb3IgdGhpcyBSRkMgcGF0Y2guCj4gPiA+ID4gCj4gPiA+
ID4gTWF5IEkgYXNrIGlmIGl0IGlzIGVub3VnaCB0byBhY2NlcHQgdGhpcyBjaGFuZ2U/IE9yIHNo
b3VsZCBJIHdhaXQgZm9yCj4gPiA+ID4gb3RoZXIgZGV2ZWxvcGVyJ3MgcmVzcG9uc2U/ICAKPiA+
ID4gCj4gPiA+IEkgY2FuJ3QgaW1hZ2luZSByZS1saWNlbnNpbmcgc29tZW9uZSdzIHdvcmsgd2l0
aG91dCBhIHBlcm1pc3Npb24uICAKPiA+IAo+ID4gSSBoYXZlIG5vIGludGVudGlvbiB0byBvZmZl
bmQgb3RoZXIncyBjb250cmlidXRpb24uCj4gPiBUaGF0IGlzIHdoeSBJIHNlbnQgdGhpcyBSRkMg
cGF0Y2ggdG8gYXNrIGZvciBBQ0tzIGZyb20gY29udHJpYnV0b3JzLgo+ID4gCj4gPiA+IAo+ID4g
PiBUaGUgYmVzdCB5b3UgY2FuIGRvIGlzIGlnbm9yaW5nIGNvbnRyaWJ1dG9ycyB0aGF0IHN1Ym1p
dHRlZCBjaGFuZ2VzIHRoYXQKPiA+ID4gYXJlbid0IHJlYWxseSBjb3B5cmlnaHRhYmxlIChzb21l
dGhpbmcgbGlrZSBmaXhpbmcgYSBjb21tZW50IHR5cG8sIHNvbWUKPiA+ID4gYXV0by1nZW5lcmF0
ZWQgZGlmZi1zKS4KPiA+ID4gCj4gPiA+IEkgdXNlZCBmb2xsb3dpbmcgY29tbWFuZCB0byBjaGVj
ayBtdGtfbmFuZC5jIGZpbGUgaGlzdG9yeToKPiA+ID4gIyBnaXQgbG9nIC0tZm9sbG93IGRyaXZl
cnMvbXRkL25hbmQvcmF3L210a19uYW5kLmMgfCBncmVwIAo+ID4gPiAiU2lnbmVkLW9mZi1ieSIg
fCBzb3J0IHwgdW5pcSAtYyB8IHNvcnQgLXIgLW4KPiA+ID4gICAgICAgMTkgICAgIFNpZ25lZC1v
ZmYtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cj4gPiA+ICAg
ICAgIDE4ICAgICBTaWduZWQtb2ZmLWJ5OiBCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxv
bkBib290bGluLmNvbT4KPiA+ID4gICAgICAgMTUgICAgIFNpZ25lZC1vZmYtYnk6IEJvcmlzIEJy
ZXppbGxvbiAKPiA+ID4gPGJvcmlzLmJyZXppbGxvbkBmcmVlLWVsZWN0cm9ucy5jb20+Cj4gPiA+
ICAgICAgICA2ICAgICBTaWduZWQtb2ZmLWJ5OiBYaWFvbGVpIExpIDx4aWFvbGVpLmxpQG1lZGlh
dGVrLmNvbT4KPiA+ID4gICAgICAgIDMgICAgIFNpZ25lZC1vZmYtYnk6IFJvZ2VyQ0MgTGluIDxy
b2dlcmNjLmxpbkBtZWRpYXRlay5jb20+Cj4gPiA+ICAgICAgICAyICAgICBTaWduZWQtb2ZmLWJ5
OiBNaXF1ZWwgUmF5bmFsIAo+ID4gPiA8bWlxdWVsLnJheW5hbEBmcmVlLWVsZWN0cm9ucy5jb20+
Cj4gPiA+ICAgICAgICAxICAgICBTaWduZWQtb2ZmLWJ5OiBXZWkgWW9uZ2p1biA8d2VpeW9uZ2p1
bjFAaHVhd2VpLmNvbT4KPiA+ID4gICAgICAgIDEgICAgIFNpZ25lZC1vZmYtYnk6IFJ5ZGVyIExl
ZSA8cnlkZXIubGVlQG1lZGlhdGVrLmNvbT4KPiA+ID4gICAgICAgIDEgICAgIFNpZ25lZC1vZmYt
Ynk6IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPiA+ID4gICAgICAgIDEgICAg
IFNpZ25lZC1vZmYtYnk6IFBldGVyIFBhbiA8cGV0ZXJwYW5kb25nQG1pY3Jvbi5jb20+Cj4gPiA+
ICAgICAgICAxICAgICBTaWduZWQtb2ZmLWJ5OiBNYXNhaGlybyBZYW1hZGEgCj4gPiA+IDx5YW1h
ZGEubWFzYWhpcm9Ac29jaW9uZXh0LmNvbT4KPiA+ID4gICAgICAgIDEgICAgIFNpZ25lZC1vZmYt
Ynk6IEpvcmdlIFJhbWlyZXotT3J0aXogCj4gPiA+IDxqb3JnZS5yYW1pcmV6LW9ydGl6QGxpbmFy
by5vcmc+Cj4gPiA+IAo+ID4gPiBJZGVhbGx5IHlvdSBzaG91bGQgc3RpbGwgZ2V0IGFja3MgZnJv
bToKPiA+ID4gCj4gPiA+IDEpIE1pcXVlbAo+ID4gPiBDb250cmlidXRvciBvZiAyMSBjaGFuZ2Vz
Cj4gPiA+IAo+ID4gPiAyKSBCb3Jpcwo+ID4gPiBDb250cmlidXRvciBvZiAzMyBjaGFuZ2VzCj4g
Cj4gTm90IHN1cmUgdGhhdCdzIHJlYWxseSBuZWNlc3NhcnkgZ2l2ZW4gdGhlIHR5cGUgb2YgY2hh
bmdlcyBkb25lIGluIHRob3NlCj4gMzMgY29tbWl0cyAobW9zdGx5IG1lY2hhbmljYWwgY2hhbmdl
cyBkdWUgdG8gbW9kaWZpY2F0aW9ucyBpbiB0aGUgTkFORAo+IGZyYW1ld29yayksIGJ1dCBoZXJl
IGlzIG15Cj4gCj4gQWNrZWQtYnk6IEJvcmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJlemlsbG9uQGNv
bGxhYm9yYS5jb20+Cj4gCj4gPiA+IAo+ID4gPiAzKSBSb2dlckNDCj4gPiA+IENvbnRyaWJ1dG9y
IG9mIDMgY2hhbmdlczoKPiA+ID4gOThkZWE4ZDcxOTMxICgibXRkOiBuYW5kOiBtdGs6IFN1cHBv
cnQgTVQ3NjIyIE5BTkQgZmxhc2ggY29udHJvbGxlci4iKQo+ID4gPiBiNDVlZTU1MDFlZGUgKCJt
dGQ6IG5hbmQ6IG10azogU3VwcG9ydCBkaWZmZXJlbnQgTVRLIE5BTkQgZmxhc2ggCj4gPiA+IGNv
bnRyb2xsZXIgSVAiKQo+ID4gPiA1NTllNThlN2VkMmQgKCJtdGQ6IG5hbmQ6IGZpeCBjaGFuY2Vz
IHRvIGNyZWF0ZSBpbmNvbXBsZXRlIEVDQyBkYXRhIHdoZW4gCj4gPiA+IHdyaXRpbmciKQo+ID4g
PiAKPiA+ID4gNCkgV2VpCj4gPiA+IENvbnRyaWJ1dG9yIG9mIDEgY2hhbmdlOgo+ID4gPiAwN2Y3
NjQ0M2VmODEgKCJtdGQ6IG5hbmQ6IG1lZGlhdGVrOiByZW1vdmUgcmVkdW5kYW50IGRldl9lcnIg
Y2FsbCBpbiAKPiA+ID4gbXRrX25mY19wcm9iZSgpIikKPiA+ID4gCj4gPiA+IDUpIFBldGVyCj4g
PiA+IENvbnRyaWJ1dG9yIG9mIDEgY2hhbmdlOgo+ID4gPiBkNDA5MmQ3NmE0YTQgKCJtdGQ6IG5h
bmQ6IFJlbmFtZSBuYW5kLmggaW50byByYXduYW5kLmgiKQo+ID4gPiAKPiA+ID4gNikgTWFzYWhp
cm8KPiA+ID4gQ29udHJpYnV0b3Igb2YgMSBjaGFuZ2U6Cj4gPiA+IGYwZGJlNGFhMzVlNyAoIm10
ZDogbmFuZDogbWVkaWF0ZWs6IHJldHVybiBlcnJvciBjb2RlIG9mIAo+ID4gPiBuYW5kX3NjYW5f
aWRlbnQvdGFpbCgpIG9uIGVycm9yIikKPiA+ID4gCj4gPiA+IEkgZ3Vlc3Mgd2UgY291bGQgYWNj
ZXB0IHlvdXIgcGF0Y2ggd2l0aG91dCBhY2tzIGZyb20gV2VpLCBQZXRlciBhbmQgCj4gPiA+IE1h
c2FoaXJvLgo+ID4gPiAKPiA+ID4gWW91IGRlZmluaXRlbHkgbmVlZCBhbiBhcHByb3ZhbCBmcm9t
IE1pcXVlbCwgQm9yaXMgYW5kIFJvZ2VyQ0MuCj4gPiA+IAo+ID4gPiBJdCBkb2Vzbid0IHNlZW0g
eW91IHRvb2sgdGhpcyByZS1saWNlbnNpbmcgdGFzayB0b28gc2VyaW91c2x5Lgo+ID4gPiAKPiA+
ID4gUGxlYXNlIHBheSBtb3JlIGF0dGVudGlvbiB0byB0aGlzIGxpY2Vuc2luZyBwcm9ibGVtLCB5
b3UgY2FuIHN0YXJ0IHdpdGggCj4gPiA+IGRvaW5nCj4gPiA+IGEgc2ltaWxhciByZXNlYXJjaCBm
b3IgbXRrX2VjYy5jIGFuZCBtdGtfZWNjLmguICAKPiA+IAo+ID4gVGhhbmtzIGZvciB5b3VyIEFD
SyBhbmQgZ29vZCBzdWdnZXN0aW9uLiBJdCBpcyByZWFsbHkgaGVscGZ1bCBmb3IgbWUuCj4gPiAK
PiA+IFRoYW5rcywKPiA+IFhpYW9sZWkKPiA+IAo+IAoKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
