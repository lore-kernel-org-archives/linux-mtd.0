Return-Path: <SRS0=nQMH=S7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71BE2C43219
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Apr 2019 09:52:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4033C20449
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Apr 2019 09:52:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PTZjnWGJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4033C20449
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eu8LEM6U7siWTHicw26tqV6t9qNIbax8IxhBDai4YCU=; b=PTZjnWGJDt7Ai/
	Cm46PGF86lelKPIdEICWkasbjfOVxTSSJ/ksp+4QgEX1tDFTCrWIKn6CDtl348kYwSH/qrmuIinsw
	j6pVA3OdAjiq0q3WtLakbHRaFz4/n8lskJtlBQpk5EU+8GJ0NcP5jC1aQ+0ST2er5rYfiZkEYArwi
	fBpfMv7qak6IY01i+0LdJRjr61LGdbPp/5zP3b85sfyiT3kjWsqxBWipInE1w3T5eIGIlvxnyaPgf
	Nw2s1n0VntE/106Pl8QNRZWMHIAwLq1c1UQAXCAZVPgr37gVbvLn9PUQA4OEvAeofKsZtmn7F12Bx
	FJrwlkB1R/jgnxYYokkw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hL2xj-0006uf-4U; Mon, 29 Apr 2019 09:52:39 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hL2xh-0006uG-7a; Mon, 29 Apr 2019 09:52:38 +0000
X-UUID: 2181e861ee294d2f9da6a30ec8089b8d-20190429
X-UUID: 2181e861ee294d2f9da6a30ec8089b8d-20190429
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <xiaolei.li@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1365401011; Mon, 29 Apr 2019 01:52:26 -0800
Received: from mtkmbs03n2.mediatek.inc (172.21.101.182) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 29 Apr 2019 02:52:24 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by mtkmbs03n2.mediatek.inc
 (172.21.101.182) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Mon, 29 Apr 2019 17:52:16 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 29 Apr 2019 17:52:15 +0800
Message-ID: <1556531535.26455.44.camel@mhfsdcap03>
Subject: Re: [PATCH 4/5] mtd: rawnand: mtk: Fix wrongly assigned oob buffer
 pointer issue
From: xiaolei li <xiaolei.li@mediatek.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Mon, 29 Apr 2019 17:52:15 +0800
In-Reply-To: <20190429111425.0c91c2f3@xps13>
References: <20190429063834.45967-1-xiaolei.li@mediatek.com>
 <20190429063834.45967-5-xiaolei.li@mediatek.com>
 <20190429111425.0c91c2f3@xps13>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 9CEE499A7C023DC3FCBC64B10689F157FD32EAFE9D7D23668E42497C004AE61F2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190429_025237_272957_CE5DE2F5 
X-CRM114-Status: GOOD (  18.02  )
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
Cc: richard@nod.at, linux-mediatek@lists.infradead.org,
 linux-mtd@lists.infradead.org, srv_heupstream@mediatek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWlxdWVsLAoKT24gTW9uLCAyMDE5LTA0LTI5IGF0IDExOjE0ICswMjAwLCBNaXF1ZWwgUmF5
bmFsIHdyb3RlOgo+IEhpIFhpYW9sZWksCj4gCj4gWGlhb2xlaSBMaSA8eGlhb2xlaS5saUBtZWRp
YXRlay5jb20+IHdyb3RlIG9uIE1vbiwgMjkgQXByIDIwMTkgMTQ6Mzg6MzMKPiArMDgwMDoKPiAK
PiA+IE9uZSBtYWluIGdvYWwgb2YgdGhlIGZ1bmN0aW9uIG10a19uZmNfdXBkYXRlX2VjY19zdGF0
cyBpcyB0byBjaGVjawo+ID4gd2hldGhlciBzZWN0b3JzIGFyZSBhbGwgZW1wdHkuIElmIHRoZXkg
YXJlIGVtcHR5LCBzZXQgdGhlc2Ugc2VjdG9ycydzCj4gPiBkYXRhIGJ1ZmZlciBhbmQgb29iIGJ1
ZmZlciBhcyAweGZmLgo+ID4gCj4gPiBCdXQgbm93LCB0aGUgc2VjdG9yIG9vYiBidWZmZXIgcG9p
bnRlciBpcyB3cm9uZ2x5IGFzc2lnbmVkLiBXZSBhbHdheXMKPiA+IGRvIG1lbXNldCBmcm9tIHNl
Y3RvciAwLgo+ID4gCj4gPiBUbyBmaXggdGhpcyBpc3N1ZSwgcGFzcyBzdGFydCBzZWNvdHIgbnVt
YmVyIHRvIG1ha2Ugb29iIGJ1ZmZlciBwb2ludGVyCj4gCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBzZWN0b3IKVGhhbmtzLiBXaWxsIGNoYW5nZSB0aGlzIHR5cG8uCgo+IAo+ID4g
YmUgcHJvcGVybHkgYXNzaWduZWQuCj4gCj4gUGxlYXNlIHVzZSB1cHBlciBjYXNlIGZvciBwbGFp
biBFbmdsaXNoIGFjcm9ueW1zOiBOQU5ELCBFQ0MsIE9PQiwgZXRjLgpPSy4KCj4gCj4gPiAKPiA+
IEZpeGVzOiA5M2RiNDQ2YTQyNGMgKCJtdGQ6IG5hbmQ6IG1vdmUgcmF3IE5BTkQgcmVsYXRlZCBj
b2RlIHRvIHRoZSByYXcvIHN1YmRpciIpCj4gCj4gU2FtZSBjb21tZW50IGFzIGJlZm9yZSwgd3Jv
bmcgY29tbWl0IHBvaW50ZWQgaW4gdGhlIEZpeGVzIHRhZy4KPiAKPiA+IFNpZ25lZC1vZmYtYnk6
IFhpYW9sZWkgTGkgPHhpYW9sZWkubGlAbWVkaWF0ZWsuY29tPgo+ID4gLS0tCj4gPiAgZHJpdmVy
cy9tdGQvbmFuZC9yYXcvbXRrX25hbmQuYyB8IDIxICsrKysrKysrKystLS0tLS0tLS0tLQo+ID4g
IDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkKPiA+IAo+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L210a19uYW5kLmMgYi9kcml2ZXJz
L210ZC9uYW5kL3Jhdy9tdGtfbmFuZC5jCj4gPiBpbmRleCA3YTVlOGM5Y2Y2MWIuLmNmNWU1MGU3
MDRhZSAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L210a19uYW5kLmMKPiA+
ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L210a19uYW5kLmMKPiA+IEBAIC04NzMsMTkgKzg3
MywyMSBAQCBzdGF0aWMgaW50IG10a19uZmNfd3JpdGVfb29iX3N0ZChzdHJ1Y3QgbmFuZF9jaGlw
ICpjaGlwLCBpbnQgcGFnZSkKPiA+ICAJcmV0dXJuIG10a19uZmNfd3JpdGVfcGFnZV9yYXcoY2hp
cCwgTlVMTCwgMSwgcGFnZSk7Cj4gPiAgfQo+ID4gIAo+ID4gLXN0YXRpYyBpbnQgbXRrX25mY191
cGRhdGVfZWNjX3N0YXRzKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCB1OCAqYnVmLCB1MzIgc2VjdG9y
cykKPiA+ICtzdGF0aWMgaW50IG10a19uZmNfdXBkYXRlX2VjY19zdGF0cyhzdHJ1Y3QgbXRkX2lu
Zm8gKm10ZCwgdTggKmJ1ZiwgdTMyIHN0YXJ0LAo+ID4gKwkJCQkgICAgdTMyIHNlY3RvcnMpCj4g
PiAgewo+ID4gIAlzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwID0gbXRkX3RvX25hbmQobXRkKTsKPiA+
ICAJc3RydWN0IG10a19uZmMgKm5mYyA9IG5hbmRfZ2V0X2NvbnRyb2xsZXJfZGF0YShjaGlwKTsK
PiA+ICAJc3RydWN0IG10a19uZmNfbmFuZF9jaGlwICptdGtfbmFuZCA9IHRvX210a19uYW5kKGNo
aXApOwo+ID4gIAlzdHJ1Y3QgbXRrX2VjY19zdGF0cyBzdGF0czsKPiA+ICsJdTMyIHJlZ19zaXpl
ID0gbXRrX25hbmQtPmZkbS5yZWdfc2l6ZTsKPiA+ICAJaW50IHJjLCBpOwo+ID4gIAo+ID4gIAly
YyA9IG5maV9yZWFkbChuZmMsIE5GSV9TVEEpICYgU1RBX0VNUF9QQUdFOwo+ID4gIAlpZiAocmMp
IHsKPiA+ICAJCW1lbXNldChidWYsIDB4ZmYsIHNlY3RvcnMgKiBjaGlwLT5lY2Muc2l6ZSk7Cj4g
PiAgCQlmb3IgKGkgPSAwOyBpIDwgc2VjdG9yczsgaSsrKQo+ID4gLQkJCW1lbXNldChvb2JfcHRy
KGNoaXAsIGkpLCAweGZmLCBtdGtfbmFuZC0+ZmRtLnJlZ19zaXplKTsKPiA+ICsJCQltZW1zZXQo
b29iX3B0cihjaGlwLCBzdGFydCArIGkpLCAweGZmLCByZWdfc2l6ZSk7Cj4gPiAgCQlyZXR1cm4g
MDsKPiA+ICAJfQo+ID4gIAo+ID4gQEAgLTkwNSw3ICs5MDcsNyBAQCBzdGF0aWMgaW50IG10a19u
ZmNfcmVhZF9zdWJwYWdlKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBzdHJ1Y3QgbmFuZF9jaGlwICpj
aGlwLAo+ID4gIAl1MzIgc3BhcmUgPSBtdGtfbmFuZC0+c3BhcmVfcGVyX3NlY3RvcjsKPiA+ICAJ
dTMyIGNvbHVtbiwgc2VjdG9ycywgc3RhcnQsIGVuZCwgcmVnOwo+ID4gIAlkbWFfYWRkcl90IGFk
ZHI7Cj4gPiAtCWludCBiaXRmbGlwczsKPiA+ICsJaW50IGJpdGZsaXBzID0gMDsKPiA+ICAJc2l6
ZV90IGxlbjsKPiA+ICAJdTggKmJ1ZjsKPiA+ICAJaW50IHJjOwo+ID4gQEAgLTk3MiwxNCArOTc0
LDExIEBAIHN0YXRpYyBpbnQgbXRrX25mY19yZWFkX3N1YnBhZ2Uoc3RydWN0IG10ZF9pbmZvICpt
dGQsIHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsCj4gPiAgCWlmIChyYyA8IDApIHsKPiA+ICAJCWRl
dl9lcnIobmZjLT5kZXYsICJzdWJwYWdlIGRvbmUgdGltZW91dFxuIik7Cj4gPiAgCQliaXRmbGlw
cyA9IC1FSU87Cj4gPiAtCX0gZWxzZSB7Cj4gPiAtCQliaXRmbGlwcyA9IDA7Cj4gPiAtCQlpZiAo
IXJhdykgewo+ID4gLQkJCXJjID0gbXRrX2VjY193YWl0X2RvbmUobmZjLT5lY2MsIEVDQ19ERUNP
REUpOwo+ID4gLQkJCWJpdGZsaXBzID0gcmMgPCAwID8gLUVUSU1FRE9VVCA6Cj4gPiAtCQkJCW10
a19uZmNfdXBkYXRlX2VjY19zdGF0cyhtdGQsIGJ1Ziwgc2VjdG9ycyk7Cj4gPiAtCQkJbXRrX25m
Y19yZWFkX2ZkbShjaGlwLCBzdGFydCwgc2VjdG9ycyk7Cj4gPiAtCQl9Cj4gPiArCX0gZWxzZSBp
ZiAoIXJhdykgewo+ID4gKwkJcmMgPSBtdGtfZWNjX3dhaXRfZG9uZShuZmMtPmVjYywgRUNDX0RF
Q09ERSk7Cj4gPiArCQliaXRmbGlwcyA9IHJjIDwgMCA/IC1FVElNRURPVVQgOgo+ID4gKwkJCW10
a19uZmNfdXBkYXRlX2VjY19zdGF0cyhtdGQsIGJ1Ziwgc3RhcnQsIHNlY3RvcnMpOwo+ID4gKwkJ
bXRrX25mY19yZWFkX2ZkbShjaGlwLCBzdGFydCwgc2VjdG9ycyk7Cj4gPiAgCX0KPiA+ICAKPiA+
ICAJZG1hX3VubWFwX3NpbmdsZShuZmMtPmRldiwgYWRkciwgbGVuLCBETUFfRlJPTV9ERVZJQ0Up
Owo+IAo+IFdpdGggdGhpcyBhZGRyZXNzZWQ6Cj4gCj4gUmV2aWV3ZWQtYnk6IE1pcXVlbCBSYXlu
YWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cj4gCj4gCj4gVGhhbmtzLAo+IE1pcXXDqGwK
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
