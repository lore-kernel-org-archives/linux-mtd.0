Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2FEFEB64D9
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jul 2023 15:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MnOFnssjC8xeUIORAX8y2dzcxh20hnCT5MlWf64Kc6k=; b=bwCTCeaGd3UA7w
	dfq9QDJTe9nAiGigqTsbUUu07982Wu2iZyEHjGX6Cq0lHXKoH3jomNIq80zRobYLrW+UnfwgZTzgg
	s9Zu+ecTe5sDABoRAPc/a6zo7dOk9UJf3IbcGzTfSHlyQSIrx00k+DyFF4XMWvVmGxT6s7vlklEol
	NNggW80Z/eu6dwLFumrFBp9zYykspHIBlryfjwwCowXYjLxi0ocg+Ik3Y0e61zOuhIEM7Fc+xpJ4u
	Y60M4CCYHiCO/tk21enwZFvb9qMLzfnCKPC1629gSML92KUFIPPXP+OQyF45WkvlXJw/yyLz6qWBP
	FlTL1eKj1IxWCuQNdlaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGheM-00Dbvn-1H;
	Tue, 04 Jul 2023 15:09:06 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGheI-00Dbu5-1d;
	Tue, 04 Jul 2023 15:09:04 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1688483339;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2e1y57kMTneCeOtV2lfhgiriEfxFx2Hg2M8j4ecPq1c=;
	b=mvQc7yb3VPnLvTVztzn7lcdFYh4ZeB0JalspSDn7QOQyDaubg3/7+6FEJzdWE8thvvxzxU
	Vu//sqJiKAkbN+g2DFQZAADDNiuYAAAEM05HlbKnaJ/QxbcC/nJhHcwPi8gA5Qomgx4t9Z
	GHmfk8VrTxcF/J90mfFusWsYsT0x5GIg34f1jch6fb9zibTBgL7YhPRLBySAa9mUdJi5Eo
	0pQSaHjHOLgSi8bB+VSynLPRpFhqOq/0yPZH4XP5hG4L6qtnj8SBele2sh7SDabyU+JgLm
	4ri/O3B/5Qs1FwtzJtKALdFX0fU8aDRB8JjzV+1GGtkFJlR/C9ZiGaw0/+xdXw==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E7DCF1C000A;
	Tue,  4 Jul 2023 15:08:58 +0000 (UTC)
Date: Tue, 4 Jul 2023 17:08:58 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Johan Jonker <jbx6244@gmail.com>
Cc: richard@nod.at, vigneshr@ti.com, heiko@sntech.de,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 yifeng.zhao@rock-chips.com
Subject: Re: [PATCH v3 2/3] mtd: rawnand: rockchip-nand-controller: copy
 hwecc PA data to oob_poi buffer
Message-ID: <20230704170858.2a64c181@xps-13>
In-Reply-To: <539cfba7-dd6f-015e-b990-a2335cb3aac9@gmail.com>
References: <0047fc52-bc45-a768-8bdd-c0f12cddc17e@gmail.com>
	<539cfba7-dd6f-015e-b990-a2335cb3aac9@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_080902_805416_99D594CF 
X-CRM114-Status: GOOD (  26.62  )
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

SGkgSm9oYW4sCgpqYng2MjQ0QGdtYWlsLmNvbSB3cm90ZSBvbiBUaHUsIDE1IEp1biAyMDIzIDE5
OjM0OjEzICswMjAwOgoKPiBSb2NrY2hpcCBib290IGJsb2NrcyBhcmUgd3JpdHRlbiBwZXIgNCB4
IDUxMiBieXRlIHNlY3RvcnMgcGVyIHBhZ2UuCj4gRWFjaCBwYWdlIG11c3QgaGF2ZSBhIHBhZ2Ug
YWRkcmVzcyAoUEEpIHBvaW50ZXIgaW4gT09CIHRvIHRoZSBuZXh0IHBhZ2UuCgpPbmx5IHdoZW4g
dXNlZCBhcyBib290IGRldmljZSBJIGd1ZXNzPyBJdCdzIGEgQm9vdFJPTSBsaW1pdGF0aW9uLgoK
PiBQYWdlcyBhcmUgd3JpdHRlbiBpbiBhIHBhdHRlcm4gZGVwZW5kaW5nIG9uIHRoZSBOQU5EIGNo
aXAgSUQuCj4gVGhpcyBsb2dpYyB1c2VkIHRvIGJ1aWxkIGEgcGFnZSBwYXR0ZXJuIHRhYmxlIGlz
IG5vdCBmdWxseSBkaXNjbG9zZWQgYW5kCj4gaXMgbm90IGVhc3kgdG8gZml0IGluIHRoZSBNVEQg
ZnJhbWV3b3JrLgo+IFRoZSBmb3JtdWxhIGluIHJrX25mY193cml0ZV9wYWdlX2h3ZWNjKCkgZnVu
Y3Rpb24gaXMgbm90IGNvcnJlY3QuCj4gTWFrZSBod2VjYyBhbmQgcmF3IGJlaGF2aW9yIGlkZW50
aWNhbC4KClNvIHRoaXMgaXMgYSBmaXggYXMgd2VsbCwgZGVzZXJ2ZXMgYSB0YWcuIFdoYXRldmVy
IHRoZSByZWFzb24gd2h5IHlvdQpuZWVkIHRoaXMsIHRoZSBpc3N1ZSB5b3UgYXJlIHNvbHZpbmcg
aXM6IHdyaXRlX3BhZ2VfaHdlY2MgYW5kCndyaXRlX3BhZ2VfcmF3IGFyZSBub3QgYWxpZ25lZC4K
Cj4gR2VuZXJhdGUgYm9vdCBibG9jayBwYWdlIGFkZHJlc3MgYW5kIHBhdHRlcm4gZm9yIGh3ZWNj
IGluIHVzZXIgc3BhY2UKPiBhbmQgY29weSBQQSBkYXRhIHRvL2Zyb20gdGhlIGFscmVhZHkgcmVz
ZXJ2ZWQgbGFzdCA0IGJ5dGVzIGJlZm9yZSBFRUMKCkVDQwoKPiBpbiB0aGUgY2hpcC0+b29iX3Bv
aSBkYXRhIGxheW91dC4KPiAKPiBUaGlzIHBhdGNoIGJyZWFrcyBhbGwgZXhpc3RpbmcgamZmczIg
dXNlcnMgdGhhdCBoYXZlIGZyZWUgT09CIG92ZXJsYXAKPiB3aXRoIHRoZSByZXNlcnZlZCBzcGFj
ZSBmb3IgUEEgZGF0YS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKb2hhbiBKb25rZXIgPGpieDYyNDRA
Z21haWwuY29tPgo+IC0tLQo+IAo+IENoYW5nZWQgVjM6Cj4gICBDaGFuZ2UgcHJlZml4ZXMKPiAg
IFJld29yZAo+IC0tLQo+ICAuLi4vbXRkL25hbmQvcmF3L3JvY2tjaGlwLW5hbmQtY29udHJvbGxl
ci5jICAgfCAzNCArKysrKysrKysrKystLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyMSBpbnNl
cnRpb25zKCspLCAxMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQv
bmFuZC9yYXcvcm9ja2NoaXAtbmFuZC1jb250cm9sbGVyLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jh
dy9yb2NrY2hpcC1uYW5kLWNvbnRyb2xsZXIuYwo+IGluZGV4IDM3ZmMwN2JhNS4uNWEwNDY4MDM0
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L3JvY2tjaGlwLW5hbmQtY29udHJv
bGxlci5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvcm9ja2NoaXAtbmFuZC1jb250cm9s
bGVyLmMKPiBAQCAtNTk4LDcgKzU5OCw3IEBAIHN0YXRpYyBpbnQgcmtfbmZjX3dyaXRlX3BhZ2Vf
aHdlY2Moc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwgY29uc3QgdTggKmJ1ZiwKPiAgCWludCBwYWdl
c19wZXJfYmxrID0gbXRkLT5lcmFzZXNpemUgLyBtdGQtPndyaXRlc2l6ZTsKPiAgCWludCByZXQg
PSAwLCBpLCBib290X3JvbV9tb2RlID0gMDsKPiAgCWRtYV9hZGRyX3QgZG1hX2RhdGEsIGRtYV9v
b2I7Cj4gLQl1MzIgcmVnOwo+ICsJdTMyIHRtcDsKPiAgCXU4ICpvb2I7Cj4gCj4gIAluYW5kX3By
b2dfcGFnZV9iZWdpbl9vcChjaGlwLCBwYWdlLCAwLCBOVUxMLCAwKTsKPiBAQCAtNjI1LDYgKzYy
NSwxMyBAQCBzdGF0aWMgaW50IHJrX25mY193cml0ZV9wYWdlX2h3ZWNjKHN0cnVjdCBuYW5kX2No
aXAgKmNoaXAsIGNvbnN0IHU4ICpidWYsCj4gIAkgKgo+ICAJICogICAweEZGIDB4RkYgMHhGRiAw
eEZGIHwgQkJNIE9PQjEgT09CMiBPT0IzIHwgLi4uCj4gIAkgKgo+ICsJICogVGhlIGNvZGUgaGVy
ZSBqdXN0IHN3YXBzIHRoZSBmaXJzdCA0IGJ5dGVzIHdpdGggdGhlIGxhc3QKPiArCSAqIDQgYnl0
ZXMgd2l0aG91dCBsb3NpbmcgYW55IGRhdGEuCj4gKwkgKgo+ICsJICogVGhlIGNoaXAtPm9vYl9w
b2kgZGF0YSBsYXlvdXQ6Cj4gKwkgKgo+ICsJICogICAgQkJNICBPT0IxIE9PQjIgT09CMyB8Li4u
Li4ufCAgUEEwICBQQTEgIFBBMiAgUEEzCj4gKwkgKgo+ICAJICogQ29uZmlndXJlIHRoZSBFQ0Mg
YWxnb3JpdGhtIHN1cHBvcnRlZCBieSB0aGUgYm9vdCBST00uCj4gIAkgKi8KPiAgCWlmICgocGFn
ZSA8IChwYWdlc19wZXJfYmxrICogcmtuYW5kLT5ib290X2Jsa3MpKSAmJgo+IEBAIC02MzUsMjEg
KzY0MiwxNyBAQCBzdGF0aWMgaW50IHJrX25mY193cml0ZV9wYWdlX2h3ZWNjKHN0cnVjdCBuYW5k
X2NoaXAgKmNoaXAsIGNvbnN0IHU4ICpidWYsCj4gIAl9Cj4gCj4gIAlmb3IgKGkgPSAwOyBpIDwg
ZWNjLT5zdGVwczsgaSsrKSB7Cj4gLQkJaWYgKCFpKSB7Cj4gLQkJCXJlZyA9IDB4RkZGRkZGRkY7
Cj4gLQkJfSBlbHNlIHsKPiArCQlpZiAoIWkpCj4gKwkJCW9vYiA9IGNoaXAtPm9vYl9wb2kgKyAo
ZWNjLT5zdGVwcyAtIDEpICogTkZDX1NZU19EQVRBX1NJWkU7Cj4gKwkJZWxzZQo+ICAJCQlvb2Ig
PSBjaGlwLT5vb2JfcG9pICsgKGkgLSAxKSAqIE5GQ19TWVNfREFUQV9TSVpFOwo+IC0JCQlyZWcg
PSBvb2JbMF0gfCBvb2JbMV0gPDwgOCB8IG9vYlsyXSA8PCAxNiB8Cj4gLQkJCSAgICAgIG9vYlsz
XSA8PCAyNDsKPiAtCQl9Cj4gCj4gLQkJaWYgKCFpICYmIGJvb3Rfcm9tX21vZGUpCgpTbyB3ZSBu
byBsb25nZXIgbmVlZCBib290X3JvbV9tb2RlPyBPciBkbyB3ZT8KCj4gLQkJCXJlZyA9IChwYWdl
ICYgKHBhZ2VzX3Blcl9ibGsgLSAxKSkgKiA0Owo+ICsJCXRtcCA9IG9vYlswXSB8IG9vYlsxXSA8
PCA4IHwgb29iWzJdIDw8IDE2IHwgb29iWzNdIDw8IDI0Owo+IAo+ICAJCWlmIChuZmMtPmNmZy0+
dHlwZSA9PSBORkNfVjkpCj4gLQkJCW5mYy0+b29iX2J1ZltpXSA9IHJlZzsKPiArCQkJbmZjLT5v
b2JfYnVmW2ldID0gdG1wOwo+ICAJCWVsc2UKPiAtCQkJbmZjLT5vb2JfYnVmW2kgKiAob29iX3N0
ZXAgLyA0KV0gPSByZWc7Cj4gKwkJCW5mYy0+b29iX2J1ZltpICogKG9vYl9zdGVwIC8gNCldID0g
dG1wOwo+ICAJfQo+IAo+ICAJZG1hX2RhdGEgPSBkbWFfbWFwX3NpbmdsZShuZmMtPmRldiwgKHZv
aWQgKiluZmMtPnBhZ2VfYnVmLAo+IEBAIC04MTIsMTIgKzgxNSwxNyBAQCBzdGF0aWMgaW50IHJr
X25mY19yZWFkX3BhZ2VfaHdlY2Moc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwgdTggKmJ1ZiwgaW50
IG9vYl9vbiwKPiAgCQlnb3RvIHRpbWVvdXRfZXJyOwo+ICAJfQo+IAo+IC0JZm9yIChpID0gMTsg
aSA8IGVjYy0+c3RlcHM7IGkrKykgewo+IC0JCW9vYiA9IGNoaXAtPm9vYl9wb2kgKyAoaSAtIDEp
ICogTkZDX1NZU19EQVRBX1NJWkU7Cj4gKwlmb3IgKGkgPSAwOyBpIDwgZWNjLT5zdGVwczsgaSsr
KSB7Cj4gKwkJaWYgKCFpKQo+ICsJCQlvb2IgPSBjaGlwLT5vb2JfcG9pICsgKGVjYy0+c3RlcHMg
LSAxKSAqIE5GQ19TWVNfREFUQV9TSVpFOwo+ICsJCWVsc2UKPiArCQkJb29iID0gY2hpcC0+b29i
X3BvaSArIChpIC0gMSkgKiBORkNfU1lTX0RBVEFfU0laRTsKPiArCj4gIAkJaWYgKG5mYy0+Y2Zn
LT50eXBlID09IE5GQ19WOSkKPiAgCQkJdG1wID0gbmZjLT5vb2JfYnVmW2ldOwo+ICAJCWVsc2UK
PiAgCQkJdG1wID0gbmZjLT5vb2JfYnVmW2kgKiAob29iX3N0ZXAgLyA0KV07Cj4gKwo+ICAJCSpv
b2IrKyA9ICh1OCl0bXA7Cj4gIAkJKm9vYisrID0gKHU4KSh0bXAgPj4gOCk7Cj4gIAkJKm9vYisr
ID0gKHU4KSh0bXAgPj4gMTYpOwo+IC0tCj4gMi4zMC4yCj4gCgoKVGhhbmtzLApNaXF1w6hsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
