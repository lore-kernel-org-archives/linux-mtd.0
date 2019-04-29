Return-Path: <SRS0=nQMH=S7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00A77C43219
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Apr 2019 09:50:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2CD3206BF
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Apr 2019 09:50:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="m8EaJD0z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C2CD3206BF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m5Kq01oUww+06iuz9aABafhhwCoRx2erGsFVGt5/3KY=; b=m8EaJD0zCflGAs
	W49pDYzH63rOrKIrzmeLigliv/9fL3P0zbsJHCThJdUOMoMlLFnRxUVyS6VGJFpgyKkXmNndL86th
	q9TdpHmdmZYA6Rq/piSRdaUrAbEvQkS3grYvn+oF4+UtsEfAgYX41BtAwqebTlGaDCwq9FFfMs2Ul
	vRaQJ2h73TK+9tZ80U1lJq8tP3wiamElisYeJ7kFrjDw4wlVu008QmOMU+O7pdmdiH/hdYjovo1n9
	WcKqqTs6x+xZPOeq+z+GIFqgNmIo+9vFoFB6ex96ng88xAFY/ed1HccHJsXnRG+DbTeXlUrsnrk9K
	8ml6gOsZUCHaQOBtJIQg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hL2vc-0006H7-SB; Mon, 29 Apr 2019 09:50:28 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hL2va-0006Gh-AX; Mon, 29 Apr 2019 09:50:28 +0000
X-UUID: 34d12c9a54f84071917ea6325bdcec05-20190429
X-UUID: 34d12c9a54f84071917ea6325bdcec05-20190429
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <xiaolei.li@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 867523863; Mon, 29 Apr 2019 01:49:53 -0800
Received: from mtkmbs03n1.mediatek.inc (172.21.101.181) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 29 Apr 2019 02:49:52 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by mtkmbs03n1.mediatek.inc
 (172.21.101.181) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Mon, 29 Apr 2019 17:49:50 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 29 Apr 2019 17:49:49 +0800
Message-ID: <1556531389.26455.42.camel@mhfsdcap03>
Subject: Re: [PATCH 2/5] mtd: rawnand: mtk: Improve data sampling timing for
 read cycle
From: xiaolei li <xiaolei.li@mediatek.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Mon, 29 Apr 2019 17:49:49 +0800
In-Reply-To: <20190429111022.50c3182c@xps13>
References: <20190429063834.45967-1-xiaolei.li@mediatek.com>
 <20190429063834.45967-3-xiaolei.li@mediatek.com>
 <20190429111022.50c3182c@xps13>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190429_025026_369813_5A4188D0 
X-CRM114-Status: GOOD (  20.65  )
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

T24gTW9uLCAyMDE5LTA0LTI5IGF0IDExOjEwICswMjAwLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+
IEhpIFhpYW9sZWksCj4gCj4gWGlhb2xlaSBMaSA8eGlhb2xlaS5saUBtZWRpYXRlay5jb20+IHdy
b3RlIG9uIE1vbiwgMjkgQXByIDIwMTkgMTQ6Mzg6MzEKPiArMDgwMDoKPiAKPiA+IEN1cnJlbnRs
eSwgd2UgZXhwYW5kIFJFIyBsb3cgbGV2ZWwgdGltZSBieSBjaG9vc2luZyB0aGUgbWF4IHZhbHVl
Cj4gPiBiZXR3ZWVuIFJFIyBwdWxzZSB3aWR0aCBhbmQgUkUjIGFjY2VzcyB0aW1lLCBhbmQgc2Ft
cGxlIGRhdGEgYXQgdGhlCj4gPiByaXNpbmcgZWRnZSBvZiBSRSMuCj4gPiAKPiA+IFRoZW4sIGlm
IFJFIyBhY2Nlc3MgdGltZSBpcyBiaWdnZXIgdGhhbiBSRSMgcHVsc2Ugd2lkdGgsIHRoZSByZWFs
Cj4gPiByZWFkIGN5Y2xlIHRpbWUgbWF5IGJlIG1vcmUgdGhhbiBOQU5EIFNQRUMgcmVxdWlyZWQu
IFRoaXMgbWFrZXMKPiA+IHJlYWQgcGVyZm9ybWFuY2UgYmUgd29yc2UgdGhhbiB0aGF0IGV4cGVj
dGVkLgo+ID4gCj4gPiBUaGlzIHBhdGNoIGltcHJvdmVzIGRhdGEgc2FtcGxpbmcgdGltaW5nIGJ5
IGNhbGN1bGF0aW5nIFJFIyBsb3cgbGV2ZWwKPiA+IHRpbWUgYWNjb3JkaW5nIHRvIFJFIyBwdWxz
ZSB3aWR0aC4gSWYgUkUjIGFjY2VzcyB0aW1lIGlzIGJpZ2dlciB0aGFuCj4gPiBSRSMgcHVsc2Ug
d2lkdGgsIHRoZW4gZGVsYXkgc2FtcGxpbmcgZGF0YSB0aW1pbmcuCj4gPiAKPiA+IFRoZSByZXN1
bHQgb2YgY29udHJhc3QgdGVzdCBiYXNlIG9uIE1UMjcxMiBldmFsdWF0IGJvYXJkIGlzIGFzIGZv
bGxvdy4KPiA+IAo+ID4gbmFuZDogTWljcm9uIE1UMjlGMTZHMDhBREJDQUg0Cj4gPiBuYW5kOiAy
MDQ4IE1pQiwgU0xDLCBlcmFzZSBzaXplOiAyNTYgS2lCLCBwYWdlIHNpemU6IDQwOTYsIE9PQiBz
aXplOiAyMjQKPiA+IAo+ID4gTkZJIDJ4IGNsb2NrIHJhdGU6IDEyNDgwMDAwMCBIWi4KPiA+IAo+
ID4gVGVzdCB0b29sOiBtdGRfc3BlZWR0ZXN0LmtvCj4gPiAKPiA+IFJlYWQgc3BlZWQgd2l0aG91
dCB0aGlzIHBhdGNoOgo+ID4gbXRkX3NwZWVkdGVzdDogcGFnZSByZWFkIHNwZWVkIGlzIDE0MDEy
IEtpQi9zCj4gPiBtdGRfc3BlZWR0ZXN0OiAyIHBhZ2UgcmVhZCBzcGVlZCBpcyAxNDg2MCBLaUIv
cwo+ID4gCj4gPiBSZWFkIHNwZWVkIHdpdGggdGhpcyBwYXRjaDoKPiA+IG10ZF9zcGVlZHRlc3Q6
IHBhZ2UgcmVhZCBzcGVlZCBpcyAxODcyNCBLaUIvcwo+ID4gbXRkX3NwZWVkdGVzdDogMiBwYWdl
IHJlYWQgc3BlZWQgaXMgMTg3MTMgS2lCL3MKPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogWGlhb2xl
aSBMaSA8eGlhb2xlaS5saUBtZWRpYXRlay5jb20+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL210ZC9u
YW5kL3Jhdy9tdGtfbmFuZC5jIHwgMjIgKysrKysrKysrKysrKysrKysrKysrLQo+ID4gIDEgZmls
ZSBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPiAKPiA+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tdGtfbmFuZC5jIGIvZHJpdmVycy9tdGQvbmFu
ZC9yYXcvbXRrX25hbmQuYwo+ID4gaW5kZXggZGQ4NTVmODYwYTRiLi5hMmY3YWY1MzYzODAgMTAw
NjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tdGtfbmFuZC5jCj4gPiArKysgYi9k
cml2ZXJzL210ZC9uYW5kL3Jhdy9tdGtfbmFuZC5jCj4gPiBAQCAtODcsNiArODcsMTAgQEAKPiA+
ICAjZGVmaW5lIE5GSV9GRE1NKHgpCQkoMHhBNCArICh4KSAqIHNpemVvZih1MzIpICogMikKPiA+
ICAjZGVmaW5lIE5GSV9GRE1fTUFYX1NJWkUJKDgpCj4gPiAgI2RlZmluZSBORklfRkRNX01JTl9T
SVpFCSgxKQo+ID4gKyNkZWZpbmUgTkZJX0RFQlVHX0NPTjEJCSgweDIyMCkKPiA+ICsjZGVmaW5l
CQlTVFJPQkVfTUFTSwkJR0VOTUFTSyg0LCAzKQo+ID4gKyNkZWZpbmUJCVNUUk9CRV9TSElGVAkJ
KDMpCj4gPiArI2RlZmluZQkJTUFYX1NUUk9CRV9ETFkJCSgzKQo+ID4gICNkZWZpbmUgTkZJX01B
U1RFUl9TVEEJCSgweDIyNCkKPiA+ICAjZGVmaW5lCQlNQVNURVJfU1RBX01BU0sJCSgweDBGRkYp
Cj4gPiAgI2RlZmluZSBORklfRU1QVFlfVEhSRVNICSgweDIzQykKPiA+IEBAIC01MDksNiArNTEz
LDcgQEAgc3RhdGljIGludCBtdGtfbmZjX3NldHVwX2RhdGFfaW50ZXJmYWNlKHN0cnVjdCBuYW5k
X2NoaXAgKmNoaXAsIGludCBjc2xpbmUsCj4gPiAgCXN0cnVjdCBtdGtfbmZjICpuZmMgPSBuYW5k
X2dldF9jb250cm9sbGVyX2RhdGEoY2hpcCk7Cj4gPiAgCWNvbnN0IHN0cnVjdCBuYW5kX3Nkcl90
aW1pbmdzICp0aW1pbmdzOwo+ID4gIAl1MzIgcmF0ZSwgdHBvZWNzLCB0cHJlY3MsIHRjMnIsIHR3
MnIsIHR3aCwgdHdzdCA9IDAsIHRybHQgPSAwOwo+ID4gKwl1MzIgdHNlbCwgcmVnOwo+ID4gIAo+
ID4gIAl0aW1pbmdzID0gbmFuZF9nZXRfc2RyX3RpbWluZ3MoY29uZik7Cj4gPiAgCWlmIChJU19F
UlIodGltaW5ncykpCj4gPiBAQCAtNTU2LDEwICs1NjEsMjUgQEAgc3RhdGljIGludCBtdGtfbmZj
X3NldHVwX2RhdGFfaW50ZXJmYWNlKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsIGludCBjc2xpbmUs
Cj4gPiAgCWlmICgodHdoICsgMSkgKiAxMDAwMDAwIC8gcmF0ZSA8IHRpbWluZ3MtPnRSQ19taW4g
LyAxMDAwKQo+ID4gIAkJdHJsdCA9ICh0aW1pbmdzLT50UkNfbWluIC8gMTAwMCAtICh0d2ggKyAx
KSAqIDEwMDAwMDAgLyByYXRlKQo+ID4gIAkJCSogMTAwMDsKPiA+IC0JdHJsdCA9IG1heDModHJs
dCwgdGltaW5ncy0+dFJFQV9tYXgsIHRpbWluZ3MtPnRSUF9taW4pIC8gMTAwMDsKPiA+ICsJdHJs
dCA9IG1heCh0cmx0LCB0aW1pbmdzLT50UlBfbWluKSAvIDEwMDA7Cj4gPiAgCXRybHQgPSBESVZf
Uk9VTkRfVVAodHJsdCAqIHJhdGUsIDEwMDAwMDApIC0gMTsKPiA+ICAJdHJsdCAmPSAweGY7Cj4g
PiAgCj4gPiArCS8qIENhbGN1bGF0ZSBzdHJvYmUgc2VsICovCj4gPiArCXJlZyA9IG5maV9yZWFk
bChuZmMsIE5GSV9ERUJVR19DT04xKTsKPiA+ICsJcmVnICY9IH5TVFJPQkVfTUFTSzsKPiA+ICsJ
aWYgKCh0cmx0ICsgMSkgKiAxMDAwMDAwIC8gcmF0ZSA8IHRpbWluZ3MtPnRSRUFfbWF4IC8gMTAw
MCkgewo+IAo+IFBsZWFzZSBkbyB0aGUgY2FsY3VsYXRpb24gYW5kIGNvbmRpdGlvbiBpbiBzZXBh
cmF0ZSBzdGVwLCB0aGlzIGlzCj4gaGFyZGx5IHJlYWRhYmxlLiBNYXliZSB5b3UgY2FuIGV4cGxh
aW4gaXQgd2l0aCBhIGNvbW1lbnQgYXMgd2VsbC4KU29ycnkgdG8gdHJvdWJsZSB5b3UuCkkgd2ls
bCBjaGFuZ2UgaXQgYXMgeW91ciBhZHZpY2UgaW4gbmV4dCBwYXRjaCB2ZXJzaW9uLgoKPiAKPiA+
ICsJCXRzZWwgPSB0aW1pbmdzLT50UkVBX21heCAvIDEwMDA7Cj4gPiArCQl0c2VsID0gRElWX1JP
VU5EX1VQKHRzZWwgKiByYXRlLCAxMDAwMDAwKTsKPiAKPiBBcmUgeW91IHN1cmUgdHNlbCAqIHJh
dGUgY2Fubm90IG92ZXJmbG93PwpUaGFua3MgZm9yIHlvdXIgcmVtaW5kaW5nLgpUaGUgdW5pdCBv
ZiB0c2VsIGhlcmUgaXMgbmFubyBzZWNvbmQsIGFuZCB0aGUgdW5pdCBvZiByYXRlIGlzIEtIWi4K
VGhlcmUgc2hvdWxkIGJlIG5vIG92ZXJmbG93aW5nIGhlcmUuCgo+IAo+ID4gKwkJdHNlbCAtPSAo
dHJsdCArIDEpOwo+ID4gKwkJaWYgKHRzZWwgPiBNQVhfU1RST0JFX0RMWSkgewo+ID4gKwkJCXRy
bHQgKz0gdHNlbCAtIE1BWF9TVFJPQkVfRExZOwo+ID4gKwkJCXRzZWwgPSBNQVhfU1RST0JFX0RM
WTsKPiA+ICsJCX0KPiA+ICsJCXJlZyB8PSB0c2VsIDw8IFNUUk9CRV9TSElGVDsKPiA+ICsJfQo+
ID4gKwluZmlfd3JpdGVsKG5mYywgcmVnLCBORklfREVCVUdfQ09OMSk7Cj4gPiArCj4gPiAgCS8q
Cj4gPiAgCSAqIEFDQ09OOiBhY2Nlc3MgdGltaW5nIGNvbnRyb2wgcmVnaXN0ZXIKPiA+ICAJICog
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+IAo+IAo+IAo+IAo+IFRoYW5r
cywKPiBNaXF1w6hsCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
