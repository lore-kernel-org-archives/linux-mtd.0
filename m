Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75DE9C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jan 2022 10:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ADxU1Jlse/uB5dPheiM84z85GNm/vJlFEuns0Y3rVBc=; b=Kp4lV6lewm6Xmw
	n5Rv2eTfWKGtn4Tnk89jo0noQBI9U6yRWB1ANWrDuQvAYEK78e+zKD14WRkpvKvn3e/Y9AGkBhhXW
	/keYjnW2XPsBDmvEzDOeNYKsFq5yC9dwQ14vvRWoblpbqtNveT0LD3No91C8HeWRfeElxgXz8bEe/
	x6TerzcDo1c7XX+ODMake/+lH0nElImcc/dIMMiQP2IqTta6w/Kvey1U0EaVI8dqRJoapFjLCd4px
	IgWP5iQt20UdZB9n4psvfetWdeVkBfJsXMCIbLXZfpg60xDbWF/Jo/n9uf/gAio6CYOVf7jWvIgoH
	6OiYb5O4IK8NPmIUyXQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nD2Iy-00FDVU-8s; Thu, 27 Jan 2022 10:47:04 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nD2Ip-00FDPC-AV
 for linux-mtd@lists.infradead.org; Thu, 27 Jan 2022 10:46:57 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 147CF20014;
 Thu, 27 Jan 2022 10:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1643280411;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kHfsa2rINN7QNkX1RCKgYw6n9QtwXsYWEGzJ36bI4ys=;
 b=Sro/FWmYiEvvcEEDbXuDTz4H4eK5F/KrhY/3d+j6/KhRdN20OsB1QulgOuiQb4pKOuYV7W
 SwcwR7cF0VvaFQcSLyKEAw9rCQ593qcJa4pkEKGInEWXpwMpy4hqqyKcDnzBQfF65gxH3s
 EglMzRFYObHArraOajz9ZG/Nu9zXu7yk99qyPpeoHQXg1+6ZuCVgmBpXMecc893rEvMJ35
 /qSSFzo1/zk9NSB5NT7SrRUJmt53DtKIZhCgzcopj+xM8fwAMrnNhsFWh7sdL2QVVran8T
 wEYGWLeO0vNWHHf97wCAeoAzoQbvJYF3cfOsWULHcFA95v3qKZAsx/fUSYVFzg==
Date: Thu, 27 Jan 2022 11:46:47 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush
 Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>, MTD Maling List
 <linux-mtd@lists.infradead.org>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] mtd: Introduce an expert mode for forensics and
 debugging purposes
Message-ID: <20220127114647.0ec44ced@xps13>
In-Reply-To: <CAMuHMdVnOdvEbiiQcdZHdVkz1YAj-kgZp_nw4jqb6Z5=KeM=uw@mail.gmail.com>
References: <20211118114659.1282855-1-miquel.raynal@bootlin.com>
 <CAMuHMdVnOdvEbiiQcdZHdVkz1YAj-kgZp_nw4jqb6Z5=KeM=uw@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_024655_738538_649ABE57 
X-CRM114-Status: GOOD (  27.99  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgR2VlcnQsCgpnZWVydEBsaW51eC1tNjhrLm9yZyB3cm90ZSBvbiBNb24sIDEwIEphbiAyMDIy
IDE0OjE1OjI3ICswMTAwOgoKPiBIaSBNaXF1ZWwsCj4gCj4gT24gVGh1LCBOb3YgMTgsIDIwMjEg
YXQgMTI6NDcgUE0gTWlxdWVsIFJheW5hbAo+IDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3
cm90ZToKPiA+IFdoZW4gZGV2ZWxvcHBpbmcgTkFORCBjb250cm9sbGVyIGRyaXZlcnMgb3Igd2hl
biBkZWJ1Z2dpbmcgZmlsZXN5c3RlbQo+ID4gY29ycnVwdGlvbnMsIGl0IGlzIHF1aXRlIGNvbW1v
biB0byBuZWVkIGhhY2tpbmcgbG9jYWxseSBpbnRvIHRoZQo+ID4gTVREL05BTkQgY29yZSBpbiBv
cmRlciB0byBnZXQgYWNjZXNzIHRvIHRoZSBjb250ZW50IG9mIHRoZSBiYWQKPiA+IGJsb2Nrcy4g
SW5zdGVhZCBvZiBoYXZpbmcgbXVsdGlwbGUgaW1wbGVtZW50YXRpb25zIG91dCB0aGVyZSBsZXQn
cwo+ID4gcHJvdmlkZSBhIHNpbXBsZSB5ZXQgZWZmZWN0aXZlIHNwZWNpZmljIE1URC13aWRlIGRl
YnVnZnMgZW50cnkgdG8gZnVsbHkKPiA+IGRpc2FibGUgdGhlc2UgY2hlY2tzIG9uIHB1cnBvc2Uu
Cj4gPgo+ID4gQSB3YXJuaW5nIGlzIGFkZGVkIHRvIGluZm9ybSB0aGUgdXNlciB3aGVuIHRoaXMg
bW9kZSBnZXRzIGVuYWJsZWQuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogTWlxdWVsIFJheW5hbCA8
bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4gIAo+IAo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCwg
d2hpY2ggaXMgbm93IGNvbW1pdCA2N2I5NjdkZGQ5M2QwZWQ1ICgibXRkOgo+IEludHJvZHVjZSBh
biBleHBlcnQgbW9kZSBmb3IgZm9yZW5zaWNzIGFuZCBkZWJ1Z2dpbmcgcHVycG9zZXMiKQo+IGlu
IG10ZC9uZXh0Lgo+IAo+ID4gLS0tIGEvZHJpdmVycy9tdGQvbXRkY29yZS5jCj4gPiArKysgYi9k
cml2ZXJzL210ZC9tdGRjb3JlLmMKPiA+IEBAIC0yMzY1LDYgKzIzNjUsMTQgQEAgc3RhdGljIHN0
cnVjdCBiYWNraW5nX2Rldl9pbmZvICogX19pbml0IG10ZF9iZGlfaW5pdChjb25zdCBjaGFyICpu
YW1lKQo+ID4gICAgICAgICByZXR1cm4gcmV0ID8gRVJSX1BUUihyZXQpIDogYmRpOwo+ID4gIH0K
PiA+Cj4gPiArY2hhciAqbXRkX2V4cGVydF9hbmFseXNpc193YXJuaW5nID0gIAo+IAo+IGNvbnN0
Cj4gCj4gPiArICAgICAgICJCYWQgYmxvY2sgY2hlY2tzIGhhdmUgYmVlbiBlbnRpcmVseSBkaXNh
YmxlZC5cbiIKPiA+ICsgICAgICAgIlRoaXMgaXMgb25seSByZXNlcnZlZCBmb3IgcG9zdC1tb3J0
ZW0gZm9yZW5zaWNzIGFuZCBkZWJ1ZyBwdXJwb3Nlcy5cbiIKPiA+ICsgICAgICAgIk5ldmVyIGVu
YWJsZSB0aGlzIG1vZGUgaWYgeW91IGRvIG5vdCBrbm93IHdoYXQgeW91IGFyZSBkb2luZyFcbiI7
Cj4gPiArRVhQT1JUX1NZTUJPTF9HUEwobXRkX2V4cGVydF9hbmFseXNpc193YXJuaW5nKTsgIAo+
IAo+IFNob3VsZG4ndCB0aGlzIGRlcGVuZCBvbiBDT05GSUdfREVCVUdfRlM/Cj4gCj4gPiArYm9v
bCBtdGRfZXhwZXJ0X2FuYWx5c2lzX21vZGU7Cj4gPiArRVhQT1JUX1NZTUJPTF9HUEwobXRkX2V4
cGVydF9hbmFseXNpc19tb2RlKTsgIAo+IAo+IERvIHlvdSByZWFsbHkgbmVlZCB0byBleHBvcnQg
dGhlc2UgdHdvIHN5bWJvbHM/Cj4gCj4gPiArCj4gPiAgc3RhdGljIHN0cnVjdCBwcm9jX2Rpcl9l
bnRyeSAqcHJvY19tdGQ7Cj4gPgo+ID4gIHN0YXRpYyBpbnQgX19pbml0IGluaXRfbXRkKHZvaWQp
ICAKPiA9Cj4gPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL2NvcmUuYwo+ID4gKysrIGIvZHJpdmVy
cy9tdGQvbmFuZC9jb3JlLmMKPiA+IEBAIC0yMSw2ICsyMSw5IEBACj4gPiAgICovCj4gPiAgYm9v
bCBuYW5kZGV2X2lzYmFkKHN0cnVjdCBuYW5kX2RldmljZSAqbmFuZCwgY29uc3Qgc3RydWN0IG5h
bmRfcG9zICpwb3MpCj4gPiAgewo+ID4gKyAgICAgICBpZiAoV0FSTl9PTkNFKG10ZF9leHBlcnRf
YW5hbHlzaXNfbW9kZSwgbXRkX2V4cGVydF9hbmFseXNpc193YXJuaW5nKSkKPiA+ICsgICAgICAg
ICAgICAgICByZXR1cm4gMDsKPiA+ICsKPiA+ICAgICAgICAgaWYgKG5hbmRkZXZfYmJ0X2lzX2lu
aXRpYWxpemVkKG5hbmQpKSB7Cj4gPiAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IGVudHJ5
Owo+ID4gICAgICAgICAgICAgICAgIGludCBzdGF0dXM7Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9tdGQvbmFuZC9yYXcvbmFuZF9iYXNlLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2Jh
c2UuYwo+ID4gaW5kZXggM2Q2YzZlODgwNTIwLi5iM2E5YmMwOGI0YmIgMTAwNjQ0Cj4gPiAtLS0g
YS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2Jhc2UuYwo+ID4gKysrIGIvZHJpdmVycy9tdGQv
bmFuZC9yYXcvbmFuZF9iYXNlLmMKPiA+IEBAIC0zMjEsNiArMzIxLDkgQEAgc3RhdGljIGludCBu
YW5kX2lzYmFkX2JibShzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLCBsb2ZmX3Qgb2ZzKQo+ID4gICAg
ICAgICBpZiAobmFuZF9yZWdpb25faXNfc2VjdXJlZChjaGlwLCBvZnMsIG10ZC0+ZXJhc2VzaXpl
KSkKPiA+ICAgICAgICAgICAgICAgICByZXR1cm4gLUVJTzsKPiA+Cj4gPiArICAgICAgIGlmIChX
QVJOX09OQ0UobXRkX2V4cGVydF9hbmFseXNpc19tb2RlLCBtdGRfZXhwZXJ0X2FuYWx5c2lzX3dh
cm5pbmcpKQo+ID4gKyAgICAgICAgICAgICAgIHJldHVybiAwOwo+ID4gKwo+ID4gICAgICAgICBp
ZiAoY2hpcC0+bGVnYWN5LmJsb2NrX2JhZCkKPiA+ICAgICAgICAgICAgICAgICByZXR1cm4gY2hp
cC0+bGVnYWN5LmJsb2NrX2JhZChjaGlwLCBvZnMpOwo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2JidC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9i
YnQuYwo+ID4gaW5kZXggYjdhZDAzMDIyNWY4Li5hYjYzMGFmM2EzMDkgMTAwNjQ0Cj4gPiAtLS0g
YS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2JidC5jCj4gPiArKysgYi9kcml2ZXJzL210ZC9u
YW5kL3Jhdy9uYW5kX2JidC5jCj4gPiBAQCAtMTQ1NSw2ICsxNDU1LDkgQEAgaW50IG5hbmRfaXNi
YWRfYmJ0KHN0cnVjdCBuYW5kX2NoaXAgKnRoaXMsIGxvZmZfdCBvZmZzLCBpbnQgYWxsb3diYnQp
Cj4gPiAgICAgICAgIHByX2RlYnVnKCJuYW5kX2lzYmFkX2JidCgpOiBiYnQgaW5mbyBmb3Igb2Zm
cyAweCUwOHg6IChibG9jayAlZCkgMHglMDJ4XG4iLAo+ID4gICAgICAgICAgICAgICAgICAodW5z
aWduZWQgaW50KW9mZnMsIGJsb2NrLCByZXMpOwo+ID4KPiA+ICsgICAgICAgaWYgKFdBUk5fT05D
RShtdGRfZXhwZXJ0X2FuYWx5c2lzX21vZGUsIG10ZF9leHBlcnRfYW5hbHlzaXNfd2FybmluZykp
Cj4gPiArICAgICAgICAgICAgICAgcmV0dXJuIDA7Cj4gPiArICAKPiAKPiBUaGVzZSBhcmUgYWxs
IHRoZSBzYW1lLgo+IAo+IFdoYXQgYWJvdXQgbGV0dGluZyBkcml2ZXJzL210ZC9tdGRjb3JlLmMg
ZXhwb3J0IGEgc2ltcGxlIGZ1bmN0aW9uCj4gbXRkX2NoZWNrX2V4cGVydF9hbmFseXNpc19tb2Rl
KCkgdGhhdCBjYWxscyB0aGUgV0FSTl9PTkNFKC4uLikgaWYKPiBDT05GSUdfREVCVUdfRlM9eSwg
ZWxzZSBwcm92aWRpbmcgYSBkdW1teT8KPiBUaGUgYmFja3RyYWNlIHdpbGwgaWRlbnRpZnkgdGhl
IGNhbGxlciBhbnl3YXkuCgpJIHRvb2sgdGhlIHRpbWUgdG8gYWRkcmVzcyB5b3VyIGNvbW1lbnRz
LiBZb3UncmUgcmlnaHQgYSBzaW5nbGUgZXhwb3J0ZWQKZnVuY3Rpb24gaXMgYmV0dGVyLgoKSG93
ZXZlciBJIGRvbid0IHNlZSB0aGUgbmVlZCBmb3IgYSBDT05GSUdfREVCVUdfRlMgY2hlY2sgaGVy
ZSwgaWYgdW5zZXQKdGhlIGJvb2xlYW4gd2lsbCBzdGF5IGZhbHNlIGZvcmV2ZXIsIEkgYmVsaWV2
ZSB3ZSBkb24ndCBuZWVkIHRvIGJvdGhlcgp3aXRoIGl0LgoKVGhhbmtzLApNaXF1w6hsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
