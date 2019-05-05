Return-Path: <SRS0=tJq/=TF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,T_DKIMWL_WL_HIGH,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4CD4C004C9
	for <linux-mtd@archiver.kernel.org>; Sun,  5 May 2019 07:29:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9EF49206DF
	for <linux-mtd@archiver.kernel.org>; Sun,  5 May 2019 07:29:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mNUUcyKg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9EF49206DF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SYm0klP5ALrswJv7Rq/PxfxVvqW9V87N4X6A91djvbw=; b=mNUUcyKgfRJuBG
	McMa0js7T115y4OMSFDibL5EkmZQ4bmZDAXYsw9fYVIhKPm2+SU+qkb620cIP9yhbIzyAI/Lrilfo
	yXbNesK2eXP+W6rMvmC3212GnD4p3dQ8fUNAdelr3Qxfz0gMAKTSzmxF9j/cRGL1dmYgyy+wGpbDi
	NgJ0aatrQBwKHNMKlS+4efMqiiPpwkpqiCJSyEn/zh3DUghW2bfi+N53mhSimKROETQGDSikyKUiu
	EtkblhvNW2/khiGkmcvpnFu6aF1RbxQcNHAqjzGoVaxjfMpCPBntbD6iqg8y1a+/oG1VnEonsS9A0
	/Dr9/yDTDhrdeucimK1w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hNBaR-0004E6-P5; Sun, 05 May 2019 07:29:27 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hNBaN-0004Da-Ne; Sun, 05 May 2019 07:29:25 +0000
X-UUID: 5106ebc5e8b24489bde6dadc560f0aa4-20190504
X-UUID: 5106ebc5e8b24489bde6dadc560f0aa4-20190504
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <xiaolei.li@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1705114459; Sat, 04 May 2019 23:29:20 -0800
Received: from mtkmbs03n2.mediatek.inc (172.21.101.182) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 5 May 2019 00:29:18 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by mtkmbs03n2.mediatek.inc
 (172.21.101.182) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Sun, 5 May 2019 15:29:04 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Sun, 5 May 2019 15:29:03 +0800
Message-ID: <1557041343.26455.62.camel@mhfsdcap03>
Subject: Re: [PATCH v2 2/5] mtd: rawnand: mtk: Improve data sampling timing
 for read cycle
From: xiaolei li <xiaolei.li@mediatek.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Sun, 5 May 2019 15:29:03 +0800
In-Reply-To: <20190430141152.3d215b52@xps13>
References: <20190430100250.28083-1-xiaolei.li@mediatek.com>
 <20190430100250.28083-3-xiaolei.li@mediatek.com>
 <20190430141152.3d215b52@xps13>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 0958E605BA10DCB46C873BADAECE497FE58C24E9524951AE0F82D6808F72721E2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190505_002923_776214_C4521EC9 
X-CRM114-Status: GOOD (  21.88  )
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

T24gVHVlLCAyMDE5LTA0LTMwIGF0IDE0OjExICswMjAwLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+
IEhpIFhpYW9sZWksCj4gCj4gWGlhb2xlaSBMaSA8eGlhb2xlaS5saUBtZWRpYXRlay5jb20+IHdy
b3RlIG9uIFR1ZSwgMzAgQXByIDIwMTkgMTg6MDI6NDcKPiArMDgwMDoKPiAKPiA+IEN1cnJlbnRs
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
aXplOiAyMjQKPiA+IE5GSSAyeCBjbG9jayByYXRlOiAxMjQ4MDAwMDAgSFouCj4gPiAKPiA+IFJl
YWQgc3BlZWQgd2l0aG91dCB0aGlzIHBhdGNoOgo+ID4gbXRkX3NwZWVkdGVzdDogcGFnZSByZWFk
IHNwZWVkIGlzIDE0MDEyIEtpQi9zCj4gPiBtdGRfc3BlZWR0ZXN0OiAyIHBhZ2UgcmVhZCBzcGVl
ZCBpcyAxNDg2MCBLaUIvcwo+ID4gCj4gPiBSZWFkIHNwZWVkIHdpdGggdGhpcyBwYXRjaDoKPiA+
IG10ZF9zcGVlZHRlc3Q6IHBhZ2UgcmVhZCBzcGVlZCBpcyAxODcyNCBLaUIvcwo+ID4gbXRkX3Nw
ZWVkdGVzdDogMiBwYWdlIHJlYWQgc3BlZWQgaXMgMTg3MTMgS2lCL3MKPiA+IAo+ID4gU2lnbmVk
LW9mZi1ieTogWGlhb2xlaSBMaSA8eGlhb2xlaS5saUBtZWRpYXRlay5jb20+Cj4gPiAtLS0KPiA+
ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9tdGtfbmFuZC5jIHwgNDYgKysrKysrKysrKysrKysrKysr
KysrKysrKystLS0tLS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDM2IGluc2VydGlvbnMoKyksIDEw
IGRlbGV0aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcv
bXRrX25hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L210a19uYW5kLmMKPiA+IGluZGV4IDRm
YmIwYzZlY2FlMy4uZTkwYzM4YzZmODM1IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9tdGQvbmFu
ZC9yYXcvbXRrX25hbmQuYwo+ID4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbXRrX25hbmQu
Ywo+ID4gQEAgLTg3LDYgKzg3LDEwIEBACj4gPiAgI2RlZmluZSBORklfRkRNTSh4KQkJKDB4QTQg
KyAoeCkgKiBzaXplb2YodTMyKSAqIDIpCj4gPiAgI2RlZmluZSBORklfRkRNX01BWF9TSVpFCSg4
KQo+ID4gICNkZWZpbmUgTkZJX0ZETV9NSU5fU0laRQkoMSkKPiA+ICsjZGVmaW5lIE5GSV9ERUJV
R19DT04xCQkoMHgyMjApCj4gPiArI2RlZmluZQkJU1RST0JFX01BU0sJCUdFTk1BU0soNCwgMykK
PiA+ICsjZGVmaW5lCQlTVFJPQkVfU0hJRlQJCSgzKQo+ID4gKyNkZWZpbmUJCU1BWF9TVFJPQkVf
RExZCQkoMykKPiA+ICAjZGVmaW5lIE5GSV9NQVNURVJfU1RBCQkoMHgyMjQpCj4gPiAgI2RlZmlu
ZQkJTUFTVEVSX1NUQV9NQVNLCQkoMHgwRkZGKQo+ID4gICNkZWZpbmUgTkZJX0VNUFRZX1RIUkVT
SAkoMHgyM0MpCj4gPiBAQCAtNTA5LDcgKzUxMyw3IEBAIHN0YXRpYyBpbnQgbXRrX25mY19zZXR1
cF9kYXRhX2ludGVyZmFjZShzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLCBpbnQgY3NsaW5lLAo+ID4g
IAlzdHJ1Y3QgbXRrX25mYyAqbmZjID0gbmFuZF9nZXRfY29udHJvbGxlcl9kYXRhKGNoaXApOwo+
ID4gIAljb25zdCBzdHJ1Y3QgbmFuZF9zZHJfdGltaW5ncyAqdGltaW5nczsKPiA+ICAJdTMyIHJh
dGUsIHRwb2VjcywgdHByZWNzLCB0YzJyLCB0dzJyLCB0d2gsIHR3c3QgPSAwLCB0cmx0ID0gMDsK
PiA+IC0JdTMyIHRob2xkOwo+ID4gKwl1MzIgdGVtcCwgdHNlbCA9IDA7Cj4gPiAgCj4gPiAgCXRp
bWluZ3MgPSBuYW5kX2dldF9zZHJfdGltaW5ncyhjb25mKTsKPiA+ICAJaWYgKElTX0VSUih0aW1p
bmdzKSkKPiA+IEBAIC01NDYsMzAgKzU1MCw1MiBAQCBzdGF0aWMgaW50IG10a19uZmNfc2V0dXBf
ZGF0YV9pbnRlcmZhY2Uoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwgaW50IGNzbGluZSwKPiA+ICAJ
dHdoICY9IDB4ZjsKPiA+ICAKPiA+ICAJLyogQ2FsY3VsYXRlIHJlYWwgV0UjL1JFIyBob2xkIHRp
bWUgaW4gbmFub3NlY29uZCAqLwo+ID4gLQl0aG9sZCA9ICh0d2ggKyAxKSAqIDEwMDAwMDAgLyBy
YXRlOwo+ID4gKwl0ZW1wID0gKHR3aCArIDEpICogMTAwMDAwMCAvIHJhdGU7Cj4gPiAgCS8qIG5h
bm9zZWNvbmQgdG8gcGljb3NlY29uZCAqLwo+ID4gLQl0aG9sZCAqPSAxMDAwOwo+ID4gKwl0ZW1w
ICo9IDEwMDA7Cj4gPiAgCj4gPiAgCS8qKgo+ID4gIAkgKiBXRSMgbG93IGxldmVsIHRpbWUgc2hv
dWxkIGJlIGV4cGFuZWQgdG8gbWVldCBXRSMgcHVsc2UgdGltZQo+ID4gIAkgKiBhbmQgV0UjIGN5
Y2xlIHRpbWUgYXQgdGhlIHNhbWUgdGltZS4KPiA+ICAJICovCj4gPiAtCWlmICh0aG9sZCA8IHRp
bWluZ3MtPnRXQ19taW4pCj4gPiAtCQl0d3N0ID0gdGltaW5ncy0+dFdDX21pbiAtIHRob2xkOwo+
ID4gKwlpZiAodGVtcCA8IHRpbWluZ3MtPnRXQ19taW4pCj4gPiArCQl0d3N0ID0gdGltaW5ncy0+
dFdDX21pbiAtIHRlbXA7Cj4gPiAgCXR3c3QgPSBtYXgodGltaW5ncy0+dFdQX21pbiwgdHdzdCkg
LyAxMDAwOwo+ID4gIAl0d3N0ID0gRElWX1JPVU5EX1VQKHR3c3QgKiByYXRlLCAxMDAwMDAwKSAt
IDE7Cj4gPiAgCXR3c3QgJj0gMHhmOwo+ID4gIAo+ID4gIAkvKioKPiA+IC0JICogUkUjIGxvdyBs
ZXZlbCB0aW1lIHNob3VsZCBiZSBleHBhbmVkIHRvIG1lZXQgUkUjIHB1bHNlIHRpbWUsCj4gPiAt
CSAqIFJFIyBhY2Nlc3MgdGltZSBhbmQgUkUjIGN5Y2xlIHRpbWUgYXQgdGhlIHNhbWUgdGltZS4K
PiA+ICsJICogUkUjIGxvdyBsZXZlbCB0aW1lIHNob3VsZCBiZSBleHBhbmVkIHRvIG1lZXQgUkUj
IHB1bHNlIHRpbWUKPiA+ICsJICogYW5kIFJFIyBjeWNsZSB0aW1lIGF0IHRoZSBzYW1lIHRpbWUu
Cj4gPiAgCSAqLwo+ID4gLQlpZiAodGhvbGQgPCB0aW1pbmdzLT50UkNfbWluKQo+ID4gLQkJdHJs
dCA9IHRpbWluZ3MtPnRSQ19taW4gLSB0aG9sZDsKPiA+IC0JdHJsdCA9IG1heDModHJsdCwgdGlt
aW5ncy0+dFJFQV9tYXgsIHRpbWluZ3MtPnRSUF9taW4pIC8gMTAwMDsKPiA+ICsJaWYgKHRlbXAg
PCB0aW1pbmdzLT50UkNfbWluKQo+ID4gKwkJdHJsdCA9IHRpbWluZ3MtPnRSQ19taW4gLSB0ZW1w
Owo+ID4gKwl0cmx0ID0gbWF4KHRybHQsIHRpbWluZ3MtPnRSUF9taW4pIC8gMTAwMDsKPiA+ICAJ
dHJsdCA9IERJVl9ST1VORF9VUCh0cmx0ICogcmF0ZSwgMTAwMDAwMCkgLSAxOwo+ID4gIAl0cmx0
ICY9IDB4ZjsKPiA+ICAKPiA+ICsJLyoqCj4gCj4gICAgICAgICAvKgo+IAo+ID4gKwkgKiBDYWxj
dWxhdGUgc3Ryb2JlIHNlbGVjdCB0aW1pbmcuCj4gPiArCSAqIElmIFJFIyBhY2Nlc3MgdGltZSBp
cyBiaWdnZXIgdGhhbiBSRSMgcHVsc2UgdGltZSwKPiA+ICsJICogZGVsYXkgc2FtcGxpbmcgZGF0
YSB0aW1pbmcuCj4gPiArCSAqLwo+ID4gKwl0ZW1wID0gKHRybHQgKyAxKSAqIDEwMDAwMDAgLyBy
YXRlOwo+IAo+IFlvdSBjb3VsZCBwcmVjaXNlIHdoYXQgdW5pdCBjb252ZXJzaW9uIHlvdSBkbyBo
ZXJlLgpPSy4gVW5pdCBoZXJlIGlzIG5hbm9zZWNvbmQuIEkgd2lsbCBkZXNjcmliZSBpdCBpbiBu
ZXh0IHBhdGNoIHZlcnNpb24uCgo+IAo+ID4gKwkvKiBuYW5vc2Vjb25kIHRvIHBpY29zZWNvbmQg
Ki8KPiA+ICsJdGVtcCAqPSAxMDAwOwo+ID4gKwlpZiAodGVtcCA8IHRpbWluZ3MtPnRSRUFfbWF4
KSB7Cj4gPiArCQl0c2VsID0gdGltaW5ncy0+dFJFQV9tYXggLyAxMDAwOwo+ID4gKwkJdHNlbCA9
IERJVl9ST1VORF9VUCh0c2VsICogcmF0ZSwgMTAwMDAwMCk7Cj4gPiArCQl0c2VsIC09ICh0cmx0
ICsgMSk7Cj4gPiArCQlpZiAodHNlbCA+IE1BWF9TVFJPQkVfRExZKSB7Cj4gPiArCQkJdHJsdCAr
PSB0c2VsIC0gTUFYX1NUUk9CRV9ETFk7Cj4gPiArCQkJdHNlbCA9IE1BWF9TVFJPQkVfRExZOwo+
ID4gKwkJfQo+ID4gKwl9Cj4gPiArCXRlbXAgPSBuZmlfcmVhZGwobmZjLCBORklfREVCVUdfQ09O
MSk7Cj4gPiArCXRlbXAgJj0gflNUUk9CRV9NQVNLOwo+ID4gKwl0ZW1wIHw9IHRzZWwgPDwgU1RS
T0JFX1NISUZUOwo+ID4gKwluZmlfd3JpdGVsKG5mYywgdGVtcCwgTkZJX0RFQlVHX0NPTjEpOwo+
ID4gKwo+ID4gIAkvKgo+ID4gIAkgKiBBQ0NPTjogYWNjZXNzIHRpbWluZyBjb250cm9sIHJlZ2lz
dGVyCj4gPiAgCSAqIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAKPiBX
aXRoIHRoaXM6Cj4gCj4gUmV2aWV3ZWQtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxA
Ym9vdGxpbi5jb20+Cj4gCj4gCj4gVGhhbmtzLAo+IE1pcXXDqGwKClRoYW5rcywKWGlhb2xlaQoK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
