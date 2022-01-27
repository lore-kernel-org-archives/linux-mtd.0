Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27549C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jan 2022 12:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FrGzV3nCje9Q76WqX4Lxp3jKDPXSmnggCmKtPkJ6ky0=; b=hhlSUXaTtbh9nU
	Isn1nnUkqqdpsVainRXTrfHWsARVAkW5pmY3Vs87ybRhADb8+x2HgBdTFFqLeD/eqVt2FJRz+ADyj
	0XVObxw1EKOKKJLnd03bvgnwB1GoCxbxDHxYc/VQTGqGjf1wc5B8vGGh1P2nml69puTW5nLRtmD3j
	nxzUIMNPJx7gGHnPmZwMSF+43iz0dKI2mNOqMbZGkLxNOUi5D23FMdIeUZA8lj9jL0Y9Skh8dPn+p
	lN+GyQGSToPrui3ZZAhmTwNmc3Ja4VLa0UQjNgfE0gqDccwRC8rPNaJH/AXNOkPqRBQDgzBUeuB8v
	d1kaQYGV+qkKK41A8Gwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nD3nR-00Febm-P8; Thu, 27 Jan 2022 12:22:37 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nD3nJ-00FeVd-NT
 for linux-mtd@lists.infradead.org; Thu, 27 Jan 2022 12:22:34 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 77EE7C0004;
 Thu, 27 Jan 2022 12:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1643286147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0UuARqG0caXCnAOg9IiqAh4t2VvyDEdt/L0s1WjKwo0=;
 b=k820hYy0MpllS6ZZscLS++LZqlCFYeKQ5FG4GuIWphXiHY9+BpoESZ6FGOMbVZeTZ+H4Gw
 D137Q7q8smiegxXlIeahRGeI+upbJsOobkA2PPXXLw3A2zTqS8dHoSq9Ur8FW/za+JEURC
 h7/iAHHt1L5h9wik1sP6idu/sQf+0kBnZ0/M9Cj0jSx8IeGYUt9uYanWC7P/uZ+QuI+qyi
 a3S+8qDVmS/r5m1DWcIhN5BuG9yxD0dltM4cG4IFdj76+rdEAgjvohXz3paobGsPguZDO1
 riojEsfWb8hMyB8t2q7t0JjLe/y9UgORxxH9eKjALqa6QHDsmpQKvvhNxR7ylw==
Date: Thu, 27 Jan 2022 13:22:24 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush
 Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>, MTD Maling List
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] mtd: Replace the expert mode symbols with a single helper
Message-ID: <20220127132224.0d095bc6@xps13>
In-Reply-To: <CAMuHMdWkr8FFC3KKWY6A1Csz9Jz6MB7EmsTgs2miRfntwVoeoA@mail.gmail.com>
References: <20220127110828.1065099-1-miquel.raynal@bootlin.com>
 <CAMuHMdWkr8FFC3KKWY6A1Csz9Jz6MB7EmsTgs2miRfntwVoeoA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_042230_301304_B87BBB51 
X-CRM114-Status: GOOD (  30.64  )
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

SGkgR2VlcnQsCgpnZWVydEBsaW51eC1tNjhrLm9yZyB3cm90ZSBvbiBUaHUsIDI3IEphbiAyMDIy
IDEzOjAxOjE4ICswMTAwOgoKPiBIaSBNaXF1ZWwsCj4gCj4gT24gVGh1LCBKYW4gMjcsIDIwMjIg
YXQgMTI6MDggUE0gTWlxdWVsIFJheW5hbAo+IDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3
cm90ZToKPiA+IFJlZHVjZSB0aGUgbnVtYmVyIG9mIGV4cG9ydGVkIHN5bWJvbHMgYnkgcmVwbGFj
aW5nOgo+ID4gLSBtdGRfZXhwZXJ0X2FuYWx5c2lzX3dhcm5pbmcgKHRoZSBlcnJvciBzdHJpbmcp
Cj4gPiAtIG10ZF9leHBlcnRfYW5hbHlzaXNfbW9kZSAodGhlIGJvb2xlYW4pCj4gPiB3aXRoIGEg
c2luZ2xlIGhlbHBlcjoKPiA+IC0gbXRkX2NoZWNrX2V4cGVydF9hbmFseXNpc19tb2RlCj4gPgo+
ID4gQ2FsbGluZyB0aGlzIGhlbHBlciB3aWxsIGJvdGggY2hlY2svcmV0dXJuIHRoZSBjb250ZW50
IG9mIHRoZSBpbnRlcm5hbAo+ID4gYm9vbGVhbiAtd2hpY2ggaXMgbm90IGV4cG9ydGVkIGFueW1v
cmUtIGFuZCBhcyB3ZWxsIFdBUk5fT05DRSgpIHRoZQo+ID4gdXNlci4KPiA+Cj4gPiBXaGlsZSBv
biB0aGlzIGZ1bmN0aW9uLCBtYWtlIHRoZSBlcnJvciBzdHJpbmcgbG9jYWwgdG8gdGhlIGhlbHBl
ciBhbmQKPiA+IHNldCBpdCBjb25zdC4KPiA+Cj4gPiBVcGRhdGUgYWxsIHRoZSBjb25zdW1lcnMu
Cj4gPgo+ID4gU3VnZ2VzdGVkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02
OGsub3JnPgo+ID4gU2lnbmVkLW9mZi1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBi
b290bGluLmNvbT4gIAo+IAo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCEKPiAKPiA+IC0tLSBhL2Ry
aXZlcnMvbXRkL210ZGNvcmUuYwo+ID4gKysrIGIvZHJpdmVycy9tdGQvbXRkY29yZS5jCj4gPiBA
QCAtMzU4LDYgKzM1OCwxOSBAQCBzdGF0aWMgaW50IG10ZF9wYXJ0bmFtZV9kZWJ1Z19zaG93KHN0
cnVjdCBzZXFfZmlsZSAqcywgdm9pZCAqcCkKPiA+Cj4gPiAgREVGSU5FX1NIT1dfQVRUUklCVVRF
KG10ZF9wYXJ0bmFtZV9kZWJ1Zyk7Cj4gPgo+ID4gK3N0YXRpYyBib29sIG10ZF9leHBlcnRfYW5h
bHlzaXNfbW9kZTsKPiA+ICsKPiA+ICtib29sIG10ZF9jaGVja19leHBlcnRfYW5hbHlzaXNfbW9k
ZSh2b2lkKQo+ID4gK3sKPiA+ICsgICAgICAgY29uc3QgY2hhciAqbXRkX2V4cGVydF9hbmFseXNp
c193YXJuaW5nID0KPiA+ICsgICAgICAgICAgICAgICAiQmFkIGJsb2NrIGNoZWNrcyBoYXZlIGJl
ZW4gZW50aXJlbHkgZGlzYWJsZWQuXG4iCj4gPiArICAgICAgICAgICAgICAgIlRoaXMgaXMgb25s
eSByZXNlcnZlZCBmb3IgcG9zdC1tb3J0ZW0gZm9yZW5zaWNzIGFuZCBkZWJ1ZyBwdXJwb3Nlcy5c
biIKPiA+ICsgICAgICAgICAgICAgICAiTmV2ZXIgZW5hYmxlIHRoaXMgbW9kZSBpZiB5b3UgZG8g
bm90IGtub3cgd2hhdCB5b3UgYXJlIGRvaW5nIVxuIjsKPiA+ICsKPiA+ICsgICAgICAgcmV0dXJu
IFdBUk5fT05DRShtdGRfZXhwZXJ0X2FuYWx5c2lzX21vZGUsIG10ZF9leHBlcnRfYW5hbHlzaXNf
d2FybmluZyk7Cj4gPiArfQo+ID4gK0VYUE9SVF9TWU1CT0xfR1BMKG10ZF9jaGVja19leHBlcnRf
YW5hbHlzaXNfbW9kZSk7ICAKPiAKPiBQbGVhc2UgcHV0IHRoaXMgaW5zaWRlICNpZm5kZWYgQ09O
RklHX0RFQlVHX0ZTLCBhcyBpdCB3YXN0ZXMKPiAxNzYgYnl0ZXMgZm9yIHRoZSBtZXNzYWdlLCBh
bmQgcHJvYmFibHkgdGhlIHNhbWUgZm9yIHRoZSBXQVJOX09OQ0UoKSwKPiBmb3IgcHJvZHVjdGlv
biBrZXJuZWxzLgoKWWVzIEkgd2lsbCBkbyB0aGF0LiBJIHNlbnQgdGhpcyB2ZXJzaW9uIGJlZm9y
ZSBzZWVpbmcgeW91ciBmaXJzdCBhbnN3ZXIKYWJvdXQgdGhlICNpZmRlZiByZXF1ZXN0IGFuZCBh
cmd1aW5nIGFib3V0IGl0LgoKPiAKPiA+ICsKPiA+ICBzdGF0aWMgc3RydWN0IGRlbnRyeSAqZGZz
X2Rpcl9tdGQ7Cj4gPgo+ID4gIHN0YXRpYyB2b2lkIG10ZF9kZWJ1Z2ZzX3BvcHVsYXRlKHN0cnVj
dCBtdGRfaW5mbyAqbXRkKSAgCj4gCj4gPiAtLS0gYS9pbmNsdWRlL2xpbnV4L210ZC9tdGQuaAo+
ID4gKysrIGIvaW5jbHVkZS9saW51eC9tdGQvbXRkLmgKPiA+IEBAIC03MTEsNyArNzExLDYgQEAg
c3RhdGljIGlubGluZSBpbnQgbXRkX2lzX2JpdGZsaXBfb3JfZWNjZXJyKGludCBlcnIpIHsKPiA+
Cj4gPiAgdW5zaWduZWQgbXRkX21tYXBfY2FwYWJpbGl0aWVzKHN0cnVjdCBtdGRfaW5mbyAqbXRk
KTsKPiA+Cj4gPiAtZXh0ZXJuIGNoYXIgKm10ZF9leHBlcnRfYW5hbHlzaXNfd2FybmluZzsKPiA+
IC1leHRlcm4gYm9vbCBtdGRfZXhwZXJ0X2FuYWx5c2lzX21vZGU7Cj4gPiArYm9vbCBtdGRfY2hl
Y2tfZXhwZXJ0X2FuYWx5c2lzX21vZGUodm9pZCk7ICAKPiAKPiAjaWZkZWYgQ09ORklHX0RFQlVH
X0ZTCj4gYm9vbCBtdGRfY2hlY2tfZXhwZXJ0X2FuYWx5c2lzX21vZGUodm9pZCk7Cj4gI2Vsc2UK
PiBzdGF0aWMgaW5saW5lIGJvb2wgbXRkX2NoZWNrX2V4cGVydF9hbmFseXNpc19tb2RlKHZvaWQp
IHsgcmV0dXJuIGZhbHNlOyB9Cj4gI2VuZGlmCj4gCj4gPgo+ID4gICNlbmRpZiAvKiBfX01URF9N
VERfSF9fICovICAKPiAKPiBHcntvZXRqZSxlZXRpbmd9cywKPiAKPiAgICAgICAgICAgICAgICAg
ICAgICAgICBHZWVydAo+IAo+IC0tCj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90
cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwo+IAo+IEluIHBl
cnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxm
IGEgaGFja2VyLiBCdXQKPiB3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBz
YXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwoKClRoYW5rcywKTWlxdcOobAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
