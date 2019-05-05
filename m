Return-Path: <SRS0=tJq/=TF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,T_DKIMWL_WL_HIGH,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18BBDC004C9
	for <linux-mtd@archiver.kernel.org>; Sun,  5 May 2019 07:12:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE1982053B
	for <linux-mtd@archiver.kernel.org>; Sun,  5 May 2019 07:12:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mSdd00P0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE1982053B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RD4Sutt7Txs5p9WcqD0EPjEEBQP6hX7fvi94H3b/xQs=; b=mSdd00P0W+QpHH
	teBYsJZk7nnCn1zGzIDUaZdVje38C0ylD8+cvt4f8gP1TYWqVcEwKcXix7JcPexYP2bry/18huWJB
	H5sYxmjCMaQD8sFIzub4xat7XD3vu0J4cluy7dtdTNIYAfv1vKAJ0cSHAS9iJF3f+gyTYUHUo69w8
	9PENWq4GjA8rth7t/3vEzYYr8bd0WIStE838MYKUlrKIoEoRRhYIm2tHdH/gCQdq8QV6LtSA+b79G
	renETw+26Pw99J2Ipb3G0UfvS/F/xs9GRYnN3lqDbPxXLrEHtuFRtyVsITo+Wep/BowR2uP0PDATZ
	i6m7fDW6XNNzTDtRYdCg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hNBKH-0006Pr-J5; Sun, 05 May 2019 07:12:45 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hNBKD-0006OL-UV; Sun, 05 May 2019 07:12:43 +0000
X-UUID: cf9d9434ef094897a833f852ea8df2ee-20190504
X-UUID: cf9d9434ef094897a833f852ea8df2ee-20190504
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <xiaolei.li@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1920131249; Sat, 04 May 2019 23:12:39 -0800
Received: from mtkmbs03n2.mediatek.inc (172.21.101.182) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 5 May 2019 00:12:38 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by mtkmbs03n2.mediatek.inc
 (172.21.101.182) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Sun, 5 May 2019 15:12:30 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Sun, 5 May 2019 15:12:29 +0800
Message-ID: <1557040349.26455.61.camel@mhfsdcap03>
Subject: Re: [PATCH v2 1/5] mtd: rawnand: mtk: Correct low level time
 calculation of r/w cycle
From: xiaolei li <xiaolei.li@mediatek.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Sun, 5 May 2019 15:12:29 +0800
In-Reply-To: <20190430135910.1deddd51@xps13>
References: <20190430100250.28083-1-xiaolei.li@mediatek.com>
 <20190430100250.28083-2-xiaolei.li@mediatek.com>
 <20190430135910.1deddd51@xps13>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 260F786CC4C06C13C3A588B90F354AD8C336E0ABEC75E500A076A07C3F1060742000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190505_001241_986997_25FF2C88 
X-CRM114-Status: GOOD (  21.01  )
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
 linux-mtd@lists.infradead.org, stable@vger.kernel.org,
 srv_heupstream@mediatek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gVHVlLCAyMDE5LTA0LTMwIGF0IDEzOjU5ICswMjAwLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+
IEhpIFhpYW9sZWksCj4gCj4gWGlhb2xlaSBMaSA8eGlhb2xlaS5saUBtZWRpYXRlay5jb20+IHdy
b3RlIG9uIFR1ZSwgMzAgQXByIDIwMTkgMTg6MDI6NDYKPiArMDgwMDoKPiAKPiA+IEF0IHByZXNl
bnQsIHRoZSBmbG93IG9mIGNhbGN1bGF0aW5nIEFDIHRpbWluZyBvZiByZWFkL3dyaXRlIGN5Y2xl
IGluIFNEUgo+ID4gbW9kZSBpcyB0aGF0Ogo+ID4gQXQgZmlyc3QsIGNhbGN1bGF0ZSBoaWdoIGhv
bGQgdGltZSB3aGljaCBpcyB2YWxpZCBmb3IgYm90aCByZWFkIGFuZCB3cml0ZQo+ID4gY3ljbGUg
dXNpbmcgdGhlIG1heCB2YWx1ZSBiZXR3ZWVuIHRSRUhfbWluIGFuZCB0V0hfbWluLgo+ID4gU2Vj
b25kbHksIGNhbGN1bGF0ZSBXRSMgcHVsc2Ugd2lkdGggdXNpbmcgdFdQX21pbi4KPiA+IFRocmlk
bHksIGNhbGN1bGF0ZSBSRSMgcHVsc2Ugd2lkdGggdXNpbmcgdGhlIGJpZ2dlciBvbmUgYmV0d2Vl
biB0UkVBX21heAo+ID4gYW5kIHRSUF9taW4uCj4gPiAKPiA+IEJ1dCBOQU5EIFNQRUMgc2hvd3Mg
dGhhdCBDb250cm9sbGVyIHNob3VsZCBhbHNvIG1lZXQgd3JpdGUvcmVhZCBjeWNsZSB0aW1lLgo+
ID4gVGhhdCBpcyB3cml0ZSBjeWNsZSB0aW1lIHNob3VsZCBiZSBtb3JlIHRoYW4gdFdDX21pbiBh
bmQgcmVhZCBjeWNsZSBzaG91bGQKPiA+IGJlIG1vcmUgdGhhbiB0UkNfbWluLiBPYnZpb3VzbHks
IHdlIGRvIG5vdCBhY2hpZXZlIHRoYXQgbm93Lgo+ID4gCj4gPiBUaGlzIHBhdGNoIGNvcnJlY3Rz
IHRoZSBsb3cgbGV2ZWwgdGltZSBjYWxjdWxhdGlvbiB0byBtZWV0IG1pbmltdW0KPiA+IHJlYWQv
d3JpdGUgY3ljbGUgdGltZSByZXF1aXJlZC4gQWZ0ZXIgZ2V0dGluZyB0aGUgaGlnaCBob2xkIHRp
bWUsIFdFIyBsb3cKPiA+IGxldmVsIHRpbWUgd2lsbCBiZSBwcm9taXNlZCB0byBtZWV0IHRXUF9t
aW4gYW5kIHRXQ19taW4gcmVxdWlyZW1lbnQsCj4gPiBhbmQgUkUjIGxvdyBsZXZlbCB0aW1lIHdp
bGwgYmUgcHJvbWlzZWQgdG8gbWVldCB0UkVBX21heCwgdFJQX21pbiBhbmQKPiA+IHRSQ19taW4g
cmVxdWlyZW1lbnQuCj4gPiAKPiA+IEZpeGVzOiBlZGZlZTM2MTljNDkgKCJtdGQ6IG5hbmQ6IG10
azogYWRkIC0+c2V0dXBfZGF0YV9pbnRlcmZhY2UoKSBob29rIikKPiA+IENjOiBzdGFibGVAdmdl
ci5rZXJuZWwub3JnCj4gPiBTaWduZWQtb2ZmLWJ5OiBYaWFvbGVpIExpIDx4aWFvbGVpLmxpQG1l
ZGlhdGVrLmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L210a19uYW5kLmMg
fCAyNCArKysrKysrKysrKysrKysrKysrKystLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMjEgaW5z
ZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bXRkL25hbmQvcmF3L210a19uYW5kLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tdGtfbmFuZC5j
Cj4gPiBpbmRleCBiNmI0NjAyZjUxMzIuLjRmYmIwYzZlY2FlMyAxMDA2NDQKPiA+IC0tLSBhL2Ry
aXZlcnMvbXRkL25hbmQvcmF3L210a19uYW5kLmMKPiA+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQv
cmF3L210a19uYW5kLmMKPiA+IEBAIC01MDgsNyArNTA4LDggQEAgc3RhdGljIGludCBtdGtfbmZj
X3NldHVwX2RhdGFfaW50ZXJmYWNlKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsIGludCBjc2xpbmUs
Cj4gPiAgewo+ID4gIAlzdHJ1Y3QgbXRrX25mYyAqbmZjID0gbmFuZF9nZXRfY29udHJvbGxlcl9k
YXRhKGNoaXApOwo+ID4gIAljb25zdCBzdHJ1Y3QgbmFuZF9zZHJfdGltaW5ncyAqdGltaW5nczsK
PiA+IC0JdTMyIHJhdGUsIHRwb2VjcywgdHByZWNzLCB0YzJyLCB0dzJyLCB0d2gsIHR3c3QsIHRy
bHQ7Cj4gPiArCXUzMiByYXRlLCB0cG9lY3MsIHRwcmVjcywgdGMyciwgdHcyciwgdHdoLCB0d3N0
ID0gMCwgdHJsdCA9IDA7Cj4gPiArCXUzMiB0aG9sZDsKPiA+ICAKPiA+ICAJdGltaW5ncyA9IG5h
bmRfZ2V0X3Nkcl90aW1pbmdzKGNvbmYpOwo+ID4gIAlpZiAoSVNfRVJSKHRpbWluZ3MpKQo+ID4g
QEAgLTU0NCwxMSArNTQ1LDI4IEBAIHN0YXRpYyBpbnQgbXRrX25mY19zZXR1cF9kYXRhX2ludGVy
ZmFjZShzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLCBpbnQgY3NsaW5lLAo+ID4gIAl0d2ggPSBESVZf
Uk9VTkRfVVAodHdoICogcmF0ZSwgMTAwMDAwMCkgLSAxOwo+ID4gIAl0d2ggJj0gMHhmOwo+ID4g
IAo+ID4gLQl0d3N0ID0gdGltaW5ncy0+dFdQX21pbiAvIDEwMDA7Cj4gPiArCS8qIENhbGN1bGF0
ZSByZWFsIFdFIy9SRSMgaG9sZCB0aW1lIGluIG5hbm9zZWNvbmQgKi8KPiA+ICsJdGhvbGQgPSAo
dHdoICsgMSkgKiAxMDAwMDAwIC8gcmF0ZTsKPiA+ICsJLyogbmFub3NlY29uZCB0byBwaWNvc2Vj
b25kICovCj4gPiArCXRob2xkICo9IDEwMDA7Cj4gPiArCj4gPiArCS8qKgo+IAo+ICAgICAgICAg
LyoKPiAKPiA+ICsJICogV0UjIGxvdyBsZXZlbCB0aW1lIHNob3VsZCBiZSBleHBhbmVkIHRvIG1l
ZXQgV0UjIHB1bHNlIHRpbWUKPiA+ICsJICogYW5kIFdFIyBjeWNsZSB0aW1lIGF0IHRoZSBzYW1l
IHRpbWUuCj4gPiArCSAqLwo+ID4gKwlpZiAodGhvbGQgPCB0aW1pbmdzLT50V0NfbWluKQo+ID4g
KwkJdHdzdCA9IHRpbWluZ3MtPnRXQ19taW4gLSB0aG9sZDsKPiA+ICsJdHdzdCA9IG1heCh0aW1p
bmdzLT50V1BfbWluLCB0d3N0KSAvIDEwMDA7Cj4gPiAgCXR3c3QgPSBESVZfUk9VTkRfVVAodHdz
dCAqIHJhdGUsIDEwMDAwMDApIC0gMTsKPiA+ICAJdHdzdCAmPSAweGY7Cj4gPiAgCj4gPiAtCXRy
bHQgPSBtYXgodGltaW5ncy0+dFJFQV9tYXgsIHRpbWluZ3MtPnRSUF9taW4pIC8gMTAwMDsKPiA+
ICsJLyoqCj4gCj4gRGl0dG8KT0suCgo+IAo+ID4gKwkgKiBSRSMgbG93IGxldmVsIHRpbWUgc2hv
dWxkIGJlIGV4cGFuZWQgdG8gbWVldCBSRSMgcHVsc2UgdGltZSwKPiA+ICsJICogUkUjIGFjY2Vz
cyB0aW1lIGFuZCBSRSMgY3ljbGUgdGltZSBhdCB0aGUgc2FtZSB0aW1lLgo+ID4gKwkgKi8KPiA+
ICsJaWYgKHRob2xkIDwgdGltaW5ncy0+dFJDX21pbikKPiA+ICsJCXRybHQgPSB0aW1pbmdzLT50
UkNfbWluIC0gdGhvbGQ7Cj4gPiArCXRybHQgPSBtYXgzKHRybHQsIHRpbWluZ3MtPnRSRUFfbWF4
LCB0aW1pbmdzLT50UlBfbWluKSAvIDEwMDA7Cj4gPiAgCXRybHQgPSBESVZfUk9VTkRfVVAodHJs
dCAqIHJhdGUsIDEwMDAwMDApIC0gMTsKPiA+ICAJdHJsdCAmPSAweGY7Cj4gPiAgCj4gCj4gV2l0
aCB0aGlzIGZpeGVkOgo+IAo+IFJldmlld2VkLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5
bmFsQGJvb3RsaW4uY29tPgo+IAo+IAo+IFRoYW5rcywKPiBNaXF1w6hsCgpUaGFua3MsClhpYW9s
ZWkKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
