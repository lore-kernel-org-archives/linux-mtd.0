Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCCA9C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Nov 2021 13:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d8iWVQw8pmXNpRjr4Wae3qbyQ3dyeSyrowrpqh65vdw=; b=ur3ck1O2KzanNf
	fiLRss5DN4WgWuRJTWQbLV1hqvO9kjrzGDcY+RuifC6zH98oFOOIf96KwTdfONNmyde4nILBMGJN2
	WhykdZU9c++m5AV1u7R5aNYHwFQLL1hgAQXyunhIC8CUOfh575HVji8aN57+Xwu6P2d+nXPQYlyOW
	K5ppzmigteAaMBV8GXVgxrTuFZED3R1O8pDcPDuumIYTbx8YWUDPUpbb0gwigvKroylgqW6mhc3jt
	t8DL28yXTGLk5qxoEdYxjKJ21xyyHVCzH4GsD7wj7KeTM4jyfYYmT6eQTB6Brr81bVEeys2SUItel
	ENJAFb+ue7yBfsJqSPjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqbXJ-00AddE-5t; Fri, 26 Nov 2021 13:45:09 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqbX5-00AdbQ-5R; Fri, 26 Nov 2021 13:44:57 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 916D4E0014;
 Fri, 26 Nov 2021 13:44:48 +0000 (UTC)
Date: Fri, 26 Nov 2021 14:44:47 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Phil Edworthy <phil.edworthy@renesas.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush
 Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, Jimmy Lalande
 <jimmy.lalande@se.com>, Milan Stevanovic <milan.stevanovic@se.com>, Geert
 Uytterhoeven <geert+renesas@glider.be>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Gareth Williams
 <gareth.williams.jx@renesas.com>
Subject: Re: [PATCH 2/3] mtd: rawnand: rzn1: Add new NAND controller driver
Message-ID: <20211126144447.4fb300af@xps13>
In-Reply-To: <TYYPR01MB7086AF009C6D6A4440B0CB21F59C9@TYYPR01MB7086.jpnprd01.prod.outlook.com>
References: <20211118111940.1275351-1-miquel.raynal@bootlin.com>
 <20211118111940.1275351-3-miquel.raynal@bootlin.com>
 <TYYPR01MB7086AF009C6D6A4440B0CB21F59C9@TYYPR01MB7086.jpnprd01.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_054455_504592_CD8EA872 
X-CRM114-Status: GOOD (  25.90  )
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

SGkgUGhpbCwKCnBoaWwuZWR3b3J0aHlAcmVuZXNhcy5jb20gd3JvdGUgb24gRnJpLCAxOSBOb3Yg
MjAyMSAxNTowNDo1NSArMDAwMDoKCj4gSGkgTWlxdWVsLAo+IAo+IFRoYW5rcyBmb3IgeW91ciBw
YXRjaGVzLgo+IAo+ID4gSW50cm9kdWNlIFJlbmVzYXMgUlovTjF4IE5BTkQgY29udHJvbGxlciBk
cml2ZXIgd2hpY2ggc3VwcG9ydHM6Cj4gPiAtIEFsbCBPTkZJIHRpbWluZyBtb2Rlcwo+ID4gLSBE
aWZmZXJlbnQgY29uZmlndXJhdGlvbnMgb2YgaXRzIGludGVybmFsIEVDQyBjb250cm9sbGVyCj4g
PiAtIE9uLWRpZSAobm90IHRlc3RlZCkgYW5kIHNvZnR3YXJlIEVDQyBzdXBwb3J0Cj4gPiAtIFNl
dmVyYWwgY2hpcHMgKG5vdCB0ZXN0ZWQpCj4gPiAtIFN1YnBhZ2UgYWNjZXNzZXMKPiA+IC0gRE1B
IGFuZCBQSU8KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJh
eW5hbEBib290bGluLmNvbT4KPiA+IC0tLSAgCj4gSXQgbWlnaHQgYmUgd29ydGggbWVudGlvbmlu
ZyB0aGF0IHRoaXMgY29udHJvbGxlciB3YXMgb3JpZ2luYWxseSBwcm92aWRlZAo+IGJ5IEV2YXRy
b25peCwgdGhlbiBDYWRlbmNlIGJvdWdodCB0aGUgRXZhdHJvbml4IElQIGJ1c2luZXNzLgoKVHJ1
ZSBJJ3ZlIGFkZGVkIHRoaXMgaW4gdGhlIGNvbW1pdCBsb2cgYXMgd2VsbCBhcyB0aGUgbWFpbiBo
ZWFkZXIuCgo+ID4gKwlyem4xX25hbmQtPnRpbV9nZW5fc2VxMiA9Cj4gPiArCQlUSU1fR0VOX1NF
UTJfRDgoVE9fQ1lDTEVTNjQoc2RyLT50UlJfbWluICsgc2RyLT50UkVBX21heCwKPiA+IHBlcmlv
ZF9ucykpIHwKPiA+ICsJCVRJTV9HRU5fU0VRMl9EOShUT19DWUNMRVM2NChzZHItPnRSUl9taW4s
IHBlcmlvZF9ucykpIHwKPiA+ICsJCVRJTV9HRU5fU0VRMl9EMTAoVE9fQ1lDTEVTNjQoY2xlIC0g
Y3ljLCBwZXJpb2RfbnMpKSB8Cj4gPiArCQlUSU1fR0VOX1NFUTJfRDExKFRPX0NZQ0xFUzY0KGJl
Zl9kbHksIHBlcmlvZF9ucykpOyAgCj4gSW4gb3VyIG91dC1vZi10cmVlIGRyaXZlciBmb3IgdGhp
cyBjb250cm9sbGVyIFsxXSwgd2UgYWxsb3dlZCB0aW1lIGZvcgo+IHRoZSBzaWduYWwgdG8gcHJv
cGFnYXRlIHRocm91Z2ggdGhlIFJaL04xIGlvIGJ1ZmZlcnM7IFdlIGp1c3QgYWRkZWQgNW5zCj4g
dG8gYWxsIHRoZSB0aW1pbmdzLiBEb24ndCB5b3UgbmVlZCB0byBkbyBzb21ldGhpbmcgc2ltaWxh
cj8gSSB2YWd1ZWx5Cj4gcmVjYWxsIHRoYXQgc29tZSB2YWx1ZXMgcHJvZ3JhbW1lZCB0byAwIGNh
dXNlZCBpc3N1ZXMuCgpJIGhhdmUgbm90IGV4cGVyaWVuY2VkIGFueSBpc3N1ZXMgeWV0LCBJIGRv
bid0IHRoaW5rIHdpdGggdGhlc2UKY2FsY3VsYXRpb25zIHRoZXJlIGFyZSBtYW55IHZhbHVlcyBz
ZXQgdG8gMCBhbnl3YXkuIEJ1dCB0aGFua3MgZm9yIHRoZQpmZWVkYmFjaywgaWYgYW55Ym9keSBy
ZXBvcnRzIGVycm9ycyB3aXRoIHRoZXNlIHRpbWluZ3Mgb24gYW5vdGhlciBib2FyZAp0aGVuIHdl
J2xsIGtub3cgd2hlcmUgdG8gbG9vay4KCj4gPiArc3RhdGljIGludCByem4xX25hbmRfY2hpcF9p
bml0KHN0cnVjdCByem4xX25mYyAqbmZjLCBzdHJ1Y3QgZGV2aWNlX25vZGUgIAo+IC4uLgo+ID4g
Kwlmb3IgKGkgPSAwOyBpIDwgbnNlbHM7IGkrKykgewo+ID4gKwkJcmV0ID0gb2ZfcHJvcGVydHlf
cmVhZF91MzJfaW5kZXgobnAsICJyZWciLCBpLCAmY3MpOwo+ID4gKwkJaWYgKHJldCkgewo+ID4g
KwkJCWRldl9lcnIobmZjLT5kZXYsICJJbmNvbXBsZXRlIHJlZyBwcm9wZXJ0eSAoJWQpXG4iLAo+
ID4gKwkJCQlyZXQpOwo+ID4gKwkJCXJldHVybiByZXQ7Cj4gPiArCQl9ICAKPiBDaGVjayBjcyBp
cyA8PSBuciBvZiBiaXRzIGluIGFzc2lnbmVkX2NzLgoKSSBiZWxpZXZlIHlvdSBtZWFuIHRoYXQg
SSBzaG91bGQgY2hlY2sgdGhhdCB3ZSBkb24ndCByZXF1ZXN0Cm5vbi1leGlzdGluZyBDUyB2YWx1
ZXMgKDwgNCkuIEkndmUganVzdCBhZGRlZCBzdWNoIGEgY2hlY2ssIHRoYW5rcy4gVGhlCmZhY3Qg
dGhhdCBhIENTIG1pZ2h0IGJlIHNlbGVjdGVkIHR3aWNlIGlzIGhhbmRsZWQgYnkgdGhlIHRlc3Rf
YW5kX3NldCgpCmNhbGwgcmlnaHQgYWZ0ZXIuCgo+ID4gK3N0YXRpYyBpbnQgcnpuMV9uZmNfcHJv
YmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikgeyAgCj4gLi4uCj4gPiArCW5mYy0+cmVn
cyA9IGRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNvdXJjZShwZGV2LCAwKTsKPiA+ICsJaWYgKElT
X0VSUihuZmMtPnJlZ3MpKQo+ID4gKwkJcmV0dXJuIFBUUl9FUlIobmZjLT5yZWdzKTsKPiA+ICsK
PiA+ICsJcnpuMV9uZmNfZGlzX2ludGVycnVwdHMobmZjKTsgIAo+IFlvdSBuZWVkIHRvIGVuYWJs
ZSB0aGUgY2xvY2sgYmVmb3JlIHdyaXRpbmcgdG8gdGhlIHJlZ2lzdGVycy4KCkFic29sdXRlbHks
IHRoYW5rcyBmb3IgdGhlIHJlbWFpbmRlci4KCj4gPiArc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9k
cml2ZXIgcnpuMV9uZmNfZHJpdmVyID0gewo+ID4gKwkuZHJpdmVyID0gewo+ID4gKwkJLm5hbWUg
ICA9ICJyZW5lc2FzLW5mYyIsICAKPiBuaXQ6IHdoaXRlc3BhY2UKPiAKPiBidHcsIHRoZXJlIHdh
cyBhbiBhdHRlbXB0IHRvIHVwc3RyZWFtIGEgZHJpdmVyIGZvciB0aGlzIElQIGEgZmV3IHllYXJz
IGJhY2ssIHNlZSBbMl0KCkRpZG4ndCBrbm93IGFib3V0IHRoaXMgYXR0ZW1wdCA6KQoKPiAKPiBU
aGFua3MKPiBQaGlsCj4gCj4gWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9yZW5lc2FzLXJ6L3J6bjFf
bGludXgvYmxvYi9yem4xLXN0YWJsZS12NC4xOS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9ldmF0cm9u
aXhfbmFuZC5jCj4gWzJdIGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcGF0Y2gvNjI5MDk2
Lwo+IAo+IAo+IAoKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
