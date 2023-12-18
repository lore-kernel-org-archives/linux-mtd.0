Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B74CC35274
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Dec 2023 14:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lWSIzLkbcSaETa7o1ZypPmxu8sDReiWXL9guMIzQOtA=; b=2dyZAipvhLhMQa
	TknXlggh7+GMtFu6Du/c7H35hPvvAhnkVAn0nEamFkR79tlTK2lj7H9knJEmprJI3Zg8//zvIwcOD
	aqBvwHgw0EhTHzu6KiZ1N3WPFBCjrPJ8G1nwi9WgM7e0E+3+xI6vgbOGOmgWA5pCXjm7aLNB8PHMD
	3I31te0Mql5A6F2nDr7o+pvQ54MXKQWbvHnVLaFgDdY94Io8s8AYklRzg8o/R+60XQcLIT+ryF2T1
	Lh6hxwDNbIg0484B5+QIWRang5lzrWQfRVqgPoUPU+Iqx1sKEcM0xMmamIjToYJTs3roGB5t8pTRQ
	oh25GBm5eYJOJcaTj4kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFEUp-00B1Nj-2o;
	Mon, 18 Dec 2023 14:21:27 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFEUl-00B1Jf-05;
	Mon, 18 Dec 2023 14:21:25 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 40F0E240002;
	Mon, 18 Dec 2023 14:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702909278;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VcFINdpUM3413RjJFum1h+gsTWlsCTgB3Zco0HFf37w=;
	b=LpWZMhU+/FlDz/l6g9cAsHmsE93Bhq4Id8XqSYWOsaMalk5GcvOUsDi//RUZIFy+2Q+nKp
	r0Ue5TYs8IiSKetzoBq1URx/7EQWB342qgDX9X4FQkp3TvAfan3jwJ/jm+EMzOscAy6PJt
	z1av9pI3PSW8EUlbraBlXyEOr+LrwjXs4Fm5641BoWxtj/ZC1A/Qt4/8tguLpW2jCJi9YY
	N4d1OHK+l82zLAWuHEjEGFXpbIQFgiGXVdCq4bJhDwmJDqIhJTzoOkQFokmWPmv+8OtQ/M
	XljLCSnzggt7fIDqzF58t8GnU7eBiYK4OrDKmG307kg9prYOyXR/b0+KZOspMA==
Date: Mon, 18 Dec 2023 15:21:16 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Michael Walle
 <michael@walle.cc>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, u-boot@lists.denx.de, =?UTF-8?B?UmFmYcWC?=
 =?UTF-8?B?IE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH 4/4] nvmem: layouts: add U-Boot env layout
Message-ID: <20231218152116.59d59bad@xps-13>
In-Reply-To: <20231218133722.16150-4-zajec5@gmail.com>
References: <20231218133722.16150-1-zajec5@gmail.com>
	<20231218133722.16150-4-zajec5@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_062123_327168_190DF4C7 
X-CRM114-Status: GOOD (  23.87  )
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

SGkgUmFmYcWCLAoKemFqZWM1QGdtYWlsLmNvbSB3cm90ZSBvbiBNb24sIDE4IERlYyAyMDIzIDE0
OjM3OjIyICswMTAwOgoKPiBGcm9tOiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+
Cj4gCj4gVGhpcyBwYXRjaCBtb3ZlcyBhbGwgZ2VuZXJpYyAoTlZNRU0gZGV2aWNlcyBpbmRlcGVu
ZGVudCkgY29kZSBmcm9tIE5WTUVNCj4gZGV2aWNlIGRyaXZlciB0byBOVk1FTSBsYXlvdXQgZHJp
dmVyLiBUaGVuIGl0IGFkZHMgYSBzaW1wbGUgTlZNRU0gbGF5b3V0Cj4gY29kZSBvbiB0b3Agb2Yg
aXQuCj4gCj4gVGhhbmtzIHRvIHByb3BlciBsYXlvdXQgaXQncyBwb3NzaWJsZSB0byBzdXBwb3J0
IFUtQm9vdCBlbnYgZGF0YSBzdG9yZWQKPiBvbiBhbnkga2luZCBvZiBOVk1FTSBkZXZpY2UuCj4g
Cj4gRm9yIGJhY2t3YXJkIGNvbXBhdGliaWxpdHkgd2l0aCBvbGQgRFQgYmluZGluZ3Mgd2UgbmVl
ZCB0byBrZWVwIG9sZAo+IE5WTUVNIGRldmljZSBkcml2ZXIgZnVuY3Rpb25hbC4gVG8gYXZvaWQg
Y29kZSBkdXBsaWNhdGlvbiBhIHBhcnNpbmcKPiBmdW5jdGlvbiBpcyBleHBvcnRlZCBhbmQgcmV1
c2VkIGluIGl0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWls
ZWNraS5wbD4KPiAtLS0KCkkgaGF2ZSBhIGNvdXBsZSBvZiBjb21tZW50cyBhYm91dCB0aGUgb3Jp
Z2luYWwgZHJpdmVyIHdoaWNoIGdldHMKY29weS1wYXN0ZWQgaW4gdGhlIG5ldyBsYXlvdXQgZHJp
dmVyLCBtYXliZSB5b3UgY291bGQgY2xlYW4gdGhlc2UKKHRoZSBtZW1vcnkgbGVhayBzaG91bGQg
YmUgZml4ZWQgYmVmb3JlIHRoZSBtaWdyYXRpb24gc28gaXQgY2FuIGJlCmJhY2twb3J0ZWQgZWFz
aWx5LCB0aGUgb3RoZXJzIGFyZSBqdXN0IHN0eWxlIHNvIGl0IGNhbiBiZSBkb25lIGFmdGVyLCBJ
CmRvbid0IG1pbmQpLgoKLi4uCgo+ICtpbnQgdV9ib290X2Vudl9wYXJzZShzdHJ1Y3QgZGV2aWNl
ICpkZXYsIHN0cnVjdCBudm1lbV9kZXZpY2UgKm52bWVtLAo+ICsJCSAgICAgZW51bSB1X2Jvb3Rf
ZW52X2Zvcm1hdCBmb3JtYXQpCj4gK3sKPiArCXNpemVfdCBjcmMzMl9kYXRhX29mZnNldDsKPiAr
CXNpemVfdCBjcmMzMl9kYXRhX2xlbjsKPiArCXNpemVfdCBjcmMzMl9vZmZzZXQ7Cj4gKwlzaXpl
X3QgZGF0YV9vZmZzZXQ7Cj4gKwlzaXplX3QgZGF0YV9sZW47Cj4gKwlzaXplX3QgZGV2X3NpemU7
Cj4gKwl1aW50MzJfdCBjcmMzMjsKPiArCXVpbnQzMl90IGNhbGM7Cj4gKwl1aW50OF90ICpidWY7
Cj4gKwlpbnQgYnl0ZXM7Cj4gKwlpbnQgZXJyOwo+ICsKPiArCWRldl9zaXplID0gbnZtZW1fZGV2
X3NpemUobnZtZW0pOwo+ICsKPiArCWJ1ZiA9IGtjYWxsb2MoMSwgZGV2X3NpemUsIEdGUF9LRVJO
RUwpOwoKT3V0IG9mIGN1cmlvc2l0eSwgd2h5IGtjYWxsb2MoMSwuLi4pIHJhdGhlciB0aGFuIGt6
YWxsb2MoKSA/Cgo+ICsJaWYgKCFidWYpIHsKPiArCQllcnIgPSAtRU5PTUVNOwo+ICsJCWdvdG8g
ZXJyX291dDsKCldlIGNvdWxkIGRpcmVjdGx5IHJldHVybiBFTk9NRU0gaGVyZSBJIGd1ZXNzLgoK
PiArCX0KPiArCj4gKwlieXRlcyA9IG52bWVtX2RldmljZV9yZWFkKG52bWVtLCAwLCBkZXZfc2l6
ZSwgYnVmKTsKPiArCWlmIChieXRlcyA8IDApCj4gKwkJcmV0dXJuIGJ5dGVzOwo+ICsJZWxzZSBp
ZiAoYnl0ZXMgIT0gZGV2X3NpemUpCj4gKwkJcmV0dXJuIC1FSU87CgpEb24ndCB3ZSBuZWVkIHRv
IGZyZWUgYnVmIGluIHRoZSBhYm92ZSBjYXNlcz8KCj4gKwlzd2l0Y2ggKGZvcm1hdCkgewo+ICsJ
Y2FzZSBVX0JPT1RfRk9STUFUX1NJTkdMRToKPiArCQljcmMzMl9vZmZzZXQgPSBvZmZzZXRvZihz
dHJ1Y3QgdV9ib290X2Vudl9pbWFnZV9zaW5nbGUsIGNyYzMyKTsKPiArCQljcmMzMl9kYXRhX29m
ZnNldCA9IG9mZnNldG9mKHN0cnVjdCB1X2Jvb3RfZW52X2ltYWdlX3NpbmdsZSwgZGF0YSk7Cj4g
KwkJZGF0YV9vZmZzZXQgPSBvZmZzZXRvZihzdHJ1Y3QgdV9ib290X2Vudl9pbWFnZV9zaW5nbGUs
IGRhdGEpOwo+ICsJCWJyZWFrOwo+ICsJY2FzZSBVX0JPT1RfRk9STUFUX1JFRFVOREFOVDoKPiAr
CQljcmMzMl9vZmZzZXQgPSBvZmZzZXRvZihzdHJ1Y3QgdV9ib290X2Vudl9pbWFnZV9yZWR1bmRh
bnQsIGNyYzMyKTsKPiArCQljcmMzMl9kYXRhX29mZnNldCA9IG9mZnNldG9mKHN0cnVjdCB1X2Jv
b3RfZW52X2ltYWdlX3JlZHVuZGFudCwgZGF0YSk7Cj4gKwkJZGF0YV9vZmZzZXQgPSBvZmZzZXRv
ZihzdHJ1Y3QgdV9ib290X2Vudl9pbWFnZV9yZWR1bmRhbnQsIGRhdGEpOwo+ICsJCWJyZWFrOwo+
ICsJY2FzZSBVX0JPT1RfRk9STUFUX0JST0FEQ09NOgo+ICsJCWNyYzMyX29mZnNldCA9IG9mZnNl
dG9mKHN0cnVjdCB1X2Jvb3RfZW52X2ltYWdlX2Jyb2FkY29tLCBjcmMzMik7Cj4gKwkJY3JjMzJf
ZGF0YV9vZmZzZXQgPSBvZmZzZXRvZihzdHJ1Y3QgdV9ib290X2Vudl9pbWFnZV9icm9hZGNvbSwg
ZGF0YSk7Cj4gKwkJZGF0YV9vZmZzZXQgPSBvZmZzZXRvZihzdHJ1Y3QgdV9ib290X2Vudl9pbWFn
ZV9icm9hZGNvbSwgZGF0YSk7Cj4gKwkJYnJlYWs7Cj4gKwl9Cj4gKwljcmMzMiA9IGxlMzJfdG9f
Y3B1KCooX19sZTMyICopKGJ1ZiArIGNyYzMyX29mZnNldCkpOwoKTG9va3MgYSBiaXQgY29udm9s
dXRlZCwgYW55IGNoYW5jZXMgd2UgY2FuIHVzZSBpbnRlcm1lZGlhdGUgdmFyaWFibGVzCnRvIGhl
bHAgZGVjaXBoZXIgdGhpcz8KCj4gKwljcmMzMl9kYXRhX2xlbiA9IGRldl9zaXplIC0gY3JjMzJf
ZGF0YV9vZmZzZXQ7Cj4gKwlkYXRhX2xlbiA9IGRldl9zaXplIC0gZGF0YV9vZmZzZXQ7Cj4gKwo+
ICsJY2FsYyA9IGNyYzMyKH4wLCBidWYgKyBjcmMzMl9kYXRhX29mZnNldCwgY3JjMzJfZGF0YV9s
ZW4pIF4gfjBMOwo+ICsJaWYgKGNhbGMgIT0gY3JjMzIpIHsKPiArCQlkZXZfZXJyKGRldiwgIklu
dmFsaWQgY2FsY3VsYXRlZCBDUkMzMjogMHglMDh4IChleHBlY3RlZDogMHglMDh4KVxuIiwgY2Fs
YywgY3JjMzIpOwo+ICsJCWVyciA9IC1FSU5WQUw7Cj4gKwkJZ290byBlcnJfa2ZyZWU7Cj4gKwl9
Cj4gKwo+ICsJYnVmW2Rldl9zaXplIC0gMV0gPSAnXDAnOwo+ICsJZXJyID0gdV9ib290X2Vudl9w
YXJzZV9jZWxscyhkZXYsIG52bWVtLCBidWYsIGRhdGFfb2Zmc2V0LCBkYXRhX2xlbik7Cj4gKwlp
ZiAoZXJyKQo+ICsJCWRldl9lcnIoZGV2LCAiRmFpbGVkIHRvIGFkZCBjZWxsczogJWRcbiIsIGVy
cik7CgpQbGVhc2UgZHJvcCB0aGlzIGVycm9yIG1lc3NhZ2UsIHRoZSBvbmx5IHJlYXNvbiBmb3Ig
d2hpY2ggdGhlIGZ1bmN0aW9uCmNhbGwgd291bGQgZmFpbCBpcyBhcHBhcmVudGx5IGFuIEVOT01F
TSBjYXNlLgoKPiArCj4gK2Vycl9rZnJlZToKPiArCWtmcmVlKGJ1Zik7Cj4gK2Vycl9vdXQ6Cj4g
KwlyZXR1cm4gZXJyOwo+ICt9Cj4gK0VYUE9SVF9TWU1CT0xfR1BMKHVfYm9vdF9lbnZfcGFyc2Up
Owo+ICsKPiArc3RhdGljIGludCB1X2Jvb3RfZW52X2FkZF9jZWxscyhzdHJ1Y3QgZGV2aWNlICpk
ZXYsIHN0cnVjdCBudm1lbV9kZXZpY2UgKm52bWVtKQo+ICt7Cj4gKwljb25zdCBzdHJ1Y3Qgb2Zf
ZGV2aWNlX2lkICptYXRjaDsKPiArCXN0cnVjdCBkZXZpY2Vfbm9kZSAqbGF5b3V0X25wOwo+ICsJ
ZW51bSB1X2Jvb3RfZW52X2Zvcm1hdCBmb3JtYXQ7Cj4gKwo+ICsJbGF5b3V0X25wID0gb2ZfbnZt
ZW1fbGF5b3V0X2dldF9jb250YWluZXIobnZtZW0pOwo+ICsJaWYgKCFsYXlvdXRfbnApCj4gKwkJ
cmV0dXJuIC1FTk9FTlQ7Cj4gKwo+ICsJbWF0Y2ggPSBvZl9tYXRjaF9ub2RlKHVfYm9vdF9lbnZf
b2ZfbWF0Y2hfdGFibGUsIGxheW91dF9ucCk7Cj4gKwlpZiAoIW1hdGNoKQo+ICsJCXJldHVybiAt
RU5PRU5UOwo+ICsKPiArCWZvcm1hdCA9ICh1aW50cHRyX3QpbWF0Y2gtPmRhdGE7CgpJbiB0aGUg
Y29yZSB0aGVyZSBpcyBjdXJyZW50bHkgYW4gdW51c2VkIGhlbHBlciBjYWxsZWQKbnZtZW1fbGF5
b3V0X2dldF9tYXRjaF9kYXRhKCkgd2hpY2ggZG9lcyB0aGF0LiBJIHRoaW5rIHRoZSBvcmlnaW5h
bAppbnRlbnQgb2YgdGhpcyBmdW5jdGlvbiB3YXMgdG8gYmUgdXNlZCBpbiB0aGlzIGRyaXZlciwg
c28gZGVwZW5kaW5nIG9uCnlvdXIgcHJlZmVyZW5jZSwgY2FuIHlvdSBwbGVhc2UgZWl0aGVyIHVz
ZSBpdCBvciByZW1vdmUgaXQ/Cgo+ICsKPiArCW9mX25vZGVfcHV0KGxheW91dF9ucCk7Cj4gKwo+
ICsJcmV0dXJuIHVfYm9vdF9lbnZfcGFyc2UoZGV2LCBudm1lbSwgZm9ybWF0KTsKPiArfQoKVGhh
bmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
