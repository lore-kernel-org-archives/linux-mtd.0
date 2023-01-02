Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C91A7C3DA7A
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Jan 2023 16:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0DtqCc9XESbGfpye0rucjhg7lqhQpl91qV8d4pZ/Pcg=; b=Dpz0Vc16O06F3b
	P4N3OU+Ftvl+xKIA4S2fLOpie/Nf0URkwaeK98AHZ4cvjZh003pXpIsgMFKGg+/bwUM9aFPc09ell
	QwW9rTaPcOHGdWZGdL5cXN9uz+bmOEUruI17jOhg/YSoh8IMEfGUqLN9FODgI/jJu+LsQ52UDF91E
	UTffj/ScrWrT3BBD+jLnlB2xwOfv6uYH+jujm8O4EiuPS+wkpxmaESWmuEPMSuJa0jTzdshBk+4F+
	jbNTFdvzwC4gYxgLbGhctscxckuG5otqrRfwQ+pMu/v6aF69bhdzMMO56spJz0VmvJC71vSmao9gk
	2rvIt/50znOOYP/9PFiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCO9F-00Cuv3-PA; Mon, 02 Jan 2023 16:58:54 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCO4X-00Ct30-2U; Mon, 02 Jan 2023 16:54:03 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 80EF8240003;
	Mon,  2 Jan 2023 16:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1672678435;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l16kCBmaT+/ZiyhWXb1vgoNulB2WuFRSgnM49QIaZko=;
	b=bVuZLKex0L4H4p9/bMfQIwC8+jwMOvF5KOOqk7RNiVVHrCuWFqYevj9GYCCh0mBUyNNkE3
	cQsM0W533TGPROxUnQjlsm4U9vyGFi3AVwMAfJ3a/4TsGlhe2ji5m3Xq3n1KuSbvcDmhlL
	+j9oqyluN5dC7Dkr3g7ZAXUJoil+d9WqW5If7uoos7wuOX9354GyYw9oFnrwiEYYBS+cV7
	l0o3o9X2kaGF0hPjPL7kb4WVyQQoBhBYsyl8iN5jTHWlLq5fkP//yqkIIjkw3txystbLUg
	dsggDttEC5ykV5wlsrDkvAQBrVjvjvbGR1ye1rV1RDd5t2iary3gUcA7VcRT+Q==
Date: Mon, 2 Jan 2023 17:53:51 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Samuel Holland <samuel@sholland.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Boris Brezillon <bbrezillon@kernel.org>, Brian
 Norris <computersforpeace@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 6/7] mtd: rawnand: sunxi: Update OOB layout to match
 hardware
Message-ID: <20230102175351.64690aaf@xps-13>
In-Reply-To: <e21aba9f-1afd-2615-fe00-3ee4176b9080@sholland.org>
References: <20221229181526.53766-1-samuel@sholland.org>
	<20221229181526.53766-7-samuel@sholland.org>
	<20230102102123.511d337d@xps-13>
	<e21aba9f-1afd-2615-fe00-3ee4176b9080@sholland.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_085401_446880_811637EE 
X-CRM114-Status: GOOD (  30.55  )
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

SGkgU2FtdWVsLAoKc2FtdWVsQHNob2xsYW5kLm9yZyB3cm90ZSBvbiBNb24sIDIgSmFuIDIwMjMg
MTA6MjY6NDggLTA2MDA6Cgo+IEhpIE1pcXXDqGwsCj4gCj4gT24gMS8yLzIzIDAzOjIxLCBNaXF1
ZWwgUmF5bmFsIHdyb3RlOgo+ID4gSGkgU2FtdWVsLAo+ID4gCj4gPiBzYW11ZWxAc2hvbGxhbmQu
b3JnIHdyb3RlIG9uIFRodSwgMjkgRGVjIDIwMjIgMTI6MTU6MjUgLTA2MDA6Cj4gPiAgIAo+ID4+
IFdoZW4gdXNpbmcgdGhlIGhhcmR3YXJlIEVDQyBlbmdpbmUsIHRoZSBPT0IgZGF0YSBpcyBtYWRl
IGF2YWlsYWJsZSBpbgo+ID4+IHRoZSBORkNfUkVHX1VTRVJfREFUQSByZWdpc3RlcnMsIG9uZSAz
Mi1iaXQgd29yZCBwZXIgRUNDIHN0ZXAuIEFueQo+ID4+IGFkZGl0aW9uYWwgYnl0ZXMgYXJlIG9u
bHkgYWNjZXNzaWJsZSB0aHJvdWdoIHJhdyByZWFkcyBhbmQgc29mdHdhcmUKPiA+PiBkZXNjcmFt
YmxpbmcuIEZvciBlZmZpY2llbmN5LCBhbmQgdG8gbWF0Y2ggdGhlIHZlbmRvciBkcml2ZXIsIGln
bm9yZQo+ID4+IHRoZXNlIGV4dHJhIGJ5dGVzLgo+ID4+Cj4gPj4gU2lnbmVkLW9mZi1ieTogU2Ft
dWVsIEhvbGxhbmQgPHNhbXVlbEBzaG9sbGFuZC5vcmc+Cj4gPj4gLS0tCj4gPj4KPiA+PiAgZHJp
dmVycy9tdGQvbmFuZC9yYXcvc3VueGlfbmFuZC5jIHwgNyArKysrKysrCj4gPj4gIDEgZmlsZSBj
aGFuZ2VkLCA3IGluc2VydGlvbnMoKykKPiA+Pgo+ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210
ZC9uYW5kL3Jhdy9zdW54aV9uYW5kLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zdW54aV9uYW5k
LmMKPiA+PiBpbmRleCA4ZTg3M2Y0ZmVjOWEuLmEzYmM5ZjdmOWU1YSAxMDA2NDQKPiA+PiAtLS0g
YS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zdW54aV9uYW5kLmMKPiA+PiArKysgYi9kcml2ZXJzL210
ZC9uYW5kL3Jhdy9zdW54aV9uYW5kLmMKPiA+PiBAQCAtMTYwNCw2ICsxNjA0LDEzIEBAIHN0YXRp
YyBpbnQgc3VueGlfbmFuZF9vb2JsYXlvdXRfZnJlZShzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgaW50
IHNlY3Rpb24sCj4gPj4gIAkJcmV0dXJuIDA7Cj4gPj4gIAl9Cj4gPj4gIAo+ID4+ICsJLyoKPiA+
PiArCSAqIFRoZSBjb250cm9sbGVyIGRvZXMgbm90IHByb3ZpZGUgYWNjZXNzIHRvIE9PQiBieXRl
cwo+ID4+ICsJICogcGFzdCB0aGUgZW5kIG9mIHRoZSBFQ0MgZGF0YS4KPiA+PiArCSAqLwo+ID4+
ICsJaWYgKHNlY3Rpb24gPT0gZWNjLT5zdGVwcyAmJiBlY2MtPmVuZ2luZV90eXBlID09IE5BTkRf
RUNDX0VOR0lORV9UWVBFX09OX0hPU1QpCj4gPj4gKwkJcmV0dXJuIC1FUkFOR0U7ICAKPiA+IAo+
ID4gQWdhaW4sIEkgYW0gc29ycnkgYnV0IEkgY2Fubm90IHRha2UgdGhpcyBjaGFuZ2UsIGl0IHdv
dWxkIHR5cGljYWxseQo+ID4gYnJlYWsgamZmczIgdXNlcnMgKGlmIGFueT8pIDooICAKPiAKPiBD
b25zaWRlcmluZyB0aGUgYnVnIEkgZml4ZWQgaW4gdGhlIHByZXZpb3VzIHBhdGNoLCBhbmQgdGhl
IGZhY3QgdGhhdAo+IG10ZF9vb2JsYXlvdXRfZnJlZSgpIHplcm9lcyBvdXQgdGhlIHN0cnVjdHVy
ZSBiZWZvcmUgY2FsbGluZyB0aGUgLmZyZWUKPiBjYWxsYmFjaywgdGhhdCByZWdpb24gd2FzIGJl
aW5nIHJlcG9ydGVkIHdpdGggYSBsZW5ndGggb2YgemVybyBhbHJlYWR5Lgo+IFNvIEkgZG9uJ3Qg
dGhpbmsgYW55b25lIGNvdWxkIGhhdmUgYmVlbiB1c2luZyB0aG9zZSBieXRlcyBhbnl3YXkuCj4g
Cj4gSSBhbSBsb29raW5nIGZvciBhIHNvbHV0aW9uIGhlcmUgYmVjYXVzZSB0aGUgRUNDL3NjcmFt
YmxpbmcgZW5naW5lCj4gcmVhbGx5IHByb3ZpZGVzIG5vIHdheSB0byBhY2Nlc3MgdGhlc2UgYnl0
ZXMuIFJlYWRpbmcgdGhlbSByZXF1aXJlcwo+IHR1cm5pbmcgb2ZmIHRoZSBFQ0MgZW5naW5lLCBw
ZXJmb3JtaW5nIGFub3RoZXIgcmVhZCBjb21tYW5kLCBhbmQgdGhlbgo+IGRlc2NyYW1ibGluZyBp
biBzb2Z0d2FyZS4gU28gd2UgYXJlIHNvcnQgb2YgbHlpbmcgd2hlbiB3ZSBjbGFpbSB0aG9zZQo+
IGJ5dGVzIGFyZSBhdmFpbGFibGUgd2l0aCBoYXJkd2FyZSBFQ0MgZW5hYmxlZC4KPiAKPiBJZiB0
aGlzIGNoYW5nZSBjYW5ub3QgYmUgbWFkZSBhcy1pcywgaXMgdGhlcmUgYW55IHdheSB0aGUgdXNl
ciBjb3VsZCBvcHQKPiBpbiB0byB0aGUgbmV3IGxheW91dCwgdG8gZ2V0IHRoZSBpbXByb3ZlZCBw
ZXJmb3JtYW5jZT8KCkFjdHVhbGx5IHRoYXQncyB0cnVlLCB5b3UgZml4ZWQgdGhlIHJlcG9ydGlu
ZyBvZiB0aGUgZnJlZSBhcmVhIHdoaWNoCndhcyBzZXQgdG8gMCB1bnRpbCB0aGVuLCB3aGljaCBt
ZWFucyB0aGVyZSBjYW5ub3QgYmUgYW55IHVwc3RyZWFtIHVzZXIuClNvIGtub3dpbmcgdGhhdCwg
cHJldmVudGluZyB0aGUgYWNjZXNzZXMgdG8gdGhlIGVuZCBvZiB0aGUgYXJlYSBzZWVtcwphY2Nl
cHRhYmxlIHdoZW4gdXNpbmcgSFcgRUNDLiBQbGVhc2UgbWVudGlvbiBpdCBpbiB0aGUgY29tbWl0
IGxvZy4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
