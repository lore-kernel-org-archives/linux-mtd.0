Return-Path: <SRS0=nQMH=S7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4EEEC43219
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Apr 2019 09:36:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94D1C206BF
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Apr 2019 09:36:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L36ENfn9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94D1C206BF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cJuC/vj/a6AqRA6/a/r4cBfua8hzOE07U7WuYq+0Rv4=; b=L36ENfn94vxAxt
	yiSWsLuSFUvVL9nyls6DCNZQllLGPWltIrN1dQcfa8JCn93ueRZJAZYIKxl6pmxrhtDlWAuvXjfmZ
	Imn3YF56I2bQ5xvPO/yzX2QJeVeIOMLO+FMI7NQk4bwiLpKyHJJAMGkRwgiI6vYmztDDzynWOgwX4
	E97WBq86012hjqvGrJq8Z0a6FekjZuQJs5wP2STUPK46adVNFgGPrXVsMU+4inVDzx517gcwSkgyB
	4UGUoyeJVbSFE01mLrjncy1iPRkb9c8lni+LSgKR1ShxAObmb2Iz+LfH0xdwBv/N7StIBOcpWImBY
	FNdJxMWKnwI6Lu+OOKSA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hL2hx-0000hd-Fn; Mon, 29 Apr 2019 09:36:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hL2hu-0000gz-5G; Mon, 29 Apr 2019 09:36:20 +0000
X-UUID: 517449136baa4c1e98f8f45e8639dfac-20190429
X-UUID: 517449136baa4c1e98f8f45e8639dfac-20190429
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <xiaolei.li@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 806393986; Mon, 29 Apr 2019 01:35:57 -0800
Received: from mtkmbs03n2.mediatek.inc (172.21.101.182) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 29 Apr 2019 02:35:56 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by mtkmbs03n2.mediatek.inc
 (172.21.101.182) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Mon, 29 Apr 2019 17:35:54 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 29 Apr 2019 17:35:53 +0800
Message-ID: <1556530553.26455.35.camel@mhfsdcap03>
Subject: Re: [PATCH 1/5] mtd: rawnand: mtk: Correct low level time
 calculation of r/w cycle
From: xiaolei li <xiaolei.li@mediatek.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Mon, 29 Apr 2019 17:35:53 +0800
In-Reply-To: <20190429110341.208c096e@xps13>
References: <20190429063834.45967-1-xiaolei.li@mediatek.com>
 <20190429063834.45967-2-xiaolei.li@mediatek.com>
 <20190429110341.208c096e@xps13>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 00612B8221EC8C00CAAB723A0F726EF4394B644C9F32F9ACFC1F3347DB235B402000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190429_023618_730903_59E4C3FE 
X-CRM114-Status: GOOD (  21.91  )
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

SGkgTWlxdWVsLAoKVGhhbmtzIGZvciB5b3VyIHJldmlldy4KCgpPbiBNb24sIDIwMTktMDQtMjkg
YXQgMTE6MDMgKzAyMDAsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gSGkgWGlhb2xlaSwKPiAKPiBY
aWFvbGVpIExpIDx4aWFvbGVpLmxpQG1lZGlhdGVrLmNvbT4gd3JvdGUgb24gTW9uLCAyOSBBcHIg
MjAxOSAxNDozODozMAo+ICswODAwOgo+IAo+ID4gQXQgcHJlc2VudCwgdGhlIGZsb3cgb2YgY2Fs
Y3VsYXRpbmcgQUMgdGltaW5nIG9mIHJlYWQvd3JpdGUgY3ljbGUgaW4gU0RSCj4gPiBtb2RlIGlz
IHRoYXQ6Cj4gPiBBdCBmaXJzdCwgY2FsY3VsYXRlIGhpZ2ggaG9sZCB0aW1lIHdoaWNoIGlzIHZh
bGlkIGZvciBib3RoIHJlYWQgYW5kIHdyaXRlCj4gPiBjeWNsZSB1c2luZyB0aGUgbWF4IHZhbHVl
IGJldHdlZW4gdFJFSF9taW4gYW5kIHRXSF9taW4uCj4gPiBTZWNvbmRseSwgY2FsY3VsYXRlIFdF
IyBwdWxzZSB3aWR0aCB1c2luZyB0V1BfbWluLgo+ID4gVGhyaWRseSwgY2FsY3VsYXRlIFJFIyBw
dWxzZSB3aWR0aCB1c2luZyB0aGUgYmlnZ2VyIG9uZSBiZXR3ZWVuIHRSRUFfbWF4Cj4gPiBhbmQg
dFJQX21pbi4KPiA+IAo+ID4gQnV0IE5BTkQgU1BFQyBzaG93cyB0aGF0IENvbnRyb2xsZXIgc2hv
dWxkIGFsc28gbWVldCB3cml0ZS9yZWFkIGN5Y2xlIHRpbWUuCj4gPiBUaGF0IGlzIHdyaXRlIGN5
Y2xlIHRpbWUgc2hvdWxkIGJlIG1vcmUgdGhhbiB0V0NfbWluIGFuZCByZWFkIGN5Y2xlIHNob3Vs
ZAo+ID4gYmUgbW9yZSB0aGFuIHRSQ19taW4uIE9idmlvdXNseSwgd2UgZG8gbm90IGFjaGlldmUg
dGhhdCBub3cuCj4gPiAKPiA+IFRoaXMgcGF0Y2ggY29ycmVjdHMgdGhlIGxvdyBsZXZlbCB0aW1l
IGNhbGN1bGF0aW9uIHRvIG1lZXQgbWluaW11bQo+ID4gcmVhZC93cml0ZSBjeWNsZSB0aW1lIHJl
cXVpcmVkLiBBZnRlciBnZXR0aW5nIHRoZSBoaWdoIGhvbGQgdGltZSwgV0UjIGxvdwo+ID4gbGV2
ZWwgdGltZSB3aWxsIGJlIHByb21pc2VkIHRvIG1lZXQgdFdQX21pbiBhbmQgdFdDX21pbiByZXF1
aXJlbWVudCwKPiA+IGFuZCBSRSMgbG93IGxldmVsIHRpbWUgd2lsbCBiZSBwcm9taXNlZCB0byBt
ZWV0IHRSRUFfbWF4LCB0UlBfbWluIGFuZAo+ID4gdFJDX21pbiByZXF1aXJlbWVudC4KPiA+IAo+
ID4gRml4ZXM6IDkzZGI0NDZhNDI0YyAoIm10ZDogbmFuZDogbW92ZSByYXcgTkFORCByZWxhdGVk
IGNvZGUgdG8gdGhlIHJhdy8gc3ViZGlyIikKPiAKPiBUaGlzIGlzIGRlZmluaXRlbHkgbm90IHRo
ZSBmYXVsdHkgcGF0Y2guIFBsZWFzZSB1c2UgLS1mb2xsb3cgd2hlbgo+IHNlYXJjaGluZyBmb3Ig
dGhlIGN1bHByaXQsIHRvIGF2b2lkIGJlaW5nIGJsb2NrZWQgYnkgdGhlCj4gcmVuYW1pbmcvbW92
aW5nIHdvcmsuClllcy4gVGhpcyBpc3N1ZSBleGlzdHMgYmVmb3JlIHJhdy8gc3VkaXIgYmVpbmcg
Y3JlYXRlZC4KClRoZSBmYXVsdHkgcGF0Y2ggc2hvdWxkIGJlICdjb21taXQgZWRmZWUzNjE5YzQ5
ICgibXRkOiBuYW5kOiBtdGs6IGFkZAotPnNldHVwX2RhdGFfaW50ZXJmYWNlKCkgaG9vayIpJyB3
aGljaCBjYW5ub3QgYmUgZm91bmQgaW4gZ2l0IGhpc3RvcnkKbm93LgoKU2hvdWxkIEkgbGlzdCBp
dCBoZXJlPwoKPiAKPiBBbHNvIGEgQ2M6IHN0YWJsZSBtaWdodCBiZSB3b3J0aC4KT0suIFRoYW5r
cy4KCj4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBYaWFvbGVpIExpIDx4aWFvbGVpLmxpQG1lZGlhdGVr
LmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L210a19uYW5kLmMgfCAxNCAr
KysrKysrKysrKy0tLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAzIGRl
bGV0aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbXRr
X25hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L210a19uYW5kLmMKPiA+IGluZGV4IGI2YjQ2
MDJmNTEzMi4uZGQ4NTVmODYwYTRiIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9y
YXcvbXRrX25hbmQuYwo+ID4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbXRrX25hbmQuYwo+
ID4gQEAgLTUwOCw3ICs1MDgsNyBAQCBzdGF0aWMgaW50IG10a19uZmNfc2V0dXBfZGF0YV9pbnRl
cmZhY2Uoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwgaW50IGNzbGluZSwKPiA+ICB7Cj4gPiAgCXN0
cnVjdCBtdGtfbmZjICpuZmMgPSBuYW5kX2dldF9jb250cm9sbGVyX2RhdGEoY2hpcCk7Cj4gPiAg
CWNvbnN0IHN0cnVjdCBuYW5kX3Nkcl90aW1pbmdzICp0aW1pbmdzOwo+ID4gLQl1MzIgcmF0ZSwg
dHBvZWNzLCB0cHJlY3MsIHRjMnIsIHR3MnIsIHR3aCwgdHdzdCwgdHJsdDsKPiA+ICsJdTMyIHJh
dGUsIHRwb2VjcywgdHByZWNzLCB0YzJyLCB0dzJyLCB0d2gsIHR3c3QgPSAwLCB0cmx0ID0gMDsK
PiA+ICAKPiA+ICAJdGltaW5ncyA9IG5hbmRfZ2V0X3Nkcl90aW1pbmdzKGNvbmYpOwo+ID4gIAlp
ZiAoSVNfRVJSKHRpbWluZ3MpKQo+ID4gQEAgLTU0NCwxMSArNTQ0LDE5IEBAIHN0YXRpYyBpbnQg
bXRrX25mY19zZXR1cF9kYXRhX2ludGVyZmFjZShzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLCBpbnQg
Y3NsaW5lLAo+ID4gIAl0d2ggPSBESVZfUk9VTkRfVVAodHdoICogcmF0ZSwgMTAwMDAwMCkgLSAx
Owo+ID4gIAl0d2ggJj0gMHhmOwo+ID4gIAo+ID4gLQl0d3N0ID0gdGltaW5ncy0+dFdQX21pbiAv
IDEwMDA7Cj4gPiArCS8qIENhbGN1bGF0ZSBtaW4gbG93IGxldmVsIHRpbWluZyBmb3Igd3JpdGUg
Y3ljbGUgKi8KPiA+ICsJaWYgKCh0d2ggKyAxKSAqIDEwMDAwMDAgLyByYXRlIDwgdGltaW5ncy0+
dFdDX21pbiAvIDEwMDApCj4gPiArCQl0d3N0ID0gKHRpbWluZ3MtPnRXQ19taW4gLyAxMDAwIC0g
KHR3aCArIDEpICogMTAwMDAwMCAvIHJhdGUpCj4gPiArCQkJKiAxMDAwOwo+ID4gKwl0d3N0ID0g
bWF4KHRpbWluZ3MtPnRXUF9taW4sIHR3c3QpIC8gMTAwMDsKPiA+ICAJdHdzdCA9IERJVl9ST1VO
RF9VUCh0d3N0ICogcmF0ZSwgMTAwMDAwMCkgLSAxOwo+ID4gIAl0d3N0ICY9IDB4ZjsKPiA+ICAK
PiA+IC0JdHJsdCA9IG1heCh0aW1pbmdzLT50UkVBX21heCwgdGltaW5ncy0+dFJQX21pbikgLyAx
MDAwOwo+ID4gKwkvKiBDYWxjdWxhdGUgbWluIGxvdyBsZXZlbCB0aW1pbmcgZm9yIHJlYWQgY3lj
bGUgKi8KPiA+ICsJaWYgKCh0d2ggKyAxKSAqIDEwMDAwMDAgLyByYXRlIDwgdGltaW5ncy0+dFJD
X21pbiAvIDEwMDApCj4gPiArCQl0cmx0ID0gKHRpbWluZ3MtPnRSQ19taW4gLyAxMDAwIC0gKHR3
aCArIDEpICogMTAwMDAwMCAvIHJhdGUpCj4gPiArCQkJKiAxMDAwOwo+ID4gKwl0cmx0ID0gbWF4
Myh0cmx0LCB0aW1pbmdzLT50UkVBX21heCwgdGltaW5ncy0+dFJQX21pbikgLyAxMDAwOwo+ID4g
IAl0cmx0ID0gRElWX1JPVU5EX1VQKHRybHQgKiByYXRlLCAxMDAwMDAwKSAtIDE7Cj4gPiAgCXRy
bHQgJj0gMHhmOwo+ID4gIAo+IAo+IAo+IFdpdGggdGhpcyBmaXhlZCwKPiAKPiBSZXZpZXdlZC1i
eTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KPiAKPiBUaGFua3Ms
Cj4gTWlxdcOobAoKVGhhbmtzLApYaWFvbGVpCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
